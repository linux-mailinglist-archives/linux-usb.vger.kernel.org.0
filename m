Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4269A77D82A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 04:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241191AbjHPCKp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 22:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241198AbjHPCKY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 22:10:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3EFC1
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 19:10:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37E9C64679
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 02:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9282FC43395;
        Wed, 16 Aug 2023 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692151822;
        bh=i9UBZP77nwo11kSF5avIYkwJ7Z2dtioOGIPL87SSzqA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Cmg8QVwcPk+CBuZJGBBMMafsnqdXcRcjZjBxzzTS03qwoEEivWLU4eQqDTZ9I+Lds
         ULeyXtbsle44xpETSX39BW/4Fbvyc1kECFCX7x43ckMQk2SAYJkm8BoWMCjJKhFMGi
         mwMRP9zqHSwtBy2Vdk/nPLEO/x0FHU58EMRVG7X22H/o2cos2fiF0h9GmBlB72HcVJ
         VnM1+04SceLfmrQwF+Qxgzqqq76B43f3cj4ZZUhmymVnmfeaLOFLybJ7mc3zkYRYME
         3+JL19o390qACnqZoznZ99luqkXVidmFzFTDp5fnuEsdf1v5PsSMwFmjmqxgUEnz7c
         6XUUAC5VhmqZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DB5FC39562;
        Wed, 16 Aug 2023 02:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: r8152: try to use a normal budget
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169215182251.21752.7218487312283712460.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Aug 2023 02:10:22 +0000
References: <20230814153521.2697982-1-kuba@kernel.org>
In-Reply-To: <20230814153521.2697982-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, mario.limonciello@amd.com,
        hayeswang@realtek.com, bjorn@mork.no, linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Aug 2023 08:35:21 -0700 you wrote:
> Mario reports that loading r8152 on his system leads to a:
> 
>   netif_napi_add_weight() called with weight 256
> 
> warning getting printed. We don't have any solid data
> on why such high budget was chosen, and it may cause
> stalls in processing other softirqs and rt threads.
> So try to switch back to the default (64) weight.
> 
> [...]

Here is the summary with links:
  - [net-next] eth: r8152: try to use a normal budget
    https://git.kernel.org/netdev/net-next/c/cf74eb5a5bc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


