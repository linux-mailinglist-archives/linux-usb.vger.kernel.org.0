Return-Path: <linux-usb+bounces-2057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4F7D2598
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 21:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9312D1C20941
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 19:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3336A12B6A;
	Sun, 22 Oct 2023 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JftjDvGS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93ADDB0
	for <linux-usb@vger.kernel.org>; Sun, 22 Oct 2023 19:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00069C433CA
	for <linux-usb@vger.kernel.org>; Sun, 22 Oct 2023 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698002383;
	bh=jwMi5TH5k+lbEBCmi3gV6ADHzQFo5a1KWJO91QVEHDk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JftjDvGSTo7A2OFj7CL1TN/2UZRaQlBaVqrwxXtw5TnyBOYzlnEnB/zqD8DCXWsAp
	 xgYqWqzXfyHlrAhYpPSHc4OSNE73nACsLY2by1hu7lEVM8DnXIdYPex3MBVZcO0iTJ
	 khJioC3N1BYRYnWfwI8fAh8NqiM3uHuuITmAqoe1/Zcv2lcZrnoBG1XNIBlUce7FeM
	 4vByefp651kq5dEmHW9DStgAdPYzy+RBd3whYd4QnlzhTADodVyPa5SigxxCYfcRdt
	 MvReKreUIggNWBgfIBxHsbR31dWij2Lz5UwcO7CnA1p7q3jlqNK35fIsp67qL8sf9h
	 El9RKRbiDrTmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4B88C53BD0; Sun, 22 Oct 2023 19:19:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Sun, 22 Oct 2023 19:19:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris.bainbridge@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-fHRbdhQ63A@https.bugzilla.kernel.org/>
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

Chris Bainbridge (chris.bainbridge@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chris.bainbridge@gmail.com

--- Comment #9 from Chris Bainbridge (chris.bainbridge@gmail.com) ---
The IOMMU error is caused by a buggy VL805 firmware. It is more visible with
the Debian kernel as Debian patches the kernel to enable IOMMU by default. =
The
updated firmware can be installed using the VIA Windows tool (this did not =
work
for me), or you can just turn off IOMMU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

