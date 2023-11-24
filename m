Return-Path: <linux-usb+bounces-3310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 994067F8559
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 22:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2F1D1F2163E
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 21:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4D23A8D9;
	Fri, 24 Nov 2023 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAdlghoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB328DC3
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 21:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18BDCC433CC
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700859931;
	bh=g8ix+EJu/utpXPMvHSf6B2mDQfQVhJ8fD7dV9owKbeE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QAdlghoYlx5g1xmQJnGrq0NsehtxxlarYAUJIT4RTzrII3crlX55HNaZsXLxwiraK
	 Hja1cDm6zuI8I30ER5OJ+wbgsXbarfL+6eqYa58dAyd1C+rivvQmcMqxjPxLqeztQJ
	 QyU+o7TBLPJ8V+Z7pPr9E685zz6iMT7x6Guxs8nR8BVc0qvZC+zyX1ZedCkbx2Z4hm
	 UofpfWmmXKFIroJf+Ldh66FWPxJOH32sEiWIFdFjhT2kPl+skkXRzLZSwy5GNBJQX6
	 dHoILknsP7JiVMkfpUddXDxVwDcFH/58XfeDQr5PeVtemjrJvqg9YJOEvt5kCMBJyc
	 +MyiagGtghKIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 077AFC53BC6; Fri, 24 Nov 2023 21:05:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 21:05:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-xCagpOMmCj@https.bugzilla.kernel.org/>
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

--- Comment #29 from Ferry Toth (ferry.toth@elsinga.info) ---
(In reply to Andy Shevchenko from comment #25)
> status, it's a pointer and again 4/8 bytes. I believe we are talking about
> x86_64 case, so I fail to see how 1 and 4 map to the struct usb_hub field=
s.

Yes. But I just checked and the same happens with i686 kernel (on same
platform).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

