Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2B425D59F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 12:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbgIDKFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 06:05:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31301 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726114AbgIDKFa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Sep 2020 06:05:30 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-BhmZ8EV4NR2iOvP8sRfVlA-1; Fri, 04 Sep 2020 06:05:26 -0400
X-MC-Unique: BhmZ8EV4NR2iOvP8sRfVlA-1
Received: by mail-ed1-f71.google.com with SMTP id b12so2496503edw.15
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2020 03:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cMyogM8ZaAuNV7IxlLfX+jXiTjjJ4VPOtsKDCg2OR6A=;
        b=mC55OTn2OTN0ba0rzmh/BFot8jddAyzE2EElrhYuNmBLc9wE+aE16owpKSW7491OYj
         P2WT/O/g38BPyfdl+HeVeJsKlnGSbGsdLO/7Sf/sWxcxUq0eC+34sAtIl4t3Kp8PXihZ
         6SjJ4o+8gyGJiC8QofH1vjbFFnHZrjaHYSQXG3H4DsSBPA7OBwnsO7UZTe809VEov96X
         4JO+O+4OqJpsxzcs53ZIlfTfAuPYqBvhHNOXVBdIyXADsVBjb0VJgcDU5d2W6gx6DBFm
         vH4TNKBB19uk83YPKZ2GlJYASllO2yrTQarvZ/H0R+QBAtrnwP9Ow1RhOwrqT22JdKgF
         N39g==
X-Gm-Message-State: AOAM53188P48qe9pjsJc/wRit0blF5uP1yEOZo01DoEB8cxwqN3uOEyp
        a0sogo7aYLIIAOo35uVyVv2EWoNrrVO2NcBuhBZWrmyY0QxkOvV2T0ziV9wWM08xAivi5LP10Yl
        7fSG5s9EOLlTSEin8SNJh
X-Received: by 2002:a17:906:6805:: with SMTP id k5mr6211690ejr.397.1599213925695;
        Fri, 04 Sep 2020 03:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6nPPe8mUMfr66/fT4ciZ4Zhe4GtwODi5MgFU85csrnkDnHN8nJsAEcKFSHNX1KN2Z4xR87Q==
X-Received: by 2002:a17:906:6805:: with SMTP id k5mr6211680ejr.397.1599213925469;
        Fri, 04 Sep 2020 03:05:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id x1sm5595434ejc.119.2020.09.04.03.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 03:05:24 -0700 (PDT)
Subject: Re: [PATCH v3] HID: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk
 for BYD zhaoxin notebook
To:     Penghao <penghao@uniontech.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     johan@kernel.org, dlaz@chromium.org, stern@rowland.harvard.edu,
        kerneldev@karsmulder.nl, jonathan@jdcox.net, tomasz@meresinski.eu
References: <20200904091322.30426-1-penghao@uniontech.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f519d8a0-9082-13c5-0222-40dd9a1fac36@redhat.com>
Date:   Fri, 4 Sep 2020 12:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904091322.30426-1-penghao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/4/20 11:13 AM, Penghao wrote:
> Add a USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for the BYD zhaoxin notebook.
> This notebook come with usb touchpad. And we would like to disable touchpad
> wakeup on this notebook by default.

You are still not explaining why this is necessary ?

And you did not answer my question if this touchpad is using hid-multitouch
either ?

So NACK (rejection) from me until both questions are answered. The commi
message for a quirk should always explain why a quirk is necessary and
"we would like to disable touchpad wakeup on this notebook by default"
does not explain why you want to do that.

Regards,

Hans



> 
> Signed-off-by: Penghao <penghao@uniontech.com>
> ---
> 
> Changes since v2:
>   - Add changes
> 
> Changes since v1:
>   - Add the entries sorted by vendor ID and product ID.
> 
>   drivers/usb/core/quirks.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 7c1198f80c23..fffe1f7f1098 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -393,6 +393,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>   	/* Generic RTL8153 based ethernet adapters */
>   	{ USB_DEVICE(0x0bda, 0x8153), .driver_info = USB_QUIRK_NO_LPM },
>   
> +	/* SONiX USB DEVICE Touchpad */
> +	{ USB_DEVICE(0x0c45, 0x7056), .driver_info =
> +			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>   	/* Action Semiconductor flash disk */
>   	{ USB_DEVICE(0x10d6, 0x2200), .driver_info =
>   			USB_QUIRK_STRING_FETCH_255 },
> 

