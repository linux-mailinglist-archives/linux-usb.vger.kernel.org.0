Return-Path: <linux-usb+bounces-11358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7D90A382
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 07:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6E31C20F37
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 05:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FE4181CF7;
	Mon, 17 Jun 2024 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiyBNMvk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F42F5B
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718603703; cv=none; b=NZ/KBMmwEOGuJBT1bPZ8688tbUE9yrNZNiZYdDYbzsMmwbTRCbfh9Bbv+inAs8hd0uIXEdEJyRCO5eyyyPtzbfPSTHkwx1jFRme4oL8aDbOUzijIgoTuRoj/nskZ5WevNdbAPawLoj85HAjuAQdITrG57KSSiWEyzu/L1yg8FRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718603703; c=relaxed/simple;
	bh=Y7GYES9Sda8JpErG5fCiZzFpWgny/avn/6u2D0U8Ijc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ch5BhHJY6H1Gy8BpXwZ3AY/KGQHntGD/EzSlW1bmqhgMX3sc/PMs4nL5SjYOd8Yi8KywXD9qDeOL5Y5YvTIzS9btg6rS/fKI/j0ND/03JcroBahYCa4zzH9WiKCJe3TuxIM/vuXrDJAUwaeA9nE/28gSpZAPyKsMfVVI187BNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiyBNMvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B4A4C3277B
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718603703;
	bh=Y7GYES9Sda8JpErG5fCiZzFpWgny/avn/6u2D0U8Ijc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QiyBNMvk6eJjcH6i+5/zCBEyqiuPcmZdxeUk0JIAY1LoPkGuqs+zQ18/TY8FUi5XF
	 BnMDzd5+CnB1/WyXW300a3TTv8GptC43Xodj9duKBm3CumXXLn867vNBMTpBh8XIwm
	 ZQDWYimN8nkw+NFll1YJCPZL7hTRc9T3nG+0Tz6eobsGhQEyqPpPQxkNYVcRSgzTav
	 zHTukaVtlJFtiexW3TlLtZbGEoRkenLmsWS7SyRJ1RoumreSphVfo88RIRSiekk4+S
	 T5m2dio4zrXVQHRt5gzxCWhvrvGqBUBgY022Bi78//E3PTpyuQf43tKHDja6pYRTBB
	 gfEv92m62jalQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F015C53B50; Mon, 17 Jun 2024 05:55:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 05:55:02 +0000
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
Message-ID: <bug-218943-208809-7Dp3F5XgoR@https.bugzilla.kernel.org/>
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

--- Comment #31 from Jarrard (jarrard@proton.me) ---
(In reply to Jarrard from comment #30)
> Created attachment 306466 [details]
> Win10USBCapture
>=20
> Yeah it disappears.=20
>=20
> Have a look at the device and hub here under Windows, no VIA Hub, must be=
 a
> Linux thing.

Forgot to mention this is with it connected to the 10Gbps HUB in the same p=
ort
the capture card was directly connected too.  I just decided to use this hu=
b as
it expands the 10Gbps ports I have.=20=20

It does appear to disappear the VIA hub under Linux which must be made by t=
he
capture card IF a core hub device isn't found?  Either way it does not chan=
ge
the AverMedia capture connection speed, still stuck at 5Gbps for Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

