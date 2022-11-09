Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A3F622844
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiKIKUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiKIKUv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:20:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533E622283
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:20:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14A23B81D80
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 10:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49785C433D6;
        Wed,  9 Nov 2022 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667989248;
        bh=dBDcZhFC3Pj5W4jyWnS/BdRGABR35oIvA66LiMYux58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RvGaslmahUXK5Ik/nUmvgzrtTV4Ego/pmc5Mv1obu/gkrVQ1EOKRw1XDv6kAfaI2W
         pbIg9TPxUpS8BX6zhhjegVUJ/Vay7LLi9W51pxWzhM72AVXVQpOI6BD8YGjV/3+SgN
         oHbuIxgJbRwR56Aa58JAxKyGUAj2DMcbWShAG6N0=
Date:   Wed, 9 Nov 2022 11:20:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH 1/4] usb: gadget: uvc: Make bSourceID read/write
Message-ID: <Y2t+/Sjl3NSsSMht@kroah.com>
References: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
 <20221102151755.1022841-2-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102151755.1022841-2-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 02, 2022 at 03:17:52PM +0000, Daniel Scally wrote:
> At the moment, the UVC function graph is hardcoded IT -> PU -> OT.
> To add XU support we need the ability to insert the XU descriptors
> into the chain. To facilitate that, make the output terminal's
> bSourceID attribute writeable so that we can configure its source.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 59 +++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)

Isn't there a documentation update needed here too?

thanks,

greg k-h
