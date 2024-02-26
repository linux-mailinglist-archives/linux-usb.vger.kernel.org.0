Return-Path: <linux-usb+bounces-7041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB590866A1D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68B3CB21757
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 06:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8714267;
	Mon, 26 Feb 2024 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LemjhKYb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011014B820
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708929310; cv=none; b=KB9gfGVf8Wo71ddFizqfrD4mcXVTLr3g6yxSVGAIey8nllT1kO/LgZR1TkY9DhlqtiRHnXHwU1zhHEQV+jx6H/TiRPvI3dXwrSb6p4FBmKsoAKEVxWbkK7ZcvDOe6NS6U/RxUCrdM3DYsXpycljWHHXzVqNRDkudGZ5NOSC6268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708929310; c=relaxed/simple;
	bh=8PyWK6L6f+RZqLH975kxL9JcoFLnqPDBaRNWkOqqIHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEXUK7kWFUFCOdZGji+/oXnGnMmLG6wGbobetuLtghHdLUYnvCAiPEqt9xrnraNFtNNfk1UWBZZYkx06jcLZWOO2/PVAYT52K6nk8jJcRUjl2n2CbLcKO9arP+csQ1MckQaU9gtFljpKnkz5z06yivE4MxVbd0PLhPPiH/Y+JvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LemjhKYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50502C433C7
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708929310;
	bh=8PyWK6L6f+RZqLH975kxL9JcoFLnqPDBaRNWkOqqIHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LemjhKYbfx2raXlDT7Zwp7y5FjecyMq9KjKgDoGrwi9wkKiqYK2OFMXDvdAnoHQzz
	 hp5PhstivLSw1HCZdocMWztWFw1IUkOlp38FX1jxx9UFTuedgeVRp4TDfPGUQ+0NA0
	 6EP79Sex54M1oIPE0naChgr3y/Ie0rKVdJlmeaLBmChHs8LWbFjfAdWG7n3FU/v8lt
	 F+4v0b17iDyMuMW9wFfw92QAYMek21ASpNhx8JDBq4g3Wo302lK6gFkzAv7Gpe8rwL
	 jP7UGem8/oHuhB8bbsqM7sItp6RCCfZoo5Bx8ynJUiTxL1K8Euw8B4P3G214AoN4bo
	 QNsDuBbeYbh3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A1EDC4332E; Mon, 26 Feb 2024 06:35:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Mon, 26 Feb 2024 06:35:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-HDvsF7KJyx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #2 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
I'm not a graphics expert but I wonder if you have tried to run some benchm=
ark
that works the same on both Windows and Linux? I understand that most of the
games you play in Linux are using some sort of "emulation" and that might h=
ave
some affect here (which is then issue that you need to take with the folks =
who
develop that part if it turns out to be the problem).

I did some testing back then with Unigine Heaven:=20

https://benchmark.unigine.com/heaven=20

Can you perhaps run that (or anything similar) and see what's the difference
between the two OSSes on that same hardware?

Then we would need to understand the hardware configuration, can you add the
full dmesg and output of 'sudo lspci -vv' when you have the eGPU plugged in?

The third thing that comes to mind is that do you have any PCIe ASPM states
enabled? That can be seen in the dmesg too I think and also in the lspci du=
mp.

Also do you have the monitor connected directly to the eGPU outputs or the
host?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

