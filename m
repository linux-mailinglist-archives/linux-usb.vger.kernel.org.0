Return-Path: <linux-usb+bounces-21396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D239DA50244
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 15:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4133B4238
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 14:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F3C24BC17;
	Wed,  5 Mar 2025 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AunEmELJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18323FB31
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185260; cv=none; b=Mf0P0bqihapGcn4lMntfnA7z3vCDDPQlXpgK2xIlThNY3Dxbu1iQOOPa1bnNPvNx8cXJMxDGnjedSNSUGpLJ2Lt0yvFdyDM8ETKlXfs2BF+zPb6xKSJ2gY/JWhwW/NRFtYrMgclQf/VkBSMZa8Mub0+JXXzvGnPa9zbWwkIVJk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185260; c=relaxed/simple;
	bh=lMqZGrrM7Ygih2aalQQiVJmm8qLOWdJFkHa+w2RbMtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSp7R1dt3rMPs0KdibOXYhKcAbkqJuSNsmm2cyT2xDAzW96ng7S1eWX3gTfDaUY1MgvWfsi8Q7m7zWtohl9sL89J5j8R/ZKfRBMMQ+u0XA8uNjlJUz9lHU6S9d/VME8+gGyDqUUYXrTtzMJ77JuvvldNYQBUZ75QqASREm0q6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AunEmELJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DF15C4CEE9
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741185259;
	bh=lMqZGrrM7Ygih2aalQQiVJmm8qLOWdJFkHa+w2RbMtc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AunEmELJ8jYHdZ16ckUONI8UPfkdjUqmgtabDpakbBD/z/FACRSjSxHi2ddCjNVue
	 poar7Bped2rpbu0VbWV03xHwx8+V0FjFziMjb4CIZiZSMlumWX6zJgH8g2t6kyidDh
	 cDy75o4eP9ONEJzjFrSNbx1BwxM66b/8wH6zcd6fP1/GEG4AR7QQfmDC0txAsgt1wF
	 OKrjBNTUInSCcjxSjkWQQ4pxKe1+4SEqHSqCvr/dR9cyf0yN1X7rKl3y9goySPr+Ua
	 Bc3R+Hj5uPxuW/rnywFkVs6FWv5g6/Dt1yVIx01zzYVKOmjghFGaRZVttzLGxq+nel
	 hNxjfu1ZBTnzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C9C2C433E1; Wed,  5 Mar 2025 14:34:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 14:34:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-MYOO6VwVpw@https.bugzilla.kernel.org/>
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

--- Comment #25 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Comment on attachment 307772
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307772
Scan downstream retimers after the router has been enumerated v2

That patch looks good to me Mika.  Feel free to add:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Also since Sean mentions this helps a different issue on his Pluggable dock=
 (no
EDID read) I think you can also add:

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3050

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

