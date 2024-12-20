Return-Path: <linux-usb+bounces-18715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8909F9A4D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 20:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32C3F7A402B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 19:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F11226194;
	Fri, 20 Dec 2024 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHFKVdPU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2932210D3;
	Fri, 20 Dec 2024 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722380; cv=none; b=lnsziQRnkBETwvZwqravfr0pISh54DCbDaOjzxrAETAN8geLHM9HCTAlih0XCuFbQNMuEksy0VnscJQiS6q0I2Bp1BagnwjssV6x5ZG/L9oMHM3E47s1CFblpBhGymjV43yjOLwOgDbbvBZ8ElJ06drac91kwXvxNKs0g4vNoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722380; c=relaxed/simple;
	bh=HanUVYFZHFKy4sCME0qHpw9fy4XlcymszfwaXzm1IWk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=G2dSCHwbe4jU/99Is5ARnSGMMxSJcWgZb/SwdrGmkdGx3cueM4K9P/wxqdI6CTpFS7Re5CdyiX++A5Jn68E2jy1pnDeCyToxJUpKiEll0ZIahFRbN+nkfv4Lj3Q9H8YK1QthnDxuH+wgOXsTD7hOxD4pzRsNod8ObwSPuwTHuSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHFKVdPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B95C4CECD;
	Fri, 20 Dec 2024 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734722379;
	bh=HanUVYFZHFKy4sCME0qHpw9fy4XlcymszfwaXzm1IWk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mHFKVdPUise9M82+DYxzKBElIKhysPNPv8NCYMPD4Yiw2b2S1IWzbvM67KBHeVvcA
	 W/tldKVKDXfewQp28gdS79K90dIeGbKZ8JCa15AwlSYtPH5KZFdhZG0cdhNWAuRC7v
	 SfymwJgBT7n+tO3on42GuQlh2dfd2o1FasTKhHglSl4q0HAFlEnWWcTY1HVS8f/jVT
	 GYV1d+Iu7iGgVpvpJipgy3WWFEb/XSWo3iQcxok2GGZoxN6SB2gAau64yz4wFasnzH
	 Dto7IImBfX57gcBOj0V8+9tPQrKXjH1s9UecM+utlRrkmi1l8FUk3OZHfqbqOKcvSk
	 SXk1Vk2avB1UA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C3DE03806656;
	Fri, 20 Dec 2024 19:19:58 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt fixes for 6.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z2WO42XdnBrYmdmN@kroah.com>
References: <Z2WO42XdnBrYmdmN@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z2WO42XdnBrYmdmN@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc4
X-PR-Tracked-Commit-Id: 1b62f3cb74d2965e8f96f20241b1fe85017aa3e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9b8ffafd20ad21357a789cc58ffaa162b3ad074
Message-Id: <173472239749.2997869.14802485164211205555.pr-tracker-bot@kernel.org>
Date: Fri, 20 Dec 2024 19:19:57 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Dec 2024 16:36:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9b8ffafd20ad21357a789cc58ffaa162b3ad074

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

