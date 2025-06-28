Return-Path: <linux-usb+bounces-25231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F967AEC958
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 19:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9172189B721
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 17:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BC6264A9D;
	Sat, 28 Jun 2025 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSApTcP6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1347248F47
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751131584; cv=none; b=laIr00k4ghWn1PKhPx0DIK0JLFj3oXTOv7I+inluyMor1kSVC2HokVYQNhTxsZ9LGOniT5H6eoYdggb2wtahchGSD8ZlOSeRHx8Wj3Xg0nKV2vTpqfsG7O3hLoXBM3wHf83uLZuZ2+zRvR7DJxeHt1sFGy57tsT8l8NJu6EWiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751131584; c=relaxed/simple;
	bh=+9eacpmBT5MbyuxgeWf8xNIbvrx8mlx6TZ58qUWy4zY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZW938uGN/vj1jMNpKgcWBv0fIcuExlfBKW6nMivv/WdjsU1RAc4fdQNfwvJjZb6XUxll9EfdnHXbFZerZL1X54vpP3uAYwqPAWUEE9KA9QmHlE8r8TtPss5A8VnH6HikKE4CQMY5iO+zeEf1pYa/gyYDILkHdcYtiDkHeGEBwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSApTcP6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59A41C4CEED
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131583;
	bh=+9eacpmBT5MbyuxgeWf8xNIbvrx8mlx6TZ58qUWy4zY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XSApTcP6jF78jiS4ZXVqgfXwi6P+2Nj7x9lIxa/tJoJIzJ9mQQLqcJ5Yc3dgYqlFl
	 Vj3k8POE5t/T/snD2fTsBMsRH32e2drvv+QtWBSFddU8PoMSzpSX6cWo3ovUHHmL4I
	 lxjFp1LSk6ayDXHqej+XxXOn76xkMQC//HI+3tbs+KMxntx1KaS+DXYnDO0vd5F5+G
	 dX67mxav5Z3QxAH1/+YeqduQCWf7cuKIgErkCGDDsjo0KMDggHrZ+5KFTDst4Nw9Oz
	 kqmlUufeiGuO25yiMNH177XcoB/QVMwx5ZTsqmNjUXR/EYlYuEt4a9k8G81Nc4Wr99
	 9exNMk6NN98Iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42EE6C433E1; Sat, 28 Jun 2025 17:26:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Sat, 28 Jun 2025 17:26:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-92BXv5U3kD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #14 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Could you please explain to me what the reported result means? Was there an
error on my end or does it mean that there is something wrong in the USB co=
de
which is hard to debug further?

I came up with a less efficient memset_64.S implementation that does not un=
veil
this issue, whatever it is.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

