Return-Path: <linux-usb+bounces-14838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4C9707A0
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 14:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48B91F21768
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6659315C149;
	Sun,  8 Sep 2024 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXzZMgUq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35031E522
	for <linux-usb@vger.kernel.org>; Sun,  8 Sep 2024 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799993; cv=none; b=tRBTqohuqizlHXVDKFE+8/KNuyY7ZWy9hhnoLR8qWe11aDiFnR1Mw5iIUJTShsauATxciKcrlKpm7EF8oHV3eDUzUFIAsQqLNq94Edr8OybYupGcifPUslwe8URx3kMED40/ZH0AHtPXm0oALP/0/zNQW36PmwWRyKuaEh7RUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799993; c=relaxed/simple;
	bh=E179StVCpltXZrEQ+ZTOqev4HeGZb4FhY75rn9eBOFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GC3qkhfgll2Dbk9f9BH4Cc4wFb6gdZ2WLTKcLc4TK9oBJPM5lMwlLoF2TCH73d+nci7HVggThrBgGyNNZg8gCqyXCjDhWNkt3srUJtpuOUMJdkKYzIw2/z2lLYPRMFqvsA0IujjCXqQj9Fd4ouKUo+kzUzN79SYzrva3jkf9T5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXzZMgUq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EF43C4CEC9
	for <linux-usb@vger.kernel.org>; Sun,  8 Sep 2024 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799992;
	bh=E179StVCpltXZrEQ+ZTOqev4HeGZb4FhY75rn9eBOFc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qXzZMgUqhVwjWmHJDc4yuLBM6o5/DacN+NTbwyNqpwORu8b9qNc+YUEeAFtGD6w8R
	 j5iAS8I2RJVgUroi3CCyTBc5dIJGdcl2u7IeCnZPd9UfW/rHCmCvrYMxMZUPQvWTVo
	 PC8o7JbTO3ghyLVw3tnuBzdF/6KXVVIqGnME/3OH6MEcj7anlgQ7LHnRCxWQEfsCsn
	 Uwxt4tIBE2jCXUS41ij9nksRZiQZ8f0WyFvbL+m2j3dcyeQsSECOnzUvhW1/hB4OAY
	 9BgjoqxuaX7LRsXQ3TSFo1FkOM53Jrwcy0OswH8lGfH1TL7pQTiKlwziR5CDIy6o1A
	 LC4j7f8tNjihQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 410ABC53BC2; Sun,  8 Sep 2024 12:53:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Sun, 08 Sep 2024 12:53:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-X89sFQd4ul@https.bugzilla.kernel.org/>
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

--- Comment #17 from Kaukov (kaukov.peter@pm.me) ---
I just upgraded to a Framework 13 with AMD Ryzen 7 7840U. I'm using the same
Gentoo installation I've used for the past few years (rebuilt for the new C=
PU).

Baldur's Gate 3 runs flawlessly with a few less FPS than on Windows, but ab=
ove
60 and sometimes above 100.

This leads me to believe the issue comes from Intel and only Intel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

