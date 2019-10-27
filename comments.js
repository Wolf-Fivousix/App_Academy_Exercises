// Container 
// 
// We have react components
// React componets are like candy bars
//
// Containers are like the candy wrappers 
​
import { connect } from "react-redux"; // the glue between react and redux 
​
import TodoIdx from "./todo_list"; // candy bar (presentational component/ react component)
​
import { allTodos } from "../../reducers/selectors"; // selector (a function that reformats or restructures your state)
​
import { receiveTodo } from "../../actions/todo_actions"; // action creator 
// action creators are functions that return actions
// actions are POJOs with type property, and optionally some data
​
/* 
Action: (these are like instructions for how to update your redux store)
{ 
  type: RECEIVE_TODOS, // type is required for actions 
  todos: {1: { title: 'lksjdf' }}
}
*/
​
// CONNECT will be called with mapStateToProps and mapDispatchToProps as arguments
// YOU NEVER NEED TO MANUALLY INVOKE THESE TWO FUNCTIONS
// Connect does this for you 
// In addition, connect will:
//    state will be passed into to mapStateToProps by connect
//    dispatch will be passed into mapDispatchToProps by connect
​
// reader
// you define how your component can read information from the redux store (state) 
// this funciton gives your component props for reading from your store
// implicit return of a POJO
const mapStateToProps = (state) => {
  // nameOfProp: valueOfProp
  // todos is a prop that TodoIdx will receive, and it holds all of the todos informations
  debugger
  return {
  todos: allTodos(state)
  }
};
​
// writer (updater)
// you define how your component can update your redux store (state)
// to update the redux store, we use the dispatch function
// dispatch's job is kinda like the turn on switch for the redux cycle
// you alwasy dispatch an action
// this function gives your component props for updating your store
// aka mapDispatchToProps gives your components the ability to update the store
// explicit return of a POJO
const mapDispatchToProps = (dispatch) => {
  return {
    // nameOfProp: always a function
    // here we have prop called receiveTodo
    ///    and its value is a function that takes in a todo object
    ///    and will dispatch an action (defined by our action creator, "receiveTodo")
    /// Note: it is often the case that the propName is the same as the action creator name
    receiveTodo: (todo) => dispatch(receiveTodo(todo))
  };
};
// in TodoIdx 
//   if class component, we can access this prop with this.props.receiveTodo
//   if functional component, we can access this prop with props.receiveTodo
// For any props defined in mapDispatchToProps, because they are always a function
// your component should invoke them 
​
​
// When the component invokes one of the "writer" props, it is dispatching an action
// which will start the redux cycle 
// onClick -> this.props.receiveTodo({ title: "banana" }) 
//         -> dispatch(receiveTodo({ title: "banana" }))
//         -> dispatch({ type: RECEIVE_TODO, todo: { title: "banana" }})
​
​
// your reader and writer (mapStateToProps and mapDispatchToProps) must be functions that 
// return POJOS
​
​
// Actual container 
// This glues your react presentational component to the redux store 
// In other words, 
// You are giving TodoIdx the ability to read from your store, and update your store
export default connect(mapStateToProps, mapDispatchToProps)(TodoIdx);
// we are wrapping TodoIdx with this container that has defined two props: todos, and receiveTodo