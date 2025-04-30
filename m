Return-Path: <linux-usb+bounces-23570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF1AA4783
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 11:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41364E538C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 09:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08232376E0;
	Wed, 30 Apr 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1BKKyPD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6728123507A
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006157; cv=none; b=n+FsOVMpw3LGGxZwNVReibG6jOG7h3zOVxFzp4muIRWflNzPiOG4Swl1TzRG5gtjAyb8em/dEJa8CSnjGFN95TbFIb3pegVMZFpW4ouA4msLVwwOlVIqdwDURdsX9sNSF+s1XZvO5S0U9YK/zgjYRNTaH0QmyQwz8v7P/ZwGRQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006157; c=relaxed/simple;
	bh=8rQZSSrJh06iu8mZkPwqMm2PD8lOSarI8Fd4dduKYaU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X3INmcUSDrRUekRuFNUTiX6bCMQZrrte29HuTX9bunM7DgM9ThWF87I8YuiVvRrX7v+pMLcl2GY8MTqudQN7PNNsMIIhu4nxUA7aBtbHBMzh3JxeTGnXmXnGHFDOgmkHE2tBs3ey+XxJjt8tmTr2SKXuomR0O5NFUYienn/ensE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1BKKyPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2489C4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746006156;
	bh=8rQZSSrJh06iu8mZkPwqMm2PD8lOSarI8Fd4dduKYaU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y1BKKyPDrV3MD751yKXllkVgL0gMHnV1/tnWaY6XPDKBplq+TRBI2pHmkSM70Ki+I
	 jBkIlNh2VrkJOedmTzA5TmGQDkHeZfp8AGDhCWPDYXmcq1FKPzCMkeeM9i4ybBSN/F
	 RyQz+A/hcLkw78nvBzj+m+9tuiyu0ECctWBKkKusZVgyd3qkSMqrHxuDQc+TuFMP+P
	 s8BkxG5aSRZjnBETC42SjibFBC3mYvJIv0nAU4ILJ7xvGpKHqY2U7wiPlZZadPxCNu
	 nKc0UQ62j/UHft/bRiq9o5aNd/Cu0Om6wyM0zo8RzU176YVp8sRW2H2FU/6l4WOecS
	 P0jFFafUQF5cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C3A2AC41612; Wed, 30 Apr 2025 09:42:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 09:42:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-RmJ1n9dNK9@https.bugzilla.kernel.org/>
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

--- Comment #6 from Claudio Wunder (cwunder@gnome.org) ---
> If "abort failed" is what starts everything, this looks like a genuine ca=
se
> of hardware going bad for some reason, unlike the February "hc died"
> regression which was a trivial driver bug and the HW worked as designed. =
This
> may be harder to solve and HW specific, possibly including connected devi=
ces.

Here's some sample logs with the correct times, apologies for not providing=
 the
timestamps.

```
Apr 26 23:16:09 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Event TRB for s=
lot
18 ep 0 with no TDs queued
Apr 26 23:16:24 angel-thesis kernel: xhci_hcd 0000:6b:00.0: ERROR unknown e=
vent
type 4
Apr 26 23:16:24 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Abort failed to
stop command ring: -110
Apr 26 23:16:24 angel-thesis kernel: xhci_hcd 0000:6b:00.0: xHCI host
controller not responding, assume dead
Apr 26 23:16:24 angel-thesis kernel: xhci_hcd 0000:6b:00.0: HC died; cleani=
ng
up
Apr 26 23:16:24 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Timeout while
waiting for setup device command
```

```
Apr 26 23:16:24 angel-thesis kernel: usb 7-2: USB disconnect, device number=
 2
Apr 26 23:16:24 angel-thesis kernel: usb 7-2.3: USB disconnect, device numb=
er 5
Apr 26 23:16:24 angel-thesis kernel: usb 7-2.3.1: USB disconnect, device nu=
mber
10
Apr 26 23:16:24 angel-thesis kernel: usb 7-2.4: USB disconnect, device numb=
er 8
Apr 26 23:16:24 angel-thesis kernel: usb 7-2.5: USB disconnect, device numb=
er
13
Apr 26 23:16:24 angel-thesis kernel: usb 7-3: USB disconnect, device number=
 3
Apr 26 23:16:25 angel-thesis kernel: usb 7-3.1: USB disconnect, device numb=
er 7
Apr 26 23:16:25 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 3
Apr 26 23:16:25 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 5
Apr 26 23:16:25 angel-thesis kernel: usb 8-2: USB disconnect, device number=
 2
Apr 26 23:16:25 angel-thesis kernel: usb 8-5: USB disconnect, device number=
 4
Apr 26 23:16:25 angel-thesis kernel: usb 7-3.3: USB disconnect, device numb=
er
12
Apr 26 23:16:25 angel-thesis kernel: usb 7-3.4: USB disconnect, device numb=
er
14
Apr 26 23:16:25 angel-thesis kernel: usb 7-3.4.2: USB disconnect, device nu=
mber
19
Apr 26 23:16:25 angel-thesis kernel: usb 7-3.5: USB disconnect, device numb=
er
15
Apr 26 23:16:25 angel-thesis kernel: usb 7-5: USB disconnect, device number=
 4
Apr 26 23:16:25 angel-thesis kernel: usb 7-5.2: USB disconnect, device numb=
er 9
Apr 26 23:16:25 angel-thesis kernel: usb 7-7: USB disconnect, device number=
 6
Apr 26 23:16:25 angel-thesis kernel: usb 7-11: USB disconnect, device numbe=
r 11
```

