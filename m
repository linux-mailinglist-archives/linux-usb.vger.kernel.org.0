Return-Path: <linux-usb+bounces-24418-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C9ACACE7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 12:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306E24011E9
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 10:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD32054E4;
	Mon,  2 Jun 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeMd7o33"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B101DF261
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861986; cv=none; b=I26ngcPBcZa/bMCF26E+lTbGxmm3kfhB9zNJUnI0/aFv793QYKDpeas+Q5vbn7uN7OiGmVlbOuOF/JCaViUdrVx4KOF97fw6n+x2hK21IGVNa+ixCsxyvGkKjWqg94bVpUENmlx0k0qAuJCUfvjYhPFrJ5HXMjbmCGow5IrV+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861986; c=relaxed/simple;
	bh=QgaRr5YDEnxzwpwdXaiV6SBb6dxzDK9q096FZQ+DCd4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=csRr5ElvMZIpmic4gMfd1cEDbSnE50ZvE7uAmR1De+21jJYCMfskt480CQNzHen/8r22m/8Uy/4UKcZPgp1zGEobVozqgHaiQiAmlRaPHtIMEJpjhYkl4aPER1AyPDzBvdUJiMNfBMv2EFGytB0Mh2Jwdo6BvoGeD4ib/iMFszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeMd7o33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D96EC4CEEB
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861986;
	bh=QgaRr5YDEnxzwpwdXaiV6SBb6dxzDK9q096FZQ+DCd4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JeMd7o33RwLwIWiBv8p3CRFiZha4surxZZ5Nhzumb/Xpsg9WRvw3zHLXv3gferRhT
	 jvyqBs2ne0Sp41o5XD+2SKbyzsN8XCaIB4LAIlw1fPLpWBv08FzEY6kIZpZ1dsNv+c
	 gwCh1czJ5w6/VxhPMW7ZVWDJPq15WDU5/a5cKLvr+8YoQnHqPWWjiccySmFfXQnAhR
	 YQ1pyAS4L1202FNQJf/AoeDdETkjrAoIqE/yN30aam2USiC8KMcFiWZ8B+BdyANIlP
	 71pWQi8Ctpx5P44aZmhy5qWJHR2r5ixqAm+ESKbDURidsw6mJ5fDSn2RCsXtead0EB
	 7y6xNc7vezH8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13929C41612; Mon,  2 Jun 2025 10:59:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 10:59:45 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-Nweh3SDOhX@https.bugzilla.kernel.org/>
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

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #2 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
xhci "core" driver support hosts with only usb2 ports, (0 ports on usb3
roothub).

It's just missing some minor pieces for PCI xHC hosts in xhci-pci.c

Patform and MediaTek xHC have the support ready, as can be seen by the
"xhci->allow_single_roothub =3D 1" setting in xhci-plat.c and xhci-mtk.c

Or does this xHC host have 0 ports on usb2 roothub as well?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

