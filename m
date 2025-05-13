Return-Path: <linux-usb+bounces-23899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA1AB4F02
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 11:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348391771B8
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 09:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E64B211A0C;
	Tue, 13 May 2025 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbc/86Gy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8461F1513
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127850; cv=none; b=ZO8SL2rBPo8Xx09bgNdVi9vAXZCtP+c9+qP3hBee/iISij+0jtm6+7fIvefLD4uhgebMy46KuZ89Wzjlumn1ImHWomswDAYQP5D+0WafP1gXabrakKrnM8Ca+OHFSFnnRc2LNH8MjileW45Hvb8R74/FJl4d/ZBYBw0K3p99CAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127850; c=relaxed/simple;
	bh=xLjtJRFUpDTO41kea4Cpp6uBjQ79SJoYjce+L4PGry4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m42wy/afLSkRGX9c7scpdq4OPyEFkEQ9TJDo2wHd0Zt/uqmzaA6V9FSR0ZxplcqGN8iMSHV3G9q8ECFiF4pG14gK8tIFYkVJqE9C3gImAaCjxx+wxRPs3gj2xNRYZXW/EyOF7OOEIszg/pVKJiEMJpPNpMqxFnGux5Ieq/pCYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbc/86Gy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FB51C4CEEF
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747127850;
	bh=xLjtJRFUpDTO41kea4Cpp6uBjQ79SJoYjce+L4PGry4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nbc/86GyaTGH+Exq6+Fbt6DfMO2KKq2Cxbiuu/j3QhjBQo7Pyg7Wxns/EvMpSitR8
	 LovIRgzKr8Jq5brRMDCknXOzXrj+5ehQ0soZWTh/fnDPRY1BI+/gB8twgzwGNYRiRA
	 FaBLEf9SAdHaIGhy4T6qHv3p5wvNFfriGDoR/3V3m+TYN6WLZjI56gYRp30twKyTEq
	 qnH9+f/8zyzxAS2l2FKXNeTZkBjldKftMritXI32onVjZK5m7rMoNrPkUrKQcaNlhd
	 Q2t0oJO0BZO88Yh7rEKJZ/Y01sHu4NUVwYFPWt5SMGb+HFlO+6nphPJxUsZzsIJojZ
	 XQni921uCGnKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01AC3C4160E; Tue, 13 May 2025 09:17:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0
 during Address Device Command
Date: Tue, 13 May 2025 09:17:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jay.chen@siemens.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220033-208809-KeX2VFBT6W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220033-208809@https.bugzilla.kernel.org/>
References: <bug-220033-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220033

--- Comment #4 from Chen-Tzu-Chieh (jay.chen@siemens.com) ---
Hi Mathias & Micha=C5=82,

Thanks for your response.


I=E2=80=99ve already submitted a patch to fix this situation (by adding a l=
ine of
`ep0_ctx->tx_info |=3D cpu_to_le32(EP_AVG_TRB_LENGTH(8));` in
`xhci_setup_addressable_virt_dev`).

Link:
https://lore.kernel.org/linux-usb/JH0PR06MB7294E46B393F1CA5FE0EE4F78396A@JH=
0PR06MB7294.apcprd06.prod.outlook.com/T/#u


> This function is only called from add_endpoint(), which doesn't seem to e=
ver
> be called on EP 0. But non-default control endpoints would be set to 8
> indeed.


Yes, I misunderstood that function, and thanks for the explanation.=20
Inside `xhci_endpoint_init`, it sets `avg_trb_len` for the USB device's
endpoints while the `xhci_setup_addressable_virt_dev` function initializes =
the
input context (ref: xHCI 1.2, Ch. 6.2.5 Input Context), and EP Context 0
(Default Control Endpoint) is passed to the xHC hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

