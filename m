Return-Path: <linux-usb+bounces-19228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D1A0AC59
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 23:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9615D3A03E7
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 22:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF771C232D;
	Sun, 12 Jan 2025 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bauZGHZs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675F1C1F1D;
	Sun, 12 Jan 2025 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736721396; cv=none; b=U10+Md1kdSFX3lXxuk2g7/lRPEg2/1mRkCiki7FNOdmt/Crry0+3ufb/Ru3iJLg0IXOhREKZzjjJAtHVAuf/16SWf+NXUaYSa9w8KXEdRMgCeLgZ5eD2UMmMHGg1VV68FMqP/+VpiNMHam1+FVyN3ML4bGQZQTqJxoPP2HS5RtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736721396; c=relaxed/simple;
	bh=dXEmX1rHgN551GhNBUa3tUCEndb+k4+do3wfHM5fU98=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nSOttUFE8nTutzlWhz1Kgqf5Yvb1lpxlZSfCYFldbCV43I6Lwk9SPV6Ns6gb/+B+63Oh8T9Qw/Y+iZDEsQNBqfhdzonRNmVVlBwoQTcPdOrK3o0BgoxHI3j34gc0C8OIcd02Xlx88MAXeI7HflpSlahRrvKyvEvZ+eYipzVxFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bauZGHZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116E1C4CEDF;
	Sun, 12 Jan 2025 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736721396;
	bh=dXEmX1rHgN551GhNBUa3tUCEndb+k4+do3wfHM5fU98=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bauZGHZsBOwXlnyZI2MCwcwDDSitDZYzRVUZNCw14D4SUwachLNQpFxuQWnXo6tcN
	 kPNGhHnqq6S+i+FoRban0PfkOWAipc4esYrDreTWP/UfF+QC/zLN1MynrXXitHbDyS
	 lVGynCLRZySG3CHObTVIUrzqNiU52N1jE2PbBLkXIbqhR2vdoOeHxo+2+23VigHpyC
	 If+zMYgAzwdlWSWYtAaGnRZM5KlRm5bdmaVB1ESv0twsf/1TLJ9bVjZZ+SPPde0vsU
	 Ofwjg8KyfKoC0cJU9gqQNMudVmDOeq42hpnL8mPzYbeaWccA/WKfb0G8t4QansN0dq
	 XrnXQlno04x6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE63380AA5C;
	Sun, 12 Jan 2025 22:36:59 +0000 (UTC)
Subject: Re: [GIT PULL] USB fixes for 6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z4PMEd1UC6-ew5wY@kroah.com>
References: <Z4PMEd1UC6-ew5wY@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z4PMEd1UC6-ew5wY@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc7
X-PR-Tracked-Commit-Id: f3149ed697dd0c4fc1d696fef78129fa2fe4ca12
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 196856db7c792b0f4a8213e29dbddf9acbb1e910
Message-Id: <173672141840.2663698.10034075451318167696.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jan 2025 22:36:58 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Jan 2025 15:05:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/196856db7c792b0f4a8213e29dbddf9acbb1e910

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

