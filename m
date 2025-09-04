Return-Path: <linux-usb+bounces-27521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63681B42EAB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 03:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC78167531
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 01:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E496433C8;
	Thu,  4 Sep 2025 01:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDsKct2+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E46FC5
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 01:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756947638; cv=none; b=hr7ts5wSZyGw8FQ3YFUSaYQMs87a0rM7JWVaZpXUCYzUpCH5w6BLMfLFpAD/Bn/TN0Z2oWXHxMXzijQz7cHFVPc/Z3OkzbynR2oo37qXzRTiBpsXX9BRvUQjSxwiEVPx5UQo4TPH1Pg2DEjEsz2v8g9MLZ0emLGVVw59CvcfbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756947638; c=relaxed/simple;
	bh=nYKM2GKGmHoY18UqsK511vclDS2oiR1Xx+/s7Oq21l8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zy7E1Odmbzme2+KAzNiFFnjQClL11hdmMJjm5KZSxOXyuHzjx+H8h6dnDxxTogFCTSqQDPYoSYkUeelaP9B7olztPOiWP5pFVotzO9Lg5cXea7N2nEo4cM9ms6XsoswW0QP0WJv8xOB2MlPyk4ZlmiOoKnhqUNA0Pix4+gYqVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDsKct2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A93AC4CEF5
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 01:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756947637;
	bh=nYKM2GKGmHoY18UqsK511vclDS2oiR1Xx+/s7Oq21l8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CDsKct2+ovIiqpyUQ1H9iWuLLRksH3/5YY7FTm66Gg65dPhSweU3+53EMmX12ng1b
	 X0fE4nxKQR6+/AF6qFVGtk2DqOODY8j1RUMEEz+NZ/Mf9bIuyrLDF1iQ/Wc5WQ5AYo
	 RTCbyTmTQePOhf+vwujJ7CKWo9MM7tLZPAdMzkv2t4849lU2y/PxuXJE4QWvhSXjvk
	 3x9NdkQcjHG9WwoqoqZYjEzbjRVG8Uy2zZ+qw03mpYYqzozJbVkMVBm2BFB9MEHbiW
	 xQrrfFYEY8g6pgfP1YknltK97WOKzGBBvIiyYgJTOlBMXDENw+4T+yvRKAEHoQBeob
	 qcxSOlniOPPdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83FE1C4160E; Thu,  4 Sep 2025 01:00:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 01:00:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-M1ECqh1VNH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #35 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308616
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308616&action=3Dedit
as promised usbmon trace with usbcore reset but no usbcore disconnect/recon=
nect

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

