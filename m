Return-Path: <linux-usb+bounces-11732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27891A3B1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 12:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F5DA1C2122D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 10:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE6D13D52A;
	Thu, 27 Jun 2024 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXvzUE2x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582422EF2
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483915; cv=none; b=H5NoDJ4rfBGGUOrtfkZpI6pkJFNev6w74EydCPbRulXtIJH9RjZpNMF36Xr7w96iHrsGJVYC64A0sZlGfGcqrPFSEha5Umxg14vlbo3Y48431F3dZTMiikav9lozYmFhOhY9eVEPhkrCiFz2PdQtEAtbMUOVKtfX/AJbGCBsG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483915; c=relaxed/simple;
	bh=wZ/G8LHzkiYmo4prSjNCYvrImcvwGfwp91fiNOgMeIM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QtB/SkRBlk6oGBiYfBWgjaLOsBEEz7qYF5zOU49ZUhgCnvzxx3AdCCUP4uCc2NiHuPgbqg8OO+qogehC45Co7Of3DS1Sk5fywf8k/foliyAjQ03HPFPMphW7yyDUqe4WnhN/IveY59mG5rTR7vfX3R/oVCqb+Ip89RP+hd4rOXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXvzUE2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1531C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719483914;
	bh=wZ/G8LHzkiYmo4prSjNCYvrImcvwGfwp91fiNOgMeIM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kXvzUE2xhH1YXKaUjn3dV2w9REEVwr0rAbfKJcBZSG1+UeXLayO9SsWeaANc2+ozV
	 s0YZ1B/oBYbc4gWkL7vCsMF0bVdxEUc3SJyfmYKrxXzPl6kCaROfiRMT81xNGJQy53
	 l8J/1L76vAr3eku8deZHNfZl0m93XAHYZb8uFm1ABmuPI8cWKUXie7tkae4u6RzVL3
	 MrKXKE9asRZZNU3bgrErV/DHBRZaRnxbrt+tcSYCICmM6/jIF71CEdcoqGaaJ/Rao+
	 vHhtNP1lGJ7E6sPfo9GI6P3PkZbNn2fIVD7laYSr2mjlgTvBUDKuTsuc7WdY2CnXaQ
	 UpLO9ksimU2ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99C62C433E5; Thu, 27 Jun 2024 10:25:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218992] Usb Type-C headset TX is noise
Date: Thu, 27 Jun 2024 10:25:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quic_ugoswami@quicinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218992-208809-7esPQ4yuXb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218992-208809@https.bugzilla.kernel.org/>
References: <bug-218992-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218992

--- Comment #3 from Udipto (quic_ugoswami@quicinc.com) ---
One more info:

Looking at endpoint.c code I think the function snd_usb_endpoint_open extra=
cts
the ep->clock_ref using clock_ref_find(chip, fp->clock) and this remains sa=
me
for all endpoints available.

In the issue case when the error mismatch sample rate comes up, looks like =
the
ep->clock_ref->opened is 2, and it will not decrease to 0 when we close EP =
0x82
because EP 0x1 is opened. Also the clock_ref->rate will not go to 0 when cl=
ose
EP 0x82.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

