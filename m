Return-Path: <linux-usb+bounces-2912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 109517ED93E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 03:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8E8280F4B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 02:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA1E17D3;
	Thu, 16 Nov 2023 02:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrqIUBzs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B77E
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 02:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0A1BC433C8
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700101161;
	bh=nmhfpayoApZ6bOxw1xdG4Ye3nx31f4//YSB1OAy8878=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RrqIUBzsKu7U/aZwR1AVxod3yTx/MTeufheVi6BAQ0kLev/oCDAmPeTtfkfeh7xqq
	 5mopKGo6cbSFcjnL7Mam9U/MtVhY+BdqgJVybzB4q8wVsXtv3pOMUrh/2Gmpk2e2aW
	 q/Q7KLSf+UR7Fw93XMpAHGQS26S5ki8HNO+7luk9UE/nYOgjSSFyF1dBLWyxMw6+45
	 THVtcDpm+CufRD2XpUG0WrMSSxcCX0HAEroYPwfYm6ZpwNZPFU0ZIEnWXcajj35dW0
	 fczbvohJbciFEELruQrn8bUFFFuX+KmSmZHSJ6YSQ75eto0zcpfsB7FScdPpwQGxlG
	 chxOuZyQFIUFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D9AE5C53BC6; Thu, 16 Nov 2023 02:19:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 16 Nov 2023 02:19:20 +0000
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
Message-ID: <bug-215740-208809-l7ZKQVvTXI@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
Those two stack traces are essentially the same as the first one reported.=
=20
They all contain the following key sequence of function calls:

  dma_map_page_attrs
  usb_hcd_map_urb_for_dma
  usb_hcd_submit_urb
  usb_start_wait_urb
  usb_control_msg
  hub_ext_port_status
  hub_event
  process_one_work

It doesn't look like they add anything new.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

