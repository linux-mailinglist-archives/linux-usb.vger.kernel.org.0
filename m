Return-Path: <linux-usb+bounces-18703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C29F9552
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 16:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01FB718984D3
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 15:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E81821A444;
	Fri, 20 Dec 2024 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsbtMyvH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0D21A422
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707936; cv=none; b=q60iQrhpdHola/wGb6QdkkvB2Ltq1+8cz8YGywOY8eGlUXDbfRWhEEtoRRMOaqN3/9Mj8bV2YT/lZxuP/O9wN/gMNzTfWTHD99QLIl/WPSshZjQpcMhXkJaNeDwz0bRNoxOFTy8BuhOV76kXhW1t31I0/2048e3r7Msny3wKYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707936; c=relaxed/simple;
	bh=RmWpj6/pWtczLsMxxeN0Ba29p7w/+cvK8Zp+xejFksw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YEFO4ficq61s6iMKSREmnQJBX7R8CBznyQ13c0zqYhx86Yd2mun7Wtrd9VMct2gx8rNLTf3/pCnlAn+GgANrdE9HMTsmicSrenzGU8j9f8WGPazUn2EibNm91h33WeHzfwaDHXlNmajOyNCbkgM4RNv1JEx7pdXlZeyXNINyfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsbtMyvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04C03C4CECD
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734707936;
	bh=RmWpj6/pWtczLsMxxeN0Ba29p7w/+cvK8Zp+xejFksw=;
	h=From:To:Subject:Date:From;
	b=GsbtMyvHCn0nJCYdBpR71/W2yS7eN02+90bQ3hMy2sfpqG3xbALLLG2MnqTh4+GU4
	 Qm04rjyfydSRcoGN98VllxwWN4OqEfkEGx9jSu1RzCRDvLSlQMrThRbPfLnPmZb+7P
	 cdT1P/CgwcfQ3KfJTiPq51GpzmfOOCi2DtjuVWuv9jMnhoAJTjAb/SWCGTGIxR5Lbo
	 M3wFqcWS/G4ffK1HHk/4/AP4mBgVMTxDTwspRjRE61yvN+yRmxLxC5cQ4MfoNfI0pl
	 N4Hw9WqZtgb+FYnIAx/ShTRkAgxEXxNChLRtG3sYFj5FiPWD/jLI8OB5FJQ73/YLlT
	 bpuliX7mvBDWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E1027C3279F; Fri, 20 Dec 2024 15:18:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219616] New: xhci_pci does not activate uPD720202
Date: Fri, 20 Dec 2024 15:18:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: z.b@arcor.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cc cf_regression
Message-ID: <bug-219616-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219616

            Bug ID: 219616
           Summary: xhci_pci does not activate uPD720202
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.12.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: z.b@arcor.de
                CC: linux-usb@vger.kernel.org
        Regression: Yes

Concerning:
04:00.0 USB controller: Renesas Technology Corp. uPD720202 USB 3.0 Host
Controller (rev 02) (prog-if 30 [XHCI])
        Flags: bus master, fast devsel, latency 0, IRQ 19
        Memory at fe6fe000 (64-bit, non-prefetchable) [size=3D8K]
        Capabilities: <access denied>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

Although xhci_pci is loaded, lsusb does not show any Linux Foundation 3.0 r=
oot
hub.
Device is detected and works properly, when computer is booted with 6.11.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

