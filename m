Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9509A3F6C58
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 01:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbhHXXwG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 19:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhHXXwG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 19:52:06 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781C8C061764
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:51:21 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so43993203otu.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vwi37UoYgOGqKPABqgRSyYy7nzKmFsv+XtsKJcaUNvk=;
        b=VqCPxFbAR7YVVNxM7GvjG/7q/LKvi6MKHd5e7H9KPF2BqTHMA8HlOrutKuIAsLysPp
         lwxbsb7IgVZNxPa3KSn3D/ejd6hbtalTZABPE+fh2gDymqJQIROcnF3OkUwPHpqDNa5m
         7ByRRJy9P8EzIQtdueN7YpAkqmRHSrhvTgGz5g/1u6b4/2kXX8r61XGs7zeVtu+QDGgx
         Q8riDU/RrHoAZHnIWONyXkI/Q6w+HI8XtSQwVGUSSdseTH+JIz+Awdxp68xkzCpWnZBu
         Cgcwm7s/ejVJYz4J7mhZo2yY3vcDhlIS1MHt16sf1+RMnvzagmCwQqdSggsWe118RrNf
         4i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vwi37UoYgOGqKPABqgRSyYy7nzKmFsv+XtsKJcaUNvk=;
        b=Evh2EUCbrJxFS8EUDOxiV1zR7qykdiuKqy5ipCI+O3EHjLp9QlboQUemm16xpUQJqN
         HcoNU5yTUQA7yT/o90PQFx7uFAPmqPJcaRMG/R90/0PkjwHLJjZ4pZQKH/WlF1Cm2vYk
         jsHYglIDmBKqH9eU45jljdhYmFRhT980qq9szpo3uNdVxBUJSy9MCufUkijZGD8nV5/0
         DiFi1QZT9u/NquF3sHPIAIc11ZNFZIJP26QHuWf3p6mLJ7aqYlaeaq5I3m3zGt1VJGUY
         awtpsabMgSfo6U/LdvNH1I+vvzQSd39j1W9eDbbsrd24/3diwv7R05XGAkjDYAI133jv
         fLyg==
X-Gm-Message-State: AOAM5328z4+P8i74hqOW1E2YhFY4FhGQGI63nOb6qM1ZqcSbL1+/jUNg
        JKo8UpjKKrMt4sFo0KPY1vzsdA==
X-Google-Smtp-Source: ABdhPJzHJrmvvvxUYQjY0cq2btA5+Hyev2d4DnxH3fjJaOvg5ochmDEVHg37loWXfq4kPbroO/7oeg==
X-Received: by 2002:a54:4e8f:: with SMTP id c15mr4629711oiy.107.1629849080836;
        Tue, 24 Aug 2021 16:51:20 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l44sm4361160otv.81.2021.08.24.16.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 16:51:20 -0700 (PDT)
Date:   Tue, 24 Aug 2021 16:52:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSWGRcla0/dPLDpU@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YOZ3CBNTXFTa+fNx@yoga>
 <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu 08 Jul 03:17 PDT 2021, Bryan O'Donoghue wrote:

> On 08/07/2021 04:54, Bjorn Andersson wrote:
> > Bryan had a previous patch where the glue layer was notified about role
> > switching (iirc) and as soon as we hit a probe deferal in the core
> > driver we'd dereference some pointer in the glue layer. I don't find the
> > patch right now, but I suspect it might have been caused by the same
> > platform_get_drvdata() as we see in qcom_dwc3_resume_irq().
> 
> Here
> 
> https://lore.kernel.org/linux-usb/20200311191501.8165-7-bryan.odonoghue@linaro.org/
> 
> and here
> 
> https://lore.kernel.org/linux-usb/20200311191501.8165-8-bryan.odonoghue@linaro.org/
> 

Now that I dug through the code I remembered why this didn't work.

You do:
	dwc = platform_get_drvdata(qcom->dwc3);

In order to be able to register the callback in the notifier chain that
you added to struct dwc3, but while qcom->dwc3 is a valid struct
platform_device, it might not have probed yet and "dwc" becomes NULL,
which you then dereferenced in dwc3_role_switch_notifier_register().

So we need a mechanism that passes that callback/notifier that has a
life cycle matching that of the glue device.

> one thing about that I don't think is right now in retrospect is having to
> find a DT connector in the core, meaning it incorrectly assumes you have a
> node named "connector" as a child of dwc3-core
> 
> https://lore.kernel.org/linux-usb/158463604559.152100.9219030962819234620@swboyd.mtv.corp.google.com/
> 
> Having done some work with TCPM on pm8150b silicon I see what Stephen was
> saying about that
> 
> That's one solid reason I like the USB role-switch API - because it gets you
> out of the business of trying to discern from dwc3-qcom if dwc3-core has
> role-switching turned on by iterating through its range of DT nodes and
> looking for a special one named "connector"
> 
> The initial and imperfect solution I had for that looked like this
> 
> if (dwc3_qcom_find_gpio_usb_connector(qcom->dwc3)) {}
> 
> Wesley had another iteration on that that was a little better
> 
> https://lore.kernel.org/linux-usb/20201009082843.28503-4-wcheng@codeaurora.org/
> 
> +static int dwc3_qcom_connector_check(struct fwnode_handle *fwnode)
> +{
> +	if (fwnode && (!fwnode_property_match_string(fwnode, "compatible",
> +						     "gpio-usb-b-connector") ||
> +	    !fwnode_property_match_string(fwnode, "compatible",
> +					  "usb-c-connector")))
> +		return 1;
> +
> +	return 0;
> +}
> 
> All we are really doing there is replicating functionality that the
> role-switch API already provides
> 

But isn't this role switching interaction (both B and C) already part of
the core/drd, so if we can just get the drd to invoke
dwc3_qcom_vbus_overrride_enable() we're done (and can remove all the
extcon code from the qcom glue as well)?

Regards,
Bjorn
