Return-Path: <linux-usb+bounces-25276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C5AED7F5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 10:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BCF47A2BD2
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2C23FC5F;
	Mon, 30 Jun 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9ZgXCF9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5986223BF96
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273874; cv=none; b=E3MauW6sjSAwXQUuSfzIQ0zB42KYEme/BkW4d8RvkWhZjf7iNxJCA/P4foJBMhZlGsA4WfhQQkQq/HrilFFKK7pp66xetkyeIOi9//3YMpqa6Dmej7iB69KPF2hvuEwKGu01MtCI9hh4L6DElVLfhXzNw94/OfMq0k1eujpAatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273874; c=relaxed/simple;
	bh=HQcsCzFQrC9/L0mBHmFEEfur44o0QC65B/EcsJ28Irk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1WC1BE+apKnoT5J4I7D3PDLEWMio2Bvn5U4dZegICLNyL3kD9hDOX5iBU+4t/lGN9oe1uaRihVauaDWQoZIOKCKM2jvPR1uIPWEoGFZLR2Gl+QLMX0G4zu+Zz1Nbu7D8npEZCB+wiMxR39SQLcmyuObGzOYxjzr1eQAZkOmnus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9ZgXCF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFA8BC4CEEF
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751273873;
	bh=HQcsCzFQrC9/L0mBHmFEEfur44o0QC65B/EcsJ28Irk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O9ZgXCF9mSyonhr+wahzHQ2EBz627MaSB3xlVLg00t9XqCUjcPP79b7aTaJ35IXJ+
	 YDmS2EpWRCv1WI4/8ajUJs9q0o1q0iwmGH1Ffz1jq4n/tAOIvHqq6UVtAKNOybWG2+
	 KJgckFanHPrPLkuPP9wypK+hI8AAAFzxDnI+Nwqu9zNo9B5yJI3Lpx8l+VhFBXAgSt
	 ypT4yybuMoHKkpX2d9WNl1bKVaTuYalqZ/1wqK7ZYr3st5szSitMF1lKHlTfNjkqOj
	 kYeSi2dKF9q7UcNzyOAV5Y04cE9jle7rTooLHBhPmVwqNjOXj1B8t7+OxI3aaYhSJ5
	 zHxfp69Bdp+Qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CCC87C3279F; Mon, 30 Jun 2025 08:57:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 08:57:53 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220272-208809-G8x6PuYMgX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #16 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
What if you disable and re-enable the whole USB bus?
Based on your logs, this should do it:

echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/bind

Note that if you have a keyboard on this bus it will stop working. You may =
want
to issue both commands at once: "echo xxxx ; echo yyyy".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

