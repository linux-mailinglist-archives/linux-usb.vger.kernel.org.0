Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC8152832F
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbiEPL01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 07:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243175AbiEPL0F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 07:26:05 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FC8D138;
        Mon, 16 May 2022 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652700364; x=1684236364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rtKBn5k5pHF1j/ZQ6DlaX8fzQPJ8ryUBgGQCXLcd+aQ=;
  b=QhGri0gxb9ElwskUxG1wxy4S68rKylj0eXJ9kY+DDZtXf0Uxr/TudIYs
   ZMfAMl1RfYxISFtIuH9skqvsHOYWY0GN5RXabG1cueodCJKz9ySqeezYJ
   0h6qpZIpm/548TNPCTFVrbqpmxZbh5Wya5Z7sqR8jsGm6bQUOfQ0vl3pQ
   0UPA8J4eEd3x9rUuNfWOxyNuvNjZFvExca2/9kkiu0ZEH2fVE3JodFf4I
   jzTlPIy4j016YLC9XrYRAezwGWIUYYWFV+pagxS7JLyD534GQCE1P2D3v
   kWJ/OWOtaEreUKLRbPpK3kFJQ0f5Q77KLGAw9psfnIMpRXMe9MihDIEVK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="258372247"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="258372247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 04:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="713324156"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 16 May 2022 04:25:55 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 16 May 2022 14:25:55 +0300
Date:   Mon, 16 May 2022 14:25:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
Message-ID: <YoI0wx/LPK4ZrUFf@kuha.fi.intel.com>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
 <20220502165316.4167199-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502165316.4167199-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Hans

Hans, do you have any comments?

On Mon, May 02, 2022 at 09:53:13AM -0700, Bjorn Andersson wrote:
> In some implementations, such as the Qualcomm platforms, the display
> driver has no way to query the current HPD state and as such it's
> impossible to distinguish between disconnect and attention events.
> 
> Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
> state.
> 
> Also push the test for unchanged state in the displayport altmode driver
> into the i915 driver, to allow other drivers to act upon each update.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Transition to drm_connector_status instead of custom hpd_state 
> 
>  drivers/gpu/drm/drm_connector.c          |  6 ++++--
>  drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
>  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>  drivers/usb/typec/altmodes/displayport.c | 10 +++-------
>  include/drm/drm_connector.h              |  6 ++++--
>  5 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..e86c69f0640f 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2794,6 +2794,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>  /**
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
> + * @status: hot plug detect logical state
>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -2803,7 +2804,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * This function can be used to report these out-of-band events after obtaining
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> +				     enum drm_connector_status status)
>  {
>  	struct drm_connector *connector;
>  
> @@ -2812,7 +2814,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>  		return;
>  
>  	if (connector->funcs->oob_hotplug_event)
> -		connector->funcs->oob_hotplug_event(connector);
> +		connector->funcs->oob_hotplug_event(connector, status);
>  
>  	drm_connector_put(connector);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index e4a79c11fd25..56cc023f7bbd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4951,15 +4951,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
>  	return intel_modeset_synced_crtcs(state, conn);
>  }
>  
> -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
> +static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
> +				       enum drm_connector_status hpd_state)
>  {
>  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
> +	bool hpd_high = hpd_state == connector_status_connected;
> +	unsigned int hpd_pin = encoder->hpd_pin;
> +	bool need_work = false;
>  
>  	spin_lock_irq(&i915->irq_lock);
> -	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> +	if (hpd_high != test_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state)) {
> +		i915->hotplug.event_bits |= BIT(hpd_pin);
> +
> +		__assign_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state, hpd_high);
> +		need_work = true;
> +	}
>  	spin_unlock_irq(&i915->irq_lock);
> -	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> +
> +	if (need_work)
> +		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>  }
>  
>  static const struct drm_connector_funcs intel_dp_connector_funcs = {
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 24111bf42ce0..96c088bb5522 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -135,6 +135,9 @@ struct i915_hotplug {
>  	/* Whether or not to count short HPD IRQs in HPD storms */
>  	u8 hpd_short_storm_enabled;
>  
> +	/* Last state reported by oob_hotplug_event for each encoder */
> +	unsigned long oob_hotplug_last_state;
> +
>  	/*
>  	 * if we get a HPD irq from DP and a HPD irq from non-DP
>  	 * the non-DP HPD could block the workqueue on a mode config
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index c1d8c23baa39..9360ca177c7d 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -59,7 +59,6 @@ struct dp_altmode {
>  	struct typec_displayport_data data;
>  
>  	enum dp_state state;
> -	bool hpd;
>  
>  	struct mutex lock; /* device lock */
>  	struct work_struct work;
> @@ -143,10 +142,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  		if (!ret)
>  			dp->state = DP_STATE_CONFIGURE;
>  	} else {
> -		if (dp->hpd != hpd) {
> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> -			dp->hpd = hpd;
> -		}
> +		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> +						hpd ? connector_status_connected : connector_status_disconnected);
>  	}
>  
>  	return ret;
> @@ -573,8 +570,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  	cancel_work_sync(&dp->work);
>  
>  	if (dp->connector_fwnode) {
> -		if (dp->hpd)
> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +		drm_connector_oob_hotplug_event(dp->connector_fwnode, connector_status_disconnected);
>  
>  		fwnode_handle_put(dp->connector_fwnode);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3ac4bf87f257..886aa1861ed9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1141,7 +1141,8 @@ struct drm_connector_funcs {
>  	 * This will get called when a hotplug-event for a drm-connector
>  	 * has been received from a source outside the display driver / device.
>  	 */
> -	void (*oob_hotplug_event)(struct drm_connector *connector);
> +	void (*oob_hotplug_event)(struct drm_connector *connector,
> +				  enum drm_connector_status status);
>  
>  	/**
>  	 * @debugfs_init:
> @@ -1749,7 +1750,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  		DRM_CONNECTOR_UNREGISTERED;
>  }
>  
> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> +				     enum drm_connector_status status);
>  const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
> -- 
> 2.35.1

-- 
heikki
