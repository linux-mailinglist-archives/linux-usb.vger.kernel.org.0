Return-Path: <linux-usb+bounces-25146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163EBAEB2B9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 11:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8FB188F120
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEB7293B63;
	Fri, 27 Jun 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNBuCNuh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCC23F271
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015841; cv=none; b=dXjk/yNoJs/Cv7/tTpr+Q+dEzy2AcEkQnyG7JAtr3eht8zHw2OB9Eq6QBWowdpvLhuQ323TD8/aNWbPkbV9Z7g9dquUQTRJIQzZtjq1ntmvDl9UFFlARdTNbEituSEaHzkJYghQrTD1CidnfdVIs8+ghrO8Jz1lewrLgcb+N3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015841; c=relaxed/simple;
	bh=GmLWioOsEeva71hY724ASnDxN0IAExZQu7DAFkMg0VI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVtRzvokTABjTS6vSEz/GLvJoWWvIt3qyk/MYqymUzkhcCty1o4HU1IphmxbpAjcKuU8zjb+nyJJyOicSMnnO1barAT9ljVWdwx5jPzi9Ov4c/CfADCqYLXl+Z0GLB7RErI3+1YLgLiab9xGn/vWjTvxQ4VNUoPBewW3E/DotHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNBuCNuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B129EC4CEEB
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751015840;
	bh=GmLWioOsEeva71hY724ASnDxN0IAExZQu7DAFkMg0VI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BNBuCNuhYZ+rtQ3gzKMJsDW9CKQpzvwB5trlLY+pSrN1Yvww/dFBQBVO+107qsfMO
	 /9Gqx/y4NxtaIYnSdAYr3KSMuM68ENSYQYeDHEfClmlrT0/ps21pEK7+BP1c9BQBdS
	 80+nOy3Gjzw7Gk3mTHdGcsKv3IrkbK+dEVawCcIwNEGaAljfpPBgxzrnkLi/CG/dc3
	 ei+1IsLI4nTDjI811hkatLSFSWpB+PiNyIRLUUXTHEXmo8muSIWuWun4KoV8ghyuwr
	 LOpggqfKbuKEz90DdWeUsrtbI6lSSsEejSkf+zgCifSTgghVQy1ca9qMqMTIBFSasR
	 nkVXW8YtA/MaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B5A6C433E1; Fri, 27 Jun 2025 09:17:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Fri, 27 Jun 2025 09:17:20 +0000
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
Message-ID: <bug-220272-208809-NUxRsoaVBg@https.bugzilla.kernel.org/>
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

--- Comment #8 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308322
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308322&action=3Dedit
AI Analysis of memset_64.S and xhci_setup_device in xhci.c

Thanks a lot Mathias for willing to take a look. I've provided an edited
version of the two Chats with Gemini 2.5 Pro and openAI O3 that guided me so
far.

My comments are formatted as [** ... **].

I had not much luck using

echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control so far=
 to
get any meaningful output. I'll try to get it to work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

