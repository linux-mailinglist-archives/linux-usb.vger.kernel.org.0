Return-Path: <linux-usb+bounces-11731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9DA91A3B0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 12:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423CD1F2340E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 10:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBA813D50B;
	Thu, 27 Jun 2024 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGlnTQgM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0A26AF5
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483889; cv=none; b=aP7cu4e9mFy7tRQ/izBq3YWB5IyhTMekZybPJCdokFNIQZGU135HeMdEtNazqRrigMP0rlOJtGKfRnmlpI2Bw3TxBPjuKNu3xmLVNC2rF/8g+N3ux6CRPud3WFOrWZhxuiUdO7ghAdsnBbWdg5jFO9zN0clN6RUN88g97WVnvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483889; c=relaxed/simple;
	bh=VnhgeiyI45wfF1ivP/B3jCuvigzjWwhpr3Lw0lEwUvg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GmezGdXbs+x2bAPRsIuos95V8DHpkfLDDwnDfhyar5lnkNN9ro4AMQVnckiUIZgxY46cqRQidmhpkB6y1DqrQiZwNzHppoZ0XZ9w52d3Cs+q741qrBr2Ux9ZM1oOi2Rbsub5bN3FZoQ2NOp/2peHms9XsdczN6nWOYhYEQZsNhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGlnTQgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB0A3C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719483888;
	bh=VnhgeiyI45wfF1ivP/B3jCuvigzjWwhpr3Lw0lEwUvg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KGlnTQgMkZheZ7CyPonk0+QUYlSYLF3orfSemmVdxbW2QJb0s9F4OpNbR61EcU3A0
	 jJmKyERjsAt61SSmHUUH1KvG1sh6MeTa0ujy8Xp47g+B69YdfMnBY+YXNVVIrZtTvH
	 JfN0/TZvdzrGSNiXex2d5cpQzRCUL8l3NDUSjXN5WGqdIrb4agZN+ydYSrp5mKyDXo
	 +Qgjj4U6ZABxfL80QGoEuA75LQv+abPwbeAaLt/RBh1SJXFF3uxJkhzDIWzfNrjv7t
	 uudl8gME0jYz/atRIHZxyO6UBPRxAB73ZKesXFm1WwoaaWmrse1xBo5nuPsLRX7exd
	 7njRZMly4ejtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB98EC53B50; Thu, 27 Jun 2024 10:24:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218992] Usb Type-C headset TX is noise
Date: Thu, 27 Jun 2024 10:24:48 +0000
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
Message-ID: <bug-218992-208809-i09yt2HdeH@https.bugzilla.kernel.org/>
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

--- Comment #2 from Udipto (quic_ugoswami@quicinc.com) ---
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

