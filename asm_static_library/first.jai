#import "Basic";
#import "Compiler";

PROGRAM_TEXT :: #string DONE
   // Foreign function declarations
   asm_print_hello :: () #foreign asmlib;
   asm_euler001_sum_of_multiples :: (loop_count: u64) -> u64 #foreign asmlib;

   // no need to provide a path since this is a lib and that is done during linking.
   asmlib :: #foreign_library,no_dll "";

   #program_export foo :: () -> s32 #c_call {
      return xx asm_euler001_sum_of_multiples(xx 1000);
   }
DONE

build :: () {
   w := compiler_create_workspace();

   set_build_options_dc(.{do_output=false});

   options := get_build_options();
   options.output_executable_name = "libjai.a";
   options.output_path            = "./build_output/";
   options.output_type            = .STATIC_LIBRARY;
   options.optimization_level     = .DEBUG;
   // options.text_output_flags      = .OUTPUT_LINK_LINE;

   set_build_options(options, w);

   add_build_string(PROGRAM_TEXT, w);
}

#run build();
