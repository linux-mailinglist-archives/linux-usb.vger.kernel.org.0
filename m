Return-Path: <linux-usb+bounces-25008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7DAAE3BAB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 12:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B5427A172A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C412238D52;
	Mon, 23 Jun 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGhUjY1k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F342A1C9
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673020; cv=none; b=uHG50fXB845vfR+w115pa+gHygKjYL933A2khzap66zCPVw0EaR3jOHWSvHBB/+YPF6BRPTXM4ukWjTt2v4MZJQmKrAixmf/ILto5YI1DAq8i2BVV5B54VjkwyZGd7vcLhJdkG7JWcN0uslu8AZFoTdbiykmV991dfAGZY2AY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673020; c=relaxed/simple;
	bh=I+M7TUhtzJ9+SVQTKK7IiE8oi+zYF85RVW31fCqoxHM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NkBiwSLeAK3SRYpC46dPxQwQkyE2sZHZufkfU9fytM84fmQxdxS7J+Od2XtOGfDjraHk7DhfRiFSCDSZhkQ/TkL8e2zn/lyBVd3j+P+McFUenWWOcQ69S5WG0+UfAuWbhF7ze/XkZ4WxO8qX0KjLvQHEPPcT+hWLKnovo2PF+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGhUjY1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E488C4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750673020;
	bh=I+M7TUhtzJ9+SVQTKK7IiE8oi+zYF85RVW31fCqoxHM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pGhUjY1kxvhLM4qqu/5QyB3NlBEGujcENHJVMfSY6n7NGVR150i7o1Z8eJaplRoq6
	 OnTbzqthYwwL4qdj79KtzHfWdw3XHVk7bM5/Mg9DkW8iN6xTmfLLbmWGAiAamD0sa2
	 CDBQTg45qv899m+EJiiH9AT5F8Rbrpqm2ra6vxCdh10MNL4A/bP1iALjgLdqVKBJEn
	 OFP2vwtWQ2sViT5pcRAwC54szPITMhGGxFk4VgAA6G3brRuNQgrrn1DKi3tX+PjsM5
	 gUBLKTm6FPspzj1KiAmE/SjBC20AKMeMHqAzzyQE2S0vjSbrW7bnzIJ9bDEDx861Y6
	 zeMHo1tjEBQpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D478C433E1; Mon, 23 Jun 2025 10:03:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 10:03:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-PhGLKJCyLu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #6 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to Oliver Neukum from comment #3)
> It is good that you have found a work around. But you were right. This is
> supposed to work.
>=20
> Could you please post dmesg of working and non-working cases?

I emailed you the working state to you directly because it had a MAC addres=
s in
it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

