Return-Path: <linux-usb+bounces-23467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E614A9CDC4
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A001D1BC14E4
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 16:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6C41917E7;
	Fri, 25 Apr 2025 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyodOqke"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEE189F20
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597139; cv=none; b=o31ObgANXD2DSPWtHyyx2uEZ9xRPkFtK3P2HLhhArMAyjN5A0wJP5ZAr3dBStiOEbxPSijxjEjgggxvzfzMUs4Il0mHMp8Yn7CB03qJ/DYHk0FQ56BLzaVwtvCofFH1Dvjop+HJ770EziIUmtHuQbfA1XEGZ/fedl2aUS0YSEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597139; c=relaxed/simple;
	bh=G/m/ntNgpO4/bZLwbDf2V4ukgI1am21z6JJJBy34KR0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdxn0END+KOFGZ3dXtCT+XCLgE4nWnvex+Hg91W2mvgRmiplSVzG8OqZ8ZPJc5XhLLkhwnwgKz0IPHr79aXI8uDCsrHouC4aI3hNlL3VKK9puVlcH863Ap2q9Rm+WxBK4Xsuxa2FLERnVskaR4UkDE3e9XlHE0UUzgz70Wmk4kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyodOqke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE0A7C4CEEF
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745597138;
	bh=G/m/ntNgpO4/bZLwbDf2V4ukgI1am21z6JJJBy34KR0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cyodOqkeXS07EWQj6gDIncenL6Gqx9zeFHKAAVDYwOY/WAH1JyA7dZAUhuzttCE4J
	 NdUsYKjcT4qSTD/+q9tpM3pGUyv/FE7OecXgoYEn0Sw85O/HMiIEKMw9RsF4YAaDqH
	 dBZ1rs3E9BPF+UfzHkyCjj9D8CwT3LH1XL5Vf9Ye7zIKvyA40/eZvp7tB9WGkK32bk
	 vz9PXqwyw1N278slWyrmxlIXmg2f9befGUMsYwMUt6cjSTj3Wsw15vFmDXv/R5mVIQ
	 DjC4/Qlf4pz0w4CHt/UOgZFwQbq+ActZ/jIeYnwOY9DHAi1MsnK3NmiWfSiaIDMxJ7
	 YymfY0e6CE/9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2F20C3279F; Fri, 25 Apr 2025 16:05:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 25 Apr 2025 16:05:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilpo.jarvinen@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-zmtzjn2Nuu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #24 from Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) ---
Created attachment 308020
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308020&action=3Dedit
Add min_bridge_window cmdline parameter

It seems the FW left zero extra tail room in the root iomem windows which m=
akes
it a bit hard for pci=3Drealloc to work. It doesn't work well with the defa=
ult
sizing algorithm that is greedy and tries to reserves more space than is re=
ally
required.

Maybe the attached patch helps more devices to assign their resources:

So please test with pci=3Drealloc,min_bridge_window

It could still leads to a failure or some failures because it seems there
simply is not enough space to fit everything even without pci=3Drealloc res=
erving
that extra empty space.

Please also add dyndbg=3D"file drivers/pci/*.c +p" on kernel cmdline to get=
 a bit
more information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

