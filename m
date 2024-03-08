Return-Path: <linux-usb+bounces-7735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991988768C5
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8E81C20F8B
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 16:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C5AFBEA;
	Fri,  8 Mar 2024 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW1CB4/I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693036D
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709916422; cv=none; b=tuRnLQsVmGSrjxzt3OTfOBzyFXKeMSZFHBLn8l2vzKBvt0YtNIveIvJPfS50b5wAvudSQEWaaCVrd6rRX/Ro9+1nujKeaTyb/ILooj+qsmulI7rO9hsNrMEhVEcsofuKRfWkVpbqTKav6pfvFqo8myxsJnuvEeo2XI5CYiiQ5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709916422; c=relaxed/simple;
	bh=WRovJdvAPKFK8MbhG4uBvrLD0KZz4n54teCxj4AnH/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cqy6iLD9bgPNHH31hNPzAa7Bgm3+IZoFiY9M02PJ48iJfsfUVCmqbDUZoY9v5GnuxdcgDpZHRjtECnhMUayj7jYWpi/RsF785vdYyKlAjDcOWvgCsZMczwrM0U0AwtffZM7XGo05LEesCvwZpGMDWgnuBpaYflRHz9MRjRvXstA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hW1CB4/I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E9C8C43390
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709916422;
	bh=WRovJdvAPKFK8MbhG4uBvrLD0KZz4n54teCxj4AnH/c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hW1CB4/IJhEi8thq7RkzEzcIrODU9mpUO4NLkpKTBS+a22k2rjczOyKQADgsYuXZr
	 Jfn1wY4CTeQQ6iSO+Yy/JdmEsxtMq5KkrYgd9q+pLY/S1hH4nQFiqWvO8c3CT4BXNL
	 /LqgP5NjoMXtfWn7I8YmvOunIYGZM634QQ73+zFqGF/29D5Vg/FsdI6uAcvw2cKEJ8
	 clad5iPfGy8B7Vnl7UaDMH0Ms1kXF7k4OSpncdXfDa5AwYdPnb+WylxYCv1o4+xnZV
	 0HAbQuNPDkxz0n7eA1XxtQXCp8CvrssJFXXNREEgxPUbWnY4BEOeK1e05SQNSX356Q
	 CB8CIS86zW0EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2E66C53BD0; Fri,  8 Mar 2024 16:47:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 08 Mar 2024 16:47:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-rPJm0nU4vZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #14 from Ian Malone (ibmalone@gmail.com) ---
I wrote the following before seeing your most recent reply, but it's a bit =
long
to rewrite...

Not suggesting this as a patch, but it turns out that if you flip the order
that microframes get assigned then it will all get packed in:

--- /tmp/drivers/usb/host/ehci-sched.c  2024-03-04 18:25:48.000000000 +0000
+++ linux-6.7.5-200.prom.fc39.x86_64/drivers/usb/host/ehci-sched.c=20=20=20=
=20=20
2024-03-08 14:09:08.085984284 +0000
@@ -868,11 +868,13 @@

                for (i =3D qh->ps.bw_period; i > 0; --i) {
                        frame =3D ++ehci->random_frame & (qh->ps.bw_period =
- 1);
-                       for (uframe =3D 0; uframe < 8; uframe++) {
+                       for (uframe =3D 7; ; uframe--) {
                                status =3D check_intr_schedule(ehci,
                                                frame, uframe, qh, &c_mask,
tt);
                                if (status =3D=3D 0)
                                        goto got_it;
+                               if(uframe =3D=3D 0)
+                                       break;
                        }
                }

With the 24bit interfaces (default behaviour, no forcing formats in pipewir=
e,
the bluetooth device still enabled):
FS/LS budget (us per microframe)
 0:  125 109 125 125 125 125  21   0
 8:  125 109 125 125 125 125  21   0
16:  125 109 125 125 125 125  21   0
24:  125 109 125 125 125 125  21   0
32:  125 109 125 125 125 125  21   0
40:  125 109 125 125 125 125  21   0
48:  125 109 125 125 125 125  21   0
56:  125 109 125 125 125 125  21   0
1-1.1 ep 84:    39 @  0.5+1 mask 8020
1-1.4 ep 81:    24 @  0.5+1 mask 8020
1-1.1 ep 01:   458 @  0.2+1 mask 003c
1-1.1 ep 81:   234 @  0.0+1 mask 3c01

I guess this is because of an asymmetry (after your reply: probably related=
 to
what you mention about interrupt packets in later microframes):
microframe-spanning transfers start with full microframes but will usually
finish on partially filled ones. On top of this the seventh uframe is allow=
ed
only 30us, so filling from the back prevents the first microframe being
partially occupied by transfers and forcing any microframe-spanning transfe=
rs
forward a frame. This causes the space single microframe transfers can fit =
into
to become a little more fragmented than it would otherwise be. In the case
where:
39   0   0   0   0   0   0   0
is in place then adding a couple of larger transfers:

39  125 109 0   0   0    0   0

39  125 109 125 125 125  83x 0
                          ^ no longer fits (<=3D30)
It's still not optimum which terminating partial microframe is best to put
where will depend on the smaller transfers to be fitted in, but there's one
less gap.


The 16bit output (608us per frame) still wont work in duplex, but this is
unsurprising as the limit is 6*125us+30us=3D780us, while the 608us output p=
lus
the smallest input (159us) and the 39us HID comes to 806us, so there's no w=
ay
to fit it. I do wonder if snd-usb-audio would be able to help there by usin=
g a
smaller packet size in the output streams.=20

The bluetooth controller is 12Mbps too and wants to open extra endpoints if
anything connects, so I'm actually better plugging into the other bus, but =
at
least this is due to absolute bandwidth limits. It's actually possible to g=
et
away with duplex bluetooth audio (sMBC) and usb audio from this device on t=
he
same bus if I use the 16 bit input format:
TT 1-1 port 0  FS/LS bandwidth allocation (us per frame)
    713  713  713  713  713  713  713  713
FS/LS budget (us per microframe)
 0:  125  67 125 125 125 125  21   0
 8:  125  67 125 125 125 125  21   0
16:  125  67 125 125 125 125  21   0
24:  125  67 125 125 125 125  21   0
32:  125  67 125 125 125 125  21   0
40:  125  67 125 125 125 125  21   0
48:  125  67 125 125 125 125  21   0
56:  125  67 125 125 125 125  21   0
1-1.4 ep 81:    24 @  0.5+1 mask 8020
1-1.1 ep 84:    39 @  0.5+1 mask 8020
1-1.1 ep 01:   458 @  0.2+1 mask 003c
1-1.1 ep 81:   159 @  0.0+1 mask 3c01
1-1.4 ep 83:    17 @  0.1+1 mask 3802
1-1.4 ep 03:    16 @  0.1+1 mask 0002
(Let's take a moment to admire what a compressed codec can do.)

Not sure if this is a good idea or actually legal by the USB spec of course=
...
(My knowledge of which is limited to a recent skim though the EHCI
specification, although I think from fig 4-17 start splits are issued the
microframe before the transfer starts, a transfer starting in microframe 6 =
has
its start-split in microframe 5, although I'm not clear if it then spans the
frame boundary, it it fits in microframe 6 on its own does it use a
complete-split instead? And if starting closer to the front the it should be
fine.)

(Also after your reply: I suppose the different rate support is intended for
playback only modes? Although 96kHz makes more sense recording than playing
anyway...)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

