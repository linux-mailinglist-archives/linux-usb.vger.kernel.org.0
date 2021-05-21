Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31D438CDCC
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 20:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhEUS44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 14:56:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230176AbhEUS4z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 14:56:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 098BE61183
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621623332;
        bh=QfprFCkduKVi685Lo6p9aEVy2TFuB0R3UaRL5V8jJ8g=;
        h=From:To:Subject:Date:From;
        b=oaE5vcn1RZfMKU/DvT+2YAdrlGRXorBL3OiG/9U0iv7rcQVkx+qtSqkJlKxZpdPP6
         IQSM39SLpe+wEKFP0IJXunkFZSwY4wJoUVQo3Vn8L3sAcfebynU8tQB4Qh09YwzGuP
         QXul7wDT6su1v8W1Y06i2IPEA85veJTCB9T1dwSkFqHnLxjh773CO+OM9Rd9Q8lQP3
         l2AewxxuRdJ0cPfJi658CE5wJvRmz8QouTgQvod5rDRjsxINGjOZTa6Of0Ukaso01z
         WoRKcjCKOZV1pnKkAa0xNiB7jf9aaVINkup1eqMiaqLf8cAddxPGedHOvFowm2uuLT
         Y4Bk6Lv6VhoJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EC74F6129E; Fri, 21 May 2021 18:55:31 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213169] New: IO error on devices connected with USB 3.0
 ExpressCard adopter(ASMedia chip)
Date:   Fri, 21 May 2021 18:55:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: esrevinu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213169-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213169

            Bug ID: 213169
           Summary: IO error on devices connected with USB 3.0 ExpressCard
                    adopter(ASMedia chip)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.*
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: esrevinu@gmail.com
        Regression: No

Created attachment 296921
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296921&action=3Dedit
when plugging a flash drive

From 5.12-rc1, external storage devices connected with USB 3.0 ExpressCard =
does
not work properly. Some device cannot be mounted with I/O error(log file
attached), and some device can be mounted but fails SMART test with the
following error:

udisksd[2684]: Error performing initial housekeeping for drive
/org/freedesktop/UDisks2/drives/WDC_WD30EZRX_00D8PB0_WD_WMC4N1747654: Error
updating SMART data: sk_disk_smart_read_data: Input/output error
(udisks-error-quark, 0)


Distribution: Arch Linux
Hardware: Lenovo Thinkpad X230, AKE ExpressCard USB3.0 & eSATA (ASM1040)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
