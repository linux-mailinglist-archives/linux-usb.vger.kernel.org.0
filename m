Return-Path: <linux-usb+bounces-13280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A1C94D347
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 17:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D01D4B224CA
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDEE1957FC;
	Fri,  9 Aug 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9iXYPxM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D0197A66
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216847; cv=none; b=AmRRuY1gfNFiZXPrvwbwn91OAfACZtnWYwpqrc0EWvfSLKS4UDozXMK98SovHKiONoiaTG3fnd1sl/qIwtsp9p2MBSMUXM5D4Kgk+2nukLG9ndlFWQR1PKyG0piYAmeEl5IYFHRrH35+b/cwFAqQg6oiH5k1jZWp3eVhbmk77vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216847; c=relaxed/simple;
	bh=aQIqa9+BihDnHLqi0jCjEyOX/dpE5iQGSIjI52+3BgE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dat6yhWurObw6ryS9SQe43NK2Xpct3OAVP29PkozQ2fjgasQ0AjPsyS7KxYNe1ZwcOGFzdgK+B2EswnOaqvqV6WHmqthRiI6pEArSxqxUA7S5vIhFMrp/B9qh/nsGF9vldwDEOHJ2uM1K3g2sERu/pvhBM7YWK0z73Op/N10saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9iXYPxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25CC0C32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723216847;
	bh=aQIqa9+BihDnHLqi0jCjEyOX/dpE5iQGSIjI52+3BgE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f9iXYPxMBUDMDAjJsHYSyE4If6lmF01M1UIUNnk+y5CxlenQgQ2CS/t/0cf1A0hxb
	 1nu5xHxoD7mRjLMm713tKvuN7uDTXBQ+y6AaNrXcrLjkQWlRxAJR507/hprK6lSgaN
	 VA9J6RSYqaa+0t5yz+c41Uy6zZfLmTHq0f1BW1AWyLBz2mEHgDXlE7Jcn6bx0fLxR0
	 ppGhngNbS7Srz7z7EsGFEptNU1nB0iTZBE1oDzlR+ErObdBUm70wYbiMAxy+lcp4U5
	 YwLR2RwDt6XQqAbNKIDTfOHVpKG/oXJ/U9YIQogkNT8yscHYcQwVhoLFiSYg/I6Svl
	 ghpTlISTI6Lkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D2BBC53B7F; Fri,  9 Aug 2024 15:20:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 15:20:46 +0000
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
Message-ID: <bug-219111-208809-hqZiWlBlHR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #47 from Alan Stern (stern@rowland.harvard.edu) ---
The two schemes are methods for initializing the device.  This happens befo=
re
the configuration information is transferred, because the kernel can't
communicate with the device until it has been initialized.

The scheme works if the kernel is able to communicate without getting any
errors.  If the device then says it has only one configuration, the kernel =
will
believe it.

While it is possible in theory to replicate the initialization schemes
manually, in practice it would be very difficult and it would require a lar=
ge
amount of programming.  If you want to experiment with the schemes, by far =
the
easiest way is to patch the kernel to make it do what you want.

For example, you could change the kernel so that when it encounters a device
with the Xone:23C's vendor and product IDs, it sets the number of
configurations to 2.  Then it would ask the device to transfer the informat=
ion
for both configs.  But most likely the device would refuse to send the
information for the second config, because it is still in its
single-configuration mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

