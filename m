Return-Path: <linux-usb+bounces-17850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645A9D902F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81664B24392
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 01:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563D113FEE;
	Tue, 26 Nov 2024 01:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjNLbECJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23D01AAD7
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586168; cv=none; b=XNYqCpqA/UDIssBUVTq6Mgd9ufeSIrD4ByFNofxlYNMBfwhCP/2z+t+Rt5NJucbT5VlY+Alt2ob2yAjIth4qheWrZ9HKBCnTHm4wu6P8tXAHv7NlQtyBqkjNVnGXxSth0zHUPdcFE/OraXCb7jObQkfOUkwvzBRLYTt/T8k9wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586168; c=relaxed/simple;
	bh=7TABx1BnW5nH0vsxV6dSxd3F3hcEur2LpV8gqBruvAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HsXl4M7DOzt0FINg563gV26S9vTDcpCQ7SQCNokYWHGX9aTwazPCxNkBV8yl1PrWdpFTqEcZAo60uPlpixbQJbneiY06MmUruy+ACIfnJAYHxjRRZ4tIZomgVWoH1spDgeb9JR10BjNYe4M5RS3zvTUZpUFFIxVncaYipMFSlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjNLbECJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FF6BC4CECE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732586168;
	bh=7TABx1BnW5nH0vsxV6dSxd3F3hcEur2LpV8gqBruvAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bjNLbECJ0xSkD5rHnSP2NuObtZifU4iecDmhws4RMk4GqQf/6Ubrd07m/gaFopAi9
	 05RmcKeS4uiN/5g5d99/juI7VZEsFUNTOCzCJi/7az/HPEQnyfQZBycSlBY11uF/eN
	 Fn0WlhqzN9jvSvxQymD1hbKVUcjqNh2xA0yWJSh3SVm7Mj4EOnwLy0b1T1fViEP4+Q
	 ji6PwEPs2FKVCUG7w30rgTR9CbtW+nxSm47iu7c51rkBW37uysGiYgY+oMJgIMPrh8
	 NVVX1dRJmHVyNDHZeaF00rMFkeMJZunabHEgFqcnR96P/KzV4qX2RCfKIW9uu0Xp+z
	 EeawyIzLBWmiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67884C53BC5; Tue, 26 Nov 2024 01:56:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 01:56:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219532-208809-Xdbs48HjoA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #2 from James.Dutton@gmail.com ---
Created attachment 307281
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307281&action=3Dedit
The compiled xhci-ring.o file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

