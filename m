Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94252479FB8
	for <lists+linux-usb@lfdr.de>; Sun, 19 Dec 2021 07:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhLSGOE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Dec 2021 01:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhLSGOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Dec 2021 01:14:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0F0C061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Dec 2021 22:14:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0ECD9B80B3F
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 06:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA70BC36AE7
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639894440;
        bh=mMGL22xHJUIb/4VDfUCiL428gVfKoeaLOglZPEHngak=;
        h=From:To:Subject:Date:From;
        b=tp2dv+uw2praUtkEpqc8s7p7xFw3UqqcJrxASfsIg5TpndMsOOC/9yzTEB+Sg12+y
         LjwAOi9Q0G6XfP9fiZSGhB/C3x26TFTMoG84PFbNHv9Qzc6Mok56WEerUaVBy9k/rb
         sySZjGyuydnqjgFHa8txuVWLn3H55wWtuwVVVcne/h3HME0FCuSnq4xcFbLHpfDUeP
         apQAicnfuzqL1PVFO3K5BqrsKShiqxnU7EaJF68Son5lBO4nPHm2OnU82MkxqNRpUG
         eDYgfJHGTbLB5az6yAUdhepDrtfZkS0Nj4pQI7F6w3rioI3+gxS6RZWct5OEMLSHjd
         fc0qwJu3w272Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8704C610A8; Sun, 19 Dec 2021 06:14:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] New: SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Sun, 19 Dec 2021 06:14:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

            Bug ID: 215361
           Summary: SL-6000 zaurus USB error - 'bad CDC descriptors'
           Product: Drivers
           Version: 2.5
    Kernel Version: 3/4/5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bids.7405@bigpond.com
        Regression: No

A 'bad CDC descriptors' error occurs when plugging the Sharp SL-6000 zaurus
into USB. It was working in 2.6.32 but has been broken from kernel 3 onward=
s.

usb 5-2: new full-speed USB device number 2 using uhci_hcd
usb 5-2: New USB device found, idVendor=3D04dd, idProduct=3D9032
usb 5-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 5-2: Product: SL-6000
usb 5-2: Manufacturer: Sharp
usb 5-2: bad CDC descriptors
usbcore: registered new interface driver cdc_ether

In 2.6.32 the following lines were included in dmesg:

usb0: register 'zaurus' at usb-0000:00:14.0-2, pseudo-MDLM (BLAN) device,
fe:1b:05:23:49:7f
usbcore: registered new interface driver zaurus

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
