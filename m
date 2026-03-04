Return-Path: <linux-usb+bounces-33954-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FF0KR/4p2l1nAAAu9opvQ
	(envelope-from <linux-usb+bounces-33954-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:15:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516BE1FD65A
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76E01302DA8E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1633947B1;
	Wed,  4 Mar 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSwt2STH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BC364EA7
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615707; cv=none; b=Yz9GelO4GXOilSchqP+gjK3QCsJIBVztH2IGBiDuxPJHTi3HR5MolvoHL90NKGC+fZxYDH6G2mrkgNOAVT2xPIvqGbZkyygM3TJfWv2sZCTEshNxC2ykfwahrnlsoMa7eOgCt5HwiiZB9cNtOlHWmEY97KzfC5uWoXpi8I8JfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615707; c=relaxed/simple;
	bh=61e3xMCym/s1xbOCzNo2WAqD+5UDm1q0+oFhYXpddgE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bC7rOwZuqmdQToq00UYQ2F7mOpnETNuV3J8Q4lBBMqZgjYFeJJp5MSvK/R/MFQ92p367mDpDqI3gKDHDWcDetoD7LbjVEfIePxiBN6mmV8gUuFpcDqSevCTegAMqDpi5pBq+kZAQBHlN40axVPq78RS0ax+V4KtcMl04+MTKquo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSwt2STH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC538C2BCB0
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615706;
	bh=61e3xMCym/s1xbOCzNo2WAqD+5UDm1q0+oFhYXpddgE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LSwt2STHyvGSz2Gkj2g7HKkqLNLJ6xaOTcckTORNXMNoFjHJ9Q96cy/q8bEfLanjW
	 6pROvuoPlKdkG2E22oIFikTI5AWBV12A998gOGgDDXEmoAh7AENbgkR9Zv+uoYXwTx
	 b/BIejg8D7wt1OpfHukh2CvyXD729AiSW60RsSNlS5cVjzl4HyG1Wh9zahYoFcvLXc
	 B8bfMh9HmHbHtjb2JaVRRnfYE/uo+lEZtJz/Ac3IIRm+IyS5m15Ax0p2V+75ubfKmA
	 aYgxRpB4mOI+lPww/lC8HOK+SyxSMDzAbfsjjAHCGTBXNavps/VJCDxyxPNQZfySy+
	 c2M5Z/e8Hk91w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D16A7C53BC7; Wed,  4 Mar 2026 09:15:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 04 Mar 2026 09:15:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-NiiaGhDjkn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 516BE1FD65A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33954-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #31 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
you lspci showed MSI-X are used for this controller.
c1:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Strix Halo
USB 3.1 xHCI [1022:1587] (prog-if 30 [XHCI])
        ...
        Capabilities: [a0] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D1 Masked-

Are the other xHCI hosts also using MSI-X, or just this one?

Are there any changes in any of the PCI MSI and MSI-X capabilities fields=20
after resume, like address field?
check with lspci -vvv before and after resume.

Does moving the xHC irq to CPU0 before suspend help?
(check actual xhci irq number from /proc/interrupts, assume 25 in example)
echo 1 > /proc/irq/25/smp_affinity

Another thing to try would be to force MSI interrupt instead of MSI-X.
Not sure if there is an easy way to do this, couldn't find a kernel paramet=
er
for it.

One way to do it is to modify xhci driver:

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..3acb6ad86f4e 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -167,7 +167,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

        /* TODO: Check with MSI Soc for sysdev */
        xhci->nvecs =3D pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-                                           PCI_IRQ_MSIX | PCI_IRQ_MSI);
+                                           PCI_IRQ_MSI);
        if (xhci->nvecs < 0) {
                xhci_dbg_trace(xhci, trace_xhci_dbg_init,
                               "failed to allocate IRQ vectors");

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

