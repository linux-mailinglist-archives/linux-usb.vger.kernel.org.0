Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEC9227F0E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 13:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgGULiD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 21 Jul 2020 07:38:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgGULiC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 07:38:02 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208267] usbip broken with latest kernels?
Date:   Tue, 21 Jul 2020 11:38:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdieter@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208267-208809-MJDc5Y1ht9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208267-208809@https.bugzilla.kernel.org/>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208267

--- Comment #9 from Jonathan Dieter (jdieter@gmail.com) ---
git bisect gives me the following:
88b7381a939de0fa1f1b1629c56b03dca7077309 is the first bad commit
commit 88b7381a939de0fa1f1b1629c56b03dca7077309
Author: Bastien Nocera <hadess@hadess.net>
Date:   Wed Oct 16 11:39:31 2019 +0200

    USB: Select better matching USB drivers when available

    Now that USB device drivers can reuse code from the generic USB device
    driver, we need to make sure that they get selected rather than the
    generic driver. Add an id_table and match vfunc to the usb_device_driver
    struct, which will get used to select a better matching driver at
    ->probe time.

    This is a similar mechanism to that used in the HID drivers, with the
    generic driver being selected unless there's a better matching one found
    in the registered drivers (see hid_generic_match() in
    drivers/hid/hid-generic.c).

    Signed-off-by: Bastien Nocera <hadess@hadess.net>
    Acked-by: Alan Stern <stern@rowland.harvard.edu>
    Link: https://lore.kernel.org/r/20191016093933.693-5-hadess@hadess.net
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/usb/core/driver.c  | 15 +++++++++++++--
 drivers/usb/core/generic.c | 29 +++++++++++++++++++++++++++++
 include/linux/usb.h        |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
