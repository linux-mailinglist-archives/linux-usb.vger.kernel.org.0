Return-Path: <linux-usb+bounces-21826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B04A65BAE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 18:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D501217E2FF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571151B4235;
	Mon, 17 Mar 2025 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiKUnU47"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E81AF0C1
	for <linux-usb@vger.kernel.org>; Mon, 17 Mar 2025 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742234270; cv=none; b=c0rJmgjK8Yx5i515DMGOWYLjJ/yn9Q8FAEzV80M1BMRNy/XWBISPSRQkLK2KjjeddDPIJzulGVshl78AZ/3q4aH93wve1S/8RTk5J6A8YZyHDr5tdaDXcJR4qJ49ttn3fWPfwkwa0+Bgih/lCfnGv5U885sksoKe1T3FC8+J050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742234270; c=relaxed/simple;
	bh=njJSa1WPI1WYn4asWgBS3oMkQtpFXklg+XLDDcoqwIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aVQ0jC2M+lsToVzsz7+x+HUBJJwc+b8BI5qOQfbhvbBgB3V9yqj5V+mV4OxdGgNb6g8t+2/c4PeLO6TejI4Zot7zrPBk+GzabTgVhr79uFUBmli1HnYUwHNdfr9m58jq38x6ZXohLD+m/kv4HGUM8BfCb+PJAJeDMHB8rrIcWcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiKUnU47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F0A3C4CEF1
	for <linux-usb@vger.kernel.org>; Mon, 17 Mar 2025 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742234270;
	bh=njJSa1WPI1WYn4asWgBS3oMkQtpFXklg+XLDDcoqwIk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NiKUnU47uNnwFCibBOovG0S3HnwQCOdA0S65D6dUAggokKV7I/LedyjULNJ5dgXCz
	 Gy0i8pH7I/qtG7dr9aYz9jCPsmjIefsnLU+jk3+gFfLEloTfYtGZ+PJrDL8A+TPEcB
	 lCEl0vRzxybbcUzwVuH6rpKyoNpd3DKq96GlIEwBFdDUFvKDuTuN0hZzdEUFE8N5lq
	 Boz2y91+hpN9GAvJRDdQSJFf0xrSbWRalM9qyZHIHL2qOKMkqdVg6bS0npUXRfxorp
	 k/5YuGU3hxxXTyZqIEFWDoOtqkfhU0QTwxgc44Juc7Y/ZdX/WGNUeaAcGAr2KR3INL
	 VZflLGMwGS/Zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 365F6C4160E; Mon, 17 Mar 2025 17:57:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 17 Mar 2025 17:57:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tr.ml@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-9hx7X0GUy6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #18 from RockT (tr.ml@gmx.de) ---
6.14rc6 and 6.14rc7 are fine. Thanx!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

