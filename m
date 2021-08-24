Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6238B3F6C4A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 01:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhHXXgb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 19:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234775AbhHXXgb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 19:36:31 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD49AC061757
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:35:46 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id b5-20020a4ac285000000b0029038344c3dso1558097ooq.8
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ViGBWukihW0X9TKTGTKXj7miQsh5xvWC9wO5eti5sDU=;
        b=Lw75XNC3JYjRPnCWHRZXN7kaeVsnFByc7Y6CFYhHnPm+iXd4dA6PJaxGoYZ0p4piP0
         EyaObXsNvP9pw7gFlnC42PhaSH2KP8LSM7q97GWhbWAPUdFyn3N8khp1Xw3LlRIq6ieN
         /qrz/Owz95hIL9dSq4/vZ/s3AcZMoUHkKJ+2TStiLfTIIxNj5G4hJfDL5O6gU4mQ2rv8
         mVdXdFUbYu4dgZmxd6H6b4AV9b9In5W+2qCNlhQ9ec38vmCzkjz5mmUBf00MuDvqZCzg
         sYjpsc72FtcpuKln4bJhiZHC86EtbtFuLUxLHFCPJJHRhE7ipS/aLNgwredYFx/TKIsX
         peQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ViGBWukihW0X9TKTGTKXj7miQsh5xvWC9wO5eti5sDU=;
        b=LLz9BTeHeq7GhhF8aU5Ah07dqEF1kdIbmZgpPpUBnGiJnu0cnbtcxL+mLFWzUSRFO/
         8oyQ5WRcHQ1cp28cGIq9O5mI98nPZ+EtTZ3HfkZDm8qhBNPXCBKHqT2lvSsF2JKd7706
         VmsTuQuYfpGg7vlJou/3hE5O65qy8YPifXwQhPGI29C+RUK2QnF1p4JnKfp+SoOQPOcn
         cP5Ne6AJ+7kzRSGupYvE2OOkzlRowmmjJVhq7iZVEuYA5a6QQfoVLBkZzfhFbVK/8PlO
         HzME34NzzgBe0QwCBeyusfyAEnH8KetvJwOge59ks8xoTWLuTZ5CKnSehPtRcJDxEYBc
         DpAQ==
X-Gm-Message-State: AOAM530I5SOiM4am9lG2qoPCVoKYUEFpPuv8XlUZuDa/ts/9vTbp8jW8
        +EoCbthnZMHWg0QE63rqsy38wQ==
X-Google-Smtp-Source: ABdhPJwhnSkH3l3Ps7epjd2oe7a5jMG5PxErqgxkG9bHH/9XdoA7+8G0oGcsbiDta9q4lh8ndwcRCQ==
X-Received: by 2002:a4a:2549:: with SMTP id v9mr31665102ooe.28.1629848146069;
        Tue, 24 Aug 2021 16:35:46 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 31sm4859288oti.63.2021.08.24.16.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 16:35:45 -0700 (PDT)
Date:   Tue, 24 Aug 2021 16:37:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSWCnsZDdp57KBqB@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708030631.GA22420@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:

> On 21-07-07 14:03:19, Bjorn Andersson wrote:
> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> > 
> > Allow me to reorder your two questions:
> > 
> > > And why using a notifier need to concern core's deferral probe?
> > 
> > The problem at hand calls for the core for somehow invoking
> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> > 
> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
> > this (and stash the pointer). And this can't be done until dwc3-core
> > actually exist, which it won't until dwc3_probe() has completed
> > successfully (or in particular allocated struct dwc).
> 
> Maybe you misunderstood the notifier I meant previous, my pointer was
> calling glue layer API directly.
> 
> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
> allocated successfully, you could call glue layer notifier at function
> dwc3_usb_role_switch_set directly.
> Some references of my idea [1] [2]
> 
> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
> 

Hi Peter, I took a proper look at this again, hoping to find a way to
pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
called from __dwc3_set_mode() to inform the Qualcomm glue about mode
changes.

This looks quite promising and I think we should be able to get rid of
some duplicated extcon code from the Qualcomm glue as well...


I reworked the existing code to replace of_platform_populate() with
of_platform_device_create_pdata() to register the core device and pass a
struct with a function pointer and this works fine.

But then I searched the list archives and found this:
https://lore.kernel.org/lkml/CAL_JsqJ5gsctd7L3VOhTO1JdUqmMmSJRpos1XQyfxzmGO7wauw@mail.gmail.com/

In other words, per Rob's NACK this seems like a dead end.


@Rob, for your understanding, the dwc3 platform glue is implemented in a
set of platform_drivers, registering the core as a separate
platform_device and we need to make a function call from the core dwc3
code into the glue code.

My initial proposal was that we provide some helper function that the
glue code would use to allocate and register the core device, along
which we can pass such callback information.
But this turns out to pretty much be a re-implementation of
of_platform_device_create_pdata().  Perhaps that's still preferable?

Regards,
Bjorn
