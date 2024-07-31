Return-Path: <linux-usb+bounces-12751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA24943661
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 21:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B81528444D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 19:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB5214831F;
	Wed, 31 Jul 2024 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QI5cPdmn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EEA75809
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454063; cv=none; b=PKELN+OZRcP2nh6Tdc2B9Jay4LFrBpHCgV/Xl/j1zy/kRM5I3Nh/Wk6rqfvu+B4xKmM+7l04qK2zOI6FMe0QvfvQz9yMGiEIdSqpIOCtPGvkGqc43AqfJpTIVclsFhDqjTQPWgm3tlIdR5j8AjL7OotTZ1bpaIyVG23759bEOSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454063; c=relaxed/simple;
	bh=q0NDv4GS4hcGpPAqMsH9OykoVoSbPD6mk9784FXZQp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lfYswapokF/eNy5Snuo/gRdrt3y97ElqtNSEH3LPoXQ7YB2nCv2bD+JHEUkPELORZZ9XimV3gUPRj86Su34X8QtewIvA8v5dpO+oS9AJV7WKieb9qY4GWj0jc9dgvtwgJRUXBjpn2ElMwB7lMOvfzD32C097lD/GozRJcUyENSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QI5cPdmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2746EC4AF0F
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722454063;
	bh=q0NDv4GS4hcGpPAqMsH9OykoVoSbPD6mk9784FXZQp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QI5cPdmnapO/RyYhfqqh+J38oKWAAwn8Hzx0y/WnJ5KC3HTC7DgxkXbPImPzZJPLz
	 tImMm3LfUNrb6VDmas9jeEwFH8fSMA7KQsoZ9iylxIWSY2DiewnGcge18TlCLZ8+Ep
	 PrJ+/MdlpADuBrVs4Kt6LjG/PQMuUWv+MuQ0j1SA3r+ZMjjEagav6QjHz2pMAihwWN
	 hgRtuPmTrXb2o2k2IC1UdretgIRMghXmoV2Rw8Y4s8VCWl5AZ6Sv/da0c4h55nqITE
	 mUuHIIZtf1MRzaAJx5i0aFLyvOFC12m7ZuTsruXVokxsbjZSP+BKnGXhU83Hx1B5JR
	 0vtF/QVvVJt2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10267C53B50; Wed, 31 Jul 2024 19:27:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 19:27:42 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219111-208809-crA0HkwwPe@https.bugzilla.kernel.org/>
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

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|stern@rowland.harvard.edu   |

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
Yes, the adapted diff looks okay.  Have you tried testing it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

