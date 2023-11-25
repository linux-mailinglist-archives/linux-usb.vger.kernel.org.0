Return-Path: <linux-usb+bounces-3316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688897F8F6F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 22:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181E62813BE
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 21:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DD930F82;
	Sat, 25 Nov 2023 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGvKkYg8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C430673
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 21:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2A4CC433CC
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700947027;
	bh=d0IsOKjDEmf5bJ7kK13n3PhuMibNfdoev3hk2jZveug=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lGvKkYg8N0m2hG/mnEZCoGZmo42QR0/odmpjjgxZG6ejMIzZglP+IYWENdpQhkXei
	 k8Lo4z06FnSsNjhBnwjYUnuRmguFrwKpK1fEpDfydOH+4BVJhCYBfPkTodkVtS72Rl
	 Od5s8jSpuqF+XrAMDqKncmRBKR5eMrIcpoq1b5Q2LqSRVgfkSSEBC530lYH3AtGCg/
	 eAVUX7M71/pE7feYmHahUFbADtTbso6HJIXlTiSNO91ZmuFEXeAHtCcu51k0rzJrUw
	 5wC1KxL6enF4bkbRkNRbi2naWF+SZQhushUrvJpCnQvr6DDiTeAv2cBfRha/RuP+S6
	 RV+tQC9mZD7nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BE1DDC53BD3; Sat, 25 Nov 2023 21:17:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sat, 25 Nov 2023 21:17:07 +0000
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
Message-ID: <bug-215740-208809-6jElx1HqD4@https.bugzilla.kernel.org/>
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

--- Comment #33 from Alan Stern (stern@rowland.harvard.edu) ---
It should not be necessary to use dma_kmalloc_size_aligned().  These
allocations don't need any special alignment; they just need to be in diffe=
rent
cache lines on some architectures.  Isn't this what ARCH_DMA_MINALIGN and
ARCH_KMALLOC_MINALIGN are supposed to take care of (see include/linux/slab.=
h)?

I'll try doing a little more testing to find out why the issue does not sho=
w up
on my computer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

