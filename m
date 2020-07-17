Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD33223752
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 10:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgGQIq1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 04:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgGQIq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 04:46:27 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A059FC061755
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 01:46:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u12so5599367lff.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fVqvPIG5A/mi9HgIkXz+kA5IrsAiUI6du4yFBWMcFQ8=;
        b=N5zRN0cgwLhLOp3SP9yTSf/OLrgQbP9QhnGQxXOPZg4OneBsQZj4orZ4/tDOpJ4Svd
         0AoM7uM7/MaIaTVmYU8o02NT7iQgATiqDhkEfg2JmEEjX4SPkyFOmR0Gsr6si0nn0R1z
         ugppw+qCxnsJBj44cT3fk+FkjhnmQEXB6lAKidHMCFWBiPqm3E9RG/uE+0jSlzVceCeh
         lmdzql8/wo3VDvByAtZ9Adqj6SFypTaCJNcjdL4yYMKHfkIWmO9IQ7zOE+x9nfMx9llh
         6uXVOaKo7LSkSz0gsZKSRWsPgy7I41202a5vzyVj7WKP9MeQwZPFWYJKhDn2Q+XXX3dN
         C1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fVqvPIG5A/mi9HgIkXz+kA5IrsAiUI6du4yFBWMcFQ8=;
        b=X/uftvF3M6yUF/MBr0gR+98q+p8PmTxxe2V5ZKf4JbUGLpv4KoUi79PaCMzM33d+Jt
         vOYvWu/nJK9aX5cI83yt9vQWwpWezkMDI2X8/YW9s/+GE57AZcjYOIq9+VB5QN+SDMa7
         0ozMxu2L1h7zTFG1a8h6/sJshGGDynSI5DPNQER8bMjiAK5Tqb6cCbOSVmDjjXYis4i0
         Ny/5x5y2RHvmEfgeiwpFQY5MxDeYIHyOwJKiTQYwAfGKmqdjLowqz+psCbr33o4Bh4C5
         tVC/8+H7Ua5Wh7aFmNgLusU4E7yzgEV8P0AFxH7pVHo0fAfVgVJSRKIxsuGx0xKQSaxH
         XM8g==
X-Gm-Message-State: AOAM533l4i9ZVBORF9cs+4XhTZQ4u9Jxjtt7yt6x6gBwoHk40bPxRMdI
        uPIsJ+qGrv3JcKJpWhnmz10AUT22iMI=
X-Google-Smtp-Source: ABdhPJwsvYgtOFYsQl9kXLANqa6EWBEEOmv1Vbbip56tHSyRyaADYJsX02vJlWhuQQKuE62KOzUWTA==
X-Received: by 2002:a19:c8a:: with SMTP id 132mr4210609lfm.23.1594975584924;
        Fri, 17 Jul 2020 01:46:24 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:493:d824:8803:951c:2276:44f? ([2a00:1fa0:493:d824:8803:951c:2276:44f])
        by smtp.gmail.com with ESMTPSA id r11sm1536585ljj.76.2020.07.17.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 01:46:24 -0700 (PDT)
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <ce783c83-84d5-5c2c-5619-39384147fed0@gmail.com>
Date:   Fri, 17 Jul 2020 11:46:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 17.07.2020 0:58, Thinh Nguyen wrote:

> USB 3.2 specification supports dual-lane for super-speed-plus. USB
> devices may operate at different sublink speeds. To avoid using magic
> numbers and capture the sublink speed better, introduce the
> usb_sublink_speed structure and various sublink speed attribute enum.
> 
> See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>   include/uapi/linux/usb/ch9.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 2b623f36af6b..d4fd403a3664 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -1145,6 +1145,48 @@ enum usb_device_speed {
>   	USB_SPEED_SUPER_PLUS,			/* usb 3.1 */
>   };
>   
> +/* USB 3.2 sublink speed attributes */
> +
> +enum usb_lane_speed_exponent {
> +	USB_LSE_BPS = 0,
> +	USB_LSE_KBPS = 1,
> +	USB_LSE_MBPS = 2,
> +	USB_LSE_GBPS = 3,
> +};
> +
> +enum usb_sublink_type {
> +	USB_ST_SYMMETRIC_RX = 0,
> +	USB_ST_ASYMMETRIC_RX = 1,
> +	USB_ST_SYMMETRIC_TX = 2,
> +	USB_ST_ASYMMETRIC_TX = 3,
> +};
> +
> +enum usb_link_protocol {
> +	USB_LP_SS = 0,
> +	USB_LP_SSP = 1,
> +};
> +
> +/**
> + * struct usb_sublink_speed - sublink speed attribute
> + * @id: sublink speed attribute ID (SSID)
> + * @mantissa: lane speed mantissa
> + * @exponent: lane speed exponent
> + * @sublink type: sublink type

    It's called just 'type' below.

> + * @protocol: sublink protocol
> + *
> + * Super-speed-plus supports multiple lanes. Use the sublink speed attributes to
> + * describe the sublink speed.
> + *
> + * See USB 3.2 spec section 9.6.2.6 for super-speed-plus capability for more
> + * information.
> + */
> +struct usb_sublink_speed {
> +	u8				id;
> +	u16				mantissa;
> +	enum usb_lane_speed_exponent	exponent;
> +	enum usb_sublink_type		type;
> +	enum usb_link_protocol		protocol;
> +};
>   
>   enum usb_device_state {
>   	/* NOTATTACHED isn't in the USB spec, and this state acts

MBR, Sergei


