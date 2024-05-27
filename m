Return-Path: <linux-usb+bounces-10595-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199A8D0647
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 17:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97130B2BF02
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 15:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1EC161B7C;
	Mon, 27 May 2024 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UhRRbq14"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539615F306
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716822081; cv=none; b=RqyREpWg3Kc+vu5Vihn0i6xc8aWHHfMo7E+kcrDcLkzVbxOHeX1XpSEHjx/7xr4vLRXpMj3q2DgbA7Kfb7kpmIsvYk+APXFnm4j3kNdwF/Kne3EemGJvgW3MFtq/80aqdD68u8rMlvFwtq/s3J22OFBngqmZf0L8W4lzHO9Xs90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716822081; c=relaxed/simple;
	bh=3ADeBLQNJV7D7FSC+IouMdBONs3glNiIL5WXghicbWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVbP7kBEpW8xfAoUupWS+Qsipv4f74MwIecAll0cKNWId6nEUhzlfgkw3/5oMVaBRE2WkYkIw4XJqPPaOERtQEpdH5dYnBrxx55dhkBzMT5LBvJfsw1ZhAUfOHcyaG2H5jVAGpF7QXtyZRrTQK45kgSyC89t+Hq8owdvwndGAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UhRRbq14; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so1092716766b.2
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716822078; x=1717426878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBaleJfDX7TKwBM116gPab+mpvnp6V9XCtVH05KL/8Q=;
        b=UhRRbq14l9bmqFBmcA/n/INUteZlStubdt5sqSxu/zA/YqHNj2gpBXgcB9mddmCb+8
         aaY5NswL73F1azIiSJ13bs3Su5tVqHYB1RzdmIwaDs9m2ekr+//BVHipPdQCLHKjedo3
         xXy0t8wVJwXVAT4Uszfv1HgOoc39Qw3s7Wh2O6XOOZ8nmedARBdBDAt02zwpE6nrTHSv
         hJGxP2ZoQfwzNMt8Q/AbG9eomqJrbcUqg3713C1o8Gx7fsoFr1aC4BcKJyV4yEzaujB9
         Qm4XgAH0hh1dSgzzQBmGdlOEUTcXBhhTLzbUN0DzAUBMUsPARI/Po8ogrLLOx8pfZj2A
         MPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716822078; x=1717426878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBaleJfDX7TKwBM116gPab+mpvnp6V9XCtVH05KL/8Q=;
        b=h3LjJQFEc6E2gn6JnAzO+H81+ySEkReTnQsWA78narWhtshM1uwFdK+qNiPLOHzaXg
         kQZ+uZIJIVtd64loJp6JcQgMa94xzHMdJ+bkcK1FT2FlKc5fq3VmdShKjpTvaKkETlXj
         KrRUGa8zp/U0Kpfl6/hR0DNM9WcdKurKt9LJLkZf+VeZ62QYI727LK4fuXnSGhNhLv2x
         swdRYEB29lYz7yZcLIeF3bOp+qcdo+X9MC4XC60oVjoT5J6hj+yd9LvdwpwPa9SGx7Hq
         TNq6pVFXD3N10nfhfo8szqvs2sPkPsSZRH3M6FquaZKmTS4FGnm/odQI+W+pHUS5k3+S
         ekQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5pOt+1LfFtoJ2cgoKGW+1+RpI8h6qFOLPTaHgU/LV45Pe/fs9XKGpSMUrCSM/NrO85eAkhU+p4hMys3NwuDYLXbqvTx3Aa6oi
X-Gm-Message-State: AOJu0YzfmQ2AAOaM9OD69liO0gA1QKjlV//3Q8Rh51aVe5ChSg+OZlVU
	4K895+OGuTyCQeY210QGfFrbyR58u2X/7ftDvGAHY4nJXMnxzg9keNv/ASbu6S0=
X-Google-Smtp-Source: AGHT+IE0GsSsoOy5TV3e14pqUvRZT4HMEZud7lJYSXIDbKYwkcYaGSuuOBvas3WyiJLP79z3A85Nlw==
X-Received: by 2002:a17:906:c088:b0:a59:db0f:6bd7 with SMTP id a640c23a62f3a-a6265116365mr581125766b.71.1716822077855;
        Mon, 27 May 2024 08:01:17 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:e8eb:4d8f:8770:df82? ([2001:a61:139b:bf01:e8eb:4d8f:8770:df82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93b538sm500311166b.71.2024.05.27.08.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 08:01:17 -0700 (PDT)
Message-ID: <8176c55f-980c-4dcb-9e17-8c9c948ce216@suse.com>
Date: Mon, 27 May 2024 17:01:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] usb-storage: alauda: Check whether the media is
 initialized
To: Shichao Lai <shichaorai@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, Markus.Elfring@web.de
Cc: oneukum@suse.com, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 xingwei lee <xrivendell7@gmail.com>, yue sun <samsun1006219@gmail.com>
References: <20240526012745.2852061-1-shichaorai@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240526012745.2852061-1-shichaorai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.24 03:27, Shichao Lai wrote:

Hi,


> The member "uzonesize" of struct alauda_info will remain 0
> if alauda_init_media() fails, potentially causing divide errors
> in alauda_read_data() and alauda_write_lba().

This means that we can reach those functions.

> - Add a member "media_initialized" to struct alauda_info.
> - Change a condition in alauda_check_media() to ensure the
>    first initialization.
> - Add an error check for the return value of alauda_init_media().
> 
> Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
> Reported-by: xingwei lee <xrivendell7@gmail.com>
> Reported-by: yue sun <samsun1006219@gmail.com>
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Shichao Lai <shichaorai@gmail.com>
> ---
> Changes since v5:
> - Check the initialization of alauda_check_media()
>    which is the root cause.
> 
>   drivers/usb/storage/alauda.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 115f05a6201a..40d34cc28344 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -105,6 +105,8 @@ struct alauda_info {
>   	unsigned char sense_key;
>   	unsigned long sense_asc;	/* additional sense code */
>   	unsigned long sense_ascq;	/* additional sense code qualifier */
> +
> +	bool media_initialized;
>   };
>   
>   #define short_pack(lsb,msb) ( ((u16)(lsb)) | ( ((u16)(msb))<<8 ) )
> @@ -476,11 +478,12 @@ static int alauda_check_media(struct us_data *us)
>   	}
>   
>   	/* Check for media change */
> -	if (status[0] & 0x08) {
> +	if (status[0] & 0x08 || !info->media_initialized) {

If we take this branch due to !info->media_initialized and only due
to this condition, alauda_check_media() will return an error

(Quoting the current state):
         /* Check for media change */
         if (status[0] & 0x08) {
                 usb_stor_dbg(us, "Media change detected\n");
                 alauda_free_maps(&MEDIA_INFO(us));
                 alauda_init_media(us);

                 info->sense_key = UNIT_ATTENTION;
                 info->sense_asc = 0x28;
                 info->sense_ascq = 0x00;
                 return USB_STOR_TRANSPORT_FAILED;

>   		usb_stor_dbg(us, "Media change detected\n");
>   		alauda_free_maps(&MEDIA_INFO(us));
> -		alauda_init_media(us);
> -
> +		rc = alauda_init_media(us);
> +		if (rc == USB_STOR_TRANSPORT_GOOD)
> +			info->media_initialized = true;
>   		info->sense_key = UNIT_ATTENTION;
>   		info->sense_asc = 0x28;
>   		info->sense_ascq = 0x00;

It seems to that we need to evaluate the reasons for taking this branch
and the result of alauda_init_media() to compute the correct return
of this function.

	Regards
		Oliver

