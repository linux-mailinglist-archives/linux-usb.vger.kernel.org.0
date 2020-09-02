Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B352C25AA66
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 13:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgIBLfF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 2 Sep 2020 07:35:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbgIBLfA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 07:35:00 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Wed, 02 Sep 2020 11:34:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ikjn@chromium.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-lLAGWeHsv1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

--- Comment #43 from Ikjoon Jang (ikjn@chromium.org) ---
(In reply to Stefan from comment #42)
> (In reply to Ikjoon Jang from comment #41)
> > (In reply to Olivier R-D from comment #40)
> > > logitech group microphone and sounds does not work on ubuntu 20.04 with
> > > generic kernel 5.8.4. traces as in comment #21 attached.
> > > 
> > > I am available to test any build kernel. I have the device here
> > 
> > comment #33:
> > Can you try this patch?
> > https://lkml.org/lkml/2020/7/21/89
> > 
> > note that "8f97250c21f0 xhci: Don't clear hub TT buffer..." should be
> > included in your kernel before.
> 
>                                                                             
> 
> Hi Ikjoon Jang, the patch is working on our side butt there is a litte
> problem
> the device id is 0x0857 from our Logitech Group

I don't have a device right now, from searching from saved logs, my device
seems to be this (mine was 0x882) :
0x046d:0x085a - HS Hub
|- 0x046d:0x086e - Camera/HID
|- 0x046d:0x0882 - Audio/HID

We might need to add one more quirk like this?

USB_DEVICE_ID_LOGITECH_GROUP_AUDIOX 0x857
USB_DEVICE_ID_LOGITECH_GROUP_AUDIOY 0x882
...

anyway let's go registering these ids: http://www.linux-usb.org/usb-ids.html

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
