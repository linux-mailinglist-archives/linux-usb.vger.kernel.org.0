Return-Path: <linux-usb+bounces-17913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302769DB036
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 01:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C42B282077
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 00:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAE69460;
	Thu, 28 Nov 2024 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGGmO120"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328DE8F64
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753143; cv=none; b=VGOfklr0Wegse3v0pDfUM0szIUPkHAVMbV8/bSfWlIHiap3nMUAoccMKC4y65+FM0xAfm5hOB+QJK/j8qTmfxGBfjDjRcFUf2tjw3vkvSMPekuWE8GdZoVYJP7WtWVyS9RaYyXHDbWNVXEXLtphGn15VoUrrKmswBXogNh2Z1tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753143; c=relaxed/simple;
	bh=CT8WfCVdx4dyocZOHNd8QK2X0dsl6bBVNfH1UUoEp7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TACrXIMvr79tpH3Qbxb+wRkewFo/PGIxE8aV4U9UPnEGmL+oxz/Ix6etFYCFC4M2ZQCoL2vMGlF+qjGWZ8Pb31RvfyOHDaNc9wyD3dx8S1BEdYqXbS1ICYa5QXhdCIVnNXozuagrl+YAwkh6zzZg3m6ZeQnXHWxtmy+otJKRK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGGmO120; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03A36C4CED2
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 00:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732753143;
	bh=CT8WfCVdx4dyocZOHNd8QK2X0dsl6bBVNfH1UUoEp7I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rGGmO1206ftSicObipoPqeQkzd5KIK/yej56wQ7p3Vees+yvOReQQTM2OUeEXxpQk
	 Sdsmwe/t2hvMkhHX5wgkdYtPCFWYu88uYg+k5ARobJ/fqm2G9JrUGIwM/51PKQn6RI
	 u9MnwOqzWpTn+4HSowLJRQsofagj/YKyaUh+YAK3pBKS8hLmN/KLUe9uYjGhBJkYcS
	 kl9Ti/UpbiUPxjhbMQkX/n6co7qt8yUTfuYH98yfmFpDFCibC/lsBR0hwbS3/jLcw6
	 SRg+hJ3dZZyaJq93Y0u7ZOR2Sb0mjhNrRD2gt2nRXpjbaZiMBRh+DpTJMHA2jrT5Rz
	 C6aXk+W9yb00A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F29A9C53BC9; Thu, 28 Nov 2024 00:19:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Thu, 28 Nov 2024 00:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219532-208809-bwxHKDo9EZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #6 from James.Dutton@gmail.com ---
It might be dealing with a buggy device. My question is how should one do e=
rror
recovery here when xhci is null but the function has no error return value =
as
its a void function.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

