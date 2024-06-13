import java.util.Stack;

public class isValidParentheses {
    /**
     * Checks if a string of parentheses is valid.
     * A valid string of parentheses is one where every opening parenthesis
     * has a corresponding closing parenthesis in the correct order.
     *
     * @param s the string to check for valid parentheses
     * @return true if the string has valid parentheses, false otherwise
     */
    public static boolean isValid(String s) {
        Stack<Character> parenthesesStack = new Stack<>();

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            // If the character is an opening parenthesis, push it onto the stack
            if (c == '(' || c == '{' || c == '[') {
                parenthesesStack.push(c);
            }
            // If the character is a closing parenthesis and the stack is empty,
            // the string is invalid because there is no corresponding opening parenthesis
            else if (parenthesesStack.isEmpty()) {
                return false;
            }
            // If the character is a closing parenthesis, peak the top of the stack
            // and check if it matches the corresponding opening parenthesis
            else if (c == ')' && parenthesesStack.peek() == '(') {
                parenthesesStack.pop();
            } else if (c == '}' && parenthesesStack.peek() == '{') {
                parenthesesStack.pop();
            } else if (c == ']' && parenthesesStack.peek() == '[') {
                parenthesesStack.pop();
            } else {
                return false;
            }
        }
        return parenthesesStack.isEmpty();
    }

    // test cases
    public static void main(String[] args) {
        System.out.println(isValid("()")); // true
        System.out.println(isValid("({[(){}]})")); // true
        System.out.println(isValid("({[}])")); // False (invalid closing bracket order)
        System.out.println(isValid("({[])")); // false (missing closing bracket)
    }
}