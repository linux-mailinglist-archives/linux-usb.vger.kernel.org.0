Return-Path: <linux-usb+bounces-14132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157A95F968
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 21:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E986283D5D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 19:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAC41990CD;
	Mon, 26 Aug 2024 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwZmj8lp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24F135A79
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699242; cv=none; b=hJBbOecYGNxsLC+Zh1XFq3aA7SEKsV+XfQhnrvnW4ppgcIHTEf7OVudVbjQ0JkoXq8GOl2tIPijnEDbWP0+v7hkRXj94aZ83U+vlzHjnaCeTaEIAxntg2SnpiBM3TRlkKAOZBUDmSaPAlGkLW89TsGeYsDpNhnJBYXvMzukxO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699242; c=relaxed/simple;
	bh=dO0RXQdD2zqcSr7/ik4aWjeLq5aWPAdnhMPlB1Ruay8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cDTonE5/7qiESTpDx4AmkhYWBZZQIcgVU/1dkGJLl/fOhmlVdyK5SlTPQarVg1R8ZjnSy5YqmXAgpOI2CzyUg+JrlYEBEQmohiOUIWott+p5x4mdlV214ssQ+KPlAtN3x2X62LKWywZqg+kuo5gvSgMqnZWgQZq0fsElyOkEnHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwZmj8lp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E43D0C8B7A4
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724699241;
	bh=dO0RXQdD2zqcSr7/ik4aWjeLq5aWPAdnhMPlB1Ruay8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pwZmj8lp+PA7IL9jI3DSy+OGR33zXGEnN30G98WVV4BW8KWQ39B7YpRt7hZjlEFTU
	 XcO2QVntDF9hyMipmJf2iU6nNuG43Ta2FaQg9GAPwDxix+9qRI4BnlRhvsyjjmZWzM
	 snIJRqq9NjKG70vHINfqxwuba0fJJ1UV5Z6eJwTRfV8hi65Psl8tWWFvJu5QXKSJFT
	 U56r263lFxyfs24kpQ0pBnx3l71dbOxKIofk47mJV3QB3ZK4BDenX7f0m7bhvOMSPo
	 m3uAguNzjrYrZShOYXYry05FJTt9krDUVCmFNTF0GicJW5s7ecvs4JYkGuSkJ9yMSp
	 tTzlO7wVU8Nug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE73FC53B7E; Mon, 26 Aug 2024 19:07:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 19:07:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-ux4FT6wXYo@https.bugzilla.kernel.org/>
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

--- Comment #6 from Adam Williamson (adamw@happyassassin.net) ---
Created attachment 306782
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306782&action=3Dedit
journal from a 6.10.6 boot where the bug doesn't happen

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

