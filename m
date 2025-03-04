Return-Path: <linux-usb+bounces-21319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34DDA4D6D8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 033E01690E2
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 08:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FF91F5845;
	Tue,  4 Mar 2025 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okZw2gEk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F2D1F560D
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077858; cv=none; b=N0GgrSADiAdYO0sJedK572f1LJfqL8ENGoWqf4sLLqVz4jiQGWlmFdUllEO2FZbAt6L72/Joq0amd16mKR4tqCXG08L7yiZ88TdB6KxJ0NxDo6TeNGROEAkhHZrmw/0U4P8fUjm8QfArBh9XhpA0O6FOrS9FE++GaxUBJ7pMu0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077858; c=relaxed/simple;
	bh=fpv09pRETYKaUVmZ6xU2JycSCfPZXyNWxS95izkIY1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dxhvVLwWUv0YMPVYhQqSWilWPBXS/MsvQVxF3Dafe3s/4RZY0Nv8meTHXtT7xIOHGkLsWV2TWFzANKg59CrKhp3ys8IO2eiVcx6/OWEL7I9ATEVUCIbQccgbKv2oDkB0bmvplgdIhXCoGaGJ66rN2wAlk3W9CkDmdKJa2A174ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okZw2gEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54D77C4CEE9
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741077857;
	bh=fpv09pRETYKaUVmZ6xU2JycSCfPZXyNWxS95izkIY1c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=okZw2gEkVCI5icRWISXciaiZqQZFYsTGECS93bAPJubd6lHjToHHq2BuWP2l2DNyb
	 KmXQOwzbSwmmnZ6hP/i2zjDgLgRF/pKRl58de2Le6g7/ah18L9K++91VuqDNqOn9qf
	 QqVWAfAhHA7lwVo//Guj5jAq+FCNmJB/fY/OQlp5pitnKGUUDFWgR/SbGez74Z5E8C
	 EWi7ZQTFym5ic8x1KuXFkvF/Hz32krAHZaoMz1FRK6YM+GWrphSORDJqONkxEgQDZb
	 PhqDcELSk6q/z1ray5EbYauerc8OYDfs+5T/30fzTSNyPuy8scSUrzQtvGxzJf+LSF
	 RNAk2xJrBmy2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45248C433E1; Tue,  4 Mar 2025 08:44:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Tue, 04 Mar 2025 08:44:17 +0000
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
Message-ID: <bug-219748-208809-GFQ3jKAo4x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #16 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Thanks! So we have:

[   56.773330] thunderbolt 0000:c6:00.6: 0:3: hotplug: scanning
[   56.773335] thunderbolt 0000:c6:00.6: 0:3: hotplug: no switch found
[   56.773349] thunderbolt 0000:c6:00.6: acking hot plug event on 0:2
[   56.773362] thunderbolt 0000:c6:00.6: 0:2: hotplug: scanning
[   56.773504] thunderbolt 0000:c6:00.6: 0:2: is connected, link is up (sta=
te:
2)
[   56.773515] thunderbolt 0000:c6:00.6: 0:2: waiting for a while
[   57.371077] thunderbolt 0000:c6:00.6: acking hot unplug event on 0:3
[   57.371143] thunderbolt 0000:c6:00.6: acking hot unplug event on 0:2
[   57.692761] thunderbolt 0000:c6:00.6: acking hot plug event on 0:3
[   57.692828] thunderbolt 0000:c6:00.6: acking hot plug event on 0:2
[   58.291125] thunderbolt 0000:c6:00.6: acking hot unplug event on 0:2
[   58.291217] thunderbolt 0000:c6:00.6: acking hot unplug event on 0:3
[   59.430462] thunderbolt 0000:c6:00.6: 0:2: .. done, trying to enumerate =
the
router

In other words there is some ~600ms timeout in the pluggable device that
triggers hot-remove and then hot-add if the device is not enumerated. This =
is
naturally the USB4 spec, as far as I can tell the host does not need to
enumerate the device at all actually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

