Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CD33738C6
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 12:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbhEEKpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 06:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232226AbhEEKph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 06:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620211476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D8317tVLe7KUvXC09G6GyS987twLdZ4cyuo5A5o+ofI=;
        b=eH8U32GKdATemNtNU10WAflfdfMUia72HtjkW83RqcT9hCxjnVuccB0oxohBxaFoivyF1F
        JHtRLiNJ2qrFtmF3cTmHoQiGon0Vk3Mr7UoiFcV1tjzmuGV3GI14bB9dHTXHd7D8GV7n1J
        De5Orms4evlc0Lwx7PPTjRAdl3K5plo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-HERHoFlSPZGh1qRzPG-_MA-1; Wed, 05 May 2021 06:44:35 -0400
X-MC-Unique: HERHoFlSPZGh1qRzPG-_MA-1
Received: by mail-ed1-f70.google.com with SMTP id g17-20020aa7dd910000b029038843570b67so647259edv.9
        for <linux-usb@vger.kernel.org>; Wed, 05 May 2021 03:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D8317tVLe7KUvXC09G6GyS987twLdZ4cyuo5A5o+ofI=;
        b=ZKb2NQ7q8LRKnP0FeUk/H0C7QRHHcSe/cbFbk+Z8/7Fa865sP02rwnjTGLA+2+meEB
         DyDW87FJZfTFmogdY6MCL01EA4gb17G8xJJvy68tGHsP3u5ElW7dDfnZzMpzw7Xr+Lw+
         ZjipP+cHO2yxsNCHBVVxiYeNiwtCX7RBFQd9UWwfB5WzvEvPplfsw0rLOR+PcYtcJ1fi
         XNaMvYWTd+0Ju0/1Ts7LDslpqHf8s66mBi3sD1Bw2Qx6Wy0tnRXVVTnr6Ni4oljIVCc1
         gS5G26dLQO+YiJAU0S5FmBry8YZ9srRuiqXzd2yiHMP9wbJBnEPDtQata+E09j+NtL31
         MDHQ==
X-Gm-Message-State: AOAM53017qagy2hRdE1+/ZxMQBbIw6YvTovzAr6ZlpOfzOjZDQ+jwLYi
        uYKTTj3gmAXUxQw2S9/zHca/zTIATYGlbUNxNfO41oeDJpANqvDocyQiv+2YAEwLE1VRglM7+wv
        8gw8tzkaAmYKuYtSAWS0AsZndwSnCAXz0JGu/YpAxl73mggNvChrlSuVJ/gw95t1mAMEdUv7n
X-Received: by 2002:a17:906:4a13:: with SMTP id w19mr2768023eju.533.1620211473902;
        Wed, 05 May 2021 03:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9TxBnFcM0pbX6pLK+U0KVaA5VXQIH9Zr2v/Cvoge0CfqACkcP1Bcqo5txeqKIySeQSu5IGQ==
X-Received: by 2002:a17:906:4a13:: with SMTP id w19mr2767996eju.533.1620211473655;
        Wed, 05 May 2021 03:44:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c12sm17705253edx.54.2021.05.05.03.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 03:44:33 -0700 (PDT)
Subject: Re: [PATCH 8/9] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-9-hdegoede@redhat.com>
 <YJJwukxJfi9gGKcf@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1bd8e7e8-c8d3-5846-fd5c-acf4c35678b7@redhat.com>
Date:   Wed, 5 May 2021 12:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJwukxJfi9gGKcf@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 5/5/21 12:17 PM, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Mon, May 03, 2021 at 05:46:46PM +0200, Hans de Goede wrote:
>> Use the new drm_connector_find_by_fwnode() and
>> drm_connector_oob_hotplug_event() functions to let drm/kms drivers
>> know about DisplayPort over Type-C hotplug events.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
>> ---
>>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>>  drivers/usb/typec/altmodes/displayport.c | 40 +++++++++++++++++++++++-
>>  2 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
>> index 60d375e9c3c7..1a6b5e872b0d 100644
>> --- a/drivers/usb/typec/altmodes/Kconfig
>> +++ b/drivers/usb/typec/altmodes/Kconfig
>> @@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
>>  
>>  config TYPEC_DP_ALTMODE
>>  	tristate "DisplayPort Alternate Mode driver"
>> +	depends on DRM
>>  	help
>>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>>  	  displays and adapters to be attached to the USB Type-C
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index aa669b9cf70e..f00dfc5c14b6 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -11,8 +11,10 @@
>>  #include <linux/delay.h>
>>  #include <linux/mutex.h>
>>  #include <linux/module.h>
>> +#include <linux/property.h>
>>  #include <linux/usb/pd_vdo.h>
>>  #include <linux/usb/typec_dp.h>
>> +#include <drm/drm_connector.h>
>>  #include "displayport.h"
>>  
>>  #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
>> @@ -62,12 +64,30 @@ struct dp_altmode {
>>  	struct work_struct work;
>>  	struct typec_altmode *alt;
>>  	const struct typec_altmode *port;
>> +	struct fwnode_handle *connector_fwnode;
>>  };
>>  
>> +static void dp_altmode_notify_connector(struct dp_altmode *dp)
>> +{
>> +	struct drm_connector_oob_hotplug_event_data data = { };
>> +	u8 pin_assign = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
>> +
>> +	data.connected = dp->data.status & DP_STATUS_HPD_STATE;
>> +	data.orientation = typec_altmode_get_orientation(dp->alt);
>> +
>> +	if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
>> +		data.dp_lanes = 4;
>> +	else if (pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
>> +		data.dp_lanes = 2;
>> +
>> +	drm_connector_oob_hotplug_event(dp->connector_fwnode, &data);
>> +}
>> +
>>  static int dp_altmode_notify(struct dp_altmode *dp)
>>  {
>>  	unsigned long conf;
>>  	u8 state;
>> +	int ret;
>>  
>>  	if (dp->data.conf) {
>>  		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
>> @@ -76,7 +96,12 @@ static int dp_altmode_notify(struct dp_altmode *dp)
>>  		conf = TYPEC_STATE_USB;
>>  	}
>>  
>> -	return typec_altmode_notify(dp->alt, conf, &dp->data);
>> +	ret = typec_altmode_notify(dp->alt, conf, &dp->data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dp_altmode_notify_connector(dp);
> 
> That is now going to be always called after configuration, right? The
> HPD is not necessarily issued at that point.
> 
> I think that should be called from dp_altmode_status_update(), and
> probable only if there really is HPD IRQ or HPD State changes... I
> think?

I did see this triggering a bit more often then necessary on the initial
plugin of a DP-altmode capable Type-C "dongle", so what you are suggesting
makes sense. I'll come up with a better approach for the next version.

Regards,

Hans

