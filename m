Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986FA4B174A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 21:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344422AbiBJUyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 15:54:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245263AbiBJUyo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 15:54:44 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A08F1090
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 12:54:45 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id u3so7297514oiv.12
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XLC7rhh5NWo/WWk0O+SWaGHHQvQbuSaZ+SOvjKjiyak=;
        b=S/ZVi6aZogePykP4WzPvz135cApU38G9kkJk+rkiAEcoS/w2r//E8ItPqJc2GRWq+H
         pQ6yPCFJMbtK6K8za2CPDTvWTaXGfNOIsIBi0MjmKEj3KJZxX5+4xNVARqUFkHTM4npU
         yc1Ha0B6xY7JadBd1lr/z1PN14lVrcSRpRpEhDSsly/KTAK7E4nb1XZRLCe48o31/gbk
         UBem2H6pF5kVE31MJwEo3gzshelyxhgQhO6ip0VogNXw7kj8Rwjhw08CxAzPzrvZQojd
         lNwcJna8rK568xBSK+4uZFyOQqybmjnGIicz7OPSexn1AZuHP99R/wsymF4Dv0iM8fhc
         q4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XLC7rhh5NWo/WWk0O+SWaGHHQvQbuSaZ+SOvjKjiyak=;
        b=4zNpn1/Gow0ehdlyqflsZ9vX7AQ3M5OJZ+8PPz6JL83i3tTExlx6yk/OBJNKhinM5k
         0DszL67qzQ/5NbUma6LQMMXMBTm7XE3aBMzGS5KUWlVw2Fzqi2xI17ZRlTb9NyhflU88
         Xxqjbn6TQLJAoXMpMRfkdV0hWn7v0Uq3qX0iuAkOr1WzI5cHqahSE5d90wBJOByrOWcT
         Ya9uKps4oIyKORNrp4YfcxF9VliPM70Yqe9vL9K7z/WVQ4BPlPeLCt7Rjp0eARr4zkqC
         WTQW+n7Izj3/axalYm1gaWAl4A/L4yIo3J1nX0jJftt4lSdlFBiOGx5KyCT2fDXr/i3+
         qmwQ==
X-Gm-Message-State: AOAM531F8P85QjiPrmM6lG7kzzi+O97pOkXet/OBrCxobZwLzvRPsQL4
        DaxEl0xweq+r754cPeQWHCzmLw==
X-Google-Smtp-Source: ABdhPJxc/ajzBm0o0PKtQ2wiTHPfpY7+clG0ZxhfX1lnt+A9CBRTQGEfc6eSIyduKTQAZi46f3TcVw==
X-Received: by 2002:a05:6808:1b26:: with SMTP id bx38mr1833146oib.267.1644526484397;
        Thu, 10 Feb 2022 12:54:44 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d14sm8516012ooh.44.2022.02.10.12.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 12:54:43 -0800 (PST)
Date:   Thu, 10 Feb 2022 12:56:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
Message-ID: <YgV8GyK9G0gbWAaq@ripper>
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
 <YgJISIIacBnFyTLq@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJISIIacBnFyTLq@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 08 Feb 02:39 PST 2022, Greg Kroah-Hartman wrote:

