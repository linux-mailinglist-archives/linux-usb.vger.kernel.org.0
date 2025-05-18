Return-Path: <linux-usb+bounces-24072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4F8ABB284
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 01:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125D93B2581
	for <lists+linux-usb@lfdr.de>; Sun, 18 May 2025 23:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD2A20B1F5;
	Sun, 18 May 2025 23:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYM1Gt5d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597512CA6
	for <linux-usb@vger.kernel.org>; Sun, 18 May 2025 23:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747611480; cv=none; b=SUVt04Zm1Ib8I8HoUbDrjaU4ztKEKCDnDUJRmSyrhB2xnN9+9LzNBBOXtcub+ccj0VuVIJfZ+gvXLpxkQXmfZwJrFL2KCDCJ4oqo3eA9hjtqLnhYInsJqosm2pCN2StVGOGcgP/lkG9kwMop8VxNapeURp7Zvup8aq01EsX9Zc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747611480; c=relaxed/simple;
	bh=jh7BIAe1wunhss9mL1rrKhFcoAXuscYE32CMz4NRo1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AHTmGybsdwrbg70tMvIbCrytSnul2z5Wm674g3u2Zn7vq6g5zE2BQpH6JdbhuW8tLvYYcYznnDYGlE80Fb2LIxLp2FiHRiP3Wu7CMWDB8qYUzrkvbOdNbNKi4lgLpYQ6O3JR8CnQ8+BMxzDOQYwb/1+l+VqJUr80PJSIc/xkiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYM1Gt5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2CC8C4AF09
	for <linux-usb@vger.kernel.org>; Sun, 18 May 2025 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747611479;
	bh=jh7BIAe1wunhss9mL1rrKhFcoAXuscYE32CMz4NRo1c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZYM1Gt5dnPcfC0QGTVTIGz5mJPuFmPr0u1FVBbZa3B5C0RzEcMYVPuIrCT7M6iYv0
	 eit4j+r6SLGNUhnv2CwvUah4MWnC4g4eFpA+YVUTunZeVebOX5WcM9p8vGfsnEl34y
	 sb4Uce0JAb7swwv4rqRzyX2KP0uJf5Dgcbv3dRYVl0x/yk3hSZZ5epJt0gGIFKIU42
	 kBXNN9I7TR5bzTuQCVXHHYWFQerzY4Cv7kkSORgJG+nA949WCmYjKP1LFCTq4VEDMm
	 argAqrYs5rZ9/LsrXGwpvvedDZX8c/ifQRi2s9ks7EbnCUlcpenfgqUzpfHus2wiRO
	 cuO9KSYBlmISg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B7661C53BBF; Sun, 18 May 2025 23:37:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 18 May 2025 23:37:59 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-vLhBCBPPa7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #54 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
avg_trb_len doesn't seem to be an issue for my ASMedia/Promontory HCs, they
still have their usual bugs after changing it to 8 as per spec.

By the way, the simplest way to break ASMedia chips is running
  while true ; do ifconfig ethN up ; ifconfig ethN down ; done
on a SuperSpeed NIC (AX88179 and RTL8153 known to work). This is what the l=
imit
endpoint interval quirk appears to be helping with, though recently I found
some case (NIC behind a SuperSpeed hub) where it didn't help.

I am also not convinced that the "clearing xHC resources" patch is relevant,
because it's hard to explain why nothing bad happens when you run reset
manually. I found no problems resetting devices on my AMD B350, ASM3142 and
ASM1142, despite the dubious command sequence always being there. Your logs
show malfunction before we even get to this point. Indeed, the reason the h=
ub
is being reset is because attempting to resume it normally suddenly failed.


So the outcome of testing is that the problem occurs if both the unlucky hub
and the unlucky webcam are present on the same X670 bus, and disappears if =
they
are on different X670 buses at the same time?

And it's happening on 6.13.9 or newer, but not on 6.13.7? I have no explana=
tion
for that...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

