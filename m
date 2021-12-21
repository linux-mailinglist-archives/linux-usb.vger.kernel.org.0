Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FF747BF43
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 13:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhLUMCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 07:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhLUMCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 07:02:49 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5245C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=xDvkLmsylauU8pkMsOWZqPmQJeKjQ+iJ/UszCpoHk/Q=; b=yqRc1
        jwqEMx5GuHmRDlBQE3zkuVc/eaWMXi4WNwNe6Ut9YJFiPXB/OOmgTyF9ElqQcxZbtldA7ztoRqb6o
        GNb3UU5mqLWyNpvwtwfYFeYMFMNZiRwtpYzsWcdxBVbi8KDxmhVWvjGxtktUE8OrBAb57uADkOa/o
        aYt1FWjeI8Fy2ML0O06X31hiLgvoBX2X9vZL/hvj/FOip8FihBK6xLVa+Mq640YcW2ocDz/zjHhv6
        8EdciZmHSWaOomhe2XWA1gnWovrFUo2ERihJ3sL41x2hfFYx/IbM/doogLu+ssIunvV9rS3QXL2A9
        rijyFLZ6kZgTF8XUXsmNHf3KY3Zkg==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mzdqw-0002GB-7q; Tue, 21 Dec 2021 12:02:46 +0000
Date:   Tue, 21 Dec 2021 12:02:44 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 05/11] usb: gadget: f_uac2: Renaming Clock Sources to
 fixed names
Message-ID: <YcHCZFXrYlzBeS2E@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-6-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220211130.88590-6-pavel.hofman@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The subject should be "Rename ...".

On Mon, Dec 20, 2021 at 10:11:24PM +0100, Pavel Hofman wrote:
> From: Julian Scheel <julian@jusst.de>
> 
> The gadget no longer supports only one frequency. Therefore USB strings
> corresponding to the clock sources are renamed from specific Hz value to
> general names Input clock/Output clock.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index 74e32bb146c7..ef8e39e80523 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -105,14 +105,11 @@ enum {
>  	STR_AS_IN_ALT1,
>  };
>  
> -static char clksrc_in[8];
> -static char clksrc_out[8];
> -
>  static struct usb_string strings_fn[] = {
>  	[STR_ASSOC].s = "Source/Sink",
>  	[STR_IF_CTRL].s = "Topology Control",
> -	[STR_CLKSRC_IN].s = clksrc_in,
> -	[STR_CLKSRC_OUT].s = clksrc_out,
> +	[STR_CLKSRC_IN].s = "Input clock",
> +	[STR_CLKSRC_OUT].s = "Output clock",

Other values here use title case, so "Input Clock", "Output Clock".

>  	[STR_USB_IT].s = "USBH Out",
>  	[STR_IO_IT].s = "USBD Out",
>  	[STR_USB_OT].s = "USBH In",
> @@ -1058,9 +1055,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>  		*bma = cpu_to_le32(control);
>  	}
>  
> -	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", uac2_opts->p_srate);
> -	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", uac2_opts->c_srate);
> -
>  	ret = usb_interface_id(cfg, fn);
>  	if (ret < 0) {
>  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> -- 
> 2.25.1
> 
