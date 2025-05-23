Return-Path: <linux-usb+bounces-24261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86741AC2B7A
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 23:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F39BE1BA73DD
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 21:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A88204C07;
	Fri, 23 May 2025 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys79iyzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC10819CC11
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036651; cv=none; b=uLXg/f4foNsbZah0PylQ9HXhPhVxBSxErHbrXQ7NuJYNTbMM0IFytDx7B5CuVssyowpi9AkuxqdM5/QP7byBgOKz1H6+8723ENhVilzw2td6k8YAvDJ59pNhP1cMeEHj3L2euU1OlBnAmMd6TyOZVJ+Wj4akP7IdqVw2dZbAZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036651; c=relaxed/simple;
	bh=vL++EuCUvDO/Bjo5IsQ8iNwT6pHwHIw95piaqqCSKEY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E+Kp+nLWiccLRMuBt9wPTWh3gMptJCU/O5AVwfn7F3OxswrJfRxWvbxvZVcrGuNLykaePBUqQLPpoAOH/tLa02Lh6+bNti6QSPcuP6BEogtbFiNkcchs/Pi+A5W7sK55RqgXub+krjj6sgS5egcCzoIR/vTPqlqh9Bsm/kIxGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys79iyzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 298EDC4CEF0
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748036650;
	bh=vL++EuCUvDO/Bjo5IsQ8iNwT6pHwHIw95piaqqCSKEY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ys79iyzQUOSuG+gUwwH9k4xMPwNDr7Kb1mCOp4UysZ++XRA9fHeKqf2FBEghKaEIW
	 mcyE+8h/QvrwkPGc5sUbGRX1LxV/1z3i1J+KtNzlhs/yxOA796cghUKCEnxe/UR1fg
	 zQnJIEa9M1vKWWZGf7z5Vw6h3R4birtjFnUw+W0q78z99aIJFvQ3fc7RMVk+Q6jyO9
	 gxlc+OpVYtOgeB2A/l8wfvinX6Gn6wf6KkfFeOshhdwS4ymfuZsq/plHVhgl9+5xvg
	 1GLkQvLiKbC+QYSf1P5YoIaTvMagPDpSUaaDQY2IGZtAu1zBCsyutTEe7+ORHrBVd3
	 v3vwuBx2mE0WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22D5EC41614; Fri, 23 May 2025 21:44:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 23 May 2025 21:44:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-G5i1PNThk5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #62 from Claudio Wunder (cwunder@gnome.org) ---
(I'm also still pending on making the kernel changes to verify they work)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

