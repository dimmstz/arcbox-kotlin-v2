package com.dimm.arcbox.data

import android.content.Context
import android.os.Environment
import com.dimm.arcbox.model.FileItem
import java.io.File

class FileRepository(private val context: Context) {

    fun getFiles(directory: File): List<FileItem> {
        return directory.listFiles()?.map { file ->
            FileItem(
                name = file.name,
                path = file.absolutePath,
                size = file.length(),
                isDirectory = file.isDirectory,
                lastModified = file.lastModified(),
                extension = if (file.isFile) file.extension else null
            )
        }?.sortedWith(compareByDescending<FileItem> { it.isDirectory }.thenBy { it.name.lowercase() })
            ?: emptyList()
    }

    fun getRootDirectory(): File {
        return Environment.getExternalStorageDirectory()
    }
}
