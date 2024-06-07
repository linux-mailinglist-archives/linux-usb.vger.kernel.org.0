Return-Path: <linux-usb+bounces-10996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B978FF890
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 02:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CD02871F1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 00:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAC7EC2;
	Fri,  7 Jun 2024 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itHyOkSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102EF366
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717719268; cv=none; b=nkktL/AndzEdzAZlP1lii3PnK8VIwEkG312cM8KSMO8PIMAE0+IbSmlTMqcGQXMAYXCeC8uHnxgu9L10Mw9BR7yOXFmCuINAFxp7fnia/y0yTU02pO2BM1kp/W8XfK0E9c0LNDKF4OBdiJ00gL9FEPo7UpU7eW7mv8IHWakb1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717719268; c=relaxed/simple;
	bh=RPcSffRLtlHyf6FpBMlA9ld8ycYOFcUFzB6euY0hTYY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uIRD5ZbaxzzxRMQUeRRySaI18d+p3o5FQOm378YX0NNqHm9hEQXP/yFobm+YUuzCwHGFsQpfu1WoYYw8G0azzzDX96CV1DWFLjbhZQ1oj/NmRzjSNxuLTZTjgybYwyhBPqZ71B8NpI5ijRmnItDSSzkwsAbSEsFod/zLjyvGX+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itHyOkSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6167C2BD10
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717719267;
	bh=RPcSffRLtlHyf6FpBMlA9ld8ycYOFcUFzB6euY0hTYY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=itHyOkSVRM8aV3vERkpJch4BjJprr5JJTaUyPJs3ZhPjXyP1cKselG6fQIUR59mq4
	 /naSo12dRTtK+EZ0FiRn8OCyjfgBReavhCShRf+3ONYqB1g7JKPfUdJjUHU8LKRIYK
	 BNiwAs1Euv+PAdF0g13tm8Skjr9d+2H40YoBltEw3dL61IzoFV7qaWZ4RLkeCGSy/p
	 ZawLVdNX6Y6QMwNRZETIwvmCwmhiuh+83nZP024Sup9y/P5A8WvT8HLW2QrRM9+ODB
	 xsckuKUlhoFKK25niTRgoBTkjrTn8Cj8x36AynCO0GmyYG+DeaGI0+qHNo0pqZ6t7P
	 blXrNgqlnF19Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B711BC53B73; Fri,  7 Jun 2024 00:14:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 00:14:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-kwBmC1y5cG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #2 from Jarrard (jarrard@proton.me) ---
(In reply to Jarrard from comment #1)
> Created attachment 306433 [details]
> inxi system information

  Device-3: AVerMedia Live Gamer Ultra 2.1 driver: snd-usb-audio,uvcvideo
    type: USB rev: 3.2 speed: 5 Gb/s lanes: 1 mode: 3.2 gen-1x1 bus-ID: 4-4=
:4
    chip-ID: 07ca:2553 class-ID: 0102 serial: <filter>

As can be seen the speed is WRONG at 5 Gb/s.  Something is really going wro=
ng
here. These USB3.2 Gen 2 ports are 10Gbps as sold by mfr and confirmed under
Linux.  Something is going wrong when configuring my USB ports.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

