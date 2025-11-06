Return-Path: <linux-usb+bounces-30161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7DC3BF38
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B76189BD7A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 15:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3850345CB3;
	Thu,  6 Nov 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUMAHDmj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4193C19D07E
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441382; cv=none; b=I7d4A/13lTxDJ/BZC5IVNPMCD4MIO18+omeAC15+05bj9Fbf8vjhLAvTBWrSHKnNBhoN+8shds5X1qephR+xwj1yErOQ81FbSiIvuNRx37/26pC/WhDPKn44dnNCK/39K8SvSn0h1pshwnkTMvo5tDcA2azZ/0G0otWf33IipX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441382; c=relaxed/simple;
	bh=oZoq7mr34By0XI+pLScyNsI/B3D4pxw35H92iTb5Uf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t+TFLuBzVmLLB0d3iflQelcsn6VMSBNRY7AA4MdwzbynNsZwjGxnSLr/TYS0orF2rNoKU0JGHNaLBnK9U15+PNRH56pUrfPuzefDyObZMezGsrOGRCuRvUjCPgaTfBpppgLzv6ZOE2SbECeqhM6xk5y9qNT8LLTnkP/JAbpANzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUMAHDmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD85EC4CEF7
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762441380;
	bh=oZoq7mr34By0XI+pLScyNsI/B3D4pxw35H92iTb5Uf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OUMAHDmj/jJ4scjxJFvsLcNDg0YxsMl/eQzReOPCzlTBNUvpIctlxKT8ljiWZBeZv
	 aVadwZUe7yk9GdoZfDgVwc8u3Y1DtrjpJXptQ2OltzGavJ+vqQ6nl3MD/wUyVSZpDJ
	 2Lx3IuRYSl+zx5n9mbeIhBLoNFGRmLu3Tl8qWxEStF6ZZ0q6eAtQCL/kVm5HeDykeT
	 hN21Ldir4ZZfMxfU5gRMlJ5BPWOoEtA3DnuvPmCdzcpqyl+I4AzEIrr79BJPie3V4R
	 +QlXLx/1nY7KHoWQVxmuT7baDFC3NZbNy4agraRW44KmC97q4JuzNv86mqR2eFLHye
	 qT0YVVaW2/5uQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8FC4C41613; Thu,  6 Nov 2025 15:03:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Thu, 06 Nov 2025 15:03:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-M5rasjfIH9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
The solution that's in uhci-hcd is specific to that driver.  It won't
necessarily work with other drivers.  Or rather, it might work but probably=
 not
in the same way (since qh->bandwidth_reserved will be set and cleared at
different times in different host controller drivers).  It wouldn't be
surprising if it doesn't work at all for some drivers (for example, if
bandwidth_reserved gets set when the altsetting is installed, before any UR=
Bs
can be submitted).  The scheme simply is not usable as a general-purpose
approach.

Ignoring bandwidth reservation is the same as ignoring attempts to change t=
he
polling interval, since reserved bandwidth =3D maxpacket size / polling int=
erval
(roughly speaking).  Besides, the USB spec does not allow USB-2 drivers to
ignore bandwidth reservation, and xHCI hardware enforces bandwidth reservat=
ion.

Now, if this turns out to be sufficiently important to enough people, we co=
uld
always add a new kernel API specifically meant for changing an endpoint's
interval.  Maybe by adding a new ioctl to usbfs -- I don't know.  This would
complicate the existing usbfs API for reporting endpoint descriptors: Should
the new interval be stored in the descriptor or should it be reported
separately somehow?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

