Return-Path: <linux-usb+bounces-14245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB9962EFD
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC91F285A87
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 17:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD801A76A8;
	Wed, 28 Aug 2024 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR+yyDAi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539847F46
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724867468; cv=none; b=VoSgZt6eFqLViXAkgWNdlx8ZMxmYQrQfPnRj3NVvRjBa/OMUW6foqyFFB2nLii9uGTvP1vP93sWHoUxpGt2tPq7iUv6mrMjfZE3ibQZ9efRegc2tUj/ugDpsKOKieml9dKs6lFUwlzOvZgybu5xjSnb4a0gzHAHje+GG2b4mZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724867468; c=relaxed/simple;
	bh=yu2bPEmg3aqAIEUeT6pxPZtAHujn5mpebj7sTiOTo5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SfmN/4PLCXxCIc5Ob4jpM/p0nUpWy086KjL356zEofUjzWKaVX/J0eDj01DdUnfYJ18n1WT9obeU1qfVn42hk8Zt0U6JjmXL4d6eesDqTtmJps0S1DJvyfp7cAoIhg9TdcySwO6R/Fmt3/uMDkNzM6nyp3mi4LbueUpGVrxaFQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR+yyDAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE5E0C4AF0C
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724867467;
	bh=yu2bPEmg3aqAIEUeT6pxPZtAHujn5mpebj7sTiOTo5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sR+yyDAiKST0ONbDnfUT6+1ZGuBNonvnymRz6+m4HMDCPfRj4mGewBRFNGNj0PwhS
	 PWDCgO8GeFIw0QTngJ7M15l8v5KLK40XFcPQJJDjKXXlyp68lb8xteulL3AKGUJYjp
	 tuCF2f0o9jx27IvhlThRL5+IPBkLr2wAv+x1dR2v0nldaOTK9Bs72UZLWqp7oG72o4
	 YCLCb9wtx/LuN45FgchYNUsBj++qpgEgVKHlg4UgIz28av76o1v5fMQcro+L5WcmP6
	 6fMt/ixP5EtMDScZx1H1dewH4wOLD+LyYvHdgrMLxrrv+lIP3qgDdFkeZXmCDQ92C5
	 f1pUbDeg+5+xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3400C53BC4; Wed, 28 Aug 2024 17:51:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 17:51:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-xlM25Ra48J@https.bugzilla.kernel.org/>
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

--- Comment #19 from Markus Rathgeb (maggu2810@gmail.com) ---
For the record:

The laptop I used for testing is a "Dell Precision 5570".

The docks I identified the error and tested the kernels:
* Dell WD19TB Thunderbolt Dock
* Lenovo ThinkPad Thunderbolt 3 Dock

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

