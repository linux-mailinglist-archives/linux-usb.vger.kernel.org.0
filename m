Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F56449C1A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 19:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhKHTBc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 14:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbhKHTBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Nov 2021 14:01:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2514C061746
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 10:58:46 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so535370wme.4
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mvanPmq6qXs9DzVRtgUSTOUmzu/gL8E/gxL2zjoZAoU=;
        b=Jds43h1kcT0VaWp4h+zpSpszb21LxvCV1SXv0QtYW632/7pjGTHS9SNVSvTaAx2Q+G
         DVWRLPvvmg9dwSKlglNJMzrZdEa1/yZxnkkdlKz8kw/mplyH57mAQjski9ge4ccQ+VIh
         mGAd4Gns0D3nGK+YS5/5UJ71KHYvWXWVIi7BJ+46RdcW5+LCXVc76jDqKSiAYmYLxeXo
         MmYhnrSc4wN+l04t54J9a8RSCb4OBeB+9upEeZZhV4FDslrK74tdEoGTtWJHkhvGSyjJ
         yFzqN3I+KMUqiS4K+T0kliU37AgO3wwgAX/QgIJLqmkMZEJ60q98+txE/Z/JPyjhxIVU
         g9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mvanPmq6qXs9DzVRtgUSTOUmzu/gL8E/gxL2zjoZAoU=;
        b=XV1mLjgXT6mjaZ1hpuIK4hsarrj3f22MBW5dESRoHgwKYb+9wj4uKAEa32MsoTetIB
         fxsqLACeZHaTwtbcjRkywcvdarQoLN4sKOEo+uJ0gMZLFrCwgX8aZWcN+97+n3Irmjxf
         vYxbCdn5drT/qHGE8nvK6S9hcSr/i+z5+Ucgjp6RsMBO8iB+KqUsn3prLNarPz8A3PHW
         eVjVaHJXRTbJRQJZAIhNA9CvbxhFvvB09FA7NFcu/HOxOtnrGiHURKDnMNm3gmDNR2y3
         9FS7Rc6gcJ/4iaPJXzo0fflpJkZep9OUQmfeQC2axvSt7CrpOCvP8qFT501rCETLSuTj
         soEA==
X-Gm-Message-State: AOAM533y5VV9FwS7jAdTWRcK2wcZh+zhVCh68/YEjkM5MWChZJDxnrpf
        3khKxi3yMqu+h/joDXaIjLZMiA==
X-Google-Smtp-Source: ABdhPJy+WfzdWMT9C4MVN8FRQQCs9fEop+vwYbJy6qQ1Bg3YyCSw0l/qrHIAzGl8b7gPViVms8uv1w==
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr602978wms.44.1636397925431;
        Mon, 08 Nov 2021 10:58:45 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n184sm208627wme.2.2021.11.08.10.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 10:58:44 -0800 (PST)
Message-ID: <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
Date:   Mon, 8 Nov 2021 19:00:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
 <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/11/2021 17:13, Rob Herring wrote:
> Looks like the h/w is all part of a
> PMIC, so it should be part of the PMIC binding and probably merged with
> one of the nodes these phandles point to.

Not sure I really follow you here.

The existing PMIC dts arch/arm64/boot/dts/qcom/pm8150b.dtsi has:

pm8150b_gpios: gpio@c000 {
     compatible = "qcom,pm8150b-gpio";
}
Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

and

pm8150b_adc_tm: adc-tm@3500 {
     compatible = "qcom,spmi-adc-tm5";
};
Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml

to which I'm adding :

pm8150b_typec: typec@1500 {
     compatible = "qcom,pm8150b-typec";
};

Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

pm8150b_pdphy: pdphy@1700 {
     compatible = "qcom,pm8150b-pdphy";
};

Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
