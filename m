Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7C64CF007
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 04:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbiCGDKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 22:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbiCGDKE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 22:10:04 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476FE3617B
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 19:09:09 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 12so13831320oix.12
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 19:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NrL2GbvVpGb29Fj3Rihhmr0iZS/oGZ6Whqfe0P71jDo=;
        b=HoesBsDjd7+aEljMQq6FmZvxEOTUGHpDp9Txbuo/3IREDz2j65Zk/VnVT2GZ4r/JAp
         vXTCstmbhU0Ko1SGrhRrz90k40tiiknNeMUT9RgwiBYQGCzm21ceF8zoxFlA9MKwZjc1
         bQFJKk7m+DTTOuTeNlE4lfnzZvD5RL8+ENgB9UiHQUPfZv7bYffRTtDPUgxsPTNpHKS+
         gwS0KyBFefrVs9BlDf90ZtDYy2s58YFIF77DRb7g5kOvFmydWLvmAODkc790wxbOuwrr
         sS7/Oe9H3Yt4SGWrKgZDWu1ybef3RG8OUsQTdiDEeLsx4NzY8i27oBrxLImFevcvF4At
         IgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NrL2GbvVpGb29Fj3Rihhmr0iZS/oGZ6Whqfe0P71jDo=;
        b=XPh1iJfe35cGHjRwrTpx4+gJQz16YFGRgkDzskNfVD5X8Vn/a793nbb9O4sueRB6SB
         LxP1h17B/OD5XPcWvWmiz3D3GSmNx7EtWI5MWMcoKOZw1Su1nCZhVq+kqnbIrh7LUNoR
         1RqtH4Eza+4tgXiX9UDWgyXuOvT8qhsmNhKPXL0Sd10B44Pe/cukemq2/JrOv8bYth3d
         zy0t1BXC3L8rJT1MfK8ejk5zY0lvelDCEBH6VWpEFoj+8O3emSbw4QunGxpb56HsbBQq
         GqCRYCwcUciWMNZ0cRH3XZZPm0IYuyD4GsJEl+de+r4URLXhSLrO099tjxZuc0ywwqrh
         PQ2Q==
X-Gm-Message-State: AOAM533cZf0orWv7ws+C+Jd0yQ6ZKMCG9w9g31HUXCCQcImQENEYJbEU
        I3637P17wBi6ZvtoFBRP/oYwhA==
X-Google-Smtp-Source: ABdhPJykY27Dd1c8RLb3BX+lW8QmHS2laZL2r0kyG07XihdxPkqcFcTFKZrOHIGpv09WnhCF3phevA==
X-Received: by 2002:a05:6808:152c:b0:2d7:58b0:15b9 with SMTP id u44-20020a056808152c00b002d758b015b9mr5727574oiw.81.1646622548343;
        Sun, 06 Mar 2022 19:09:08 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id q62-20020a4a3341000000b00320f8a179d0sm439197ooq.30.2022.03.06.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 19:09:07 -0800 (PST)
Date:   Sun, 6 Mar 2022 21:09:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 4/6] typec: mux: Allow multiple mux_devs per mux
Message-ID: <YiV3UYuXgS0w0IWl@yoga>
References: <20220303223351.141238-1-bjorn.andersson@linaro.org>
 <20220303223351.141238-4-bjorn.andersson@linaro.org>
 <YiIaK8kSYGtivvhk@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiIaK8kSYGtivvhk@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri 04 Mar 07:54 CST 2022, Andy Shevchenko wrote:

> On Thu, Mar 03, 2022 at 02:33:49PM -0800, Bjorn Andersson wrote:
> > In the Qualcomm platforms the USB/DP PHY handles muxing and orientation
> > switching of the SuperSpeed lines, but the SBU lines needs to be
> > connected and switched by external (to the SoC) hardware.
> > 
> > It's therefor necessary to be able to have the TypeC controller operate
> > multiple TypeC muxes and switches. Use the newly introduced indirection
> > object to handle this, to avoid having to taint the TypeC controllers
> > with knowledge about the downstream hardware configuration.
> > 
> > The max number of devs per indirection is set to 3, which account for
> > being able to mux/switch the USB HS, SS and SBU lines, as per defined
> > defined in the usb-c-connector binding. This number could be grown if
> > need arrises at a later point in time.
> 
> ...
> 
> > +	for (i = 0; i < count; i++) {
> > +		if (IS_ERR(sw_devs[i])) {
> > +			err = PTR_ERR(sw_devs[i]);
> > +			goto put_sw_devs;
> > +		}
> > +	}
> >  
> > -	sw->sw_dev = sw_dev;
> > +	for (i = 0; i < count; i++) {
> > +		WARN_ON(!try_module_get(sw_devs[i]->dev.parent->driver->owner));
> > +		sw->sw_devs[i] = sw_devs[i];
> > +	}
> > +
> > +	sw->num_sw_devs = count;
> >  
> >  	return sw;
> > +
> > +put_sw_devs:
> > +	for (i = 0; i < count; i++) {
> 
> Shouldn't it be
> 
> 	while (i--)
> 
> ?

fwnode_connection_find_matches() "returned" count number of sw_devs, we
need to put_device() them all. So that form could have been

	while (count--)

but as it's not the typical "unrolling" I think the untypical form is
more useful.

> 
> > +		if (!IS_ERR(sw_devs[i]))
> 
> We may get rid of this check if we guarantee that the device is NULL.
> 

In the event that the USB Type-C controller probes before some of the
muxes, this array might contain one or more entries of EPROBE_DEFER.

So we need to either put this conditional here, or we need to loop
through all entries to turn IS_ERR() into NULL, for the sake of not
having it here.

So to me this looks cleaner...

Regards,
Bjorn

> > +			put_device(&sw_devs[i]->dev);
> > +	}
> > +
> > +	kfree(sw);
> > +
> > +	return ERR_PTR(err);
> >  }
> 
> ...
> 
> > +	for (i = 0; i < count; i++) {
> > +		if (IS_ERR(mux_devs[i])) {
> > +			err = PTR_ERR(mux_devs[i]);
> > +			goto put_mux_devs;
> > +		}
> 
> Ditto.
> 
> > +	}
> 
> ...
> 
> > +put_mux_devs:
> > +	for (i = 0; i < count; i++) {
> > +		if (!IS_ERR(mux_devs[i]))
> > +			put_device(&mux_devs[i]->dev);
> > +	}
> 
> Ditto.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
