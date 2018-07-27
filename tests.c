#include <stdint.h>
#include <stdbool.h>

/* Example 1. Simple conditional.
 *
 * - Not-taken branch needs a small number of nops to match the taken branch.
 * - In terms of cycle count, it needs more nops.
 * - In terms of functionality, it needs a dummy division.
 */

int32_t
f1_simple_conditional(int32_t a, int32_t b, bool selector)
{
  int result;

  if (selector)
    result = a / b;
  else
    result = a + 3;

  return result;
}

/* Example 2. More additions.
 *
 * - How does CSE interact with atomicity?
 */

int32_t
f2_more_additions(int32_t a, int32_t b, int32_t c, int32_t d, bool selector)
{
  int result;

  if (selector)
    result = a + b;
  else
    result = a + b + c + d;

  return result;
}

/* Example 3. No else branch.
 */

int32_t
f3_no_else(int32_t a, int32_t b, bool selector)
{
  int result = a;

  if (selector)
    result =+ b;

  return result;
}

/* Example 4. Load from an array.
 *
 * We make the array a global to prevent it being optimised away.
 */

int work[10];

int32_t
f4_array_load(int32_t a, int32_t b, bool selector)
{
  int32_t result;

  if (selector)
    result = work[a] + b;
  else
    result = a + b;

  return result;
}

/* Example 5. Store to an array.
 *
 * Should be similar to load from an array but the costs of a store may be
 * modelled differently.
 */

int32_t
f5_store_array(int32_t a, int32_t b, bool selector)
{
  int32_t result;

  if (selector) {
    work[b] = a;
    result = b + b;
  } else {
    result = a + b;
  }

  return result;
}

/* Example 6. Load and store from an array.
 *
 */

int32_t
f6_array_load_store(int32_t a, int32_t b, bool selector)
{
  int32_t result;

  if (selector) {
    work[b] = a;
    result = work[a] + b;
  } else {
    result = a + b;
  }

  return result;
}

/* Example 7. Load in one branch and store in another.
 *
 * For balancing with similar instructions, requires a dummy store to be
 * inserted in one side and a dummy load in the other.
 */

int32_t
f7_load_store_branches(int32_t a, int32_t b, bool selector)
{
  int32_t result;

  if (selector) {
    result = work[a] + b;
  } else {
    work[b] = a;
    result = a + b;
  }

  return result;
}

/* Example 8. Nested conditionals.
 *
 */

int32_t
f8_nested_conditionals(int32_t a, int32_t b, bool selector1, bool selector2)
{
  int result = 0;

  if (selector1) {
    if (selector2)
      result = a / b;
  } else {
    result = a + 3;
  }

  return result;
}

/* Example 9. Nested conditionals, code before inner conditional.
 */

int32_t
f9_nested_code(int32_t a, int32_t b, int32_t c, bool selector1, bool selector2)
{
  int result;

  if (selector1) {
    result = a + b;
    if (selector2)
      result += c;
  } else {
    result = a + 3;
  }

  return result;
}

/* Example 10. Nested conditionals with nesting on both the taken- and not-taken
 * branches.
 */

int32_t
f10_nesting_both(int32_t a, int32_t b, int32_t c, bool selector1, bool selector2)
{
  int result;

  if (selector1) {
    result = a + b;
    if (selector2)
      result += c;
  } else {
    result = a + 3;
    if (selector3)
      result *= b;
  }

  return result;
}


/* Example 11. Doubly-nested conditionals. To help demonstrate that recursive
 * balancing works at more than one level.
 */

int32_t
f11_double_nesting(int32_t a, int32_t b, int32_t c, bool selector1, bool selector2, bool selector3)
{
  int result = 0;

  if (selector1) {
    result = a + b;
    if (selector2) {
      result += c;
      if (selector3)
        result += b * 10;
    }
  }

  return result;
}


/* Example 12. Different levels of nesting on different branches.
 */

int32_t
f12_nesting_levels(int32_t a, int32_t b, int32_t c, bool selector1, bool selector2, bool selector3, bool selector4)
{
  int result;

  if (selector1) {
    result = a + b;
    if (selector2) {
      result += c;
      if (selector3)
        result += b * 10;
    }
  } else {
    result = a - b;
    if (selector4) {
      result -= c;
    }
  }

  return result;
}
