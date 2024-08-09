Return-Path: <linux-usb+bounces-13277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024994D1C5
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 16:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E1431C21069
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9B3195F22;
	Fri,  9 Aug 2024 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpCJKrDD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC81957FF
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723212367; cv=none; b=hE/EixN8j6OgwBxaqTQlfBrjqnLqlPQvuRePh3Ih8j4S/NT/Jbs3RbYik8LOw5haivk/z8vhlG/+Kre+yK61I0lHZUG02+E2rej8U5V+2fChdyrWlrOL+GnoUC8EYOEEgm0pCHrbebz6WbPNtf3meltMxMfLowNl0tx7bMEUBKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723212367; c=relaxed/simple;
	bh=xazGWGEhh894Lss/3QrrOLhLV/VSlAcWooyyYWuJN/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHLuKegYtz4ed1ZPgEKHbKW3XuaCB1p3QxPLIODcOMrzmse2Kd0vSDcea0JU3iB+GGJq8NjR3oOoYGqXkJPYcsUCWEeXXhG+wzg1l20MJyJwFFp1fvdJBheI95dVTvsoxBOdN9b/3p4Q6BM4qK7gYmCgVtcaW421hR2CHvTFZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpCJKrDD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EA4AC32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723212367;
	bh=xazGWGEhh894Lss/3QrrOLhLV/VSlAcWooyyYWuJN/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jpCJKrDDalIj3hO46KEQSFUAooO2xvPQUYjw3PFlOgZEIPXvwQR7TiVHHjEBUAcJq
	 m16qMDHja2xIuSbov15Uw6RnoN1dY2x6XTbhCC2cqi0tB9uyi+VQVtI9wg5UFcBqqO
	 AxdKCM6cGgh2Y1pKeZYbWS3REuKYdNLdaEKdWv+RJmawtHmpjW6CCmYj/pStbMPFdU
	 e393X+wlXiGaaRq0+8VWHJJOtf9fMKLMbNrfIl26R+rNCc/XvxSSKQxm4/njNo6Sca
	 5JAwzUj8rVS3VueehzYHlh5dvHJEItiPMQT/y4IQGS6cTYEZ2adFSDjpBoYgx9XGhZ
	 HCIAaKg7pvrEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1055EC433E5; Fri,  9 Aug 2024 14:06:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 14:06:06 +0000
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
Message-ID: <bug-219111-208809-MzA8Uw9oQS@https.bugzilla.kernel.org/>
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

--- Comment #45 from Alan Stern (stern@rowland.harvard.edu) ---
It's a little unfair to say that the kernel is unable to discover all the
configurations.  It's more accurate to say that the device tells the kernel
there is only one configuration.

Yes, the kernel tries both initialization schemes if necessary, changing fr=
om
one scheme to the other if the first scheme doesn't work.  old_scheme_first
merely determines which scheme gets tried first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

