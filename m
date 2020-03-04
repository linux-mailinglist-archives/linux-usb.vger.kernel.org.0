Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B10B179500
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 17:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbgCDQYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 11:24:08 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40878 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbgCDQYI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 11:24:08 -0500
Received: by mail-ed1-f67.google.com with SMTP id a13so2997720edu.7
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2020 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cRSqqyVQcgkFGQEI4WVpqxDQwCK2dLecE852C4OPnck=;
        b=ltaenl3Tu/Uh7cHCpFacONDPzzzqQrkNujMvp58M14/XfVcwRWa9kwro+hgX741c1H
         cHnCwykPCAHfAWZmq+NsVrSJt60Ar5l8PBnPxMnYF4ldkMKjpzHC/rCTzyZ2/Y5h88kv
         bqoO8m4mB+MtaoMBxxJ11DliaahtilK++IfG/BJkK+EQc+WHQeVm17p/OveeUZkNSqe0
         fnvHDULD6vm31OuojQziBWWptXNAKl2Gm5Mmg7LKGLg1WqqMaCjgpG9u/AHjjImliWi0
         gRKjn5q0WJI87Pj4LSzwHtJiNzyN3Axe7z4laTFODANHwTiIBlLYDY4JA7bRQl9r+IBc
         f4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cRSqqyVQcgkFGQEI4WVpqxDQwCK2dLecE852C4OPnck=;
        b=IScefHflc7N22sDbwCsO+IQSa/vinbLX6M5xvHNEGY45fsyF+bA9BmOEit1gNWXVzh
         K6YKiXiqn9tpG9QCWGh21ZLYG2oMxI0GrtiLlK4FQN9hgyE9oVn5BQrI/xI+dY/pMhdT
         OB0i0hcQjEydR2gClEx43/Wm1J5Sdbe8MVMnV85e7Yvivi8nfpz+FXJjziJ0MuczhCv/
         ntYBq0FWBFnFX52M18wP4Uvv8vDCm4lAlUiRUkGczjtk4gESsEcAVAkyuoWqA3BecnLp
         +H95RlW3PIM6ZRnlV0bPOxABNpy8vggrellSG9OonLeH4PzCCdYC+toJFlh6wQb//y86
         oopw==
X-Gm-Message-State: ANhLgQ0gFyQnPXh5nxnyKqnh960voJh/gpwiccnvSAbWNO9peLk00mDt
        bGavx28UrhF4VorlUtmmCADkIA==
X-Google-Smtp-Source: ADFU+vuKkH6eC/TyjKp82VgLkReuX6Vu6bromPkvOyS874kNDx2MU23u3kTtssmvRyNsQaYULSffiA==
X-Received: by 2002:a17:906:604c:: with SMTP id p12mr3231175ejj.202.1583339044755;
        Wed, 04 Mar 2020 08:24:04 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a40sm1535657edf.90.2020.03.04.08.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 08:24:03 -0800 (PST)
Subject: Re: [PATCH v7 07/18] dt-bindings: usb: dwc3: Add a gpio-usb-connector
 example
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
 <20200303171159.246992-8-bryan.odonoghue@linaro.org>
 <20200304145756.GA17484@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <1072c2cb-5b09-1725-4246-f19ef3899e4e@linaro.org>
Date:   Wed, 4 Mar 2020 16:24:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304145756.GA17484@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 04/03/2020 14:57, Rob Herring wrote:
> On Tue,  3 Mar 2020 17:11:48 +0000, Bryan O'Donoghue wrote:
>> A USB connector should be a child node of the USB controller
>> connector/usb-connector.txt. This patch adds an example of how to do this
>> to the dwc3 binding descriptions.
>>
>> It is necessary to declare a connector as a child-node of a USB controller
>> for role-switching to work, so this example should be helpful to others
>> implementing that.
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-usb@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Felipe Balbi <balbi@kernel.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Yep apologies I forgot to add your

Reviewed-by: Rob Herring <robh@kernel.org>

when posting this one
