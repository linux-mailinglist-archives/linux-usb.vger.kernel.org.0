Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC0D79CED8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbjILKue (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjILKuc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:50:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6669F
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:50:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C22DC433C7;
        Tue, 12 Sep 2023 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694515826;
        bh=vn3kYt0i8broKLMSbj2WI2nhrZVxVuF92QN5By/HLxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lgopkJCoTTHltQxzwCiZinxzp4TvTHhX4vBmo8ksIbr9c5yRQ2Wkcn3CRZZ42SrhA
         Jg3/e3c3mzseMkChrmysF243MP+jYLQMnaB+foekJ2AwK3sJQp/XG/DYcLL3pkXBBl
         QDRJTMX5wxfaga4LouFJR2NSSz/DtbAu6An6qIx4=
Date:   Tue, 12 Sep 2023 12:50:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Jiazi.Li" <jqqlijiazi@gmail.com>
Cc:     "Jiazi.Li" <jiazi.li@transsion.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: increase eps_revmap length
Message-ID: <2023091248-shady-wavy-847d@gregkh>
References: <20230912103417.18839-1-jiazi.li@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912103417.18839-1-jiazi.li@transsion.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 12, 2023 at 06:34:17PM +0800, Jiazi.Li wrote:
> Commit 41dc9ac163e7 ("usb: gadget: f_fs: Accept up to 30 endpoints.")
> increase eps_addrmap length to 31, eps_revmap also need to increase.
> Increase it's length to 32.

Why 32?

> 
> For same-address, opposite-direction endpoints, will use same idx in
> eps_revmap, so add new marco REVMAP_IDX to calculate idx for endpoints.
> 
> Signed-off-by: Jiazi.Li <jiazi.li@transsion.com>

Please use your real name here, not your email alias.  Same for the
 From: line in your email


> ---
>  drivers/usb/gadget/function/f_fs.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 6e9ef35a43a7..4a210368bd33 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -71,12 +71,14 @@ struct ffs_function {
>  	struct ffs_data			*ffs;
>  
>  	struct ffs_ep			*eps;
> -	u8				eps_revmap[16];
> +	u8				eps_revmap[32];
>  	short				*interfaces_nums;
>  
>  	struct usb_function		function;
>  };
>  
> +#define REVMAP_IDX(epaddr)	((epaddr & USB_ENDPOINT_NUMBER_MASK) \
> +				* 2 + ((epaddr & USB_DIR_IN) ? 1 : 0))

What is the * 2 for?  Also, this macro is hard to read, can you make
this an inline function instead, explaining what you are trying to
calculate?

thanks,

greg k-h
