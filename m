Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647D53736BF
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 11:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhEEJIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 05:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60788 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231936AbhEEJI3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 05:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620205652;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pz7sbaRfy/0TDXOC1f1al0lW9VaNbTkpWQsSLCYv29M=;
        b=MB2CXRQ08vb43pBqzfSfBiqlly3VHZaz2w2FhMdp3kphXJwFAlwNhzwNbze6RbncsNBpE1
        Cb6elvIQJv/AR5x+0+qDIefo0yQuadbZf9wKRkyc1uEj7Rp26U62ImoUqoBufWHsuC89+f
        PBb8hYq+1ihRq3YmnT53D2PrPtKa01U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-QuUK9CujMoCR7hQvLtvd1Q-1; Wed, 05 May 2021 05:07:31 -0400
X-MC-Unique: QuUK9CujMoCR7hQvLtvd1Q-1
Received: by mail-ej1-f71.google.com with SMTP id x21-20020a1709064bd5b029037c44cb861cso221524ejv.4
        for <linux-usb@vger.kernel.org>; Wed, 05 May 2021 02:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pz7sbaRfy/0TDXOC1f1al0lW9VaNbTkpWQsSLCYv29M=;
        b=ubQBfae7Ongg2C+2K2NFA9awsJGaLLmfLXw0wO2VqL9d5dszrqlJroGafoLldfZvgA
         UJ9LYJOZWnd21YhbIKMmfI8IxQK1i5n3EDSbnBY0hF2yxcNnlv/dNyzZNkwJirjchK9T
         FSkEUr13NimNcHPmX8Iq7E3R2U6uc+LqHyi/dZIuJujscutYTklo0KOPtzXzgxKFclYT
         c61tZKdugIv4BNTklSQ57K5pwXK1ka4dpmNbbvQZFOZV9W/Bh7hxUV+D/2Wf558LSQ4e
         WVfmFtaPATNpVapnDd+QjV+2eSyxDKU4+Wte6alm2JFL22dH8vT6Tfm4K0z8Xj2BGQAY
         qtfw==
X-Gm-Message-State: AOAM5315GflOd2+xYVz+saSurrCLqO6G9/ZZRkxvc7j4ftBkahny3frU
        8/cCQWwjAXsyOpdHcWBye3XNB61nXzHmKz7OTnxS33cKB641qgVZpYestoZqj+9dFPJR4dES/zw
        /gazC2mLJT7ivqU3BABcuvFZZEFpiKgCjnyGBv9PjjS5KMu/0zGbdm+j85XVO7tGipC6dzlu7
X-Received: by 2002:a17:906:c44d:: with SMTP id ck13mr10615500ejb.371.1620205649607;
        Wed, 05 May 2021 02:07:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYSqa+65exu1dZH3dzcl5zEnOuL6llMbBzQ2JuYFwFzYzWAo51kMx9iphvKpmwQvNoBgHgUA==
X-Received: by 2002:a17:906:c44d:: with SMTP id ck13mr10615471ejb.371.1620205649348;
        Wed, 05 May 2021 02:07:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z26sm2553845ejl.38.2021.05.05.02.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 02:07:28 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
