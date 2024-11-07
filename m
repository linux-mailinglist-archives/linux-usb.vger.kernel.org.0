Return-Path: <linux-usb+bounces-17331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B79C0D23
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 18:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3468D1C22661
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 17:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA31A19067A;
	Thu,  7 Nov 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTAUPkwI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED063C
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731001536; cv=none; b=PhAzL1ZUUt4/Rqr3z6c1Q/HMW69PYnkoZLFow8q5Fb6SrD15LUhHbQIFu2yFPllckAkpf/5Stl6snhMGV2XXopyTw+4uzALCe0sYlycQs3v53EWFvZLClCHT+j06bZe1TbDFOVgcpKAwvCdfcD8+2ie9+PBM5r5HUK2TTxEJUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731001536; c=relaxed/simple;
	bh=wWjrZ2YJhX6yCoX5aKjkJOXDv4ZEVeVri+WUJCOBxjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RCEIE7NfFRRhJpcdN84C2caRyeHq1TuN4VWGH5ukE9ysf+17PitS8enyn6vriKrOcOTNw32uuGoK+PUibxet0EkDW6LjEkQBVTJdq5ZI53Nebqo2jBWogoBYFF8bKmXDNCymRBS8M7o082YZLL5d4u6VuzqK1a4qegahPEI+KDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTAUPkwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6FA6C4CECC
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731001535;
	bh=wWjrZ2YJhX6yCoX5aKjkJOXDv4ZEVeVri+WUJCOBxjE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CTAUPkwIs/m06UkVCgNIDkQ3ExUtdf2vYq+TRXix1/EqE0CnzS66k0RJPxSk79YLZ
	 SkhpAsrRw6xOZbCnmL1D1SOtQzpjBd5LRy+wPsuwa0xc9vyiacl0OF74OIId4pLP9/
	 hxk2SNZ6/sjOZfFY0cjsmgIh+oGavu7oO7sfJNbVxSFUzAGyOG+mOFdXpxTgqey9Kx
	 b9sEX/VKjZcKkDnJOQAYJDE+8IeK05oe2fnhlSEnSSZ01a2osYojrSEnqHdVZF9/dT
	 5C/CTkmvGT4YOm9JQUaPahH+wb+r87HOoGq+TtsGMtAPNfsiUxp3yF3cEvDYfdiM+q
	 AKbsdEyarnsTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B60C5C53BC2; Thu,  7 Nov 2024 17:45:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Thu, 07 Nov 2024 17:45:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-cXpQLYr2CD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #5 from Eduard Kachur (glite60@gmail.com) ---
Just in case I also ordered ADT-UT3G and will keep you in touch when I will=
 be
able to verify errors and crashes with it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

