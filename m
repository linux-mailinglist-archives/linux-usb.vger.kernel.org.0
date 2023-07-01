Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587327448DF
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jul 2023 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjGAMUn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jul 2023 08:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGAMUn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jul 2023 08:20:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D650F4232
        for <linux-usb@vger.kernel.org>; Sat,  1 Jul 2023 05:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53CF360B73
        for <linux-usb@vger.kernel.org>; Sat,  1 Jul 2023 12:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A983DC433CA;
        Sat,  1 Jul 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688214022;
        bh=80qZ2OoLhTkgmsH8csyzGV5MLoKizYyCcM53np1bR1Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fewzkHW2pSC11zrKRLJVHuvAnyykZ8OQv4VtTpMiQiy1AP4fAdat9HWQ/T3l4i2Rg
         IfoPebxT8OC5SJN6M1w+Ux3ztYi1bRqL0OZS858SCE2Z4A7AL568rb9YwHTgl8eiyv
         xVBy4sCSrO17ni+bz0JhrQv2q/YHZKMUhVcOJnXKYigl3F2uUnc9P6snlv53HtDCx1
         GtXZJw2Rtk52sc6ks0scG7w9KuhpO7hvMowSnLMXP38/R6SlZlBjvhQQogA3vJ+G4S
         tvruGLGLTM1WX90/dnsQLlBjbjFOsWxZAlXh4On0uU3ImA1Dcg3/hBQmGO9Svvv2Nx
         C2enkverHXXfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BC64C691F0;
        Sat,  1 Jul 2023 12:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: usb: cdc_ether: add u-blox 0x1313 composition.
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168821402256.27463.17009519930792690898.git-patchwork-notify@kernel.org>
Date:   Sat, 01 Jul 2023 12:20:22 +0000
References: <20230629103736.23861-1-davide.tronchin.94@gmail.com>
In-Reply-To: <20230629103736.23861-1-davide.tronchin.94@gmail.com>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     oliver@neukum.org, netdev@vger.kernel.org, pabeni@redhat.com,
        marco.demarco@posteo.net, linux-usb@vger.kernel.org,
        kuba@kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 29 Jun 2023 12:37:36 +0200 you wrote:
> Add CDC-ECM support for LARA-R6 01B.
> 
> The new LARA-R6 product variant identified by the "01B" string can be
> configured (by AT interface) in three different USB modes:
> * Default mode (Vendor ID: 0x1546 Product ID: 0x1311) with 4 serial
> interfaces
> * RmNet mode (Vendor ID: 0x1546 Product ID: 0x1312) with 4 serial
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1313) with 4 serial
> interface and 1 CDC-ECM virtual network interface
> The first 4 interfaces of all the 3 configurations (default, RmNet, ECM)
> are the same.
> 
> [...]

Here is the summary with links:
  - net: usb: cdc_ether: add u-blox 0x1313 composition.
    https://git.kernel.org/netdev/net/c/1b0fce8c8e69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


