Return-Path: <linux-usb+bounces-31857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD7CEBAE6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 10:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A134F300E78D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF646304BB7;
	Wed, 31 Dec 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyqbWdk0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1A19EED3
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173054; cv=none; b=VLCeX3nvE0wmchloS/XgyB8eXkqF/dahwjZS6e4QiFe08KpPIrTOiwA0ZLxtI/4WHrD5l9y3Y7zBJJPeGbfJNgVnYbXp+kLmJRLpkG7mduK65uJLx8gGZJhMPlIysVikuPJ6vM9h125o+1zuUC65RUd7ScXAqrUQP+Gpn3D/21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173054; c=relaxed/simple;
	bh=hT0dyhBhUA1so/yMOsADX+mXStooVvHfnQnGLH7mFfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IAzBO/IEVMqqLFs3DJ0kPwi7hgk6Np6D/+htGJE6+OZVkytO+7xrmlgwMEXqPY7V02dpHa3uJi9e83egtbGA3oKUenWc6tUyYVv31/vhCfBwIDT231hN7vsYefEAze+yonrN0ncDB7c6YhhTktg4Mx5ht/xwW8oWbdBOkG9I+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyqbWdk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CA88C116D0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767173053;
	bh=hT0dyhBhUA1so/yMOsADX+mXStooVvHfnQnGLH7mFfw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GyqbWdk0NWC+QRCrvGOmQRdcSIj7QB42RhMQXG0SCJTZ7KG9AHYDH3LGZBRRtuIAJ
	 K/GZFmuhed/Ukml0M5x3BQDGquhXKUNm5bsS93U5a8k3PkwuxKDBhP+Om44BUqENka
	 sL1cq8sWPXKnF4hPTUAe6XwWLAVcMeMHY6LlUseqlCuq41W7UMvhf/pWpDGoHS7J49
	 fU6X+s3jPVL+Am2ns26LtlE4NNXzIBYCq+oUfwW+huXot3iLvZtdfwadzpQvYdWZE5
	 xl2jZ4ykogK0Kyqfb0ZSh736L2Ue9+kJhmFO0jRVPthi1GB+5trMojZx4NgB8pAvtV
	 dLrkDKbov/rPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6CC3C41612; Wed, 31 Dec 2025 09:24:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 09:24:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-3XHDVZk27t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #5 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Okay thanks! This dock is not TB/USB4 so not related to USB4 link. I wonder=
 if
you tried to disable runtime PM from the 0d.0 xHCI?

# echo on > /sys/bus/pci/devices/0000:00:0d.0/power/control

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