Date:   Wed, 5 May 2021 11:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/4/21 9:52 AM, Andy Shevchenko wrote:
> 
> 
> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     From: Heikki Krogerus <heikki.krogerus@linux.intel.com <mailto:heikki.krogerus@linux.intel.com>>
> 
>     On Intel platforms we know that the ACPI connector device
>     node order will follow the order the driver (i915) decides.
>     The decision is made using the custom Intel ACPI OpRegion
>     (intel_opregion.c), though the driver does not actually know
>     that the values it sends to ACPI there are used for
>     associating a device node for the connectors, and assigning
>     address for them.
> 
>     In reality that custom Intel ACPI OpRegion actually violates
>     ACPI specification (we supply dynamic information to objects
>     that are defined static, for example _ADR), however, it
>     makes assigning correct connector node for a connector entry
>     straightforward (it's one-on-one mapping).
> 
>     Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com <mailto:heikki.krogerus@linux.intel.com>>
>     [hdegoede@redhat.com <mailto:hdegoede@redhat.com>: Move intel_acpi_assign_connector_fwnodes() to
>      intel_acpi.c]
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>      drivers/gpu/drm/i915/display/intel_acpi.c    | 40 ++++++++++++++++++++
>      drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
>      drivers/gpu/drm/i915/display/intel_display.c |  1 +
>      3 files changed, 44 insertions(+)
> 
>     diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
>     index 833d0c1be4f1..9f266dfda7dd 100644
>     --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>     +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>     @@ -263,3 +263,43 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>             }
>             drm_connector_list_iter_end(&conn_iter);
>      }
>     +
>     +/* NOTE: The connector order must be final before this is called. */
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
>     +{
>     +       struct drm_connector_list_iter conn_iter;
>     +       struct drm_device *drm_dev = &i915->drm;
>     +       struct device *kdev = &drm_dev->pdev->dev;
>     +       struct fwnode_handle *fwnode = NULL;
>     +       struct drm_connector *connector;
>     +       struct acpi_device *adev;
>     +
>     +       drm_connector_list_iter_begin(drm_dev, &conn_iter);
>     +       drm_for_each_connector_iter(connector, &conn_iter) {
>     +               /* Always getting the next, even when the last was not used. */
>     +               fwnode = device_get_next_child_node(kdev, fwnode);
>     +               if (!fwnode)
>     +                       break;
> 
> 
> 
> Who is dropping reference counting on fwnode ?

We are dealing with ACPI fwnode-s here and those are not ref-counted, they
are embedded inside a struct acpi_device and their lifetime is tied to
that struct. They should probably still be ref-counted (with the count
never dropping to 0) so that the generic fwnode functions behave the same
anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
in drivers/acpi/property.c which is the get_next_child_node() implementation
for ACPI fwnode-s.

> I’m in the middle of a pile of fixes for fwnode refcounting when for_each_child or get_next_child is used. So, please double check you drop a reference.

The kdoc comments on device_get_next_child_node() / fwnode_get_next_child_node()
do not mention anything about these functions returning a reference.

So I think we need to first make up our mind here how we want this all to
work and then fix the actual implementation and docs before fixing callers.

Regards,

Hans




>  
> 
>     +
>     +               switch (connector->connector_type) {
>     +               case DRM_MODE_CONNECTOR_LVDS:
>     +               case DRM_MODE_CONNECTOR_eDP:
>     +               case DRM_MODE_CONNECTOR_DSI:
>     +                       /*
>     +                        * Integrated displays have a specific address 0x1f on
>     +                        * most Intel platforms, but not on all of them.
>     +                        */
>     +                       adev = acpi_find_child_device(ACPI_COMPANION(kdev),
>     +                                                     0x1f, 0);
>     +                       if (adev) {
>     +                               connector->fwnode = acpi_fwnode_handle(adev);
>     +                               break;
>     +                       }
>     +                       fallthrough;
>     +               default:
>     +                       connector->fwnode = fwnode;
>     +                       break;
>     +               }
>     +       }
>     +       drm_connector_list_iter_end(&conn_iter);
>     +}
>     diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
>     index e8b068661d22..d2435691f4b5 100644
>     --- a/drivers/gpu/drm/i915/display/intel_acpi.h
>     +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
>     @@ -12,11 +12,14 @@ struct drm_i915_private;
>      void intel_register_dsm_handler(void);
>      void intel_unregister_dsm_handler(void);
>      void intel_acpi_device_id_update(struct drm_i915_private *i915);
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
>      #else
>      static inline void intel_register_dsm_handler(void) { return; }
>      static inline void intel_unregister_dsm_handler(void) { return; }
>      static inline
>      void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>     +static inline
>     +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
>      #endif /* CONFIG_ACPI */
> 
>      #endif /* __INTEL_ACPI_H__ */
>     diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>     index 828ef4c5625f..87cad549632c 100644
>     --- a/drivers/gpu/drm/i915/display/intel_display.c
>     +++ b/drivers/gpu/drm/i915/display/intel_display.c
>     @@ -14970,6 +14970,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
> 
>             drm_modeset_lock_all(dev);
>             intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
>     +       intel_acpi_assign_connector_fwnodes(i915);
>             drm_modeset_unlock_all(dev);
> 
>             for_each_intel_crtc(dev, crtc) {
>     -- 
>     2.31.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

