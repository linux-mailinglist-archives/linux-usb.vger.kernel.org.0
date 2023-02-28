Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52DA6A5D0C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 17:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjB1Q0A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 11:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjB1QZ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 11:25:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35128233FF
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 08:25:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A1412B80E70
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B246C4339E
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677601554;
        bh=LurRaQxV0BMCFvKldEyfMqZ+6mrRlQmlwp7w45G1LwI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DoRpX0M7KcXjBoTDrdT1W3VRj53MK+i+a0ZC+s5Sd4vJUJpv62hzaHLj+guWtiyU0
         rL2hVTIL6m59TeYpPaJFhBy2ZUMocK83NBIQGjFd3Mczd8y0Rc5RrA8vgdLXViZZkF
         J/ReUWKS1m4V6QBn4XP5ucWZ2hjevEQc3TPirkTVDJf8YGLFYCSrn4w1CofWd7FMLa
         qx14ywv4JZ2VEcJ6G4d/sP+eOozkTsanTausLWLG0zCO2MXjjXVXY1IqBMKchkTWp7
         fbW1Ber5O9VhgVlfRSc8mrD2r0uX4ufGq1VGVTuyP/rU2jHnvrOjCxe7pl4KLJG2Ec
         wJjqi5ULLn6tA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4061BC43142; Tue, 28 Feb 2023 16:25:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 16:25:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-6m6DnY55fd@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
The two usbmon traces show a big difference right near the start.  You can
check my analysis by doing:

   cat /sys/module/usbcore/parameters/old_scheme_first

under each of the kernels.  My guess is that the file contains Y in the -33
kernel and N in the -37 kernel.

That setting should not make any difference to a reasonable device.  But
apparently the Xone isn't reasonable, and it changes its behavior based on =
this
parameter setting.  Technically, it removes the second configuration when i=
t is
reset a second time after being plugged in.  The -37 usbmon trace shows that
the xone reports two configs after the first reset and only one after the
second reset.  The relevant lines from the trace, right after the first res=
et,
are:

ffff8bfede5c8900 121253611 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff8bfede5c8900 121253721 C Ci:1:000:0 0 18 =3D 12010002 ef020140 f0220800
00020102 0302

The 02 at the end is the number of configurations.

ffff8bfede5c8900 121253739 S Co:1:001:0 s 23 03 0004 0001 0000 0
ffff8bfede5c8900 121253750 C Co:1:001:0 0 0
ffff8bfede5c8900 121321750 S Ci:1:001:0 s a3 00 0000 0001 0004 4 <
ffff8bfede5c8900 121321766 C Ci:1:001:0 0 4 =3D 03051000
ffff8bfede5c8900 121321771 S Co:1:001:0 s 23 01 0014 0001 0000 0
ffff8bfede5c8900 121321786 C Co:1:001:0 0 0

Those lines are the second reset.

ffff8bfede5c8900 121401578 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
ffff8bfede5c8900 121401685 C Ci:1:007:0 0 18 =3D 12010002 ef020140 f0220800
00020102 0301

Here the 02 at the end has changed to 01.  The -33 trace shows only one res=
et,
and the number of configs doesn't change from 2 to 1.

Assuming this is true, the good news is that the parameter is something you=
 can
easily change.  Just do (as root):

   echo Y >/sys/module/usbcore/parameters/old_scheme_first

under the -37 kernel and then see what happens when you plug in the device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
