Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD5D247DF4
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 07:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHRFnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 01:43:25 -0400
Received: from meesny.iki.fi ([195.140.195.201]:37276 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgHRFnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 01:43:17 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Aug 2020 01:43:15 EDT
Received: from [IPv6:2001:14ba:a809:f00:d350:41f1:7bf0:c73f] (d1yft0yhxmby-c0-t48-t-3.rev.dnainternet.fi [IPv6:2001:14ba:a809:f00:d350:41f1:7bf0:c73f])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: jussi.kivilinna)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4EC7820099;
        Tue, 18 Aug 2020 08:36:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1597728979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=40MMPOxGecjuDOZDbbv4jw7TyaLiKOk48M0Nakjvu0s=;
        b=ku71JXo2ROcEZq0mvuyZ2xEH7tQhXHg8NF1woPgZ61q/pJJdipdauTrJgEltfc6jRMTbGq
        V9zOetKMqJLHmAaieSsT4UL1X1jgxKrcisnqWrzWTGahkgoq+steFcmMfx60hV5/TmgQpl
        FkhWWYR4cMFgRnWBOfnDKwPnUgKAQL4=
Subject: Re: [PATCH v2 3/8] rndis_wlan: Make use of cpu_to_le16_array()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Kalle Valo <kvalo@codeaurora.org>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
 <20200817184659.58419-3-andriy.shevchenko@linux.intel.com>
From:   Jussi Kivilinna <jussi.kivilinna@iki.fi>
Autocrypt: addr=jussi.kivilinna@iki.fi; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4fce25c1-8da0-aff3-38bb-e488e75c40d5@iki.fi>
Date:   Tue, 18 Aug 2020 08:36:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817184659.58419-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1597728979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=40MMPOxGecjuDOZDbbv4jw7TyaLiKOk48M0Nakjvu0s=;
        b=dBtsSfh4o/83JsVE1NyO546JWYtvUpio17wW/WUgGwpsvC0nTnfOPe3VcRZ9UPjBgd2WWB
        0HpRV6eQcJSXTT5gD4xrFDh/1KbkxQsTt0Bvej82ylPmJrfRmB7NzM0fgGbTzqN+LmtPNu
        hqSG0hlBBCXmnPZBP8kUXUi1NsaCa9w=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1597728979; a=rsa-sha256; cv=none;
        b=lRSzDztfWwLEUU3UMurCK/h87lW3lHNuBLcWyXM5JhUudFfyH+ImhgtjH9zNNi50XNMet0
        LhwWL8O+YkjO+3gBip4Jtpf9f8jFPavmdKKWtG6YgWGZHCKMKFFbTsQWgsBM59KYsWT5gI
        1YrZchLStGoY6gBd66FGUhIUp+XaQuw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=jussi.kivilinna smtp.mailfrom=jussi.kivilinna@iki.fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 17.8.2020 21.46, Andy Shevchenko wrote:
> Since we have a new helper, let's replace open coded variant by it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> ---
> v2: new patch
>  drivers/net/wireless/rndis_wlan.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
> index 8852a1832951..06850ee6d6dc 100644
> --- a/drivers/net/wireless/rndis_wlan.c
> +++ b/drivers/net/wireless/rndis_wlan.c
> @@ -859,9 +859,12 @@ static int rndis_set_config_parameter(struct usbnet *dev, char *param,
>  						int value_type, void *value)
>  {
>  	struct ndis_config_param *infobuf;
> -	int value_len, info_len, param_len, ret, i;
> +	int value_len, info_len, param_len, ret;
>  	__le16 *unibuf;
>  	__le32 *dst_value;
> +#ifdef DEBUG
> +	int i;
> +#endif
>  
>  	if (value_type == 0)
>  		value_len = sizeof(__le32);
> @@ -901,13 +904,11 @@ static int rndis_set_config_parameter(struct usbnet *dev, char *param,
>  
>  	/* simple string to unicode string conversion */
>  	unibuf = (void *)infobuf + sizeof(*infobuf);
> -	for (i = 0; i < param_len / sizeof(__le16); i++)
> -		unibuf[i] = cpu_to_le16(param[i]);
> +	cpu_to_le16_array(unibuf, param, param_len / sizeof(__le16));

This does not look correct, as kernel test robot noticed. 'param' is ASCII string and 'unibuf' wide character string and loop is making simple 8-bit char to 16-bit char conversion.

>  
>  	if (value_type == 2) {
>  		unibuf = (void *)infobuf + sizeof(*infobuf) + param_len;
> -		for (i = 0; i < value_len / sizeof(__le16); i++)
> -			unibuf[i] = cpu_to_le16(((u8 *)value)[i]);
> +		cpu_to_le16_array(unibuf, value, value_len / sizeof(__le16));

Same here.

-Jussi

>  	} else {
>  		dst_value = (void *)infobuf + sizeof(*infobuf) + param_len;
>  		*dst_value = cpu_to_le32(*(u32 *)value);
> 

