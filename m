Return-Path: <linux-usb+bounces-11342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A06779095F6
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 06:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 495191F21B23
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 04:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E541ED517;
	Sat, 15 Jun 2024 04:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpuF0lFd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606534A3D
	for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 04:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718424520; cv=none; b=QpfjmkuCm1Xd5eT0DTO9qcWyMiFD6lr+7cB2pdFvuCSt7UDF6j/xcS2lNq9zubaN5NoQiRtfOUf9phtMSc+XCrlQ9WOc+GXWmgEoHTRrG7FeAXPSiwLus99OHIEbVpNh8soNGUY8WlC0r+OBZ7ix10v9R5KbyGObRFjHb5SkwyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718424520; c=relaxed/simple;
	bh=Ogjds8qdxAqNAuoiC4qFDrvCwnlA6M+UuzNCBDS40sQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kXyP/xVl44fEoftXA3ATxsa6dPkQqFARIm/0wy2gSeuxfUuWaIGWHtwhpy2+gRarqhRuDmeHxvomfAshn+JlXX7Ti7xa55RlYlATOHMrUdeqA2ubHAd3GAxsrx4/PoJwolVW+XS2AMemOXxkNUf+M9R61txWaG43CV5tBrt9q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpuF0lFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9CA4C4AF1C
	for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2024 04:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718424519;
	bh=Ogjds8qdxAqNAuoiC4qFDrvCwnlA6M+UuzNCBDS40sQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GpuF0lFdbtayejsFEM1WncofYGS4xRrJZ/uOEMzikJQBIqEPNamzplzdTKbZAZjL6
	 Wy9G+9ryfgSsAgkKi1Rhm8hWcBl1h4O34rkfAFxkhTVxt6ethP6+nvfssrQFR+PvyF
	 cOjWlxkhLnMz/cfQjVtpjquoyDed/w7Zcx7fvJGIbq/ynjERaZUI5lsZA2ZtQTPHmX
	 Y2b+Nf6hu0tyhV3qBdMOjfwnJqMkrQN43Wnd+Jm0qyJbwdHuXnJCutKgSj+0vcJrWN
	 wSiybouJJ1Qh5/s19IMZbFfl17cKULayT7+9+IqLe92imLRmVBauFk23Ut+6f5lMBi
	 Vttr/963Ly8lQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3842C53B73; Sat, 15 Jun 2024 04:08:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 15 Jun 2024 04:08:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-w67yWnY08c@https.bugzilla.kernel.org/>
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

--- Comment #25 from Jarrard (jarrard@proton.me) ---
For reference here is one video where he talks about the 5Gbps port connect=
ion
speed issue under Linux with a Intel system.=20

It seems this may also be the issue for Intel systems so perhaps I was wron=
g in
assuming it was just a AMD issue.

https://youtu.be/imvTVL7oS2w?t=3D589

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

