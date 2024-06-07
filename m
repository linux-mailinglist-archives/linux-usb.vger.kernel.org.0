Return-Path: <linux-usb+bounces-10998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9178FF97F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 03:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF887286F74
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 01:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91D1E554;
	Fri,  7 Jun 2024 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNQ1QfZ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79D8F5C;
	Fri,  7 Jun 2024 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717722628; cv=none; b=sK9DI/kXp1mmVDkJt0cwR8QDlOsUTk8ZeLUqsuGKYMrdtsfBQfh6XRh/gVAK98flmrQ5p+EROG6UH1PKdfAFxJtelus1WgtBIEAQFPAv0FubC/VbVDw1f/Q6dcBiyCtyfZEjvvKta1loiZcX3LPJ4+1qW2D+u1/A00R4E3e1AbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717722628; c=relaxed/simple;
	bh=umfdotGMRPJkROj3G3nY3qSksKWVh1Z2ZgINgnCnVR4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YVuXN9tkktzmzqQe+5/2TivYZBR97yuqMcmEt1Mb9+HtBRq6RI3Jyk8Qm0jgfBpWvzGLLIaVAV0KLNMKGRt40aQFsKe96tIu9/IMJrDtRUhXi9qNd7djVq6rVDPtVbAInfbrhfjdayBbb24xq5wkRmTDsiwUYp95yHMKdQiYR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNQ1QfZ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA258C4AF0B;
	Fri,  7 Jun 2024 01:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717722627;
	bh=umfdotGMRPJkROj3G3nY3qSksKWVh1Z2ZgINgnCnVR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hNQ1QfZ4c0vLbAlfGpmIFwElomCbrQSKjkKzT5SJYjuWoPfwDQh0lHJk5HxjkXFw2
	 cuvnJCuxj3letrHK5Wd1x61xE+mpmFad2iku6UONUPUiaEH68YQ0dfVYDbWfBd1K0T
	 5GwWMwLtnXTWh+UPDT8iTR3soEogOd/kR3TXiZfAT3l2tV/yjxQbPexWiSDYq9YsJO
	 1B2jTvNORqVD7Ev97wgc9V7A/XEXm9VfaPNSxFobx0w/3a3Bvh84OJmp7GzdcwqhFX
	 Frlf1FG6WjbFA/HvFOo4u6f3IM6k0UTZa8Xfif/fJoOgfRue6lkLSmskYuKWMjjWNm
	 oBP5Hwz7Io2rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC463C54BB2;
	Fri,  7 Jun 2024 01:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] r8152: Set NET_ADDR_STOLEN if using passthru MAC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171772262783.19610.15082534688583179924.git-patchwork-notify@kernel.org>
Date: Fri, 07 Jun 2024 01:10:27 +0000
References: <20240605153340.25694-1-gmazyland@gmail.com>
In-Reply-To: <20240605153340.25694-1-gmazyland@gmail.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 grundler@chromium.org, dianders@chromium.org, hayeswang@realtek.com,
 hkallweit1@gmail.com, andrew@lunn.ch

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  5 Jun 2024 17:33:40 +0200 you wrote:
> Some docks support MAC pass-through - MAC address
> is taken from another device.
> 
> Driver should indicate that with NET_ADDR_STOLEN flag.
> 
> This should help to avoid collisions if network interface
> names are generated with MAC policy.
> 
> [...]

Here is the summary with links:
  - r8152: Set NET_ADDR_STOLEN if using passthru MAC
    https://git.kernel.org/netdev/net-next/c/cb6cf0820f22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



