Return-Path: <linux-usb+bounces-20333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD385A2CA2A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 18:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86CC816B6BC
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 17:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AC3194AD1;
	Fri,  7 Feb 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgbSNuZg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9B15E5B8
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949420; cv=none; b=oYKlK6lBMWiXj5wGm2+tkhNbn1zf/FFox2plR6634R5659EYP9K+JI4Q0UOlhWeoVoXFLEVuFAOWuCnf1q9y+ht48DvX41hFgyY9RQ0ZJBJgJzllkLqs4fMmVwPKX6wuCMZIlunFAxR+tXfLWH6KQECDqhpXC+5PSWwQ5ul3y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949420; c=relaxed/simple;
	bh=0P5Ew39hn0u4NXkuMgxAFneaEAyk+7dEOL4Ma2Hfyyg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JtF+Q3HAOBLLxjCuLH+zuYFm1Te1Pr3H/U6KP14iyabIrWRBUyFWe6hTCJWEVMvRMDJIIs5dI0B4yXn3lbGofE3xJio3xJ9WVZc5X9ItNqTE1iFuxlv0rmQWAlWMJHFJ98s+I0zzQErckG+09rAlzEHqSVwp/xGng1DHPkIXbtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgbSNuZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 178E8C4CEDF
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738949420;
	bh=0P5Ew39hn0u4NXkuMgxAFneaEAyk+7dEOL4Ma2Hfyyg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EgbSNuZgzs7Dm4AESo1bPK/+uL/SDSem3FZ1b2ceOLbpiKWirulMUKdJU0F08NzU8
	 n4c037F4Zd+jflGmlNQMXCh/BQv9sK4stBhKLS93q3zarejRky+EsOOdNZoOY3Qyla
	 1luLC+x+wGQmF/1ccv1g2+J0nisIM/GSxX78z1LHydnVAJD9aOHvwn7Lp4n8F2vbm8
	 2B94scDMHFZcwoFKOGKEGkrryIjcOqN69DXECgmX6cc9+e+Ign381Cih36XK7jBa4a
	 BQu/HKiCfnkCN+WpKvD9K9vgyzQ3LhtI7uKGJSe0w0tB0t2/8v5XWAZjUzvaMc5pkO
	 u1Y2R4gxxvSTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 04F0BC3279E; Fri,  7 Feb 2025 17:30:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219562] [BISECTED] UCSI patch breaks lunar lake boot on
 6.13-rc1
Date: Fri, 07 Feb 2025 17:30:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219562-208809-NzoQKLlFJ2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219562-208809@https.bugzilla.kernel.org/>
References: <bug-219562-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219562

Todd Brandt (todd.e.brandt@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

