Return-Path: <linux-usb+bounces-6413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F185506B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 18:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69F671C20355
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 17:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869C07C0BF;
	Wed, 14 Feb 2024 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU0JUL5n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C017D40B
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707932078; cv=none; b=pd4RjqxJAUeb2elaDxjOLCW1G1oshsVkzMzMDWNf1W/0zbVzTsh3DShjb/8Kl4CdrTnLQ8uJ1mwewQR6d54kYYa8V70Tw8jkk1NiNv5jHWGjtiEaDuRZQ8F/dWuyYOPs1M2Ia7tN7XqD7VSjO8QBSJlkhtq6OfUjJurw3+/oCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707932078; c=relaxed/simple;
	bh=elpydyWmZ8T0gp2nXIKhqfCPzL6Lr6kextcfXt4MbT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ECQmv3y7KoAU1Ei7IdChcFjLRopeSzrHknhhgDXDgJiuW431mvqmfYr0Pj+rm0b4+p6FFR+4GgEP/3XuzMRS4EmiCRUbofbBURY9ZM3Jqxr3fjOSUi6f5ScoLOik3uH2yZqEADEzMor/yt5dYpUa6uBXsHI0hznCmcRIgyKMISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU0JUL5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F44FC433F1
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707932077;
	bh=elpydyWmZ8T0gp2nXIKhqfCPzL6Lr6kextcfXt4MbT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PU0JUL5nhElKUpVcKyBK6q7ApDODy0iRjyd4lhDo75g4+dQlbLgu191PvqB+5hO6m
	 /jaOVjEZ17+6GYM2AM/sSWKzN1O+Tn3nUCVtYr19tPs6ljOWY9Lmt/5NTtfav6B2Cl
	 2VSKPJGbPWVcBispfy+3DcjZygn/QxeMIyYi7nBkJph0YhpNn2LF3suqwiuj+NWzpE
	 AenaHQGT0Z1A4x9MEk9MG/2H8iX31JzeSS8wMunEP+/ObUrsEJ8vWiqraDp+wXgOA2
	 WZtUJ/B3V2ehOEDTKawM6j6b7/N5HTPflA2R5Gr1OtutmiM3yJAWqS0jYIEcwlzvIT
	 uuzMexJMFmpXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D7BCC4332E; Wed, 14 Feb 2024 17:34:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218495] NKRO does not work on Mistel MD770 (Holtek
 Semiconductor, Inc. USB-HID Keyboard)
Date: Wed, 14 Feb 2024 17:34:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ishitatsuyuki@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218495-208809-IzzhzL0yIL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218495-208809@https.bugzilla.kernel.org/>
References: <bug-218495-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218495

--- Comment #2 from Tatsuyuki Ishi (ishitatsuyuki@gmail.com) ---
Created attachment 305874
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305874&action=3Dedit
hid-record of the NKRO sequence and report descriptor

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

