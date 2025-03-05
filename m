Return-Path: <linux-usb+bounces-21404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE5A53E8B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 00:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDDC13A5479
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 23:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F9206F2C;
	Wed,  5 Mar 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQ7imk+X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E361E7C20
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741217719; cv=none; b=AdR1vsdaIV61nsOAq3nVVdSYsaBBNJxZfkoSlnsfA+gQ053zR1+mypICl78QJNeqg+jvC0sdSamP+xd/fkFssOwnAFwoHgNRqsOMCKQOEsqXbaC0yRDEIBIZg0nt89zjvNEq5ooKxdOzkwboF5TKYbMftb14G21ErqaaIxcr618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741217719; c=relaxed/simple;
	bh=XwY96T186DnSWXN2uYyN1HjZ/49CvpCKixo23ax4334=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQ4qCIVK/4gFxjOh5cI9JY7c5pXI3MaMeOMHpR01vPnBlaUOKIv8e8OL0SnyzUt5wQh769vO2H9CXE9Baio4nZCSOo3y/993oS01ZgMC9ZhdBwX3XHgtJtq9vpx2hixdTtU3xwoNuc5bu6Bu1SMsJB5jmpSVS54yzKlGp1zxBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQ7imk+X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AFAAC4CEE8
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741217715;
	bh=XwY96T186DnSWXN2uYyN1HjZ/49CvpCKixo23ax4334=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jQ7imk+XR4bmkqrzb+oNo6OTX7sa/w5STwmGYnuu3U1K1xl61Kq8fCjHgkwm59UGr
	 LzUKGaS4tNIzN2KwZceIfD4KCsSsSs6QHtN6FaL83iIxm9C651BlCC5rv0AlXILPHc
	 8dLTs74zuOuOxPldmm+X/K35VM5IJcU+5RuEBJCa1Un8CB3LN7wqdcwf6waLk93/RY
	 GP6eDg5hBFRpHT6WqjX9WqceaAn4Bjzmot/pT6P6M/LrvcccbzmYCkftiXbV63odFd
	 aVjUs5eiboTzcW79LbAL9vxVsxp8y/WWL8OnvP1vAJbV3H5aJF4rppiZe6TGuMyU+0
	 rLEfh4nbi0pxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D118C41614; Wed,  5 Mar 2025 23:35:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 23:35:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-RlPr7an06T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #27 from Thomas (lyz27@yahoo.com) ---
Created attachment 307774
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307774&action=3Dedit
dmesg showing no r8152 network device afer 0001-thunderbolt-Scan patch

This is the dmesg that had the r8152 network adapter missing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

