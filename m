Return-Path: <linux-usb+bounces-7988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831F87CD6B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 13:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F089284E76
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 12:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D98724A13;
	Fri, 15 Mar 2024 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3JSc+q0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E81A27E
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507011; cv=none; b=Rz2V8X9/uFXa1AgCXyYNhykQYDzFr8x5JH9kkRkHsPnzdaA6iMBihG/YkSxSIkG5qpuEtA8u/saeVvGniRleQkNQxCmOAECIbrlBO4rO82moNjQSEALiBsH6eOlwTnQ/tV1Z1zVgmtrmWwpEk08fRDPymKjFVB/FM58eETO2k/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507011; c=relaxed/simple;
	bh=xzEOvTyv6H3JeoR8pBiww2ccWMX4F0zGJeBNAUGoh6g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKgHkIMbxzRBNJppGeQztNpy1KxiFHb48S6MEX7NgPKfvdvFD8R37fSzUcJNneRzyIEOb0no1jQG72F5+6mqIFTM4AcKQFcrPnVQyP6xofu+bslv7k1hBhped/9gIWtG1lJXykKFHC1VeWU4Lf4lC18pAdkbwSNLeFTsKo2wnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3JSc+q0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1132AC433C7
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710507011;
	bh=xzEOvTyv6H3JeoR8pBiww2ccWMX4F0zGJeBNAUGoh6g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t3JSc+q0fb10fS2M4sb8ANdLgz/n8ad6ZI+mHhFSvFHbd0DWLIEjEVC63nih1xIpV
	 RiddoLJQkqc6hQEm87G/J5yNk+wB+gbw0VTYAIdGCgUGQixFcO7yyv2SfYy7PBJha9
	 FY5drNbwc9G0y/Jw+WZNFcViHKTxKpAkREdKPAD1MhdpGVeNCtJLMdxYa28t0uveJn
	 nAhpJvmmTy8PrjlSMz7WcMa0Yi9CHCBwFN6P+JSB3dEPTP8Jm/ykXUMVMFgbDfKnW+
	 93Je5gpiYLgOGBPLsv4S6C3guAy1BqaT4D3BaAfYDztHpqm024GGIxcxVQWj/2BJr+
	 97LDUtTbC2e2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02EA3C53BCD; Fri, 15 Mar 2024 12:50:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 15 Mar 2024 12:50:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218544-208809-w5TEy5gfzZ@https.bugzilla.kernel.org/>
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

--- Comment #17 from Ian Malone (ibmalone@gmail.com) ---
Created attachment 305995
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305995&action=3Dedit
wireplumber rule for 16bit input on conexant/synaptics hi res audio

Hi, I'll close this (wasn't sure what resolution to put, but doesn't matter
much). Some final observations though in case they help anyone else.

It turned out to be possible to use the device in 16 bit input and 24 bit
output without kernel modification. I'd thought this didn't work, but it tu=
rns
out to be an interaction between wireplumber and pavucontrol that breaks it:
changing device profiles (duplex/in/out) in pavucontrol changes the device
interface back to 24bit requiring a restart of wireplumber to reapply the 16
bit rule for the input, this messed up some of my testing. I couldn't see t=
his
happening normally as the connection failing means the format can't be seen=
 in
pw-top. However if the 16bit rule for the input is present then restarting
wireplumber after changing the profile does work ("systemctl --user restart
wireplumber").

The bandwidth profile then looks like this (bluetooth device 1-1.4 on bus t=
oo):
TT 1-1 port 0  FS/LS bandwidth allocation (us per frame)
    680  680  680  680  680  680  680  680
FS/LS budget (us per microframe)
 0:   63 125 125 125 125 117   0   0
 8:   63 125 125 125 125 117   0   0
16:   63 125 125 125 125 117   0   0
24:   63 125 125 125 125 117   0   0
32:   63 125 125 125 125 117   0   0
40:   63 125 125 125 125 117   0   0
48:   63 125 125 125 125 117   0   0
56:   63 125 125 125 125 117   0   0
1-1.4 ep 81:    24 @  0.0+1 mask 1c01
1-1.1 ep 84:    39 @  0.0+1 mask 1c01
1-1.1 ep 01:   458 @  0.2+1 mask 003c
1-1.1 ep 81:   159 @  0.1+1 mask 7802


The pipewire lua rule for this is attached.

(I must have misunderstood the scheduler comment about >125us transfers nee=
ding
to start on a fresh microframe, since the unmodified scheduler seems to be
combining the 458 and 159us transfers (going by the budget, not sure how to
interpret the mask information.)

Although the two channel input takes more bandwidth than single channel it =
does
appear to fit. The two other devices I've got have identical chipsets, so h=
ard
to draw wide conclusions, but they only have 16bit single channel input, I
suspect that's more common, but hard to find reliable information on this t=
ype
of device. Fully duplex 24 bit mode doesn't work with the current scheduler=
, we
already knew that. Packed as above it would run over to 67us in microframe 7
and only 30us are allowed there (and possibly an issue with where
split-completes sit?).

Hacking the sound/usb driver module to force the 16bit output mode to maxim=
um
packet size 384 works fine (if forcing wireplumber to 16bit everything then
duplex now works and sound quality fine). I'll report that as a sound/usb b=
ug;
it's possibly addressable as a device quirk, although I couldn't get that
working on my own and had to resort to a brute force hack:
--- sound/usb.orig/stream.c     2024-03-08 10:19:27.430507385 +0000
+++ sound/usb/stream.c  2024-03-12 16:13:43.212737555 +0000
@@ -690,6 +690,10 @@
        fp->ep_attr =3D get_endpoint(alts, 0)->bmAttributes;
        fp->datainterval =3D snd_usb_parse_datainterval(chip, alts);
        fp->protocol =3D protocol;
+       if(le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize)=3D=3D768){
+         get_endpoint(alts, 0)->wMaxPacketSize =3D cpu_to_le16(384);
+         usb_audio_err_ratelimited(chip,"overwrote in stream");
+       }
        fp->maxpacksize =3D le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSi=
ze);
        fp->channels =3D num_channels;
        if (snd_usb_get_speed(chip->dev) =3D=3D USB_SPEED_HIGH)

(Overwriting the usb drivers MaxPacketSize rather than sound/usb's structur=
e,
the later doesn't seem to work.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

