Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC4827B397
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 19:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgI1Rtn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Sep 2020 13:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgI1Rtn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 13:49:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Mon, 28 Sep 2020 17:49:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-f6NfPKg92P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209411

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sun, Sep 27, 2020 at 05:51:20PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=209411
> 
>             Bug ID: 209411
>            Summary: When retrieving string descriptor from mobile device
>                     returns eproto error
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 4.19
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: rachithas104@gmail.com
>         Regression: No
> 
> I am trying to get get string descriptor from mobile phone,however when
> trying
> to retrieve one particular index it returns EPROTO,
> 
> dev->fd, USB_DIR_IN,USB_REQ_GET_DESCRIPTOR,DESCRIPT_STRING * 256 + index,     
>                                               languageid, sizeof buf, buf);
> 
> Return value is -1 for  ioctl(fd, USBDEVFS_CONTROL, &ioctl_ctrl);
> 
> kernel: [ 7084.327097] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
> kernel: [ 7084.831056] usb 1-1.2: device not accepting address 12, error -71
> kernel: [ 7085.119075] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
>  kernel: [ 7085.431054] usb 1-1.2: reset high-speed USB device number 12
>  using
> ehci-pci
> [ 7085.935069] usb 1-1.2: device not accepting address 12, error -71
> [ 7086.227132] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
> S[ 7087.321929] usb 1-1.2: usbfs: USBDEVFS_CONTROL failed cmd ctxusb rqt 128
> rq
> 6 len 255 ret -71
>   kernel: [ 7087.607093] usb 1-1.2: reset high-speed USB device number 12
>   using
> ehci-pci
> 
> My URB request and without my program in picture request is same

Not all strings are readable from the device, are you sure that is a
valid string descriptor index to be requesting?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
