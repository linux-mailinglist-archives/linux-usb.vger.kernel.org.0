Return-Path: <linux-usb+bounces-15869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22625995321
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 17:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E721C2549C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 15:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918591DE4FC;
	Tue,  8 Oct 2024 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgeozcVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D5144D21
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728400664; cv=none; b=On3XkZ9ouw/Uk6tfjnSu7v5yxB44J26ZEKTN7doh8GwOqVu9JGuGHTdKaCp+yIKIpB6xy+ZO5G41/A3JB5v5bMZZp/u3178JTBPsCIelp3e8ky6MZRHjrvl9lp7OwOoM0cnrPuSbq98zEokXdJ6urKtDR3ifNVTBzcuPiD6dY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728400664; c=relaxed/simple;
	bh=AUNH0R4LBMW5ycxsp/XN5tnlHHAa2d99a4ndDS2cPs4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VFQCefRIJFe21t/pPCQCNG4qrw98w2XIPBnx7b/EhVKXxti1/MtgewgkVxUCb6tLt926JqoMcSkybZm/dtn/bCKEzorR/YC1qyY1zl9Rc4bHEZ+YjWv6lTTSF1DYW/n77/QZNCr3ohDIZFxbOJahhREcYS4XyBLQU/7KZvGx4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgeozcVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B7D2C4CECD
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728400663;
	bh=AUNH0R4LBMW5ycxsp/XN5tnlHHAa2d99a4ndDS2cPs4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IgeozcVpYyWhoN00AOn7+u9FuFR5gBmHa0B8LxIjKFDRkCYqs8EVicnKAghAsTkW1
	 heRdInfrTdgv7SDQPkM6NP4klxsJtYpssQZWESAuic5LYh2n1rUx2tAQ/3L5UvHxIp
	 dYM/DIM2GUDPwbqgoD+lFPvgR1MH5K9LYuj8B73lNduOjQAessGavlVmT2HGlH3jbA
	 ZDmjS2RsSd6jcpLDsC2u1lcCBLLJ7kcnPOFizFUbNH62kd/8RL7UTwpMT68ePkfT/O
	 D7+s/xmfuf7W9eTQ6waco5HfhKJLh+e6SJ5mLyzggDr/NDbIQZ1YPhu6E0Ao/vLKHE
	 75ET2VO1Rewgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87A58C53BC2; Tue,  8 Oct 2024 15:17:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 15:17:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-apAJ3epM2t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #8 from Tomas Mudrunka (harviecz@gmail.com) ---
And it's not just about "sync" of the harddrive. It's about stopping it wear
leveling operations. Modern storages DO shuffle data between blocks even wh=
en
you don't write anything to them, power loss will cause data loss even on
read-only systems. (users of raspberry pi with read-only SD cards can tell =
you
lots of stories on this topic). Therefore we need to signal the device in
advance we're going to remove its power.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

