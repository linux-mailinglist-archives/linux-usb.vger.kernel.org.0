Return-Path: <linux-usb+bounces-25134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B80AEA3E3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 18:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0F54E4AED
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD162ED853;
	Thu, 26 Jun 2025 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IO+uDy8K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9320D519
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956719; cv=none; b=ITj7mBpmt06H9TNXSpvvIlAPrp/GYaBrMdk0cF+Cf60Oj7wtYerRy27MDxUzcWSGWh9yutWMbGKfd2YTeU/d6rlXxtmLHg8VLh2ENJKpqeJ7WXk4leww2Hqg3H4jemY9YwYmg47212TDLLXfcNwtvzeUtBIuhZXSMqd5pV0LasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956719; c=relaxed/simple;
	bh=j0YIiEpz7BDpPMdFH7gmcKQH+an8AGvOSXh06NU3dIs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b2949jkWmID3bGwkk5u2xG49NAPp7clV44FvkPmfPvFLL1gqQ5qGK6d+XFpPjTrQJ8xJPb+76PjnLFsBzFVNnafutrwyavHe53XfxEaLq7XyG120+8giloGMXNU7jL3LxiDODl3Lj8OfNIWrSr+TVkYCnMDzH6EqdOQe6FMXGlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IO+uDy8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36B8EC4CEED
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750956719;
	bh=j0YIiEpz7BDpPMdFH7gmcKQH+an8AGvOSXh06NU3dIs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IO+uDy8K9M1EXZWff/7Ppf6YrBGECmW65NoApJWM02g7IFQxZ7FPNzbBCuACSslle
	 oea60mGEd+8J0J4BuCCC70Sqosw3YR9qpg27GhVldkCOKUV/75rDoO8Y3VFltUBR5j
	 ix3EVP1S3pjSkA1KrnAmcXiI1th/4kJYJgaGl/fXI/1oH1U9fH9eEqXo1mc/KSfUGt
	 h88i2cAZp5UejE3K+LefFO+Z0PbA/OQe9Q+Zqvmr3JK0O1Ps5nyeUhVIduOwb83lKH
	 orfQ7NGrquf79SOXaQ1RXDqO2ZFeOUeazs1kx8xdkCBRj7vRQmdxh71LvnwU2aK0Na
	 l1Utx4dTEWrQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 284D4C433E1; Thu, 26 Jun 2025 16:51:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 16:51:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-rKenmsfZfR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #5 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308315
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308315&action=3Dedit
Added before logs

Added log from before the plug event using this command:

sudo journalctl -b | sudo tee /var/log/usbcore_debug.log >
/home/marcus/usbcore_debug.log_before_replug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

