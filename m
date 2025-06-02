Return-Path: <linux-usb+bounces-24420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47083ACAD95
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 13:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F343B43AD
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 11:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1393A20E336;
	Mon,  2 Jun 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXq+V+jn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E02B9A9
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865243; cv=none; b=eiKENz1OxlG+lZjYNuHlU6bbhD9amPMNo493ZJdtA24Z9Foej3a3i86oVXVVfFd63M9E1Qp1noU4TtWbU1TdI5TgWe6DtPDn1R8nlahkel5OYlQ6eS4parJVpSeKqmcpPjgzU5Dzatv80lPcq2iJiKhkaA6hzJXenTuYK6M1HiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865243; c=relaxed/simple;
	bh=ZRhuUzfAeLWU1EMsHqsx7CWK6vmqonJ4N6zI0bOmssA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B7wbYgeKf95VSmsJB8UzLjjgFmV/FuKkWLnGWH36xvfRErsT338f2wEo838atH2iVJNxl81WYwYF+ZkXlaW+Sh6aPj6a9SY/QEUOj+vdmyPjmQns+tEpf81XIiSAFsh5I7cr+VZVHbpjjzfJXsKVMbxCzU/03bGbYLgXtMDny/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXq+V+jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2B08C4CEEB
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748865243;
	bh=ZRhuUzfAeLWU1EMsHqsx7CWK6vmqonJ4N6zI0bOmssA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XXq+V+jn57ZWIgLaz0k0tO2iBfNY+2RLayCrkwhkgVo8AA02ERg1iKRYx8OQtvhRP
	 ixqIgPerjzP4lF59XYrP4NQHxmmhXcf/ZdpFmBNN69vsyDOVmHDOr5Enf0VARwKwpi
	 d/OkXG5pg932nzEILfXzfiGy3w2kwziUyOd1SnP215Hp2GeiWvraeRwZYvqDyCK9XJ
	 A4+TMUJ1Qp611zdcdFYjZho293FtR9ZKPL1HiMbXVRO/tWnyMQm0UsntlLoPBEm/3n
	 7U2EvsyHmzbpOyFQ+Ke8UwD92a25+6mxS/jHWfLyErYeM+4Q0Q9geubCLWAYN4eMWH
	 wF5mTMSFQlBLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E40A7C41613; Mon,  2 Jun 2025 11:54:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 11:54:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-UWiKXEsFRy@https.bugzilla.kernel.org/>
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

--- Comment #4 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Mr. Beedell, Roke Julian Lockhart (RJLB) from comment #3)
> (In reply to Mathias Nyman from comment #2)
>=20
> > Or does this xHC host have 0 ports on usb2 roothub as well?
>=20
> I dare say that I'm operating at the boundaries of my lay man's knowledge=
 as
> it is. How do you suggest that I ascertain this?

Probably best to take a closer at the xHC port information of this host

The reg-ext-protocol:00 and reg-ext-protocol:01 files in debugfs should show
all info about the ports the host provides:

Example, this machine has only one xHC at PCI address 0000:00:14.0:

cat /sys/kernel/debug/usb/xhci/0000:00:14.0/reg-ext-protocol*
EXTCAP_REVISION =3D 0x02000802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x30010e01
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x000c0021
EXTCAP_MANTISSA2 =3D 0x05dc0012
EXTCAP_MANTISSA3 =3D 0x01e00023

EXTCAP_REVISION =3D 0x03000802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000610
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134


Above shows:
EXTCAP_REVISION tells if ports are USB3 or USB2,
EXTCAP_PORTNINFO =3D 0x****AA**, where AA tells us how many ports

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

