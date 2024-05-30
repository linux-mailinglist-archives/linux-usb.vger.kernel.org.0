Return-Path: <linux-usb+bounces-10699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C768D5206
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 20:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0940B1F239E5
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 18:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD4A537F1;
	Thu, 30 May 2024 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+QEGeqA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7B2C683
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717095353; cv=none; b=IngIWPt5bdUJRhlTU+moAqnN1x+Zf9JiA31Y/gVzsP7tdgWyElZadN6nnlFDpwMFYfXRc7hCDav7vF5H2PdWcDdlQhzhB/YBzsrU69/qoTP1Yb0NzpfDtVeUzmTg7V8OI5nCqeXUk1XRQzMn5YUVaU7xgUl/FVbJcpUfsmba86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717095353; c=relaxed/simple;
	bh=B2sAKkqB62LzYUYBz+n7SEXmign2oCVIij6H3kAyqac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AcJwfEfGgYtvQ/ZnWjmuLeadTJC/l+7q5LE3FkMW1aJHvroS1CI+za3msHkcrQlyop4cke37vbu+6Xl94gSdQXtZgiTMT4+CWuLyp4iSptwpJLsBumBANSVhc9BC/0/RzLigiTq1k4ziyBEPisFiAgxVBMma9TvaX5zUXnWRKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+QEGeqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EE40C32789
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717095353;
	bh=B2sAKkqB62LzYUYBz+n7SEXmign2oCVIij6H3kAyqac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z+QEGeqA/0dmuGHg8m5svz602nPqtzAIVKA+yKgmujd9x4ZCr9JPRRaCjkmX4FLqj
	 YnhvRWezrTxF/YFGyW+CrExev+zOZPrXwEt4677P4K44A6CspIFM40tGMnOoN1iwZl
	 WRNdLa3HsIdFUG2oSAKGmjLG93hl8BbvjVslPPuB+Qo8njH0/SaJZgQq6pDZ1Gp5tQ
	 MlQlOlsIj6Yh3yMSfOazWsVvw5IJAeY0t4JKSSzgvkhtB9EzoC/LnW425PZjZxCXf4
	 E2T+sahDl493SxnQg4/74eZ/MdvHinad4G6zO8yHjTtEFgrHX1Ith80+BFSvdIV9l+
	 I6FcGdDtryBvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F043C433E5; Thu, 30 May 2024 18:55:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 30 May 2024 18:55:53 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-BwZNWmeN5j@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Here's the relevant part of the usbmon trace:

ffff97af45927780 378815216 S Bo:5:004:2 -115 31 =3D 55534243 08000000 00020=
000
80000a28 00000000 00000001 0000000 000000
ffff97af45927780 378815233 C Bo:5:004:2 0 31 >
ffff97af4255c900 378815246 S Bi:5:004:1 -115 512 <
ffff97af4255c900 410624206 C Bi:5:004:1 -104 0

There's still a timeout and cancellation, but at least now the number of by=
tes
transferred is reported as 0 and not 512.  So the patch did fix this bug, b=
ut
it didn't prevent the main problem from occurring.

It looks like the main difference between the working and non-working kerne=
ls
is that the non-working one issues a READ(10) command (added by Martin
Petersen's commit) whereas the working one uses only READ(16) commands.  I'=
ll
ask Martin about updating his commit to change this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

