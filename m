Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629DA79A496
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 09:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjIKHdg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 03:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjIKHdg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 03:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C04CD8
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694417568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ti9FCfW1EJ3qUQT7yyqBbpgulOtJV84klUH5rxYtG5k=;
        b=eDuQJuoTdfh5sCoM0KbIztThj3VIbl7eJ+pm1g/buTfYGPtUoAZY1nQEMf98jEIpo6+waT
        hxu15ssYpleYky576M/1fqA9lNZI623D3BjPQ+H3YuDabD3NwUbDqe3GGWjsLiSYkKdiUS
        wIJVnjjDIbt9j9/t4AGaQOnrtVlUpGs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-fvaZe7whPxmDKlk51a65fA-1; Mon, 11 Sep 2023 03:32:46 -0400
X-MC-Unique: fvaZe7whPxmDKlk51a65fA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a348facbbso285127166b.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 00:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417564; x=1695022364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti9FCfW1EJ3qUQT7yyqBbpgulOtJV84klUH5rxYtG5k=;
        b=XEfd9VDTrIPAvPQY/8wp4r7JdWilhVjktu9HMIkXf67BIlwxQ3U8Fr+jjf+CyRezdO
         Nxih9lFG7gz1holPd+PmFm3azoTVrhiLhf2L9oWf40IxZw+6sECvJu7cLfuIzSYrp2T6
         CkE3+NP2rk3W86/9fckyCFCO1Va8/O0HwZ3WKDpEh6v07pAZF8PvUfeXHsifeioyRGlv
         0/Uei4v17RQlLW1vd5RsxdUBSY8eRJ8vkciRbiH5zG34sz+4jlpXJregU0yC5AQGmQU2
         fQLeZF+EcdB8PL3uBOU7C/DuLBikQxulMsTw8PVJlp8GJest1YeUT0ZN/YtWlx6Gvi8b
         qcdg==
X-Gm-Message-State: AOJu0YxdsQ4FM76lw8qKiAMpZKSrleLqv+Tex1keDdPzEnOCy7ElapXp
        1/CsQxvW4qcb45rMZkINb+6npmitcb3vejI5pI788cTSF8zA/SHjx3sYJ8/GC7gnyg+cBtS1KJI
        hkNtdMRTHhwEDfJ961smp+uVUWB4f
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id k19-20020a170906971300b009a1be5bf4aamr6744839ejx.0.1694417564843;
        Mon, 11 Sep 2023 00:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExhalxJVf0F18gM/jp5U3ZKr9e554M+9sO0YAvyRPyjka+NsJmLY4uGpzCLIAn+0gN52Sy4w==
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id k19-20020a170906971300b009a1be5bf4aamr6744823ejx.0.1694417564487;
        Mon, 11 Sep 2023 00:32:44 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906394100b0099bc038eb2bsm4835138eje.58.2023.09.11.00.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 00:32:43 -0700 (PDT)
Message-ID: <9d2dff10-5a3b-b24a-c3d8-3c843891966d@redhat.com>
Date:   Mon, 11 Sep 2023 09:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: add ignore remote wakeup quirk for one of Logitech's
 receivers
To:     Hamza Mahfooz <someguy@effective-light.com>,
        linux-usb@vger.kernel.org
Cc:     stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
        Nicolas Dumazet <ndumazet@google.com>,
        Jean-Francois Le Fillatre <jflf_kernel@gmx.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        Hannu Hartikainen <hannu@hrtk.in>, linux-kernel@vger.kernel.org
References: <20230910163751.4210-1-someguy@effective-light.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230910163751.4210-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hamza,

On 9/10/23 18:37, Hamza Mahfooz wrote:
> This device causes the system to wake up from suspend, as soon as it
> enters it (even if the device attached to the receiver is powered off).
> So, ignore remote wakeup events from it.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 15e9bd180a1d..d2e2a2873f34 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -264,6 +264,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Logitech Harmony 700-series */
>  	{ USB_DEVICE(0x046d, 0xc122), .driver_info = USB_QUIRK_DELAY_INIT },
>  
> +	/* Logitech lightspeed receiver (0xc547) */
> +	{ USB_DEVICE(0x046d, 0xc547), .driver_info =
> +			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>  	/* Philips PSC805 audio device */
>  	{ USB_DEVICE(0x0471, 0x0155), .driver_info = USB_QUIRK_RESET_RESUME },
>  

If this is a lightspeed receiver then it really should be handled by
hid-logitech-dj.c unless this new receiver is using a new protocol ?

I wonder if adding it there also fixes the remote
wakeup issue (I doubt it fixes it but worth a try) ?

Regards,

Hans



