Return-Path: <linux-usb+bounces-9080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596489C9A2
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 18:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8A591C2452B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 16:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765EE142E93;
	Mon,  8 Apr 2024 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGaO68C/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BD142E80
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594058; cv=none; b=tPLvJM89E8uHCea3AP6AnB6aUVYSnP7bvYhKjLHLP3ivOa7nPRfoT7u1GgZI93eg+oaoEejGw8yMs7rBvPCbSqL/y9IxTFkh/KEbYk9X84Ql83/Bog1Jg6pVLdHOh2gYpBFeGLmPNqorWHQxyZJyGRIvqnKaVQfddC5bezghx5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594058; c=relaxed/simple;
	bh=F9tTEFOqz6mv+mYsaxLfCDyeh6T/On5k/qmW736/SLs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J8IJZj9kUAKI64pNnfXjy2JMxC1p6BNocTCHWlAtVtUjFwNVagdwsaj8OBL2FUoGPZNYSg/J87EwMTRDPdw+zn/VUMOdFHgaUaXu3RdikQlOTelewmSNtnHEbS7OyRH1uRrc5S8VNFHYs27O4yNhzSJ05tRTYKwHb32qMufn6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGaO68C/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4D95C43601
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712594057;
	bh=F9tTEFOqz6mv+mYsaxLfCDyeh6T/On5k/qmW736/SLs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rGaO68C/gNRo2rUqJhZWdhiYyjgVXw8XxrpgsM63C6+d62da+g31l3d0TMlllUtlu
	 lCHFZ65Wy6t85dMEmIVjeD7l2e3DZrDdER1Il9pN/DQKXbrpn2uH74njHiKNXBSkaT
	 UUmA3zimPq0G5pRmy1xP6G5E+8px2y7kmt9rFme2tQVmAK0oQxL4pt/aZgnbJIiddo
	 wJhktC4lB8YydPhtyLlZok6a1LK+JytgVRElkVTnGBEneRdNlkUIcI6YV6Q2uDBz3C
	 HgBr7GqGUnrPLqXPzV3YoGlQaet377hnAgUzEUMl4q5ftc+FNm6zA5l8nFfMvMH6JD
	 4SK9sfIgcdO1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B4EFEC53BD3; Mon,  8 Apr 2024 16:34:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218695] Datadump for error `ERROR Transfer event TRB DMA ptr
 not part of current TD ep_index 1 comp_code 1`
Date: Mon, 08 Apr 2024 16:34:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218695-208809-7byScMhiyD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218695-208809@https.bugzilla.kernel.org/>
References: <bug-218695-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 306107
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306107&action=3Dedit
Compressed trace `/sys/kernel/debug/tracing/trace`

Command for compression:

    7z a -t7z -m0=3Dlzma -mx=3D9 -mfb=3D64 -md=3D32m -ms=3Don trace.7z trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

