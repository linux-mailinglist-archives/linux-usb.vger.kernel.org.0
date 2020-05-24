Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D86B1DFE6D
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 13:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgEXLFY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 24 May 2020 07:05:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgEXLFY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 07:05:24 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207871] nullpointer dereference in uvc_video_stop_streaming
Date:   Sun, 24 May 2020 11:05:23 +0000
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
Message-ID: <bug-207871-208809-DIaQkmTNN5@https.bugzilla.kernel.org/>
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

--- Comment #2 from Tobias Diedrich (ranma+kernel@tdiedrich.de) ---
Interestingly, usb_set_interface() already calls usb_ifnum_to_if() once, which
did not fail. Then after calling usb_disable_interface() it calls
usb_hcd_alloc_bandwidth(), which does another call to usb_ifnum_to_if(), which
faulted with the null deref.

The fault is at:
    mov   rax, [rdx + 0x398]
    test  rax, rax
    jz early_exit_since_config_is_null
    [...]
    mov   rcx, [rax + rdx*8 + 0x98]
    inc   rdx
->  mov   r8, [rcx]
    movzx r8d, byte ptr [r8 + 2]
    [...]

So I think the fault is at
[...]
  for (i = 0; i < config->desc.bNumInterfaces; i++)
->  if (config->interface[i]->altsetting[0].desc.bInterfaceNumber == ifnum)
                ^^^^^^^^^^^^nullptr
      return config->interface[i];
[...]

usb_set_interface() only checks for dev->state == USB_STATE_SUSPENDED, maybe it
also needs to check for dev->state == USB_STATE_NOTATTACHED?

The disconnect message indicates this would have been the state the device was
in, from usb_disconnect():
  [...]
  usb_set_device_state(udev, USB_STATE_NOTATTACHED);
  dev_info(&udev->dev, "USB disconnect, device number %d\n", udev->devnum);
  [...]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
