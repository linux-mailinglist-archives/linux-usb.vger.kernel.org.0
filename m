Return-Path: <linux-usb+bounces-19796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB5A202D6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6301883EDF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 01:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C4A14658B;
	Tue, 28 Jan 2025 01:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpY8JE76"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E6175AB;
	Tue, 28 Jan 2025 01:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738026417; cv=none; b=WMHu+ouVxK6VhfJWDqkma17xtVk6ocXsIHSRlFqsJErs2GY9CiOx0IEeAU98ktm2ylYu9DgVtxEZjALsix9Juibqpjfsl63Fpv10WB7talTZ9UY0Sp2Udhk9Ge5nlnGqdXtoWISodCoFLvS2y3tYaNz/NoSOZq9fV590YxaORDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738026417; c=relaxed/simple;
	bh=mCJgtXjHBxTFsHH2HdyU+XNj5idF09Bhjtri8hs6ric=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TxNyi++7rHfBeJT5AcCKXpE1NX+90zmMgoz256AXspEGWwEsc4hHByMEyz2vsbGpeBjfzKkvh4CE+/3xLRX0OB0tqxQs9CuOy8lSJcQmw3d7WWFrf2LupvG0aBSxLvopsiI+7JIerb8GW1AQia3CFNSP3rKXC1y2hoQ0TVyeM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpY8JE76; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2D1C4CED2;
	Tue, 28 Jan 2025 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738026417;
	bh=mCJgtXjHBxTFsHH2HdyU+XNj5idF09Bhjtri8hs6ric=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OpY8JE76/1fz5D/VMfoTOjZX3fsxrUMLlKJ8ByAwSXTNPNiS5sq9L6x5rJTVyUDe+
	 M1Gjf4/pIZOuFTIhT3erJfxdlGN3GSrVM8Zsuh0DQc5oVPWg8Makew215vO0AMyFI7
	 i8pbITZIoI2bRPo75uoWniHATVF/RzbP++URtAiMhkJjdHtOPlp0IHEOk9+6Nzn1Sc
	 VNOIcjDPLoJJtRS0ciZsz95kyjGHQS/J1VbhzDbrRNP6wYJMzMAVhxwTBgP3GAl3rT
	 b6T774f/vXyZgtniG5yhwrzqlrdMAAdl+QQsQSBdRLHeoGX4ic2qrpqTveLzogrRCd
	 Pz2Arnh9N9OPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADF6380AA63;
	Tue, 28 Jan 2025 01:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt driver updates for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5fJQw63-jHgfTqD@kroah.com>
References: <Z5fJQw63-jHgfTqD@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5fJQw63-jHgfTqD@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.14-rc1
X-PR-Tracked-Commit-Id: 70cd0576aa39c55aabd227851cba0c601e811fb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc8b10fa70682218c2a318fc44f71f3175a23cc0
Message-Id: <173802644253.3281647.6719365821266570015.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 01:07:22 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Jan 2025 18:58:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc8b10fa70682218c2a318fc44f71f3175a23cc0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

