Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CC0154179
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 11:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgBFKAK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 6 Feb 2020 05:00:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:35784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgBFKAJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Feb 2020 05:00:09 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206427] go7007 driver fails to handle interrupt
Date:   Thu, 06 Feb 2020 10:00:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: josef.moellers@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-206427-208809-k8IbFZcbBS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206427-208809@https.bugzilla.kernel.org/>
References: <bug-206427-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206427

--- Comment #9 from Josef Möllers (josef.moellers@suse.com) ---
Created attachment 287159
  --> https://bugzilla.kernel.org/attachment.cgi?id=287159&action=edit
lsusb -v output of device, dmesg and hwinfo

This is slightly different from what I remember:
In Ye Olde Days, the device would present itself as 093b:a002 and (through a
udev rule), a script would be run which downloaded the firmware (through
/sbin/fxload some hex file) to the device which would then disconnect and
reconnect as 093b:a102.

Now I see in the journal that this is now handled by go7007-loader.ko loading
/lib/firmware/go7007/px-m402u.fw!

Anyways ... infos attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
