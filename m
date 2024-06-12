Return-Path: <linux-usb+bounces-11238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D262905CEA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 22:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F821F21AFC
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 20:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C095E84D29;
	Wed, 12 Jun 2024 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUpXVA6w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958E52F62
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718224709; cv=none; b=oYSWWam8doVe1MpjC29mykNGkEAOqRN602RFtoXy0xEqh0LkPwcDvobbX81x/KuzFTXdwhkjQXyTt6oCbYdg9i+kPdvRkbwSQcbCtGqi32EFqenGc/6a4wrKlznY4dqhNYqNIcKwH4kpaZlhYkbkM8EU/YO4ZfVewG8z0ePZpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718224709; c=relaxed/simple;
	bh=Zy0yYh/gqdh9SKF0NwHGgT6P1UJELoBIOnn2ylhWNfE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FyaZAUxTWNa7QmEuR+iernnxk37F5YtiRobvUCozimR5LTqW9PlaXKuS5oDve8dFhQ+57IuyzB5/kWGTyR/ruwLwnkjTbsXeuIjf3svIQzgvxVMW5fRbOwVc9h5jTjVjHjJYgz1aSXhwuo3XxykR4tQj0fFevCeoCSzzTa2eEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUpXVA6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3BD1C116B1
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718224708;
	bh=Zy0yYh/gqdh9SKF0NwHGgT6P1UJELoBIOnn2ylhWNfE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XUpXVA6w0istWFVBW5tbo2OAGKqPjSF1WZqUXRREIjLiKsy5V7TPSV8mn1AgLBxmI
	 gLDZTaSoC8XvG9sekCQHUJvnMJyRiDMkZsWCSRLbKJMrIQkXJYZHCeQd+Ic7edaB8V
	 RgYgGH0C7c9e1D+n5fKuEj1Zcr/rn/hg5aLy597bU41raeXyrstqEvokx9g9U293CI
	 270vy0AbqUWkhzWLqX2Qks2gCGBlFyFloUKu6AWuNL+eEs2jtuqm/aSU9VEmnwqFgy
	 5awJhlLfe0QyixdPNCAixtYc1Hg/u5Cf9KH0cp/YE3MfZwb14kT9nO+Bpwuxzt1bR0
	 1gtzQFivK0D4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE5AAC433E5; Wed, 12 Jun 2024 20:38:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Wed, 12 Jun 2024 20:38:28 +0000
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
Message-ID: <bug-218943-208809-gk195DtRUv@https.bugzilla.kernel.org/>
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

--- Comment #19 from Jarrard (jarrard@proton.me) ---
Plugged in a USB3 10Gbps HUB (red ports).  Under windows usbview shows it as
USB3.2 SuperSpeedPlus 10Gbps and the USB devices connected agree.=20

UNDER LINUX it is a 5Gbps hub and no SuperSpeedPlus.  I can't believe this =
sort
of massive USB port bug has existed this long under Linux, does nobody test
AM4/AM5 usb port speed compatibility?=20

Anyway, still no clue on how to fix this, way above my pay grade.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

