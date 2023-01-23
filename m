Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A66678095
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 16:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjAWPyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 10:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbjAWPyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 10:54:31 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C3B35A4
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 07:54:28 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso8901604wmq.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWhsZS74+Dvjyfzik5/nC+Ev2mJ9IDMei/KC6GCemqY=;
        b=TT+l75Q3a2+t2PvAy6nHsS+q1ZUp/sKbhf5T64RkZ9ddDppwuYZeXMANpq/6o/mj+A
         yMJgop3GLTikdPYq98Wm9+bmbsmcgeRyrpDOH5wvGMevQKJW5Gz1hGCIDPVqiptM7gPI
         GkruSFbxWZZPi7Ast7916sM4U7Txk25klxq/bRBHnH/qFQ8shdnm+okdCP4opcfnLSnt
         AmddDMghG+aDGpq1cc/hRVyVU6vh0zcKxyIw8pA3LjwiOzhMEecd1cE3e6OaThw3+hQj
         h2JXVEgDPlVEVY5qgPjmA5r40jPMP0VZglCL3lbfUWvDHlWwOllnrSJV/ipOUyi7L6R4
         gw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWhsZS74+Dvjyfzik5/nC+Ev2mJ9IDMei/KC6GCemqY=;
        b=pWtw79E6kmJBAbG3OontGL4fvul6nos3xgmUzMyj9Jvd5Ai1R8IiyP1gwoo7z9Kxr+
         JYhfFBDOkChG5WzAx/eGftiRuAQlE2yDMyv509L0MZDbstXxq3e58ai/og+QZmCC6Wtv
         whYYjjP0vr1C3Kam4PwvwBKF5Gfpfxhxg+1Ai1nBoOWqzZY15Yfry+tglH4RABxn33tZ
         JK4IcB7gnjoo0Qv5HYGbYWMwmE8phQ6eT6qMcpOQqv+z/MFRDeq1Z0T1BCztRYM3D+T6
         PLN9EdYT9OPA27cIzOTlnA4lV6rUr/mWiiSeswdknd0boUYKfHc4lHmDDoP46gxlHU0b
         nr/A==
X-Gm-Message-State: AFqh2krTSQyWPEQTIGLM4QcFBnk8Yomn1J7eTcClG2Rujp+kaOoEyUcn
        mx7yvDFAtpHI4Jjzex3dPM8+eA==
X-Google-Smtp-Source: AMrXdXud0tQooneMXSQQVIEYXsQAZXqN6E4Gkaz9JfIa1aRRHlSWR2a6cT0AuUF0CvwyFs2RKMFDuw==
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id o22-20020a05600c511600b003db01a8c041mr24615039wms.17.1674489266958;
        Mon, 23 Jan 2023 07:54:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b003dafadd2f77sm12126036wms.1.2023.01.23.07.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:54:26 -0800 (PST)
Message-ID: <b86ed174-811a-023f-4a65-4bc0b10cf710@linaro.org>
Date:   Mon, 23 Jan 2023 16:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
 <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
 <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/01/2023 15:28, Jon Hunter wrote:
> 
> On 20/01/2023 08:32, Krzysztof Kozlowski wrote:
> 
> ...
> 
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/tegra194-gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    i2c {
>>> +      #address-cells = <1>;
>>> +      #size-cells = <0>;
>>> +      #interrupt-cells = <2>;
>>
>> Drop, does not look like relevant or used here.
> 
> 
> Without the above I get ...

Didn't you drop too much? I meant only that one line above my comment,
so only interrupt-cells.

> 
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:25.13-26: Warning (reg_format): /example-0/i2c/typec-controller@8:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:22.13-43.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #address-cells value
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:23.30-42.13: Warning (avoid_default_addr_size): /example-0/i2c/typec-controller@8: Relying on default #size-cells value
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec-controller@8: interrupts: [[10], [8]] is too long
> 
>>
>>> +
>>> +      ucsi-ccg@8 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Thanks. I don't see anything there is would fit here, so would 'typec-controller' for the node name be OK?

Yeah, pretty often we miss a generic example. Can be just "typec".


> 

Best regards,
Krzysztof

