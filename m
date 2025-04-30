Return-Path: <linux-usb+bounces-23567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEAAA4331
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 08:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6FF170DE7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0706B2DC779;
	Wed, 30 Apr 2025 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RD44+UNN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9A1E8326
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994959; cv=none; b=joDpSOS36g/f0F6NyLP+79KKBb+yyUQB7c4LkuFa253Rf/SR1JKO1etLljcoBjlnTz7d5iazy3tVoBlBSBEydTQPw70iVIz9Elq7PHCE9Sqv5HjRoGshiwUnf3m3JE+DzVF5uiVYZf35jxaCfa5H6HUsl3uuIfAC4B+5sDW9654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994959; c=relaxed/simple;
	bh=ERYZexWtwjh8EUtRHvaZY9F0oZ4QNvjigu3PDyDHSFw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=htfOs93KBMR6QPktgu7pAir2B5konpW6M3FnIOZqD8dAOXQEvY2GeJbpz+3o0KqVI43ev0ODZaEPfG2x3yNo98By8PQsKBbjItg3Rd1JYO4yfrsRRVsXhARUQcibArgjhlLhUEvR0+tnVZQ4kixAuqt2Ybcy6yQi1Lz2h4z9NDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RD44+UNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61C26C4CEEA
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745994959;
	bh=ERYZexWtwjh8EUtRHvaZY9F0oZ4QNvjigu3PDyDHSFw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RD44+UNN1ItdtbdDGALAF2UZlnyFOmiBeo8k299q/Bw61IiBrKeJ4hNbx73x6YtCO
	 CUtGOcUmGjVFUlZM41dq+Lo0+GBRlCXk2kwvkUjqYEjiOYm53WspWw7ndgWdhDv4ty
	 AlHf/zxX7qpq9mgGRH4PuOx6pxhPUSIAC+vfg9cAaUVvbPu56PY9mOFWrvnz8dkxI8
	 k348LYd2w0e49CZ8HpOZBbd0G9eeOg/oB5JgQ8y/lS3eBzMtxcBW5CGvl9MqMHrLuw
	 6UIIu1bny7wFTgPk2+9n+i5BGTOnmGv9OeJPlQnKYagP4AKDfDDr4BY6BZL+ll9yg2
	 QN54xKTIbP4cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 59BF5C41612; Wed, 30 Apr 2025 06:35:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Wed, 30 Apr 2025 06:35:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-iqsjuuBYDN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #5 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Looks like a problem with those capture devices, then. Maybe they all use t=
he
same chip? One name I have seen somewhere is Realtek RTD2801VPF.

It could be what Mathias Nyman suggested in the other bug: the device expec=
ts
some particular order of descriptor requests (as issued by Windows) and doe=
sn't
know what to do when Linux does similar things in other order. It would be a
little weird that such a bug only occurs at 10G speed, but hardware can be =
all
sorts of buggy...

To test this theory it would be necessary to patch the kernel and observe w=
hat
happens. Can you build the kernel from source, are you familiar with C
programming by any chance?

Another possible approach is to sniff the USB bus with Wireshark on Windows=
 and
on Linux and compare. Disclaimer: I have never really used Wireshark on Win=
dows
before, so IDK how usable it is, and any changes to Linux behavior would st=
ill
require kernel patches of course.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

