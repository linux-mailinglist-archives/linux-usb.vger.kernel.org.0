Return-Path: <linux-usb+bounces-31792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B3CE5C03
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 03:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE88530090BD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 02:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D37D26056C;
	Mon, 29 Dec 2025 02:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2PS1//o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0052264CD;
	Mon, 29 Dec 2025 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975869; cv=none; b=pd/OkKNdNG4P3K0zi+MGS5I6+RYNCoAZiSk/L+qniFck1gwgVwqy2kuOmAxnswaJhC2PYLwiqk+1c2YHGrBW9lfoM+buv9D+6YIk+Prbq7/Jluov5vba/ME/G5veRQjwl9ANaq8sXhYtY86i7aeFqSxqXWOCmKINIzneOGe5Zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975869; c=relaxed/simple;
	bh=G8V57KW/OWgYIMQZZScfbdihgGY+zXGbwtf4F+TqXb0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uFoyYU7SJqwyOr2HQ0GHNvdIYIDCoxz+wOavSbcHkCvureUI6IM2bKURK/J0PhEx+eFvZ5O+vdBqZailrLIFcZR8ZXavYfFRxNp6nOuJsnNQamhe9+utSQvah/d/pTapdbPlVhZap41mVvdIfYhTyXPgnQEKlixAf3zlPOj051M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2PS1//o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC3C4CEFB;
	Mon, 29 Dec 2025 02:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766975868;
	bh=G8V57KW/OWgYIMQZZScfbdihgGY+zXGbwtf4F+TqXb0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k2PS1//oSIZfpvw057Ei/R3z4ld4OrEh1YCt6fmjxVPr81MoO5CKlGNmPaByXhWzD
	 z4P+QkD/g6sRQ+YT2HmTMiWozRxaauq0wEXkDwL5izBTHetgsMxxgGP19LPsvRHEsR
	 jQ3dG15IW/elvvfcU89A+54stFDEU+bATRGW+gvlRY8xhUfR4jB42MWG9E0tLdk6kI
	 1ppz3AYocW1oe/kg9VdddTcmXTnu29KR/nOt38wIzqvNNYGcof3j9Nh3tDT/7vC0Ba
	 x1qX7IcTUmt1hKI0sjXAdzSXkmaibgYCcSY1iWwixPxTk/5NYudrzS58R49TO8PKYf
	 xY17vuTQ9ciPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 789493808200;
	Mon, 29 Dec 2025 02:34:32 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aVEmLOWNDg7eHH5L@kroah.com>
References: <aVEmLOWNDg7eHH5L@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <aVEmLOWNDg7eHH5L@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc3
X-PR-Tracked-Commit-Id: 22201800f198ad33c225e5ce2f0f254df828d01b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c875a6c3246713a018d8b7b143deb3ebaeecaf1c
Message-Id: <176697567093.2397610.15148949798624177605.pr-tracker-bot@kernel.org>
Date: Mon, 29 Dec 2025 02:34:30 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 28 Dec 2025 13:44:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c875a6c3246713a018d8b7b143deb3ebaeecaf1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

