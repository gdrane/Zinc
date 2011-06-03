/**
 * $Id: Positionable.java 71 2008-07-07 15:49:14Z sriramsrao $ 
 *
 * Created 2007/09/13
 *
 * @author: Sriram Rao 
 *
 * Copyright 2008 Quantcast Corp.
 * Copyright 2007-2008 Kosmix Corp.
 *
 * This file is part of Kosmos File System (KFS).
 *
 * Licensed under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 * 
 * \brief Interface for positioning a file pointer.
 */

package org.kosmix.kosmosfs.access;

import java.io.IOException;

public interface Positionable
{
    /* 
     * Position a file pointer at the specified offset from the
     * beginning of a file.
     */
    int seek(long offset) throws IOException;

    /*
     * Return the current position of the file pointer---the position
     * is from the beginning of the file.
     */
    long tell() throws IOException;
}
