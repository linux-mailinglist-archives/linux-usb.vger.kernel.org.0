Return-Path: <linux-usb+bounces-3315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19C7F8F31
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 21:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB15028144A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 20:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47BA2942E;
	Sat, 25 Nov 2023 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+TdYvC1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C91EB29
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 20:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BCEDC433C7
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700945458;
	bh=SNLyiGxJkdq22hhwEYzFu+7gSujx74IfIOZmfLrUAS0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O+TdYvC1VcSFViqspRpHRS7JmKT/mdModgIi4Y40fDHR465VS3POXBPDweasyYdfG
	 OKCw7U0phR5wxDZ7m9bmF/1S9Oi9zLxlukbyJL/vNTIBA4QtMyx3zsb5kpp104NoFq
	 7Ttpbxj9Nfv0xDGLGyyMmqkWek+TKTeqnbiH8ztNfGZvS4Z5kVUE6LvJCQpZs3cO8H
	 9KK+EpRg1JL/lAyGwGax/MYnyLVt174iHLdvTKCeIjPrliMQOTry/CiRX9tLzImr6d
	 EigDpl/PzzDOA2gUX96cMq0wer9rq4xAxnjmfdKwraH6IL6QPtVPG4UtM4K9IF1Klr
	 LX+dEDms+P1CA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C403C53BD0; Sat, 25 Nov 2023 20:50:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sat, 25 Nov 2023 20:50:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-IYAaLGxbFG@https.bugzilla.kernel.org/>
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

--- Comment #32 from Ferry Toth (ferry.toth@elsinga.info) ---
By changing the allocation I just wanted to close the loop and prove this is
the trigger.=20

And maybe on other platforms than x86 an actual issue? What do you think of
Andy's suggestion to use dma_kmalloc_size_aligned()?

I still find it strange that the issue does not reproduce for you. I have b=
uilt
each kernel since this issue was introduced, with multiple compiler version=
s,
x86_64/i686 and it happens 100% of the cases. Could there be another related
CONFIG?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

