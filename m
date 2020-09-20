Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0788E27180B
	for <lists+linux-usb@lfdr.de>; Sun, 20 Sep 2020 23:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgITVIw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Sep 2020 17:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITVIw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Sep 2020 17:08:52 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DFFC061755
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2020 14:08:51 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id q63so12976404qkf.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2020 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+V5WytTg6gV4j0WhWe8jzAETwNFQtPwiWyG0hNReL5I=;
        b=POic+2q2v3ykuERO6FjWtZ2nNQvNLr3GAXjjN9Y8jnIp3P/JrSGz62JTVHCZhWBraD
         L+u6s3947V5SXDTmPfbCQI3poInzkUvHueKy5xdE0MrtszZ6gVpEo1nFvFS65s94848R
         o/uhln4F4igR7SFspXHel26qRHIRuDRZp61H1bM1q2HhMG1/e0ioYHujWqzH7X2J8eRF
         cs1RHZmbkhZvr4xy+P3Yqa8Kgaxt3nKjjATKBSPljiZ6t1NrdjZWUlpFFrDeMfSGkuOd
         szE/j8mFAwYpLYArmuOm56q8wbjLXiX//xnQBMCmiLQr1difV9kbmW+r9oeSqOXXAjM+
         3odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+V5WytTg6gV4j0WhWe8jzAETwNFQtPwiWyG0hNReL5I=;
        b=OaUtv5MWakMI1YAEl/2GnyKIIHZcLZY0dfmYtRSD75O3ISm2saLCqCf5dXy7xSLS5J
         mUx+GqBytsojqyHo5AmZpWfC3FJbgBI4eeN6gfS01pKmDLCpfgx8ttqDXutxdW7rR1rJ
         pUP4OVwML1rTfZNnnyrqL4tiIvEAtqCe2AQdjJ30oGzuo69DNFauHhQs1KsTFEIe2JYJ
         jbiRTuxMLbeNFwLEjf01Ds1C85pwRcZGWXli/hJV6MGzERd7GEPK9sVTKIbMBPQwm6N6
         yczLx4zvNZprC91Fnd2Bh+9a3VrzOAGHvOwSBv+snUYCrx6wPnHFD1sKf/J7AgL6X+0N
         4Tpw==
X-Gm-Message-State: AOAM5333xwDyhIH6yNFopXnXH0mdcVcGTylWhRaAzT7SmdkEwxQWbMQm
        gWX5Mm3/gd9vRL7clgO7Mis=
X-Google-Smtp-Source: ABdhPJycKuv7V6pm/sEdHN2/VTFbz6EKr/Ss+KMqkhUExIMzR/VCSVEtjB4li1lOAkHndwNYS82JYA==
X-Received: by 2002:a37:4f47:: with SMTP id d68mr42286095qkb.6.1600636131037;
        Sun, 20 Sep 2020 14:08:51 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net. [173.75.208.99])
        by smtp.gmail.com with ESMTPSA id x49sm8253375qtc.94.2020.09.20.14.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 14:08:50 -0700 (PDT)
Subject: Re: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Ilja Van Sprundel <ivansprundel@ioactive.com>,
        stable <stable@kernel.org>
