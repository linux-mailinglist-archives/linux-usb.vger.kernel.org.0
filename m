Return-Path: <linux-usb+bounces-23484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D06A9D966
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 10:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C267B1BC152E
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 08:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED17B24E010;
	Sat, 26 Apr 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bC1raYmK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A021B1AB
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656774; cv=none; b=eXfZ1kRRKTI9NaNWH778PfhpaCpTdThY3Nh18gc2SKl5+hxSlZPI+P81wPu25rsihiTVe2uIdYUewvVG5ULZWjtIpY88/Dluboc5VtBwcqi0lTueBobkBDix12b9/rt6hQFD7k9kuepgUqG4P4Vp4TYuI0PyeAdg89HDbiRjKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656774; c=relaxed/simple;
	bh=X6VbjUjjsICOvb9JwPmytd/y8Ssr42l4aCLLkVDm53I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mqe3HP5qI+wXb5LA3GwdySbzd+gcBPs1AXHgYXSrNqIqEQPzyB5ExJS6/MrHj9rQYCmxkVUPGiMw4aKmwa+ViRaeTavFxixrnna2lXxGdiUXTdIxFkqq2ykbTVytFNqFUIKp4HXJJcd2Ot/ePN+rZzmGhqfqw20tNpwe9v7SoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bC1raYmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E47CEC4CEED
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745656773;
	bh=X6VbjUjjsICOvb9JwPmytd/y8Ssr42l4aCLLkVDm53I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bC1raYmKHhTb61m/Wt3ZLqC2Hl11LLSz64ZkApT3fsHc0427W8WtKssj49S22hU7c
	 tNoOax2yXDlW9ZXDOi08r3vfjUBmTqb6KGkKeQzpymCuKM6Ok+tSaNoybEeoIOMey2
	 3erujFA/pOEQieYawZC/bUEJQz0yTbQ7xdP+xjS2GLCcPSdBAbwbgxWlcf9zi3w4NZ
	 nkz15lgVwMqRiatIl+Lbg/tSGtSp5R5HpeOXM9wgMn8+fvkeyGIBJAMzdvSuS6a2Mh
	 g6EFDzYP0kmb4MKtMO2cLzjp5JlYZ60lvrP5+wq9XxHSAmG78K017omyvJAlbXn84o
	 rjhxmRBY32PWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4A2DC41613; Sat, 26 Apr 2025 08:39:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sat, 26 Apr 2025 08:39:33 +0000
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
Message-ID: <bug-220027-208809-LSo2u0hHuR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
This is similar to that other case: the device comes up at Gen 2 speed, then
fails to return descriptors (5 seconds between messages, looks like a timeo=
ut),
then connects at Gen 1 speed and works normally.

Do you have other 10Gbps devices to check if they work in the same USB port?

Is this problem reproducible on other types of USB controllers? The other b=
ug
mentioned an ASMedia controller, those things sometimes have problems which
aren't seen anywhere else...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

