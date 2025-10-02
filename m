Return-Path: <linux-usb+bounces-28877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF5BB51EC
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 22:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54C494E6ABD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B96D29992A;
	Thu,  2 Oct 2025 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dL0C9wbH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD77288CA6
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759436765; cv=none; b=fmVu7JIGKLnNAhrNRVH1/qFjHD5H6n6GHg6zxxglU6evago4/+/b+sMBv0gZJAJXKnLxZcL8OcT9taBwuuubt4FgWdJAFwmyjU7rEMYKG4rHVbzbE6ypK1q/W7z2ooLBIFDUppqulYa1og+OaInb5NZZ8PA3ak+JEvAGT8sFeIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759436765; c=relaxed/simple;
	bh=7HiNWsmNM7LzJch0ST7jrQqQckoi/3DZqRxGKglBTfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f0Uotl03SQHwo9C/dMGD+Kt5M0m5IAC5k7lC6f+ztJebvryaAlam2q+EMKeUML8H+7/w5LMU1ZByPpsJx0cfV/TBDNuwbg/cpEyVmsVEf6z6+ipikV25n33OnICC/P1Op3aYGAQD9EEQEzCrC8G0/RMHQjd1cAvqGT7oBIBVYhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dL0C9wbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF725C4CEF9
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759436765;
	bh=7HiNWsmNM7LzJch0ST7jrQqQckoi/3DZqRxGKglBTfw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dL0C9wbHYOCQSJoKDAqpwc0op8mLXvJXFE087R5Z07fZ41TicBjrUe67gbO3QrRuz
	 KOq4mrIohABJi/OV9OPegNg3mKSAa137oIC2OzuvuPiW3IzeKYsiZr7wdkBA5GbFoS
	 5Xvk1BHViwwEGhBJ7f3Kxf2D3VsstMCmMCHvpLGSnsUiJx5u8yHHSp/HM5bK9FzO4D
	 q6q6aX3102MQkTBZf4cTlXylyaG4eQ4bVlCoRbEVGPePbdo3HHJNbjKD5+7Xx8Spbi
	 ViQHMFlgnoiTCEbBj+U/YMBxpRi35dL47BDPEmHXefnCd7DPnxywc+zBAccxH1j3ty
	 2EWLc7lffwKdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FD70C433E1; Thu,  2 Oct 2025 20:26:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Thu, 02 Oct 2025 20:26:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219726-208809-PSCwCQDcId@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

--- Comment #6 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
It was a spammer, no need to respond.

And for the record, this issue has been fixed and CONFIG_USB_XHCI_PCI_RENES=
AS
is no longer required for all Renesas controllers, only for those which rea=
lly
don't have firmware flash connected to them and must be loaded by software.=
 In
this regard, recent v6.12.y and later releases should behave like v6.11 or
older.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

