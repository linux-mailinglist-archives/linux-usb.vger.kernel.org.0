Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F417A6A578E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 12:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjB1LNT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 06:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjB1LNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 06:13:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2B6D9
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 03:13:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0992B80D58
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86213C433D2
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677582794;
        bh=BWYrMUmJxC3lTlQO+XsifNPETtAWwRis4u/Xl4aBp1o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jUYYhi35gW8rU06QXT+o/XDCPqvNs9Xw7NZSyIiWG678wv/2AShr0iUDX6AHOqhmb
         LCtB3Me5/JOpqVvGP9p4fwrxwBlsEZyTkVMlImTGBQbc924TlKf5vs/BrAFw0Nw3/k
         EnuruLvegppKqj7bXVkODLR4ErxZMfc7SG/FIyI5Mjr5B/VuAFCqQDEWNFgYcBmAks
         XWHLLh2pULMKdaPD5ptG8AzlydOtcwhBrAVyyJSgbrHwciZ7wh5riHPtxWyNoMmbSx
         AqVXYk0N6Bm/FIgp2UuwbHkCbUPRC8ngCRQGlNZXPw92EQQTBY4gp2SW9DxnUU4fz6
         teZB747/tXCGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6FD8BC43143; Tue, 28 Feb 2023 11:13:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 11:13:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-Obw6bFm61e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #14 from Pierre Germain (pierre2008@gmail.com) ---
(In reply to Alan Stern from comment #10)
> The attachments are pretty clear.  The most likely explanation is that
> something gets sent to the device under one kernel but not the other,
> something which causes it to change its firmware.
>=20
> The next step is to collect a usbmon trace showing what happens when the
> device is plugged in.  As root, do:
>=20
>    cat /sys/kernel/debug/usb/usbmon/1u >FILENAME
>=20
> before plugging in the device.  A few seconds after the Xone is plugged i=
n,
> kill the command with ^C and attach the output file to this bug report.  =
Do
> this for both of the kernels, and we'll see if anything is different betw=
een
> them.

Hello Alan,
Thanks for your reply. I have uploaded the 2 logs from usbmon:

Kernel 33: https://bugzilla.kernel.org/attachment.cgi?id=3D303806
Kernel 37: https://bugzilla.kernel.org/attachment.cgi?id=3D303805

If you need more information I am all ears. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
