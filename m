Return-Path: <linux-usb+bounces-23614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5524AA67A7
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 02:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ECB17B4494
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 00:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E20E1862;
	Fri,  2 May 2025 00:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hqgs0GMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FB645
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 00:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746144444; cv=none; b=tka7Izril3J5kPLzET7hlNxvXNBQETGtwwe1sCxwVWI5oSSycf7SbSHBLuVYWMJCf+74MruHLFgEDPqPNTwgqy9RskxBjQdgFdB//8CYC6RnveRPNJJFimbCflX2FwO0rOv1YBqwD5gRVz63rqAnQbfOBMEuK2CVWMPUJSknpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746144444; c=relaxed/simple;
	bh=mpROdmUWfmHFXoC1zF/mP3+1NMzVapypeUCpzr6iQno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V/IwaOB2f8t5TZ8i/8xYvWID1i/rjsmQVFT5oBEjpQoRPiZ2R8pIZ2Bizgf+7nfaOtSwRmyAM2Dj1JNPUlR1L1Pigi6TEnZm0WfV0C2Md3cXzLnoPywZ173Q1isStsSBB+jxPNHI4iuBuIqfyitQSWBen6KuHw1yxwZd7fMUXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hqgs0GMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70A36C4CEE3
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 00:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746144443;
	bh=mpROdmUWfmHFXoC1zF/mP3+1NMzVapypeUCpzr6iQno=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hqgs0GMuCTBPsgEa7j3t/xnE/VerHOnsuxkYRARyVVC7I4wM4aNtESc1GVjaFiNI4
	 S4f90OzKkEsNXnSzqYLCTRkNVYAfAADAMuV76mEmaqEE4ChmZ4GbZ8gmvBFr/jLfik
	 Awl2XnxjjIaAs5oYjHW8ljbKb8UfGaAtpjNeV3PnYgmrU3VIGeIdO6phofgMORGQ6b
	 c15cBUjKpbKUobMKKXQV+Mwf6GU0CF43e6ZAWYDTLAuZw853vLwPndiFhHPzPEuzi+
	 qqwBIQmVXIdEoZ91EtXW4QsiZXJmjKqAGGDZF8Zd0u4tjgnBjzffAdmiwnlIDant22
	 DqaDKohC4YF6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65F93C41612; Fri,  2 May 2025 00:07:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 02 May 2025 00:07:23 +0000
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
Message-ID: <bug-220069-208809-x8rcuoedEn@https.bugzilla.kernel.org/>
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

--- Comment #18 from Claudio Wunder (cwunder@gnome.org) ---
> And the problem source is also somewhere there. There is something suspic=
ious
> about the 8-3 hub which is always undergoing a reset when the HC dies

I assume you're referring to:

```
May 01 22:53:53 angel-thesis kernel: usb 8-3: device not accepting address =
3,
error -62
May 01 22:53:53 angel-thesis kernel: usb usb8-port3: couldn't allocate
usb_device
```


> (BTW, bus 7 is the USB 2.0 part of bus 8, and devices seen on both 7 and 8
> are USB 3.x hubs).

Oh that makes a lot of sense!

Just to verify, with `sudo usbreset 2109:0817` and `sudo usbreset 2109:0211`
you're asking me to reset the USB 3.0 Hub from (8) and it's child device,
right? There's nothing connected to them, but just verifying.

> But no problem, looks like the same thing is happening every few days.

In the last 2 times these match times I've been playing games. Another symp=
tom
before the reset, is the system freezes for a few seconds, including audio,=
 but
then it unfreezes with the devices then disconnecting.

> in memory and will only be lost after unbind.

Alrighty, then no use, I had no recollection of this info; The mount was do=
ne
after I ran unbind/bind from `ssh`... But here's the zip anyways, maybe it
helps.
https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7#file-debug=
fs-zip

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

