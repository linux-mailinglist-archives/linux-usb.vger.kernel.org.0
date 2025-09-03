Return-Path: <linux-usb+bounces-27509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE40B42959
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 21:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28D741BC4AD5
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C932D9482;
	Wed,  3 Sep 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6RtkASq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CB2D373E
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926012; cv=none; b=jMtmWF9AFcSUzr/GoTPftLuxxCcFobqh0wnIrxeVNmEXcfqQqnORI7eicGQZZEPMYQjzXlk0uRBTRSd9cAUmAT8JZ4bKy8gxjxHylIDVIff5LQo8UdW/Rr+sImWVrmOvCE4u6dJ1y3WbKmWvf9DLm/ykgTRrJ/7bcZq8u+4hliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926012; c=relaxed/simple;
	bh=7genJ6xMU2Tnz7znyg25faH4YIFlvpZ5SHRBX9/NKTY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IZ3qCk3NBoAg2KbAJvk7ps6SsRzs+8yEpD8xXoHSsr/dop2pljZH9eTnXFncmhEPWVovyveW+mh7in7uJ1GwR+JvBHbMIex7VcJpse+O2h/f3KnNleQ5VZ9kkMAW35IbDVM/TAkImZzveRzSzF+yfe+1flkU34FGg8gZTz4IfuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6RtkASq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DE42C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756926011;
	bh=7genJ6xMU2Tnz7znyg25faH4YIFlvpZ5SHRBX9/NKTY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k6RtkASq27+wqpMhgQ15A+ZgQ8l1bDAJ7El1sl8+xfIlFg1Pt7dHlyFqB5Bqtt5lH
	 AFuyFI+FrVlEG6BBBhrX6aCqsc1eEO/nJ2pB1OA8f89kaQjNke7tqajoQZeO5ApsnG
	 SVNt5KrxUR1coVBJoAqSTpkQIBIpQYGCWx+/6WYPJT2NXBRQJZ6WCCENinm4CFUItY
	 W+20wSMVvIIgYCWHaOMLSqmuQ1wOI8rs4DQXX7Qf7z62pYT1/Dx0zeL59fMEi79c0S
	 ORdYqnZTK6aQHDuIvZRsKy9a5GeDPBvhorn55H4rTFmZ1fFx8aYUylZ5SmbQnuEzGH
	 ojQbj7JhFHC9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3161BC4160E; Wed,  3 Sep 2025 19:00:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 19:00:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-m3B11rD3Cn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #29 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I think it somewhat important to say why I reported the Samsung problem
initially when I think that the emb-qm77 board may be a better canonical
example. The emb-qm77 board appears canonical to me only in that the proble=
m is
reliably repeatable. The Samsung laptop is actually canonical in the relati=
ve
worth of a kernel fix. The emb-qm77 machine has 5 SATA ports, so I would not
dream of actually using its USB 3.0 ports for mounting storage devices that
need to survive suspend/resume.

On the other hand, the Samsung laptop has only one m.2 SATA slot and one SD
card slot. Right now, the ativ9 contains its original Samsung 256GB m.2 SATA
drive and a Samsung 512GB U1/A2 SD card. I use the SD card for
larger/downloaded files: video, images, audio, pdfs, downloaded web pages,
compressed tarballs, and the m.2 SATA drive for everything else. The ativ9 =
SD
card reader limits the SD card to ~20MB/s, rather less than its 100MB/s U1
rating. Even at 20MB/s the USB 3.0 connection can theoretically support 40K
512B transactions per second. This is more than the few thousand specified =
for
the SD card's A2 rating. Knowing USB, though, the number of transactions
actually available may likely be substantially less than 40k/s. Still, in my
experience, USB 3.0 can support a few thousand transactions/s.

I really like these Samsung U1/A2 cards. Even in a compromised reader like =
in
the ativ9, it is very possible to build a linux kernel on the SD card. The
linux kernel build is so CPU limited that it barely notices that it's on an=
 SD
card. These U1/A2 cards generally behave quite similarly to mmc connected
soldered flash as in typical phone. I also trust these cards degrade proper=
ly
in that write problems start surfacing while it is still possible to recover
previously written data from the card. I don't want to imply that write
problems surface that often because they don't. Again, I really like these
Samsung U1/A2 cards.

I really like the Samsung ativ9 laptop as well. I paid $500 for it ten years
ago. It is small, light and physically robust. It has a lot of bright displ=
ay
pixels. It is efficient and thus far the battery works as if new. It has an
Atheros QCA6174 radio which actually does 2x2 MIMO. The wifi throughput can=
 be
25MB/s on a 40MHz 2.4GHz connection, and 50MB/s on a 80MHz 5GHz connection.=
 The
QCA6174 firmware crashes on most suspend/resume cycles but the system recov=
ers
without any user intervention. I would not trade the known limitations of t=
he
ativ9 for any newer system with unknown limitations.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

