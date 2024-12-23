Return-Path: <linux-usb+bounces-18735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCE9FACE5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 10:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C0C1884BC8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 09:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ACD191F6F;
	Mon, 23 Dec 2024 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYLujYux"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604722AF1D
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947828; cv=none; b=KW/v1xzfX4VrPWUpSwYJY0SERYIdCVG7hc4uB4S7cJmoSAk0Dn+U/UQruyRRGx+PJxSpYQC4xVVOKTRPahhyz/plX1voLcBt1LDM1OCxBjB9Ck/H/2UCfQMBLaM9NqQCZq/XwttVhz0uGDv82YFUd/vl94l2npiK+msjUy4JQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947828; c=relaxed/simple;
	bh=re+WCYQwfNFB8Z2ROlTvp1IDsgwiuftxyABALC1wEmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b+VuuYjJ2E7oP7AiPuhtkDt0zHI4KeFydO9uVoYG1tekNNBifaByI4TOTRS75l+NfpTe9BPjNBl9yjuVZBNie4ADcJInMaKfy2xzKpMjc3PVGNH56lvg0iPyRH2zIeP4hvewiyB4xldGCQ6vUZnKg/LHeQKzy0sXU7V1OCl0m1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYLujYux; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0A75C4CEDF
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734947827;
	bh=re+WCYQwfNFB8Z2ROlTvp1IDsgwiuftxyABALC1wEmE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WYLujYuxYhMKUYfm1xUNy7jVAbXGF9l0bXxnrzcZKH6JFsIbH+RCpWQXOBRHdI53r
	 oimhVrDyCKoGvcljF6X1aTQ1IVl0Y7qhCJqovUHQGvB5IYRkjvJ3GP4zRxdPvnMJzr
	 8oRVgcv5T348c9Lf5IV5TrHELldHxhzFtn8caCBdYO4+bsFykV2F5FMILRqjaPez5F
	 OVbJ+Fh/Hjszfz5fcx29wGTC5/A59CfhL3RIKJS5Y/kA/BuK8UlIELn267MIVvzTzJ
	 2ELaA2Hwhr0GeOUnV7PmgtDVs5WkxUSfrgBziKuC9M39Pkb8Khc8QJdvYbYe+4A5wx
	 BoGBFK8UyLhBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5861C41613; Mon, 23 Dec 2024 09:57:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 09:57:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists.rolf@reintjes.nrw
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-FWFfaEOHJv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #21 from Rolf Reintjes (lists.rolf@reintjes.nrw) ---
(In reply to Micha=C5=82 Pecio from comment #20)
> By a complete accident I found that VL805 has a known bug where it
> overfetches transfer rings:
> https://github.com/raspberrypi/linux/issues/4685
>=20
> Rolf, there is a workaround for similar bug in Zhaoxin hardware which may
> solve your IOMMU faults.
>=20
> Update to at least v6.6, or the latest v6.12 series if it's not a problem.
>=20
> Run the following (if using a USB keyboard put it all in a script):
> rmmod xhci_pci
> rmmod xhci_hcd
> modprobe xhci_hcd quirks=3D0x200000000000
> modprobe xhci_pci
>=20
> Verify that it worked:
> dmesg |grep quirks
> [122123.422469] xhci_hcd 0000:08:00.0: hcc params 0x002841eb hci version
> 0x100 quirks 0x0000200000000890
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
> ^-- here
> And see if it helps.

Thank you very much.

I just tried it and it works. The USB port runs fine.

But what is actually done here?
modprobe xhci_hcd quirks=3D0x200000000000
A setting is given to the driver when starting, but what does this setting
mean?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

