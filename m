Return-Path: <linux-usb+bounces-23530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A831A9F90D
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 21:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF255A3593
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 19:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D44296D2E;
	Mon, 28 Apr 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9gHKSKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD82957A8
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866811; cv=none; b=ORWzizDL/4hJ8Wyd0gOcEAjLLRPf3ZWb8U3LUZK3yNhcPOD4+hNlNy0h9VUsOIT9G2FCmQ8CzdBSdq4B8l5AZXEbckpNE6qIWomawihDfblTPj4T+dHJg5tA5kFtEjekUB9J+a70BiPW7dz0vtlPLMNTNYCDclWfJzu9SKyVHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866811; c=relaxed/simple;
	bh=wNhdhv4KYb5cDFIiRq5Mv/aSpkv9EK09JZjf4QOfT+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZBgCK7J4xet4c9t0L3k02d1+Z2Amb1kC1H/1h6cU3rwpWkuojX0N/W2bk6Q0Kkv4P9F6cA6czm9oSJC2pOx/49d6fF2ibJ+rryMC+4nrug2M6w/6mpC9mI1DHatR9wm/AHYfIamqei4csNgN2qZx2pzg7u920cHALXqfQQrDGzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9gHKSKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9645C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745866810;
	bh=wNhdhv4KYb5cDFIiRq5Mv/aSpkv9EK09JZjf4QOfT+g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z9gHKSKfdREwX0O7UbLKpRISeukHqppw40QdWsv6iSBTgfxgA/iyBVT3yl/5Cy8j4
	 Q0/okdUY3pawbXE43hh3JaOeaI5XdvPuH+baKTFIJ+/DyhU7v6kJZbc/EyDHPL14Zp
	 iobgrjOnrG0ItfTN7CiuNrcGxOQE9aPeGbAiHLkcxqAjwAgmxvk2aKbeWAZgYWrmQh
	 Y80VdMlbWOo9SJFvEMcFR+8v3iROYhOv3w+c988WNG+0jpGaYa9IuVmdO5s1oMgwl2
	 d4uL6JP7ucKYdphDIXe7QX+ZiPE8k7uubEwPdBbEUN5fNEV4ESBu6F1Tku59PLyN93
	 hn4NCrznk/aKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CEFC7C41614; Mon, 28 Apr 2025 19:00:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Mon, 28 Apr 2025 19:00:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-nsruzr3ks3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #28 from Steven A. Falco (stevenfalco@gmail.com) ---
Thanks Justin.  I'll continue to work with Ilpo if there are any proposed f=
ixes
or additional tests that I can help with.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

