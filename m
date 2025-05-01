Return-Path: <linux-usb+bounces-23603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4496AA5CC2
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 11:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7644E9847BD
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 09:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C63D20E03C;
	Thu,  1 May 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeYs1ys2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683F155A4E
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746092897; cv=none; b=LOyhPn6HuoMS/wK7yca/1t9G1W0bl6EYFvxoFMDRFiK/k8iPKYY1kLOlBjy/jawhKCiIH3gZr47EY0ps826MbPHWRN0Xav5pf8Seok14iilvwBLkBYqT0XX8zjTpiM3c+RRKRPNS8j3bUR0ybdGXoK70O6sCc1M14kGSPidahAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746092897; c=relaxed/simple;
	bh=GxvUuD8kf5anTNRmmr4i5HTOY4i2mUvUYv25cnBh8BI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YyAXwTrEuO8lthK2/kUC+dYj0qll6jFZyguNcBx4GgsWvrVW8FaBUJmeNdkSQizhsWcD8yAqq2HrmHrjlZ/uIyK+LOxDBlhQFtupLqkJESqwLu01KX+NOwLMM6n6c2UjCsJma1mHqJzUrfTmSQlYj2WZnL9aqdvAteukfiFZPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeYs1ys2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37224C4CEED
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746092896;
	bh=GxvUuD8kf5anTNRmmr4i5HTOY4i2mUvUYv25cnBh8BI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SeYs1ys2opkb1Jk4ggyPAK4bjkDajFh3YPXOHseHPRfxs/IdKRZNQurG13m1xqzpR
	 6kdraNCLr7oNqnfA0e5TpLwf38IGJaUXUYKjAB2pLEzJkm7dC0WmtwCHBqoC99607o
	 hAF9NPWQX4sGZRk+q8jzMC0ArRJPrFyDX6Sza+E68ZIeXCQYDUkDJX/tQHJmQTuBNN
	 rHQLDzbXh9oVQ3D/b5lGTL7d+v3/h3S8By6GIAjzlX7toDFijW26UfDK7QFtrROOj1
	 hhPPFU97loSoGuNioTcvm3q4CMLTgaLNnvlOHnA4W18ZjV9apK+U9KTMVvg+qKJs3s
	 AGUibEsv6eJzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29271C433E1; Thu,  1 May 2025 09:48:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 01 May 2025 09:48:15 +0000
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
Message-ID: <bug-220069-208809-5YDVZMFW4Q@https.bugzilla.kernel.org/>
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

--- Comment #14 from Claudio Wunder (cwunder@gnome.org) ---
> "xHCI host not responding to stop endpoint command"

The closest log from all my previously stored logs within journald to "xHCI
host not responding to stop endpoint command" is "Apr 21 11:23:10.258699
angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI host controller not
responding, assume dead"

Here are some more logs:

```
Apr 21 03:14:59 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Event TRB for s=
lot
4 ep 0 with no TDs queued
Apr 21 04:20:16 angel-thesis kernel: xhci_hcd 0000:6a:00.0: ERROR unknown e=
vent
type 4
Apr 21 04:20:16 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Abort failed to
stop command ring: -110
Apr 21 04:20:16 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI host
controller not responding, assume dead
Apr 21 04:20:16 angel-thesis kernel: xhci_hcd 0000:6a:00.0: HC died; cleani=
ng
up
Apr 21 04:20:16 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Timeout while
waiting for setup device command
```

> if you also saw "ERROR unknown event type <some number>" a few seconds be=
fore
> "HC died". Do you still have those logs by any chance?

Yes!

```
Apr 26 23:57:40 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Event TRB for s=
lot
4 ep 0 with no TDs queued
Apr 26 23:57:40 angel-thesis kernel: usb 8-3: Device not responding to setup
address.
Apr 26 23:57:55 angel-thesis kernel: xhci_hcd 0000:6b:00.0: ERROR unknown e=
vent
type 4
Apr 26 23:57:55 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Abort failed to
stop command ring: -110
Apr 26 23:57:55 angel-thesis kernel: xhci_hcd 0000:6b:00.0: xHCI host
controller not responding, assume dead
Apr 26 23:57:55 angel-thesis kernel: xhci_hcd 0000:6b:00.0: HC died; cleani=
ng
up
Apr 26 23:57:55 angel-thesis kernel: xhci_hcd 0000:6b:00.0: Timeout while
waiting for setup device command
Apr 26 23:57:55 angel-thesis kernel: usb 7-2: USB disconnect, device number=
 2
Apr 26 23:57:55 angel-thesis kernel: usb 7-2.3: USB disconnect, device numb=
er 5
Apr 26 23:57:55 angel-thesis kernel: usb 7-2.3.1: USB disconnect, device nu=
mber
10
Apr 26 23:57:55 angel-thesis kernel: usb 7-2.4: USB disconnect, device numb=
er 8
Apr 26 23:57:55 angel-thesis kernel: usb 7-2.5: USB disconnect, device numb=
er
13
Apr 26 23:57:55 angel-thesis kernel: usb 7-3: USB disconnect, device number=
 3
Apr 26 23:57:55 angel-thesis kernel: usb 7-3.1: USB disconnect, device numb=
er 7
Apr 26 23:57:55 angel-thesis kernel: usb 7-3.3: USB disconnect, device numb=
er
12
Apr 26 23:57:55 angel-thesis kernel: usb 7-3.4: USB disconnect, device numb=
er
14
Apr 26 23:57:55 angel-thesis kernel: usb 7-3.4.2: USB disconnect, device nu=
mber
16
Apr 26 23:57:55 angel-thesis kernel: usb 7-3.5: USB disconnect, device numb=
er
15
Apr 26 23:57:55 angel-thesis kernel: usb 7-5: USB disconnect, device number=
 4
Apr 26 23:57:55 angel-thesis kernel: usb 7-5.2: USB disconnect, device numb=
er 9
Apr 26 23:57:55 angel-thesis kernel: usb 7-7: USB disconnect, device number=
 6
Apr 26 23:57:55 angel-thesis kernel: usb 7-11: USB disconnect, device numbe=
r 11
Apr 26 23:57:55 angel-thesis kernel: usb 8-3: device not accepting address =
3,
error -62
Apr 26 23:57:55 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 3
Apr 26 23:57:55 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 5
Apr 26 23:57:55 angel-thesis kernel: usb usb8-port3: couldn't allocate
usb_device
Apr 26 23:57:55 angel-thesis kernel: usb 8-2: USB disconnect, device number=
 2
Apr 26 23:57:55 angel-thesis kernel: usb 8-5: USB disconnect, device number=
 4
```

