Return-Path: <linux-usb+bounces-13282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9894D37A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 17:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E92F1F23B9E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A3B198A0F;
	Fri,  9 Aug 2024 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYrNQb9r"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511E198856
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217367; cv=none; b=kMOObgPHEGOaXfbuElc+KyHVaDHhMNBEkTdZF/ZA0Xt6XPPdlOi30dLwUO9YE6hK4uYt1i9zH+stjgSoIpFk2mt8d8oPvgafFJJLGN0vH2915ySzPncnKC32avHrJME2McZQydTICPd8+paZnZA9qAMUJByEWbMr3Ax7fRLa/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217367; c=relaxed/simple;
	bh=QPL0RKYDBcLU2+3fHTVcplyySjgwzUH8l5Em0P0byCE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3aXffOO1HuyEEqYF34npz/++TMK4FyugRfrcRjv/O+yGKFTu8a4CeYrehycwioRelt0gl4wtTsqcWNSEgyijvVWFwJNcpvzQHd5Exgux9r1z6gXcHOKCLIW+EOv/v5qRcEgw8JIDw+9Pw9OxZwnKIkQNmTL+IeOMucFXlGV/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYrNQb9r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F0CFC32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723217367;
	bh=QPL0RKYDBcLU2+3fHTVcplyySjgwzUH8l5Em0P0byCE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HYrNQb9rMjggpWcNB07dSomp4hMiJn48pDnrCpQhkdM3plMiJVtgChkXIl2h/8T8N
	 XTiiYoJ9rj1bO7qLWU4xiWk0DfbEtI44fh9yslkVCkQzFXztBPcHUZkHGEt41S6kyk
	 upagtYYc5ZAJkRU6uLjyUsYlsdVPLH/lR1mLFl84AeKi69P93jV57ohaMtopEk0ZEZ
	 9qBgNgQcQxuYOjvRNNmJkJvObf0F2ANpIP2x/70G87eNuDVvzf4R59IGJvW04zdBTm
	 mzO0+4HF/ZusfSlvTAYM/yglojWth+Mv5iYOzKBgEJD0DH4OPIl1yvMHsDQNQS67/M
	 7QO7T23WiL/MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E401C433E5; Fri,  9 Aug 2024 15:29:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 15:29:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-utp8FOtuqz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #48 from CH (com+bugzilla-kernel@c-henry.fr) ---
OK. Is there anything left we can try to improve the situation without
resorting to use the `usbcore.old_scheme_first=3D1` kernel param?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

