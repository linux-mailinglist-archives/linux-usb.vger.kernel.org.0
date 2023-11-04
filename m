Return-Path: <linux-usb+bounces-2531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F87E0D3B
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 03:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E1A1F2216D
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 02:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A803D187F;
	Sat,  4 Nov 2023 02:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HauFGIFn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07417CE
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BC4C433C7;
	Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699063826;
	bh=uWDvqXMY70eK2LgORMSCL99YgEROtmXqZhegNCFnBbI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HauFGIFnisOpH02CkzEHyHhJl61I2zEWx4UAda0+U1EQw67yYqgIhlShVJZuu8ZZe
	 TeaeyKbiwdCG5fbwtPQOxkh2nQmXtChbFsQN5Qv8P5I6sOGytkULcuwEjusNxcRcrd
	 vqjmcBt3UhetFeUdZkaMtTyacn0UHlwwmM7HO3ANW/vz3TtWR+T0OSFRTRqBmvmO8y
	 VD59yulb+DLzgObPCduLI2VVMvLmzq0RsUf4haJiOLpv6o6TbEqTKkbRkWTfGPPH7+
	 Eu/FKCdyhJfeVbbnji6TxVF5sKgbH1hsfkjirMTkQFitLaUZeDVqjid7jK47PToAG3
	 dZj2VVQNUZ9fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8480CEAB08A;
	Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt changes for 6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZUTiWrNrErlNa4Hk@kroah.com>
References: <ZUTiWrNrErlNa4Hk@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZUTiWrNrErlNa4Hk@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc1
X-PR-Tracked-Commit-Id: c70793fb7632a153862ee9060e6d48131469a29c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c40c1c6adab90ee4660caf03722b3a3ec67767b
Message-Id: <169906382653.26291.15101406422947685153.pr-tracker-bot@kernel.org>
Date: Sat, 04 Nov 2023 02:10:26 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 3 Nov 2023 13:06:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c40c1c6adab90ee4660caf03722b3a3ec67767b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

