Return-Path: <linux-usb+bounces-25321-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79AAEE6E9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 20:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3382916DB96
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 18:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC3528DEEE;
	Mon, 30 Jun 2025 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnKT0SxQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD472613
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308733; cv=none; b=LbR2Q1T6Ne6pJPnwujaPj6G7GSDQHlFTfNNDGlOFqlA1fYmIt/+R91rLrh4wb3dhC29u0OHHc0L4Epy6CiyFgwWnO+P+ekLcjxFoB6n+TewsK0Un64Rq+YPeKrat8lqOckDaTvTSYvQpJ/Ln4b/N4AhxHM9Jty4+wIWnbk/B63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308733; c=relaxed/simple;
	bh=jPrYbmurOaNKhDZPYOiRk6GtAKHzZ6hseRSfst6GVV0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9PoLwiFB49hZZV06npk6kVBfY7S+WhTEcd8mAVLNU1onPe0z0miIXJbTPrFaPUa+Nd7Yw/KAmS1F6ACxdxX+Yi2CjB/APa3ZuCEliSr6HYFEN7MUUK4IVpjJIkwXOlZEZg4McClmtVaK14z2zhKSWdZIczIIdnveybtDOy+cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnKT0SxQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 630DFC4CEE3
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751308733;
	bh=jPrYbmurOaNKhDZPYOiRk6GtAKHzZ6hseRSfst6GVV0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SnKT0SxQYHgZQEN1rj0eIti6tMRXWGgjJCjGsHQMEFqG4sAe7WcMaHInT9VLDTygm
	 mYaJE+Nu3HVM2b5pU/pa0EsdWBFDkkfpJcpI0gOpCu5/FmqHTzMPmTrEnt5aeGjDec
	 1kZKMK65Cxn5WXGiOOIqH5h08v8XwrxaYXkFEyrjzJCqk6JU1xkG7DlxcFfJqppv4q
	 t5J2jEPrAPsAJs5FUiOxOEPU+dMyP1DsAOzXin05hHSD0iQzOHy/xH1f/j2dDuz6wx
	 vOh0MkzUPjHcsIvSuJdjBEGShCsMHr6Oo1giQ6YG6RNHdGkAisdnJY4oHflDxxDR9g
	 q05maZoImSP/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5AF90C3279F; Mon, 30 Jun 2025 18:38:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 18:38:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-C4sLHmGbKu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #21 from Alan Stern (stern@rowland.harvard.edu) ---
Did you try moving the mouse or pressing any of the buttons while the "work=
ing"
trace was being acquired?  I don't see any signs of it in the trace.

In fact, apart from a little communication with the Razer Cynosa Lite and
initialization of the ASM107x and NZXT devices, I don't see any significant
differences between the two traces.  They show the same amount of communica=
tion
with the Sharkoon mouse; there's nothing to indicate that it's working in o=
ne
trace but not in the other.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

