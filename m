Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A8D583960
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 09:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbiG1HWN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 03:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbiG1HWM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 03:22:12 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A0732B83;
        Thu, 28 Jul 2022 00:22:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 429EECE245D;
        Thu, 28 Jul 2022 07:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDEEC433D6;
        Thu, 28 Jul 2022 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658992928;
        bh=DlPj3dy3S3Un6ttCblPeY477OlnRIAOrt4dzCqGnpUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wQdU9WVH8WsYpLkYAt2QbqCMz+1n4HNHrz0+9pM+3aTBLGSajT0dQSZu2L1T5qUhI
         tTeJHcy/2d3EnF8a1OfvZknYUQJCT3NR6XtJS3ODqXWnk2ITDBSZuywlazh3boBVcj
         cl0CQy3XivQ/bmha6TDPPzMWs3/Die86BTCavO9w=
Date:   Thu, 28 Jul 2022 09:22:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: anx7411: Fix error code in
 anx7411_register_partner()
Message-ID: <YuI5HRzOQ1DYDmwg@kroah.com>
References: <YuI3DBkC983Y3oZn@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuI3DBkC983Y3oZn@kili>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 10:13:16AM +0300, Dan Carpenter wrote:
> This code accidentally return success instead of a negative error code.
> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/anx7411.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Doesn't apply to my tree anymore, I think this is already fixed.  Let me
push it out so it shows up in linux-next tomorrow.

thanks,

greg k-h
