Return-Path: <linux-usb+bounces-7829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C258785C4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 17:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866D91C217E8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 16:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85592482CF;
	Mon, 11 Mar 2024 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwr5l7Ze"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061CD38F87
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176002; cv=none; b=qsxVFrDYXcKj9ib+BwIgKpes2DTYEz/TU6yzFhhVWtYBB5O7nlPmqx2caHAFrLY6WtoAoMRqReFaUm4bS9XGwzfU51tmaQKivINm6QRYmBcToM3MgrcOCGy302MIyD7bBewSqo1HJjBcWiiMswtqC/6wkDYLs3mfdiUnOasOTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176002; c=relaxed/simple;
	bh=/RPxESsZTzWge0wAG7Aer3LedxrAGzoxAWsubVCc+5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNMcmE7Cfpak4oC3It4rfNqFNDdNtFepiAF1GQC57nX3NDL5yVTNCjiHYrCDVi6g1biMU4wulCFN/cVg5r2WmXvRi29sKX43tljQgvfnXhDzedFXrmJc0qfWy0pnG1+3/kZdpKMuPP65KLEvIZ8LUg0zvOdsqoBo6QEywiCPyKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwr5l7Ze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7539EC433F1
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710176001;
	bh=/RPxESsZTzWge0wAG7Aer3LedxrAGzoxAWsubVCc+5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gwr5l7ZeflVzPMdfA5rW/wbf61HIsrR3poJblD2ePYzc66bwIyTMvl875dVsXEGof
	 +GvOOxpqnvhLxbXe6NdPNyRHSFPT8iJWz1fL5iUSHkmqWPfXus02hre51y/aa70S7m
	 2PkrEh/nHzqtwU7BVK3TnaQzwDbIhsLOyM40hqTQW1B/yC8FvDnIUrOlsvuxvT/68k
	 +HLsPV1KyYes0irz0hpV6WToSnz16Um2LZVvblCqNwxvFBDGgioVMVWmj/DlEI2lL1
	 TzwTgr3TG+wnjvmMGr1Xa9Z9xxca0x6Oy4otUUXAqLXcbJjxBRoGlLQMgOlhNzXUzn
	 Ct9bTm9PDffQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5BD75C4332E; Mon, 11 Mar 2024 16:53:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Mon, 11 Mar 2024 16:53:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218546-208809-qBOeH2p672@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

--- Comment #4 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 305977
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305977&action=3Dedit
callgraph-for-otcpl-hp-spectre-disk-usb3-xhci_hcd-fail.html

Includes a callgraph over the failing usb device showing what kernel source
functions were called during the hibernate fail. Created with "sleepgraph -m
disk-platform -rtcwake 60 -f". The dmesg error timestamp is 323.208. The ft=
race
time is the same and you can see the timestamps in the usb3 suspend callgra=
ph.
The error occurs around the "hrtimer_try_to_cancel" function.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

