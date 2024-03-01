Return-Path: <linux-usb+bounces-7395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9207C86E528
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CBA3B21F31
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B2970CAA;
	Fri,  1 Mar 2024 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFJJQdYp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0894F40BE3
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709310067; cv=none; b=qQh0xUcd7Q6jGo+U3btL/J9r3wcSG0rlikq2p1SusJjDsiuyPUlbRMrmRZ75eybVoK5+XWzPt/6yGtVn7lUPyoKLIpG6S0ReSIdmQV2GfDfnZPWTfIexfnlhH4yB/PL22RKnVKn6GlZUq4rt66UigGCHBJkAzrrM09I28TvwuJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709310067; c=relaxed/simple;
	bh=MM61CaN2YtOb9o/541i6UCq9yIQz2yEGV3fbih2X89E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g26tw2PWyc/VOJESLpgUq2R4TJpP8dexCcN4uAL0j/gGLU0at1YenzIvXbiqQf8RJHo2fopnYcIgqd2oLXlIoFqQsIfc8A1B0jcoRqF1M33F5ASm3rvfyuRNMvYHYPuMzKTwocBBQoJXR99//j+KYwvlDG46DCNan7wcy3L0A50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFJJQdYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8724FC43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709310066;
	bh=MM61CaN2YtOb9o/541i6UCq9yIQz2yEGV3fbih2X89E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FFJJQdYpntTD5uv3J3OYdjTZWZ2sEdrDokpSiArYGA3NpilogAMEUrKQ2Ar580IyD
	 gzMyP1pAmi1mK460tP2sWW3qYCf4F8B374mFJWRW39QhQvSnCCRHwGOUSKVRuL+lhj
	 0odO0YLT9ARBTw9R5RL02VkIm7Kw9fHcO5oZ7p0R6brMcKOIgT9cMDR2NkWVrwaHH+
	 6U/7nseoekQ1AS3PiYOqUN1ktop7URythyIaW8eroDdqNyw9vLL+5VzCNOi3ptAMLA
	 nzs1QdupqkImYXCsDvp6sHyEDSSUA87D3ScJQsInoFKVrJSnAEL8ly/UqeCeVWDvko
	 hmTSwyEITvCqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74A0EC53BD0; Fri,  1 Mar 2024 16:21:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 16:21:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218544-208809-cC0PBOCIQ9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #4 from Ian Malone (ibmalone@gmail.com) ---
Created attachment 305937
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305937&action=3Dedit
sys_kernel_debug_usb_devices_contents

/sys/kernel/debug/usb/devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

