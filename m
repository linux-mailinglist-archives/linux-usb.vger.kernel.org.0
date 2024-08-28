Return-Path: <linux-usb+bounces-14252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B779630DE
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 21:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8CB1C22270
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A964E1A76BD;
	Wed, 28 Aug 2024 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdkzr9gN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A02868B
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872730; cv=none; b=RJHbEDza8rSivk+qhjTxTK8TuJLCfr5caxF7PGszBixsE0ZgLy0GUajW3qxI39hhTrEd0HA5KOQOjREGRWvKSknovmK624wUn8OOXwx8DNNX+omz6ar79Qsic4B3+Vaq283X+WxplPqJSURmG7XrFNsTgh6erO/hmVG9ZGjsM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872730; c=relaxed/simple;
	bh=vXJQFiC//+0M6WgxaZeeEScTTNU1tf6n9YC3vfoc3x8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bpYeGnqJflxF6ZVVKRWTtwYuSMGj70PN7xj/rwb9XzWyOtlPqikkvKdt0uWS+3vDNZfmgVb9qBwE7W8OiumKzUZekKqgY3unfpuLLRbwh/oYYa05jyQsPATX++ZTMsbJ75oV3tBUe2AA97KFpHf3VSLGUPiDWzznSRPKWJieMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdkzr9gN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C24F1C4CEC2
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724872729;
	bh=vXJQFiC//+0M6WgxaZeeEScTTNU1tf6n9YC3vfoc3x8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sdkzr9gNKs4Avam8OpKGkZ+qi+HoYr+w3fuyYn0/lmd9pj71RZxINqsUGlnfHQxWZ
	 hMwBlUMGl7kzbLBqA77+/B/TY3gkn8tv6S9CAwh0Q6/hqC5bpSwOdn/zlEPm7UBfl3
	 OIMb0y8ChnX/mweukEueeYgpFj3FClHKHQDp8TLEH36ckHzrpSbsQAo1Mc6LlrYL94
	 xw838IXsZf8BalLW8Ny5YBFKNGT7NjnQTuxsjIkcpUiSWLgHgAARzVUpQJjt6OnTvt
	 zacwSMUx+QsRSna6QQgHmgoKTz/P8TNashzPvJEAIYOJAZVJk1N86I7OrpSbGJxAF6
	 BBqV7U6RmSzLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF818C53BC1; Wed, 28 Aug 2024 19:18:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 19:18:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-N8vQCfbaag@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #24 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
Created attachment 306787
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306787&action=3Dedit
[unrelated] Linux 6.11-rc5+ messages (output of `dmesg`)

(In reply to Adam Williamson from comment #23)
> Paul: do you see the DMAR fault status log messages that I and Markus see?

No, there are *no* such fault status messages.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

