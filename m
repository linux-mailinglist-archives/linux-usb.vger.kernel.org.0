Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2072443F20C
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhJ1Vwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 17:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhJ1Vwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 17:52:37 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AEBC061745
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 14:50:09 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id b12so8178084wrh.4
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=4m41viJCJEzsieLP/qKTZliHa6bo3e1wjR1SAfWR2CI=;
        b=zcX4+7MHAzOmf2IThooIJCjHwfVmnr9wiH1xcbIbt0a6NAXHPht+1LcZ2wuhdxlnpf
         JDDqPzTAooYLtOxF+S+Y6DlF6alGtVCtC6LDNgIL6tjOVNE1yyPAXz4/OcmCjYNdliUM
         o1t3gQPt8xFlXmBgx5zomrHIj9lBWlNsAmN9D1QjacCZjnU83qJ5OQeRX+6GVllRo/Yn
         DX3bpuEKRTjVN6NcC8iply2Z+DeIdDZLm/l9pGnUHtIGSW3tafHkOsCBSk//CStGPA74
         c7KSHmujw+vIoDoEKJgAcN3AseIMb+WDmQgYlZAiY2XGAcBUr35VId7EoyIkKoBhfzuD
         y5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=4m41viJCJEzsieLP/qKTZliHa6bo3e1wjR1SAfWR2CI=;
        b=K64vAKMy+ruDQYDDkiZt5IosgTdvTvBBWbetN4TSm2oJI3pkMFpse/liiF1KbYwv25
         Jm+RyRwYVzY/NqNq52QSDnr+j2khGAPoH54Fd7ZxyNji6S/1qTTfRKGkwiUrYQU+RjE8
         YLYEySyJeMCSIAaafWZljFn9hua7cFeF0gKSDN59Wm8/CFMsBqdgwC+NfSfgNy2H86n2
         0cTVMhxd2leuY8pTYbGuTpgQdmtCi5khpqi4k5zxgTGVhzpg14BOpnA3/+FHxJ2SVpaQ
         mB+X6RLNI2BYWjPyoBtudiVJNusuKbH/72MDWa0BT4YbNaUKgyjKRqDVvMXLyLq5ByaC
         +RNQ==
X-Gm-Message-State: AOAM532caH2h5yHktPYRvfyYwtSq07R2M0TqzLDsEp6q2q3PjdZNNRx+
        IpnLB3wzNENrvMsy+3Uw6184fg==
X-Google-Smtp-Source: ABdhPJzFcb5NgjmqXJpc9tJfNExy2pexPVWMYRLxBUzj5yHHt+cWNsAsuhmh+ys/8gGAbnE6BAmsow==
X-Received: by 2002:a05:6000:188e:: with SMTP id a14mr8722904wri.223.1635457808096;
        Thu, 28 Oct 2021 14:50:08 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n10sm5670862wmq.24.2021.10.28.14.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 14:50:07 -0700 (PDT)
Message-ID: <5f98b4a5-c049-1b74-91e0-ce3a950e663d@linaro.org>
Date:   Thu, 28 Oct 2021 22:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RESEND PATCH v2 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM
 YAML schema
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
 <20211028164941.831918-6-bryan.odonoghue@linaro.org>
 <YXsLVwLcvlJSQX88@robh.at.kernel.org>
 <f37340f7-898b-2863-9337-1ee5ab78de4a@linaro.org>
In-Reply-To: <f37340f7-898b-2863-9337-1ee5ab78de4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/10/2021 22:46, Bryan O'Donoghue wrote:
> I thought it would be a mess to have, since we try to keep addresses 
> linear in DTS files

sic: I thought the following DTS would be messy since the tcpm device 
would span over all three silicon blocks and should we want to add in 
charger, the charger would then end up as an out-of-order address.

> 
> 
> pm8150b_tcpm: pmic-tcpm@1500 {
>      compatible = "qcom,pmic-tcpm";
> 
> 
>      pm8150b_typec: typec@1500 {
>          compatible = "qcom,pm8150b-typec";
>          reg = <0x1500>;
>          ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> 
>              port@0 {
>                  reg = <0>;
>                  pmic_typec: endpoint {
>                      remote-endpoint = <&pmic_tcpm_typec>;
>                  };
>              };
>          };
>      };
> 
>      pm8150b_pdphy: pdphy@1700 {
>          compatible = "qcom,pm8150b-pdphy";
>          reg = <0x1700>;
>          ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> 
>              port@0 {
>                  reg = <0>;
>                  pmic_pdphy: endpoint {
>                      remote-endpoint = <&pmic_tcpm_pdphy>;
>                  };
>              };
>          };
>      };
> };
> 
> pm8150b_charger: pmic-charger@1600 {
>      /* Consume electrons here */
> };

