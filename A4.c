/*********************************************
 *  Homework Assignment 4
 *  Author: Wu Jiahao
 *  Username: wu231
 *  Data Create: 2021/10/8
 *  This is the for homework assignment 4
 *  Two parts, 1).Cricket display and 2).linkedlist
 */

// Headers going to use
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

// Struct data types for player
struct Player{
    char playerName[50];
    char teamName[50];
    double avg;
};

// Stuct data types for linkedlist Node
struct Node {
    int data;
    struct Node *next; // points to next node
};

// Struct data types for new node in linkedlist
struct Node *getNewNode(int newdata) {
    struct Node *node = (struct Node *)malloc(sizeof(struct Node));
    node->data = newdata;
    node->next = NULL;
    return node;
}

// Funcitons prototype
void firstPart();
void secondPart();
void insertLinkedListEnd(struct Node **head , int data);
void insertLinkedListBegin(struct Node **head , int data);
void insertLinkedListNthPosition(struct Node **head , int data , int old_value);
void deleteLinkedListEnd(struct Node **head);
void deleteLinkedListBegining(struct Node **head);
void deleteLinkedListNthPosition(struct Node **head , int existingValue);
void modifyLinkedList(struct Node **head , int old_value , int newdata);
void printLinkedList(struct Node *head);
void menu();

int main(void){
    // Create a menu for user's to choose different programs
    // By using do-while loop, 1 goes to first program
    // 2 goes to second program
    // 3 makes program quit
    int num;
        do{
            menu();
            scanf("%d", &num);
        
            switch(num){ // different userchoice has different options
            case 1:
                firstPart(); // goes to first program
                break;
            case 2:
                secondPart(); // goes to second program
                break;
            case 3:
                printf("Quit the program...\n");
                break;
            default:
                printf("Not valid options\n");
                break;
            }// type 3 to quit
        }while(num!=3);
    return (0);
}

// This is the function for menu
void menu(){
     printf("\n");
        printf("Please Choose One of the following to start program\n");
        printf("1). Cricket Program\n");
        printf("2). LinkedList Program\n");
        printf("3). Quit\n");
        printf("Enter your choice: \n");
        
}

// This is the function for first program
// Cricket Program
void firstPart(){
    int numTeams, numPlayers;
    // Read User's input to create number of Teams
    printf("Enter the number of teams you wish to record: ");
    scanf("%d",&numTeams);
    char team_names[numTeams][100]; // Create teams
    // User's input for team names
    for(int i=0;i<numTeams;i++){
        printf("Enter the name(s) of the teams: ");
        scanf("%s",team_names[i]);
    }
    // User's input for total number of players
    printf("Enter the TOTAL number of players for all teams: ");
    scanf("%d",&numPlayers);
    // create structure of players with details
    struct Player player[numPlayers];
    // User's input for player name, team name and batting average
    for(int i=0;i<numPlayers;i++){
        printf("Enter the %d Player name, Team name, and batting average: ",(i+1));
        scanf("%s %s %lf",player[i].playerName, player[i].teamName, &player[i].avg);
    }
    // print all the information we got from user
    printf("Listing of players and batting average according to team names: \n");
    for(int i=0;i<numTeams;i++){
        printf("\n");
        printf("%s-\n",team_names[i]);
        for(int j=0;j<numPlayers;j++){
            if(strcmp(player[j].teamName, team_names[i])==0){
                // Team name matched and matched the batting average
                printf("      %s %lf\n",player[j].playerName, player[j].avg);
            }
        }
    }
}
// This is the program for Create LinkedList
// This is the menu part that read the user's options to create
void secondPart(){
    // Define the data going to use
    struct Node *head = NULL; // Create a linkedlist without any values
    int choice ;
    int existingValue;
    int node_data;
    do {
        // Menu
        printf("1. Insert a Node at the end \n");
        printf("2. Insert a Node at the beginning \n");
        printf("3. Delete a Node from the end \n");
        printf("4. Delete a Node from the beginning \n");
        printf("5. Insert a Node in the middle (nth position) \n");
        printf("6. Delete a Node from the middle (nth position) \n");
        printf("7. Modify the int value of any Node currently in the list. \n");
        printf("8. Exit\n");
        scanf("%d" , &choice);
        // Read different choice to make options
        switch(choice) {
            case 1:
                // Insert nodes
                printf("Enter your node in the list \n");
                scanf("%d" , &node_data);
                insertLinkedListEnd(&head , node_data); //call the functions
                break;
            case 2:
                // Insert the nodes to Beginning
                printf("Enter your value for the node you want to insert at the begining \n");
                scanf("%d" , &node_data);
                insertLinkedListBegin(&head , node_data); // call the functions
                break;
            case 3:
                // Delete the end nodes
                deleteLinkedListEnd(&head);
                break;
            case 4:
                // Delete the biginning nodes
                deleteLinkedListBegining(&head);
                break;
            case 5:
                // Enter the node that user can choose the locaiton
                printf("Enter the value of your node after which you want to insert the new node \n");
                scanf("%d" , &existingValue);
                printf("Enter the value of new node\n");
                scanf("%d" , &node_data);
                // Call the funcitons
                insertLinkedListNthPosition(&head , node_data , existingValue); 
                break;
            case 6:
                // Delete the node that user can choose the location
                printf("Enter the value of the node that preceeds the node you want to delete \n");
                scanf("%d" , &existingValue);
                deleteLinkedListNthPosition(&head , existingValue);
                break;
            case 7:
                // Let user modify the node that they want to
                printf("Enter the value of the node you want to modify \n");
                scanf("%d" , &existingValue);
                printf("Enter the new value of this ndoe \n");
                scanf("%d" , &node_data);
                modifyLinkedList(&head , existingValue , node_data);
                break;
            case 8:
                // Quit the second program
                break;
        }
        if(choice != 8) {
            // Print the linkedlist
            printLinkedList(head);
            printf("\n");
        }
    } while (choice != 8); // Stop the program when user type 8
}

