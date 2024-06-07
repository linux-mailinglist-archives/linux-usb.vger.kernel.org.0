Return-Path: <linux-usb+bounces-10997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAC8FF896
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 02:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6B30B22632
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 00:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1110F4;
	Fri,  7 Jun 2024 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWW6Xy+w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC5819
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717719332; cv=none; b=pkqM5fYeaixFdL9WtQuwNqpIE/mIFQL3dt0v+y/qgvxDnOsenHQ469u6k/Ge8TnY/mKqYlwE55DAxNiVdtRcakMZz6N1b5l0yx1oEVPamyrf3CFvgnmqkhjk4bzPgOO2K2yKLYL+LLtNDIRfHLyQ52T/U9SFr0Ex8DJ+uyv179Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717719332; c=relaxed/simple;
	bh=kcunekC8a6ftmx1v+4ytaFc7/71McqpPDuSRuh/QGMY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKdGv60omon17+xA7pz5fLK7raTB++ZT9kPtGP4HvOrfxTn60b5ClnsLn2Ojt4paBiVv3wi7+8/YFcYc/QrVK7QfLnWKNq5REAGsj5N+jc0U1JavO7BPNaM9QlzYflt+ZHNxesAdMe5qliO3R++eZn3/JShEEnJ4hWRUyCatUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWW6Xy+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E29D5C32781
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717719331;
	bh=kcunekC8a6ftmx1v+4ytaFc7/71McqpPDuSRuh/QGMY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AWW6Xy+wJkqiPLGvWFC3jQTTNzLDHsxXt5LBAfDZuswrmFQcbO1cjYxznTNGo7nQx
	 rPKNcPOTmtO0Se+1bKAN2D8eOPPxuyX8Svft8Lby7SbnqMxj1F3mjwhdZOHeUjh0NN
	 BvfMMIZ4ZB37NSIMgSSMcCx5i9GTfldgOotmoF5xn1txzh58XjC8jnVcsrYbnyH/jh
	 pVGDU8/GYd0LYychFkBXgpb+3QNNTPQ9bkJWP+UiuG5VbJVZxFLPvYcxGb0AyuHy7F
	 H8+vhaKBfXnEuvSqb2F1tDaQdLEWbCFcTDyHUQAWjCHNm1fB/V465wUqHQHxrD3XVe
	 JZ9DJzKGOulGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D972EC53B73; Fri,  7 Jun 2024 00:15:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 00:15:31 +0000
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
Message-ID: <bug-218943-208809-oupK06j8ja@https.bugzilla.kernel.org/>
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

--- Comment #3 from Jarrard (jarrard@proton.me) ---
(In reply to Jarrard from comment #2)
> (In reply to Jarrard from comment #1)
> > Created attachment 306433 [details]
> > inxi system information
>=20
>   Device-3: AVerMedia Live Gamer Ultra 2.1 driver: snd-usb-audio,uvcvideo
>     type: USB rev: 3.2 speed: 5 Gb/s lanes: 1 mode: 3.2 gen-1x1 bus-ID: 4=
-4:4
>     chip-ID: 07ca:2553 class-ID: 0102 serial: <filter>
>=20
> As can be seen the speed is WRONG at 5 Gb/s.  Something is really going
> wrong here. These USB3.2 Gen 2 ports are 10Gbps as sold by mfr and confir=
med
> under Linux.  Something is going wrong when configuring my USB ports.

CONFIRMED UNDER WINDOWS!!!!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

