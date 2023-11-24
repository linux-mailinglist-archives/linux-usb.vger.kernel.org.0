Return-Path: <linux-usb+bounces-3301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881547F783C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FEC5B2100E
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537713308C;
	Fri, 24 Nov 2023 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Apo4IKoZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD77D33077
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F3F3C433CD
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700841039;
	bh=Atjpf7PbSXCnxaMZxtpMQwok4N99LY8RvOFu4HjgPhk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Apo4IKoZqzFOqzqYitD5P2t1lCASoFUAt/w6XjQZroUD/HhYyzo3gJFpm5ihAPbj0
	 eWIVHDBhRCUpTZ6MGjGLd3d4wlVZvqA4SYmbi1qsd5lPcAzUUtj4pr5tM3RkK9Y1px
	 D9dn+yL+JjrY6G7NFJCIN32evSjC/FIjGJwYFDrjSFpA4TaLwUg02bHjQlLsB94pwL
	 2QT0jC3YxZ3yA8pTjtMyfrFKVAC0muZ9PmPZnmbBtnmPqgemgFHdNUISCVlVy1OA2K
	 9KZVm5nOpbBZpfJNZrKc4j9b0yGx5t2FvCE2RTELmfbAOMMd+28n2sm6TRCbE5OpLi
	 As14q3N34TU7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79AA0C53BCD; Fri, 24 Nov 2023 15:50:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 15:50:39 +0000
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
Message-ID: <bug-215740-208809-U448wdxe4D@https.bugzilla.kernel.org/>
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

--- Comment #26 from Alan Stern (stern@rowland.harvard.edu) ---
"u8 (*buffer)[8]" means that buffer is a pointer to an array of 8 u8's, NOT=
 an
array of 8 pointers to u8.  The latter would be written as "u8 *(buffer[8])=
" or
"u8 *buffer[8]".  C's syntax is notoriously difficult to understand when
talking about arrays of pointers and pointers to arrays; you have to parse =
the
declaration from the inside out and you may need to know that postfix "[]" =
has
higher binding precedence than prefix "*".

1 and 4 don't map to anything; they are the _lengths_ of the DMA mappings.=
=20
That is, the first mapping is 1 byte long and the second mapping is 4 bytes
long: These are lengths in bytes, not in longs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

