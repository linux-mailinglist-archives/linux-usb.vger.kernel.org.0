Return-Path: <linux-usb+bounces-13138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2994936D
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 16:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEF91F25178
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 14:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00C1201264;
	Tue,  6 Aug 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/tiBK7T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708A20012C
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955267; cv=none; b=jnGbURyqCYqBd0hLsytkKPYoBDz+f73Sk+SH36Hi1RQLFvdhtbIFyEs5W7quBkfYIqYQ8MY3ruJgIBGk3CtL9b3prRM+RL7xf/bCvdPMfDoBT2yqzob9VIrPnVey+eGdbxAWzpjNL8Qtx0qHsyt5dOE3DH/dFOCH7PpJb90t2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955267; c=relaxed/simple;
	bh=vi6gKGVEJT8tBLg6amBxzIK45RQuUSxhYHHpxbaRd2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c+rMxQV17irgsqZ5ytKUk4lbeGNoXve7v4NV5vSufuGfP/SI3I46TPkeY3bzcXiFDstvRepW+w3o9/D4d7Q7rDlBSGKgcwiPPiKyL508Vlj4xJcXNXxYZIuw6hvt208tH727NfRcpVQg7hOD3xQYEsM3Rst56rh+jhYYLXFM3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/tiBK7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A516C4AF0D
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722955267;
	bh=vi6gKGVEJT8tBLg6amBxzIK45RQuUSxhYHHpxbaRd2w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J/tiBK7T/mXpPFg+sLVr1nl0E15kf7fcPbT66tahpxwfA75kKJScOaHit4C0nrLVs
	 TlqNRWfWhaWg1rW+GPChYMBENvAdffm0IImhg/w+Q8rJfCSRManpH2mSNuo1DaSw7v
	 M1QvG4WtaVwYZFlkbhpqPoRn55ZBPb+HKDN8iBlb/XosfX/2rTWh2ULAPqjeiu/aej
	 wQBeL8QeS/8YuBkfW+7GHZU3NzelqfWrpXToKbQRx8Korb1RqrBoKDR7xR6nYkXDGq
	 iSQpyQXxMnruO6C7AYQ6NE6Taa0tYJjax1KkRraFMQGXMkDd/24rVTcTLm6a0gfzRE
	 9Q4LrVThYhftg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0497AC53B73; Tue,  6 Aug 2024 14:41:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 06 Aug 2024 14:41:06 +0000
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
Message-ID: <bug-219111-208809-zuLiOu55UY@https.bugzilla.kernel.org/>
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

--- Comment #28 from Alan Stern (stern@rowland.harvard.edu) ---
As I understand it, each audio channel gets transported over its own USB
endpoint.  (This is true for both mono channels and stereo channels.)  So t=
wo
stereo-in channels require two endpoints, and two stereo-out channels would
require an additional two endpoints.  Similarly, four in channels would req=
uire
four endpoints.

Maybe my understanding is wrong; I'll have to read through the USB Audio Cl=
ass
specification to make sure.

The usbmon trace and the Wireshark log you attached both mention only two
endpoints.

Can you get a Wireshark trace showing what happens when you transmit or rec=
eive
data over two in channels and two out channels (so using four endpoints) al=
l at
the same time?

Also, can you attach a copy of the "lsusb -v" output for the device when it=
 is
attached with old_scheme_first set to Y?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

