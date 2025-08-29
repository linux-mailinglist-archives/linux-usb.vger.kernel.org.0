Return-Path: <linux-usb+bounces-27376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D9B3C1E6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 19:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 745EA7B9623
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 17:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E57342C9B;
	Fri, 29 Aug 2025 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEHCdlsw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1F2EBDF4
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756489031; cv=none; b=JqdZsVFLAOZp6c+IWMbwVx3V4wZx28C9Dsjp2d3rNdlTtQmwa58X0Gw7qiDw+af/w+oPZuT0yna4D97zQNCtSf3l8ILy/Wt/PVjoQBUBPDdyItvMxTKD2O9beQ0IFkYDYGV0OaI0Wj0M/pUPQVPPQo/TNDyvSp6hWe7H5Pckht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756489031; c=relaxed/simple;
	bh=TP+zTzRYIEfFAsVbh6AHEiaJQjk9bEmVWf9btuVxvoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PMeq10U4SF4pn++3jftnQz3S0qQKxr5Q02rhp59qd+jzjhdWfB8bi8GeF00hIB+ilPeK/ejXCv/S8mjm4GtqQf3sGkMwumBGhDag1J/YRvTOX492hkqhmC7qzBjeSi1nXGIk8ecxwUwH8hEFsxgIlHno+pS4DElGOCxPu8J76V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEHCdlsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A39C4CEF0
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756489030;
	bh=TP+zTzRYIEfFAsVbh6AHEiaJQjk9bEmVWf9btuVxvoY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nEHCdlswmIoB0u80xQweuIzrkgbIGQonXRGJrfjN1nBMdg6RzQXYzTrOOo4DOs4VM
	 SPpfk/5Td/TO2QKXhCUt0G4Rr179Wc7kOw1Vnk5r1HIOltYA0KqzObOUHdWlUPXIWk
	 OtY57CG3WEL1p8z6jyRZ6046dc1++dNPEa0sW/kL2at5x3AfyprwI6RaoP6uHAXgPP
	 P/xQYJl5imXhhVDuotVHspPprKfSsUqaMCPennjj8xcw2N94UdbhcG4B/UmsU6NV03
	 0m73cq+znBfDJz4kOd7g2UWQsUDbesVcl5WHEB0uyrnR3ApoevfUvp6IdhKuVtDCGH
	 oE51n+/H9r6Og==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E876C3279F; Fri, 29 Aug 2025 17:37:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 29 Aug 2025 17:37:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-VBZ6hDSkFv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #15 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308575
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308575&action=3Dedit
S/R dmesg log, reset retry patch applied, usb_storage device still
dis/reconnecting

The attached dmesg log has xhci_hcd and usbcore debug logging enabled. The
retry patch code was not triggered as the "Connection change during reset,
retrying\n" message does not appear in the log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

