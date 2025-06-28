Return-Path: <linux-usb+bounces-25209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A004FAEC58F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 09:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0CCF189D83A
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 07:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923CD22127E;
	Sat, 28 Jun 2025 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jntkWmjk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F621B192
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751095335; cv=none; b=Ztp2mqJfisJJUKXVCgQce9+/y6kreSQ0CbMwBJmUpaVUrJkG0iNIgnxqvrqeW2qlw6VjjMERJcXndVZOQ0Q1xLweT9jtOoI2g0sX3v7vXeIlSxBt2YY+rAslB4CfLl2i6F2n9K2be72+gb84qmUK7Sj87wfCWBTvl20DJHeGFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751095335; c=relaxed/simple;
	bh=eHN3kPJObGyRKqcP2YrHZGPDwbB67SQyrh64tgj7Wk8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qgz1y0glw/obMHgfgiSrn+cQ42wRSWu5BpWBe0JfX67vO9P9+O5VR2GwSP1hVkXGIaWtuw4eGJlkuVYJIA2Yk3jHVkZA4FMmvA3bLvlemAaaDjtUIUl2+yqV3bDjyNIjlO4J93Q4lVdPX/oh0cHWakGirKZ7RmQbbxiBlBDj6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jntkWmjk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95138C4CEEA
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751095334;
	bh=eHN3kPJObGyRKqcP2YrHZGPDwbB67SQyrh64tgj7Wk8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jntkWmjk00EqYCMxpYNPW3QHtMNAiJjxPja1sp+N6pVvmsTQ4AbE2jc5VK9i1+/9b
	 KkriJPpxEB6xpSFBTA7fMaYwOOZof18JyI/eFoTs4GjTi4blYujEKSVlYQSKhjcSOs
	 cT+DFGiBqiUzgs85/m0C5FqSL/L4aAcPWB0MJn4Dl+CIMArM80FJ68kX8t7eFkRe4W
	 QXneknTcpGjFPKBFsTN9bqYc5g6aVBTCqpbesCGNyqVkKRSJ9WpvVz2RkMmHsXVUmx
	 b/8ncRpdQew27HN7PMXtl0LLDK145u+YaoGwM8yIyelWIy7nnf66rZguELlXwL4rc4
	 Age8RqycAyOug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83452C3279F; Sat, 28 Jun 2025 07:22:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Sat, 28 Jun 2025 07:22:14 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-oheiJIbjpQ@https.bugzilla.kernel.org/>
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

--- Comment #12 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
@Alen

Thanks for the trick, these commands bring it back to life without plugging=
 it
out and in again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

