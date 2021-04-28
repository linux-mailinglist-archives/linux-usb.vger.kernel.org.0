Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CC036E14F
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 23:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhD1V62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 17:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229488AbhD1V62 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 17:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619647062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
        b=isMk/ShDTvrjBD0s2tf3AYdgo6t81kDv9JZHu69oQWqIIwIMdBDtLryYFzb5tCTGoKS3r3
        YGzOuLnXdCcZKMcu/qs8pBWIpL32Gw5blzGn3wuF4xjiaByy//sL5G5czsnhzukCOXLXdB
        d5nzXZptyTvyjfzDKyF2qxwTrV8g5tI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-g1gcLULsOoeQaoQh54Gjfw-1; Wed, 28 Apr 2021 17:57:41 -0400
X-MC-Unique: g1gcLULsOoeQaoQh54Gjfw-1
Received: by mail-ed1-f69.google.com with SMTP id d13-20020a056402144db0290387e63c95d8so3006008edx.11
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 14:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
        b=BJX55Tm4LxvM5jLffmMHSDu7FPgBYbcz/quk4i1IvRnVIef9oNj+h2KfJ9leITuAO/
         cgBcr9sqozmGq44ea5PG7XsRaVSiXR0CClWv/60iBS61knUq8pwowIqkNGIkRG/74xo6
         lkzfFlG9t2I9J0IvI2HKk6KFqfWIAYBiRQJAFItnypOjcOljAVTpHhLHsbyY7EvFZi3q
         4fOnC7ybKATG+Nx8rtA5CC0NYYS8Jo1N3jO2/cMeeupOM7/foqOPzasVQlpGlbzhEf2p
         zzkMuxojlfITBW4X3LO+F639im4a7nqPOD7Ipf1Iq0MAAXWo8NVM4N15l4+OEuH8++mZ
         rJYA==
X-Gm-Message-State: AOAM530UPthkDFOSgnUn+eUkNafyV7c1cTCOKgNcVhawlRb9m1Qk6Cmt
        Bix3KOI4nLW5DAWDYhGEEl/wf2e5MY/feCM15TQLFOwFZ3OeNV8Yj0kP6dvV9kZxaK4YTkqEu1v
        QcMHmYktJXbtltbJ2+BHalBn+jyQ0nqIoyICigUeg+/SH3DDnsq0omdd5gZ99HiV6GxX6xibv
X-Received: by 2002:a17:906:858:: with SMTP id f24mr24786331ejd.347.1619647059540;
        Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBzmKGVeKYZXxAE1Z2T5grGU6G8KanK3krK5U625IYhTpXdUp6CVhhZxRndNJbLKTcxcgQdg==
X-Received: by 2002:a17:906:858:: with SMTP id f24mr24786299ejd.347.1619647059283;
        Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r17sm819538edt.70.2021.04.28.14.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 14:57:38 -0700 (PDT)
Subject: Re: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band hotplug
 notification
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
References: <20210428215257.500088-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81d7d021-d8b7-74ec-784b-40b50bba3f21@redhat.com>
Date:   Wed, 28 Apr 2021 23:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/28/21 11:52 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is a new attempt to make DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> For anyone interested here are the old (2019!) patches for this:
> 
> https://patchwork.freedesktop.org/patch/288491/
> https://patchwork.freedesktop.org/patch/288493/
> https://patchwork.freedesktop.org/patch/288495/
> 
> Last time I posted this the biggest change requested was for more info to
> be included in the event send to the DRM-subsystem, specifically sending
> the following info was requested:
> 
> 1. Which DP connector on the GPU the event is for
> 2. How many lanes are available
> 3. Connector orientation
> 
> This series is basically an entirely new approach, which no longer
> uses the notifier framework at all. Instead the Type-C code looksup
> a connector based on a fwnode (this was suggested by Heikki Krogerus)
> and then calls a new oob_hotplug_event drm_connector_func directly
> on the connector, passing the requested info as argument.

p.s.

Info such as the orientation and the number of dp-lanes is now passed
to the drm_connector_oob_hotplug_event() function as requested in the
review of the old code, but nothing is done with it for now.
Using this info falls well outside of my knowledge of the i915 driver
so this is left to a follow-up patch (I will be available to test
patches for this).

Regards,

Hans

