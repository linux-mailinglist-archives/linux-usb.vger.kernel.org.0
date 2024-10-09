Return-Path: <linux-usb+bounces-15933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC612996D7E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BA21C21712
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 14:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C2419CC34;
	Wed,  9 Oct 2024 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlQQsaVd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AB19C560
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483592; cv=none; b=SiNCA7HT5tP0G3ZoqVkBBHaBmk/oHA65MW1EkUkDDcdUe6lInyj0YFNYkf7YvEhlrLlZ9UHlDsKbfo5UQM62eOZs51OGZykp2gGleh6rHx9Ai4FXnvR2GlPEC9QbR/HcfOhggH0ZbyXXLstRTCZlvYARYKqQQCM+29l0c43ityU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483592; c=relaxed/simple;
	bh=c559ck0Dq9me4O9xKy92n6LzIP+BoNotoc6dAs/Gkl8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jdl+42RSApfP+CmaCnWesaDrMWf1Ifrm7ZNdBuQXWDyzobXho7pUyEIX0Gd5vz2FLEuIo4PFufeD5Yvi/dhEsmtEwNoOnx63TMP2IZg5ECCY2Gg1Lay0HEeShLstrXMZzoQY1BputczA9dbDR8Rv98NL7fbPqKNBymAtPBl2kOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlQQsaVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D76EBC4CECF
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483591;
	bh=c559ck0Dq9me4O9xKy92n6LzIP+BoNotoc6dAs/Gkl8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jlQQsaVd7GO/QLPVBb4ind1z8bw/CVDxfWsd9kFxei03rysPkatgwpKigbiRG9Z9p
	 6BEGImXLjlCogZN2lU/N5C+DpNsXWR+UeX3hp7lsOYDxEo/raRfTrFm9zNK6hKtJwh
	 N/qkj4oP5Q7ZdqP7jDw/lP2mBTEIprUB6h0hDx4N1McY/aft22XCTQwkghTdXYpinf
	 bxADHZbElXjNz3HGs7gVAp0gH8oapfPX9FjYz9usOQIEImDkwWJWIQ/K4MS1aMaOW9
	 Zr2FDFPvV04kS6SWUzrsWxT26ktmODpcbzAvWZ7wo4e8/iIIlWjW8L3pIt5PTJ4vih
	 +38d/BlzHM5gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C3DAFC53BC1; Wed,  9 Oct 2024 14:19:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 14:19:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
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
Message-ID: <bug-219362-208809-NFPdKtZ3Nb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
Now you're discussing issues involving power management.  These are not
appropriate for either the USB or the SCSI people; you should contact the
linux-pm@vger.kernel.org mailing list about these questions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

