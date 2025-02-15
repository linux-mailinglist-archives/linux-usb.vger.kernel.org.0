Return-Path: <linux-usb+bounces-20677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22572A36E29
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 13:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D782C16F723
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 12:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1571ADC8F;
	Sat, 15 Feb 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qks2V4AR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE0748D
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739623124; cv=none; b=ajA3eQCRER4HojlSmpMI6nqtgRa1XDtrOmZl43MbhuMMVz1CTa2Kci9C589AX2f2BDizzKVxYChNRjU8GgR2HMJ99i8aDtTxngj5ivk16AZVZRmkzZPfv5TS0K6FlF5f413EGOGfZpcsX7r1Q0K45nCIRTyYaXh4veYcvJJh0oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739623124; c=relaxed/simple;
	bh=SjHHVZUI4VUemGcmAfIAd5NDfuAe8Y5WdSyteAUIxf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQzm3Ix7w4T1v2wpVVha+FHBh0XEtfe4tQw4mq5Eg9IIxmZPEXTf9w+wFhZi+V1aLBXytkavBtwXG2X1SzjoGsRRsv3cKFuLShxRGHTefl8bfYpd9090bw3NgXp+nwyWHGJCVBnI4rIYNajSNQUuiLMWDDridmftjKFM+jaGxXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qks2V4AR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A3CDC4CEE7
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739623122;
	bh=SjHHVZUI4VUemGcmAfIAd5NDfuAe8Y5WdSyteAUIxf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qks2V4ARnQdEvPrs+BK4n42z/0HkcxBGC0z9xG5s4Gb8xoQMFMIjvcs0Ll/takObp
	 1ZqBD9FC2pKp0UgjF/5c7sO9F6keoLHicxf9h/FvhNeTq5mXZJB7TFvI5TmU1OdxpY
	 Rd+dLYm8aSNbP6yKmpM5g+TlZ4clyHAbzPSY0eZhsMNMZo4UyXYz0QRxQ5TB8NLzzL
	 phNoyT4wyEewKhHUowobpxEp3YkvsVrE57gieFJshGnsauie06vhKcQbw0+xoB5ZpD
	 mIwFWBFZj2Fd5bptXEjpvbFgYFnTSu4p0Yb+BbYIxxIz1tIw0vTV2N3Qw+rToFOCDQ
	 B5qcmNWqeiWOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83FC9C41606; Sat, 15 Feb 2025 12:38:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 12:38:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219773-208809-A98zmxJBwl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #5 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Hi,

1. According to your dmesg snippet UAS was already disabled back then.

2. AFAIK usb-storage uses device reset to recover from various errors, maybe
this is simply a matter of poor USB link quality. Try:

echo 'func handle_tx_event +p' >/proc/dynamic_debug/control

3. Corruption sounds bad. Is it reproducible, i.e. you write more data and =
more
problems show up? Are things still broken when the disk is read by other
machines?

4. Does the same disk work any better on other machines?

5. FYI, some buggy USB SATA bridges report smaller than actual capacity, wh=
ich
can cause problems with reading GPT tables at the end of the disk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

