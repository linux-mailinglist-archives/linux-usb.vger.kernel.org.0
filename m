Return-Path: <linux-usb+bounces-3431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC17FC3F9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 20:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25DAA282B98
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 19:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E464F885;
	Tue, 28 Nov 2023 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8OGqtm6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799A1E4A7
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 19:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EB98C43391
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701198261;
	bh=M6HyDu8KLSH4xh6JjCdOzbqUNbQDhtq1XnEjVOs8bzA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b8OGqtm63Q9YOH5Xxw3dZHutPw+ZR62enEv18w6FqwCtp82EO0vbO5fGyLtaxZkKZ
	 o+nnOSB8CMIwVlg1erd4lIixaSRiyKV7H4PLX61mEUkvMv8dC2RiQqkVu/78BSIlK5
	 n0JP3x6/E0OwMhBQHccMhq+b1iqe1sxaVIvPdfdpmjfsRqpVBMJj5B/5iResQ8TEWn
	 xnVQWSw4j9TXLIr+BS0I63i/7ZN/FqBOQFmMdHpHKwHeq+Fv+dLr5FoBvAgksKcgD0
	 N5SeUD+D+H+8kve8a/m21e0g0nf1P4DtM9ud/fzS+X9h/hWzoNcKaah9+Z8MOdUSHD
	 Em2BQtVa87Z0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E55AC53BD2; Tue, 28 Nov 2023 19:04:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 28 Nov 2023 19:04:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-2C4Hb0GW1M@https.bugzilla.kernel.org/>
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

--- Comment #35 from Alan Stern (stern@rowland.harvard.edu) ---
So as most of the people subscribing to this bug have seen from the email
discussion, it looks like the bug ultimately lies in the alignment of kmall=
oc()
buffers and it probably will be fixed with a kernel patch.

Equally important, however, is the question of why the people experiencing =
this
problem turned on CONFIG_DMA_API_DEBUG in the first place.  That setting is
meant only for kernel testing and it drastically reduces performance.  Redh=
at
certainly should not enable it in any of their distribution kernels (and in
fact it is not set in my copy of Fedora 38).

Andrew, Ferry, any comments?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

