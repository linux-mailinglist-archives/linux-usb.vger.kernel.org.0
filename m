Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0C53FDD65
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244517AbhIANpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:45:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244510AbhIANpI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:45:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CF5BF611AF
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630503851;
        bh=J2pvS2el7Rt//sWJchA9RDK+biJKI3OPPIe44rAgDiA=;
        h=From:To:Subject:Date:From;
        b=GnuhFaigWqe4BdzKJqARP0Ubn+Ae8YtiE4hZJF3I2Dfx61AT8yg9VizksS/MjH5Q6
         kJQnO1xHm+ID/kaIdmUG+q3y5cwHqzBxavo/rF4Fgckdpg6CB1kasd5mV9efrZM5NF
         eIBP0yxOfnRnkpHfyb8YVJ1q/bgJfGeR9fS4SAzQA/yM7UP+QPJGZoZSW3I47hKBSi
         GRWeCBD/u4dRj1GG8OatoAFDJhbXK91rlYNn1Ki2u8mAlC+M9gQmaLhHyA2EogkYHN
         chlRwl1QPtceCLm2RLcJGzt1bGLqqIZdAQ3x/Pxv5Hz9yxiWQzC3IbgnH5xpso6hZN
         hqjWqLCEM0MbQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AA463610CD; Wed,  1 Sep 2021 13:44:11 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] New: Discrete Thunderbold Controller 8086:1137 throws
 DMAR and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:44:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

            Bug ID: 214259
           Summary: Discrete Thunderbold Controller 8086:1137 throws DMAR
                    and XHCI errors and is only partially functional
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.12 and 5.14-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: wse@tuxedocomputers.com
        Regression: No

Affected devices: Clevo X170KM Barebone (I have one here) and according to =
this
reddit thread that describes the exact same problem a Thunderbold PCIe
exapansion card:
https://www.reddit.com/r/Thunderbolt/comments/ohjakr/asus_thunderboltex_4_l=
inux_compatability/

The Clevo does not use the build in thunderbold controler of the CPU but a
discrete Thunderbold controler, which seems to be the exact same one from t=
hat
expansion card with the pci id of 8086:1137.

High level problem desciption: I have Thunderbold dock with DP-out, USB por=
ts
and an Ethernet port. When I plug it in, only the DP port works. When its
plugged in before boot, ethernet also works. The USB ports on the Dock never
work.

dmesg is showing several erros regarding DMAR and xhci, since the DMAR erro=
rs
are shwing up first is suspect them to be the root cause making the rest
afterwards fails also.

The error is slightly different between 5.13 and 5.14

5.14-rc7:
[    3.148557] DMAR: DRHD: handling fault status reg 2
[    3.148561] DMAR: [DMA Write NO_PASID] Request device [0x04:0x00.0] fault
addr 0x69974000 [fault reason 0x05] PTE Write access is not set

5.13.12:
[    3.737783] DMAR: DRHD: handling fault status reg 2
[    3.737790] DMAR: [DMA Write] Request device [04:00.0] PASID ffffffff fa=
ult
addr 69974000 [fault reason 05] PTE Write access is not set

04.00.0 is the thunderbold controller:
04:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137] (prog-if 40 [USB4 Host Interface])

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
