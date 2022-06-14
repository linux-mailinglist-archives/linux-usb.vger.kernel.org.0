Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4D54ABB5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 10:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240603AbiFNIW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 04:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240620AbiFNIWv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 04:22:51 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A3C12081;
        Tue, 14 Jun 2022 01:22:48 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 827DA66016A3;
        Tue, 14 Jun 2022 09:22:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655194966;
        bh=XX94+tGpTFm5swFl/PsXQ8405j9PPdF5t0PJGTuNolw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oNLnEgpX69ui8QvHWw/7+jjtZnTd2U14YsDIUNPPgbBUZpaNDSTbF6n4mDPTjA1xh
         5ZvWg7W79PjzlSedHf6fGY5SNsjdEVwxp2gLDje+b+Gbuj2zoMHUbkxFLDIeOuyeeh
         4+r+hkoNOAi/zppmpu/77RmbJ6EQ8WfK+WPv7UjBnyGz9PNEMITNCgBaBr7+dD1G5y
         i5LcZD67W2OHoOxZEt9A2oAF1c9noI7BW1RVSqWhayNG3tCkFf17NLtC2vRSSoywvS
         QVYqVOv5bNCm08vETkw4Dg9O1MRglTQValN54yaa/mnCDYYM+H+D+CyyoH5oQG+lr9
         HPuA/dXPtAmoA==
Message-ID: <ef3933a8-88c2-f19f-97df-3498f54b9a4f@collabora.com>
Date:   Tue, 14 Jun 2022 10:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/7] drm/bridge: anx7625: Register number of Type C
 switches
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
 <20220609181106.3695103-6-pmalani@chromium.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609181106.3695103-6-pmalani@chromium.org>
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
> Parse the "switches" node, if available, and count and store the number
> of Type-C switches within it. Since we currently don't do anything with
> this info, no functional changes are expected from this change.
> 
> This patch sets a foundation for the actual registering of Type-C
> switches with the Type-C connector class framework.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v1:
> - No changes.
> 
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++++++++
>   drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 53a5da6c49dd..07ed44c6b839 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2581,6 +2581,22 @@ static void anx7625_runtime_disable(void *data)
>   	pm_runtime_disable(data);
>   }
>   
> +static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
> +{
> +	struct device_node *of = NULL;
> +	int ret = 0;
> +
> +	of = of_get_child_by_name(device->of_node, "switches");
> +	if (!of)
> +		return -ENODEV;
> +
> +	ctx->num_typec_switches = of_get_child_count(of);
> +	if (ctx->num_typec_switches <= 0)
> +		return -ENODEV;
> +
> +	return ret;

You aren't using the `ret` variable for anything other than returning zero:
remove it and simply return 0 here.

> +}
> +
>   static int anx7625_i2c_probe(struct i2c_client *client,
>   			     const struct i2c_device_id *id)
>   {
> @@ -2686,6 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	if (platform->pdata.intp_irq)
>   		queue_work(platform->workqueue, &platform->work);
>   
> +	ret = anx7625_register_typec_switches(dev, platform);
> +	if (ret)
> +		dev_info(dev, "Didn't register Type C switches, err: %d\n", ret);

Type-C switches are optional for this driver and this will print a sort of error
on boards that are *not* declaring any switches on purpose (because perhaps they
don't have any, or for any other reason).

Even though this is a dev_info and not a dev_err, it's still printing an alarming
(and useless, in the aforementioned case) message.

Please fix this.

Regards,
Angelo

