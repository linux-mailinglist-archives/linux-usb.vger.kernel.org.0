Return-Path: <linux-usb+bounces-19374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF62A1256B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 14:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91CA53A8444
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 13:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E07B242249;
	Wed, 15 Jan 2025 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOxSqLcc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829635961
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948919; cv=none; b=mMTU/qMJoKOyKml1UAhX3s6pOdxeQTb9oUBii0ejQQP9DH+w5D99cpfiK2AgKkpR87GLVSo65zUAU16YbL8jKjT6lC7iRxRxw+FyEP08Tbq6IyX8B5Xq9r0hCyd4NxyQteWBTIxJDlEON4Dbwbpzx4H2gA7HXGY7SCZOkG2+dXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948919; c=relaxed/simple;
	bh=b45buNIx/fbXklyIjYYGjGNmdVFj2ZQ/Bru+Ze1ZMM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PWanqMn9TCHSfzChWgJ/d3vlA9dnF5GoVPHEZ6uRmYKfTOQoj19zeP+JEmBhotgJCpiODJ+0gChj/nzrV95FCt4KuDQdZOEwqGxY90eRfx+XzlxegtJTOfSYZgVzxu2CRmdZU2ew1edScyvtRz71YTAUhoj+/Kke8ZCkakCnx8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOxSqLcc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F2ADC4CEE5
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736948919;
	bh=b45buNIx/fbXklyIjYYGjGNmdVFj2ZQ/Bru+Ze1ZMM0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UOxSqLccNOOEJLhr4akVBnTq8LtZ3bWtoCTyYzjDdrHASZkleL6/ODRhtwwxnD1XI
	 Lcz4cY60G7VqzZDWCWveDPIZFJCS2wscySgps9zhHdwjBXFs3li9M3Wfd9YbhbL2hW
	 lRbO6ccXK8+tSBdhNNDD2S31rsNimBoQWrEackm5Qu+aGzh1dGYplI9eKKGjVPseoS
	 KtSBTwR1Kiq6hj1OtjlwRET6CPM48QqTJT9kWdU51gKYp7W1/7zVrms1Mn1/nM8b6f
	 Jbo/X5xkENyI8HGOxi4GZRyzYxdoFZKhQkoo65tycIpZE+rdyf9ebmFk2u3xs2I2JS
	 YSGS36rylki3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16BE1C41606; Wed, 15 Jan 2025 13:48:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219694] Perixx Ergo Keyboard 535 (04f2:2159) Menu and Window
 Start key press not processed
Date: Wed, 15 Jan 2025 13:48:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-219694-208809-1mrjG1J9hF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219694-208809@https.bugzilla.kernel.org/>
References: <bug-219694-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219694

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Input Devices
           Assignee|drivers_usb@kernel-bugs.ker |drivers_input-devices@kerne
                   |nel.org                     |l-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

