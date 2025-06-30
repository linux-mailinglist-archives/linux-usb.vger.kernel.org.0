Return-Path: <linux-usb+bounces-25312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F004DAEE09D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48AAB3A357B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B4D28BAA9;
	Mon, 30 Jun 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez8aFcbX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71E28A73D
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293606; cv=none; b=BFC7GuMoo5eDum9bgh/OQ3xiV8PEMGsv9zrMC4pHzAg9bj1jOZwowTdRSz2XHxASrcVrFytSpZ3WhnhQdFqX5N7a5//hIGxQgYWm/+K7uKR3UyOY0dYO3x+wXDLIDG9pbjf3w4mAB22h44UIG1mto+c2HV6KcG6XX92JRIqsznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293606; c=relaxed/simple;
	bh=BOYTSgmLjr6dx23yzMmfIewjjG9D17Ft4GO6DSC0BxY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XjbJbbkRb0yVY1AMTRXF1rBvYozUNILTgtEK7mr3JkYGONxm5VsJ59M1FwjPVKgx5lYQyG46uaJI4TBl5asAEAHtmTvQzRAchLxhk4CQ0Z7eqSvYfdq1LGFH5/1eVL4evACgjgkuDRLF1myhZxcrvANmRP1gcGz/85S07/xkH88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez8aFcbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C4B4C4CEF0
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751293605;
	bh=BOYTSgmLjr6dx23yzMmfIewjjG9D17Ft4GO6DSC0BxY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ez8aFcbXnYMhy/jbRz5wIUEQXD1A3wzidXc8OYJo5r8hJc9XI9kHCg1v6VG9TmAYQ
	 oy53cCmqMoI12eX/bTKDiCdWOlBdcg7bMxLelm2BG7QShjbnWHiVX+T1T6C4PLkMP5
	 gkdWE2I0OzX45pS8FPzXQuwNC/6wkshiMNCdYe7UPEHaiD/DoXr6/U7uf6Lr2xKKZ5
	 puSAssUOkEQl1sWry+LzZ8lL2BK8aipehGveyqBIXUKfHrrus5ISq+Og8f5kofWPg9
	 /O+CcSz6Ul/QXDyrdTfddAvYlOFqOdyaHYKC3S1yon4zqn9RoyvWjhNA5Cz0f6gT0J
	 yMd+hua+f9wow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80A48C41613; Mon, 30 Jun 2025 14:26:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 14:26:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-1q59UE57VH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #18 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
(In reply to Micha=C5=82 Pecio from comment #16)
> What if you disable and re-enable the whole USB bus?
> Based on your logs, this should do it:
>=20
> echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/bind
>=20
> Note that if you have a keyboard on this bus it will stop working. You may
> want to issue both commands at once: "echo xxxx ; echo yyyy".

I've just tested this and to my surprise, the mouse remained in a non-worki=
ng
state. The keyboard turned off and on again and was usable before and after.

(In reply to Micha=C5=82 Pecio from comment #17)
> I also had a look at this LLM generated "report" and I can't see how the
> alleged issues are supposed to be real.
>=20
> 1. Replacing wmb() with dma_wmb() possibly makes sense, though on x86 wmb=
()
> is stronger than dma_wmb() so it can't be the cause of your problem. Other
> PCI drivers made such change for performance rather than correctness.
>=20
> 2. I'm not familiar with xhci->mutex use so no comment, but the alleged
> deadlock probably doesn't exist as there is no asynchronous completion
> callback here.
>=20
> 3. Pedantry with no functional impact.
>=20
> 4. The driver will abort a hanging command and signal the completion.
>=20
> 5. We immediately return so we don't go to the out label. No bug.
>=20
> 6. mutex !=3D spinlock. No bug.
>=20
> 7. I see no bug. No static analyzer was run so that part is made up.
>=20
> 8. Doesn't matter if the value is zero.
>=20
> 9. No arithmetic is done on this variable.

Thanks a lot for taking a look, even if only #1 ends up being worth of
consideration.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

