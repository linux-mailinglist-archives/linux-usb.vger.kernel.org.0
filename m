Return-Path: <linux-usb+bounces-15867-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E8995312
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 17:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6161C24962
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957001E04B3;
	Tue,  8 Oct 2024 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ng0umqmy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BA1E0084
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728400510; cv=none; b=mxMS3/IbaBPFG323LHUUQRcq2at8g0jK+b+M7tLkWypOcOSCRD3tDWFfqx9zXcUBxNrvbr+Qg/gFxbhDRt9VyZgA9GL996Dma16Z+WFRjnUrdTUgfgRW324yozc4JJO+aKNw4t/JD7sRZ7iMdzLV2UcXBCP+MPDaRCsRC0wmlBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728400510; c=relaxed/simple;
	bh=eaWAXtlGc9sF0Nb+UAHogJIPDNkNGv6AbLpkoCU60tU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RIG02C4PLIuEZ0m/e+G9fA8ep9drzb/TCGulVgXOnoAqqaBCDKPwYr4NvzuZ7QPgT49F0N91T1pRKD3RsyV4kbE90mCFKiHEzbyLToQrPhUgeHf3IIS1cDjsKwAcnx8fXdNM39/aqc0fydTDFZh2KnVj9RsRuYNiYZzgoEJ5JaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ng0umqmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88DECC4FF0B
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728400509;
	bh=eaWAXtlGc9sF0Nb+UAHogJIPDNkNGv6AbLpkoCU60tU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ng0umqmyj5P4iIVAWCPaRIVeiuV2WR14aWJ9ukeOF5rkAMuCklCysgB3YDe0K0RJD
	 lsmUuDqjjlYjQucr294ELOGTVG6pmNdlzCxqh0licU6pwnPme2Udm5K/6kdZMKSMDT
	 3rzzD1149jTs9umPeBPX/l2/oTgZGL/F0sa1or0LNEj3pOQkCC+fK+ZKZfVmtQPESR
	 1E9XsiVQ2GnsTE7a8UCQ2Od5BkJjSyz55/Ya5ruVJtrsxyPahIV7Y3zdpbLkzNuWSu
	 ZaQPhXgqGmA4dIbFJGiR3yIEo6Sh+2MNs74UiVYMZvUY/u82HTWzVWeK/f4Rc+EMvh
	 EK/QyfOC5VrKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D984C53BC1; Tue,  8 Oct 2024 15:15:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 15:15:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-fnWN7wZZmR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #7 from Tomas Mudrunka (harviecz@gmail.com) ---
what is the point of having 'u' and 's' keys in sysrq to sync filesystems, =
when
we're not able to sync controler of underlying harddrive?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