```
Apr 28 18:54:12 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Event TRB for s=
lot
18 ep 0 with no TDs queued
Apr 28 18:54:12 angel-thesis kernel: usb 8-3: Device not responding to setup
address.
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
Apr 28 18:54:28 angel-thesis kernel: usb 8-3: device not accepting address =
3,
error -62
Apr 28 18:54:28 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 3
Apr 28 18:54:28 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 5
Apr 28 18:54:28 angel-thesis kernel: usb usb8-port3: couldn't allocate
usb_device
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
```

And it happens indeed a few seconds afterwards.

> So if you ever seem command abort timeout, either the abort code is buggy
> (and it looks like no one touched that part in ages) or the chip is buggy=
 in
> one way or another.

That's interesting.

> These are present in all 6.12 and higher releases from this year, so the =
only
> supported kernels without them are old LTS series. Not sure if you have m=
eans
> of testing those for a few weeks on the same HW, userspace and workload?

Ill wait for the issue to happen again, so I can at least upload the debugf=
s;
Then Ill attempt to switch to an older Kernel version (6.12.X) if needed.

> I could also suggest some stress tests which exercise this code (and the =
USB
> controller). I found webcams and USB serial dongles to be particularly
> suitable, do you have some of such stuff at hand?

You mean simulated code? Like Prime95? On the dongles/connected USB devices
(here's a screenshot of the USB Devices Tree:
https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7#file-scree=
nshot_20250501_113016-png)

But pretty much:

- There's a RodeCaster Duo connected to one of the USB rear ports
 - Note that this has two (2) USB-out ports to connect to two devices;
- There's a KVM switch from Anker connected to another USB port (Model Numb=
er:
A83K3) with a keyboard (Wooting 60HE+ and a Logitech Bolt dongle connected =
to
it (mouse wireless dongle))
  - 2nd RodeCaster Duo USB port also connected there.
- I'm using a Monitor with an USB-B hub (Supposedly USB 3.2, per monitor
settings, but Linux recognises it as a USB 2.0, possibly because bandwidth
negotiations are at 2.0 speeds; either with webcam on idle or non-idle) whe=
re a
webcam (Insta 360 Link 2C) indeed is connected.

To be honest, neither of these devices are bandwidth hungry, even the webca=
m is
capped at 2K but always on 1080p/i

There are a bunch of integrated peripherals appearing there such as ASMedia=
's
ASM Controller (ASM107x whatever that is, and seems to be shared on two xHCI
controllers); The Bluetooth Controller, LED controller and the AIO Pump
Controller.

It is really hard to say if any of these devices are somehow crashing the x=
HCI
controller, and I believe it might be crashing a specific one? For example,
Audio on my RodeCaster Duo and Bluetooth keep working when that said crash
happens (not sure if this is important info), but all other devices (like my
mouse, keyboard) stop working (I already tried to plug on different front
ports, but not rear ports)

And from the Logs, it is exactly the controller that all my peripherals bes=
ides
the back port of my RodeCaster Duo is.

```
Manufacturer: Linux 6.13.9-103.bazzite.fc42.x86_64 xhci-hcd
Serial #: 0000:6a:00.0
```

(This one contains all my devices, mouse, etc); Except for Bluetooth and the
1st RodeCaster Duo port.

```
Manufacturer: Linux 6.13.9-103.bazzite.fc42.x86_64 xhci-hcd
Serial #: 0000:68:00.0
```

And since all integrated mobo peripherals are on the former one, I'm assumi=
ng
maybe it could be related to some integrated hardware, as you mentioned bef=
ore?

It's really hard to know now without the logs, so I'll stop my assumptions.

> A simpler thing is to try different USB ports (rear or front panel) and s=
ee
> if any are connected to different (probably in-CPU) controllers.

Yeah, that's what I described above.=20

> Your problem seems to be HW specific, because others generally stopped
> complaining after 6.13.7. I have heard about one more case of "Abort fail=
ed
> to stop command ring: -110" and suggested filing a bug here, but the repo=
rter
> never did.

I worry I am wasting too much of your time, tbh. Genuinely speaking, no idea
what's going on besides of "I definitely would like a solution for this" and
contribute as much as I can with reporting a bug that may or may not be
affecting other users.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