> On Mon, Feb 07, 2022 at 08:43:27PM -0800, Bjorn Andersson wrote:
> > In some implementations, such as the Qualcomm platforms, the display
> > driver has no way to query the current HPD state and as such it's
> > impossible to distinguish between disconnect and attention events.
> > 
> > Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
> > state.
> > 
> > Also push the test for unchanged state in the displayport altmode driver
> > into the i915 driver, to allow other drivers to act upon each update.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Note that the Intel driver has only been compile tested with this patch.
> > 
> >  drivers/gpu/drm/drm_connector.c          |  6 ++++--
> >  drivers/gpu/drm/i915/display/intel_dp.c  | 14 +++++++++++---
> >  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
> >  drivers/usb/typec/altmodes/displayport.c |  9 ++-------
> >  include/drm/drm_connector.h              |  5 +++--
> >  5 files changed, 23 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index a50c82bc2b2f..ad7295597c0f 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >  /**
> >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> > + * @hpd_state: number of data lanes available
> 
> "number"?
> 
> >   *
> >   * On some hardware a hotplug event notification may come from outside the display
> >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * This function can be used to report these out-of-band events after obtaining
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> > +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > +				     bool hpd_state)
> 
> This is a boolean, how can it be a number?
> 

The kerneldoc wasn't appropriately updated as this went from being
"number of data lanes" to "the hot plug detect (hpd) state".

> And having a "flag" like this is a pain, how do you know what the
> parameter really means?
> 

You're right, "state" isn't a boolean property, let's rename it
"hpd_high" to clarify it.

> >  {
> >  	struct drm_connector *connector;
> >  
> > @@ -2843,7 +2845,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> >  		return;
> >  
> >  	if (connector->funcs->oob_hotplug_event)
> > -		connector->funcs->oob_hotplug_event(connector);
> > +		connector->funcs->oob_hotplug_event(connector, hpd_state);
> >  
> >  	drm_connector_put(connector);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 146b83916005..00520867d37b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4816,15 +4816,23 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
> >  	return intel_modeset_synced_crtcs(state, conn);
> >  }
> >  
> > -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
> > +static void intel_dp_oob_hotplug_event(struct drm_connector *connector, bool hpd_state)
> >  {
> >  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
> >  	struct drm_i915_private *i915 = to_i915(connector->dev);
> > +	bool need_work = false;
> >  
> >  	spin_lock_irq(&i915->irq_lock);
> > -	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > +	if (hpd_state != i915->hotplug.oob_hotplug_state) {
> > +		i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > +
> > +		i915->hotplug.oob_hotplug_state = hpd_state;
> > +		need_work = true;
> > +	}
> >  	spin_unlock_irq(&i915->irq_lock);
> > -	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> > +
> > +	if (need_work)
> > +		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> >  }
> >  
> >  static const struct drm_connector_funcs intel_dp_connector_funcs = {
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 8c1706fd81f9..543ebf1cfcf4 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -149,6 +149,9 @@ struct i915_hotplug {
> >  	/* Whether or not to count short HPD IRQs in HPD storms */
> >  	u8 hpd_short_storm_enabled;
> >  
> > +	/* Last state reported by oob_hotplug_event */
> > +	bool oob_hotplug_state;
> > +
> >  	/*
> >  	 * if we get a HPD irq from DP and a HPD irq from non-DP
> >  	 * the non-DP HPD could block the workqueue on a mode config
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index c1d8c23baa39..a4596be4d34a 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -59,7 +59,6 @@ struct dp_altmode {
> >  	struct typec_displayport_data data;
> >  
> >  	enum dp_state state;
> > -	bool hpd;
> >  
> >  	struct mutex lock; /* device lock */
> >  	struct work_struct work;
> > @@ -143,10 +142,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >  		if (!ret)
> >  			dp->state = DP_STATE_CONFIGURE;
> >  	} else {
> > -		if (dp->hpd != hpd) {
> > -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > -			dp->hpd = hpd;
> > -		}
> > +		drm_connector_oob_hotplug_event(dp->connector_fwnode, hpd);
> >  	}
> >  
> >  	return ret;
> > @@ -573,8 +569,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
> >  	cancel_work_sync(&dp->work);
> >  
> >  	if (dp->connector_fwnode) {
> > -		if (dp->hpd)
> > -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > +		drm_connector_oob_hotplug_event(dp->connector_fwnode, false);
> 
> See, what does "false" here mean?
> 
> Name the function for what it does, do not have random flags as
> parameters, that makes it impossible to understand what the code is
> doing when you are reading it, without having to jump around and figure
> out what the flags are saying.
> 
> And here they just don't even seem to be right :(
> 

Both the old and new code will signal to the DRM driver that the cable
was removed, the change is that we're carrying the level in the call
rather than just indicating that the state has changed.

We could introduce some HPD_HIGH/HPD_LOW defines to make it easier to
read. But the various places I'm looking at just represented the hpd
state as a bool.

Regards,
Bjorn
