Return-Path: <linux-usb+bounces-32511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229FD3AB04
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 15:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65426312F21D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16581368294;
	Mon, 19 Jan 2026 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj8NJVep"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9034D3590D7;
	Mon, 19 Jan 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831050; cv=none; b=hhytACEz0VToQ8EMa6F5G7VHhqdNhK+KDWXsifpjfi0P2LJkgvdQf4+1E5VGja/z1tAnchuvevQ0mg20d9+xtRuUOnDH2ckgHuv3ZvhgdPtFUEm5rC8QnmzYoIgChqutpgBeXfTFWCp3PmfbHKFpohRmM2zDi20hP4cRf3nBh68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831050; c=relaxed/simple;
	bh=cRqEQ0IWmmtJNozrjNh6SpEmAdho4oA9By4c8Z2Zl5Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eUuilRfD4ZPqLVVKPpG1Bz5VLQUlQ9uKxJ6XuetHIBaIWrDwKe4HIwYFPcmvgYrAqkHOi7RnhIYA3zzkyIea2imv00YKutkSLsYcuuSMNAHzf8EzEzHRXJD51MV/iipECTc0Sc2lIpFxiZjQmPrKmj/yrseu5CU4GDe6MuIoeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj8NJVep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398E4C116C6;
	Mon, 19 Jan 2026 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831050;
	bh=cRqEQ0IWmmtJNozrjNh6SpEmAdho4oA9By4c8Z2Zl5Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fj8NJVepDmer4Xz3UZurxCo0fconNAnuT566glaBX3JLuc2rMePjhuaPqHZ6d6DWn
	 x6oHc+IfOZRlSfEz2sxU/s7rCAVzmGJf5cBTgfaQ0txTXQ/+Fe8q+4bvZlz3lNUzZa
	 UBGRX7qDlyKUt7lzOZSAadNPMrGRYvDu2/KYIq8R8F4D9rnJu5ZzhztktjFgYy8tIr
	 XsnEQFSRtMo9bsCWWkCdkZOG4vqFfcuu7utiS6EwW8ZfJAdRnaOfZfeEmzuB5SO8AA
	 5mnjdeEi1ZZDCv1LsKQ7n8qvDa3h/tFQJyJBNLg1ZnEurkvroSnBQe3XMS91RUFgNe
	 VfxJi3g2vBg8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CC293A54A38;
	Mon, 19 Jan 2026 13:54:01 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aWz4Eyh6898JjAzB@kroah.com>
References: <aWz4Eyh6898JjAzB@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <aWz4Eyh6898JjAzB@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc6
X-PR-Tracked-Commit-Id: dd83dc1249737b837ac5d57c81f2b0977c613d9f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27983960f0fb7331d3635c1f0270b794cc6b930c
Message-Id: <176883083973.1423140.16001497697810603097.pr-tracker-bot@kernel.org>
Date: Mon, 19 Jan 2026 13:53:59 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Jan 2026 16:11:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27983960f0fb7331d3635c1f0270b794cc6b930c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

