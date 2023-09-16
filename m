Return-Path: <linux-usb+bounces-259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E17947A3211
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 21:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31EB1C208E5
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 19:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D7B1BDF4;
	Sat, 16 Sep 2023 19:00:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1E13ACC
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 19:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 187F5C43395;
	Sat, 16 Sep 2023 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694890816;
	bh=sIp41fVoPgffH1qOcV9gSsBIhctjbuX3pmGBSxP0XIo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=d64wwx1aXRLG5w1SojYtzlxNLJp4kffm5ZlfosdatZ2HfYXTnhlND7gPaQFk1LnpK
	 ZXaIFXBoB9zkT1i/MlZ2TqY51Yq5kY6DiL4xBOdgreoHq2YpKg/VBKu33qvUSLWBfu
	 FtNShKq6tgi2yIrCwowSSWKWy4Jyem79fX+uAF4FulyG9PqBfM2diIVQC1/xG0i2xB
	 ZASddr3oZ+736+Ntfjw0qhCQmAt5BGbPTC46AKc6W6F1jA5KPg2RPM3yM/kBJDZd1+
	 flAMDf7ZOtP0HnfX0FQsGlN390+nNsTy+Ru7QlThGQgfFyC1UxNyF0QG/yemppL+SA
	 E9w51YBYLA5Cw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00350E26884;
	Sat, 16 Sep 2023 19:00:16 +0000 (UTC)
Subject: Re: [GIT PULL] USB fix for 6.6-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZQWYu7xf_8KTWXFu@kroah.com>
References: <ZQWYu7xf_8KTWXFu@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZQWYu7xf_8KTWXFu@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc2
X-PR-Tracked-Commit-Id: f26a679ed799deef9e2934a6b60b8f38bdbf4921
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cce67b6bedd3e28939446508ebd94d91305b8ace
Message-Id: <169489081599.3998.8454913923088827295.pr-tracker-bot@kernel.org>
Date: Sat, 16 Sep 2023 19:00:15 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 16 Sep 2023 13:59:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cce67b6bedd3e28939446508ebd94d91305b8ace

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

