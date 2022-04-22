Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A239750C4E5
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 01:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiDVX2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 19:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbiDVX1v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 19:27:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659B36A079
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 16:07:20 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c15so11299880ljr.9
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+omz4SMiA/FNbw95hOPG0uMbW0wRTZgF74DNTyZ1LWc=;
        b=I/NIktzovazHXTI+cvhlhV9xzuiGibqKWatXMqYxYGOOltJWseZmRAqYso6HzDOS5a
         ZfUzziSbcLebwm6A60cWOUaOS+dnVp60vY0sOP+fdkV6SZSHdxu27EZhVNwKwDXGp6VX
         xV25HF9pad5mCDRNhfGfSFDdaeXDbsAPgVy9Ey/lsykb9jZVb45clqD+AUTY9cOxrkKD
         Uu1JzYUcj3jpoIiOTdXBZpxx+bwaKFIxpGcCNuFzgXTZuF9WOQyjrqW/rkPMISh7LW19
         vhgb3Ebjk6PaV/tQuiDvw1+9DHlt/DCYl+XoFiu0Mxs+gEIOxqNLCpSqJU32zxVtvA9i
         sALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+omz4SMiA/FNbw95hOPG0uMbW0wRTZgF74DNTyZ1LWc=;
        b=dgCy0EEaLgP5fk4U4+1IiHVDQrcNw3HiczpLcLpp2m6CnmTOaE+1m5iLjaj5Xam4B7
         YPkAtueABdBPOCUnCoHEwbqrI6UjGTMoPqVvXBmT540+hCIXVIcSXcLicPfCEnvUJFaO
         JNujtLpDkMfhzqyk6kTEduVeOrVrp7VgBv0wA6y2FJI41qgdexrQuG3Tm6/d/2tufa+U
         VgVbf4aVzBqs8NWNzlk2PavWwvxKsXVaBg3yX9I/WbGIAhL+T03JvuRhtLECDJUnnKYO
         lTYuUSYz2ciWi+7CGPLz4anQVMZo7qKxhpym+HDO2/hNJMh6BW84hPm1MkuO6BMlGO3z
         HPzg==
X-Gm-Message-State: AOAM532MGMzmpnyxShBWcamyooOdS9b9NEpmFIehLEiRiufh91qdzDTR
        B3VhouEbFYZ7KLgRc7jl/aZ54Q==
X-Google-Smtp-Source: ABdhPJy4QnX3N7jeqkRWD4a9h4+Eq/px39OkD/kxGlmlJUWO6Ndjf3tT/dOYJHX9KlseiTK3crayEw==
X-Received: by 2002:a2e:850f:0:b0:24d:bca4:b9ae with SMTP id j15-20020a2e850f000000b0024dbca4b9aemr4020026lji.109.1650668838623;
        Fri, 22 Apr 2022 16:07:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16-20020a192d10000000b0046ba99878a6sm385297lfj.17.2022.04.22.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 16:07:18 -0700 (PDT)
Message-ID: <11a77fd7-d30b-edf6-3570-64d0c2e1764c@linaro.org>
Date:   Sat, 23 Apr 2022 02:07:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/2] drm/msm/dp: Implement oob_hotplug_event()
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20220422223225.1297434-1-bjorn.andersson@linaro.org>
 <20220422223225.1297434-2-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220422223225.1297434-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/04/2022 01:32, Bjorn Andersson wrote:
