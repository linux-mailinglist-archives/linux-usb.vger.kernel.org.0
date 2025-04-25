Return-Path: <linux-usb+bounces-23473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061DA9D1F3
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 21:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F594632A7
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 19:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9636B26D4DE;
	Fri, 25 Apr 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOdNgRjm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B3288C92
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609760; cv=none; b=i6SzDCawHOF8CjthTAQ72iPuarQannkNBq6t4mgfEXTT8AIFwnLRQ73aOaS3v5WUJtErZP7SxOBZBiiE22dcOzzOe0fVmZEt5KGbmpvFDvtK9wPr7kNNs1nXlArfR7ZFVw4JaiQf394+B3C3N8JZg6L46tj3NiZ5uxKnlHj37fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609760; c=relaxed/simple;
	bh=CHVczPGJNE2Iir8d2t0I1G1KocxziX30Bx2WtcVEapg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SjMnuDptYN07ZoejA/lvEXdkIqZyNk/ftAQHsf7JXDrDrYu5p8aBpJdv+QzsqnBqFt0/kyDWpe5jafh43ePg8g0mKkRI7vsgbUXw7W7gE5hqpS89tEpmFinnORyvRffbImXsuJVcCgOG5vaqvuJ40xQybUG52cJ6KKKllj58k0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOdNgRjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F271C4CEEE
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609759;
	bh=CHVczPGJNE2Iir8d2t0I1G1KocxziX30Bx2WtcVEapg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oOdNgRjmKEqL6X2U0sU78ksQPCB4gqoyrtdxqPhFEaWZELDavgp1BojsCjUosHaNy
	 YL+lWIEHfWsIKZgyT2aYvpGSXRzluDU5uTU0xcvk3jaq44BjqucdqTrsZejXKIEGuq
	 uQ+PerpiMV21F1LG0QXxyANZJcAPrYYwJlkf/lUQ70HmBAF9x3L8UHAmtOjE4jwMK7
	 3zJNRW4FK5TKIR9HPSjanV2D90uozdPIFwoC0ADgWaH3LAvWmCMPrnqzvjdmQqNdu+
	 b9wSbzP7Tm5SrrLICkvQpbcKdk++GyavS4LOgfgH7va3lByU3WYJDDSosa7+LbqgMc
	 CIHwTidpNmqmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95C16C41612; Fri, 25 Apr 2025 19:35:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 25 Apr 2025 19:35:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-TcXofbeRzM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #26 from Steven A. Falco (stevenfalco@gmail.com) ---
I've run the experiment you requested and attached a log file.  This did not
help with the problem - I still had no keyboard - but hopefully the extra
logging will give you more information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

