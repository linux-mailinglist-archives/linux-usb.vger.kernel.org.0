Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C603BE5D3
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 11:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhGGJuh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 05:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhGGJug (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 05:50:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C19C061574
        for <linux-usb@vger.kernel.org>; Wed,  7 Jul 2021 02:47:56 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l1so1401917wme.4
        for <linux-usb@vger.kernel.org>; Wed, 07 Jul 2021 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dm2rBXOWQDYbyq7hq3px23+lQhiHxAKM1oygtO8cTVM=;
        b=S5978gsp1zz5G1304knfRBzraXCAg7QVZwfWiw8VImnRLUFqcI3BeIvhEPsGAIX2Zg
         /o1PLYpQGDxUthu2FEs5NQuXLqq/q1ZXjBaX1iL2GoZzLOu6mQw6iEoVMJ85z7WTT8/W
         aQk/VpJCAV/WCt06QMXSxlqoo64ox21IMCPbkNcCe2bAD1hVM0D1GEWgUpVqwnl0sUIc
         XtqDdoZutmIzPBGwahYWioCgfQr3VAE22PKtJ2hhGFzPloI1OI1kfBRA6ScvkIblKIgK
         KZnUurvuO85tWcxzYFp74OxStJ+DudDfrO9R8skvqb6CIXB27cF81qlPXFoEAlqZ5QUN
         JABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dm2rBXOWQDYbyq7hq3px23+lQhiHxAKM1oygtO8cTVM=;
        b=maDUTTPch1yCYG6oVpxO5nWSnU/Y/d5Vuces4k4vOdrWE1PsWqWUnVDEK/pXtMe+q4
         GTUPYysy2BW4AW4YORRZVz8BptDq9OswDQa5HQQWLEfEzGoek2fKQcWS8BOQrY8IbICx
         G5+ctZ9oj95CVBYdZPHPIwxts6hwOdMdj9mkF1id3gpIWpW4y/ZcViEEApq4XJQaRMn/
         l4vu1OpueLWCfKW0DXo7COpQQC7wEt3BzbCYKil3947RQFyGvFZNn1IZ+zO+BcP+tKe+
         69LaU6RQdwZeXP1ragz4EOAmuG1ucs5NFPlJavb4NaA0rgm0LHcO5UNE3wTtv9pHcHPp
         SmdA==
X-Gm-Message-State: AOAM533BNaMjlLQZHVQioYs8d1LchYxWJ0p3/9yTSkg/LHtN4nnMFOx0
        c19g7QDX/FI0fFUo0UUYbA3Skg==
X-Google-Smtp-Source: ABdhPJxIy1zv1VqCVrkP1G6sHNsRESEieiJSMFLIb4KpC98Ngg9XW1tSJcU0PUj+n5PtysZdHBU7hA==
X-Received: by 2002:a05:600c:48aa:: with SMTP id j42mr25648022wmp.93.1625651274701;
        Wed, 07 Jul 2021 02:47:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x17sm24330582wrn.62.2021.07.07.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 02:47:53 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: dwc3: Add role switch relay support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-3-bryan.odonoghue@linaro.org> <YOU4Tqol/CPzHNwM@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <51a11204-cd59-e18f-7dc3-f78632e77bde@linaro.org>
Date:   Wed, 7 Jul 2021 10:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YOU4Tqol/CPzHNwM@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/07/2021 06:14, Bjorn Andersson wrote:
> So you're going to rely on DT to create a role-switch link between the
> dwc3 core driver and the qcom wrapper?
> 
> As I said the other day, this is just a hack to get around the fact that
> of_platform_populate() may return before the dwc3 core has probed.

A beautiful hack though

> Another such case can be seen in [1], where Wesley is patching the DT
> node in runtime in order to pass a boolean parameter between the two
> driver parts.
> 
> If we fix that we don't need these kinds of workarounds.

OK, I understand/agree

Lets look at changing the way dwc3-qcom launches dwc3-core and make it that

1. Probe deferral in dwc3-core either defers the dwc3-qcom code
2. Or that the dwc3-qcom code waits for dwc3-core

either way instead of avoiding the fact that dwc3-core can defer we 
should make it that dwc3-qcom::probe() exits only when the dwc3-core is done

---
bod
