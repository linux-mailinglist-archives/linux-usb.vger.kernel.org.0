Return-Path: <linux-usb+bounces-7394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCC86E527
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93EEE1C22795
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAF870022;
	Fri,  1 Mar 2024 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvaSxomz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CF40BE3
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709310014; cv=none; b=EfxKdM2cxFHhmbeEDPG1GjYeF6RDs3JTIK0i5f34FLK6899nCZQWQxeVoA4AJeeWkhJJ5HJ+ADlDgLNfAmZvk6WB2oya/71brwP2x0FaqcANpwMZaYcSamiygM0vHGMK2VxY4DNkWAONXV2qckwW/XLXcbWtvwpzF22AoHQ5V4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709310014; c=relaxed/simple;
	bh=ekpTJpVdacJCYLdiit9TmaAo78LyXKfXeDboyLh47Fc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bx3kEWGyyAdcPRkE+GH0sW2cE/RqibzAiAlTXRLmMvLMBi4Hh+gidROmu9qwiCrdFORr1agI3GZFs42pbj2iM0xh5XAbJPgDMHoF5JT61hUn7/IwxSev/1Ug/qy95T2BmDuqIdocxzDdrLnNfvlSrma3EfA7++hWRAPO/jq5bXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvaSxomz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67F5BC433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709310014;
	bh=ekpTJpVdacJCYLdiit9TmaAo78LyXKfXeDboyLh47Fc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HvaSxomzrkAST4KZ1b8JJx3aPrrhWxlm60a6Z6EL18rLapHCKCChJ1r8W7z54v3Nj
	 YJfLbyIQU7pP+xN5u3z/PM00BPGS9W1+QFWCl4XxcmmylGnx48WNBRyAycLKifcCzi
	 MOzaBL81TBpEd0EKkmUZRVezyNJg0Vh4F/TT8Nd8xtfGRiUEwlBTp6Zh9uhBa9BQ10
	 PAV94CBTEf9PxvuF8BVoaGwScU2lDMaRVHmhM+mdMNePvdNlOJXU2zCTPrA3EVPbkC
	 J5uCi2fD9APypC8Oao4thcyLBPzgHs5huhqXDcM5j+ox97UMoi25YT8uKPXfhup752
	 d/CfnDhGqvcuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51C13C53BD0; Fri,  1 Mar 2024 16:20:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 16:20:14 +0000
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
Message-ID: <bug-218544-208809-rVjCEVPRKI@https.bugzilla.kernel.org/>
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

--- Comment #3 from Ian Malone (ibmalone@gmail.com) ---
Created attachment 305936
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305936&action=3Dedit
lsusb_-v_output

# lsusb -v -s 001:005

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

