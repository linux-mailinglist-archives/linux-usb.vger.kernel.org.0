Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31D952D9E6
	for <lists+linux-usb@lfdr.de>; Thu, 19 May 2022 18:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241372AbiESQLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 12:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241857AbiESQLC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 12:11:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D84C37A94
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 09:10:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7C78B8255B
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 16:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9AAC385AA;
        Thu, 19 May 2022 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652976654;
        bh=T5s5oqX8qKbl3nyuD2KIAsd1v1LfPAJzB/wb5TuWq/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pb9r0hxbC9NgsB4wXCyFUb+BSWNNa2LX5j1zj6WzeRO5vC2ZQ7VgBfBPGnygz32dn
         pmJvSNs6ftO7KLSalSnwXovz/nDMqpjgCWRzL8CUqd5fUFXA4S++zAyATM1ldtvWE+
         6Tij9zM6mxx4nZeAXcMumPA8X3Aies7rRn1FqLE4=
Date:   Thu, 19 May 2022 18:10:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/1] fix xhci feature merge issue in current usb-next
Message-ID: <YoZsC1NZU6VEJdjE@kroah.com>
References: <20220516094850.19788-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516094850.19788-1-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 16, 2022 at 12:48:49PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> Two different conflicting features touching xhci got into current usb-next
> for 5.19
> 
> One adds support for xHC hosts with just one roothub,
> second adds support to defer first roothub registration until second
> roothub is added.
> 
> commit 873f323618c2 ("xhci: prepare for operation w/o shared hcd")
> commit b7a4f9b5d0e4 ("xhci: Set HCD flag to defer primary roothub
> registration")
> 
> We ended up trying to defer roothub registratinog for xHC with just one
> roothub.
> 
> This patch fixes the issue and goes on top of current usb-next
> 
> This patch shouldn't be needed for stable as the new feature to support
> one roothub xHC isn't marked for stable either, but setting Fixes flag
> in case someone later picks it up for stable.
> 
> Mathias Nyman (1):
>   xhci: Don't defer primary roothub registration if there is only one
>     roothub
> 
>  drivers/usb/host/xhci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Sorry about the merge issue, now queued up, thanks!

greg k-h
