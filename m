Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3548A388F3F
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 15:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241972AbhESNis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 09:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29408 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240097AbhESNis (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 May 2021 09:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
        b=i6MN8MVz7R3ysk03fjntuyFdWK6IDkzQsFPm/QA5LX0jFnbPJjebsR519XOZDJlMY0q/Xq
        UsqqA9hckm9eMb/aKWZBZWutXRvyvV1koM0ohkYtY2Moh0SAenTHzB7kxEK7BqJ6NcRwaU
        5VWDK+tS8rwwQV3+wJzpOOWFPVrF2hA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-dSw4mKstMnOf0AWomQeu7w-1; Wed, 19 May 2021 09:37:25 -0400
X-MC-Unique: dSw4mKstMnOf0AWomQeu7w-1
Received: by mail-ed1-f70.google.com with SMTP id w1-20020aa7da410000b029038d323eeee3so5658308eds.8
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 06:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bU4pryl0+5U5KV31mW2OweQfTQ6FVvGmzl3RdTyAV38=;
        b=qSxLKBfDRCtnTOEXQvozncBbLnqM16C27JaZuEmteNKcp1cynWml8zKVhmvSyiJYT6
         F0nvcngAz7vj3WIqYYm+cZVoNFb3hd81+UyoAtVHohbIZiLsrosuZtpyv4Jx5nw7SR1W
         T0HE8pGXvkAvssKs71QoDV5aerQ7XNov/c7/yCb3b2n6dclqdnXuykuJeQeiD3msd+KJ
         JuluzNoEfEWUhP/oyunWg5F5WMdfGv80OW1BZAGlsF9U3pmXTl8sS9IAkafkML/dZDyv
         tqlIW2v1d1V1SDR/ozvWMR/I9cXiWky8QQAzILOBtUDKcDFgMn0yjEQhQ1Rsg2yGSdlq
         2Jww==
X-Gm-Message-State: AOAM530HJFbq2gP9lnUL1MEwSKPZvRa6iwTSbWucmFDEGpqTpSsh8oxG
        WPoEsDk+5XTEhxsDvfl/lkvsOaAuEp5HTPF4m56k/8WXMkpPjW6T8fJwQsreRkBYZygsLZQG+Xo
        ree3G6M6CNBjbhRAapCKKs+m7OA6wH50OeLkfOjgzw5ZXy7PW9DU7zcYik7UMfkM5Fw7alhbg
X-Received: by 2002:a05:6402:3098:: with SMTP id de24mr14306481edb.339.1621431444335;
        Wed, 19 May 2021 06:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtmP5ppUfGnIYTS3emu23ErVRxU0Y2zdN/m68QRjcWJURyvbcDG+r+AD2UiWx7vPUAM3F1gg==
X-Received: by 2002:a05:6402:3098:: with SMTP id de24mr14306432edb.339.1621431444058;
        Wed, 19 May 2021 06:37:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a7sm4664820edr.15.2021.05.19.06.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:37:23 -0700 (PDT)
Subject: Re: [PATCH 9/9] platform/x86/intel_cht_int33fe: Correct "displayport"
 fwnode reference
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-10-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2d02c9ba-1385-41cf-6150-ca8ed5e835ba@redhat.com>
Date:   Wed, 19 May 2021 15:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210503154647.142551-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/3/21 5:46 PM, Hans de Goede wrote:
> The Type-C connector on these devices is connected to DP-2 not DP-1,
> so the reference must be to the DD04 child-node of the GPU, rather
> then the DD02 child-node.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Since this is pretty much independent from the rest of the series,
I'll take this upstream through the pdx86 tree.

I've added this to my review-hans branch now, and it will get added
to for-next from there.

Regards,

Hans



> ---
>  drivers/platform/x86/intel_cht_int33fe_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> index b61bad9cc8d2..d59544167430 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_typec.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> @@ -168,8 +168,8 @@ static int cht_int33fe_setup_dp(struct cht_int33fe_data *data)
>  		return -ENODEV;
>  	}
>  
> -	/* Then the DP child device node */
> -	data->dp = device_get_named_child_node(&pdev->dev, "DD02");
> +	/* Then the DP-2 child device node */
> +	data->dp = device_get_named_child_node(&pdev->dev, "DD04");
>  	pci_dev_put(pdev);
>  	if (!data->dp)
>  		return -ENODEV;
> 

