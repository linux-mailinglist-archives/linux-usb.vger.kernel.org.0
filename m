Return-Path: <linux-usb+bounces-35998-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Lmy3LTHk0mk7cAcAu9opvQ
	(envelope-from <linux-usb+bounces-35998-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:37:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC83A0011
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A10A30078FC
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 22:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FB82DC350;
	Sun,  5 Apr 2026 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSOxg8rL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0267081E
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775428652; cv=none; b=NAPGx4WDvDR/sF9f4AavQtajnVZtJNzFsHsZqOQmQU1jpDqBSbp1RNawITrjDi+MhxJ+GQL0/p1hW7zDT0kBEodZaA084M+vuAytqB1l00uIp8VWhb6Uz56JNfRgklwszbcKDDBMUmIIqWFrOtZ5mOfrljMyo/lQZKeNULFwfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775428652; c=relaxed/simple;
	bh=a9ALTBYiaJimXgzpNUVTZsusub+N47kM511UxOrz7pM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KAQvH8AEhgf9mCxLLD9e0RnjWjSGzhkyXSS8Awz/6QfVO7/IfX7gRHB1ampGoGV60XM8EjMgADkJcDw4pyjH7Y4jv+KBiTVaCj0RLWpEy/TQsEnTPmotB0iBu8IprMyr+yxerj15ogAlHoASoMJJGsOSOHFjmtosuedzaYDpaQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSOxg8rL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13F3AC116C6
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775428652;
	bh=a9ALTBYiaJimXgzpNUVTZsusub+N47kM511UxOrz7pM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bSOxg8rLI7V/3ADrN6Q4bWiYRdRgbfOqztpJMkzCSwudEd4oFCW+6r9ECmBSJGTWj
	 DxjSPTGrAeHKbUY9sTCzqc/EnD+sk1lD6CmgydKswhFQZOl14B84fpylW2/dVuTQVb
	 s+ZvtmpPMSLGiAg+GlRwuhvaUDWs+a+AQ6eaJ+qV/ysbLdPlIZeh33/ekAZY/cZTYE
	 wKQoa9qtWdU+RqfVQFq8LX6+aCscjE52lnpytmgPaqaLkYxZw75gTce2bLF5G/T2JH
	 4KH4ZbmkgYwvxETy2Psdxyjx1V3KkCVDOb48gtvCZnJVf0320ojforSrSEAgT63zPv
	 rDHh1euNHTz0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A434C41613; Sun,  5 Apr 2026 22:37:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sun, 05 Apr 2026 22:37:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-2JNibxA1vg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35998-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2EC83A0011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #9 from manauer.uel@gmail.com ---
> Can you check what's making this noise?
> cat /sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/name

    $ sudo cat /sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/name
    2-3

That would be bus 2, port 3 on the Intel controller, right? Checking sysfs =
says
it is the Apple Internal Memory Card Reader (05ac:8406), the SD card slot b=
uilt
into the MacBook.

    $ lsusb | grep "Bus 002"
    Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    Bus 002 Device 002: ID 05ac:8406 Apple, Inc. Internal Memory Card Reader

    $ cat /sys/bus/usb/devices/2-3/manufacturer
    Apple
    $ cat /sys/bus/usb/devices/2-3/product
    Card Reader
    $ cat /sys/bus/usb/devices/2-3/idVendor
    05ac
    $ cat /sys/bus/usb/devices/2-3/idProduct
    8406




> Does this cancellation go away when you enable the udev rule or ALWAYS_PO=
LL?
> Maybe something goes wrong here.

I captured a new log with the rule enabled and replugged the mouse. I think
with the udev rule active the cancellation disappears as far as I can see. =
The
enumeration looks the same as before up to the point where the mouse is
recognized and the hidraw nodes are created. After that, the ASMedia contro=
ller
goes completely silent. No Cancel URB on ep 0x81, no split transaction erro=
r,
nothing. Just the Intel slot 2 ep 2 stalls in the background as usual. The
mouse works.




> Does it mean that the device kept disconnecting by itself and it wasn't y=
ou
> doing it?

Some were definitely me replugging. But I cannot rule out that the device a=
lso
disconnected on its own at some point before I pulled the cable. The split
transaction error appeared very shortly before one of the disconnects, so i=
t is
possible both happened. I definitely followed your instruction, if I rememb=
er
it correctly:
> > Then connect the mouse with your udev rule, make a few clicks, disconne=
ct,
> remove the udev rule, connect again, make a few clicks.




> Do you have some other USB 2.0/3.0 hub you could put between the monitor =
and
> the mouse?
> Does it make any difference?

I already tried this with two different USB hub dongles placed between the
monitor and the mouse. The behavior was identical. The problem persists
regardless of which hub is in between, which made me think the issue is may=
be
with the ASMedia controller itself rather than the LG hub specifically.




One observation that might or might not be related I already mentioned in my
initial report is that plugging in an unrelated wireless Logitech USB dongle
into the monitor makes the wired mouse start working after replugging. The
dongle itself has nothing to do with the wired mouse. I have no good
explanation for why a second device being present would change anything, bu=
t it
seemed worth mentioning in case it points at something on the hub or contro=
ller
side.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

