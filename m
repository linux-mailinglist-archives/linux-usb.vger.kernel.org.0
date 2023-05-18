Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3EC47076D7
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 02:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjERASd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 20:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjERASc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 20:18:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C41E8
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 17:18:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD460618CE
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 00:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9288C433EF;
        Thu, 18 May 2023 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684369111;
        bh=CdjamDfFKfw4UVZkYBLyqAh6PTQXoprARJKRWqO3yxw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tg/RURouWtqQNyQD+rjL7EG8WFbrqDsz/h4piDUEGgi4zQ93Cvdk2YG36td/5ZfpQ
         YnJ8KYEeM6Cd+lT5ZXPxpVtEHLGgKP6Im07rUadCBG8wDQWQNS2STrxq10/OK+DazY
         Hy/9SxM+SWdD73P6KSrzW+C2/dMN4VQzV2aEZy6cweDKTOVkCFOvSggDPVWZouIEZG
         wn6Zbh4hDErUCWxqXT86YWiGBEhXgq2GFVGXq41nuDZkIuRZI2zSfouZBq416Weyl5
         97JQ/OFcNyLPXHmaT921QAMILBfSUpiD/+LRdBmFR5Pypv8uLpZmxoUNk+VDg0USzX
         EaV8tMaFiIH9g==
Date:   Wed, 17 May 2023 17:18:30 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Forst <forst@pen.gy>
Cc:     Simon Horman <simon.horman@corigine.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, Georgi Valkov <gvalkov@gmail.com>
Subject: Re: [PATCH] net: usb: ipheth: add CDC NCM support
Message-ID: <20230517171830.5af5c1c4@kernel.org>
In-Reply-To: <00275913-6b7c-9b91-4f5c-d8a425bd3e46@pen.gy>
References: <20230516210127.35841-1-forst@pen.gy>
        <ZGSb4l8XcxclFsB1@corigine.com>
        <00275913-6b7c-9b91-4f5c-d8a425bd3e46@pen.gy>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 17 May 2023 22:30:18 +0000 Forst wrote:
> [encrypted.asc  application/octet-stream (5747 bytes)] 

FWIW people on CC are not getting your emails.
Could you disable the encryption or whatever you have going? :|
