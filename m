Return-Path: <linux-usb+bounces-1635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E552C7C9A02
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 18:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C43A281758
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD7EC8D6;
	Sun, 15 Oct 2023 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGtYcLiM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF05B66E
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 16:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA05C433C8;
	Sun, 15 Oct 2023 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697387059;
	bh=8f63CAYHxOyikBRDn8akU9kedgvalA/IKL0Ho+o41rc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BGtYcLiMjxfVcouo+H15PuX0f475+FDz7Ztt0t/O5gHAmxCW1aEf1aQpgIoAEkYMz
	 3D3Ao0QqCtDMGJ8I/6yzUOcpPLiEQheSTYWePrWAOX5vdwXCCSVMtExkAoCKhZfsxC
	 TmIs//O0AqAl4KtP+sSFLI66coXDehpOfbfsIqydo5HprUebjs05F9S/VeRFs5kztx
	 cv+AzklJjf0FuTAaGMSIZiKit/tN4Bw/8A+S5Nz7Mn0DVllVXH7gNjsJuTHhvI173U
	 SX8gC+stFSP0Djsg2cbRljmsDKtgoODU705v7Libd2u9p/kwg8yZDbLb9cBeczFHGR
	 k11QxkiFw+Gjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA671C39563;
	Sun, 15 Oct 2023 16:24:19 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt fixes for 6.6-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZSwEwMBjyYyiT9Tz@kroah.com>
References: <ZSwEwMBjyYyiT9Tz@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZSwEwMBjyYyiT9Tz@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc6
X-PR-Tracked-Commit-Id: c9ca8de2eb15f9da24113e652980c61f95a47530
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11d3f72613957cba0783938a1ceddffe7dbbf5a1
Message-Id: <169738705982.6658.10473164280196112900.pr-tracker-bot@kernel.org>
Date: Sun, 15 Oct 2023 16:24:19 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 15 Oct 2023 17:26:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11d3f72613957cba0783938a1ceddffe7dbbf5a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

