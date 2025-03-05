Return-Path: <linux-usb+bounces-21393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BF9A50032
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 14:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87380189E51A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 13:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31A248871;
	Wed,  5 Mar 2025 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxuSfu/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCE2451C3
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180303; cv=none; b=NEZw9BpUbe4B1Lpsa6Ol/YAoFkF/nM0lJjSdmGiGm1Kw/yDIgc49DA+jRgA4WtrNHXnk2Uy026sDHjBUTMVgPH0ZbLJAy/AjyaMIrRrM5OFdFBS2nH1kmYH7RWg7CNUm5a9Z0nkqM54691jo2SOxa/eKznpI1hPPIKft9ctsFM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180303; c=relaxed/simple;
	bh=HH6FBNg2DvexlzmCBhlwEqSZk86Wx2Q8fJhZSGfhWiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWUpNZShxZgMR/okS77jAY3m4yxNbGyc/be2pL7P9TBrAjZeOfsDMFJi8uZ9NqOPZ4aPqBPUxzspElp2VyYFL64rY75970ZC1bBApBnlNHsnRMYDOAqIUEY9K744eRq3DWpWMn0elPoNpjms5bSt5KzCjPeFWBj0e44oBjKT1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxuSfu/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78B20C4CEE2
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741180302;
	bh=HH6FBNg2DvexlzmCBhlwEqSZk86Wx2Q8fJhZSGfhWiI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XxuSfu/M0IxXdUvGI38gg6GdMH5S0xZw3x9iYswsMIwOjgHo8Y2JFn6QkS6IYszXN
	 fBT9S5bDYaOmalj53mhtDPdE3m394+7URDxn8mT01sFLlieWSd4w1OiF8a8Ub1vQcL
	 X49FhzkE/WwzpI5nM7LYdPB05lTI4iiiBzEKi36DeDOCD+C9LfnvcSWvii350Ga6he
	 W35St5Np5ueFx2uT1ZHxqLNjPB9nDqjzqlwK0nN8qmo6/6erj6TeqXcxKEtOR/PDZV
	 AdhyEI0J2tioeBaf56jN9qjRJ5UIGWVyFZGL8euVEin6LQJUX3Svnhdk7NAbdIUNhq
	 K+QAOnSTkTmTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67484C41612; Wed,  5 Mar 2025 13:11:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 13:11:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219748-208809-JBeefXRvYQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307740|0                           |1
        is obsolete|                            |

--- Comment #24 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 307772
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307772&action=3Dedit
Scan downstream retimers after the router has been enumerated v2

Can you still try the attached patch too? I missed two cases where we also =
want
to scan the retimers so did that change there. It should not affect your ca=
se
but better to check. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

