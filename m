Return-Path: <linux-usb+bounces-7397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C0286E668
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0D71F29870
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DB92746D;
	Fri,  1 Mar 2024 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK8j+s0j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C791F612B
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709311684; cv=none; b=iLhfDfpP8WDxPoiItft4X/4CNcifxXljs63UWhfk8jm32cL2RF8wyj1QJhhCcyiUkFCD16r/ZFdBH0N87Z69WbSRGgCgwXsoSpQF6Nr1l/4JIM68A62n/PdFHbyos+fJzNkSw1gW6rmWY+Ag+1Jc9enOFYiyePvP4FTYyOvvmwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709311684; c=relaxed/simple;
	bh=nMp2JSwNhcjULm38nOhAwm8AarHvMkyRtr8Sqy6fJUw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QvhECwEmkJbByZL9ulr3XvEEfO4k0KNtmwoYIC0bu1TeH/qCv/PwY59s043gBYoTa7JaH1ht+rQHENNRTcWnG782Qq47TeImn4rJPqdeNkw3en0/RnSeHu9ZeEbYTEzu6XYob4BkZ8D68AeX7M+xboqudsRo8s1AOX6nGDcY+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK8j+s0j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52DA5C433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709311684;
	bh=nMp2JSwNhcjULm38nOhAwm8AarHvMkyRtr8Sqy6fJUw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vK8j+s0jahotQn+CBH2LSpXCEbgicAXCJkqw8vLH9aN75gecJ3pCyiuC3t+KleICo
	 vWWD7n9lb+1d4AbccZXYFePXmsO42eGzrOaEMfB5QTK1IPuju+Em7UxJTZXfdFvh6P
	 bUDiBLY2URqEGpBCh8dsJaNGFayULsXs+cHAVwjCA37He/sRicLblcv/l+5RVt/0Ft
	 eguBPvx2dq97VdBkfnQ74U9AbsmXSX2RobNSVd6p4HstUPo3xzhlfk+fM5wMlztkmQ
	 xqkUVUV444oT2DxH84ChuUPuvVsqqkouplSusfJXDT/iC/gKJx6CQl2nUcYTGf8w7M
	 T4962wZr6IWNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C31AC53BD0; Fri,  1 Mar 2024 16:48:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 16:48:04 +0000
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
Message-ID: <bug-218544-208809-zPxeyawK0u@https.bugzilla.kernel.org/>
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

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
The devices file shows that the Synaptics audio device is sharing the same =
bus
with a Broadcom Bluetooth device.  Maybe if you disabled that device the au=
dio
would work better.  Try doing:

  echo 0 >/sys/bus/usb/devices/1-1.4/bConfigurationValue

and then trying the audio.

There's also a video camera on that bus, but since it runs at high speed ra=
ther
than full speed, it probably isn't interfering significantly.  If you want,=
 you
can try disabling it also by issuing the same command with 1-1.6 in place of
1-1.4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

