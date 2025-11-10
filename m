Return-Path: <linux-usb+bounces-30254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC761C4604F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 11:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F423188487C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 10:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001D5305E24;
	Mon, 10 Nov 2025 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQ8J01lA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DCA3054F9
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771350; cv=none; b=Id/8ayP6DlsIQX54QbEF6DoRC9mD3Y8n1gZR62yskfFbU5O3n4+RdBYSxzkXgDRP40FSB/k0CLryjmptdsd+tV98kUhYM2yyubDjBnhwBmZZ7+D9h26BDRafnRnRaQP/E1PNGeiB/UO4EgDpdM81J6/tsRT5L/6P9c4XX4z7rMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771350; c=relaxed/simple;
	bh=c1l3Sp0qugTd7d+c8jrSvAhiFLLC+AZtUhwfMya71Vo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZlK34XlM2ovu0n8epn+W7BDNaV0iC1q/+DrW0hIOlSK5FkZsfLtY0w+otICUn5qS8MXKpo03ngwALNaGv5LC5UpOKXv0hTokxGYVs8F9srgOKpqZEFtKPsdxF4dHOfdZ8dSr2DGLf+/kMPnJDPlk5A2GEDgleEBkhLOKFUs9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQ8J01lA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7163C4CEF5
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762771349;
	bh=c1l3Sp0qugTd7d+c8jrSvAhiFLLC+AZtUhwfMya71Vo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uQ8J01lA0c/mI3+uSlDqGfAW1hwPDR5ijLcvdDPeAHuWpL0EUjXR2Rb6sbSeuJzxn
	 ipWuF1+PkZ46ehSSdlNjQ16zi9jCXq6KRRrLGRzTqeYg4SB9Nlzade8f/8TX/oZNkh
	 cUJszeI6L/pu1TmrcD87raxizibn9n1YKJaZC8DNlZWqTHt+xW7eoJSrmzfncmtAUa
	 3TCr4GnzNxTlsMzCaYEAScNkJd47MHxT09N8MO1NwwX4tMjWFXiXqAio+goASMIwDH
	 MJCtm8vHqpq24x4DzWgbJmL8YwhOmDVZ/177pU0GqNLTAgu1sq6UEtcJhP333zuHKi
	 7ZyDjLkifIJSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF43CC433E1; Mon, 10 Nov 2025 10:42:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 10 Nov 2025 10:42:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220748-208809-KUhWKvv4l9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #17 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 308930
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308930&action=3Dedit
schedule isoc packets sequentially on CFC

This is a test patch which knocks out the problematic code and adds some
debugging on CFC controllers - interrupts are enabled on *all* packets, eve=
n if
the URB isn't done yet, and for each packet we check if its completion is
handled in the expected microframe. This may show false positives (the pack=
et
moved as intended, but IRQ is handled later) but it would also catch cases =
when
HW executes (or reports execution) of a packet later than expected.

For example, it warns about every single packet for full speed devices behi=
nd
high speed hubs on my ASMedia controllers. Don't do it ;)

It needs a fair bit of testing to see if this approach is feasible and I st=
ill
see remaining issues in some tests (which may be due to xhci-hcd or
snd-usb-audio) but it seems to work generally better than unpatched driver.

May or may not help with Motu devices, I don't know what exactly goes wrong
with them. And again, for now, only CFC is expected to be scheduled accurat=
ely.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

