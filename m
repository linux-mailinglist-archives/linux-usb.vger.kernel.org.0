Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCFC4D01B8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243359AbiCGOri (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235849AbiCGOrh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:47:37 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7FA7D029
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:46:43 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id x26-20020a4a9b9a000000b003211029e80fso1416599ooj.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KDUUimts6AqirSdFxQZxJc3Z8d63h2WyuY2dc6ec1xM=;
        b=v0oPXHKPdG97ZiajP9+g855l62P2OtPqchjCprouvcANCLm0sAYzyhvtfEfDaaeEtp
         I2gUVvRRRwamr5QX5UJyVLMUgDAhMUV/qDPOlCzdrYNNGhwUWxMYQ0knBtln9ryIMznJ
         jNv8zmgV+lQHtlyUKb0y0JBPZXFmklYBfvsg2FKsq82eiRS28yQ/FPkyz5b3Vqy3WEdQ
         y/zc9at6u/VIFLL7SKT/q06kDEukdWXcudtgPXiSnb2oF9ZVWClc192CSJ2M1Ztsz1By
         5CpKGCxpckbpGiN6cSbWNnOzfKRiHMLR2BaPrR+fpsR9zOZD80vuUUCjymTbAi/yRdaZ
         v0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KDUUimts6AqirSdFxQZxJc3Z8d63h2WyuY2dc6ec1xM=;
        b=qGGYKpQzfy9FbB8V2ucFvlCwcWr+gfhc8+UkExI9/i+5PCMz5wNYo3dFOnq5f5ZqwR
         qrpe49+DKf7lQaTqKlqEkJrcr6XAXNk4lDd1nwLB9k02H1elt4MPoTg/Qv0BVs14ENST
         7HAws0RS6ETqD8qzuBkKV6zmgjFphWhKsEhE2D+euEuukFUeLQDCh4NNA5JkAnhcq6OA
         JUwJ/bFmE0outwwvG+p/OtqsfNVt4m7MX9xzpB53ohh3jIjDVo78u/cm9wkMigt4GBeI
         curiQd4v7yqPhPuhwUXAh4hM8Go+YMZhRHSr2UTCUfe8HPYCyzWGIMxS8z/2hL0bp2B8
         ZkfQ==
X-Gm-Message-State: AOAM530khpDFg7NilJSIyT7dAokyyi8T7omRhsG/kXKqeuGY+LXjZWCb
        eTY4duMbV4nsLRnZ7/YIluKnEYHBjMAxjA==
X-Google-Smtp-Source: ABdhPJyhwg8VQ2NoQPu24oSN1H1Xsf1l7yrTZwrLXKHeFCrr/teOAsQ82MtY6y4LP4tvH/pSaxsJfA==
X-Received: by 2002:a05:6870:d250:b0:da:b3f:2b29 with SMTP id h16-20020a056870d25000b000da0b3f2b29mr5976338oac.200.1646664402377;
        Mon, 07 Mar 2022 06:46:42 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s62-20020aca4541000000b002d7823c8328sm6465095oia.4.2022.03.07.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 06:46:41 -0800 (PST)
Date:   Mon, 7 Mar 2022 06:48:25 -0800
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
Subject: Re: [PATCH v4 7/7] usb: typec: mux: Add On Semi fsa4480 driver
Message-ID: <YiYbOQpX4+fP8S1W@ripper>
References: <20220307034040.1111107-1-bjorn.andersson@linaro.org>
 <20220307034040.1111107-7-bjorn.andersson@linaro.org>
 <YiXbg4QwgIgLh3LW@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiXbg4QwgIgLh3LW@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 07 Mar 02:16 PST 2022, Andy Shevchenko wrote:

> On Sun, Mar 06, 2022 at 07:40:40PM -0800, Bjorn Andersson wrote:
> > The ON Semiconductor FSA4480 is a USB Type-C port multimedia switch with
> > support for analog audio headsets. It allows sharing a common USB Type-C
> > port to pass USB2.0 signal, analog audio, sideband use wires and analog
> > microphone signal.
> > 
> > Due to lacking upstream audio support for testing, the audio muxing is
> > left untouched, but implementation of muxing the SBU lines is provided
> > as a pair of Type-C mux and switch devices. This provides the necessary
> > support for enabling the DisplayPort altmode on devices with this
> > circuit.
> 
> ...
> 
> > +static const struct regmap_config fsa4480_regmap_config = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.max_register = FSA4480_MAX_REGISTER,
> > +};
> 
> You are using mutex for accessing hardware. Do you still need a regmap lock?
> If so, add a comment to explain why.
> 

I've not considered that before, but you're right, there doesn't seem to
be any reason to keep the locking in the regmap.

> ...
> 
> > +		/* 15us to allow the SBU switch to turn off */
> > +		usleep_range(15, 1000);
> 
> This is quite unusual range.
> 
> If you are fine with the long delay, why to stress the system on it?
> Otherwise the use of 1000 is unclear.
> 
> That said, I would expect one of the below:
> 
> 		usleep_range(15, 30);
> 		usleep_range(500, 1000);
> 

Glad you asked about that, as you say the typical form is to keep the
range within 2x of the lower value, or perhaps lower + 5.

But if the purpose is to specify a minimum time and then give a max to
give the system some flexibility in it's decision of when to wake up.
And in situations such as this, we're talking about someone connecting a
cable, so we're in "no rush" and I picked the completely arbitrary 1ms
as the max.

Do you see any drawback of this much higher number? (Other than it
looking "wrong")

> ...
> 
> > +	sw_desc.fwnode = dev->fwnode;
> 
> Please, don't dereference for fwnode explicitly. Use dev_fwnode().
> 

Okay, will update accordingly.

Thanks,
Bjorn

> ...
> 
> > +	mux_desc.fwnode = dev->fwnode;
> 
> Ditto.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
