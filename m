Return-Path: <linux-usb+bounces-2809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9387E9578
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 04:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61F24280FA7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 03:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36454C2D3;
	Mon, 13 Nov 2023 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIe2hQUi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768BE8829;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED2D6C433CA;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=8sPrWkVBZnEE50gJ+2tOBc5eSx2nRKYWzZd0dYipTn0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIe2hQUiLosGgKTe2ZPyibiHwcHudmXV+vDQ7KoHr041fqmrL85ZzowTzU3EgVitk
	 bBSV5ki8yJGcMwoKav55H9AoKk7rIM4wpj1xmH+z6nmsTffjssNz5dctgwvvzSpg3T
	 2J4s2m7KlO+rEiCBhOzQoOyi0ORvSS8i/BGDqJ2N5LqfgOMecYRE4vDmgormVFofVt
	 yP+ZWpQ9FYq2TZr4WfidOY+lL4SOTkkApcZgvDBbT6ngO+X0b93Q0ORIadXHj4Lu+l
	 +mtpDL2uq9Rc2e9dsHFHU1gU9vv+Ebp7hnV3RSNLBIKbw0J5JwfC4dCEMLTFqbC1oi
	 vvbQp2/dTclaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1009E32712;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/5] Displayport Alternate Mode 2.1 Support
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583485.27851.12321002335522653508.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:54 +0000
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
In-Reply-To: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
To: Patel@codeaurora.org, Utkarsh H <utkarsh.h.patel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 heikki.krogerus@linux.intel.com, pmalani@chromium.org,
 chrome-platform@lists.linux.dev, andriy.shevchenko@linux.intel.com,
 bleung@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Tue, 19 Sep 2023 19:32:38 -0700 you wrote:
> This series enabels cable identification flow required for Displayport
> Alternate Mode 2.1 support.
> 
> Please add this series to usb-next.
> 
> Changes in v4:
> - Added [PATCH 3/5] back in this series with Reviewed-by tag from Heikki.
> 
> [...]

Here is the summary with links:
  - [v4,1/5] usb: typec: Add Displayport Alternate Mode 2.1 Support
    https://git.kernel.org/chrome-platform/c/a17fae8fc38e
  - [v4,2/5] usb: typec: Add Active or Passive cable defination to cable discover mode VDO
    https://git.kernel.org/chrome-platform/c/c365b1e1f404
  - [v4,3/5] usb: pd: Add helper macro to get Type C cable speed
    https://git.kernel.org/chrome-platform/c/f9ee6043283a
  - [v4,4/5] platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1 Support
    https://git.kernel.org/chrome-platform/c/70ca6c7312c5
  - [v4,5/5] usb: typec: intel_pmc_mux: Configure Displayport Alternate mode 2.1
    https://git.kernel.org/chrome-platform/c/6c29de68fb29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