References: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
From:   Brooke Basile <brookebasile@gmail.com>
Message-ID: <34126e7e-270b-fd9d-e08a-588feec758a5@gmail.com>
Date:   Sun, 20 Sep 2020 17:08:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/20/20 1:01 PM, Bryan O'Donoghue wrote:
> commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> adds important bounds checking however it unfortunately also introduces  a
> bug with respect to section 3.3.1 of the NCM specification.
> 
> wDatagramIndex[1] : "Byte index, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramLength[1]: "Byte length, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramIndex[1] and wDatagramLength[1] respectively then may be zero but
> that does not mean we should throw away the data referenced by
> wDatagramIndex[0] and wDatagramLength[0] as is currently the case.
> 
> Breaking the loop on (index2 == 0 || dg_len2 == 0) should come at the end
> as was previously the case and checks for index2 and dg_len2 should be
> removed since zero is valid.
> 
> I'm not sure how much testing the above patch received but for me right now
> after enumeration ping doesn't work. Reverting the commit restores ping,
> scp, etc.
> 
> The extra validation associated with wDatagramIndex[0] and
> wDatagramLength[0] appears to be valid so, this change removes the incorrect
> restriction on wDatagramIndex[1] and wDatagramLength[1] restoring data
> processing between host and device.
> 
> Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> Cc: Ilja Van Sprundel <ivansprundel@ioactive.com>
> Cc: Brooke Basile <brookebasile@gmail.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/usb/gadget/function/f_ncm.c | 30 ++---------------------------
>   1 file changed, 2 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index b4206b0dede5..1f638759a953 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1189,7 +1189,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>   	const struct ndp_parser_opts *opts = ncm->parser_opts;
>   	unsigned	crc_len = ncm->is_crc ? sizeof(uint32_t) : 0;
>   	int		dgram_counter;
> -	bool		ndp_after_header;
>   
>   	/* dwSignature */
>   	if (get_unaligned_le32(tmp) != opts->nth_sign) {
> @@ -1216,7 +1215,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>   	}
>   
>   	ndp_index = get_ncm(&tmp, opts->ndp_index);
> -	ndp_after_header = false;
>   
>   	/* Run through all the NDP's in the NTB */
>   	do {
> @@ -1232,8 +1230,6 @@ static int ncm_unwrap_ntb(struct gether *port,
>   			     ndp_index);
>   			goto err;
>   		}
> -		if (ndp_index == opts->nth_size)
> -			ndp_after_header = true;
>   
>   		/*
>   		 * walk through NDP
> @@ -1312,37 +1308,13 @@ static int ncm_unwrap_ntb(struct gether *port,
>   			index2 = get_ncm(&tmp, opts->dgram_item_len);
>   			dg_len2 = get_ncm(&tmp, opts->dgram_item_len);
>   
> -			if (index2 == 0 || dg_len2 == 0)
> -				break;
> -
>   			/* wDatagramIndex[1] */
> -			if (ndp_after_header) {
> -				if (index2 < opts->nth_size + opts->ndp_size) {
> -					INFO(port->func.config->cdev,
> -					     "Bad index: %#X\n", index2);
> -					goto err;
> -				}
> -			} else {
> -				if (index2 < opts->nth_size + opts->dpe_size) {
> -					INFO(port->func.config->cdev,
> -					     "Bad index: %#X\n", index2);
> -					goto err;
> -				}
> -			}
>   			if (index2 > block_len - opts->dpe_size) {
>   				INFO(port->func.config->cdev,
>   				     "Bad index: %#X\n", index2);
>   				goto err;
>   			}
>   
> -			/* wDatagramLength[1] */
> -			if ((dg_len2 < 14 + crc_len) ||
> -					(dg_len2 > frame_max)) {
> -				INFO(port->func.config->cdev,
> -				     "Bad dgram length: %#X\n", dg_len);
> -				goto err;
> -			}
> -
>   			/*
>   			 * Copy the data into a new skb.
>   			 * This ensures the truesize is correct
> @@ -1359,6 +1331,8 @@ static int ncm_unwrap_ntb(struct gether *port,
>   			ndp_len -= 2 * (opts->dgram_item_len * 2);
>   
>   			dgram_counter++;
> +			if (index2 == 0 || dg_len2 == 0)
> +				break;
>   		} while (ndp_len > 2 * (opts->dgram_item_len * 2));
>   	} while (ndp_index);
>   
> 
Bryan,

Ah, I see my mistake.  I did test this, but I must have missed some test 
cases as I didn't encounter this error.
Thanks a lot for testing and fixing the issue, and for the thorough 
explanation.

Best,
Brooke Basile
