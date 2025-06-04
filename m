Return-Path: <linux-usb+bounces-24501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB695ACE608
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 23:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4949D3A9325
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 21:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EDC2040B6;
	Wed,  4 Jun 2025 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsidlPA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D4111BF
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071392; cv=none; b=TeMI1KkZjedvBdiRxKnAVoBnTyC9KGynIvqlR2tYuRMBGU6eeYNlZXiSqhJwK8jiyxooPDcXlxVg+QMSmNImHUWbz1HamG66s6AL+2qYHYEGagbrLtvt8L+p3bWwm9l2v+mOIwNRAieI2dFun1NRH6rMzpgNLCIY4cvIOaimWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071392; c=relaxed/simple;
	bh=3bkKUpX2nE1decUCzhNNwLF4Hm4sWo+5DYsgdesXfLM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VK7UFcfdQvEWeGJ6YnnSbLhmnTSt8wMasjeEfu9khH8IZxwPaNTFPDE+3SFs4AqqoUgvT8u3dy8ijzZRlWlY1x1yKtMaPEHhlbN2loFhthM/OYGGcHfd760G6zxYHFRaaYqgUqkSOJnUxt7N7K6vU9o7Y6P3iiq75ZlFImTxkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsidlPA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4BE1C4CEED
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749071391;
	bh=3bkKUpX2nE1decUCzhNNwLF4Hm4sWo+5DYsgdesXfLM=;
	h=From:To:Subject:Date:From;
	b=TsidlPA2Zblrkj4pOc3njwuZFRsB4/grxUuTKI3lL/RetsnL2MuCqFQsDvYvplWOv
	 424dlyK2mTNMUvAOQfbbHl8VhToQ8lye1+yPK6hNw30JfC4fOq8GCvvDvv4CtuWYTo
	 xzG39zeUSP4swGbAi+mQbIGmrc8F528Hxlg+nJCFHtVQuG3Gzslhw9B5MOVNEJzYWs
	 qUS4x9ul0Xbamb0Cszgv8+zQk5yb2IchdHdvuWTJT2acW6B16FleX2aecOkmMk5atf
	 DCxPCQ+WpCAgZKItb7+iO8k/66SaTnL7CCnANflFAJzX75dpYGERdaRDHFG++c0loW
	 ObyBqXfWywG1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BB54EC41613; Wed,  4 Jun 2025 21:09:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] New: PATCH 6.1 082/167 which adds support for Owon
 HDS200 breaks functionality of Owon VDS1022
Date: Wed, 04 Jun 2025 21:09:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lestoppe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cc cf_regression cf_bisect_commit
Message-ID: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

            Bug ID: 220193
           Summary: PATCH 6.1 082/167 which adds support for Owon HDS200
                    breaks functionality of Owon VDS1022
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1-stable
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lestoppe@gmail.com
                CC: gregkh@linuxfoundation.org
        Regression: Yes
           Bisected 4cc01410e1c1dd075df10f750775c81d1cb6672b
         commit-id:

The commit mentioned added support for the Owon HDS200 into the
usb-simple-serial kernel driver. Since all the Owon test equipment uses the
same VID and PID, my Owon VDS1022 stopped working in kernels that have this
patch.

Currently I've blacklisted usb_simple_serial kernel module as a temporary
workaround. Could you help with a proper fix?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

