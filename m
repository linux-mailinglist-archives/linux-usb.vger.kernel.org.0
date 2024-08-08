Return-Path: <linux-usb+bounces-13246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A794C576
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 21:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F8461C21F71
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 19:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D648F155CBF;
	Thu,  8 Aug 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfoXFpiv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC322F23
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723146559; cv=none; b=TiUdt3O7rR+vwbtLbgO4XY523MP52LboJh4KD3Xtt6/yJ0Sqxi9jX8Ly8QCXSHlmWNFP7dQH68aF0fjXKbcan90yhLtf/IbsUhCoPypLSnaGWEJd9R52WcdiwJBcil8+qT2ufVmikF9yli2rt3tIRR0edlPVQ5RS/Rv/SCC6rk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723146559; c=relaxed/simple;
	bh=j/mqpm0ZwAMK/zB8BrRRN174bed/PQbxFhMtJTc8avU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UhNLSh+JDRh7Ney3d4+ONXVWP26ThZeZ07D9nhA3S1jp/jlhh2BIBEhH0TienFDCCElACBv5wI0cHG9vzcNRkIKxcOX9ZcEsc/RNL3GQtDptbZON8HYUm9/OTMP1RZGML3DAmgeWgFwNp2t+pyrV68iErq5SDhzDgYvprvUHtxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfoXFpiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBC17C32782
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723146558;
	bh=j/mqpm0ZwAMK/zB8BrRRN174bed/PQbxFhMtJTc8avU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WfoXFpivWCUiYIE7eGiN+HOREhXpMQSMYP/m2jEKsThSgY1LrCjAeSS+jQsQ+a8Ps
	 xhYUw9zmZmbOi4IE9mQtu6KWBpvxshMZ9d82KeOmM/OC4RvJ//lNA2P8ZXsG3piywh
	 Af4yQ94ybEAhF/u6gSP5yI3gAPh6hhrStg1jNM6lL5PEN29bL4wGiYUrGOKSyAwZbV
	 DR7zxnz+7Qj0rH1oFcjKFKzahWo9DVnht4HIntDo7ykCui2Wvg+2kk5+BmuJKGBMih
	 WcyOeqrSwSyW1QrbOX+Kup847n8+Ceh4MyZR13xsPWwgqNJKW1Cn67HkgaViARb7l+
	 Of0OSm0loL9lA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CB913C53B73; Thu,  8 Aug 2024 19:49:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 19:49:18 +0000
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
Message-ID: <bug-219111-208809-JNqHt59QWh@https.bugzilla.kernel.org/>
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

--- Comment #40 from Alan Stern (stern@rowland.harvard.edu) ---
I don't think you messed up the Wireshark capture.  But I can't tell what
happened.

You can reset the device by using the usbreset program, which is part of the
usbutils package.  Some distributions (such as Ubuntu) include it whereas
others (such as Fedora) don't.  But if you don't have it, you can get the
source code from https://github.com/gregkh/usbutils/ and build it yourself.

The idea is that you start with old_scheme_first set to N, plug in the devi=
ce,
check that bNumConfigurations is 1 in the "lsusb -v" output, set
old_scheme_first to Y, and then use usbreset to reset the device.  If
bNumConfigurations changes to 2, you'll know that the reset caused the devi=
ce
to go into its other mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

