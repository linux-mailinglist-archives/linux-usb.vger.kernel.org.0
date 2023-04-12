Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7C56DFC49
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 19:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjDLRIN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 13:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjDLRIM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 13:08:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D512D73
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 10:08:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB540637A8
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 17:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16A3C4339B;
        Wed, 12 Apr 2023 17:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681319266;
        bh=mhBb5BJ6UJs6mwtvGJGX3poEhHgRoxJtud/Iel80Z9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vnjd/nMLqsyF8Jc1Uyb/NbcPuZ3K0EpBR4S0nObiwGybv4p9mAi8a9T3wMMDUJaby
         imgCwAJjILO3VhINRURsL7IW8aTawtPd+wu9+6yaG0r9hizuw6q/pPQG+SsUzMN4sZ
         adKGm36IwXt0HB3oX1O/in8epjQzQJOLDjlly8+0=
Date:   Wed, 12 Apr 2023 19:07:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     qianfan <qianfanguijin@163.com>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Bin Liu <b-liu@ti.com>
Subject: Re: BUG: linux 5.15.0 hang on usb_wwan_indat_callback
Message-ID: <2023041257-campfire-squeamish-75a4@gregkh>
References: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 12, 2023 at 07:54:28PM +0800, qianfan wrote:
> Hi:
> 
> The linux system maybe hang in usb_wwan_indat_callback when the usb modem
> sudden disconnected. This problem has a very small probability and can not
> make it repeat easy.
> 
> hardware: allwinner R40 with 4 cortex-a7
> software: linux 5.15.0

5.15.0 is _VERY_ old, sorry.  Please try using a modern kernel release,
we can not do anything about old kernels like this.

Does this still happen on the latest 6.2 release, or the latest 6.3-rc
release?

thanks,

greg k-h
