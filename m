Return-Path: <linux-usb+bounces-34836-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k87yEzxRt2l1PwEAu9opvQ
	(envelope-from <linux-usb+bounces-34836-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 01:39:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998922931F9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 01:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2944300FC5F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 00:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB739145355;
	Mon, 16 Mar 2026 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dy/JIebL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E8AD2C
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773621559; cv=none; b=WNC80U74Vb8gVxmwOkqmztQoBg9GXxU3gIMxkRyddve+vEawygHKP8XSdNuE0zpnLvOl90y76114AwZbX6DohtWPipvE2086DtzqD8AUECpYeZcvswLqTeHN3l6/VdKLybliTKY7LL6Sm/GAYydfu+wfwAm137ZvO4oliGob0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773621559; c=relaxed/simple;
	bh=hhMGypMkpp84RITcxptsFaKhcIrxdiwuVAeOX1Qzhfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UngnTsHQXXow9BrOqiVQLd9hN9xOF2fHvvPe5/B62USztm8a3HsUKZVoFsZz+g+W9dFHWlRJVm4IpgRYzCHyJWHCpTO+oDhiizgGeP6TNRww2MKqX+H92lzN7t/XltT9Er2QfTQxCDN+DhMno/cKTXoHCk2hv/rTtlghF5DuhFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dy/JIebL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E7EC2BCB0
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773621559;
	bh=hhMGypMkpp84RITcxptsFaKhcIrxdiwuVAeOX1Qzhfc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dy/JIebLf+b0OHx9syl4IrWABRx8fafE6a7y/w5HX+U0XYvgFpsI721P9CE54DCt/
	 D8klBs80UP2SMMWrBNmAPL/VK3nAZrt1rrvttO5N3ARe23+WOuwCSQcdJlFDxiZj21
	 BNIa5F8yuaapubMFS+/zJVsfM+KcqnS8LQ37UozMWGOZDR7IQ3z26+DpdwM4m57pP5
	 38tjt92A6svGqSQmy5YDRFm8k1DSP3LzjmUk3jF0wHGk59EBDM33EY86hBkrXkEw/p
	 Uq0y8qC72QIe3OA/spstpNo5VG1c7ou8ToVsSADFO2pDdI/vlDSzZtIIjaWn9aQCqH
	 JXSzh4BVJmv/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F1F60C3279F; Mon, 16 Mar 2026 00:39:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 16 Mar 2026 00:39:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-0GdBC5jKaA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34836-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 998922931F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #40 from Alexander F (superveridical@gmail.com) ---
>echo on > /sys/bus/pci/devices/0000:c4:00.4/power/control

no effect.

>The warning is unimportant,

Yeah, I understand. I (likely mistakenly) assumed that whatever sets taint =
on
the kernel also flips the NonFatalError. If "DevSta:" can only be set by the
hardware internally, than of course it's a different matter.=20=20

>was PCI DevSta: NonFatalErr+ ever set with the 'Forced MSI only' patch aft=
er
>resume?

Never. I did 300 cycles with MSI-only patch with no issues and it was never=
 set
to +. The only concerning things in dmesg during these 300 cycles were mult=
iple
(about 9) errors of this kind:

amdgpu 0000:c4:00.0: amdgpu: Register(1) [regVPEC_QUEUE_RESET_REQ_6_1_1] fa=
iled
to reach value 0x00000000 !=3D 0x00000001n
amdgpu 0000:c4:00.0: amdgpu: VPE queue reset failed

>i.e. Does MSI-X usage on xHC trigger the DevSta: NonFatalErr+, causing xHC
>interrupt handler to hot be called
>is there something else causing PCI DevSta: NonFatalErr+ in resume which f=
or
>some reason only affects/omits MSI-X handler while MSI work and handler is
>called as it should.

Unfortunately, I'm not equipped to find that out. I can imagine it's possib=
le
to write a kernel module(or modify an existing one) that tests that, but th=
at's
beyond me. My understanding ends at the system call boundary.

>I think all we got is just more evidence that it's a PCI or x86 architectu=
re
>problem, not USB. I would mail linux-pci

I can probably do that, but I'm not really confident that my device is
functioning properly hardware-wise, and I wouldn't be wasting everyone's ti=
me.
If I had access to another sample of the device, that was not self-selected=
, I
would  at least be able to tell that it reproduces on a randomly sampled de=
vice
beside mine. Unfortunately the bugreport starter with access to multiple
samples is MIA for some reason.

...

Meanwhile I think I determined the source of instability I had during the
sleep/restart actions. I had a working hypothesis that it's static zaps, an=
d I
happened to pretty severely zap something in the device through a (rather t=
hin)
keyboard key recently, severely enough to force my desktop's monitor, that =
only
has common connection with the Z13 through mains, to shutdown momentarily,
likely due to power protection circuitry in its PSU. (There is also no
grounding wire in this house) The device functioned nominally, but the mome=
nt I
tried to suspend it after that zap it died, and I had to longpress the power
button. It means I did at least 5-7 similar level zaps, and it could have of
course damaged something. All of this could mean nothing, but that makes me
less confident that I have a properly functioning device.

There are 4-7 people complaining of this issue on Linux, so it means at lea=
st
100 users with their devices in the similar state. Not everyone reports iss=
ues
of course -- absolutely real bugs get 1-2 reporters on drm/amd for example,=
 so
the number could be greater. Could it be that this number of people also za=
pped
their devices, and did the same kind of latent damage to the whatever machi=
nery
responsible for the MSI-X interrupt? Sounds kind of implausible. So if it
doesn't manifest on all devices the only other reason I can think of is
something to do with manufacturing.

I think we need more people supplying debug data to be sure before bothering
the other subsystems. But I would do as you recommend. And the issue looks =
like
something hardware/firmware related, i.e. beyond the level of the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

