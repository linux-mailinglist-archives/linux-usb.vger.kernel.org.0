Return-Path: <linux-usb+bounces-12651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3387F941F54
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 20:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F9E1C2285A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 18:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5DD189535;
	Tue, 30 Jul 2024 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDtbLjDa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CB1667F1
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722363390; cv=none; b=q7XNRNHiDTtdQ1ViFqCOh+d1wTeDlUm49ubYpAiZtkW7MPUMdRYC7+IMPUPsw6cQTAnbSaleW2YHucGXxcMHdQ5ZKx9TMpYsCHAFFdCpIFoyuHDOK2ooGrruCp15XrlKCFK9Kgu3N3i7rFWmlG1Y1CbLxNfXtBYdXGxkqW374ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722363390; c=relaxed/simple;
	bh=Je4d0r3AmcwF9AJnUhd9JBlAFXPgmTpbOk6na9EZ+cI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWz4J1KYWtskDT2JpoVBaeAF9DzURpnTAgJxhUv2OTkSX2xBJnanSSV91KcY+2cAsU08dkqZ5+ReiBtYDnCZ3O6LSx+SQHTOGLVN5VeXl31Xyf9j2SMSBcIZCbI2IXsEvjfd4nxsYtQB9N5/Yl4hFAVCSkkbw/x1OFcbrzTapwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDtbLjDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C68A8C32782
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722363389;
	bh=Je4d0r3AmcwF9AJnUhd9JBlAFXPgmTpbOk6na9EZ+cI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oDtbLjDawy7q01Yzc4bLfoTIKo1j+axPnbYc8jQmoqyHLiAf4ZnSX4r06LmbZ3ZMy
	 WeGgUbEr+xkdRryIico+mLrJkmop9k3J4ZBkZtrnmdmJ+Ot7jui+Uub6tbIoBMy91l
	 miieob87LrBIcTso5x5ryCGF8wvrqlZkVE/cr0nfRWg3my3p8mzm3nxdDXG9A5SSB2
	 jYSjXNmWCb7jAspqDsNURjhiQBMGtCoj8U8DICP3hzOetH+PI5+5NwvtzyX4ss5RIO
	 j4kbI22eDSEMwilZD3467M3ojl/gUWADszuULz8aj5nZEECTOXszkUcBEddj3ii5M2
	 s9nSjGHTq2nqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC4C3C53B50; Tue, 30 Jul 2024 18:16:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 30 Jul 2024 18:16:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-5LakgQzNdr@https.bugzilla.kernel.org/>
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

--- Comment #4 from CH (com+bugzilla-kernel@c-henry.fr) ---
Note: I also tried the `echo Y
>/sys/module/usbcore/parameters/old_scheme_first`, unplugged the deviced,
restarted the device and restarted the computer but the device still appear=
s as
a 1 stereo in/1 stereo out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

