import Foundation

struct Matrix
{
    let rows : Int, cols : Int
    
    var grid : [Int]
    
    init (row : Int, col : Int)
    {
        cols = col
        rows = row
        
        grid = Array(repeating: 0, count: row*col)
    }
    func isInsideBound(row : Int,col : Int) -> Bool
    {
        if (row < rows && row >= 0 && col < cols && col >= 0)
        {
            return true
        }
            return false
    }
    subscript (row : Int, col : Int) -> Int
    {
        get
        {
            assert(isInsideBound(row: row, col: col), "Index out of range")
                return grid[row*col + col]
            
            
        }
        set
        {
            assert(isInsideBound(row: row, col: col), "Index out of range")
            grid[row*col + col] = newValue
        }
        
    }
}

var Grid = Matrix(row : 2, col : 2)

Grid[0, 0] = 1
Grid[0, 1] = 2
Grid[1, 0] = 3
Grid[1, 1] = 4

print(Grid[0, 1])
print(Grid[1, 1])


