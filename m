Return-Path: <linux-usb+bounces-33516-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEmrGqBqmGn4IAMAu9opvQ
	(envelope-from <linux-usb+bounces-33516-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 15:07:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8589168294
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 15:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC5CD3022622
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EAA34BA24;
	Fri, 20 Feb 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg2iGp82"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD5347BC7
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596443; cv=none; b=hKtEth5lujmYddxjgK+1M+iMaWyKlAE1XuHau5OZ4bvx5LHuV2cjbMiLrQR+pBjU4j/bTHShqamLGowezcvgYJKcEhiyOmHmOLMIzup9kKNw/WUTSA3uAjeP1WBHTmfGT5imYoDqxXrakmKsq5wYnvDELevvtj/nZw848zi9h4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596443; c=relaxed/simple;
	bh=kJi8csIAqROnOx7So8avlxZMZ9/7EzjY1M3NMorYnM4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTlbzPEozQ8eTUPKnreMry8ZSZjVut6eIRafk6tsVNK7LFy+70x/VXAgGW/+BGsbUpt9A6NbOXPPhqQalL4Z+nKTzJBG14sEuD8P6BGqFjdz7Fyl4+bY8/VtsT+07R848CNvypc/7PljwKNvnZDENogvi0YcIsBOqRtpUYaJb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg2iGp82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 329E2C19425
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771596443;
	bh=kJi8csIAqROnOx7So8avlxZMZ9/7EzjY1M3NMorYnM4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qg2iGp82zMdhrHFIh9EE+CEmfPYEFb/hDk6PkRSD7/AhL57tRv4K24RzA3IEDk+26
	 Rh7Kvyk6/hY/2kIGH5YOtWaScDtMxpiBn4oM3iZxYXTAVq1NP6x8XiIszS9dylnOHX
	 nH9WEDFBSouJSPohERFAC2L1pPsUNwRdkxTI8kfWbSZgJLOdaDxSN9zQzmBiXuMI3q
	 FKLCCE52jpZXxofywrCW/kYRJJqP1m79LXD7AWmdqUP1XyYqi3EmFRE+RyiW6ev/BP
	 G//QpxUaoDoL3WYmwVM4SygaQOAooe8nCgxAdRC47xG6zPBM18MFon49wgfPvrlSGg
	 RrQtjFTHMUzog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 234DFC3279F; Fri, 20 Feb 2026 14:07:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 14:07:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-ZPi4zOfPCY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33516-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devbox:email]
