Return-Path: <linux-usb+bounces-26596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A84B1DD10
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 20:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 470494E1557
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 18:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26651D7E26;
	Thu,  7 Aug 2025 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rt1YelVj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E623DE
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754591532; cv=none; b=ima4+P2ccp+ySKxHc8je6y1B2dUiw1M/51tUjS0wCkrsDm4pd8RfTTEWkgIZbXPHHgv8VpVCJwtVVVF/yaaAbTShHY24rjsdjUaxe7g7KNGVldowTxvEbRRL36W08BuUcNfASfAgMAImcka8qqRhOK7M1yH+Rn2yvGi+15/iJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754591532; c=relaxed/simple;
	bh=qeXtB97CZKpAFhNGldEs0K4lUEqmFTG1wppo3oD6AvU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llB/dm7koztInJkU+dkFVLxoudms7lh9s0RCK0gEstrJfu0tl6v1AstExmy04EC9bgOQ72Ijml5KMgCSwQISgsnw9SgZfCv4kIDjkyeMILk2HwWSba/wccpavo45SsOIm4csMr8Ig6Tv66OWLSJfR94BZCsEmV82e+cilBlRL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rt1YelVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD1B3C4CEF6
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754591531;
	bh=qeXtB97CZKpAFhNGldEs0K4lUEqmFTG1wppo3oD6AvU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rt1YelVjV4l3rSvbP6I3h+owUPi48lUHBL9xt/HgrIHIDdlACybebPqilsowRQm/7
	 g5aMRYAuu9F3nw9g6pJm8gTkOrndpk/wOvCu7mzL/k9NGqsZur6fWIgesS7iu37ScG
	 FNStvhMxy/nb7uXXXmmDZIvPcnlc2vMWvBg8eXo3dMCSic+EhLb64JiJqFlzkh2e9a
	 bVhxF4tlCO1XN5UJSyikMUkDbBp/3oRSiAuSTZBIu7t4740raCexDEa7AODy3HLGet
	 ZOUfwx+o5vDipksSJPD1I7pOK+cK4ZZZDRBePgjltOZR2CubYGDYIoPDIIuAG6eZZI
	 7vJDHFCFkV1fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CAA57C433E1; Thu,  7 Aug 2025 18:32:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Thu, 07 Aug 2025 18:32:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@groesz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220422-208809-Ouj6R9LtYQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

--- Comment #3 from steve@groesz.org ---
The device in question is a Dymo Labelwriter printer. Unfortunately, it's an
out of production model and I very much doubt the vendor will fix the devic=
e,
even if they could. It would likely need it's USB chip replaced and no vend=
or
would do that for an unsupported device.

As for how it passed USB-IF, I don't know.

This is why I believe a USB quirk patch would be most appropriate, to detect
this device by it's VID:PID and slightly change how it decodes the unique
device ID.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

