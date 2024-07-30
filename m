Return-Path: <linux-usb+bounces-12649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C2941F4F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 20:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD7041C224C2
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 18:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB6918A6AE;
	Tue, 30 Jul 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLFkkqC+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DE1A76CA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722363259; cv=none; b=OXEY770oAxYyz8QYBH8NTBQ5A3+TMHA1JJijINC4g8nSi/rvHb+QFu4eecAJNG6wzRAMF5+My8jX9W2aiQdtHUgpmRXXHYz9EPxuugOEG5/+6pCo9nu9PoeOy3CPOqJf9mfPTrZdiS/DJBO4CnA75xgrJUdnTu78fDqY/w4ejss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722363259; c=relaxed/simple;
	bh=sGrsTaE/ddlaXQkbqVjO8G8Coqx9bpSN44PMkDoAn1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYE9KW4iquSHCXV7eHPN2Dj6+lrTxJFY0IbdX8z2XaHl1G4zdcFLwn+IQBfxY2bvr41OP7veXMa4D4x5jPJojqs0UF1gFP2BjmsSrawgKIOGMfFpiKwUR8cxzJCaI9UJwitoMvWRQOBHfhp6kB5jHRUKV9tbz8weKZNx4tkLV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLFkkqC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED25EC4AF0A
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722363259;
	bh=sGrsTaE/ddlaXQkbqVjO8G8Coqx9bpSN44PMkDoAn1E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tLFkkqC+K3QRUJthUn3kIOMwRqECWf1BuPPnA+nPY7gZ6JCQLhZr5ipPqbpN0jhog
	 E67FIAU0dZZWDlhN3+AqZCcUmdOV277mXSbo/ITtr4nI+A2gzBEdLpaCcYFtypXpfa
	 ufoJAMFOHoghLrNzU5CrtVcuy4bi2mAVAZgmO1wyEMhXU6yt7MRzHOPBioqGENPc+z
	 KxHwTUbO+q6xL5TKOAmAFabl+48xTZvaYV4Ip8RYaI8xg6/fV/fqcQVNlthqk1W61u
	 /QqH6DZk+wZ+2lzp//ct8dSuhn2zC93GBlrtYxp+dbdVJIXjHe/N0m4T8GCe2B7eip
	 XjBxdfHhnTimQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2DEBC53B73; Tue, 30 Jul 2024 18:14:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 30 Jul 2024 18:14:18 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-N16WHMgKJ1@https.bugzilla.kernel.org/>
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

--- Comment #2 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306640
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306640&action=3Dedit
cat /sys/kernel/debug/usb/usbmon/1u

result of `cat /sys/kernel/debug/usb/usbmon/1u` after device is plugged.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

