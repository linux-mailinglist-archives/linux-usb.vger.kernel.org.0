Return-Path: <linux-usb+bounces-24147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D1ABEBE2
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 08:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9BB44A61E8
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 06:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CD023182B;
	Wed, 21 May 2025 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb2Hb2A7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783901A317D
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808630; cv=none; b=egI9flSWH0IRF1t/TqZezt9WyokcbzjW/KaM0hIy2Roiz0Cf0Y8yQA4rTisLUppNOvu21rliOkdAAm2e21TKJ1DUOfsTQrzAZsaGyrbGnw5yLK4fB9cnpdEVyF3Mw9yW6a1r+6AbPmSnixvvwd+asLEilwTlyNsQUoWRjaoKkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808630; c=relaxed/simple;
	bh=nfE5Xc2flz7UA5TjPHShzZZPFp7oxnIiDnaeNcGV0dg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jrOJiEvNA2WeXqtpVG52ucAJmPJJpAeHgMXifNeHPLirtgnElSKfaWiiUaldgEpyIScAidDzNdecZzJG5S2Hj9Sr1UK7e/ujf+TLdvw6huZM+H/jvJayrTmlTx4doKOAQ9n9xrY163PoN7XFt28iuOjhtWO/HU7LJyporixb5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb2Hb2A7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D736CC4CEE4
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747808629;
	bh=nfE5Xc2flz7UA5TjPHShzZZPFp7oxnIiDnaeNcGV0dg=;
	h=From:To:Subject:Date:From;
	b=Eb2Hb2A7xXOI4bJZzj8sOo31TAlVZPe5Pg3Y+jGj+/1nQF8LpyPKX4ZGyHx/Ri5hI
	 jYeoQQFcJ3khOngwOm0MuAgsV+cK2HqZO95lAKRzYqRstNohIapzhFPEvuax8Dvsty
	 v59dKwKmRDUHsvlSQXQGggFJ7A21BcNawm8Fyn4qtoWlxZBLKt/veOxCsJtCqBlTB2
	 7DUVegh8SZRMM5VdKqpG3ZaeI7PWUbR0UQyaUKbrBMk4bnpPAMiYIuoUzKFNSjdDu8
	 WztdHv7NGJQiwvtPOq+0B/S1g6Q/IVPNDHzB7yliR5w3qBUxoxsSruztfDMFKSMX5v
	 hjj69SPuyBotg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C35B3C433E1; Wed, 21 May 2025 06:23:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxNDNdIE5ldzogRExaIENyZWF0b3IgWFMgKFVTQiBB?=
 =?UTF-8?B?dWRpbykgbm90IHdvcmtpbmcg4oCTIGFjY2VwdHMgaHcgcGFyYW1zIGJ1dCBw?=
 =?UTF-8?B?bGF5YmFjayBmYWlscyAod3JpdGUgZXJyb3IgLTc3KQ==?=
Date: Wed, 21 May 2025 06:23:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maps@knutsson.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220143-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220143

            Bug ID: 220143
           Summary: DLZ Creator XS (USB Audio) not working =E2=80=93 accept=
s hw
                    params but playback fails (write error -77)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.14.0-15-generic
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: maps@knutsson.it
        Regression: No

The Mackie / LOUD Audio DLZ Creator XS USB audio interface is detected
correctly by ALSA, and presents itself with:
Vendor ID: 0a73
Product ID: 003a

USB interface: High-speed

ALSA detection: card 2 (via aplay -l)

The device only accepts:

Format: S32_LE

Sample rate: 48000 Hz

Channel count: 4

When using:
speaker-test -D hw:2,0 -c 4 -F S32_LE -r 48000
=E2=80=A6the device accepts snd_pcm_hw_params() successfully but fails at p=
layback:

Write error: -77, File descriptor in bad state
xrun_recovery failed: -77
The same happens with:

aplay -D hw:2,0 <converted 4ch/32bit/48000Hz file>
The interface disconnects and reconnects after such playback attempts in ma=
ny
cases. No audio is heard. All simpler formats (e.g., 1 or 2 channels, or
16-bit) are rejected with Invalid argument.

Reproduce Steps:
Plug in DLZ Creator XS to USB 2.0 or 3.0 port

Confirm device appears via aplay -l

Run:
speaker-test -D hw:2,0 -c 4 -F S32_LE -r 48000
Observe that device accepts format, then playback fails

lsusb -v output:
Bus 003 Device 013: ID 0a73:003a Mackie Designs DLZ Creator XS
iManufacturer           1 LOUD Audio, LLC
iProduct                2 DLZ Creator XS
iSerial                 3 no serial number

Tested with
Ubuntu 24.04 (kernel 6.5)
Ubuntu 25.05 (kernel 6.14)

Same behavior across systems

Device works flawlessly under Windows with official driver

Comment
It appears the device requires a very specific channel layout and potential=
ly
vendor-specific initialization or control messaging before playback is
possible. If this device is non-compliant with UAC2 spec, perhaps it should=
 be
explicitly blacklisted or set up with a vendor-specific quirk?

I would be happy to run more usbmon/alsa-info traces if needed.

I apologize beforehand, as I have not filled out a bug report before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

