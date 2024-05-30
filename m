Return-Path: <linux-usb+bounces-10696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAED8D4EEC
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 17:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E288B27715
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 15:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F51187555;
	Thu, 30 May 2024 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9reJLfA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82288187545
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082433; cv=none; b=l1H28nseRPQ/pfDM0Vsy2DH5LkQhmr5/dDz60F79/gTWKisx4Vifu+64amlae80yLGfluYhlE1kNeJg/hm+UksRePkrfHji9TAIrrUzXnSSM5mvsQ3F5mBApShplku20F8Te+GSf/ze8oapKyxbwBL5biWcori84gnqF+I4+3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082433; c=relaxed/simple;
	bh=1HI01KPsTth/xQ0Khhkr8m1Jl0DrowaXQGUpZ0QM16s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ilkvfGmr7CySHtpofn3M+hLY5fimqxNeBjf89JxghCxG4MnYudb5mgsnhcfvGD0Ea/eag+cHh3mgfGgNV5BaGNrP03kr0GySAawMmC4XBGG1XYlr/oEPxVU4SsUGpXBR4Pq2ezyWF13BD18VWdXWy4FCpAvybvnQljp8KqS+1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9reJLfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46607C32781
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717082433;
	bh=1HI01KPsTth/xQ0Khhkr8m1Jl0DrowaXQGUpZ0QM16s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b9reJLfAkhesBmOtmevQl8uwkgprqrTBtmqazYoiEJ6vViVou0Fe01BBz84aRjZLn
	 VhagEdslcOyFmQDVnGQcii8bIaFsJrxw+ATRGoKAJe2ANHWDPJNBu9Oi00kcLPekjl
	 eWVTw/mTxmcp3ckgmb8V9RSuixYaQLvW6riO9G7X/0eV01+cO5ezZ8qdt9RumMDOdz
	 xhemuGURjYMJwUh/gyhUyvTx5/SoZ5rtMQihbJysxLTLcJonLjdpbCcnjqr9y9kJRl
	 JczV7A3QXeYUIcjS0v2KVdWXdIiT4JNwzxSYBS5DT+O+Bj/ekcgTDNvQKldiQcHNBS
	 M5oH+/GLQlg0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F111C53B7E; Thu, 30 May 2024 15:20:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 30 May 2024 15:20:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-lfdvfHuyiI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #12 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Did usbmon still show that the timed out bulk-in transfer received 512 byte=
s of
zeroes like earlier?

ffff9244ea669300 1311630835 S Bi:6:004:1 -115 512 <
ffff9244ea669300 1342568184 C Bi:6:004:1 -104 512 =3D 00000000 00000000 000=
00000
00000000 00000000 00000000 00000000 00000000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

