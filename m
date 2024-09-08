Return-Path: <linux-usb+bounces-14839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E86179708E1
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 19:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172FC1C20B6C
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 17:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65470175D47;
	Sun,  8 Sep 2024 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFOAvR88"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC0535D8;
	Sun,  8 Sep 2024 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725815843; cv=none; b=EweB0OJFXb3SACqS3u5gTSWLwupqb5z5iYTSf3mTWytMGjGwSQ91GszKzHm8dJTYC4jvlKUfYnR8BJGlhsMMdzgXh8UjhluZGgqQTVCKigFrRLhl4f2lif1xzCArxLAcLcSq73Yv3IxirHcUQxtJrXKXumjfmr4DdKNFH4YlAIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725815843; c=relaxed/simple;
	bh=uPpvTTxcBc/nZRx5WCbV4GYWTcujKt39sdy1KaJcQRU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PhvtZQi5Vs3B1s+bJV7Q3OzyIPV2/kHp6VbISZ3TX81l9rN4ehf+yhZ/xGDwwq73WTq2U0vrSeTlthlUmo2I1brBVAqlA7PpplwAz4dZPIBTR8npWxzPiB6DIgo3r2ZxfAPr0GHdxfTN2T5A0oBhK/gBDkEG7uQHq/897fYLDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFOAvR88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DB8C4CEC5;
	Sun,  8 Sep 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725815842;
	bh=uPpvTTxcBc/nZRx5WCbV4GYWTcujKt39sdy1KaJcQRU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cFOAvR884g8x+IOOv5SeyySQaHtXLFtubwvM9cU4IbZ3Z4GTj19mvDU3ZgVyxPdTN
	 UUqz9RFc3dzg7PWhHESF2UNBlZ+hjszBK7tj5WQMPrLJxRv0ev+0Zg3wPadbgvhwre
	 QiQ9v+jN/rvn7xKqXrgJuU9txbKPCgMLn+vT5DkW/VGb2KbFBQjxYKqLilYJ2CJc8F
	 PoxxM35DIVOXJP5FpmG45uIjgHPg1kwk0p+qk07H7irqEeThKLpp0X4sOWvv/0vsk2
	 5KUw468SMMp5FSMeYsIoh/em+4QRoqoBdISroZG3iNgQKjam1ZZuuNk6XpC4AbIHJy
	 hq6ZVBRJDPiVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB15D3805D82;
	Sun,  8 Sep 2024 17:17:24 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zt1W7_sJsYEfHDLu@kroah.com>
References: <Zt1W7_sJsYEfHDLu@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zt1W7_sJsYEfHDLu@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.11-rc7
X-PR-Tracked-Commit-Id: 87eb3cb4ec619299cd5572e1d5eb68aef4074ac2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51c4d5f10da4434d63790a679f54e68abc7170e7
Message-Id: <172581584339.2926424.15484863288024218338.pr-tracker-bot@kernel.org>
Date: Sun, 08 Sep 2024 17:17:23 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 8 Sep 2024 09:49:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51c4d5f10da4434d63790a679f54e68abc7170e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

