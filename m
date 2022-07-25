Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0599F5807B5
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 00:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbiGYWmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 18:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbiGYWmf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 18:42:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC5524BFD
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 15:40:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52BB5B8110A
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 22:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 001F2C341CD
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 22:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658788742;
        bh=PezZx4jHryZZrRWp3/fCiB/uaOMl5IFNia8PvjE6Yjk=;
        h=From:To:Subject:Date:From;
        b=Q6+7pDmb2pm66BIyEdw4yTb0YTQzRCyfBtnsdUMxjac2FL4eSePgd6J3mA33N4THi
         ZihksFWAPBoVF/MtqR4NmgdRZwqxnOwKWjNjmXqNyaUjn+cV+OK2bQ3iQEsg68nvpN
         aDJhHjXFfITzlVwF+1SEBfo9bURxSP3lXJvCQVQ1f2kV0vgPsNhX83SJjzXNgykQbP
         a/BLCYM+j8ajz+uD5t8TYAf0ULFkhmIdPxbOj86j1PULi7zUPm3nd6I9xT9cfjxR0Q
         Xk2IhtDXyOuA6fRc7yQx2eTFZLpYsRqOVDVijbHN2uEkcE7wT/FenACW9hNL/8BaE5
         1OcYvCiBzoJrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C1D60C05FD6; Mon, 25 Jul 2022 22:39:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] New: usb-mass storage
Date:   Mon, 25 Jul 2022 22:39:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

            Bug ID: 216282
           Summary: usb-mass storage
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.0-41-generic
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: audioprof2001@yahoo.com
        Regression: No

since Groovy Gorilla, maybe older...

problem #1.
 usb mass storage,
delay time is too fast, and there is No .conf in /modprobe.d
i have to unplug and plug again the external usb hdd cable turned-on
so Linux can detect the HDD and mount.

ASM1051 is detected with $ lsusb
when i turn-on,=20
but the HDD is Not Detected, because delay time is too fast/short.
its like turning-on without a HDD.

upgraded the firmware of the external USB IC controller to latest.
https://github.com/juanpc2018/Asmedia-AS2105-sata-to-USB-3

because large HDDs "over 2TB" was Not working,
Now works ok exept that problem in Linux.
Windows8.1x64 works OK.

problem #2.
Linux detects a different speed?.
$ lsusb
Bus 002 Device 004: ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s
bridge

is Not 3Gb/s =3D 375MB/s.
is 5Gb/s =3D 550MB/s
when used with SSD,
large 18TB HDD are 250MB/s.

there is something strange going on with usb-mass-storage.

https://support.apple.com/kb/SP710?locale=3Den_US

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
