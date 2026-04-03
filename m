Return-Path: <linux-usb+bounces-35951-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKJsB4Qi0Gkp3wYAu9opvQ
	(envelope-from <linux-usb+bounces-35951-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 22:26:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A22398265
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 22:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97B3F302BBAB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 20:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001633D75DE;
	Fri,  3 Apr 2026 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYtvuE5p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C033D6694
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247772; cv=none; b=PcwEWuzhX7boApLyQO1qPKfjfttZ1fNtYqC3bFgSfJ6QtKzyHjiKzAX2NG/0bSXQoOuoWpAqLUWb0kVM5KFz8F2Iwi4JKT9AxqZF+kzEyUpcH2CdYQHUEYGwMgeuMhVOP3Cdtl3N5TFPxCVZav9ZrhBjvc6BDeMj3YZwO7NhMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247772; c=relaxed/simple;
	bh=DT3Js6yokw3gAcKZhYhGGwLbWQ0Pl6KpcUXBCmPm2lM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=R3RL7b9w/7xfv3qgXQ0q+amPG8NQPomVhjMDlVneuH8gIWiISDavhlD1XXyXVAH7D+qu1gfHamsjfqYPpNEGGBDJ7WKD2jDDd/+OaCEYMULUl8l0weqCL5plsKYqOmfkCZMyhPJxlw/PRk3ZsrcapVaph5dgnnIb/EoVN1csKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYtvuE5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 296C1C4CEF7
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775247772;
	bh=DT3Js6yokw3gAcKZhYhGGwLbWQ0Pl6KpcUXBCmPm2lM=;
	h=From:To:Subject:Date:From;
	b=fYtvuE5pY51/vZ41oF5jMC/WgAHgPV19hX1XT84bNy4d79uZ5N1vaHK4mTsNOG96l
	 bonjkvdxfyaOR1vXaOrff8OAZFt6/BAtJahTbNrx/DkEyKBdyvHyxgPVRWQay4dJvl
	 dbHUS4Pw3sf0HHAMxiM79Oi/nBytHmqwHOaWE8oAs6RkvxCS0RAdwCxdJ3IKU4lldf
	 oWKnC7GsfCsTuQXbnHT247yzJEJxBXrU2ocViC3Xz98ZfCWkst3tcs2CCc34gEeNDr
	 VJhTFAU6IoDy8/T2H2RdtyV1i/c+tIVCz/zJ0Acjk85cNgF73mRkGi195C4HAk6n7j
	 9b3cyShKNr6BA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16850C4160E; Fri,  3 Apr 2026 20:22:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] New: mice behind ASMedia ASM1042A via Thunderbolt 2
 never produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Fri, 03 Apr 2026 20:22:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-35951-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 88A22398265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

            Bug ID: 221318
           Summary: mice behind ASMedia ASM1042A via Thunderbolt 2 never
                    produce input, most likely due to interrupt pipe idle
                    window during enumeration
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: manauer.uel@gmail.com
        Regression: No

This is filed under drivers/usb because the problem involves the interaction
between the usbhid driver, the USB host controller, and the Thunderbolt 2
bridge. The drivers/hid/usbhid subsystem is also directly involved,
specifically the behavior of the interrupt pipe after enumeration. There is=
 no
drivers/thunderbolt component available to select, but the Thunderbolt 2 br=
idge
appears to be a contributing factor as described below.

On a MacBook Pro 13" Early 2015 (MacBookPro12,1) with an LG UltraWide (34UC=
98,
internal hub: ASMedia ASM1042A) monitor connected via Thunderbolt 2, USB mi=
ce
connected through the monitor's built-in hub never produce any input. This
happens consistently, whether the mouse is plugged in before boot or after.=
 The
mouse is fully enumerated, appears in lsusb, has a correct
/dev/input/by-id/...-event-mouse node, and is recognized by libinput, but no
motion or button events are produced.


# Affected hardware:
- Machine: MacBook Pro 13" Early 2015 (MacBookPro12,1)
- Monitor: LG UltraWide (34UC98), connected via Thunderbolt 2
- USB host controller: ASMedia ASM1042A, PCI ID 1b21:1142
- Affected: any USB mouse connected through the monitor hub
- Not affected: keyboards on the same hub, mice connected to the same monit=
or
via USB instead of Thunderbolt 2


# Kernel versions tested:
Reproduces on Fedora 43 (6.17), and on a Rawhide kernel (7.0.0-0.rc4). Also
reproduces on CachyOS, Ubuntu and Pop!_OS, so it is not distribution-specif=
ic.


# Theory on why this is happening:
After enumeration, the usbhid driver stops submitting interrupt URBs if no
userspace application has opened the device yet. There is a brief idle wind=
ow
before the desktop environment opens /dev/hidrawX. The ASMedia TT appears t=
o be
sensitive to this idle condition when the hub is accessed through the
Thunderbolt 2 bridge. Once the interrupt pipe goes quiet, the TT most likely
stops delivering input silently and does not recover, even after userspace
opens the device. The same hub connected via USB does not exhibit this
behavior, pointing to the Thunderbolt 2 bridge as a contributing factor. Why
the Thunderbolt 2 bridge makes the difference is not clear to me.

One additional observation worth mentioning: plugging in an unrelated Logit=
ech
wireless receiver into the monitor hub suddenly makes the wired mouse work
(re-plugging needed). The receiver belongs to a completely different wirele=
ss
mouse and has no logical connection to the wired mice. It prevents the prob=
lem,
though why exactly is unclear. The additional USB traffic it puts on the
controller might be the reason, but I am not sure.

Applying HID_QUIRK_ALWAYS_POLL via the kernel command line fixes the problem
for a specific mouse: usbhid.quirks=3D0x046d:0xc049:0x00000400

This strongly suggests the problem is the interrupt pipe going idle. As a
generic workaround, holding a file descriptor open on /dev/hidrawX via a ud=
ev
rule has the same effect and works for any mouse without needing vendor and
product IDs

Maybe consider keeping the interrupt pipe active by default for all HID mice
until userspace opens the device, or automatically applying
HID_QUIRK_ALWAYS_POLL for mice behind Thunderbolt bridges.

A workaround and write-up are available at:
https://github.com/NextBlaubeere/asmedia-usb-mouse-fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

