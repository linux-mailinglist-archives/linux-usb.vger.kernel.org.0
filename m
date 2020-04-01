Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF8019B876
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 00:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732537AbgDAWe6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 1 Apr 2020 18:34:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732385AbgDAWe6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 18:34:58 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] uvcvideo: Realtek USB Camera (0bda:579f) sends UVC
 payloads in middle of URB
Date:   Wed, 01 Apr 2020 22:34:57 +0000
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
Message-ID: <bug-207045-208809-vR6RyG3h1v@https.bugzilla.kernel.org/>
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

--- Comment #2 from Julian Meyer (jucmeyer@ucsc.edu) ---
I did more research and I found that the problem is that the camera is sending
the next UVC payload immediately after finishing the previous one instead of
waiting for the next URB.

I ran my camera at 640x480@30fps and found the following information:

First, the camera reports the max payload size and max frame size as follows:

Max Payload Size: 119296
Max Frame Size: 614400

Actual Received Payload Size (sum of all payloads): 614472

This number makes sense because it includes (frame size/payload size =) 6
payload headers of 12 bytes each, so 614472 bytes total.

The last URB is truncated because it fits in 37 full 16K URBs + one 8264 byte
URB.

uvc_video_decode_bulk calls the following functions:
1. uvc_video_decode_start - find header length and decode it
2. uvc_video_decode_meta - decode the rest of the header metadata
3. uvc_video_decode_data - decodes data up to the max payload size and if it
overflows, assume the frame is ended
4. uvc_video_decode_end - if this payload was end-of-frame, start the next
frame

uvc_video_decode_bulk is called from uvc_video_complete which is the completion
handler for each URB. This makes it so that each URB must contain one or less
payloads because we only process at most one payload per call to the completion
handler.

In the case of my camera, the driver hits the max payload size and assumes it's
finished (the next payload is in the next URB). Then, it tries to parse the
header for the next URB assuming it's a new payload even though it's actually
in the middle of a payload.

This causes FID mismatches and all sorts of other issues.

Proposed Fix: When we see a URB that's larger than the maximum payload size,
assume it's another payload and start processing the new payload.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
