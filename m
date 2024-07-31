Return-Path: <linux-usb+bounces-12734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4F94337D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 17:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C70E2865D3
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656031B581F;
	Wed, 31 Jul 2024 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIoQhhzk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01515A10B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440305; cv=none; b=Ly41PTvN3rlKLWdEwD0Z2sCF52XoO4I2Z5fVhiWCEZCjP80JA8CWVUFsmcOjE43PVgTGAeXC/1xM2+XaIIV+41S64uR7VLERmQl3nJ2zhFu4+bHlB6XzV6KoZ1ya038I4Rvz66+Nhd8ubeHTybnQDxrANrMEETMf5G5yZD8UUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440305; c=relaxed/simple;
	bh=Uj42r2Gx2NSuv4RpWzaHU5iAClojVvp46hg9J7YRDZc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0eUz7A+20HIV/l2nqdJloyHIGPcpz6Ep2ATC6BxuSbm9Uc56u5WOmCXhbbx2BZOAcMwqsYSLFS8j+NrirOHr8GU5+xxm926Sy7vpJklFQEcMcQ2HUteTfdtwk1hIG+xsrN7+0Sq7hprmkcoWeNMiyF48G+pZg12S/2PqsWYUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIoQhhzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D5DC116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722440304;
	bh=Uj42r2Gx2NSuv4RpWzaHU5iAClojVvp46hg9J7YRDZc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LIoQhhzkxFzkSyTu6Ddgw+H3w41xX6pVccqqp/G3H1QmtCUsp+DG7VdpYWdZ4xEGB
	 f6KvMd7elKN7kKrIjcMTXGOE5KcRNsJhQpM5W95fToCUsUUXO3dIu8t4a2PLxBeGzb
	 SJck7J5TD4Lc2bHfV+rxsdjX5MSgpTctnu/55m2GJUoRL1d/knQqItJ8H4HuHNhylS
	 6I5HbYSLzoHRsFIXggPiEyj8NnH0RG1djSXdg2NRA8Pp4g0+KTRX/BMbGV6DfUnWuK
	 01vESsGu+OvXOUR3WcPMLQ7y8JCXZtivMdvihSNwsvwUajBaqmoxf5+/2HzH5nW3Lk
	 16efFd+h0Ro2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C813C433E5; Wed, 31 Jul 2024 15:38:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 15:38:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-ZbuTcvtUNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #6 from CH (com+bugzilla-kernel@c-henry.fr) ---
Ah dear, yes, you're right=E2=80=A6 But there's no way to get it to work ou=
t of the box
without the old_scheme_first setting?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

