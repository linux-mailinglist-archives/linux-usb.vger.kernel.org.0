Return-Path: <linux-usb+bounces-23785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18073AAEEF4
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 01:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404A59E1B46
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 23:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872B0283C9E;
	Wed,  7 May 2025 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="regCG8mm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF520487E
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658958; cv=none; b=rqRXSKf23AssTD6LE85SCmXhyNql0PF3WgH8f/KsQR0mguYeyV2k9M5dc29hXiy8SBnAOjPR2XUayAcDr66CMMCRmOcwFtmGe2Qnb5JbZsBG1b2VHXO6O++tnQPLl2OT8d/Tgqy6M41fLF/a9BnH2yQ8B1xqDO3OqzlFN+/tAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658958; c=relaxed/simple;
	bh=zWPliWdTZGenwLvx/LqrbuW1Ls4ZZhw0iHB0ruRcmzg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HNZVeXj7NUlxL7YGEfTcsjODs6pLI/XoJsY8ckLWQ2rBRyNSAYsGAZSuEhRUELVnUhjOhlris+tMPP7cmgWDI/w7VxMa7pB6lk1+qwER1ihrJqxz3Hyut1Ha8T5Nu2D1SYH76Q4nDTDSZgfckZN2lPTBgZosfsafUSyK9gOMN7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=regCG8mm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7467BC4CEE2
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 23:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746658957;
	bh=zWPliWdTZGenwLvx/LqrbuW1Ls4ZZhw0iHB0ruRcmzg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=regCG8mm3kWWqxQdP6OzxOm2eD06l2gHLErackvaKEaH0+fAYtdvVATCbBPA8u0LB
	 jAInuMYT2Mt3WLNu+4mcebt924k032tsqkG03t3A2/aF1LfWr6uqXvhInqZKkF/xTD
	 qCdycxWDW2pZJEu2RX0iEBOi34CmD0zB2Tv0mITYwShj0KbG5QOhArznVKUQiNYZoC
	 DR+AO8lkdvP/DGcwa6qRoMyEC3j00KOJ9tR2kAc0Y7vLay8AJBU6MR31UVDNWY3L3I
	 y4k8Nu8GrwQqJ2iRaa0/yQ0D3b/YmGfnDEaFJHbDYDf1vDTIyqL7Qdwl08zNMN8kTU
	 Y6115nyZNRvSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C2C6C41614; Wed,  7 May 2025 23:02:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 07 May 2025 23:02:37 +0000
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
Message-ID: <bug-220069-208809-MTeYRLVaJB@https.bugzilla.kernel.org/>
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

--- Comment #46 from Claudio Wunder (cwunder@gnome.org) ---
FYI moving Webcam to a dedicated USB port (directly connected to a USB rear
port) at least so far (a few hours) and haven't noticed anything.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

