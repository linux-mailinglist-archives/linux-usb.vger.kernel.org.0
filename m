Return-Path: <linux-usb+bounces-24999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F88AE3984
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C83D3AF3E0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D36523183C;
	Mon, 23 Jun 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZWcb4vv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94A1230BD2
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669660; cv=none; b=RP2jyEhz4PzsQsxqOFBiNY5GuYnzWd4Gijh7w3oXx8SZWq8Cze5tFBgIG4Pw0DUHwusNUUFe44L2o/gOepbXkCXVajO0p6hrEtM0UcyaE82Ds045kMqsAGNjOaPtNcfMvcnDB/GtEJgSRmb726RgTARIv9nFu7oWgm73pu4z0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669660; c=relaxed/simple;
	bh=KE0BcX8uSgyZImLJsQUTLwu5PeSUib3xlCyV3ln4McQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WG3ePc4Xegjovm1m2ztwrd3r8XaG2XYAlvmqdE5Au8hicKfmSEd5fP5JR9QemK/Jca9OucfJSmhECiP/gGZFPG6NNTaRbb+UyaUpZzJi8kUYRPJN+kCutA1h6DX0MUZ1Nj2fWATiTM0IBPUHvEPpmlmmIjvq4a67QwmbhEannUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZWcb4vv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AEFEC4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750669660;
	bh=KE0BcX8uSgyZImLJsQUTLwu5PeSUib3xlCyV3ln4McQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tZWcb4vvLssBXYiKQLRNgnB6+/luR5zFHSR6M1cit8juZPYMFWN7en1S0bXcsZu0P
	 uwABTSJHhKed9KjtsybEKL4R/Y9V8cN+8aSTO80cG6NUVC2TRSkddKocCVrtUAe8f+
	 UPLMBAiBemlF0Mmmb1+0wyhsPBtwagz8gHQVVa9Rj49mqjIuE5cGKE1+LsIqnuMxhP
	 brZbOmYaFQ490dVxZmMlnbPfYRgF8jv+DG6FzBddiza5QnUm3dwleBnSHphFPDZvXF
	 d0XkzjWjBxUch6V4cJvP5SCQNP0NLz/rINVF8R+y4wRJr1DozEvcADwg5mTCIkl91S
	 JknzXTSO4DFVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1AB55C41612; Mon, 23 Jun 2025 09:07:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 09:07:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220238-208809-jMKPouJJEb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

Ryan Walker (fewspotty@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |IMPLEMENTED

--- Comment #2 from Ryan Walker (fewspotty@protonmail.com) ---
SOLUTION: I figured out if I plug the Blue Yeti microphone into a usb-a hub
dongle, it will work every time. It only doesn't work 90% of the time when =
it
is plugged into a usb port directly no matter what usb-a port I use for some
reason. I use an onn usb 2.0 travel hub S/N: 11B35351.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

