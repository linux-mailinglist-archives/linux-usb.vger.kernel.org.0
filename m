Return-Path: <linux-usb+bounces-23767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B984AAC84A
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 16:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 530B27B9699
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D7028150D;
	Tue,  6 May 2025 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2dH2qxA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039D18D656
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542270; cv=none; b=muuI8XgZ140fWZqOpIqcipCCLpTfZpjRdQLtrGfmNGD+qPrrroDwqBdQNMGKOxq2n9dvpC50PjznqdTEQYFEkSzh4RIFIKpmfoYMpyZ8qQnzYAPuJAGQkZriMlXCilTUx854wANvKkdXNwjegDCbf3Ub/HsVpPTn6mf03hBpEO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542270; c=relaxed/simple;
	bh=MR8FNdzugh4OirAf/2UwPVfk9BYEV0ZVZrBveEcX+9c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uvUENBnBwrzjLd24ITUrLIEHyYbrHdBrA7K8MxCf4A5rLPoekNUAd6Ixg3fOTRf1rwm78SAy9awGOxrPApMZFCcRDsNikZWzZ1f0imbDSbJGNBvmbyq4eTVk+Dap4poe/tc6A43qYPIPyfaXaCFc8uEo79HUOnmFMc7uqJHLJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2dH2qxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA664C4CEE4
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746542270;
	bh=MR8FNdzugh4OirAf/2UwPVfk9BYEV0ZVZrBveEcX+9c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b2dH2qxAbPZqrCIPhasojDkuFvTypbCT2O+rD6rnmeH2DKZlzZPHzGb3uFO7shtjC
	 zyHjeH0VKUOkU70E9U/LXpUlEu26KIv38RuVgpVYD6FcKBEhdNEVjaJaiZHQiRGrcN
	 kWoDypsmw42chcOSj3I9vVcnfmwCAp0mlRFs6hS/asF64hoG80UchEvWVqNtdCwTg2
	 vGxKFNxtVzy/fz1UadV7PtADOV9HaoCQLuhAszhir21MDauqzbBNNpw2Qtr8KH6V+Y
	 iJbcDHtXk85/FXRh8fP9wC5Tb7F9iOR+8ub3jkdTooehwF2ts1gn2FS7STeyN2Pj41
	 W025FpTNs2sug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D856EC41612; Tue,  6 May 2025 14:37:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0
 during Address Device Command
Date: Tue, 06 May 2025 14:37:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jay.chen@siemens.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220033-208809-0xoXZBI4vQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220033-208809@https.bugzilla.kernel.org/>
References: <bug-220033-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220033

--- Comment #1 from Chen-Tzu-Chieh (jay.chen@siemens.com) ---
Just checking in to see if there's any update needed from my side.=20
Happy to provide more info or run tests.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

