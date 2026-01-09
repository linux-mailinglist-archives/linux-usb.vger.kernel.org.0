Return-Path: <linux-usb+bounces-32124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB92D0C8EA
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 00:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF6703020CE9
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 23:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5AF33F369;
	Fri,  9 Jan 2026 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl5OvW02"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A945633AD95
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001754; cv=none; b=AsL4WMfu8lER/mFv2U1SVHI5SAXSaDu6whbVsaLbDeOW6ANMAKlV2Cp8fzxUwKJoyJ+ntWrpy6rSyn40Wd6HttWYVL6Hc6C1w0MWVrKMDOXK8H1qhAVxkc0gZh5g6IjlRBfZ2tUSDDUsvY//exzJavPUKKnLrEFS3SEy4bcRVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001754; c=relaxed/simple;
	bh=AlFF3UUSbW6igFTDFRXQzE2LI1M2EiRcf25uYzTIWKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlkAzsJVQCSjCHG71dUXkCVlLCmM3W/SAe7B8KRsM4PsIxPkLqts7TShp7/4iH6k3ITa5teXAX+5psv2s9gy5sDaPwXiwwBwvORWGZIcJ1v4PE3YWm2tX5vEKdT9FmNKM9RQ4/4JlqvtG/iCH2MQ+nFZp7vQ1xJeYABbypmlBMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl5OvW02; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41B01C4CEF1
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 23:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768001754;
	bh=AlFF3UUSbW6igFTDFRXQzE2LI1M2EiRcf25uYzTIWKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tl5OvW02bJNtDrdjjc8QTmdfRi3zeUmBVc1P1otvpnvpr3Lb/j409sSupzqbjAmem
	 uWfU48WirZThiK4vSe3+1fLVBlRgZkRxk2bVC/3Ss49kBFzoRrBnm81e03CcRsA0Qa
	 oeq9By1RKekhRJH3ETa7GUMM8TvoCS7QyVD9sRQ8ys3pJtKuNOjt/v8jNvevCrN8vp
	 5l6klEiVDK6xiQcnid1IGSmu510k540wpk74UtqiqvbUrXUTdHJX6t2Me7mLVxgiec
	 6gj1uca9yPnk/oTfP94frs4hbiJ/2t6v7ymY0VfyXnS2b+s+azZ9BykWAJFY1grCIW
	 dgOWzcFZzXa2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 342EEC3279F; Fri,  9 Jan 2026 23:35:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Fri, 09 Jan 2026 23:35:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: faaris.ansari@proton.me
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220238-208809-rSALd1JnW7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

faaris (faaris.ansari@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |faaris.ansari@proton.me

--- Comment #16 from faaris (faaris.ansari@proton.me) ---
I can confirm that this bug is still happening on kernel version 6.18.3. My
motherboard does actually have the options for ErP Ready, which by other
reports online should work around the problem, however even with this optio=
n I
still require a hotplug to get the microphone up and running again.

On my end, the mic works perfectly when I first boot my computer. It only s=
tops
working and requires the hotplug after a reboot, or wake from suspend.

I've attempted using `usbreset` on the device, which didn't seem to bring it
back to life. Only physically unplugging it and plugging it back in has got=
ten
it up and running for me.

I've tried the microphone on Windows, where it works great through sleep cy=
cles
and reboots.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

