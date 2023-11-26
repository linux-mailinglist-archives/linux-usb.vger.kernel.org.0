Return-Path: <linux-usb+bounces-3318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1C7F90EF
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 03:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4CD5B20FB0
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 02:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFA81398;
	Sun, 26 Nov 2023 02:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiyYk3u6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6AA7E
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 02:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AE2C433C7;
	Sun, 26 Nov 2023 02:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700965705;
	bh=u61T+JQ8kZ7n3lD3cBPLroWyDJeD5T1giCodUv0LMRM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HiyYk3u6J5SinV5bz/CpdXNhuqdaWilzJjhzjf0eXF8WSC7ZPUtDmtwBgtf8RbvBZ
	 ViIKuuooSwwtK1gKL1c20JXDp/XAVBlmOgh7MrIOH4vGYkoYGGzfWoSSHMy01yCYQG
	 Mw81+lNIHQNX2LDgYVZEl/nGK3S8aquo+5E3OPjk3szJ67T0erIiVqALix/M59EXzw
	 Zk5WEc03ENz5VWC2Zh5L99NV7b4u0Ffr2AsBSb0JVpSqXovHvlCIhv9QGAIUKcxnDR
	 LIs6HphPl6yAw4j+UtIocg9YTCYL+J1sQK61NPugiombnMP68JlrWXggJ8LsJHfSF9
	 SQbZ6U+GshMTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEC2CEAA958;
	Sun, 26 Nov 2023 02:28:25 +0000 (UTC)
Subject: Re: [GIT PULL] USB/PHY/Thunderbolt driver fixes for 6.7-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZWJQOw3VcmTOB62a@kroah.com>
References: <ZWJQOw3VcmTOB62a@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZWJQOw3VcmTOB62a@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc3
X-PR-Tracked-Commit-Id: cb9a830e871779b4f9b8d5f76a2abf24915cd007
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 090472ed9c922e699dc61dd601a9b376a64f4390
Message-Id: <170096570570.17835.11926136154771545086.pr-tracker-bot@kernel.org>
Date: Sun, 26 Nov 2023 02:28:25 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 25 Nov 2023 19:51:23 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/090472ed9c922e699dc61dd601a9b376a64f4390

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

