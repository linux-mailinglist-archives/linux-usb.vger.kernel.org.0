Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9793A3F70F5
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 10:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhHYIRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 04:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238764AbhHYIRk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 04:17:40 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0374C061757
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 01:16:54 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j14-20020a1c230e000000b002e748b9a48bso3180729wmj.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e12+t8sUP7LevMeTNEkZzKQOYqd64h7xXjFtrcOntvY=;
        b=DV2AY7Ymt5b1gF8wBzD5VEUPe9i9OuEGX5ZN+mfBS86ls8AUmfpPpMjafpdKHDqemm
         8H2Zh+Dsx98Co3Q1PQMk5X+416lghbsoWQtdiKpAU1kcVHizpOGjRs7AWz06dMSrryz/
         aQOHGVglZtckJ0AXjXu8pxNExIwmA3Q70TYeoBLmV1RRJhGBIVPdon4lMNTEglmuM3ir
         W49XVSPpYIlZapVkfO8KxiXXqEFDN8fKDpXs6MhGMZ0nd3kZlKYcUHZ6KrHLLorQxyFn
         VeBe8ZYpVwJ8NtVWLn8CCo8koUzMPUPtN5Sjaytxj4GPlU21HdJ1Oia6DTzKsTByQ5AG
         HioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e12+t8sUP7LevMeTNEkZzKQOYqd64h7xXjFtrcOntvY=;
        b=jiR5p6CHWP5hbW4vj/7TOTu4sM3veJuVoBWm4KRKlzWBcUrk0ER8742ornM1qcBolp
         X/hNKD4IFIE6VPr0sjYl2dcZ8pgztl+wpMblkhELOCcsftU/bGuO9sb/lBZDN0Yecjom
         CXQ9wom0HFJun16mliRomCYCGLjFtO3iwRXYHzDxflj2a+wcFreOSnbdH/ST+qltv7T/
         o2h5Ie8zX+ags3+9vSg44Ju11vTDS44omvq0FFWDrtyVwMDFJ6eyT8pgkRcSX8O/Pmvf
         +MeM3yQbILPsoMXts5jOEr9jWYtKbKJaxZqeDurqgavqWS3r+3DNeUv+0xU0NXvWAns2
         yv7w==
X-Gm-Message-State: AOAM533T3csqkfLS4HUyUAKoKBFkGadiWlgmf3+tB6GarQAB2UvXYoP5
        g+IrNnZ1b5KiuS6DSdEN0tw0GQ==
X-Google-Smtp-Source: ABdhPJwfNS0SQxhtIoVZ/HEAALlui/RIy3MOVzPMV9eeCjmy3wBI9GKsW6Q3G+uIIeldoql0KG1u7Q==
X-Received: by 2002:a05:600c:4f91:: with SMTP id n17mr7849023wmq.54.1629879413604;
        Wed, 25 Aug 2021 01:16:53 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b4sm9739226wrp.33.2021.08.25.01.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 01:16:53 -0700 (PDT)
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
To:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
Date:   Wed, 25 Aug 2021 09:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87zgt65avm.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2021 06:51, Felipe Balbi wrote:
>> Hi Peter, I took a proper look at this again, hoping to find a way to
>> pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
>> called from __dwc3_set_mode() to inform the Qualcomm glue about mode
>> changes.
> I would rather keep the strict separation between glue and core.

# 1 __dwc3_set_mode
Felipe wants to keep a strict separation between core and glue

# notifier
Requires the core probe() to complete before the glue probe to work 
reliably. This then would lead us to remaking the dwc3-qcom::probe() to 
facilitate probe deferral.

We can be sure bugs would be introduced in this process.

AFAIK Felipe is not opposed to this, Bjorn likes it

# 2 extcon
Works but a) is deprecated and b) even if it weren't deprecated has no 
way to layer the messages - that I know of.

# 3 USB role switch
Already in-place for the producer {phy, type-c port, usb-gpio typec, 
google ecros} to consumer dwc-core. It already has a layering 1:1 of 
that array of producers to the consumer.

Unlike extcon though it cannot relay messages to more than one consumer.

As I see it we can either

A. Rewrite the dwc3-qcom probe to make it synchronous with dwc3-core 
probe taking the hit of whatever bugs get thrown up as a result of that 
over the next while, potentially years.

B. Use USB role switch in some format.

Either
X. as I've submitted here based on a bit of code in dwc3-core or

Y. maybe trying to hide the "relay" aspect in DTS and USB role-switch core

It seems to me our choices are notifier + pain and churn - perhaps low, 
perhaps high or USB role switch

3.B.X works and is what has been submitted here but, if it is 
objectionable is 3.B.Y viable ?

As in make USB role switch propigate to multiple consumers via DTS and 
whatever additional work is required in the role-switch layer ?

+ Heikki on that one.

---
bod