> The Qualcomm DisplayPort driver contains traces of the necessary
> plumbing to hook up USB HPD, in the form of the dp_hpd module and the
> dp_usbpd_cb struct. Use this as basis for implementing the
> oob_hotplug_event() callback, by amending the dp_hpd module with the
> missing logic.
> 
> Overall the solution is similar to what's done downstream, but upstream
> all the code to disect the HPD notification lives on the calling side of
> drm_connector_oob_hotplug_event().
> 
> drm_connector_oob_hotplug_event() performs the lookup of the
> drm_connector based on fwnode, hence the need to assign the fwnode in
> dp_drm_connector_init().
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Rebased patch
> 
>   drivers/gpu/drm/msm/dp/dp_display.c |  9 +++++++++
>   drivers/gpu/drm/msm/dp/dp_display.h |  3 +++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 11 +++++++++++
>   drivers/gpu/drm/msm/dp/dp_hpd.c     | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_hpd.h     |  5 +++++
>   5 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a42732b67349..1019f6d8fd03 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -449,6 +449,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>   	return dp_display_process_hpd_high(dp);
>   }
>   
> +void dp_display_oob_hotplug_event(struct msm_dp *dp_display,
> +				  enum drm_connector_hpd_state hpd_state)
> +{
> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	dp->usbpd->oob_event(dp->usbpd, hpd_state);
> +}
> +
>   static int dp_display_usbpd_disconnect_cb(struct device *dev)
>   {
>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> @@ -1302,6 +1310,7 @@ static int dp_display_probe(struct platform_device *pdev)
>   	dp->pdev = pdev;
>   	dp->name = "drm_dp";
>   	dp->dp_display.connector_type = desc->connector_type;
> +	dp->dp_display.dev = &pdev->dev;
>   
>   	rc = dp_init_sub_modules(dp);
>   	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 7af2b186d2d9..16658270df2c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -11,6 +11,7 @@
>   #include "disp/msm_disp_snapshot.h"
>   
>   struct msm_dp {
> +	struct device *dev;
>   	struct drm_device *drm_dev;
>   	struct device *codec_dev;
>   	struct drm_bridge *bridge;
> @@ -40,5 +41,7 @@ bool dp_display_check_video_test(struct msm_dp *dp_display);
>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
>   void dp_display_signal_audio_complete(struct msm_dp *dp_display);
> +void dp_display_oob_hotplug_event(struct msm_dp *dp_display,
> +				  enum drm_connector_hpd_state hpd_state);
>   
>   #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 80f59cf99089..76904b1601b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -123,6 +123,14 @@ static enum drm_mode_status dp_connector_mode_valid(
>   	return dp_display_validate_mode(dp_disp, mode->clock);
>   }
>   
> +static void dp_oob_hotplug_event(struct drm_connector *connector,
> +				 enum drm_connector_hpd_state hpd_state)
> +{
> +	struct msm_dp *dp_disp = to_dp_connector(connector)->dp_display;
> +
> +	dp_display_oob_hotplug_event(dp_disp, hpd_state);
> +}
> +
>   static const struct drm_connector_funcs dp_connector_funcs = {
>   	.detect = dp_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> @@ -130,6 +138,7 @@ static const struct drm_connector_funcs dp_connector_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.oob_hotplug_event = dp_oob_hotplug_event,

We were (are) going to switch dp driver to use drm_bridge_connector (to 
fix support for bridge chains, eDP panels, etc.

So these changes must be ported to drm_bridge_connector (or we must 
abandon/defer the idea of using the bridge_connector).

For the oob_hotplug_event() callback proper support might be as simple 
as calling drm_bridge_connector_hpd_cb().

>   };
>   
>   static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
> @@ -160,6 +169,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> +	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
> +

This would be much more interesting. Supporting this in a generic way 
might be tricky. But we can still set the fwnode manually from the dp code.

>   	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
> index db98a1d431eb..cdb1feea5ebf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
> @@ -7,6 +7,8 @@
>   
>   #include <linux/slab.h>
>   #include <linux/device.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_print.h>
>   
>   #include "dp_hpd.h"
>   
> @@ -45,6 +47,24 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
>   	return rc;
>   }
>   
> +static void dp_hpd_oob_event(struct dp_usbpd *dp_usbpd,
> +			     enum drm_connector_hpd_state hpd_state)
> +{
> +	struct dp_hpd_private *hpd_priv = container_of(dp_usbpd, struct dp_hpd_private, dp_usbpd);
> +
> +	DRM_DEBUG_DP("hpd_state: %d connected: %d\n", hpd_state, dp_usbpd->connected);
> +
> +	if (!dp_usbpd->connected && hpd_state == DRM_CONNECTOR_HPD_HIGH) {
> +		dp_usbpd->connected = true;
> +		hpd_priv->dp_cb->configure(hpd_priv->dev);
> +	} else if (hpd_state == DRM_CONNECTOR_HPD_LOW) {
> +		dp_usbpd->connected = false;
> +		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
> +	} else {
> +		hpd_priv->dp_cb->attention(hpd_priv->dev);
> +	}
> +}
> +
>   struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
>   {
>   	struct dp_hpd_private *dp_hpd;
> @@ -62,6 +82,7 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
>   	dp_hpd->dp_cb = cb;
>   
>   	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
> +	dp_hpd->dp_usbpd.oob_event = dp_hpd_oob_event;
>   
>   	return &dp_hpd->dp_usbpd;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
> index 8feec5aa5027..4166e5fd3156 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.h
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
> @@ -29,7 +29,9 @@ enum plug_orientation {
>    * @hpd_irq: Change in the status since last message
>    * @alt_mode_cfg_done: bool to specify alt mode status
>    * @debug_en: bool to specify debug mode
> + * @connected: cable currently connected
>    * @connect: simulate disconnect or connect for debug mode
> + * @oob_event: deliver oob event to the usbpd code
>    */
>   struct dp_usbpd {
>   	enum plug_orientation orientation;
> @@ -41,8 +43,11 @@ struct dp_usbpd {
>   	bool hpd_irq;
>   	bool alt_mode_cfg_done;
>   	bool debug_en;
> +	bool connected;
>   
>   	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
> +	void (*oob_event)(struct dp_usbpd *dp_usbpd,
> +			  enum drm_connector_hpd_state hpd_state);
>   };
>   
>   /**


-- 
With best wishes
Dmitry
