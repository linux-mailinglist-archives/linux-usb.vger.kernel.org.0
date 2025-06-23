Return-Path: <linux-usb+bounces-25002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0FAE3AE4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D95223A1D7D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF428218EBF;
	Mon, 23 Jun 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAavyEgj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6709F23B0
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671723; cv=none; b=Lwb3OyjODRUM9dqIFHVmUN0xzu9OXXmMYDeNQ1qdIbwrN/jkwv0lv4Sxc5wcWFL83WQpyTsQUk6q3nYNYPB0EAEHfTPvTyiMTWxG4awH57D/RJhSZco3AveBmQ+mkqJiX2I3RxGU2yy4fNolu9UAU35dXhOV07LkBroNCNnvEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671723; c=relaxed/simple;
	bh=E9aJ9ro+SvBT5topBxlyCMUsFwLCE48CrdgPlYK2Z5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H525sIhXR9zX3p3MqbAVosdO6ye49voNH1Z+rXepBFEfAA8Hdii0qXGLFT3NLUmkEaNRFG/1rde3Fy0qoZ2BGPU1gWPQmMYE3SBonKp5Q119KYDwhpjgd0gu/+6WTjFHmPx+cba+8VeoaSgJGsUONc3g8r6nvhcAtWNhAf1qJqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAavyEgj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F001AC4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750671723;
	bh=E9aJ9ro+SvBT5topBxlyCMUsFwLCE48CrdgPlYK2Z5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EAavyEgjpxprAwfl22edfyHhQfjvDL/4o5REVUfdIz+RR8IId4vSZ6f6C6cKqkxyi
	 DrysYu1ICVLDJ1iWkeYlEnNqqklh9AwnVwLmkc+MNkLmE/iRwDpKc93NECIzkGOqYW
	 jOYzTL5GWdUdTPJn4ztXDzX7uvwj8BUF71RddOFd0yIQCdwqVLr8ZWlmp/u3HqXEHg
	 uRRaP+oPoNIxXM7hmJjODtuCeFS2Vv/X1xAa9DKG7/aUwjLwQuZu8bbizq799n9tpI
	 lNQV6fdUH8+rwCw7bESCHa+HBT94BBAAGy+Lpn4SJv4SAXV71uKx9W31utglpvKxhi
	 /+Ru5mAj2zhTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEA50C41612; Mon, 23 Jun 2025 09:42:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 09:42:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-9AYUos4Vas@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #5 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to Oliver Neukum from comment #3)
> It is good that you have found a work around. But you were right. This is
> supposed to work.
>=20
> Could you please post dmesg of working and non-working cases?

Not working state:

=E2=9D=AF sudo dmesg
[ 3060.495262] usb 1-8: new full-speed USB device number 43 using xhci_hcd
[ 3060.620074] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 3060.620089] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 3060.620093] usb 1-8: Product: Yeti Nano
[ 3060.620097] usb 1-8: Manufacturer: Blue Microphones
[ 3060.620101] usb 1-8: SerialNumber: 8832D12120041006
[ 3065.850153] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1

~
=E2=9D=AF

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