// This is the function that insert node to the end of linkedlist
void insertLinkedListEnd(struct Node **head , int data) {
    // Create a temp head store head's value
    struct Node *head_temp = *head;
    if(head_temp == NULL) {
        *head = getNewNode(data); // If the linkedlist is empty, create new node
        return;
    }
    while(head_temp->next != NULL) { // If it is not empty, node goes to next
        head_temp = head_temp->next;
    }
    head_temp->next = getNewNode(data);
}

// This is the function that insert node to the beginning of linkedlist
void insertLinkedListBegin(struct Node **head , int data) {
    // Create node
    struct Node *node = getNewNode(data);
    node->next = *head;
    *head = node; // Make the new head with node that inserted
}

// This is the funciton that insert node to the position read by user's input
void insertLinkedListNthPosition(struct Node **head , int data , int old_value) {
    // Create a temp node to store head node information
    struct Node *head_temp = *head;
    // Traverse the linkedlist to find the position
    while(head_temp != NULL && head_temp->data != old_value) {
        head_temp = head_temp->next;
    }
    if(head_temp == NULL) {
        return;
    }
    struct Node *node = getNewNode(data);
    node->next = head_temp->next; // insert the node
    head_temp->next = node;
}

// This is the function that delete end node
void deleteLinkedListEnd(struct Node **head) {
    // Have a temp node points to head
    struct Node *head_temp = *head;
    // Nothing in the linkedlist
    if(head_temp == NULL) {
        return;
    }
    // Only one node, delete itself
    if(head_temp->next == NULL) {
        free(head_temp);
        *head = NULL;
        return;
    }
    while(head_temp->next->next != NULL) {
        head_temp = head_temp->next; // delete the node
    }
    free(head_temp->next); // free memory
    head_temp->next = NULL;
}

// This functino delete the begin node of linkedlist
void deleteLinkedListBegining(struct Node **head) {
    // create temp node points to head
    struct Node *head_temp = *head;
    // linkedlist is null
    if(head_temp == NULL) {
        return;
    }
    // Only one node in linkedlist
    if(head_temp->next == NULL) {
        free(head_temp);
        *head = NULL;
        return;
    }
    // delete the head node
    *head = (*head)->next;
    free(head_temp);
}

// This is the function let user delete node from Nth position
void deleteLinkedListNthPosition(struct Node **head , int existingValue) {
    // Create temp node points to head
    struct Node *head_temp = *head;
    // Traverse the linkedlist to find position
    while(head_temp != NULL && head_temp->data != existingValue) {
        head_temp = head_temp->next;
    }
    if(head_temp == NULL) {
        return;
    }
    struct Node *next = head_temp->next;
    head_temp->next = head_temp->next->next; // delete the node
    free(next); // free memory
}

// This is the function let user change the value of node
void modifyLinkedList(struct Node **head , int old_value , int newdata) {
    // Create temp node store head node information
    struct Node *head_temp = *head;
    while(head_temp != NULL) {
        if(head_temp->data == old_value) { // find the value of old value
            head_temp->data = newdata; // change to new value
            return;
        }
        head_temp = head_temp->next; // traverse the linkedlist
    }
}

// This is the function that show the linedlist
void printLinkedList(struct Node *head) {
    printf("The link list currently has these nodes:\n");
    while(head != NULL) {
        printf("%d->",head->data); // Traverse the node and print
        head = head->next; // Traverse
    }
    printf("\n");
}














