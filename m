Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2949254AB82
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 10:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiFNIPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 04:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbiFNIPj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 04:15:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388213FBE5;
        Tue, 14 Jun 2022 01:15:37 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F33666016A4;
        Tue, 14 Jun 2022 09:15:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655194535;
        bh=el24miD5lwwOATGWHD3rV8fyca3eG98hrFENKZ7mlY0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ciPMnJ8XNdVWU5xIJefRS2XXhVRBG/qnycnajGeCUzrPNj3L1Owe/Xt3SmebiPVRH
         2QFfzza5FhyDE/+oEI1M07DJyWFrqoc+ujzQrJpphsIbr2Wp7Z/15TIlTq9i7iBH1i
         lXYYCwJWeDkheZnSGxTu8FCfoXY5FEdYXhbdjHgHDZtko2QwcmLpPk3HGTD3VlQvRa
         meSMnmGA34QMX8zcvwO2rifFvqWNC1/dfj8VC6GA2+GZGaUMaROgj6mSL7HLmu9BtK
         mF6X+sFL5iiV/oR5KhHRM3f6Usw0WyCE/t6rpmD8kkfPLpcfykT4SOhhsUetYtBOcd
         NTn8OTgf0KIug==
Message-ID: <1191703c-efa5-7fe6-7dd0-e3e786b58411@collabora.com>
Date:   Tue, 14 Jun 2022 10:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
Content-Language: en-US
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
        swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Foss <robert.foss@linaro.org>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-8-pmalani@chromium.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609181106.3695103-8-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il 09/06/22 20:09, Prashant Malani ha scritto:
> From: Pin-Yen Lin <treapking@chromium.org>
> 
> Add the callback function when the driver receives state
> changes of the Type-C port. The callback function configures the
> crosspoint switch of the anx7625 bridge chip, which can change the
> output pins of the signals according to the port state.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v2:
> - No changes.
> 
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 58 +++++++++++++++++++++++
>   drivers/gpu/drm/bridge/analogix/anx7625.h | 13 +++++
>   2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d41a21103bd3..2c308d12fab2 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -15,6 +15,7 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> +#include <linux/usb/typec_dp.h>
>   #include <linux/usb/typec_mux.h>
>   #include <linux/workqueue.h>
>   
> @@ -2582,9 +2583,66 @@ static void anx7625_runtime_disable(void *data)
>   	pm_runtime_disable(data);
>   }
>   
> +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> +					  enum typec_orientation orientation)
> +{
> +	if (orientation == TYPEC_ORIENTATION_NORMAL) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> +	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> +	}
> +}
> +
> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +	if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> +		/* Both ports available, do nothing to retain the current one. */
> +		return;
> +	else if (ctx->typec_ports[0].dp_connected)
> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> +	else if (ctx->typec_ports[1].dp_connected)
> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> +}
> +
>   static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
>   				 struct typec_mux_state *state)
>   {
> +	struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
> +	struct anx7625_data *ctx = data->ctx;
> +	struct device *dev = &ctx->client->dev;
> +
> +	bool old_dp_connected = (ctx->typec_ports[0].dp_connected ||
> +				 ctx->typec_ports[1].dp_connected);

So the old connection state is "either port0 or port1 are currently connected"...

> +	bool new_dp_connected;
> +
> +	if (ctx->num_typec_switches == 1)
> +		return 0;
> +
> +	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
> +		ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_connected);
> +
> +	data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> +			      state->alt->mode == USB_TYPEC_DP_MODE);
> + > +	new_dp_connected = (ctx->typec_ports[0].dp_connected ||
> +			    ctx->typec_ports[1].dp_connected);

...and the new connection state is the same as the old one, because I don't see
anything that could ever modify it in this function's flow, until reaching this
assignment.

> +
> +	/* dp on, power on first */
> +	if (!old_dp_connected && new_dp_connected)
> +		pm_runtime_get_sync(dev);

...so that will never happen...

> +
> +	anx7625_typec_two_ports_update(ctx);
> +
> +	/* dp off, power off last */
> +	if (old_dp_connected && !new_dp_connected)
> +		pm_runtime_put_sync(dev);

...and same here.

Regards,
Angelo
