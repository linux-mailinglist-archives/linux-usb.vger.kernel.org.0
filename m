Return-Path: <linux-usb+bounces-27379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E32CB3C26F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 20:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7A01C86A40
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 18:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A791F4192;
	Fri, 29 Aug 2025 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2dI1Rsh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76215E5D4
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756492276; cv=none; b=okJUS6TbH5KDLmScFD859FICMQnQjRyRX02aqoltgydLBgsT3mMpyZRbfIkgEqoIXJaOI92/d+7qqijO76l2s+lVTutPcf85/agclCm9Tyb3ZylMraPHkYbskQCNbAFTDP9qJ6QQs1QueCNLUNOVd88sXRveotCuscqV0GV6CCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756492276; c=relaxed/simple;
	bh=u8Joe7CQWaOVqCc7amOi7gBAAPQ/LzJGV3ah62k2Fj0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TlRVU3Z100ghmhcWHeoKe0nkBN3d+u/12SS82S4X7hGzWmPb1qnWMpkeltKXsJrY8JCVQRFjn5NeX43sPzEWkjU1EESAd4NTBRDKbSF0SlziRfKKPTDBULlNyP6wJN6iSCT05LRBnJG8763dLm6zbxqhh5r0dD8wc0tFE+3w5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2dI1Rsh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54622C4CEF4
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756492276;
	bh=u8Joe7CQWaOVqCc7amOi7gBAAPQ/LzJGV3ah62k2Fj0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b2dI1Rshbl2wLulX1JPHTqJNJvGPy+JRIPv2Gxx9YYWP3udkElX2358TRhsI84N3i
	 7n5Y7JrzXTJ1aexxsmUBfnvAJ/a++l33CeoJvqpYrjkm5XELasz53Cutv7rKPHVZJM
	 f9SQ5vAPDdBWuJitF2GoXMp+Z7GvpjNr561etp4b9yCj7/WpIWwtvaMKq80kPjITr7
	 KocrBUdWCGjGTv6dlUatZC+Jw3AFCJ7YuVmpHOzWclc2A9M1fAVWdYsdX+DqFciOl7
	 NTYrHcwTbyOMTFSIW22byqx0/GkRXiR3V4DWKH/5KpgYRdfS059erWI8t083DhY9b3
	 6vUAAkvo/eiAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4108AC3279F; Fri, 29 Aug 2025 18:31:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 29 Aug 2025 18:31:16 +0000
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
Message-ID: <bug-220491-208809-Xa0iPB0Pf3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
I can't tell what's happening just from reading the dmesg log; I need to se=
e a
usbmon trace too.  Maybe an xhci-hcd maintainer would be able to interpret =
the
log better, but I can't.

However, the repeated 0x341 and 0x2a0 port-status values are new.  They
indicate that the card reader is behaving in some strange way, different fr=
om
what it was doing before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

