Return-Path: <linux-usb+bounces-23671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2287AA8212
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 21:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C070E1B60B46
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 19:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0241927E7D7;
	Sat,  3 May 2025 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcSXFQ6T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8D2DC789
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 19:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746299370; cv=none; b=khXzO3ZOFWrIXmEN3kAnXaOJZ9RQmuEechWRJr2b58cEjiOfxWlH0FdPWzOnVNJ9qxP/IZ0XxXNvORMhix0ghbs6Xe0FKJARN4vnXkI8r87wQi3RUWMKPaOb3bvYKTR3ZnVJfIvx47fVLLdZBZXKh0xVSOWPXbjbIwdBIsrcZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746299370; c=relaxed/simple;
	bh=0hAMt6kSGFfH5LszHF9vfvSqSzLvs9dzpAYMjGOJocQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqRGGZUBV6c2s4BRAoZ4drMW3i8OnCLTknLTqmqGHFdN9Tl08HcxLjip2L+TGqulQ3SnBIOIvFXID3PaipsC/QSYqorOL0WQFrguk65EsrRkD8pB8jDzBZMGz1p0y+hmqoBu9BRyFQbriigRIekEH8fFkA47J/EUzCvSHhGuoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcSXFQ6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB8A4C4CEE3
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746299370;
	bh=0hAMt6kSGFfH5LszHF9vfvSqSzLvs9dzpAYMjGOJocQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AcSXFQ6TsZBay5idPhmfXTWHn4gc71NKZdxlAhctfA7BSTca/okplSWwa2xR5gjvL
	 WHdb4bjAetExAz5FqOHJZ10TG8d0LxRRCuRii/vb3aXaHjJX3PeWjydR8dP9/d3wfO
	 3WF90xcK4Vnl19qp9yqENDp+op6NiZBEYH9AfmsVIn0s4a074FXP5emacuI+9+/2y7
	 SDqiya4I61VYsTdx7aRKDxkWTJzSlIQC4n4YIkpIdbqBflRnsh0l0eLGaWS/8VxIsW
	 ZJg8GtrhW4C+Esp2QVJzrgEcan7oRUmN/6X1kCLkTRaFUHBKfb9Cy5UxogoFMo3zRX
	 f58tzBLsGRsCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEA2AC3279F; Sat,  3 May 2025 19:09:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 19:09:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-wk1PJXprjH@https.bugzilla.kernel.org/>
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

--- Comment #30 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Sorry, I'm not talking about those device numbers from lsusb - they can cha=
nge
on reboot, suspend or xhci_hcd rebind, they are not reliable.

The only somewhat constant addressing scheme is the one in dmesg: 7-3 is a
device on the 3rd port of bus 7, and if 7-3 is a hub then 7-3.4 is a device=
 on
the 4th port of this hub, and if 7-3.4 is also a hub, then 7-3.4.2 is its
second port. This doesn't change until you actually move USB plugs around. =
So
I'm referring to those addresses from dmesg.

If hubs can't be separated then fine, start with moving the webcam away.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

