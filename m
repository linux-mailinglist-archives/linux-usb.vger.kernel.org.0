Return-Path: <linux-usb+bounces-3288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 162887F736C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 13:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A91B21388
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AB723763;
	Fri, 24 Nov 2023 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsJpVp9A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2C1EB5C
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 12:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DEB4C4339A
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700827664;
	bh=F5jVgXC7s7pmV8EBpvPsKMiyzFn3oFugf3bsurHO7Fw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bsJpVp9AN6zvZMdFMAtCW8zdpeWsI+fqoCU3VkZ17jfgglbDeimSxSwFPXuW/yh2a
	 251hGrVk8lkiwhwgBCq3gl08iNFDH3njzl2exmrVcwxBNRq5/VAra4Z/Vo5cDZnuvR
	 GtCNJ5gc6E1epxLjZH8kdrM71f8lBbI8BSjHhSxjOOal/KW5yNMi+u3CCiWlFO64L4
	 BJtBHnZu9A7ZXkMAIpgSnsvgVdLdDgi4NqF6ICxScbmw8eHV6ybMaLDtmqrFa+OCeZ
	 gsW7cU8cByAVcJ8jv3W61Y2CtT0jbb1sGzofXiQ5oKrsrTEnAxTxBNVdSmKTZuX5wK
	 b8DJVoh+JHVfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3875CC53BCD; Fri, 24 Nov 2023 12:07:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 12:07:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-bt0iJwd5sr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #22 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Also there is dma_kmalloc_size_aligned() which might help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

