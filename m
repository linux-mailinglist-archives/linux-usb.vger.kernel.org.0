Return-Path: <linux-usb+bounces-12744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD058943581
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 20:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F2F1C21882
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 18:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C583F9CC;
	Wed, 31 Jul 2024 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBuiMWiH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4D2032A
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722449681; cv=none; b=f4GCmFmheC/qVM66W60G27yXEiTkKSUCTNotrDtB6m0y519p1GRZfsG2ljzHrU6HGCaMaEZRDpP60kZDN+M8UcVaz0K1x6WQHqQde8qoLi7DQzrGRClskspbahAsOewQYYgeJwWD0j2DmoCQgBRGFquxRxTED7ksA0en9pZQdyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722449681; c=relaxed/simple;
	bh=fRsJCtUC20ObxSP8p7WOWstTOzB6942ppR+5j9TQQzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lcUcEeKiJkVST+/lO0lKsiowxpnJ1FZcb41NIdQKfS3K8jCcGLfSiLxtATplaweZTMfUoUj7DRNtiF1r8qkuepYBcfzNRB2VgppjARoACZayMWncjgBP+bzObDg/Dt/efmTDy3JmZ85AenGgV2vbFtw48pRrkRlueDSKyjbKZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBuiMWiH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02C69C4AF09
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722449681;
	bh=fRsJCtUC20ObxSP8p7WOWstTOzB6942ppR+5j9TQQzI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UBuiMWiHiXwjUPm1/1FcDuHCEnNk9Q7G80nZamNfKncYsRWpQ2YtPCzNyqeYAZP4d
	 a1XiM1W7LZxfkhW4ieXjm3kB3PcGrKLGXbY1q4uWxUKAmG4zXKWILmb8+CJmdxphSH
	 7PPtf09Sg/aoHPy3UX4gIu1rX2rLyO49+DnX5H2i5WrSXoQdAHLYiSjTa1HbDmG4zp
	 R57S7YXw38ape5OS8TKHopQK+HmJM/xsGFWYHZqsCKHY6CyUR0KoXYII04s7dkYGwz
	 9IoHKky4/p6jyHtHMG5Ow/rRBBut9vv9d6GqLkwr6oOQWVJ5/cD2C9+GXJ6qbyllRb
	 vQa449tEiYrRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2C3BC53B50; Wed, 31 Jul 2024 18:14:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 18:14:40 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-EzkXDUHA8H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 306649
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306649&action=3Dedit
Skip second reset if the maxpacket size is large enough

See if this change makes any difference.  The patch is against kernel versi=
on
6.10; if it doesn't apply to your kernel tree, let me know what version to =
base
it on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

