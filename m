Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E14E295328
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 21:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439142AbgJUTzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 15:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439082AbgJUTzw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 15:55:52 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720DBC0613CE;
        Wed, 21 Oct 2020 12:55:52 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bf6so1778946plb.4;
        Wed, 21 Oct 2020 12:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J8lWfvsUw1lZS9qZYI9JiVdIAkAc0Lg4z2GuSJ7Pn4I=;
        b=cHelyJMXHBWW/m5W2SNj90fAHkk2c8exKwh/wKsT8tKDQkBJZMLezRWeU0UwtzqfzR
         DkJpi72Ba6dxRJQKaVNdZihj0fJlRwMXp4P+tuLQJZY42YklYRZJOLCwuYCOs35jOaIs
         O/DAnSLKjVfBOlrTBxQ099016Z8LMbdqee1kZvlsHLqgHCbXXZvo2Ps6S7MWCkHpfe3O
         q4AHneNJT882GRW00M1xevOYoA4YNgf0QwFa74EIaBitp37z5SGtW7PdCcfjl1KP7DCX
         IbSv6bbCT0KQjgW2dG8gZ8eZTDxUD1Nez7SR/RBYxFKonWzpFRrydI0PpHKj2680Tiyp
         bVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J8lWfvsUw1lZS9qZYI9JiVdIAkAc0Lg4z2GuSJ7Pn4I=;
        b=ie+SdQHqKjopi9kcpxcD2ED91Qnr6W+djM6EWrbmxNpCwuP+dX4ndUswsCjCycae2a
         gLXIRH7lzTcI02OJzCJ74Am+gXTLeutZk1ejgOhmAEniUSAGysFLFfxjH4rMg0e6/ixP
         cBydZX0W3zBYLRlmBQoueMTpD8/DJtKhJ/vKNbJ35xUcQqHWuD19HTv1CNsqs3fEwRxB
         3o/esuIknCCshAy3AaCLTFMSeMrHk42HGQGqOXSQgiZjAv6etmnNpxMjcFRua/YHu0zG
         BbkN/42alJuahwcoPgM5mp9gy03FfCErsstQxy1+6nos+23cY/gRLasUE84paEdrRCI7
         WszA==
X-Gm-Message-State: AOAM532VGMlQLb5wAAirvGnenSk1gpprNr9Bjm2E7mN09J5rOmJi5AdG
        ViC1QflO+/jEdVDNTj1rxRk=
X-Google-Smtp-Source: ABdhPJy27ywDcvBNkFzGcrcXHSzTGQPnZkOyHuXgCKlYM9x6EEQITyN1D7qWRgjyIUoiVUD2WUISrg==
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id m8-20020a1709026bc8b02900d60d9df28cmr579674plt.17.1603310151877;
        Wed, 21 Oct 2020 12:55:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x5sm3177670pfr.83.2020.10.21.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 12:55:51 -0700 (PDT)
Date:   Wed, 21 Oct 2020 12:55:48 -0700
From:   dmitry.torokhov@gmail.com
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Message-ID: <20201021195548.GD444962@dtor-ws>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603098195-9923-4-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Oct 19, 2020 at 05:03:15PM +0800, Li Jun wrote:
> +
> +static int typec_switch_simple_set(struct typec_switch *sw,
> +				   enum typec_orientation orientation)
> +{
> +	struct typec_switch_simple *typec_sw = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&typec_sw->lock);

Why is this lock needed? It looks like we are passing requests directly
to gpiochip which I expect would take care of this.

> +
> +	switch (orientation) {
> +	case TYPEC_ORIENTATION_NORMAL:
> +		if (typec_sw->sel_gpio)
> +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
> +		break;
> +	case TYPEC_ORIENTATION_REVERSE:
> +		if (typec_sw->sel_gpio)
> +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
> +		break;
> +	case TYPEC_ORIENTATION_NONE:
> +		break;
> +	}
> +
> +	mutex_unlock(&typec_sw->lock);
> +
> +	return 0;
> +}
> +
> +static int typec_switch_simple_probe(struct platform_device *pdev)
> +{
> +	struct typec_switch_simple	*typec_sw;
> +	struct device			*dev = &pdev->dev;
> +	struct typec_switch_desc sw_desc;
> +
> +	typec_sw = devm_kzalloc(dev, sizeof(*typec_sw), GFP_KERNEL);
> +	if (!typec_sw)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, typec_sw);
> +
> +	sw_desc.drvdata = typec_sw;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = typec_switch_simple_set;
> +	mutex_init(&typec_sw->lock);
> +
> +	/* Get the super speed active channel selection GPIO */
> +	typec_sw->sel_gpio = devm_gpiod_get_optional(dev, "switch",
> +						     GPIOD_OUT_LOW);

Does this driver make sense without the GPIO? Should it be made
mandatory?

Thanks.

-- 
Dmitry