X-Rspamd-Queue-Id: D8589168294
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #13 from Paul Alesius (paul@unnservice.com) ---
(In reply to Micha=C5=82 Pecio from comment #12)
> Isn't the required serial cable identical as in 99% of motherboards? ASUS=
 is
> usually decent enough to show all details, including pinout, in the user
> manual.
>=20
> Maybe one thing worth trying is to enable dynamic debug and run an iterat=
ion
> or a few to see what gets logged in dmesg, check if it changes or is alwa=
ys
> the same and compare the "bad" root hub with good ones, particularly of t=
he
> same speed.
>=20
> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> dmesg -W
>=20
> The most interesting information may be missing if it actually crashes, b=
ut
> maybe something will hint at any unusual patterns in your system.
>=20
> One thing I see is that this code tries to check status of the ports, so
> your crashes may (or may not) depend on some particular device being
> connected.

I just triggered the system freeze three times with dynamic debug and dmesg=
 -W.
Each time, the last message shown in the console is:

"Setting command ring address to 0x10e427001"

Dmesg logs "Setting command ring address" twice, and all three freezes occu=
red
after the first of the two log records of "Setting command address"

Demsg example below, it did not flush to disk so the "dmesg -W" to the term=
inal
has newer log records but this is what I see in the console:

------ dmesg -W

...
[ 1139.446048] xhci_hcd 0000:7a:00.4: xhci_suspend: stopping usb9 port poll=
ing.
[ 1139.446066] xhci_hcd 0000:7a:00.4: Setting command ring address to
0x10e427001
[ 1139.561526] xhci_hcd 0000:7a:00.4: Setting command ring address to
0x10e427001
[ 1139.562304] xhci_hcd 0000:7a:00.4: xhci_resume: starting usb9 port polli=
ng.
[ 1139.562306] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb10 =
port
polling
[ 1139.562308] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb9 p=
ort
polling
[ 1139.585922] xhci_hcd 0000:7a:00.4: Get port status 10-1 read: 0x2a0, ret=
urn
0x2a0
[ 1139.585931] xhci_hcd 0000:7a:00.4: Get port status 10-2 read: 0x2a0, ret=
urn
0x2a0
[ 1139.792600] xhci_hcd 0000:7a:00.4: set port remote wake mask, actual port
10-1 status  =3D 0xe0002a0
[ 1139.792619] xhci_hcd 0000:7a:00.4: set port remote wake mask, actual port
10-2 status  =3D 0xe0002a0
[ 1139.792662] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb10 =
port
polling
[ 1139.792667] xhci_hcd 0000:7a:00.4: config port 10-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1139.792683] xhci_hcd 0000:7a:00.4: config port 10-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1139.792705] xhci_hcd 0000:7a:00.4: config port 9-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1139.792726] xhci_hcd 0000:7a:00.4: config port 9-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1139.792727] xhci_hcd 0000:7a:00.4: xhci_suspend: stopping usb9 port poll=
ing.
[ 1139.792746] xhci_hcd 0000:7a:00.4: Setting command ring address to
0x10e427001
[ 1139.821295] xhci_hcd 0000:7a:00.4: Setting command ring address to
0x10e427001
[ 1139.822070] xhci_hcd 0000:7a:00.4: xhci_resume: starting usb9 port polli=
ng.
[ 1139.822072] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb10 =
port
polling
[ 1139.822074] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb9 p=
ort
polling
[ 1139.845924] xhci_hcd 0000:7a:00.4: Get port status 10-1 read: 0x2a0, ret=
urn
0x2a0
[ 1139.845931] xhci_hcd 0000:7a:00.4: Get port status 10-2 read: 0x2a0, ret=
urn
0x2a0
[ 1140.052603] xhci_hcd 0000:7a:00.4: set port remote wake mask, actual port
10-1 status  =3D 0xe0002a0
[ 1140.052621] xhci_hcd 0000:7a:00.4: set port remote wake mask, actual port
10-2 status  =3D 0xe0002a0
[ 1140.052664] xhci_hcd 0000:7a:00.4: xhci_hub_status_data: stopping usb10 =
port
polling
[ 1140.052670] xhci_hcd 0000:7a:00.4: config port 10-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1140.052685] xhci_hcd 0000:7a:00.4: config port 10-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1140.052706] xhci_hcd 0000:7a:00.4: config port 9-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1140.052727] xhci_hcd 0000:7a:00.4: config port 9-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[ 1140.052728] xhci_hcd 0000:7a:00.4: xhci_suspend: stopping usb9 port poll=
ing.
[ 1140.052747] xhci_hcd 0000:7a:00.4: Setting command ring address to
0x10e427001

-- On plugged-in USB devices

There are 3 devices plugged in to USB, two are internal:

noname@devbox ~ $ sudo lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 13d3:3588 IMC Networks Wireless_Device (INTERNAL M.2
WiFi & Bluetooth)
Bus 001 Device 003: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
(INTERNAL)
Bus 001 Device 004: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver (I have =
this
one plugged in for mouse and keyboard)
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I changed the port of the Logitech Bolt Receiver during these three tests w=
ith
system freeze, and plugged it into a USB 2.0 port, but the system still fre=
ezes
on that root hub.

---------

If there's anything else to try to get more diagnostics, I can do that too,
otherwise we'll have to wait until I receive the adapter for netconsole.

I am unable to remove the M.2 wifi card at present because I need to
disassemble the entire computer and take out the MB because it's behind
shielding covers that are not meant to be removed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

