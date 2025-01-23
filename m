Return-Path: <linux-usb+bounces-19662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D2A1A209
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 11:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7661E188E417
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 10:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C9C20DD63;
	Thu, 23 Jan 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am4QTias"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073DA20CCD6
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628987; cv=none; b=J3gUfo39mixVf1STBZHIRH3f3zkvRbtgsTfv4gw7UKNH9mafHnfGivHrsn1L7Z8PP8QEJyewYaDKIwfOmVd3w+Gugbxlsb8q0ZTgWOmSBlbQGYeWVZ8ZIR+PynG3U1gjAxZehaJ0Rxdu3eMubDL1UZx6anKYfgkeWf3YxA2PXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628987; c=relaxed/simple;
	bh=9r03rLtRcvQs0r+B3acl2UJc0B9idl+1MUdqp3xLSqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lK2w16CYzoAyHfzdsPRzUyyjRn9w8IyV/ZL9NJIzD6uJgpJSGfOfHOvFk/5CJjKsTDo090ZLaJi+HgPoVCiG4Gj/GNi1VkmX9EEP8GOOF9CG72ywTVeKztVoLV5UzEC8P1aSoLs0bHG3rMQSqSHWG18ARKBE1nmFYCqD/su8OCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am4QTias; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 702B5C4CEDF
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 10:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737628986;
	bh=9r03rLtRcvQs0r+B3acl2UJc0B9idl+1MUdqp3xLSqs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Am4QTiask6beIkCr4QOTqLlZEPnXzj+VmHoP55XKzbe4YfqlafIZ47cWn03zJkcyy
	 6ylnV8HDGfBaqxPQmK+StkOoFyRYCiIc5FGLDzERHnN2rjAbz1tZWjB1DddDvj1ZUa
	 Cr2p+x4bRY8hSWMoGWrEatHbYUyltZk+7GryVkGOouqzZi79bD8eJFB4ogR3Ghxu10
	 /qZihzopqmP+FaEJ1iaaH5STTUBnkMpnF164/tHXh8nOoAL2/s6ompXLY40WtfFgpb
	 /cm6nwyBI9elWdQd8T/d4VHpF/ueAzCH4iWrPEPU7TgJLA0GFb7xjB/vzmafo+4MuR
	 tW4TR6EPZgmDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 61536C3279F; Thu, 23 Jan 2025 10:43:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Thu, 23 Jan 2025 10:43:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dominik@greysector.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-T2izcCif7y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #6 from Dominik Mierzejewski (dominik@greysector.net) ---
This was reported downstream in Fedora as well:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2323584 .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

