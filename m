Return-Path: <linux-usb+bounces-27320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF5B37DF4
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 10:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E731BA0261
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 08:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119F733CE94;
	Wed, 27 Aug 2025 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1o84E9U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B520ED
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283836; cv=none; b=iD1Oy0vysQDid5T6yktqdxbkfyN9vGO1vzru6MpszRJgc9gk/fjYZRnhRnHDJ8QXVJ71ixMr7Fa7p4mDb1m0TduNnAeDkpuGm2Ye+bGYv6HqAzs41dYwmD9yvPh1lwyxAaiHf/BIK/W0/H2oZd1mxy/dWAyVSMPjoNLEvybl/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283836; c=relaxed/simple;
	bh=gRBDXqVfv1IEzhdKqOd3lhES/p03JmHFBnagJP0dQak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ESa911c4+Jm+0xRGP79d/8lL32Uv1d5b5NANxQKdaX+wYkgKwoN3ItE7CZ7LvyO4uuc8Erlf3jAhlq4+fwhj/IxBFxSzJJsVllkwQeMMY0crKShJkAmFwHu9IhDm+c6PUK9o/CRaxmfAjtGpIiIf49lKNV44iKeb2CfmZNO3iT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1o84E9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 236DBC113CF
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756283836;
	bh=gRBDXqVfv1IEzhdKqOd3lhES/p03JmHFBnagJP0dQak=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I1o84E9Ud4TV1mXr44fhL0/crQKx9eruWClckEnyEBr6E9G9ncG5ySIlcS9ppfWB4
	 MRe8ji3wkoS1eCx9xu0n/g8Gjauk2dpUuMX4PdHzxJ+75Su6r9NJQ5Ri7K3yw4uRQ6
	 eqxgQiu6FEKCb25MME40bF9idyRtR0wRQEBUiQAIWcvFbBZMV+ZLPJfHJWj9GTc5Xv
	 MuCcrbLhZbyisRYjsDZBNn7oLIBPU3B9coRLY2GZgzD9v0xvXUPP/wYFTb3ymCW197
	 7QyOxLWfUNj1M8ncA0RQxMCnBiUpCZNQqQc7y7BT604PHeo7CDY8N4x8JMuSNphzsC
	 r/hKWy3RPr13g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0FD5FC53BBF; Wed, 27 Aug 2025 08:37:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220331] FTDI serial IO - unknown device type: 0x8312
Date: Wed, 27 Aug 2025 08:37:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220331-208809-s8xTHXLd7p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220331-208809@https.bugzilla.kernel.org/>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

--- Comment #4 from Johan Hovold (johan@kernel.org) ---
On Thu, Jul 10, 2025 at 09:11:14AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

> Issue with a newer hardware with USB DisplayLink adapter, syslog throws
> following error about unrecognized device type 0x8312:
>=20
> > [    4.447826] usb 1-8.2.1: New USB device found, idVendor=3D17e9,
> > idProduct=3Dff00, bbcdDevice=3D83.12
> > [    4.447833] usb 1-8.2.1: New USB device strings: Mfr=3D1, Product=3D=
2,
> > SerialNumber
> > =3D3
> > [    4.447835] usb 1-8.2.1: Product: PM1000
> > [    4.447836] usb 1-8.2.1: Manufacturer: DisplayLink
> > [    4.447837] usb 1-8.2.1: SerialNumber: 9638293100007141

This does not look like an FTDI device and as far as I can see ftdi_sio
driver should not even try to bind to it currently as the VID/PID is not
in the driver's match table.

> > [    4.479297] usbcore: registered new interface driver ftdi_sio
> > [    4.479363] usbserial: USB Serial support registered for FTDI USB Se=
rial
> > Device
> > [    4.480786] ftdi_sio 1-8.2.1:1.0: FTDI USB Serial Device converter
> > detected
> > [    4.480848] ftdi_sio ttyUSB0: unknown device type: 0x8312
> > [    4.480923] ftdi_sio 1-8.2.1:1.1: FTDI USB Serial Device converter
> > detected
> > [    4.480957] ftdi_sio ttyUSB1: unknown device type: 0x8312
> > [    4.486014] ftdi_sio ttyUSB0: unknown device type: 0x8312
> > [    4.486049] ftdi_sio ttyUSB1: unknown device type: 0x8312

Please post the output of "lsusb -v" for this device.

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

