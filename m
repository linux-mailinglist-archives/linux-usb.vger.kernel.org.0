Return-Path: <linux-usb+bounces-9304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD728A285E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 09:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557C22870B2
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 07:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8464C601;
	Fri, 12 Apr 2024 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uC4cTHAW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FCB3218B
	for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2024 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712907631; cv=none; b=bl5xxaCOByPl/FzUOuIv0qBykTRu5lMEU3g4OeY4j6FX9F2uDQuAknXXgOC4NTjNwuEETKFqGNwqtfCDnGoEOdx0I60rVxUFZXFKe+8koVen/50GeU/8Z92DkRuvj9Xx6WKO3KEFZm3fH8fGkeatOfN8gOTCHUucuLCDcQEagII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712907631; c=relaxed/simple;
	bh=9aqrOWKy8Ld1znWUUj7a3Nh3ZyhNKBpNtUrosi23MD4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PUIG35OQ7FLkizLy5yE0nW6yVkJBOIorprgv4fSYUM8SBU39PUMas12zle7Jau7jT0IfYjr8LP2dfGMaT+ZkJ2wD28FeyyOXOhP9EZvgDtKvD79ix3WlrqG9ot6GuWHriHYQdOugyZmnKvPOST/tg38HLB2HeFoejCwTeNzhL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uC4cTHAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90A10C2BD11
	for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2024 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712907630;
	bh=9aqrOWKy8Ld1znWUUj7a3Nh3ZyhNKBpNtUrosi23MD4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uC4cTHAWRh/4QP3VuHjHqUOCjbWdmiWXL+jzEEBt0YRX06onSIozVbbyvh36XYvTW
	 4Tz4+arv7QWptYerAul4zmFOUw3xaCljn55glvI9tHoLU0dUmIAlgRBB6TdbUm2gMb
	 L+c9cbNQLY+O9e9Co1Pnul5KjOZQtw4UzckNzZiuopnXkLR8gUqOwmWzQBNbVTr2x0
	 HcydnCyC/S4TewEwN7UdRGS1U5r34W5+RMCdmANu38ACh4hMXm7+fiMPAAAHhHKntU
	 Qesydud0xNGWPn0CxnK1RtdL38Gi/ehDp+QHURTsgTavngFL7H0AlbJOkFI2ynPoIC
	 44RJhXvLNJWVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79E9BC433E2; Fri, 12 Apr 2024 07:40:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218695] Datadump for error `ERROR Transfer event TRB DMA ptr
 not part of current TD ep_index 1 comp_code 1`
Date: Fri, 12 Apr 2024 07:40:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218695-208809-qyYpz1XYzU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218695-208809@https.bugzilla.kernel.org/>
References: <bug-218695-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 306135
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306135&action=3Dedit
Output of `git grep -l 'ERROR Transfer event TRB DMA'`

The Linux messages collected by *Hardware for Linux*, dated May 9th, 2023,
contain 287 probes (uploads) with that error.

[1]: https://github.com/linuxhw/Dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

