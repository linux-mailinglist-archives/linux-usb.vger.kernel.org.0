Return-Path: <linux-usb+bounces-26070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C793B0D1D1
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 08:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07FAD1AA686D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 06:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161DB28AAE0;
	Tue, 22 Jul 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2f+2+lb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A681A29A
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 06:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165641; cv=none; b=P70Iz9KtK9qKedAE8niLxnm0/Vmm23Q2JdIiMXt9++Z1F3sok5klIBXZEIZSwIuwe0e8nT9Wiv8TAjnqZP4QyU3A7TOA83/XGCkSpb05H8UvLAAcSeQpBan52WJm9GIhheafdLSFNhA9x1nUPyTAOFRCiVV4vPPSfPNK+7eolL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165641; c=relaxed/simple;
	bh=wJQShPAJuwJSYSjsi+QH53FcW6LbrGPDdcEeUdyo6nA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mI9xK729W1dOFGmLWdzIdhTlOzTn835YdPPthzgw5EnUXIgVIRszx7W5HAHxgEQoyyS+x4OmEOHmYfSY24EeOoPpiWfkcKWqlTvdtpBeFGAzADUqekdrVRdEG2vq6lqdNbWX9HPBsqx23nkP9cDAMgwEnAhXqqK60QD8pNoL+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2f+2+lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 140E3C4CEEB
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 06:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753165638;
	bh=wJQShPAJuwJSYSjsi+QH53FcW6LbrGPDdcEeUdyo6nA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j2f+2+lbxhzXhs+8DTcUQaNmCyKyG3hBb9fYIfZSxsz5Yz9POxiOYLhH9aBu4UPW5
	 YdblRnDuXTmNiQlJy6cuenyD7i4t35WH1wxpCAuYoLUw8sFBBYGwi4u1CwcRjAYYWB
	 2+ZTBwLoX1pwaUFjl9JakUaF2ZfJcjBX5q8RLHxOXzuNs6Jq1mOE2UU8FN01FAvXcA
	 wpzaGjKGsdFOxNwcFzb9rl0Cn0p7rFBJYZymv94PNGhFLhijNYqigFnRDGxuqI3UfR
	 RHKp4U7GJfagXiDFMr0hUfZzBHMdc5w2qsD9idrwp1MhxmielzoOym52vfJOz6W9cF
	 L6whzF73pHVcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01253C3279F; Tue, 22 Jul 2025 06:27:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220307] USB cannot submit urb disconnecting sound card
Date: Tue, 22 Jul 2025 06:27:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220307-208809-akvCwuCfx7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220307-208809@https.bugzilla.kernel.org/>
References: <bug-220307-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220307

Niklas Neronin (niklas.neronin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |niklas.neronin@gmail.com

--- Comment #1 from Niklas Neronin (niklas.neronin@gmail.com) ---
(In reply to Evgenii from comment #0)
> Just got an error that looks like that in dmesg. Not sure what made it su=
ch,
> just using sound card with Pipewire on 192000 Hz, 53 samples quantization.
> This leads to about 0,275 ms delay while preparation of node to play sound
> takes about 0,250 ms when VLC starts playing a video. Pw-top reports about
> 0,3 ms delay in Busy field if that matters. With 64 samples there was no
> issues with preparing the node to start playing and had no conflict with
> hardware using standard Arch kernel 6.15-4-arch2-1. So seems this is a USB
> bug when sound card drops off and gets up stopping playback of sound while
> video goes further.
>=20
> [  321.031944] usb 1-9: USB disconnect, device number 4
> [  321.032030] xhci_hcd 0000:00:14.0: Event dma 0x000000015a8ee570 for ep=
 5
> status 1 not part of TD at 000000015a8ee580 - 000000015a8ee580
> [  321.032032] xhci_hcd 0000:00:14.0: Ring seg 0 dma 0x000000015a8ee000
> [  321.032033] xhci_hcd 0000:00:14.0: Ring seg 1 dma 0x000000015a8ef000

Looks like the we receive a Transfer Event with Transfer Event with a
completion
status of "Success," but its corresponding TD is no longer in the driver's
internal list.

> [  321.032037] usb 1-9: cannot submit urb (err =3D -19)

USB-audio driver can still submit URBs while the device is being disconnect=
ed,
resulting in this harmless error message.

It's hard to tell from this short log what may be causing this issue.
The root cause probably occurred before this snippet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

