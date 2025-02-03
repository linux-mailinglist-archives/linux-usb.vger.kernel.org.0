Return-Path: <linux-usb+bounces-20036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4975A26272
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 19:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E7D163AD0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 18:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E9420E334;
	Mon,  3 Feb 2025 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjPiRe7H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2C20E304
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607318; cv=none; b=PKP1VVVGSk93tDXhoa/aaJuAQLcZdJK8b23L5LgGDsXRhB2wqTcUmZCbWZMBgPFlkW9ydE1dJBmE6TuxGvzBdX9dupgqQo6zr00Qonyhuu5e0ddJguEhY4T7fQ0V1dDyhhaiMI36QfFrkOdG5nAuglF4+X9ZjB+gQPIRUw3SqJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607318; c=relaxed/simple;
	bh=CRUu3ZiVcGpM71G55e3SBe6dbzzadw1gpgZuFnnqIfE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RnHSGQ4BxxTTR9UOa48NB/02GaqvOmBV/7Tz3ONcz4oolAgWOPEnJTBJCpOMeJ/XzJFO41FvsU5C9AVxRq+CpXyzXMohYymFM2tyw2uak3viscoysy2EBdSgWLl8GELt83fEh+SENudFve3stHmx7o3c0BRjEb8d3hQQ3vUpUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjPiRe7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 516C1C4CED2
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 18:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607318;
	bh=CRUu3ZiVcGpM71G55e3SBe6dbzzadw1gpgZuFnnqIfE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jjPiRe7HsWWlas8B6tB3A4KurcuS2busMyJQI1NwN4frokvgUvo8IrAg10ADzL2ri
	 QR0dE/8E1gMWVrgVH669jPVjI2AGW0XzMabBvLihowlEPYKFISoWaoJ6rkIfOiQhVz
	 j14lwaRKPAQajzYdun4Wc1O/g/evUXAjAHgaszcD4mBeUFAVx0CD2d+MKlSE60J2oG
	 NKnfOwl81D1+WmiPpKxhE9N2GHXtAYdZko86poOpypzAYWyuDi4nRwIsswh8KZPz0V
	 tBGnSTPEcL/jUXxu1JqJZUZK7nWFlcGXUXS9+C1TXpIYE47jw2q2RD2IEe9mmp4fOh
	 4Pu2A5s53iCBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3DB19C3279E; Mon,  3 Feb 2025 18:28:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 03 Feb 2025 18:28:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-t79MS1avsr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #12 from Fedor Pchelkin (pchelkin@ispras.ru) ---
(In reply to Guido from comment #11)
> Sorry for the stupid question, how do I recompile only the module and not
> the entire kernel after patching?

Well, googling "compile a single kernel module" gives a lot of useful links=
. I
think the top ones will contain the needed info..

E.g. https://yoursunny.com/t/2018/one-kernel-module/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

