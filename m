Return-Path: <linux-usb+bounces-5494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562683B5E1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD1A1F22198
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 00:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE09385;
	Thu, 25 Jan 2024 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILGsrDqX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA727F
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706141344; cv=none; b=huN9msiauVw6s85+51YmRoGVmU1gbY/eY5tWGG9TRGJqGu5Qzc26seZ2jeU6+jC7bJWl1cyBE+muy5EtewQRl/bX8iwzBirOkSFfmnKcmJyZ3KUkUQ8r9fW/MViw7NIZ0CmnDIFWCLYDFyKcXhhfdgiPqvEEz03wRcK2VkySrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706141344; c=relaxed/simple;
	bh=cCrZbLZSG8wuzvBM9b+bYxQ0biIbvDh6JHM+QrkwUPQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WawuW9H0AbazeLE+iY3RlyYHdL7/AXnxpqMnqKni2sPvruZWJNtReRvvpr12686OlKCrBn/4Ur4zTszON9zMevEkisX/Iva5yYPcSwLNpNUE/QVdves9SLyRUGiRgc5OLX/x/NMrRZRE1aZcTFVvRXPo58ALTXL+W2dPVw+ib9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILGsrDqX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD9BC433F1
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706141344;
	bh=cCrZbLZSG8wuzvBM9b+bYxQ0biIbvDh6JHM+QrkwUPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ILGsrDqXehINoOa5BgdWIDBe0j+HbenjOvB6/hhVHgkEmj6bwfE5cy9G4njrYvo7B
	 LYUOXNqRpWPVa3LFnDQ437SFW/Ook5gVkRDNhAK9WFdCOknTDIFrlrM8BBs8hw8Bvv
	 WzMgwD8YU3LApPM2RzHwgJRWk0Pvil3ywzWq2WmpZRsKwlDK6CqGPifKaZqQLyZmTQ
	 0spSOTEZ6m6xGdRJnWfpQKDEcUQfcY2ACjLG6ls8JsRiqVAqGo8uabDZzNaRXcoWVT
	 xlcbcTyhsaK4XtydbF3KlTX3e7Oru5upYcgEc6iF62oyPvdcEwUXmCP4BwYuLZhzlH
	 Wqjmc4bvM3/qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 672D0C4332E; Thu, 25 Jan 2024 00:09:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 12-b020nr - Charging over USB-C not
 working
Date: Thu, 25 Jan 2024 00:09:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@johslarsen.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217511-208809-ngfuXxCpyN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-208809@https.bugzilla.kernel.org/>
References: <bug-217511-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

Johannes Larsen (mail@johslarsen.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail@johslarsen.net

--- Comment #3 from Johannes Larsen (mail@johslarsen.net) ---
I had a similar experience with my laptop. Suddenly the system would not ac=
cept
charge when I connected it to a particular USB-C charger with error messages
every other second like these:

    hp_wmi: Unknown event_id - 131073 - 0x0
    hp_wmi: Unknown event_id - 131073 - 0x1

My guess is that this is a notification from the firmware that it does not =
like
the power supply. Reconnecting the USB-C charger did not help, but the lapt=
op
would happily accept charge from another USB-C charger. After I power-cycled
the problematic USB-C charger (and/or after I tested it with a PD trigger a=
nd a
dummy load) the laptop accepts charge from it again. Still getting one of t=
hose
messages every time I plug in that charger though, but nothing like that fr=
om
any other charger.

Hardware: HP EliteBook 840 14 inch G9 Notebook PC (6T1L3EA#UUW)
Kernel: 6.7.1-arch1-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

