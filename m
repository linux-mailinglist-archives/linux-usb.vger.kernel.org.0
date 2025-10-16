Return-Path: <linux-usb+bounces-29366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A7BE196E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 07:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339423A986F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 05:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544B51DA55;
	Thu, 16 Oct 2025 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx71Fejq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC876524F
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594008; cv=none; b=G8MvmF3U2xnYF97tDAxS9PvDT3da6TFfjSDfNVdPFsSORHtX3Fe0wx8MNShKiX3TuuRc5YPTvaoefkRMLrQOGPiWFwJYolxTOzqDs2YaZ5O8+l5KrbW6DE3FUWKaGaeBOe3Ed4uiNJytNk3plwxpzAkjyGxpQ7S+6tl4Z9QqPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594008; c=relaxed/simple;
	bh=a7L0Zgh6DErhNIJI4mxfz1wZAN/Jued3Yvyvfot/7J4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TnGCRg4D1DUHaaoGNlfUnNRzuCRnqn2vG+hSMrHEgIB0l5mP0QdzpgoGAKIjMsKQMbA+7RjI0rmCnPN1FzI41YsQ54AR3y2/dfbh/S6cfcOish2THuPTS/6Q7ka9jiZSH6vxOJ0AcMnzOtDlT9ULdyiXO87rbhcMZMsOPoQIf8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx71Fejq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72D3AC4CEF1
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 05:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760594008;
	bh=a7L0Zgh6DErhNIJI4mxfz1wZAN/Jued3Yvyvfot/7J4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bx71Fejq/WPALf/cwOQTjbSKv1U90KcTfYnkd6go8bJyVSBTzDwvbCRPaLdkQy/oR
	 15MtRFmvwrxJRZgd69Uh0oKvGYacwvORXXPXSb1z+59dSbs39Mj0DeTHd6QoYpttMx
	 7VCwL48oQVZDm0/Fg7auWE1r6vWWfs2bgVSieUmCZhvmWM2kM24FiXdNYObT9Zrxei
	 JQHIqdm1iKdqwdBDhcKTIIkX/z1t+9YAOFfkP9Sph8aSIntfI0zfzNJVSmJ0WkaN6S
	 nrMKopUz0V5OTb+LPumuMvbLPaJmPXnq5gUAEmMrYYSOphDeRuReUfWSYAEfHnKNrh
	 yWYqqzjfdXmOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CEB8C53BC7; Thu, 16 Oct 2025 05:53:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] xhci_hcd prevents S3 suspend to RAM from working on Zen
 5 system
Date: Thu, 16 Oct 2025 05:53:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220667-208809-QFSK0OqXLg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220667-208809@https.bugzilla.kernel.org/>
References: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

--- Comment #3 from Christopher Snowhill (kode54@gmail.com) ---
Yes, that fixed it. Excellent.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

