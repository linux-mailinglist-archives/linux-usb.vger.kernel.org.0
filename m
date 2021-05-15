Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78593818DC
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 14:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhEOMoa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 08:44:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhEOMoa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 08:44:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B30D613D1
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621082597;
        bh=FnJC3fMkijail4VYUpJeCrpgfR40CuumOj+61sABC5Y=;
        h=From:To:Subject:Date:From;
        b=Wml/WFTV6m2fcNPHhHFVI6+5vyrYmll28QQxx1l8PZkjxTAWo773Aljtb8FIhjmGn
         PLqpV+xq94x5DgwFIckGkgjLLEbYt7Qstooy6cQXSFH7wsAtMYCOE/qFgCG2b1L8Ni
         yAM3erhN3hggzIk61tYH55F+5swKTGrtxdndOzBo2dIXD/tgVzJcu5FQCYzIYWnayH
         4VIMnVgNkJSi69n6xjI21jjsNXgWJhcu5FuQiqE/5reJ8CT1FSXIAaz+zCK5RnrA98
         HSynJXWLrxJNOpHpRLLvZMTxBLKhdEvDsu6KCD6z+5T/t3MLU8YtUWwqCBkxtotZWd
         4G+AiVYCukMSA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 32689610A4; Sat, 15 May 2021 12:43:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] New: usb-storage / uas Genesys Logic Card Reader no
 longer working on 5.12
Date:   Sat, 15 May 2021 12:43:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

            Bug ID: 213081
           Summary: usb-storage / uas Genesys Logic Card Reader no longer
                    working on 5.12
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: peter.ganzhorn@googlemail.com
        Regression: No

Created attachment 296763
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296763&action=3Dedit
dmesg log after plugging in card reader and inserting card

Hello,

my USB SD card reader is no longer working with Linux 5.12.
Up to Linux 5.11.21 the device is working flawlessly.

T:  Bus=3D06 Lev=3D03 Prnt=3D03 Port=3D00 Cnt=3D01 Dev#=3D  4 Spd=3D5000 Mx=
Ch=3D 0
D:  Ver=3D 3.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D05e3 ProdID=3D0749 Rev=3D15.31
S:  Manufacturer=3DGeneric
S:  Product=3DUSB3.0 Card Reader
S:  SerialNumber=3D000000001531
C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D896mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driver=
=3Dusb-storage

It is integrated in my display and probably made by Genesys Logic (display =
type
is Benq PD3200U).

My system is a x86_64 (Intel Haswell).

After inserting a SD card into the reader usb-devices output hangs when
accessing the device.
Also reading data from a inserted SD card is not possible (e.g. cfdisk /dev=
/sdb
will hang forever).

I've attached my dmesg output. It begins after plugging in the USB cable in=
to
the display and the hub and card reader being detected. After this I insert=
ed a
SD card into the reader and tried to run cfdisk.

I've tried multiple cards and the result is the same with all of them. All =
the
cards are working with the same reader and Linux 5.11.21.
Another USB card reader (Realtek VID 0x0BDA PID 0x0301) I own works without=
 any
issues with 5.12.

Some change after Linux 5.11 must have broken the support for this card rea=
der.

Please tell me if I can provide further information to investigate and fix =
the
issue.

Peter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
