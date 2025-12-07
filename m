Return-Path: <linux-usb+bounces-31230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82684CAB0B1
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 04:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D971630A4B0D
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 03:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9810927E7DA;
	Sun,  7 Dec 2025 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBRl45YY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5827CCE0;
	Sun,  7 Dec 2025 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765076612; cv=none; b=DmpZua/XTU6RvkogbBq8QCaoijTNKxy3HHPmtFPITL4W8zWdT8Mg0dRNiNogTgA9lwHFH3IOxqc9iCarmhwXnDaWOeGmPUn0dAv80OFO33l8Cr72sA2Cfliu38qlJgC4xc1ykUHVBkVcFQY1aT1Otvc9MhvcTguplkPxCpH3joA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765076612; c=relaxed/simple;
	bh=ywzWkt/FqeDMzHq/1rT0i9tPCkja+jzMMb2sXBch1wc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CrdXn1BdigRdSJjGiSTjpUzycHeHhTBLcHY4MitOCOtmWSYpcNBy4vbZJDD5bIltGtrVJETVCexUYAV4WOcB0UxGjjv7nejSid9hvQmg2MDs6zTE76J4F6KuhTREWhC4Pm7oMSqOU/3KeHfMkExBj0UKdYolYlQ0uG0e3KpbYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBRl45YY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3840C4CEF5;
	Sun,  7 Dec 2025 03:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765076611;
	bh=ywzWkt/FqeDMzHq/1rT0i9tPCkja+jzMMb2sXBch1wc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sBRl45YYY+NfmbhDoEjFUZ6SWLwJMYVRAmYdlLmZEhdGo+BLkLH2HIf9hnXZqQshg
	 Lak4lK9qQAlpoOTifzRtW7Dr366CuRk4zqvVVEnPCtb3LEFDfkq0KV+XdNaPADUtn3
	 cs4kywxXi1O9KFTtLZx2UNxu155zAzCYP8+9Ts3rMzRqY0v1i9Fu+JLEfuJPH+FdD5
	 FmaBJ1kJ/deSk3U88ktSTf7Fhuh/WlxQmP2RfVMBXELXRk2dGZltM7da7Pc0781nC1
	 WdcFwdbXvJM2I3/ENWvFZzCOccehgb5fXvpzwy+dlwtjxJlysEDKy34wNTH/zw2UHc
	 n4iHNaFRB9drQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E8A173808201;
	Sun,  7 Dec 2025 03:00:29 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTTOYMDU73pfRneS@kroah.com>
References: <aTTOYMDU73pfRneS@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTTOYMDU73pfRneS@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc1
X-PR-Tracked-Commit-Id: 2585973c7f9ee31d21e5848c996fab2521fd383d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5e9d31e79c1ce8ba948ecac74d75e9c8d2f0c87
Message-Id: <176507642869.2278937.242056244032964044.pr-tracker-bot@kernel.org>
Date: Sun, 07 Dec 2025 03:00:28 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 7 Dec 2025 09:46:24 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5e9d31e79c1ce8ba948ecac74d75e9c8d2f0c87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

