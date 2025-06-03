Return-Path: <linux-usb+bounces-24435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82137ACBF15
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 06:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BF673A5B24
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 04:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3C41A5BBA;
	Tue,  3 Jun 2025 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYmhYxAh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E373FE4
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923733; cv=none; b=GYNALjGS7ovm3YGHfJPU/Bc5G4kwjp6vhLPELCTNspcxjLdjHm8CNKmB96MVCyFVNA0aOXGw/C6NXxPRdlevOUL7+5IzLeiKyEmB8g1XXAU7VUVo/d0Y8skB96hpfWxnUoKty+aITrdQq3a2IODHrGJWUxDAS4dM1vfNhCWWo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923733; c=relaxed/simple;
	bh=jVASw7bjkG/rokoPm16WaLy8iWRBkMZTH6Rq2KQ6kx4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b8or9XjSf5/sFA2F7yHSp0eHiCG9tIyeMdyScjS2TA1euvmL2hPiLlTVEvm7m2lVhdLto0dV1C3pcQJdXuwTplJN3XrvjQgpeHm4odP9qqNzqlafJ/TxRYQlVTP3HtQGi9Y2GSPcuAi+1c7eri4vYPhOjpW9T5vwBtTBsnsgGsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYmhYxAh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C90F5C4CEF1
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 04:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748923732;
	bh=jVASw7bjkG/rokoPm16WaLy8iWRBkMZTH6Rq2KQ6kx4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QYmhYxAhJyd3vHUxxsuUiNjbQikqLEAbwisL6xCIZKLSMV2G4YLWsvVMN1lE6ay6G
	 Lj1y578t+/U78qFJwTiXCvxr+YUzZvzdfXKfkaPvbU0Oz+V8CYmh138MrkpKCZnna4
	 tDnQD7l4MT5iFn+NGJw11nMgKnsFJVcRFT28aifckFyc21Y5HpclK/WQvdAKHobmPe
	 6t1kih3yHoAFa9D/CC8bfJ44IFjoksYWRXWAmy/kow7pxFPCUSwSHSOoGj3u0SCdZI
	 ZqcSOLuDxLH4N8PBMDZZrsMU9nBL/9tPyG03fByfnctT0HPsYRTpkSRcV05D/mepZX
	 t9BDyxopSJNAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0D87C41612; Tue,  3 Jun 2025 04:08:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 03 Jun 2025 04:08:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@roeck-us.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-VPi5wZREVB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Guenter Roeck (linux@roeck-us.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux@roeck-us.net

--- Comment #41 from Guenter Roeck (linux@roeck-us.net) ---
This problem may only be seen with DMA API debugging active, but it is a
nuisance if that debugging is enabled during testing.

Would a workaround such as the following be acceptable upstream ?

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 145787c424e0..a396f81d0322 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -31,6 +31,7 @@
 #include <linux/random.h>
 #include <linux/pm_qos.h>
 #include <linux/kobject.h>
+#include <linux/cache.h>

 #include <linux/bitfield.h>
 #include <linux/uaccess.h>
@@ -1437,7 +1438,8 @@ static int hub_configure(struct usb_hub *hub,
        unsigned full_load;
        unsigned maxchild;

-       hub->buffer =3D kmalloc(sizeof(*hub->buffer), GFP_KERNEL);
+       hub->buffer =3D kmalloc(max_t(size_t, sizeof(*hub->buffer),
+                                   cache_line_size()), GFP_KERNEL);
        if (!hub->buffer) {
                ret =3D -ENOMEM;
                goto fail;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

