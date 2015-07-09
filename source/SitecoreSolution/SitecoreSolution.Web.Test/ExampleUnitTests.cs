using NUnit.Framework;
using FluentAssertions;
using System;
using System.Linq;

namespace SitecoreSolution.Web.Test
{
    [TestFixture]
    public class ExampleUnitTests
    {
        /// <summary>
        /// This is just an example unit test for illustrational purposes.
        /// 
        /// Please write unit tests following the Arrange, Act and Assert format and 
        /// this naming convention: UnitOfWork_StateUnderTest_ExpectedBehaviour.
        /// 
        /// Note that Fluent Assertions is used: http://www.fluentassertions.com/.
        /// </summary>
        [TestAttribute]
        public void ReverseString_WithThreeCharacterString_ReturnsReversedString()
        {
            // Arrange
            string input = "abc";
            
            // Act
            string result = new String(input.Reverse().ToArray());

            // Assert
            result.Should().Be("cba");
        }
    }
}
