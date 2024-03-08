Return-Path: <linux-usb+bounces-7712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52DA875F3D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 09:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75DE01F2221A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573FE50A9D;
	Fri,  8 Mar 2024 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTLDQWUc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A27524BB
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709885829; cv=none; b=DrncKn5h6vvvR4dzK09siUZwwAIYt7c+ylYP25R0O9QHvYxWKz5cqfKG6HESJ1DuBTuaNFuXUUbmDN4H1qndg1O985URooBBTUyoQVY/PIAfAMFLYKKLaVQaunq75aPhGN/ubP+2hI2buVFkK7kip4ciq0J7UZaXS5Rc4OUN8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709885829; c=relaxed/simple;
	bh=QRlgGbRVADjZrMZAy3ieRJQiipKWVF+yKH+eWgQrWbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MQNLhDawcfCH22a5g5+uAYrEfkLdN8mL5KtJmFQY5PXBYrtV9535LSx3m+lLMa515RJtNAgphNzNsS6UQVcKfAtmuARwhurG51oWAOchoHzD9AwCgU9TU5jijoXm+Fw3EpJadij6ftJAvLbS6Gb0bHwO6w09q9UKleqkSgdho2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTLDQWUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BA97C43390
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709885829;
	bh=QRlgGbRVADjZrMZAy3ieRJQiipKWVF+yKH+eWgQrWbs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kTLDQWUcyI2BiU2ng4A9fptDfBRHt2dtMCp9LVkFWLdbu+1kbhDP3bf9x+kOWU+D2
	 C8wVOb/DZIcMNSxUopZdFmBcB/tGiEXbQryMLZlAtSIufaXPrc2Cs0u/QLY9HrC1E9
	 cg1u98MwQxobZtOi3fsgf8kF9KcJIVnqNkOPjmbs2vS8PipsNE14rLGdhpEtwRXhCA
	 ULmXYL//F7sWEfj5HHqcysFU8dFjquKnGcNkruTMHBR+p5YWnfcpe9+PYodTlnr3IW
	 /JYv9ZZCB5i1oMcuqth4Vrs7Z0pboCi9yXhvNn5NsgOnhyEWkowQT1dmM/rBDbg5Q+
	 +tpHq2u8M8XOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF5B7C53BC6; Fri,  8 Mar 2024 08:17:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 08 Mar 2024 08:17:08 +0000
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
Message-ID: <bug-218525-208809-iISKak8Ayl@https.bugzilla.kernel.org/>
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

--- Comment #16 from Kaukov (kaukov.peter@pm.me) ---
I did more testing today with the game Last Epoch.

When running the native Linux build, it was running on the 4090 as per the
MangoHud overlay, but I got 15-20 fps max. Switching to the Windows build v=
ia
Proton Experimental with DXVK provided me with 60+ fps (still way lower than
what I get on Windows), but abysmal fps drops when some enemies spawn/move
underground.

I don't know how to debug this though, so any tips are appreciated!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

