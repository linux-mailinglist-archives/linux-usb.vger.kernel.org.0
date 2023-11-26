Return-Path: <linux-usb+bounces-3328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63E7F9283
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 12:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6FB21C20ACA
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 11:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E667CCA69;
	Sun, 26 Nov 2023 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNNU1cqS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FECA57
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 11:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD93FC433C8
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700998882;
	bh=bYN16vd8yn5K6eilWKuLe7mneeMMbKXkpIJEuPMYF0w=;
	h=From:To:Subject:Date:From;
	b=cNNU1cqSsXb6YEu+DEHG5F3CdCAEdT3EQkIjx1jRRAXvB6SPXp66DmMLmCcfslI43
	 ATPQWql+rkF2MhM+qU1pDq3bUmOKCTy31W96wWCZ5PTftJhf6Fn+EBrNKz8FxVRxWP
	 AyCzkeEP5tLTPHWO5lmzrr+57sLvWtfWvT/wPJWEY9snXUxlm5Pxpvm0i7i+urZm3D
	 NEdzOaUXRNAcZapFy2jKVpcroBSIi3OViVZ1ge3C2eiTwRdi4MaKbCeZ4BPrEmHm3R
	 pFXAQVN2A34uINbJs6ZVrJeyjWKIuWZw4wsg4BomR6OL6z9y9/LHbpxNbCILkoykLM
	 hQxN2QGAN/voA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A320CC4332E; Sun, 26 Nov 2023 11:41:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218190] New: Driver fails to flash ROM to Renesas
 uPD720201/uPD720202 when using not officially supported SPI Flash
Date: Sun, 26 Nov 2023 11:41:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gamelaster@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218190-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218190

            Bug ID: 218190
           Summary: Driver fails to flash ROM to Renesas
                    uPD720201/uPD720202 when using not officially
                    supported SPI Flash
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: gamelaster@outlook.com
        Regression: No

My uPD720201 is using XT25F04B SPI Flash, which is not officially supported,
according to User Manual document. Because of this, register 0xF0
(RENESAS_ROM_CONFIG -> External ROM Configuration Register) is 0x0000. This
register contains configuration for SPI Flash, thus when xhci-pci-renesas
driver tries to upload the firmware into ROM, it corrupts SPI Flash and fai=
ls,
resulting the hub working from ROM, or not working at all. In this case, the
RENESAS_ROM_CONFIG register needs to be set to appropriate value, in this c=
ase,
0x700 worked properly, and so far, for most of non officially supported SPI
Flashes, 0x700 worked fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

