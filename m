Return-Path: <linux-usb+bounces-24840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504DEADDBA7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 20:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385893ACFD9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 18:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B78D2DFF3D;
	Tue, 17 Jun 2025 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruxQYE+S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210528504C
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186219; cv=none; b=KKx1ZskEzcDmIuHQzuW72I/60Sd3aKEEIDWE1Dp0wNQXjCwcXUM68tq6+BEqV8I/qm/IgNdEf96Dp5gabN6GxwAA60uUzYuzsou5ti6wvkFa7dGfPGblN6aW7g+zoK+IISAoe+k6UwsNT4KKwrGWb49jqAYufs6Ofu/NsAwHqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186219; c=relaxed/simple;
	bh=8rGzAgfFH3pt0s5ZDc5eAh4iGfIDKfU+T12YIP6XBOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfjRNdsRu0VRpsNk1r/0WN09TU20UWUuKKXECM3uhCqEcuGMfp8pirOGSxggJ0af3qakdN4iQutx8Ka+WD1TSPNiJNRbmUXR6xMn+jddlrG2WIGOsDh8YhFg+3/1rJNusSMGUft67skbYnN99ZysoxxC6amNl2b9vGWgKDHjJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruxQYE+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C618C4CEF4
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186218;
	bh=8rGzAgfFH3pt0s5ZDc5eAh4iGfIDKfU+T12YIP6XBOw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ruxQYE+SfiTECITgFfiaMy4zA7V3oZA1SFUJjLCTTEjqarGqynLh9Ciwc9uvo31FP
	 I9rPBLpytDcbvQFNNGlb8INbzUGr1ZbtX5m/mG/LuA6H87+Fx+H5J6048FF4jgi35e
	 uiJzJQOnE4KcFSdIKZCDIIMOqqYsJFmcXe61HbZvfg/vCqB30ssI4Pr2fahbEj9EFN
	 8y36Gz6NkiMeiPXSE2qu06h/Aw91QDDtD6MRbAoaQztciZ5hsBX698eYhRDrP0qcR0
	 5UJPvX2QZclpTYLChhp4eWo0TW/WMToLzp/4d3LA+fvZQV9GWeaFCabxneeLDQJOeH
	 ZFv8LjP/QSHsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 23BB3C4160E; Tue, 17 Jun 2025 18:50:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220236] Corsair K100 USB keyboard not working after resume from
 suspend on AMD platform (ASUS B650E-F, Ryzen 7800X3D)
Date: Tue, 17 Jun 2025 18:50:17 +0000
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
Message-ID: <bug-220236-208809-PrVtn0xkJ0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220236-208809@https.bugzilla.kernel.org/>
References: <bug-220236-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220236

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Input Devices
           Assignee|drivers_usb@kernel-bugs.ker |drivers_input-devices@kerne
                   |nel.org                     |l-bugs.osdl.org

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Would be great if you bisected.

https://docs.kernel.org/admin-guide/bug-bisect.html

If you absolutely cannot, please at least upload the full dmesg (which incl=
udes
at least one suspend/resume cycle) for a working kernel and kernel 6.15.x
(likewise, with a suspend/resume cycle).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

