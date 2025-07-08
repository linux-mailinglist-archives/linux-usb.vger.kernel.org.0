Return-Path: <linux-usb+bounces-25581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9793AFC726
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 11:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A423B7D19
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAC8242D65;
	Tue,  8 Jul 2025 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="st9tOLD6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416C218ACC
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751967258; cv=none; b=Cfr8SX4mM/bKWtv5cxcmsUDUXgohg4DaRB1R40eE8NRoNjtrotltmVcjbDzjOthjNTiKFb0UNBq8UbyvxdoQ88ruarD4w9/SXdQycDtnMkbfyYDHoxUf3mef3AdwqjGRpw7zd4ClxXILzyfp8KWDsc18FLdeEiymF7myZ1tEYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751967258; c=relaxed/simple;
	bh=8o4GS8CBhcy97nFOtzf1YU8KAAtDAbIuJlJx0WyUrxc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=heWx2KItbs6KK3LBYr9zzO8r+/cAojor/ZaREuZHPomREvZk9RVDqYtIJ6Holi3pXWyRuU75vcpyr44dlE8dFndg6mDNuB5/FrBnSLmOsH0ijusaD273JVFg0wXG2VaBZWHJKdFNrZJd+5NeqKCEPyL0/icaMs/w35IJjP1yb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=st9tOLD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFF63C4CEF8
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751967254;
	bh=8o4GS8CBhcy97nFOtzf1YU8KAAtDAbIuJlJx0WyUrxc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=st9tOLD67JaDNsfWuRvvSA0j7gG4s9JLVAJv9OFKRPiCGnURnDjMi0FwbVI57XT2w
	 H5z4N5y7enq+vmgG7+bzG3SvSgXAz+sDBGU+7+CHqLXz6B8/IK+n3rVc8IZE6sWFR9
	 Rh+yDkc/aARFrpRI/pUvs+IHZNRAT7tIzY9obB8f2V+F7mOPteOP88X7WxQkU5Wp4X
	 aaFWPbliLL1xY3Q6H/AMTdz7oMlLyBllnW2k6Iyf1LegAWHMo1yPX0q1uRv9yvczug
	 MK6phlWc+tHS2/PcsfimNMoQhLsn1YUNy6a7JBvnLsJEnNPu5BJRJ8GrQCl0wdjIf0
	 RakofbYE0io9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C88EEC53BC7; Tue,  8 Jul 2025 09:34:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Tue, 08 Jul 2025 09:34:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-eDPGcnVofV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

--- Comment #12 from niklas.neronin@gmail.com ---
(In reply to Nick Nielsen from comment #11)
> The patch seems to work.
>=20
> A member of the openSuse community prepared a KMP (kernel module package)
> for me containing @Niklas Neronin 's patch and I no longer get the error
> message.
>=20
> Also, looking at journalctl, the USB ports are enumerated and described as
> USB3 or 2 where appropriate.
>=20
> It's not the end of my worries - boot hangs again afterwards, whether this
> is kernel related is yet to ascertain.

Thank you for testing my patch.

If you suspect that the boot hanging issue is related to my patch or the xh=
ci
driver, please send over any logs you have, and I'll try to fix it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

