# Type-Based Test Generation for Haskell using Constraint Logic Programming

Building *generators* to create test cases that Property-Based Testing use to test software behaviour is a hard, quite costly, and error-prone task. Even though most Property-Based Testing frameworks cover simple scenarios, there is some kind of issues with preconditioned generated test cases.

In the context of Property-Based Testing for strong and statically well-typed languages, such as Haskell or Scala, we propose an approach to relieve the programmer from the task of writing generators.

Our approach provides an efficient and automatic generation of input test values that
follows the Haskell formal syntax, precisely, a syntax-translation mechanism guided by the types declaration. This is a feature that most known tools of property-based testing as QuickCheck, for example, don't have implemented yet. In particular, we consider the case when the input values are algebraic data types.

The generation process is performed by writing specification expressions driven by the language' syntax and via symbolic execution using constraint logic programming. First of all, we will cover the so-called monomorphic scenario. The scenario when algebraic data types aren't defined by a polymorphic representation in their declaration. After that, we will cover the polymorphic version of our syntax-translation function. Also, CLP languages try to provide an infinite generated space of solution, therefore we provide some techniques to limit it for getting a well-enough space of generated values that holds the completeness that we need in our testing cases. We define here a concept of \textit{size} around what completeness means and integrate that concept into the definition of our function.

Finally, we talk about what approaches will be fit for future work. For example, by doing Haskell syntax extensions using Liquid Haskell to provide complex invariants or restrictions in the generation process. With this new feature, we could cover algebraic data types which have implicit invariants that hold complex conditions. For example, red-black trees algebraic data types.