Return-Path: <linux-usb+bounces-20641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46BBA35B03
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 11:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DAF7A1ABC
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 09:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD9F253B63;
	Fri, 14 Feb 2025 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8tduP8S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93312505C2
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527214; cv=none; b=TmaMIEDJGeWsIIWXrxmwEISJZ7cfeKsgxxN5cpvtw5gsAFYCcHlo5OLrT1KTmdkKAOMX/Jbch5pp2adqe7U3jeDWopkfx/f4KY2KG9j2G7d1U6o5oUvdd1s1iikf2rXB6+lP0ut1dHkO+0HwdZn1+tdZaJiClmKLAvzsq/4Zd3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527214; c=relaxed/simple;
	bh=114ZACBMSjbAfOhMUykI7YQPXOe5PWS/3W+Km+JJQLI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cI+RGV2u8x26GuLZstcCRUVNXr7kbKc7Fe4S1CLo0cYrIS8D4A2WhNhPoYr/EtkFg6mZjjoVcAKIdiD0ng8+aOsLo2kRaGe0ZT5quq6Y+dCcLZWt5ZOY5P7d0zjnQGFDmH8Y09aBSyywGtG74Ju8zGnil8KFBM0HTKDamQRg+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8tduP8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 199BDC4CED1
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739527214;
	bh=114ZACBMSjbAfOhMUykI7YQPXOe5PWS/3W+Km+JJQLI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J8tduP8SemPZxUIZhBgFe47pXwcYzHM76BZp1e/rGsfmQqp3n22edSKixPupdmCZf
	 Vpld/XXLNuSUtOXKPH8RoyTqpCpDDhLgxSaSwAiE2onbX80Vrl2dhuPrL3iIx9duLe
	 RPUVk3qYXVoageEKuhK2IkPzqjqo3+mLSiSmedTtzWpuJNzrQrn+bCxN2Ji9V6smmW
	 fByOcbVEjgNce3/+jDY1SZAscHNTsdEFXz7ngojUKXhCveRifbVwtVv8o9KNj4bMJB
	 XftrJSbwoweR3pcIVmYzBEfZ3HH9/2+E2hQVhSD7obkfaYy/gCv8JAqot/HcWZKMe5
	 +jYwr02S7CFRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 048F9C3279F; Fri, 14 Feb 2025 10:00:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Fri, 14 Feb 2025 10:00:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-KZlE8W49Ut@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #4 from Frederic Bezies (fredbezies@gmail.com) ---
Someone on this Archlinux forum thread -
https://bbs.archlinux.org/viewtopic.php?pid=3D2226102 - told me to try disa=
bling
UAS for the external SSD / HHD. But without luck, still getting the usb res=
et
error message.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

