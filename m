Return-Path: <linux-usb+bounces-2048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65897D1EC7
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 19:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76CB1C20928
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 17:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EE81EA74;
	Sat, 21 Oct 2023 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mavmawqi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D41E536
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 17:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40669C433C7;
	Sat, 21 Oct 2023 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697911028;
	bh=T97bqFs+IuRhOxSDdeYpE85IBYBtHlXC3rl28pbzsLI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mavmawqifxHakA5eE22aXf3KJ7h3L9OritxDJ5JeUPSf+mwJ2SbXbv7CNP7uHRazs
	 2toxqCl3ESQv+EvW8iotuTYO5wmczA0NiscSTFzhtVfGdK755WPODPJu5dhlyWesiG
	 Lz1mOMf0iyGKTWdWoTCw6MwdEqSZ5bG77rBq9Y4JSCppxYk25Y4ZkAfedggNC4KBcm
	 jKY/CPN776/D9bt9vqauJA7LSvycczNnzU5qh9QoKCGZotDVmYbrW1ny+Lqv5FRlg2
	 dbJYfZmM/VlEnZaZK8Np/FjgSlX0BqH5daXJrLyRd7gP5slRriVK9R9PxfM6ioBBOO
	 YQqNuL98O+AMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E6A8C04DD9;
	Sat, 21 Oct 2023 17:57:08 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt fixes for 6.6-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZTOpf59MXETPspHM@kroah.com>
References: <ZTOpf59MXETPspHM@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZTOpf59MXETPspHM@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc7
X-PR-Tracked-Commit-Id: 21a68b69f7c16f026bd2e51884520aaf594977cb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfd4704c82d9041cdd611d5c577f1e57ebf91537
Message-Id: <169791102817.24251.15767400601247092722.pr-tracker-bot@kernel.org>
Date: Sat, 21 Oct 2023 17:57:08 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Oct 2023 12:35:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfd4704c82d9041cdd611d5c577f1e57ebf91537

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

