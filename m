Return-Path: <linux-usb+bounces-21277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DF9A4C275
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EAF9168A1F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A260D212B0A;
	Mon,  3 Mar 2025 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQqVylpx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDD282F1
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010082; cv=none; b=Boc/YJI73wgy9GsJR/FTGudJZ5QyItDN4zSVIDaTHqzA3bNV4vA1zrGq0jrZOZPQtTD03AylTtAM6/JgLnbpXJMUqcrr5kjYLaeXwb/GVgZEtWIA3x9AZIgsA3yGznK/oOv44686JGrfuatvLQqijp7fUNle+ymyazaEUFtsUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010082; c=relaxed/simple;
	bh=vhRI3l4pVUOUDVdDPzXovy7lcbKdMEH377Ce/B00VY0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OTlAE3Eo2jooHow1BPtXV8XppsWz8nz+cy6A8tgUI13HHN7NrIQ05QJIqu4rf4d6tDDcks7IWww/teBUEJ3ofJ+WjhsJxsaIRrRBsqNN+GAIZCBH4Ete43boR5lkp2hxFcUU+bcQzWPIx3mfOnKAtO1mhL3qsNOh982KV9hX3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQqVylpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3E21C4CEE8
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741010081;
	bh=vhRI3l4pVUOUDVdDPzXovy7lcbKdMEH377Ce/B00VY0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dQqVylpxOD1aT3gC0eTQOI1RDs7CXtxT6FkZRtVhaP+gbWui5DUEQxAIb3pUxlb26
	 8p4CuHs3SKcyU3B2pQpmZozW90OjwUsEs9sM9tvZu95gYAu2zMY6UGXScftlSYSIEb
	 CWBiTc7rmk22L/DlQQqZU9SN4MQfaFBBvIcm6RaMhYhhu6gcNQa01mPl8kORY0CEno
	 obBTohVGAXNRMyt85tlhso6PBP6lLzMCDh8v+BkChjrGgehZVuUMlnOXhWLTKfv0/i
	 wVD2v5P+x4RgW/6br8ggBbGnxTfsKGtwWGmPBcL3UNLW/MG5K2Mo2yPyxGUY6gKlJL
	 X0tfp/83UdE2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95FC1C53BBF; Mon,  3 Mar 2025 13:54:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Mon, 03 Mar 2025 13:54:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-DFbKnaOgLQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #11 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Artem S. Tashkinov from comment #9)
> Created attachment 307725 [details]
> xhci_hcd and usb debug log

Thanks, It does show some last minute urb canceling for endpoints
on the 1-3 device before suspend, and some more canceling after resume.
Also overflow/underflow messages after resume indicating that endpoint
might be started early.=20=20=20

>=20
> I'm confused.
>=20
> If I resume the laptop and don't run these three commands immediately, all
> the USB ports eventually die (usually under 5 minutes).
>=20
> If I resume the laptop and run these commands immediately, USB ports
> continue working like they always did before. So, weirdly and unexpectedl=
y,
> when debugging is on ... it fixes the issue.

dynamic debug adds delays, and the code that starts and stops endpoints is
a bit timing sensitive. Could be that enabling debug hides the issue.

Can you still run one more try with xhci tracing instead of dynamic debug?
It does not affect timing as much:

mount -t debugfs none /sys/kernel/debug
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send content of /sys/kernel/debug/tracing/trace

The trace file grows fast so copy it as soon as possible after issue is
triggered.

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

