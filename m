Return-Path: <linux-usb+bounces-28596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F6B99C18
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 14:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9738F3BE5C5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 12:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE813002C9;
	Wed, 24 Sep 2025 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIM/2nXq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41322FFDF3
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715599; cv=none; b=bgOOas+2Y1O2zughqEn7RcytG+VlzmXeXuQQX0Psq+iFlZpnuLNmugWZU0IM71b4f4kT0E5dTY7ZWFTAIH0T/1l9freSb1NwjUdBiQyexovenVcf5T4Ji/LoKUWqkpb60dmdsXBVKjU1rs9Y5FNYQKkhosqAyMSuhQp3QIu9MH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715599; c=relaxed/simple;
	bh=uRFQ/0H1WChbFo2Od93efqSgp/QtXBRYQ/NDMml66hQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIT1NtVodfuOvpiz4AZk8GBTUuiBecqqqG0g3zhLspd6pLgX8T12NrkaeZKE+871tbNfx0FuWxfEq0LQHucdIMzLp/iyYftd3UKJAfDxeD7NBEgS8U4EFbEJg7G0YYMLlWUXC5hStmBstsinS5nAoSdRR9Eg6o+io17jt0hLn7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIM/2nXq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 035F3C2BCB5
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758715598;
	bh=uRFQ/0H1WChbFo2Od93efqSgp/QtXBRYQ/NDMml66hQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YIM/2nXq4Weu/U0uHt95YvCNJg8F1FkTewVoWGerBaKUlK+X7xxK1lClC4Qj+BtSx
	 KCp/NfT29Aaj11KreopJy1YLM9dbLdd2ucqBg9rEUEsbBU7CiF55RKOdmlchNKmIN2
	 dBE5V3sEzgl7XEguTWGEz+aFnSZ7Nm4WKMnfjD5f7/b6dQtQqwfxV8NrKA1ou8et+L
	 Aw+ZL4aZRI/DIxxJQiYEmrxhQa0z41s6vbpGLh0sH1Gqq2WhzY+czYV3tDde04GRut
	 9l5d25vWApPD0ZHm2kZGIOOxU9RRHpmodlza7S+HrSlEzXeuIS5BdVY3nhiwXXK57W
	 nfOIjo7PNuwmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A60BECAB782; Wed, 24 Sep 2025 12:06:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 24 Sep 2025 12:06:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: ali@pourdanandeh.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-Pq1xwj785F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Simorgh P. (ali@pourdanandeh.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ali@pourdanandeh.com

--- Comment #17 from Simorgh P. (ali@pourdanandeh.com) ---
Hi all.

My first time posting on kernel.org

I am on openSUSE Slowroll with 6.16.7-1.0.8.sr20250901-default kernel.
I used to be on openSUSE Leap since 2016, but could not get it to run on my=
 new
machine, hence moving on to Slowroll. I am not tech savvy as most of you
though.

Machine:
AMD Ryzen 7 7800X3D (16) @ 5.05 GHz
AMD Radeon RX 9070/9070 XT/9070 driver: amdgpu v: kernel
ASUSTeK TUF GAMING B650-PLUS WIFI v: 3281 (latest Bios firmware)


Upon boot I get:
hub 8-0:1.0: config failed, hub doesn't have any ports! (err -19)

The USB port 8 is
readlink /sys/bus/usb/devices/usb8
../../../devices/pci0000:00/0000:00:08.3/0000:0f:00.0/usb8

And it is only USB 2.0
lspci -s 0f:00.0
0f:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
Ridge USB 2.0 xHCI

sudo cat /sys/kernel/debug/usb/xhci/0000:0f:00.0/reg-ext-protocol:00
EXTCAP_REVISION =3D 0x02000402
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00180101
EXTCAP_PORTTYPE =3D 0x00000000


There are two reasons I am posting here:
1. To (maybe) contribute another case that faces the same error.
2. How to go about and do something about it without breaking anything.

Do I apply the patch on my current kernel?

Would appreciate your guidance.

Regards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