```
Apr 28 18:54:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Event TRB for s=
lot
18 ep 0 with no TDs queued
Apr 28 18:54:28 angel-thesis kernel: xhci_hcd 0000:6a:00.0: ERROR unknown e=
vent
type 4
Apr 28 18:54:28 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Abort failed to
stop command ring: -110
Apr 28 18:54:28 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI host
controller not responding, assume dead
Apr 28 18:54:28 angel-thesis kernel: xhci_hcd 0000:6a:00.0: HC died; cleani=
ng
up
Apr 28 18:54:28 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Timeout while
waiting for setup device command
```

```
Apr 28 18:51:25 angel-thesis kernel: usb 7-3.4.2: USB disconnect, device nu=
mber
18
Apr 28 18:54:28 angel-thesis kernel: usb 7-2: USB disconnect, device number=
 2
Apr 28 18:54:28 angel-thesis kernel: usb 7-2.3: USB disconnect, device numb=
er 5
Apr 28 18:54:28 angel-thesis kernel: usb 7-2.3.1: USB disconnect, device nu=
mber
10
Apr 28 18:54:28 angel-thesis kernel: usb 7-2.3.2: USB disconnect, device nu=
mber
13
Apr 28 18:54:28 angel-thesis kernel: usb 7-2.5: USB disconnect, device numb=
er 8
Apr 28 18:54:28 angel-thesis kernel: usb 7-3: USB disconnect, device number=
 3
Apr 28 18:54:28 angel-thesis kernel: usb 7-3.1: USB disconnect, device numb=
er 7
Apr 28 18:54:28 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 3
Apr 28 18:54:28 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 5
Apr 28 18:54:28 angel-thesis kernel: usb 8-2: USB disconnect, device number=
 2
Apr 28 18:54:28 angel-thesis kernel: usb 8-5: USB disconnect, device number=
 4
Apr 28 18:54:28 angel-thesis kernel: usb 7-3.3: USB disconnect, device numb=
er
12
Apr 28 18:54:28 angel-thesis kernel: usb 7-3.4: USB disconnect, device numb=
er
14
Apr 28 18:54:28 angel-thesis kernel: usb 7-3.5: USB disconnect, device numb=
er
15
Apr 28 18:54:28 angel-thesis kernel: usb 7-5: USB disconnect, device number=
 4
Apr 28 18:54:28 angel-thesis kernel: usb 7-5.2: USB disconnect, device numb=
er 9
Apr 28 18:54:28 angel-thesis kernel: usb 7-7: USB disconnect, device number=
 6
Apr 28 18:54:28 angel-thesis kernel: usb 7-11: USB disconnect, device numbe=
r 11
Apr 29 10:05:16 angel-thesis kernel: usb 5-1: USB disconnect, device number=
 2
```

> Actually, a regression could conceivably be caused by a change in some de=
vice
> driver. And distro regressions can also be caused by changes in kernel
> .config, so you may want to ask them about that too.

I'll reach out to Fedora's Discourse/Universal Blue Discourse.

> Well, at the very least, it would be nice to see complete and unmodified
> kernel log from the event you are complaining about ;) The snippet quoted
> above, for example, appears to be in reverse order and I don't know why.
> Timestamps can useful too.

Here's the full dmesg log via `journalctl -o short-precise -k -b -3`:
https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7 (I shared =
on
GitHub Gist due to the large size, if you rather have me hosting it on a FO=
SS
alternative, let me know, I can upload it to gitlab.gnome.org)

> Going forward, does your system support dynamic debug and/or debugfs? Ple=
ase
> try:

Let me check and circle back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

