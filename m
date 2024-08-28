Return-Path: <linux-usb+bounces-14251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 612029630CA
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 21:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167E61F229B4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA681AB539;
	Wed, 28 Aug 2024 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz/0SxyC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172831AAE0F
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872473; cv=none; b=AJ0xP41Js7lOfuwbz4vXNVi1lm1cLFdv83Df9CVrui1XBvawq4jPHFUPrXFgpOabAp4z4lf6lcL/qmAU8xhQw6PGiS/yZlYxV1wpWfofqAgI/yPPk9ef2wJ2gyed5xnEs4YC/0X2Vkrg8daaIKa2dAaBlbKcrSvYmViwWqOxMds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872473; c=relaxed/simple;
	bh=GlLxjTr5yL2C2J6zxfhPTjZsQRIjW0YkPWmMZjWhPSY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6QDnToxDa2l9Cu0Hbfr7emBo29vClh46im6UKCE1811RxtoSG71HUvPq3wfG4M6pjy5iTzUilFLVVaU5PNB9FUFUgH/skq5Vx/xVyJfWk191n5ahkLFl206CmphGMYNbS3AWdfv3r18LFfIefmId0A1bPGR/x/xtPw+3K/c4OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz/0SxyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A21CC4CEC3
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724872472;
	bh=GlLxjTr5yL2C2J6zxfhPTjZsQRIjW0YkPWmMZjWhPSY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nz/0SxyC3Gd/EVczeSE2VU/A9qiZODeJO5G4yi8cb9G1y6fy/UE6SPqiB2Vk5/JB/
	 CdlgT2kEU5+md9d8DNCNFC0OruUe/2zQBmqeWvvPVDmKWF8Irx3qzw1D4mlWiiHYhZ
	 z1t8LnX8yxUQTZd4jP1m61cXe3PsFoy6+q2SQAkwg5YU5/RPxaGJ5BSw7csHayM6cS
	 hffeZdHRCmNaIzNPK7NeboDGJkgAKWED1s04pamrws3EjGpm03U9wfi1e43IXQSeQx
	 3wzUtBdK2x/VmtMBh/q+sx4x/PN8fGhU0K31bdkCozo0bp3lEvbRdEz1Iz40J/7/rI
	 dHUM4sT8OZ+4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 808B6C53BC3; Wed, 28 Aug 2024 19:14:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 19:14:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-2fRx1djMPH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #23 from Adam Williamson (adamw@happyassassin.net) ---
Paul: do you see the DMAR fault status log messages that I and Markus see?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

