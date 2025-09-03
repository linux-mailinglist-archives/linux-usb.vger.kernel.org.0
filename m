Return-Path: <linux-usb+bounces-27511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA72B42B7C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 23:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07750566263
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 21:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396902E9746;
	Wed,  3 Sep 2025 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZVk5+qp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFA2DAFDF
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756933474; cv=none; b=RLpD8+dWLlPNwW9Z3NhdAfOVcseq7WIN3BJ14fpl/xjQGEYnDaynPsX0Uvky/k9NFPuGwQqDjArCjoPXhEzZdUCz+LzLfyEcb0uybh7+L0qhF1y8ryV+0Ddq6YxMBp6fhk5Iat4734EpYZya5YV68Mt4RDvxIQlFrdrRffCTH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756933474; c=relaxed/simple;
	bh=lG3K6+/KXbVi7NmC532aXghFo+jDKB1FHYAy0DNUUa4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PU4iu0ypj53kh1ObFqw3kfwTMC1FZcXnv8XYLLSXPJ3rjczatICP1zK/U1/vDb+mfmlSn2yBX5pgraP5mObtoVmBdLQQbSI6edzRKk/sp1JGCaL4kgHQhNiykyklV8e5cG39pAazhTLRZGSuM+mn7osYMO0Q6ujzSZnEV5dTrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZVk5+qp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4450DC4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756933474;
	bh=lG3K6+/KXbVi7NmC532aXghFo+jDKB1FHYAy0DNUUa4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PZVk5+qpZBgCBz1EJjdIz0M4ZzPKt6hpSSazmNi5Ji0OTu8OesQCccDJAs6CkFBPr
	 iDviWarkifrM1RCUa0PeHXwhhikyujDwk+KGD14j4mPQcGnhA9mQlaIms6Dd3ehDzL
	 dLr0gm5HZ743V64NKl2vRSe7ARvQj5h0V5rF9yEVVsknITL5Sn27bZywixzPxADuPU
	 GT2Ihx7hytmCt6ziLKRoqWwD7HM+TNFsegXvaXduczOFJ+jCCM+XZeXM4T2nr1LzZm
	 +rcAPX0ChWpE9N4lV+dagGufjL6mTzEJhE7OLCQf7nBwVqACNfphi1C3Wpm2lVwBCC
	 fuLxv167G9rZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35C65C41613; Wed,  3 Sep 2025 21:04:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 21:04:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-aGevTR7Bv7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #30 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308612
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308612&action=3Dedit
usbmon trace, emb-qm77, S/R, actually physical disconnect while suspended

This usbmon trace is from emb-qm77 with the USB storage device being physic=
ally
removed while the system was suspended. There is quite a lot of communicati=
on
with the associated USB hub but of course no device communication during
resume. Note that there is no device communication during suspend either. T=
his
is somewhat unexpected to me but perhaps it shouldn't be.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

