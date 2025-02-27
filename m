Return-Path: <linux-usb+bounces-21144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5FA47E6A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 13:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B4B174BA0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177222E3F0;
	Thu, 27 Feb 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miFKa9gf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB022DFB0
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661121; cv=none; b=KM9Y3Zovx2n26ZPZah4RobnBhh6VS5ULLxP1BjKl6gAJBmKLYb43w4orEndglNkLejchzjiM9Km+7/IPeYC0vv7HBIB7tOk+PMuUGgvv3Ssg4IbpHfzdCj1OOUeUwBtIwJWEI4klI4G3ya1QrMnquW3i20hSQ7rY8ult8aa62Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661121; c=relaxed/simple;
	bh=A4XTIjqe+Rb0drEX7WvPw1buBFomorbTpjf0HYiG5Cg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fI3E3o09m+KyRYKxV5eLdGyq54Hqpx+HC6IR5rmWyATOLYrUFQkp8vupSwMfhsR1lhxGK5prwUA8GmUCvRUd5zya9fF1vpR5w9V9qEV00K3sSYMw3W+ZO4lF38Q4xwGbtsg83CoHtU+M2tXVQ/EhYQun1e2uX/8jodbw2n/9NYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miFKa9gf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96B46C4CEE6
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740661121;
	bh=A4XTIjqe+Rb0drEX7WvPw1buBFomorbTpjf0HYiG5Cg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=miFKa9gfHUGydq4mbxWtWI0mOWYtvGdNFSsymr7OEXIZoZRasbp7xxbwUXd6Lrigt
	 cjLvznLL+BdggRRVkEb48Zs98yE7r9dXhYQ9MCAPFz6QA6/geriilq9d2J4Z0QQ25l
	 ptrZHgMg7yWd0qSG1bbxxfUCC8qwTTJKqagMb42mYaHV8TbcPEgoij5oPD3T6hP3wC
	 IRNUrdpIydSN5pAxFyOQer6Fq0jOqOnxOlQT4Sq6NHBxN5MdFTuTnTfjIUqE4XCvdc
	 W21X1RUQjbm+YVrAuItjkSAzzAqH8v+tj+Dqci5gaY2jFxLc+uhcWPnWzACzZs2Zmr
	 7e8vPZl4BN0mA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 619FBC433E1; Thu, 27 Feb 2025 12:58:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 27 Feb 2025 12:58:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-I4pHVRrwH9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
This just happened again:

[161470.836493] PM: resume devices took 0.547 seconds
[161470.836720] OOM killer enabled.
[161470.836721] Restarting tasks ... done.
[161470.839715] random: crng reseeded on system resumption
[161470.845090] PM: suspend exit
[161471.322491] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 4=
00a4
vendor: 0x2 v0.43.1, 2 algorithms
[161471.324469] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8b72.bin: v0.43.1
[161471.324480] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot:
D:\Amp Tuning\HP\840\0930\103C8B45_220930.bin
[161471.403951] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration appli=
ed:
R0=3D10446
[161471.407392] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration appli=
ed:
R0=3D10526
[161471.432157] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded -
Type: spk-prot, Gain: 17
[161471.433916] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded -
Type: spk-prot, Gain: 17
[161471.523827] hp_wmi: Unknown event_id - 131073 - 0x0
[162644.637587] xhci_hcd 0000:c3:00.3: xHCI host not responding to stop
endpoint command
[162644.651068] xhci_hcd 0000:c3:00.3: xHCI host controller not responding,
assume dead
[162644.651076] xhci_hcd 0000:c3:00.3: HC died; cleaning up
[162644.651099] xhci_hcd 0000:c3:00.3: Timeout while waiting for stop endpo=
int
command
[162644.651102] usb 1-2: USB disconnect, device number 4
[162644.678374] usb 1-3: USB disconnect, device number 2
[162644.678748] usb 1-4: USB disconnect, device number 3

Shortly after resume all the USB ports are disabled.

I'm reverting back to Linux 6.11. I cannot use my device like this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

