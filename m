Return-Path: <linux-usb+bounces-27497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50256B42703
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 18:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD563AC76C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 16:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36FF2F6560;
	Wed,  3 Sep 2025 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yyt1CPcO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42C63CF
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917374; cv=none; b=cUhSkicFaVD2peVioWf16iYWAnwjyi61z+9EQBriOWAfxAiEuOIR3XGT+69ZP9in3oo9Wcd2ZcbF54muoPlHmhNNotbcrguySZVDZCFSCvxfZgtsvi3xq3kVBMJvXahReiqKFrGrPAfhx8StjrzgQEaG+YMYA0OEjkR/ETzuxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917374; c=relaxed/simple;
	bh=4Z3ua2XpGDGcEIcpdlKKWdLsz+NPEjIMU//17A55WhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XxsHitRNnhkigOmGmIwWhWCMvTcV0FJ+TBzoL2SDeBO1ZX1DjITTbWN46lmwqSCuN0TwePUW3e07e1gg5l93Dmz/IWTCZFAiXPMTI/WHPrJIpX+6OCniMPvQC0PNJb/0QDzVbC2i/95i1HddGQ8XZJTh5/2Tt7gXASUJpdjhBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yyt1CPcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1131C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917373;
	bh=4Z3ua2XpGDGcEIcpdlKKWdLsz+NPEjIMU//17A55WhY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yyt1CPcO+yVkGT2x+WPtyUo0b6ey7a4eSgq6uzTdaURl6oPQXI8Vt446267/ZJkmH
	 oV6QlDjCeLrOf9ZlICKjQfVdSNEYdaBx2FYEttHJoQsX1/YXWhyNL+85WOtpXuQoNq
	 RHxV34Zq+JT0Jw7vGoFMKZW0NdnjtCucud0bWGLMO7zt7HnC2Akyn3jY+rZpANzMw6
	 CVCy4TEqTj+mMw6p6g4u9PPoBwdhtH7lrko6vSRIOFvxfkMXAwBiVQ6anOHOIZHGLV
	 8RLxLzmvz9pUGTj5w9IY3Ki6btmuaPhShbuc5dCthS7wO+A8RP3omPFECM3hG/WV+N
	 pBcYUh0fJVA6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE993C4160E; Wed,  3 Sep 2025 16:36:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 16:36:13 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-jruSPIEQQX@https.bugzilla.kernel.org/>
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

--- Comment #26 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Perhaps I should further explain another point. On the Samsung machine, when
the disconnect/reconnect does not happen, which is most of the time, the de=
vice
continues to function properly. Further, since the device number does not
change, upstream actors continue to function without knowledge of resets and
what not occurring down lower in the stack, so the associated filesystem do=
es
not have to be remounted and any userland applications with open file handl=
es
for the device do not have to be restarted. This situation where the
disconnect/reconnect does not happen could be viewed as a success of the
current usb_persist mechanism. What would be nice would be to extend the
usb_persist mechanism so that the connection could be persisted across pseu=
do
disconnect/reconnect.

I think it would be a good idea to find out if a delay of some sort would h=
ave
some utility against the problem on either or both of these machines. If
someone would post and/or email me a code snippet that accomplishes such a
delay and suggest where to place such a snippet, I have source build trees =
on
both of these machines and could relatively easily test. A patch would also=
 do
but since the delay may need to be moved around to find the right location,=
 we
may as well start with the most portable delay code possible. I don't have =
much
experience with linux kernel code but I do have significant software
experience, including Microsoft Windows driver experience.

I also think it may be useful to say again that the emb-qm77 machine may be=
 the
better machine serve canonically and therefore to focus on initially. I say
this because the problem there is repeatable, the problem trace has the same
form on every suspend/resume. The Samsung machine has an asynchronous
character, the disconnect/reconnect may or may not happen, when it does hap=
pen
the exact point in the trace where it happens may differ from one occurrenc=
e to
another.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

