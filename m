Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A1319A1B1
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 00:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgCaWLK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 31 Mar 2020 18:11:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728428AbgCaWLK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 18:11:10 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] New: uvcvideo: Realtek USB Camera (0bda:579f) reports
 wrong dwMaxVideoFrameSize
Date:   Tue, 31 Mar 2020 22:11:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207045-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 207045
           Summary: uvcvideo: Realtek USB Camera (0bda:579f) reports wrong
                    dwMaxVideoFrameSize
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jucmeyer@ucsc.edu
        Regression: No

The integrated webcam on the Razer Blade (2017) does not work.

I found this thread from 2014 having issues with the same webcam, but it's
unresolved: https://www.spinics.net/lists/linux-media/msg73476.html

At first, I turned on the trace parameter for the uvcvideo module and found the
following logs as mentioned in the above thread first:

[   80.490256] uvcvideo: Frame complete (FID bit toggled).
[   80.490262] uvcvideo: frame 2080 stats: 0/0/1 packets, 0/0/0 pts (!early
!initial), 0/1 scr, last pts/stc/sof 0/2069725020/32605
[   80.490264] uvcvideo: Marking buffer as bad (error bit set).
[   80.490606] uvcvideo: Frame complete (EOF found).
[   80.490942] uvcvideo: Marking buffer as bad (error bit set).
[   80.490947] uvcvideo: Dropping payload (out of sync).
[   80.492920] uvcvideo: Marking buffer as bad (error bit set).

After more investigation, I found this line at the end of uvc_video_decode_bulk
that was causing the problem:

if (buf->bytesused == stream->queue.buf_used ||
  stream->bulk.payload_size == stream->bulk.max_payload_size) {
   // assume end of frame
}

I also ran a USBMon on the webcam and decoded it using the python script in the
thread linked above. This yielded the following setup URB:

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

I also calculated the size of a video frame by adding up the lengths of each
URB sent. So, after this, it sends the UVC header, which looks correct:

0c8d6018 3bbcfa9b    .`.;¼ú›
3cbc3304 727a7082    <¼3.rzp‚
717c717d 6f7e7089    q|q}o~p‰
6e816f89 6e826e88    no‰n‚nˆ

In total sends 37 16384 byte URBs and one 8264 byte URB or 614472 bytes total
(greater than the 614400 specified in the URB by 72 bytes). I tried removing
the second condition from the if statement above and making it consider the end
of frame based on finding a URB with size less than dwMaxVideoFrameSize and
that seemed to change the problem at least.

Now, it was overflowing the V4L plane size which was set to 614400. It seems
this is specified somewhere in uvc_queue_setup:

struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
struct uvc_streaming *stream;
unsigned int size;
switch (vq->type) {
case V4L2_BUF_TYPE_META_CAPTURE:
        size = UVC_METADATA_BUF_SIZE;
        break;

default:
        stream = uvc_queue_to_stream(queue);
        size = stream->ctrl.dwMaxVideoFrameSize; // + 72
        break;
}

I'm not really sure where to go from here. It's not always 72 bytes over
either. I've found that if I switch the resolution/format, it can be a
different number.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
