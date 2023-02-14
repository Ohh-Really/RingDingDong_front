abstract class AuthUseCases<Type> {
  Future<Type> login();
  Future<Type> policyAgree();
}
