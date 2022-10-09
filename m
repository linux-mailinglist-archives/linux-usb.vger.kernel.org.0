Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B895F8D2F
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 20:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiJISez (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 14:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiJISew (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 14:34:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67CAD124
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 11:34:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62EE760C4A
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 18:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F5FC433C1;
        Sun,  9 Oct 2022 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665340489;
        bh=UU+eKcVyOoRjuPqImY7wuvQfr1hrUaAoPwgov3+gUSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I0LWzUC7N1Z7qTKbC/Mx51+M5puG7d9W2RahVeoGCEUYnUCkAGsTou7GL0OJ5LuLY
         fsQRzKTNd7jWr3RksDp1Ey+Kkf4NUy5ereO3bT8J/mSSm+qFV89hc4NwPMrMAPrGO4
         o/UVW7v4GsmzNST8cLCXCbxd9Soxkk6eVpEA40dc=
Date:   Sun, 9 Oct 2022 20:35:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume support for
 host controller
Message-ID: <Y0MUdHsGa+UfaO2u@kroah.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
 <20221009160813.776829-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009160813.776829-4-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 10, 2022 at 12:08:08AM +0800, Xu Yang wrote:
> The controller's power may be powered off during system suspend. This
> will add suspend/resume support when the controller suffers power lost.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index bc3634a54c6b..dc033272c31e 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -459,6 +459,16 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
>  	ci_hdrc_free_dma_aligned_buffer(urb);
>  }
>  
> +static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
> +{
> +	ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));

Why is the chipidea driver somehow now tied to the ehci driver?

Are you sure you want this?  Why?  Is hcd always a ehci device?

thanks,

greg k-h
