Return-Path: <linux-usb+bounces-11357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D639090A371
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 07:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B1C281C30
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 05:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A46180A60;
	Mon, 17 Jun 2024 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubR2Zwsj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB02F5B
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718603541; cv=none; b=gjHsdAy6yNdCH7OFHl/pju1YKitLDPOjULHPokR/wtmBLfHRRAKPgTWYNjYmX0M701fkJuA4n+CexYnelus7jjGDTKuy0bAxYCsGUQvzxEPapu3W7urZfn8H7WWW1FZpab18HuBaeUgMCVQS834brn+nPMqbWpo1kWSoRoEATJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718603541; c=relaxed/simple;
	bh=LeFKE6UBMpeVf9TT5LmbgYDdOjbONAUsPhmdeQgHfS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fXp3zR7lwsVNIZ4LZP14bi/oHCxNk9ZWT5eEta+yjwg3RqpVmqIF/XXnXmJOp1hvKHR+S0bU/v49n3LYy7SH/y6GZlq6G6lsygUAGUAUixvTRVixhC0PkvuS/QuFRR+4/P77W2T77hltIHVYqnx6wPNzKTA96YIkY5ZoO6w9fdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubR2Zwsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF4DC4AF1A
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 05:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718603541;
	bh=LeFKE6UBMpeVf9TT5LmbgYDdOjbONAUsPhmdeQgHfS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ubR2Zwsje2GtIM4shnnZ30gmMrEsnTcGnlFdlJo3x7WRRtfOx1oOpQwDcFQvVkFC3
	 neTrDr/08Dsx2Nm8EwM4jORDaWxm7mobZ5qKzkP7F02YlO/r/OzkEvQ+OoMXIZEOe3
	 5LAFk9nJXQlpjqfMYgy857nwJzQpSjsrMRniFKA6RSIKxcMLE7FHojK2TYk/O0bYWo
	 ugnd0m2vWe1hu13HmpqnzAx9x8BhqZiegPDQu05CGkBnxiWM0jfHz49g797veBIxBh
	 n7S19GwgUYPSY8Y0ujd9huCx/wYeSRUNiSgBnR8cCNbdVlM0DF0R3rqZjIGFu4v+mO
	 L2RerN79HiRsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB3B2C53BB7; Mon, 17 Jun 2024 05:52:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 05:52:20 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218943-208809-hJTqTsCQg0@https.bugzilla.kernel.org/>
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

--- Comment #30 from Jarrard (jarrard@proton.me) ---
Created attachment 306466
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306466&action=3Dedit
Win10USBCapture

Yeah it disappears.=20

Have a look at the device and hub here under Windows, no VIA Hub, must be a
Linux thing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

