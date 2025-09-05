Return-Path: <linux-usb+bounces-27591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A512B456ED
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 13:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2538165756
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1334A318;
	Fri,  5 Sep 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN0R/hXN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACBC345730
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073199; cv=none; b=DCkbMPb6cJ3RDVAOj1TUw+H/r3lz660xXzYlQBSTf5fAm7SgK4rFLBKiP2sO3WEs7TA6Zk8COTvsvFxhYNuKih45wav4I7zT/HkiYcjWkBolTFLZPpzBxGmuC3lGq+gck9sLslxitYR1LDNZ9oQ9U9DP4n2nCErCy03af25h5nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073199; c=relaxed/simple;
	bh=YEJSRCY2YbfuH8NRhBsrc6iE65M1hVVMTQ53icziiQA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKtKaT6JCI+fJFZMAzp1TAq/b8/5oHCYplIdaqnmXrmgRDHd9+jvFXa/X2uMzeqRXzWA54MFST79jIOK8O192QK5YuiOqJ1SwoeEq4Up16969MWTvj41uOTq7OwO7Furb0A0HBiuWzAdhtPwkdNzU0S0QJAHxhMeuP685poalW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uN0R/hXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D4C1C4CEF1
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757073196;
	bh=YEJSRCY2YbfuH8NRhBsrc6iE65M1hVVMTQ53icziiQA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uN0R/hXNWDhfkcincu77U9pwAOgb2JKOPxSPu6o79JRDD626A6p/i+BcdWWknn+Ih
	 yJrBXDF80mYZs5V5spcdJFm/7VXH6lSZvr3l37X6cvLzhtHZ0KmHBoYPDsHtWNCir5
	 wVB3Q77E8esgjHJ0DiVCxdDtUeCKVi2kC9nZqOwlhXOkPBtW9t/MhCZgDnQTEPUBXU
	 whiAN4MSMLFe28ixOGqR8DdBIb8u4/DZIcWItUQmn/CQMv3XOf8qEXfpDayhO+Znai
	 01jEsp0ffQ9QVWZpOM7J2iZnMzPFzc892PWWgxMOHreuisVTfahpyUVyZIMGprMzWO
	 9kNHBEbF8Cdwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80953C41614; Fri,  5 Sep 2025 11:53:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 05 Sep 2025 11:53:16 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-4yRI2TQQj0@https.bugzilla.kernel.org/>
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

--- Comment #43 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 308620
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308620&action=3Dedit
partial fix to sort xhci-hcd side issue that prevents urb queuing

Patch so ensure xhci driver does not unnecessary prevent transfers, and thus
causing the recovery after resume to take even longer.

should sort out these extra messages in the log:
[73415.446721] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[73415.446746] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[73415.446755] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[73415.474680] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 p=
ort
polling
[73415.550753] usb 3-4: reset SuperSpeed USB device number 8 using xhci_hcd
[73415.566718] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[73415.566738] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[73415.566746] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive

reset-resume may still fail, and device get disconnected/reconnected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

