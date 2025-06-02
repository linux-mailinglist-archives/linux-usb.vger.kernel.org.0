Return-Path: <linux-usb+bounces-24422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAFACAEE8
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 15:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE1D7A20F3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64622068B;
	Mon,  2 Jun 2025 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGAyBaFC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510E1A9B4C
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870641; cv=none; b=jU5kWrHxvTCaw2xfwhxQSfSukqLnZsZ1CCm41WfTf+7gdbzvDUTmB0ReAnLU/gu1Wny+RMUDs3DHBDMmay9+Dq5AorWSXEbX0Vet+cwI6didyG0tGe7H8Vd/kgg0BwT9apSe/8Pu7HBulwWKGwN0anE5WwYqKgpZInqupINrWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870641; c=relaxed/simple;
	bh=uZcc/6oqXVYc5MXzQPL8pUqYonrdltE27vyb+WQc1O8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPdfBaBlk41TDs4tcO/hx7YXMTqyvw4V55ifvxkKYkinVU3X1ZsOKY96Cc/cVFPIokfoVodFdNohFxkVmNwe2TIfgrNR5c5mOBCfFUllDl4SdxPW2vEW29mWz5uizIuq5+ddBcHAe8Ipxy2IjcFEIgrZ3pOObDllt92b6lSCtAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGAyBaFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEB22C4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748870640;
	bh=uZcc/6oqXVYc5MXzQPL8pUqYonrdltE27vyb+WQc1O8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nGAyBaFCYMu6FraBWoVVdQ2XNCwBdxd8tSZqEQwwVh/zK0KpXzASt7Blpbwo3eXMH
	 jW+dFGg9ZxP0/ipQauZqeALEM/3rXh6WnPOiiT6AAZxoWIhICywqUtRR5Est3tlcfk
	 qjsxqc8iVOMrlW1wSFfcSm3uDZnu+rTzKsI7Eg9IoBE3uSGV5xatoTkjS2n7SMkpaV
	 i3C3v7oc+vnO6BdKf8GzacZmL6MM2DI9sGlXsdAIooHqRG1GqYdAfW3sF2qbbEAdop
	 DYNI4wTGxZdNJWk9DRRqZ561B06rKdhFstXUwzcPS3//JoNx/SXLTbrrJDHOyTlBvD
	 GpirwDivJF/1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BDB24C4160E; Mon,  2 Jun 2025 13:24:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 13:24:00 +0000
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
Message-ID: <bug-220181-208809-SLzcYLnFAp@https.bugzilla.kernel.org/>
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

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
This means the xHC controller only has one entry for "supported protocol
capability", which lists just one USB2 port.

There is no entry at all for USB3 ports

The xhci driver needs some minor changes in xhci-pci.c code to make this wo=
rk
properly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

