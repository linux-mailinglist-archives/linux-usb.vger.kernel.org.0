Return-Path: <linux-usb+bounces-20191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19801A29D47
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 00:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CABF3A6FC5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 23:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C7521C19D;
	Wed,  5 Feb 2025 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZgGuLdw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB9020E007
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797277; cv=none; b=SaoEnma7ivu6Juwz1hwGyPeAfvYoHLMGTpaEQINftrL7atIlkuvPYrDwhMNdTl2oJxuZo3I2KTU+F1g4huBGVi3Jg4eLFCtrB/iBBQ3xBJ29mYaKQthzQVG7dyVhbvgG1dsvMJW4dxe1eqghLSv9NRpfJ6Mnb1EEwhzXWQCQ074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797277; c=relaxed/simple;
	bh=yYND1zl04AQI04/281pxt2e4pC/9cwYwh3bnzPlslBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kxqvjCTm3J6mPU23eb/tKlwe1xNccHfUoJzv6gVlb4KpYLU9Q6tPXa6plq4qXyANSONx4WL01PkSyV/37cjhfyJM5jNDU2VRRi8QmZXzXo/hf0wMmCbK8QYRXo5FXJNnXY3yWLgBh69Jo6e7s8imrPEPQLV83JAveeIztsgbXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZgGuLdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 035A4C4CEE4
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 23:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738797277;
	bh=yYND1zl04AQI04/281pxt2e4pC/9cwYwh3bnzPlslBc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QZgGuLdwB+dmnQKwYXIowtruv53lpqkXKlk0Jv483e5WHamshvmHBAoR9xVzSn179
	 RZzOEIcOOW1Mrxny1JcxpKBgDX9ngRCiuaA4L9prlfgzuOv2vgNoQy+QCyYA2g08y+
	 rvB0GbQdYh0HqunHU1qnIbK+rW1INsayyYHxzDItR8B65MO1TtuLqZAKw77FvfXYdG
	 J05ouPGS0i5yewedtgfn0xpKaQNmVmdXSCUa6nhjoS9y0qLCj1yCLpSrjAggcSn9Nl
	 kBa67lME/m1+Lq7jI7HTfprULOpIqduXkcs4MDFg72cNC1dNC+T0jBEiw3PVX5Fzt2
	 K9OyI7SOFVrJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E4B6FC41615; Wed,  5 Feb 2025 23:14:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Feb 2025 23:14:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219748-208809-NnnmJgMCL6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

Thomas (lyz27@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307570|0                           |1
        is obsolete|                            |

--- Comment #3 from Thomas (lyz27@yahoo.com) ---
Created attachment 307577
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307577&action=3Dedit
dmesg while tracing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

