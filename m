Return-Path: <linux-usb+bounces-17852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2E9D903F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 03:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581E8285294
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B393314A85;
	Tue, 26 Nov 2024 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnVL3pXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A68F58
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586753; cv=none; b=ByYC2VQifvJMjaZVdx8y2r6oI23L+d1kMwzLA/mRbl9EWql5iU63F7st+hYcmF+z70ygN9AvW3fKq/ey4D0Z+uOu+3kuZDLL3+JJIzqZQcI/djfOyw0GdQef8i3VdM5oBxHaFkZs5Z458lWJcbr1pG4GcEVoWBLOyHOoJxS/W9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586753; c=relaxed/simple;
	bh=RnJudMF+V2EC416fW4wBpdJ/7KNnIwpmao/4Xif/F28=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Irl4xZcbCUtRV7Bk+YUpe0pBcsLS8OFYEJIK4vnSCesxLur5AHOVybMkLmIgq+vQM4aGyRq3uKQ08eIG1CFelWi6vtl6PRKaScXNU5o22copPqa9L8mQ3xe56idkVssxgEqTmYf7+0HDWoRB3GTPHLfW6Zroea3u8NkVM0Kmq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnVL3pXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6180C4CECE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732586752;
	bh=RnJudMF+V2EC416fW4wBpdJ/7KNnIwpmao/4Xif/F28=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LnVL3pXOaDim7QI7c9oB3aUlI2Roav2u+nAiAnr7kF1Yag794kOyFvZT5CC/tLj+y
	 5ONVFRkdKRpx864k98R9CSA5w8pax2XU7oCa7AdVMxkKGK3y9q7gz+CshC5VdW5z2O
	 fETcz3Dr5E9Bn2aOEZsscY5pnIAS3YIg2eJ8bpN/5YmmNdRIaOe1OdHB8jMjPYwlxQ
	 OWc1yNIktKKLkCD8lUoi1BQMHODr3n6ptjGrNhmWebEMiNQR/poy2wBHDenWmX8KAj
	 Eb1eo0g3zI4Oq4o7SqqNc3Q4Boqe0dRT6cJ6X6Erpv0ttWOnK4G5uVn/aeFmCfRcal
	 ZtqLpp9lM4qsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2A64C53BC2; Tue, 26 Nov 2024 02:05:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 02:05:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219532-208809-DjiSMdSH9p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #4 from James.Dutton@gmail.com ---
c1:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b9 (pro=
g-if
30 [XHCI])
        Subsystem: Framework Computer Inc. Device 0005
        Flags: bus master, fast devsel, latency 0, IRQ 45, IOMMU group 17
        Memory at 90200000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: <access denied>
        Kernel driver in use: xhci_hcd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

