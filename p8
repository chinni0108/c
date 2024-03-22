using System;

class StackImplementation
{
    static void Main()
    {
      
        Stack stack = new Stack();

        while (true)
        {
            Console.WriteLine("Choose an option:");
            Console.WriteLine("1. Push");
            Console.WriteLine("2. Pop");
            Console.WriteLine("3. Display");
            Console.WriteLine("4. Exit");

            int choice = GetChoice();

            switch (choice)
            {
                case 1:
                    Console.WriteLine("Enter the value to push:");
                    int valueToPush = GetValue();
                    stack.Push(valueToPush);
                    break;

                case 2:
                    int poppedValue = stack.Pop();
                    if (poppedValue != -1)
                        Console.WriteLine($"Popped element: {poppedValue}");
                    break;

                case 3:
                    stack.Display();
                    break;

                case 4:
                    Console.WriteLine("Exiting the program.");
                    Environment.Exit(0);
                    break;

                default:
                    Console.WriteLine("Invalid choice. Please choose a valid option.");
                    break;
            }
        }
    }

    static int GetChoice()
    {
        int choice;
        while (!int.TryParse(Console.ReadLine(), out choice))
        {
            Console.WriteLine("Invalid input. Please enter a number.");
        }
        return choice;
    }

    static int GetValue()
    {
        int value;
        while (!int.TryParse(Console.ReadLine(), out value))
        {
            Console.WriteLine("Invalid input. Please enter a number.");
        }
        return value;
    }
}

class Stack
{
    private const int MaxSize = 10;
    private int[] items;
    private int top;

    public Stack()
    {
        items = new int[MaxSize];
        top = -1;
    }

    public void Push(int value)
    {
        if (top == MaxSize - 1)
        {
            Console.WriteLine("Stack overflow! Cannot push more elements.");
            return;
        }

        items[++top] = value;
        Console.WriteLine($"Pushed element: {value}");
    }

    public int Pop()
    {
        if (top == -1)
        {
            Console.WriteLine("Stack underflow! Cannot pop from an empty stack.");
            return -1;
        }

        int poppedValue = items[top--];
        return poppedValue;
    }

    public void Display()
    {
        if (top == -1)
        {
            Console.WriteLine("Stack is empty.");
            return;
        }

        Console.WriteLine("Stack elements:");
        for (int i = top; i >= 0; i--)
        {
            Console.WriteLine(items[i]);
        }
    }
}
