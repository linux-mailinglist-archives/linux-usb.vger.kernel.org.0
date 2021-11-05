Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061E14466A6
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 17:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhKEQGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 12:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhKEQGS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Nov 2021 12:06:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A9DC061714
        for <linux-usb@vger.kernel.org>; Fri,  5 Nov 2021 09:03:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id v127so7438714wme.5
        for <linux-usb@vger.kernel.org>; Fri, 05 Nov 2021 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s68XxEAQVTsbV0tiQ0iC8ThpTbLQFrCbAZYJOejjuWU=;
        b=WZNy4+rVsDTNDm9cYERP4vmFEuI5AYOyn6O+Fm8jDDNB4DPKNk3+wNX3QBRg0oiPLV
         ElOLuPozvQJ2xRfo597DUFJHrpCk0yIxEVCInREkf0a4HFyNnwAuAlGuf7ZHA0mQrT7y
         qFnlc296uLGzOc4ys0WtehThiUh0gSSVA8NjHkSOwa6wX/GOt+Y2TOkftC9qG3l2wiKC
         rZ7ckF4ezvs144xYLRost6UaGvjpVqW6FhSJRpAzrv+VVFgHhTSI3w/InkASTuZ5MRJo
         rA0v7ZT0oHFrkI9E7Rq4mhjD/t99LmFGHpimIsLZQSe3qU/LuCZsBc575c26Lpp8EmtZ
         6csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s68XxEAQVTsbV0tiQ0iC8ThpTbLQFrCbAZYJOejjuWU=;
        b=wu1Ka+U01l2BSi1JrZ1Lv073X4jFc536dLfec3c4lIX5UkQd1K6XrF3LzyEzEOx2KL
         kifi/SueP5m4pdMsN28DC/yNDwyE2ydmlp6xEbHyTEOg5Q98Ojrf6I+UzDLvTcPsazcq
         COx6A/aTToKqAXsPs9XIvJuEJjAVCdXte9HnlNdZp5uLf7Iuh+MVQLAQVOHXiiVx5fJv
         P0uMWtm0pMe1JuVv/ODapW3tyxG0RBktKeQY/6SaxbzLVsgfNlUE1/kcD0w6kHAoB0hv
         GII82z0QZE6gG3tZspbjodzyZ5NXkb374U7LR4ybZyLr4066SA9MWLn4RO+f9lxZ8Kq+
         wQYw==
X-Gm-Message-State: AOAM5326tBzlwvLDd3pCKTIdqZG8n6YF72QaZVomhQkQ0hNf4q7oO+d6
        pDccxzAbe7PvQXSBsC7VzZUoww==
X-Google-Smtp-Source: ABdhPJwk5F9B0etWwFBCXvheHF5J5gH7BY6sepmL4k2YFCG8vTHMM7lBF6xaLxyQR3GplJclTlSZvg==
X-Received: by 2002:a1c:447:: with SMTP id 68mr31515335wme.69.1636128216838;
        Fri, 05 Nov 2021 09:03:36 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h7sm8044083wrt.64.2021.11.05.09.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:03:36 -0700 (PDT)
Message-ID: <749a058d-a16d-3a92-25b6-97afcfaa7787@linaro.org>
Date:   Fri, 5 Nov 2021 16:05:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 6/7] usb: typec: qcom: Remove standalone qcom pm8150b
 typec driver
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-7-bryan.odonoghue@linaro.org>
 <YYVG5DZJdNfZyj8x@kuha.fi.intel.com> <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>>
>> I don't like that you create point where the support is temporarily
>> removed for this hardware. I know Guenter asked that you remove the
>> old driver in a separate patch, but I believe at that point you were
>> also proposing different config option name for the new driver, so you
>> could have removed the old driver only after you added the new one.
>>
>> Since you now use the same configuration option name - which makes
>> perfect sense to me - I think you need to refactor this series. Maybe
>> you could first just move the old driver under drivers/usb/typec/tcpm/
>> in one patch, and then modify and slit it in another patch.

No problem with this in principle

> Or just merge this patch to the next one.

I think this for preference unless Guenter has an objection .. 
easier/less work

---
bod

