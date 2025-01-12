Return-Path: <linux-usb+bounces-19218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02FA0A87F
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 12:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5DF3A6FE3
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 11:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CEC1A4F0A;
	Sun, 12 Jan 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gm9BRDeP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09D412C499
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736681035; cv=none; b=GgHMUpmhSmSjaAzXQJ/LsQ7hhXvfxcNyuiSRs8RPHIEFEtO64JgYRzS5AiUc4G5amamXvEXqVxyCpxWibL+SE/coODFwwvbe1dvgPiqcjTFWo/ax8ontX2TfCrVhLShC4yyRWYFL1kEUjHaPKE/U/OSH4npaTWxzl7u4XDLL6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736681035; c=relaxed/simple;
	bh=4dOBcc4+HtQTtSKEPptvJyFinIMXzV62BK+YxPKFfW8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ig2eDlKqxy6HLDfHjKOqlzr9RuIMIudJ3d3DjUTztsrD68/oH5TE3DuZg3CwwAbhj4JMRsZmpS30mUX5+9GTp7aJByyAY3X2RheWKAHXI1BSE32Ysr2Tmko8C+qO2IfU6Yb1DMj8FhHClxl3BdJEO08DiCFsbEU8WYr25/rXUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gm9BRDeP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A0B6C4CEDF
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736681035;
	bh=4dOBcc4+HtQTtSKEPptvJyFinIMXzV62BK+YxPKFfW8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gm9BRDeP9JhTHodC9YiVGpTLeRpWISsLz0boXvuyxxfB7QY+ncBSdksnyUpaHOG/1
	 8pdvs/xDKsuWWXF8yg0J5FFbKEUpMZgtmO1H8EnXzjNEX49vhvcpzNt16u4PGRczeZ
	 LGSSxpZHAyDgI7nXv9ww9XqKH03qX0jAxwz+y3qtDFgwh/yvCJwtnkTroWy+PEjlPv
	 Hk6fyASgifCRG7/qgJqh8Mk4gCDtLM6WWhjj+M6Fc5zqAfVsimXUgMv6dUqliRQA+g
	 owm/Y87heFoZoYpohSa9fYWFzJquArG064d7hYRab+BHlXjIrB+quTgBON1xsm2uHC
	 Stsk6sNXmLD1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35664C3279E; Sun, 12 Jan 2025 11:23:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] Noname webcam used to work, but not anymore.
Date: Sun, 12 Jan 2025 11:23:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pierre.juhen@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219683-208809-0bzxlS24Jr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219683-208809@https.bugzilla.kernel.org/>
References: <bug-219683-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219683

--- Comment #2 from Pierre Juhen (pierre.juhen@orange.fr) ---
Analog error debated here :=20

https://forum.manjaro.org/t/suggestions-for-a-recently-broken-webcam/172105

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

