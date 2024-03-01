Return-Path: <linux-usb+bounces-7378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9486DDB7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 09:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1AA1F214A2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 08:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267186A029;
	Fri,  1 Mar 2024 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAAfnSBg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696B2D796
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283588; cv=none; b=khwKNStG4LY4QL2pz07jTQpWSDmO3cjk8U5vxzpdm1RRGvAIrQsmeWlIumuJCYfnxnfE5LOBedl2RLnn6odpFPy3WXBpJrck3wh73anclvUxx05X5IvB8hbpuXHmgPlKgHjD/c9drnUcf05s4rnIcaEbt2cg7ONhircRHSXQbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283588; c=relaxed/simple;
	bh=+bh9P8eU4HByiHsjOrSf5002ymCM12FKMR6ifMNi/i8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OYcJvk9iqfqmMaL1NqQMHVOmcwqTvUGY3qdlke92oa8h54amWnNopyFj1obOt+hjepkx1PKWETp9q49JmNDUN/mQOk/bWyrRqLhvI6Ini789lIpTtuKyNti6e4wARdk8xlOQBq7Md5iymYv8jN7uB5U0hRaUKUz+Ju5Rkcrr9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAAfnSBg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B874C43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709283588;
	bh=+bh9P8eU4HByiHsjOrSf5002ymCM12FKMR6ifMNi/i8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CAAfnSBgTYFJTLl9C/3fa+nqafi6x4tzQBEHe2HrVgZGIUhJ0aQxaksn6bJWq3YHO
	 KGNi4kK6cKHe7rKOk7Frw45+o1q07qpjvwGeVI6sHq2Po8dnSgBb3LSbZvlzcQTFSr
	 6FR/xidfoyuskIjnvgHdf0emIN0BRvUKlKamMMON+InT7h18tlisrKGgvYFu84uqnn
	 uu8OoSJ8HPdG69KZ4iRTMOxaBAUMgJ/XPWWjQEoQUxIfd+oV8/jleDz9Lw6S0/ejDR
	 vZUvcE3GlsFwjAlZjzp3cyw+J1qDYvJ3zkpjvWXECGDKw4WZS2W/p6dsli76bs6F9Y
	 G+aFmlJAcdlUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1EEFBC53BC6; Fri,  1 Mar 2024 08:59:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 08:59:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-4EEl6zBuEs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #10 from Kaukov (kaukov.peter@pm.me) ---
> There's like a 3% difference between Windows and Linux results for this
> benchmark though Windows has two times better min fps.

Yes, but that is a one-off case. The performance otherwise is abysmal.

> First is that the real PCIe link to the 06:00 eGPU device is running on
> limited bandwidth:

This automatically adjusts to 8GT/s, Width x4 when actively using the eGPU.=
 On
AMD I couldn't get it to run past 2.5GT/s but I'll try with the new kernel
parameters when I have an AMD GPU at hand.

After further testing and setting `pcie_aspm.policy=3Dperformance` and
`intel_iommu=3Doff`, nothing changed. The performance in games is still aby=
smal
and unplayable. I'll attach my lspci and dmesg logs again, after running
Baldur's Gate 3 via Proton Experimental and on DX11.

Could this be a Wine/DXVK/Vulkan issue and not a kernel issue? Although OP
stated that when running via a PCIe M.2 x4 link no issues occur.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

