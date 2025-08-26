Return-Path: <linux-usb+bounces-27309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD2B3700B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 18:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6348A56203C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 16:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DECE276025;
	Tue, 26 Aug 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiX/5SJU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5FD1B85F8
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225119; cv=none; b=NlZP168vz5oMsOuy617RYF+ROcY6mgg4qfRT1fRSicvuaKW+WwoWG7h3LumLPMZbbZ15DQR1Ox4RZ8Szdk7+W3CH0iBzbt4PHbWLcndBFAyVGZwR2c995TuMBVqct2sKZj2cC7Ztb/DcRAo4mDuFh1lXXWNM6ThN3kvKiy53zuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225119; c=relaxed/simple;
	bh=BzVjmzLijM0FhofwnCTTjAx54vOZUpBOn/3a9ONndrQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sRdzFzELrR1LdpZpdTolbeVQ7v4SMeV9o1K5HVac1ghUiUeKR/jsWOm1FhTK1ZtpDJc0kCZg7/wc1RkEd5A3mWYX+Y/NeHXieQG07R9rGizk1lFRpamBco6eTnlO6MACAdedfb1yFI++YK8KF93jc1TwHJ42QBIc977E0blasOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiX/5SJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18B3FC113CF
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756225118;
	bh=BzVjmzLijM0FhofwnCTTjAx54vOZUpBOn/3a9ONndrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JiX/5SJUIiZFj5NgVQQ5rJPPGWcOIBKpFIP5tin4C3OA5j4Axt57jOY/la/xMUd5x
	 IKXJmFRMwGJ0Y2iYxLRF4i4ViWafPKi38LkvgXhLHe5Cv2NNhf+bvJufIfncUBD5IO
	 w0Zg6/P6FzMwPz/hiNNgHv64Ipppg7MHZheYmReq1XMr/Wszo7Fu4Llp/10F0nCAca
	 +1zRPG0s/KlezrhOOPEl/AeqOSUk0SL74Sz552GcagBJa8n4vwOBtgC1tPs95gacSc
	 QnoNM6J224ORXHjJ5VzHgHhWH/O9pIsEqFnRvnngZPZHhLgrd37lHPyg37HvzmCzZ8
	 bnRiwWK5KErKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F31F4C433E1; Tue, 26 Aug 2025 16:18:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 26 Aug 2025 16:18:37 +0000
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
Message-ID: <bug-220491-208809-yYcaGemDEP@https.bugzilla.kernel.org/>
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

--- Comment #4 from Alan Stern (stern@rowland.harvard.edu) ---
You should collect a usbmon trace showing what happens during a suspend and
subsequent resume.  It might turn out to be a lot more useful than the xHCI
dynamic debugging.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

