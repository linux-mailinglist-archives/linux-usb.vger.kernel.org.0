Return-Path: <linux-usb+bounces-25693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640CB00D5D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 22:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 569377B625A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 20:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFAA287265;
	Thu, 10 Jul 2025 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WX6g89nN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D8E1DDC2C
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752180365; cv=none; b=W1YO2s85kFxCIVX6NwslC79K5NZ5UiGifPXekRZaXCWELzoNEciOcv/pfSIIz77QRmS9KTlRJz3NR/YpefKKDutADXMYj6u4GZaVyyfuLP1woTQIwNdEwoCARi+CB9YsuFwEAaBmpSE/uBXIfK62R313YWkbiFLLxt+7ErW5tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752180365; c=relaxed/simple;
	bh=PG1j1fbsRZvtFzXJSistpi5F0pYcs5knDgbYFMTVlrk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMq/gu4/GJFXSXJRn1XfzN163DWj0izrh3018m/QVg86/qeA6LQsP+MHDTxRLSgCGIEzatB66R/kQAhIeR76KHIVrYdBLQmGmFnjCpcGb2G0Y9yyZbSddQGRj35hmL+6AonnLJdngM6qcqbnlE9iAEXMS5ee0ET7yj20ParEi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WX6g89nN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6111C4CEF1
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752180364;
	bh=PG1j1fbsRZvtFzXJSistpi5F0pYcs5knDgbYFMTVlrk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WX6g89nN1i5jc0VwozamkUv0L4t2iiTKW1FF2pFvIUHa2ArmvB+JXAIdMvRvUa3PV
	 qjz6CrP4/9gKnnBNZXHAJgm/v39Ln2UflcNJdEVgRkOnGtVTAoWjPl/Lgw3wgNuIEl
	 84kJJ2R8u1gaK5rXvo4JA2I/9mjsu0wiyeXO/8LmookuB3s4qD3XZn6iwwgks0och7
	 Z9KbjhYw5DqnxKN3fz4/sN9YHPJaorzyVa3f1/Ohn/tclkVMDI81pPb8cD2ml0Jtfq
	 YeyXbCZ6BNkRrQ1j3FUvjjCKb4SuaiQphb+szI6GIpcKfYMc3a7GWuYkW14iO996hl
	 BWDkvG3pdYbZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C770CC3279F; Thu, 10 Jul 2025 20:46:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 10 Jul 2025 20:46:04 +0000
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
Message-ID: <bug-220272-208809-R80fAtgfFi@https.bugzilla.kernel.org/>
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

--- Comment #30 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308369
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308369&action=3Dedit
Fixed memset_64.S

I've tried out a few different things which failed during the past week. But
today, Grok 4 found some issues in my custom memset_64.S and its fixes inde=
ed
fixed the mouse issue for me. I've attached the new custom memset.

It claims:

 * Corrected feature to X86_FEATURE_ERMS (not FSRM, which is for movs).
 * Fixed return value corruption in ERMS path by properly saving/restoring
original dst pointer (root cause of issues like non-working mouse on boot).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

