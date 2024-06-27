Return-Path: <linux-usb+bounces-11730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA491A391
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 12:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3985228554F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 10:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB7C13D52A;
	Thu, 27 Jun 2024 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2kdOPjN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872C13C67E
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483102; cv=none; b=SeGun1doI0npDJhsmT338OaqK5DcA1Tr6aANj5pnqZFDdb0pgp54EFAOrFcrQrwTCZjsPbuKyq/Ikemr0bKX1eT2GBkPsPuc45O8qaGH9fhq1dIuFtVcZgTxZvFHw0jDs6qvA+1q+JwV355TqbBWyOStpxzlsRTmBVPN3a9gFWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483102; c=relaxed/simple;
	bh=IvvFdAbVLqtBdf/QmjAFq7FVl5QeaWFJoLjEvvN2uP0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRlhvb2KSjkmMyfGUjqD0lhbAPXBaHbM0+HlYHFHQYQekk3aik1TPI9MXF4MPyGs++Ff0SMswKNLqAGUrWD8rkgKf0IlMcuhxbe+IEUzozMAQgXthvzOTUUblA4HIacRXM8gtDzaw7bEzb61p3AHijM9vgwUvRhi1RlR/fE7adI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2kdOPjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F5B2C32786
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719483102;
	bh=IvvFdAbVLqtBdf/QmjAFq7FVl5QeaWFJoLjEvvN2uP0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h2kdOPjN5Dl+BQ7pIorqRulB2rLIfUqP5XWA7gZbbf2yUKCvkknpXh7GNGK6aBdHl
	 eKToUhQBhBtkHPezZpH8DlWNwV5xf87HQerUBnEvnhwVVS11hnY+HwRssrHr7r3DQv
	 qzjjWd1fcW7ZZZXdqD4xWTAmChw3DF9Weg6lg6TSMY3sry81mLtM5hi1q5lnDEM2Po
	 pPidMZh82xg8nFV9mH/+D9oxcPh+yV2aIRpkhmfyEYc80vJ+/wqci871vBOVkakf4f
	 2Er1qrF6l1F7hC7GAq5XSwYjcX0oqBtoARR072wQT6+JApCkM9+j5bUCGiCARX0Aep
	 9pbwrOZgpjw3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1993BC433E5; Thu, 27 Jun 2024 10:11:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218992] Usb Type-C headset TX is noise
Date: Thu, 27 Jun 2024 10:11:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quic_ugoswami@quicinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218992-208809-BXTSDgLAOu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218992-208809@https.bugzilla.kernel.org/>
References: <bug-218992-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218992

Udipto (quic_ugoswami@quicinc.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|headset                     |Usb Type-C headset TX is
                   |                            |noise

--- Comment #1 from Udipto (quic_ugoswami@quicinc.com) ---
The issue only happened one specific USB-headphone that it supports 44.1k to
capture.=20=20

The log:

<6>[316.777381] [pid:    22] usb 1-1: new high-speed USB device number 2 us=
ing
xhci-hcd
<6>[316.918353] [pid:    22] usb 1-1: New USB device found, idVendor=3D0424,
idProduct=3D2422, bcdDevice=3D 0.a0
<6>[316.918382] [pid:    22] usb 1-1: New USB device strings: Mfr=3D0, Prod=
uct=3D0,
SerialNumber=3D0
<6>[318.229277] [pid:  1921] usb 1-1.1: new high-speed USB device number 3
using xhci-hcd
<6>[318.326969] [pid:  1921] usb 1-1.1: New USB device found, idVendor=3D04=
99,
idProduct=3D170d, bcdDevice=3D 1.10
<6>[318.327014] [pid:  1921] usb 1-1.1: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
<6>[318.327048] [pid:  1921] usb 1-1.1: Product: AG06/AG03
<6>[318.327079] [pid:  1921] usb 1-1.1: Manufacturer: Yamaha Corporation


05-13 19:43:47.220  root     8     8 E usb 1-1.1: Mismatched sample rate 48=
000
vs 44100 for EP 0x82

Is coming up on dmesg.


This is the audio card info of the headset:
USB audio card info:
proc/asound/card1 # cat stream0
Yamaha Corporation AG06/AG03 at usb-xhci-hcd.2.auto-1.1, high speed : USB A=
udio

Playback:
 Status: Stop
 Interface 1
  Altset 1
  Format: S32_LE
  Channels: 2
  Endpoint: 0x01 (1 OUT) (ASYNC)
  Rates: 44100, 48000, 88200, 96000, 176400, 192000
  Data packet interval: 125 us
  Bits: 24
  Channel map: FL FR
  Sync Endpoint: 0x81 (1 IN)
  Sync EP Interface: 1
  Sync EP Altset: 1
  Implicit Feedback Mode: No

Capture:
 Status: Stop
 Interface 2
  Altset 1
  Format: S32_LE
  Channels: 2
  Endpoint: 0x82 (2 IN) (ASYNC)
  Rates: 44100, 48000, 88200, 96000, 176400, 192000
  Data packet interval: 125 us
  Bits: 24
  Channel map: FL FR

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

