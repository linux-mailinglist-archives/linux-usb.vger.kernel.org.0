Return-Path: <linux-usb+bounces-27097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D2B2FDC8
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616E76277FC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 14:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94B32F6184;
	Thu, 21 Aug 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikBozx7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1642EDD47
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788262; cv=none; b=NCYG68f4OGNhEGrHPCua11pm/qWa9C7ScsVdyR7J8bxg0TdzNWH3/F5MOcm8XNUVCrv3jcd0MAzj/VG3aVF6lYet84cHiXhVD8YqSLWZYpF1hrp1+Avj2UqLOPwDVzrO1nZNmmKBIEin1xepIhFJ7l1Q/tNFq9d/zk4EYO5j56A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788262; c=relaxed/simple;
	bh=MRgNpjW+J6bksj9+cm0fOKQiiGwGTR9Mznu76BCPpxE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h1obga+FCWkCxykdZfywOLXTcCdazykERe/DGm96sHVehimqRHNqmCPcgRWk7pK1oR3Fad4HgvYtmy/TSbppDmAm/GOkwkmb8449bDjb3TSMTOJ9w/xlwBO9ioybuZnq/olGzoOz54xhw7nC7kjiZK4gretmuSO6E+6DIsB8vwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikBozx7a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A30FFC4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755788261;
	bh=MRgNpjW+J6bksj9+cm0fOKQiiGwGTR9Mznu76BCPpxE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ikBozx7arsQcs4F117FhWPlPhN0MHVqOn2E9TZSKdrYW0n0ngji7xmnMCtUcwGofW
	 tJWduDLmtlpwtM6EzkdqlnOMh/8eUfWrDkkJ+WpSM7oL9PkInpZNKTXNvxsJPDBtTy
	 aYNSzXgDQicFZEviz1/qzXMyAjNGA9OqASTqBKYBSVJxp+ZIty4m2GfAiHw+li1SiJ
	 PFGJPbd8Q8OcLIEV7vuHZfzPV78MJCuRGgGybKWa9CE4np7Mc+hpJSpLxwTC+hIFde
	 HLVT51bzjRVgisVsrzukTuRhb6E4eEHO0KCxy4NSUXZGsj/xLftgGQ4FaBc1RCYELr
	 UIXI2W/Ip2ZaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B8ACC53BC5; Thu, 21 Aug 2025 14:57:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Thu, 21 Aug 2025 14:57:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220460-208809-DjJgX2C5Xf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks, trace show the link between host and hub goes to an error state
immediately after enabling U1 and U2 link power save states.

Hub driver sends a SetPortFeature U1 timeout 41us to hub port 1.
hub is now allowed to set port 1 link to U1 power save state after 41us
of inactivity:

862.173255: xhci_queue_trb: CTRL: @0x00000000fffc7600 bRequestType 23 bRequ=
est
03 wValue 0017 wIndex 2901 wLength 0 length 8 TD size 0 intr 0 type 'Setup
Stage' flags I:i:c

Tell xHCI host that the new MEL (maximum exit latency) to get link up and
running has changed, set a new value of 747us:

862.173694: xhci_dbg_context_change: Set up evaluate context for LPM MEL
change.
862.173696: xhci_configure_endpoint: RS 00001 super-speed Ctx Entries 3 MEL=
 747
us Port# 4/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 0 State enabled/disabled

Hub driver sends a SetPortFeature U2 timeout 16128us to hub port 1.
hub is now allowed to set port 1 link to U1 power save state after 16128us
of inactivity:

862.173771: xhci_queue_trb: CTRL: @0x00000000fffc7620 bRequestType 23 bRequ=
est
03 wValue 0018 wIndex 3f01 wLength 0 length 8 TD size 0 intr 0 type 'Setup
Stage' flags I:i:c

Link suddenly goes to error (Inactive) state, most likely due to failure to=
=20
enter U1/U2. Could also be related to bad U1,U2 MEL or SEL (system exit lat=
ecy)
values.=20

862.175770: xhci_handle_event: EVENT: @0x00000000ff8facd0 TRB 0000000004000=
000
status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:c
862.175802: xhci_handle_port_status: port 4-1: 0x004202c0 Powered Not-conne=
cted
Disabled Link:Inactive PortSpeed:0 Change: CSC PLC Wake:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

