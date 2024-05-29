Return-Path: <linux-usb+bounces-10679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EA8D3B24
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 17:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2ED71F266F4
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CA118131A;
	Wed, 29 May 2024 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7m1RA6v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90B7746E
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997145; cv=none; b=XiKmmfGwmKrJ4iAXdeUMDXMWPmHgPcvHi05I6oTs7N9r90QYCl2/wLQgrr+3Gsxgbg5NG2NKkCGvMdzr/V/FnH5zljUHvpRuWOYNMeg7euByu+0wpU+WKuzcFJcjITT2xwipw7BrijafmVvk6BG2gANYYdiQKl8HkH1PRSS7C1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997145; c=relaxed/simple;
	bh=y3UqdNYZA0A1HQvevb4038WmltLvB01Yi2g0N1JLe0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=shkFRu3vV/Ol4q2w7+mQhQ4RRJ9H0r+BO2Ns+7D2DgXS+LamIdcTg65KEWmrWFVp0NRQM2a9Unj2FmRb1lqPl757Lw4EWtWt5D0CYcxabPay0kG/3+SppbetTKIrO1jZRDT9Wg/4XSOcSfEAPpIt/x8GT/R/lz7geCchU4zoYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7m1RA6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37C94C2BD10
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716997145;
	bh=y3UqdNYZA0A1HQvevb4038WmltLvB01Yi2g0N1JLe0k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d7m1RA6vbY/kKKACdm4cyIROyvL99KmldWo8oiewOkwxWZfHLqsDHCsnBBm4G3KBk
	 D+tBBnDRpK8oNluy0Mp6SrLxwNy2wxV7k2npM3YPKkcIVMKR7+3iYgqnEBwTTw/OlJ
	 IUGZBMy5JhuTfJoH5K8is3I97RUSi2lclq6FBssTjAFHg2qEItdeJuu2V+K2z2ONL6
	 ER6R1mDKArPs6v50JSoNqspUQVQ9bwIuKcZgSPxbHPvqyXrHf2lWzZR3F/RJs9Jw5Y
	 yMS8EcvwM0HBs1t6KvzPoTllD4k/nLKE+X+zE7BYR+dX6qbQzJ1IGGE9Yks4MRkJcU
	 nHMdzbYrT3kgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FFA0C53B73; Wed, 29 May 2024 15:39:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 15:39:04 +0000
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
Message-ID: <bug-218890-208809-ljL7VkHudB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #9 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Traces show xhci driver sets the length of the cancelled 512 byte bulk tran=
sfer=20
incorrectly.

I'll attach a patch for that.

The 255 byte control transfer case is not that clear.
It stops on the data stage with a 'stopped' completion code, with 'len' fie=
ld
indicating residual untransferred bytes is 0.

 827.939738: xhci_handle_event: EVENT: TRB 00000001511921e0 status 'Stopped'
len 0 slot 2 ep 1 type 'Transfer Event' flags e:c

 827.939747: xhci_handle_transfer: CTRL: Buffer 00000001023cff00 length 255=
 TD
size 0 intr 0 type 'Data Stage' flags i:i:c:s:I:e:C

It's also unclear why these transfers don't go through

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

