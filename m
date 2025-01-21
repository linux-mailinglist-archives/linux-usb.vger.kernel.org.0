Return-Path: <linux-usb+bounces-19556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E92A17D7E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 13:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EAB4167AEE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 12:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055581F1900;
	Tue, 21 Jan 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfVWEu2u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801271F1520
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737461190; cv=none; b=eY0lP10vJQAXHvYRdtLDlUPN9vnJXOAqmkFPHGKI6jXNvmnSD1aN2ESHq/caRH24mCYmCWJ/KkObgRx54ZL8Cst+vVlwon0M/bVePsM5Vt/0ncm5sbJA6JIm6QyqTRR1i9hfN/Bp/vRk7eeu8jOhs5XC5Qe6cUbmQO0dWy85TQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737461190; c=relaxed/simple;
	bh=7/lQl2Dmp9thnSzFpG0XzJ9iOUGPsL3Rh44ndmHk5sc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fUouWrv7s5WaQY4UuL0i0hNxOBGxjppGmdD08i5Ev1q6ufIbtvxiJrNGwe+V6fqd3czbs/Odx6B4f+t1HK/mKc515phjhH6ROhEdcC2TIqLqUlLstTKBN9Eh8aLqoKx9lTvddW8cewoKpU0vzMQlWSMz1p4ScnSN3oTxl+8zNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfVWEu2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E51FDC4CEE2
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737461189;
	bh=7/lQl2Dmp9thnSzFpG0XzJ9iOUGPsL3Rh44ndmHk5sc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FfVWEu2uUrjSepsK3YQ0B9jIzynGBO9KbQUgRLtZZ6NyAmE8rEh1n1dHKIMXWzRzm
	 n48cWm4PRUSjpjNONph6/WmGC/XepAhkwbKiw95XoSvhB0jEOcotyWJpBnLqO8y6qU
	 LvfWLCp0CvK9s/LfbLjkOR/sr4zQ+28lEuyoD0uTZqTrRUdUDhfZUQZaEpIYpuR3To
	 QaZgJTDOLWUJurlJXqqDUIA5B2huERFdynRN2dlitKhMObJuGtV9ZtepmG8zAyVQk7
	 w/obsx0ZQtlpxw1hMJWGTgEsoP2CccoTaj31uDAgVxOse6vCG+rL6TdSPW8aRiVMj2
	 StsJas64sZabA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D33FAC41612; Tue, 21 Jan 2025 12:06:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Tue, 21 Jan 2025 12:06:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-SM9wcXMHxj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #9 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thank you,=20

dmesg shows USB link goes to Inactive error state, and device needs to be=20
reset to recover, hence the disconnect

The USB Link Power Management (LPM) U1 and U2 states, and Max exit latency
(MEL) values look suspicious in the logs. An issue with these could cause l=
ink
error.

Does disabling LPM for the Realtek usb network adapter help?


This can be done by adding USB_QUIRK_NO_LPM quirk "k" for your device vid:p=
id
i.e. add "usbcore.quirks=3D0bda:8156:k" parameter to your kernel cmdline.=20

optionally remove xhci LPM support for Intel hosts and recompile kernel:=20

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2d1e205c14c6..57a6641fbcef 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -316,7 +316,7 @@ static void xhci_pci_quirks(struct device *dev, struct
xhci_hcd *xhci)
                xhci->quirks |=3D XHCI_BROKEN_D3COLD_S2I;

        if (pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL) {
-               xhci->quirks |=3D XHCI_LPM_SUPPORT;
+//             xhci->quirks |=3D XHCI_LPM_SUPPORT;
                xhci->quirks |=3D XHCI_INTEL_HOST;
                xhci->quirks |=3D XHCI_AVOID_BEI;
        }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

