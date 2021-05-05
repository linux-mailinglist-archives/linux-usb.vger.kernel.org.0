Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1DB3738B1
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 12:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhEEKnN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 06:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31009 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhEEKnL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 06:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620211335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mTN0y4oCcFWbB08r7lkZ4UjVsFr6S/2p9fg9DPkTRUA=;
        b=f7ieV3PsBlgkdaZUZkq3M2w9iSPaJpnjCUrT/Jr/+Roxr7P7P1gQPugd/yIbb0P4zgNYOO
        lzNTKPfpg8nFNe+Q70WpQfIxR0FncsRXOEb5eNi+eaCzjKajluhVYLpcLQlCEuxQzeLX+d
        XQKHTIoLbWoyIDPoj7HU/pF7oZ1C8uY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-wGj6FBURPfy0Zo4HnCzvCA-1; Wed, 05 May 2021 06:42:14 -0400
X-MC-Unique: wGj6FBURPfy0Zo4HnCzvCA-1
Received: by mail-ej1-f69.google.com with SMTP id w2-20020a1709062f82b0290378745f26d5so289676eji.6
        for <linux-usb@vger.kernel.org>; Wed, 05 May 2021 03:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mTN0y4oCcFWbB08r7lkZ4UjVsFr6S/2p9fg9DPkTRUA=;
        b=i7h6yj6KLXE1OjfUM9rb+9Bvj1jpu1JAhl6ymk0sWKcycv678pJdEBqUx7WY1yM48g
         N03x1vyNOBRJHiC0qcmiC7FlgIbMt/4y27LBHjbJR4inSaI7GOL30LStD6wE+oe/AT8u
         WJIwFmQST/7FGYjrvxZo1lblwzFdOVsznQoSRNu0HEsE0GsX27BG+fMDqWIdznWVYper
         9MueiFpDL/WZYSJ0noJLIlP62k/TqSxUuXTT5MAm4+uc9PjF0q46tIzF5yf7ohRygAtX
         0eK8C+ovpb0EXqfB5cHLgVxi9oNZ7UybGlFLeZtqb1YTIkC3Rebt1Ov9G2tlewcLJBYT
         bTDQ==
X-Gm-Message-State: AOAM531TIQaeCOmCFCCCKVOtEbQjHKGhroF5YUPES/CoGChpj6UXIlDL
        7teJTCbPgB65rTjIU0IvAsAZOoNKcgE1txZoOxqkxPCWJ20VdTm9F5S888N19WuzLQbRhBC/E3b
        NhG+h/Tfp0Bq768ejLswSspmPYHmwx3i8qF24rLR12z7DWJdwDtzqkKvtCGqjS9tgnxy+Hil0
X-Received: by 2002:a17:906:abcc:: with SMTP id kq12mr10305579ejb.97.1620211332856;
        Wed, 05 May 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT5NzeVG+LfxMtGXKXQs9mkRuGS75LOBk4BPyRER/VEFGmrGVCJeDof9BEBpxs3KV/LWSyYw==
X-Received: by 2002:a17:906:abcc:: with SMTP id kq12mr10305549ejb.97.1620211332659;
        Wed, 05 May 2021 03:42:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d15sm2632188ejj.42.2021.05.05.03.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 03:42:12 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Imre Deak <imre.deak@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
 <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
 <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a56b7d60-39a0-8520-8b38-82c0789e4442@redhat.com>
Date:   Wed, 5 May 2021 12:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/5/21 11:50 AM, Heikki Krogerus wrote:
> On Tue, May 04, 2021 at 05:35:49PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/4/21 5:10 PM, Heikki Krogerus wrote:
>>>> +/**
>>>> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>>> + * @connector: connector to report the event on
>>>> + * @data: data related to the event
>>>> + *
>>>> + * On some hardware a hotplug event notification may come from outside the display
>>>> + * driver / device. An example of this is some USB Type-C setups where the hardware
>>>> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
>>>> + * status bit to the GPU's DP HPD pin.
>>>> + *
>>>> + * This function can be used to report these out-of-band events after obtaining
>>>> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>>> + */
>>>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>>>> +				     struct drm_connector_oob_hotplug_event_data *data)
>>>> +{
>>>> +	struct drm_connector *connector;
>>>> +
>>>> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
>>>> +	if (IS_ERR(connector))
>>>> +		return;
>>>> +
>>>> +	if (connector->funcs->oob_hotplug_event)
>>>> +		connector->funcs->oob_hotplug_event(connector, data);
>>>> +
>>>> +	drm_connector_put(connector);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
>>>
>>> So it does looks like the "data" parameter is not needed at all:
>>
>> Well Imre did indicate that having the number of lanes is useful, so
>> for the next version I'll drop the orientation but I plan to keep
>> the number of lanes if that is ok with you.
>>
>> Not having passing along this info was one of the reasons why my
>> previous attempt at this was nacked, so dropping it all together
>> feels wrong.
> 
> If you need to pass any information to the function, then you need to
> pass all the information that we have. Don't start with abstraction.
> First create a dedicated API, and then, only if we really have another
> user for it, we can add an abstraction layer that both users can use.
> All cases are going to be different. We don't know how the abstraction
> / generalisation should look like before we have at least two real
> users (ideally more than two, actually). Right now we can not even say
> for sure that generalising the API is even possible.
> 
> I would not make a huge deal out of this unless I wasn't myself being
> told by guys like Greg KH in the past to drop my attempts to
> "generalize" things from the beginning when I only had a single user.
> By doing so you'll not only force all ends, the source of the data
> (the typec drivers in this case) as well as the consumer (i915), to be
> always changed together, it will also confuse things. We are not
> always going to be able to tell the lane count for example like we can
> with USB Type-C, so i915 can't really rely on that information.
> 
> Right now we also don't know what exact details i915 (or what ever GPU
> driver) needs. We can only say for sure that some details are going to
> be needed. Trying to guess and cherry-pick the details now does not
> makes sense because of that reason too.
> 
> So just make this API USB Type-C DP Alt Mode specific API first, and
> supply it everything we have.

Hmm, ok I'll just drop the data argument all together for now (as you
already suggested); and then we can see what is best once an actual user
for the info shows up.

Regards,

Hans

