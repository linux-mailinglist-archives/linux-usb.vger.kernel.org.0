Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819B61E0380
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 23:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbgEXVxy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 24 May 2020 17:53:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388333AbgEXVxy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 17:53:54 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207871] nullpointer dereference in uvc_video_stop_streaming
Date:   Sun, 24 May 2020 21:53:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ranma+kernel@tdiedrich.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207871-208809-otbEKczCoF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207871-208809@https.bugzilla.kernel.org/>
References: <bug-207871-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207871

--- Comment #4 from Tobias Diedrich (ranma+kernel@tdiedrich.de) ---
I'm guessing that's the device disconnect callback?

static void uvc_disconnect(struct usb_interface *intf)
{
        struct uvc_device *dev = usb_get_intfdata(intf);

        /* Set the USB interface data to NULL. This can be done outside the
         * lock, as there's no other reader.
         */
        usb_set_intfdata(intf, NULL);

        if (intf->cur_altsetting->desc.bInterfaceSubClass ==
            UVC_SC_VIDEOSTREAMING)
                return;

        uvc_unregister_video(dev);
        kref_put(&dev->ref, uvc_delete);
}

Meanwhile uvc_stop_streaming is a vb2_ops (videobuf2) callback from the
V4L2CaptureThread.

I'm guessing then that uvc_disconnect() should wait for videobufs to be stopped
before returning?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
