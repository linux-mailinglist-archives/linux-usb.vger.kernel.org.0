Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F47147A2A4
	for <lists+linux-usb@lfdr.de>; Sun, 19 Dec 2021 23:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbhLSW1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Dec 2021 17:27:36 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56290 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhLSW1f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Dec 2021 17:27:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8BCFB80D0B
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 22:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7091AC36AE7
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 22:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639952853;
        bh=FSA8FVfwk0BYE/aXHuSMOO7lfmio8tWwCv2BUadaF+I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bz8T/ylQjVMV23VaUu7WSx4xFMcZK1dxxQw5JZOWCfdWpSUBBmDx++WiO7wqHLol4
         01aOlwwQ56X/ys0bBgOjFemyE24ZXdDnMofgwaz2zk6ScG1+F3YbgyH7DEclzu41B5
         9oWvZVIeA24wtWfOIpl6oExWGliuLv451jSivqtIgCmOqodca3p+XtlaU6Uc2j/6Ab
         YnWyXoncevluiJ1ti1gFKLDGLhpEbaIDRUbbiKC4HDGmpPZYOzv3Yn1Po2iNE2jle0
         2ebMikeMyWpqaZCCu1KMq7Q5QiDro1Bg2HtluGQmvD8CHor+gbDGzFTzQmB+NOmjC2
         vSdagPddsIyEQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4B71C610A8; Sun, 19 Dec 2021 22:27:33 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Sun, 19 Dec 2021 22:27:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-a2FfJlfS0S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #2 from Ross Maynard (bids.7405@bigpond.com) ---
Correction:

In 2.6.32 the following lines were included in dmesg:

usbcore: registered new interface driver cdc_ether
usb0: register 'zaurus' at usb-0000:00:14.0-2, pseudo-MDLM (BLAN) device,
fe:1b:05:23:49:7f
usbcore: registered new interface driver zaurus

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
