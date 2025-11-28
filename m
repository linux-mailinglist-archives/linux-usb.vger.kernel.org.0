Return-Path: <linux-usb+bounces-31044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318CC92DAB
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 18:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17143ADD71
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 17:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF86F33373C;
	Fri, 28 Nov 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVMTB1MC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41633345F;
	Fri, 28 Nov 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352677; cv=none; b=WpjpwWmiwtLGt+dIh+h4UEI9UgDmPj1i7pLGfX4qDXodi6sc7/02SsyrEm+VlJ50kndUfGoq6jHLheJWTnem2AR8xVeE8+2SZJ3cRo/r46EE6JbJdkwVVatserHbCQoDkpHMCyWB7EeCm1WIS0o7agSBWuXaEMjguNbSAlriSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352677; c=relaxed/simple;
	bh=CxrJlZZq/oTHMrJpMqKsSc2h5valWwsDftNQ5U/DH7E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SPieJFFqLZlF5GVCbg0g6lAOeqHdrN/qDETe6GTn+72hcKFX4m2yxXzzvxWuJEZz+FmVAUjYJKFglo6s6PNXWf1GZCTRSJ1r4x8CmBrqj6chrjblWMNsOTgZXU7KZx+MRXW55KoguGj0NWXmRTGLJjBm8vnDpkyl6+NqBP7AbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVMTB1MC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2289CC4CEFB;
	Fri, 28 Nov 2025 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764352677;
	bh=CxrJlZZq/oTHMrJpMqKsSc2h5valWwsDftNQ5U/DH7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qVMTB1MCnOxUMgqPhTsb71ESTeE/eAA3wezp4jb5nxNALy+zqPS8pr0jlFmG9TMl+
	 Kx7gGzS3aJ8KCc4AO8rc9HbwDGkW5KTQ6LYQg7EirGcqIRWRdOlIN8TEyiMU43dWJ+
	 vj6qGNCtlptCVrSiPVvuzYw12fqYmGNOVrrCXRId8zOY3gR+FZjc80DzdzWf4kQyr/
	 o7gNuS/9yfbad5IffysQp9UhemtD/j1VkT6oKTdlVixEY8+d4wK0jZnsoESNjyF+Nb
	 yTsY3chLhBJkrc2FqQJjzJ7ne28q0axvWbxXMoPP4iQ0z/yRoylStvAnfOoEwVegFE
	 qatFn9rhNCCPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B6913806929;
	Fri, 28 Nov 2025 17:55:00 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver fixes for 6.18-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <aSnO91JZkop49hKI@kroah.com>
References: <aSnO91JZkop49hKI@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aSnO91JZkop49hKI@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.18-rc8
X-PR-Tracked-Commit-Id: 74851fbb6d647304f8a7dc491434d3a335ef4b8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d324e5159d9e6a1e6678007ce3f24e569650db6
Message-Id: <176435249892.746710.15414349024320882875.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 17:54:58 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Nov 2025 17:33:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.18-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d324e5159d9e6a1e6678007ce3f24e569650db6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

