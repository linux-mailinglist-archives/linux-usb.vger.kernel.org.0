Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3E368B730
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 09:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjBFIUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 03:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBFIUH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 03:20:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE1914E81
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 00:20:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8151DB80D88
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24228C433EF;
        Mon,  6 Feb 2023 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675671604;
        bh=hT74UK53JKRE8VtMK0m++kSeaLWW/M6PX3+wDhO5okQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSly+yiwmGJIKHAp5sVcDswfL17kb9rX9Gh4hhSkuGtF9XH9scZhzcuGhfdRM5/1/
         w14L02fdoS+zxsQl2YtxcCdNC6uqIagqXJE6W0qIQ9OeLUxm5qE2bfhLjujU/Wpefq
         ft1aQghJU/Vq+yVBhzYLIls1sUmTO0/wKkyIn3YpLqNp0cnTfOd69+Wv5MEuxsH032
         uV8vqWLCgGZnXEwLATnCACPhwLhRl8gvgJrkGzRMW2Q/jfQxaq0fFuCrkF3LkZh9tB
         pEXkCURlCiLwBOL96leKixJgbFkczWlwup74uz4XcLuH5CgebVznOA+3z27Zpima2c
         jIB/9/vlorCgQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pOwjp-0003NE-PY; Mon, 06 Feb 2023 09:20:34 +0100
Date:   Mon, 6 Feb 2023 09:20:33 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Florian Zumbiehl <florz@florz.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbserial: Add support for VW/Skoda "Carstick LTE"
Message-ID: <Y+C4UaTlVGY1SfNV@hovoldconsulting.com>
References: <20230206010428.GF23822@florz.florz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206010428.GF23822@florz.florz.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 06, 2023 at 02:04:28AM +0100, Florian Zumbiehl wrote:
> Add support for VW/Skoda "Carstick LTE"
> 
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1c9e ProdID=7605 Rev=02.00
> S:  Manufacturer=USB Modem
> S:  Product=USB Modem
> C:  #Ifs= 4 Cfg#= 1 Atr=e0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> 
> The stick has AT command interfaces on interfaces 1, 2, and 3, and does PPP
> on interface 3.
> 
> Signed-off-by: Florian Zumbiehl <florz@florz.de>
> ---
> Note that the patch is untested, I hope that it's trivial enough. I have
> the device running on a Debian kernel 4.19 by dynamically binding the USB
> device ID to the option driver.

Thanks for the patch. Looks good.

I've applied it now with an updated patch prefix:

	USB: serial: option: add support for VW/Skoda "Carstick LTE"

and after moving the new define above the other FOUR_G defines to
maintain the sort order (by PID).

> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index ee5ac4e..61b4a46 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -406,6 +406,8 @@ static void option_instat_callback(struct urb *urb);
>   * It seems to contain a Qualcomm QSC6240/6290 chipset            */
>  #define FOUR_G_SYSTEMS_PRODUCT_W14		0x9603
>  #define FOUR_G_SYSTEMS_PRODUCT_W100		0x9b01
> +/* This one was sold as the VW and Skoda "Carstick LTE" */
> +#define FOUR_G_SYSTEMS_PRODUCT_CARSTICK_LTE	0x7605

Johan
