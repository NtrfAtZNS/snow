package snow.modules.opengl;

#if snow_web

    typedef GL                  = snow.modules.opengl.web.GL;
    typedef GLActiveInfo        = snow.modules.opengl.web.GL.GLActiveInfo;
    typedef GLBuffer            = snow.modules.opengl.web.GL.GLBuffer;
    typedef GLContextAttributes = snow.modules.opengl.web.GL.GLContextAttributes;
    typedef GLFramebuffer       = snow.modules.opengl.web.GL.GLFramebuffer;
    typedef GLProgram           = snow.modules.opengl.web.GL.GLProgram;
    typedef GLRenderbuffer      = snow.modules.opengl.web.GL.GLRenderbuffer;
    typedef GLShader            = snow.modules.opengl.web.GL.GLShader;
    typedef GLTexture           = snow.modules.opengl.web.GL.GLTexture;
    typedef GLUniformLocation   = snow.modules.opengl.web.GL.GLUniformLocation;

#elseif !snow_dedicated_server

    typedef GL                  = opengl.WebGL;
    typedef GLActiveInfo        = opengl.WebGL.GLActiveInfo;
    typedef GLBuffer            = opengl.WebGL.GLBuffer;
    typedef GLContextAttributes = opengl.WebGL.GLContextAttributes;
    typedef GLFramebuffer       = opengl.WebGL.GLFramebuffer;
    typedef GLProgram           = opengl.WebGL.GLProgram;
    typedef GLRenderbuffer      = opengl.WebGL.GLRenderbuffer;
    typedef GLShader            = opengl.WebGL.GLShader;
    typedef GLTexture           = opengl.WebGL.GLTexture;
    typedef GLUniformLocation   = opengl.WebGL.GLUniformLocation;

#else

    typedef GL                  = snow.modules.opengl.server.GL;
    typedef GLActiveInfo        = snow.modules.opengl.server.GL.GLActiveInfo;
    typedef GLBuffer            = snow.modules.opengl.server.GL.GLBuffer;
    typedef GLContextAttributes = snow.modules.opengl.server.GL.GLContextAttributes;
    typedef GLFramebuffer       = snow.modules.opengl.server.GL.GLFramebuffer;
    typedef GLProgram           = snow.modules.opengl.server.GL.GLProgram;
    typedef GLRenderbuffer      = snow.modules.opengl.server.GL.GLRenderbuffer;
    typedef GLShader            = snow.modules.opengl.server.GL.GLShader;
    typedef GLTexture           = snow.modules.opengl.server.GL.GLTexture;
    typedef GLUniformLocation   = snow.modules.opengl.server.GL.GLUniformLocation;

#end //!snow_web
