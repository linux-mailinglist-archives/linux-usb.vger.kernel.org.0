Return-Path: <linux-usb+bounces-19382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB38A12A28
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 18:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABD7E7A2ACD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 17:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E330A1B5ECB;
	Wed, 15 Jan 2025 17:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4z79ptW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B31155C96
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736963547; cv=none; b=l66Z3hAsJToQG2ZT347ho4BKEMjvkrdpt8PGzaEmTj6W0zGL8bkVFeeJMqsN8pZ4Ax/Q9suwUU0F8TX++SZmrxO4jurkfa8oiE8HebCmDEr01wVdLOURoT8pBTV57Wufd8DLaUZD5r3FgdkZ9hBl5Q3QDskV+jKeHMTh/B1OH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736963547; c=relaxed/simple;
	bh=PN8O05u6dtIQZybJYaHWrFRYn4ocUY1Rj23F3/W6f80=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ucY/VaRm2CC9z2uQY/2gSyjlYqt5TzuDuKoS0oWMP3SEIRWUfwiqlJAtXLBiPa5a0CVPt2rygNyh4Igxhvc1HweOVcCKOgpaIFNIRqa6ptMQmyGW1Jx1m07qLAzg1+m1Tj229Y7Vw2+Bzt2Ut+LwQC7ctZRKyc7miq1iRXmSFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4z79ptW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6C14C4CEE1
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736963545;
	bh=PN8O05u6dtIQZybJYaHWrFRYn4ocUY1Rj23F3/W6f80=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K4z79ptWe1trzDS+xPi+G8MA4K+Hq/iPVlwmnNZXr8/n2rtyjXb/IwvsjV9maVZEH
	 S15MU+dPwtXOI/YNtxYeuEr/wbmzViMXmRHIplx9CzOS2XLYErpJ73MW+EPvCs2BD8
	 HfdgSM5fv9RXPXDFbxjnv0+fmJ4pfsH0NFiFuFEkDf0I2lgVRcOrB+0G0zmiSCQ5De
	 7+eZAxTroquUCEJMItaavoR3Ai81drcrCYmjm4orM/26Q3YWktCV6U9tnFLRAg0I/3
	 oquD7HUjiqg1aaAsh00ATzOoZNwZ0ROZqK1REuC6qlY9SUZI20lRUVxMo36VNbWwz9
	 n4kKm6RZY/qlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA097C41606; Wed, 15 Jan 2025 17:52:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 15 Jan 2025 17:52:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-H4ZaOJ0sfR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #5 from dantmnf2@gmail.com ---
> What happens to the errors when it works (on USB-C or through a hub)?
> Are they still there but recovered from? Or not happening at all?

Not happening at all on USB-C port.=20

As for the hub case, with the network adapter as the only device on hub,
transfer errors are still there and the entire hub appears disconnected aft=
er
it, but no more errors after another adapter (with same chip) comes to the =
hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

