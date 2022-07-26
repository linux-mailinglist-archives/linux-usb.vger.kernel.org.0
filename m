Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F225814E7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 16:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbiGZOPa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 10:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbiGZOP3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 10:15:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C08DFEC
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 07:15:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFCD2B8166E
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7049AC433D7
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658844925;
        bh=Ug/D8G6amUZHytCAwfJ9/if/iHgHD6mzXLE7Jm02SEI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GB3aeIqaiE1xWQOkuM2zqfnNM1+pJU8Z+FyJFAjX9CBjKjpHFqf497gsrguSerUZP
         koNb0UweEqa9BZKrflhpaxmzIWlnVCHYeLKHNmEdGDh96p62Ct3dic8Kc+AgRZcNq2
         IfShoJ/FrmD1L6SbJGNaBb3FI+KuqH/9mwuvYOsrZn7++GURJih5a6Ol1b4heGDAKh
         5IUGsS72rG4bbqtccIRHiLsE7Fb+9g3Ol5wt/lhNP7iN8+TngaZPGmpowRAgjyiQyI
         EujrRN1mIkfiH1U9+v0UfDE1wlnEbogEDnwZ9QNA69xhSyF0v86Yl6D3VN9hzo/sQX
         VqZ/3LMpGYTHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4D5E2C433E6; Tue, 26 Jul 2022 14:15:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 14:15:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-JoSXzSlyJb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
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

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) ---
Some of the things you wrote above are not correct.  "When you Turn-on the
USB3.0 to SATA controller, electrons travel near the speed of light."  Not =
true
at all; electric waves travel near the speed of light but the electrons
themselves move at only a few centimeters per second (bulk motion).

Anyway, the information you reported doesn't indicate what's going wrong.  I
don't think it's simply a matter of waiting for the disk to spin up; the
commands sent by the kernel have a 30-second timeout and that should be ple=
nty
of time.

A usbmon trace of a non-working connection should help.  Before you plug in=
 the
USB cable, do:

   cat /sys/kernel/debug/usb/usbmon/2u >mon.out

Then after the drive has been plugged in and the drive has failed to appear,
kill the "cat" process with ^C and attach the mon.out file to this bug repo=
rt.

In fact, you might want to do this twice: once where the drive doesn't work,
and once where it does work, for comparison.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
