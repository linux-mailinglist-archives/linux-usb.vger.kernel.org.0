Return-Path: <linux-usb+bounces-11356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124B90A34D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 07:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11B32B2147A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 05:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E9018131C;
	Mon, 17 Jun 2024 05:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXbGgQLU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9311BC4F
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718602055; cv=none; b=ZJxuKnfje89yb7mfJMgOxl8ItK/MmSVnXGmXYaRC6n0PwYatO7sSyDednD1iwFiMiavlsouV8aLpjgGitcOMDbyA2dvJkcLbufD8VPdB5iNDDo+8SIQmpefns8FSFSE74fLUJPYsvgcViujhamdqgtVzPMmyg/G1Bei0Jv2p6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718602055; c=relaxed/simple;
	bh=oXfTDzTuPcRkwcMFTU9ZrnnC1B0n6Tfw9+ZBnAb97Ug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QA6ZeFBBCIM9gDNfEqIlPSSIDbK/M1qYEs/RTdyBqK/gL+JESdGxJsyJre4u+5TxqbPRosifHhmcqv8y5vYlS0MAVkwaNi9unn/ONFr6RJmbmXnD6R26AtXoVmagG7De1Uc58k4PuZm+5n825DzL2c+kMILpMRRNtfA5pHXnxHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXbGgQLU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9F40C4AF1C
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718602055;
	bh=oXfTDzTuPcRkwcMFTU9ZrnnC1B0n6Tfw9+ZBnAb97Ug=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tXbGgQLUUs5bJ5JW9Uo9pAWTGeK3BD5YqEMlMb3fn9W5KQ1iLccZgixeHhUIy/qhH
	 bz4dlv2fqvTjAW7cbUB8OkfzY3AyZ3re0/HuZ/X2CZS5Fzcbga0hWGlw3XOLJHLvnW
	 0vvHACeGfG+MnKW3KMLF7GuGQalUgDZPoIYKy1ADPzaGaHxrKEv305Wo/jnP/WkQQ6
	 LVCIatpxmLl2CGUli7BItbYjkhj3k/oudNd06lXQSWBZkedpr076gE5EQYaA5r9xmc
	 JlBUKTcn1EbxkIfsX8i9y9FGu1mPD40f/FrZrkNKvgbvodXdjqmTn943VvYKrVPWC2
	 sxnFTpLbubQ3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C3550C53B50; Mon, 17 Jun 2024 05:27:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 05:27:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: larsm17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-SCiw9nGvwd@https.bugzilla.kernel.org/>
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

--- Comment #29 from Lars Melin (larsm17@gmail.com) ---
(In reply to Jarrard from comment #28)

> I have 10Gbps hub connect to same port now and it shows as 10Gbps.=20=20
> The VIA Hub at 5Gbps is wrong and possibly created by the AverMedia device
> which is also wrong. But it does not appear when I use a physical 10Gbps =
hub
> however the AverMedia device is still wrong.

The detection of a hub can not be wrong, what you see is descriptors read f=
rom
a hub so it is present and probably built into the AverMedia device which f=
rom
what your usbdevice screenshoot shows also have an RGB light controller as a
separate device.=20
The only reason for having a hub is to be able to connect more devices to a=
 bus
so you should at least find out where it comes from.
Does the hub appear if you disconnect the AverMedia device? Does it appear =
if
connect another USB device to the same computer port?
I guess not, I guess it is inside the AVerMedia device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

