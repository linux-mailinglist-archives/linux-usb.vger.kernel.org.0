Return-Path: <linux-usb+bounces-14229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A37962538
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 12:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A2671F23C30
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC316C861;
	Wed, 28 Aug 2024 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqsoy4YD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBFA16EB53
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724842009; cv=none; b=UvjAUWEfbFbiiIA2FX/vaUEyNtA6KF5/HAHo6YHD2VeKerFdodBWgmU+8l9RjLQYRFlKxVPOGAu8PfbGN+Zf8t60gJtya5INX+L96Qc+MMHDanBF+pXJ/ty1iaehFqyRriRzjTbn8MptyW4I/Y6xUzixe1vytVATxV8u9ATnl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724842009; c=relaxed/simple;
	bh=YW2Mx5mLy5XWFiHf1D2H/qeFPdAjbSfSC8eZacvsjlo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0Uq8rVPYYUxZW1irwkjf0lzyoi4QJAIx25gPIt5QC2JRfE4bI7McRe/8+OTTgDbWY6mV/BmvjQsJFwjEN1pPa6UmLbYw1w8eZGhWBYZwuCZp5DOXrnIS8du7UB5C7QWQnxz4y09CELBs+3vnl2gel1vUqO4jG8ouEzzGJuU6QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqsoy4YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 762BFC98ECE
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724842009;
	bh=YW2Mx5mLy5XWFiHf1D2H/qeFPdAjbSfSC8eZacvsjlo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iqsoy4YDMysHQ/k8JsGZucAFAGxermEXJvXaL1V+e9uroNxUxgooG3p+4+1jJLDez
	 YkWDfwkmr+gv59ZNwn+0OYfK5kxSHrWRTNm2w3HMzi+p/6nq6toTPf8NlNRC/wH5CI
	 ljbHT2cFzevs9GwVH1O7FSETbRZRnN5dWKvOkik8jkwtn8FheCFMXcpqGKLYsSBoda
	 zDFc6TZVBrtNzDPlg/sQwsACfsNPYvLgBEjEj6eRQTT9g839jcYx4wQgl4BT8hGaMa
	 LcC5U2LE0hJMEEcdSbXmODDUUPMSxQRiKkWIdc9Ccd2J2jyEl2/m8HzN6YGcvDVK3F
	 1Fp2qYspyi3tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6919FC53BB9; Wed, 28 Aug 2024 10:46:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 10:46:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-ZJkJduPLOs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #18 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Forwarded by mail:
https://lore.kernel.org/all/c844faa0-343a-46f4-a54f-0fd65f4d4679@leemhuis.i=
nfo/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

