Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2A95513ED
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 11:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240661AbiFTJQY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 05:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236682AbiFTJQU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 05:16:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9EC10576
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 02:16:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55B40B80F4B
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 09:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C87EC3411B;
        Mon, 20 Jun 2022 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655716577;
        bh=MDezbIIDVyGDui1sbS+6Wp4vrEpxcR53CL+ciDb+YCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sFU5/0HSnbgkg1pldU3eRuDzwN91SEqGR0zP1HSOYhctWxKtSZqR1zbiNj7mh7g9e
         lUt7YcdvUlHwQd1xBC8sQ5jUM/jydqoEzrDMF2ZLpNagSu95IRGgOR7Tpsb4eqi6V0
         xasF6QYkeYPxY6VKAtCwlDn0qUb1TLU7Ps2G/ABvZV+iH6evuBVL0ai5fxui0e1YAe
         DdZupSOIlZRn//dapL9HXD5yXY85LLnfmZWDv30WBcTixf3Day9yjpXOaXEmJiIPqE
         T/FMK2d8EW4YP6EsyK334fI201j3qYZsi3+b9sb687jW4o2ixHbGOIn6aKw2/yndAt
         AtOcoyUWtsMRg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3DW0-0007qB-FZ; Mon, 20 Jun 2022 11:16:13 +0200
Date:   Mon, 20 Jun 2022 11:16:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Carlo Lobrano <c.lobrano@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: Re: [PATCH v4] USB:serial:option: Add Telit LE910Cx 0x1250
 composition
Message-ID: <YrA63A6m4/a6v/oY@hovoldconsulting.com>
References: <20220614075623.2392607-1-c.lobrano@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614075623.2392607-1-c.lobrano@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 14, 2022 at 09:56:23AM +0200, Carlo Lobrano wrote:
> Add support for the following Telit LE910Cx composition:
> 
> 0x1250: rmnet, tty, tty, tty, tty
> 
> Reviewed-by: Daniele Palmas <dnlplm@gmail.com>
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> ---
> 
> here is also the lsusb I forgot in v2 and v3

> ---
> v4: use USB_DEVICE_AND_INTERFACE_INFO in place of USB_DEVICE_INTERFACE_CLASS
> v3: - fix subject prefix and modem name (s/LN910Cx/LE910Cx)
>     - more descriptive e-mail content
> v2: use RSVD in place of NCTRL for interface 0 (rmnet)

Thanks for the update. Now applied with some minor style tweaks (e.g.
missing space after colons in Subject and missing space before }).

>  drivers/usb/serial/option.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index ed1e50d83cca..a50bd91572cb 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1279,6 +1279,7 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE910Cx (RNDIS) */
>  	  .driver_info = NCTRL(2) | RSVD(3) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x0, 0x0)},	/* Telit LE910Cx (rmnet) */
>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
>  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),

Johan
