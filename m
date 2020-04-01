Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499FB19AEBB
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 17:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732798AbgDAPbI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 1 Apr 2020 11:31:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732623AbgDAPbI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 11:31:08 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] uvcvideo: Realtek USB Camera (0bda:579f) reports wrong
 dwMaxVideoFrameSize
Date:   Wed, 01 Apr 2020 15:31:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jucmeyer@ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207045-208809-UVQ2hOcQWr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207045-208809@https.bugzilla.kernel.org/>
References: <bug-207045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207045

--- Comment #1 from Julian Meyer (jucmeyer@ucsc.edu) ---
Narrowing this issue further, it seems that if the max video frame size is less
than the max video transfer size, it works, but if it's over the max video
transfer size, it does not work:

WORKING (low res)
-------

bmHint                         0x01
bFormatIndex                      1
bFrameIndex                       3
dwFrameInterval              333333
wKeyFrameRate                     0
wPFrameRate                       0
wCompQuality                      0
wCompWindowSize                   0
wDelay                           32
dwMaxVideoFrameSize           50688
dwMaxPayloadTransferSize     129024


NOT WORKING (high res)
-----------
bmHint                         0x01
bFormatIndex                      1
bFrameIndex                       1
dwFrameInterval              333333
wKeyFrameRate                     0
wPFrameRate                       0
wCompQuality                      0
wCompWindowSize                   0
wDelay                           32
dwMaxVideoFrameSize          614400
dwMaxPayloadTransferSize     119296

In the non-working case, first, I see this in the log when it gets set up:

[41790.164920] uvcvideo: Allocated 5 URB buffers of 32x512 bytes each.

I'm not sure why it's 5, but we know that each URB buffer is 16384 bytes large
and then I see this message in the log a bunch:

[41790.355807] uvcvideo: payload size is: 131072, max is: 119296

My guess here is that it's sending dwMaxVideoFrameSize and assuming that is the
dwMaxPayloadTransferSize. So, it tries to send 614400 in a single payload (not
sure about the terminology here), but the buffer is only 119296 bytes large.

This means that it would not work if the max video frame size is greater than
the max payload transfer size (buffer "overflows" and UVC assumes it's the end
of the frame), but it would work if the maxVideoFrameSize is smaller than
dwMaxPayloadTransferSize.

Also, it makes sense because if I run it at a high resolution, the bottom 1/3
of the picture is cut off/corrupted whereas the top part is just fine. In this
case, dwMaxVideoFrameSize is probably about 30% larger than
dwMaxPayloadTransferSize.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
