Return-Path: <linux-usb+bounces-30131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E7C3993C
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 09:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7DC6435059E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 08:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EC3302153;
	Thu,  6 Nov 2025 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6IhUwmX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB8302147
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417638; cv=none; b=XUD+w56QYROa4dibEkO/0tGxqb+hdFqVxhphBoLqsM5nE0ATc7rLT8wAzK4sBU+K+ifVEAJxheEuU2Ulr5Kb6nTLseROIIstzzQaSj8wGLsXprjdmm21sL9rp0CkzuZliwqAu8fWL4yfpe5EivekbpJigY7tqzdwrv6mmTCKv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417638; c=relaxed/simple;
	bh=upAyo8eMmMATzE5wI2vD5oVS6znHnv+bFlzq212S438=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WnNtDLqOd3jhHpai8hLZhmbKpNrsu09y7vystiY+trW1C3XRbl9VxYCWmcODyGDE1KV7qWvwFqkrOYL/ii5Swf3/TRKg5v+8zDOw89hj2OuGP2yJvhMQ2qEXLH6NXWfwS76pwkRHQXgGLqOd+lEAvVIZ10l+fakvIiyyLlCSccM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6IhUwmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48753C19423
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762417638;
	bh=upAyo8eMmMATzE5wI2vD5oVS6znHnv+bFlzq212S438=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S6IhUwmXW318EWifSiUUczxcc6BLOtK/JGzqBv8Epnho4oyYl2xOgqnEyd3GTYbnh
	 1OqO2T425FsclsAJSNcAZ+GZ6dbCPrpEEbyR3eT8jjdrpuPtE3CDgcBbdhiQDVaBPv
	 sK7TDEqzvj6OXiZUT5/GPac9kr5wScWAsxNdtiWt0I32d1pFG+2DiIKH5i8/zIrZk/
	 5Hz8/1U63X+GA2LKTGH7+sPbRBrSjR4830zdEOJdYoVkjo9Z+0PyEZ6stPrvMSlP0H
	 T+nRkw+A8yLabrgTMnXLVhAhHePRbM82BOvBTuhFd7vfo+Av9DGfbA3EWoKsjNLn+A
	 x/rE2x1pIuekA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 422D6C3279F; Thu,  6 Nov 2025 08:27:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Thu, 06 Nov 2025 08:27:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-OLMgcppbBq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #11 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
        if (!qh->bandwidth_reserved) {
                qh->period =3D urb->interval;
                [...]
        } else if (qh->period !=3D urb->interval) {
                return -EINVAL;         /* Can't change the period */

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

