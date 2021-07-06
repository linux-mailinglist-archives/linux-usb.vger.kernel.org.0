Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5C13BC905
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jul 2021 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhGFKIb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jul 2021 06:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhGFKIa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jul 2021 06:08:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB045C061574
        for <linux-usb@vger.kernel.org>; Tue,  6 Jul 2021 03:05:50 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a8so13696901wrp.5
        for <linux-usb@vger.kernel.org>; Tue, 06 Jul 2021 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N0pM6S1o+yezfK0OM7tu+y3rvBGTT7N8p2vJYUjae4w=;
        b=XPjdjKzBcnVE+brn4tBHhYnnEo07eA0CuT2hVp9GXNfVCuOZFg/XHTB051zbde9NeT
         HzhriBa02EnR2ovnM5IzOSiKI4HoVdaoibMHhkLlvfh68MCmolMwWkDVgh3ndwwWxO0x
         pSc+/++oGS+q7CZSBcUDnZCwo9IBkUFGdiXmJxX5gTKS2Z9R8CTlJY68C6oATGt5XwRj
         yAj+Mf2U6zWq7vyg5NqKSkoutm4VcRVgU0H+fHHVKr1BvX/AmAyf0yyvnuCm+h7sDzJA
         YgRQ/V8oZj6HC2KtKedqxagNlZF8P3vNG5u/lo3xxoOtbiJw7cuw5b0TPy+5u5l7/WYx
         74LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N0pM6S1o+yezfK0OM7tu+y3rvBGTT7N8p2vJYUjae4w=;
        b=CESWxZPRWYQ5ccUiVjOmtlOVkiIPOAPkUiVZ+GW30I1yWzVaFbus5Na+MAE3JuHP4N
         7yi3y2h8VH6zSbVJDniLd7GXX+ptEHnmU16LgIn1ifNTby5BLhVlIMlh2hV3vHtCT4nn
         zz25lArSvGIYTsaGprlQKyoEzDZOoEoh2wt6zeDZkXXIN/OFZ8l9tSllzjGamcZTgOp2
         V3I6VKTu0ahaiCe3jd5IPsKuPCyHt4nhLq+V5ZbrRtx+1ZN2+Ed14jnzEiqWOU71SgDp
         JBcyfFxkeYwhs6z0uWOmCQRP0lxhWblMFkkIGLr0G/Bcj86PE30D5cAoX8C1+4TdqdKu
         YEMw==
X-Gm-Message-State: AOAM531KsXigqx3QAD2fOK1hLv2eS8J8jaZ+rLd+/EuPPRix3JoyC6ni
        OZNXEzrs7gygyLgyoC1eUej9bw==
X-Google-Smtp-Source: ABdhPJzYtoncKxmlWh+A2ckaERu2zTb17/in8Ri7vWan8pLW6wm1eB0Mf7JuiZLoDYEhZ8WWBLf1wg==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr21140145wrq.387.1625565949321;
        Tue, 06 Jul 2021 03:05:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm16003495wrr.76.2021.07.06.03.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:05:48 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: dwc3: Add role switch relay support
To:     Peter Chen <peter.chen@kernel.org>
Cc:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-3-bryan.odonoghue@linaro.org>
 <20210706025130.GA19460@nchen>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <27a9a1e5-2839-07d5-e461-0deb6371c529@linaro.org>
Date:   Tue, 6 Jul 2021 11:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210706025130.GA19460@nchen>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/07/2021 03:51, Peter Chen wrote:
> If I understand correctly, the call trace like below:
> 
> Connector (GPIO/Type-C, usb_role_switch_set_role) -> dwc3 core (func: dwc3_usb_role_switch_set)
> -> dwc3 qcom glue (func: dwc3_qcom_usb_role_switch_set)

Yes with dwc3_qcom_usb_role_switch_set() then toggling 
dwc3_qcom_vbus_override_enable() which is the missing piece right now

> And, at dts, the property "usb-role-switch" will be at both dwc3 glue and core node
> dwc3 core is the connector (GPIO/Type-C)'s role switch
> dwc3 glue is the dwc3 core's role switch
> 
> right?

Yes, since the glue is modeled as the parent device of the core all that 
has to happen between dwc3 core and dwc3-qcom is "usb-role-swtich" 
declared in the parent dwc3-qcom entry

---
bod
