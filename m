Return-Path: <linux-usb+bounces-27099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D723B2FED9
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599D85E46D5
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7795327511F;
	Thu, 21 Aug 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnXh+nlo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4D30F7E0
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789982; cv=none; b=FniU3cub+NRkSgl50MSzvjA0n2VoS22Kpp4R1HGX4kPYNVwVTuYbhgxf8y4xSEhn9sis+iABKDgo5kVJx6e/S5OlaGVPi92kP9bTAOMYznqCUvXW6zYeJsMzpoYM2cuBex+10cn3J719HUkuvKFc/1Dm3vLEysZMDITc+l6DSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789982; c=relaxed/simple;
	bh=0IodDOJHawrZwBogfWZlpLiRZP6+FY1q7gMh1y8+ruk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dKicuyGCroNplEUSKHgCY21InwyBx/+rVaab6yRwIKx/BMM/OufcFSIObU9JdmDSF0LaBwXocDJHgg9ecQbIkMB3Z3vNlyZ10cTmlQXxTxQpkuF3TBTgMQ9lfaeBbonJAr4qf5bZJjcTQOYuhT5rSxN/1JXIdjaBN1Tf6JBKQUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnXh+nlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76C1CC16AAE
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755789981;
	bh=0IodDOJHawrZwBogfWZlpLiRZP6+FY1q7gMh1y8+ruk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BnXh+nloaguHFU6roQamwNHUn+oK9wR7Yim1C5HmRj6+LyFVmup4QmFDNVJJWp9Jx
	 mmO9501LypNeDC+2r6GTpuPN9cWgReW2VfxXxHJ4+BjESkdo4VnUJShPnwcObd4voY
	 cB2HwilUa3JzUKIUxTtVOIRaI4Zev0nncBznhsQ6a+mXyPA/b9WYuGJFaCTP6QMkwL
	 D38eLd6JNu01g8sMulinxZIICWGVqhqkCtHH/864FQpEx29dPSyc8pWSClsFS3zK1T
	 RlOXRxi9KA+KmFXOLVILXgpiH7x7NHoVd0zg3wyXErN8TAsKOeidEt6yepb+kewydP
	 KPsx+zLTy7SJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 68061C53BBF; Thu, 21 Aug 2025 15:26:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Thu, 21 Aug 2025 15:26:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220460-208809-MVUztDIana@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #7 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Yes, I am going to do so later. Just to avoid misunderstandings:

1.  Even with the error messages, the USB-C hub seems to work. (I just test=
ed
the Ethernet port though.)
2.  Does =E2=80=9Cworking dock=E2=80=9C dock mean, the USB-C port where I g=
et no error
messages?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

