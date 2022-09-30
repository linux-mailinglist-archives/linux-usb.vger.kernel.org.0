Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34A15F0AC7
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 13:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiI3LlZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 07:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiI3Lky (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 07:40:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171B71664A1
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 04:32:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1A96622EA
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68F1C433C1;
        Fri, 30 Sep 2022 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664537567;
        bh=Q0z3cZBOpQ3z7+UhpGFdAFiQwyr9BBpGcqkpJiCuo18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KdpGtm5jlObu7md+tqtVRFcNTcwH+E8FDQ6bvCCxBz5vd5kzsWCI0Ur/tm1PgQNL0
         UbLLGR6Dzrrii9fx9HPPcEOJ1wXv1RYublhO2PZ81ur8rcut4j20JifiquhryEh+Tv
         +1of6SEX8H4oViERiKgez70KbBkAbUU6ynj6FAPM=
Date:   Fri, 30 Sep 2022 13:32:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux USB <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] MAINTAINERS: switch dwc3 to Thinh
Message-ID: <YzbT3OzCmQIUTNDk@kroah.com>
References: <20220929074844.351938-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929074844.351938-1-balbi@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 29, 2022 at 10:48:44AM +0300, Felipe Balbi wrote:
> Thinh Nguyen has agreed to become the new dwc3 maintainer seeing that
> I haven't had time to dedicate to the mailing list.
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5ca4aefd184..2cd29b4add81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5898,10 +5898,9 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
>  F:	drivers/usb/dwc2/
>  
>  DESIGNWARE USB3 DRD IP DRIVER
> -M:	Felipe Balbi <balbi@kernel.org>
> +M:	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
>  F:	drivers/usb/dwc3/

Many thanks Felipe for doing all of the great work you've done over the
years here on this driver, and the other USB stack stuff.

And thank you Thinh for wanting to maintain this going forward, that's
much appreciated.

patch now queued up, thanks.

greg k-h
