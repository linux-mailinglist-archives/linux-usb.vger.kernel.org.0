Return-Path: <linux-usb+bounces-3942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41380B66E
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 22:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1EDEB20C6D
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 21:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D671CF83;
	Sat,  9 Dec 2023 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDBaI345"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B341DA2B
	for <linux-usb@vger.kernel.org>; Sat,  9 Dec 2023 21:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25E21C433C7;
	Sat,  9 Dec 2023 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702156277;
	bh=h8buZ2IBiA++XSGduzIdIJoihRJx+y2kdU3W2P8GguI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YDBaI345UQg4np3jvtgPJxE/AazUEEYWzDeQD15OVAnecCnY0QxhSXfmthJOi5Yj6
	 S19m/8v5GMAgzh30F8iamQ0oVQspa32POivNhRXWuWnZm3vfTJRoTXKpeQZ0p0qoo4
	 0+cuiE6TmNhkZflho1JhIGuE7EKCg8kyzSAXaazeD9j+bALItkztEILnqmsk7lGw2B
	 7ReVwW3q2FuQdHGCuHdX3owWPsPG1TUCDrNxhAN/6kGLzcOEZbmMBuynClWOhx0uzw
	 mm0CLnpU5xaQsN1PYeq+ToDZmhffudWstM+45JFr0jvpZLGzKuOHsGcdqqxod4VOuo
	 FbzNU7ZXfxS0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1100BC04DD9;
	Sat,  9 Dec 2023 21:11:17 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZXRxx0o07FDnsRhN@kroah.com>
References: <ZXRxx0o07FDnsRhN@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZXRxx0o07FDnsRhN@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc5
X-PR-Tracked-Commit-Id: 61890dc28f7d9e9aac8a9471302613824c22fae4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
Message-Id: <170215627706.20711.15799502446513904618.pr-tracker-bot@kernel.org>
Date: Sat, 09 Dec 2023 21:11:17 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 9 Dec 2023 14:55:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

