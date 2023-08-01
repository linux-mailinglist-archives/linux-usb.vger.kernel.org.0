Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E8876C005
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 00:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjHAWA2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 18:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjHAWA1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 18:00:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5337103
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 15:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 549A761758
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 22:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAC92C433C8;
        Tue,  1 Aug 2023 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690927225;
        bh=NB0gLchg2zvzbOcx/FfIzTbmhv8ymUyZDO+1widA2N0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HYlrXnEWF91BZTLtTiuPyFrvhqNSRSxYUrqjMC+rBjYZZ1qTD7q9N80B1o07O5Xxy
         hhL4NeUv3T8frIT9YSVe0BXVfg5YBR0WEKDLga8VZFZoHFtkXStF8ez8BBLeqf/F7t
         zr8Y3SUcs9/5F8HUamOTH/U9Sdlv2PcgyBotNfDqd+MYEfj8HCmOKT9Ft+r1uPVX/r
         kZHvkR/xFcFH9r+zWBddHNSWTR1BqFSUMwkHZ5n7SCFvUZdW9dGciTsEprEdvy1zrM
         Lwg/hIL8Uvy82ivkWIFTzMWV1slXxhwzhZertyTuyF/ZGDLC5y1VxKji3gqXQY38Mu
         bS7QWcM/HJOrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C1D7C691E4;
        Tue,  1 Aug 2023 22:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] USB: zaurus: Add ID for A-300/B-500/C-700
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169092722556.12287.10546466900913906538.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Aug 2023 22:00:25 +0000
References: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
In-Reply-To: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        oneukum@suse.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 31 Jul 2023 15:42:04 +1000 you wrote:
> The SL-A300, B500/5600, and C700 devices no longer auto-load because of
> "usbnet: Remove over-broad module alias from zaurus."
> This patch adds IDs for those 3 devices.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217632
> Fixes: 16adf5d07987 ("usbnet: Remove over-broad module alias from zaurus.")
> Signed-off-by: Ross Maynard <bids.7405@bigpond.com>
> Cc: stable@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [v2] USB: zaurus: Add ID for A-300/B-500/C-700
    https://git.kernel.org/netdev/net/c/b99225b4fe29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


