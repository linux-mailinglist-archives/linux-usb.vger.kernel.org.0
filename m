Return-Path: <linux-usb+bounces-19770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D78A1CBFA
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 16:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C011602C0
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 15:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E463217D358;
	Sun, 26 Jan 2025 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYvRV94D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5EC17E00E
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903970; cv=none; b=o8azOiHmArTQEzyo4sjLfFlAhWv9+QeY05yz0z8Z/olVhyb4DolRE06eLC/FhgIe3Q5llw1MLwt8N/Ah5OIQbhFChapxfR3gLVf0nIyLisFZMhj9j818tBvHgjsRcay48lCcWUXEEJpfxkDziyOk8tPKoPtOUi/VQN3KF3+4EcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903970; c=relaxed/simple;
	bh=ZO278hZPDQOzlo+N1oiYQmOKnnM+qIAkkWQmH8wACH4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=abnKdVAryXN+caYSKDdsGZX4t+SsujG2mqXhNgpCKP0y3jccgcl65RZGbTX3SfUW0wPNm9lwTFU4PvxyK4rCHTT5pPdahMPC7frbbz2xukjjXt1D3XMkxm0ZpO5Qmr8aQ7/uHFXgeE4i5rjEoUa+owGBn+BPvdLLMz0X8waoZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYvRV94D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B3C2C4CEE2
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903970;
	bh=ZO278hZPDQOzlo+N1oiYQmOKnnM+qIAkkWQmH8wACH4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YYvRV94D+iURlmWW58Pu4yV2TlEX+Ff9V7PSVHJe1EBe2wxSKu0Io0nLmyHbxrx6l
	 gikaV2+trm/X6eT21a1iLzOn4KFwWAILfybrRGzphb7xXNy653/TQISTOto516K5LI
	 1sI2TzguR1x1f28QKC3PbzoVVPcycvwX9LMQAOaGvoQZRoYq1kG5puqbwNddk5ffeB
	 J4VyYMeD9NaOBejpJ5YQM9uQjHSdCF/Y/2d84XplZQnF3Is/lBtsXoqexhDfM9iR/k
	 p85qZYoAD6keboNHy5FqpSscdEGVzdoHpVu/Ew8aGzaRHghdSSAWgFAMXKL9asEZVr
	 oMogJvKtFmJGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3BCA5C3279E; Sun, 26 Jan 2025 15:06:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Sun, 26 Jan 2025 15:06:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219726-208809-mPECfLXmzt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
It looks like one of two USB 3.0 controllers disappeared.

If it's Renesas, enabling CONFIG_USB_XHCI_PCI_RENESAS should bring it back.

If not, please post dmesg from 6.12 boot. There should be some xHCI error
message there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

