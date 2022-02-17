Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8EC4BAC6D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 23:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343837AbiBQWRE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 17:17:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343829AbiBQWRD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 17:17:03 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD701662D1
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 14:16:45 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso1337318ooi.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3Qu8seh4Erze8eL9+0IzxF6u8DsEwe3aHTII3NoEQbE=;
        b=lkCn22DouqlTdK8owy6Rxc2C+gzFjraIPgRjzRk2l9lkxHw9kfi+nQ3+3mVt8N4XRe
         oHGu2GJXKn9wbmHDS2SAJgsP1F872qP11Pj5Xvy4ezv9Wfuq6EogtSPLwGD9hoSqUUc1
         ZES0CKmFvIydFeZQOQ3hSBi9vpNvUsujOTZk1eCFtrCv+wcOjAxccOP+BuCIc5jNB/Qb
         tlWzwQPtt+vDm+ffZ+oYbqGIYbqBw3K8xhro/YpaXVXSXEQe8bgHh5/7+zVpHeuXeNGw
         2AgpEm0x+111s+YA3v18d87MWF892Fy47QC0WXxFj0JSZ4Vq4Z+nO97Wl71d3mgNL2xo
         QF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3Qu8seh4Erze8eL9+0IzxF6u8DsEwe3aHTII3NoEQbE=;
        b=c9BOWzbQvL2pFAZNmwKFgdEbpVkyKFSFSH+r9nP3eDO1NYAoDLuhIZlkWZeBfx68DX
         jIad6l+JSyO+DVFb1T9w68XPLUKVCPc+yY+yKrTB6Gj/IlVBmlVniNLgdqoxCGak9Pvf
         ypqfyeXacaWiXY/EEtZlMJMCKe7l9ukjY+YAnc4gd54kPLGT8n32Nbiv7Q6A/iazNS56
         DGQqnPJl6EDa9kRvcRuXMVqhJyElXDcMGCR50QRVC9KjTUcD4ALozOwOpixvQm26kdXu
         YlZ96w4aYNGK8nYb5of01iSCPgFqqe+mujH3n0hVpxpmMF9ADpSwnHYNiNpGkHZ95X3H
         K/Ow==
X-Gm-Message-State: AOAM530zc+pdaemvsmQZTGn10UjPG2c4ODRTh12xBYKbpYe4O3DBIyut
        p5fezQwO235503E0KTXBG90UJDcHDbSQ6Hsu
X-Google-Smtp-Source: ABdhPJzptwAO0OnmpuzRq2rLwK8dCCZXdwiu3z4y+uJud/SrSlSKf5pCZV7ZlUaEHwAHDPPdWVYJhA==
X-Received: by 2002:a05:6870:9893:b0:d2:87e4:c71c with SMTP id eg19-20020a056870989300b000d287e4c71cmr1788986oab.132.1645136205008;
        Thu, 17 Feb 2022 14:16:45 -0800 (PST)
Received: from [192.168.11.51] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id k17sm518081otk.80.2022.02.17.14.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 14:16:44 -0800 (PST)
Message-ID: <5bc3b4d9-1bbb-479a-64f4-768f47075ec0@kali.org>
Date:   Thu, 17 Feb 2022 16:16:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v10 6/6] usb: dwc3: qcom: Enable the interrupts during
 probe
Content-Language: en-US
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com
References: <1642398248-21753-1-git-send-email-quic_c_sanm@quicinc.com>
 <1642398248-21753-7-git-send-email-quic_c_sanm@quicinc.com>
 <93b68251-7e7e-ac92-fb47-346c410744b2@kali.org>
 <20220118095255.GB11385@hu-pkondeti-hyd.qualcomm.com>
 <78c90e46-666b-bc9b-235d-ae4c69e19929@quicinc.com>
 <601cdc74-392f-dd4f-7ea0-8e65c6b6d7e2@quicinc.com>
 <52b37547-3e78-b18c-307d-7eedf5baab0d@kali.org>
 <0e006cc0-2760-195a-35b9-0a2f6e8452c5@quicinc.com>
 <47ae3e73-5880-bfb7-fc14-7dd95a75ce14@kali.org>
 <bb36a205-fbfe-536e-5bf6-4a717ffd4e6e@quicinc.com>
 <55aa0436-64f5-1ecb-d95d-721e45f6fb95@kali.org>
 <cad907b6-4434-45e7-bd70-b93c0035d90c@quicinc.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <cad907b6-4434-45e7-bd70-b93c0035d90c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sandeep,

On 2/17/22 12:05 AM, Sandeep Maheswaram wrote:
>
> Hi Steev,
>
> On 2/16/2022 3:21 PM, Steev Klimaszewski wrote:
>> That does allow it to boot, however.... it breaks USB.
>>
>> [    2.013325] genirq: Setting trigger mode 3 for irq 35 failed 
>> (gic_set_type+0x0/0x1b0)
>> [    2.014063] dwc3-qcom a6f8800.usb: dp_hs_phy_irq failed: -22
>> [    2.014134] dwc3-qcom a6f8800.usb: failed to setup IRQs, err=-22
>> [    2.014351] dwc3-qcom: probe of a6f8800.usb failed with error -22
>> [    2.018496] genirq: Setting trigger mode 3 for irq 39 failed 
>> (gic_set_type+0x0/0x1b0)
>> [    2.019124] dwc3-qcom a8f8800.usb: dp_hs_phy_irq failed: -22
>> [    2.019193] dwc3-qcom a8f8800.usb: failed to setup IRQs, err=-22
>> [    2.019372] dwc3-qcom: probe of a8f8800.usb failed with error -22
>>
>> steev@limitless:~$ lsusb
>> steev@limitless:~$
>>
>>
>> -- steev
>>
> Can you try with only IRQ_TYPE_EDGE_RISING as you are using GIC 
> interrupts  where IRQ_TYPE_EDGE_FALLING may not be supported
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0d6286d..ee3b031 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3796,8 +3796,8 @@
>
>                         interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 488 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 489 IRQ_TYPE_EDGE_RISING>;
>                         interrupt-names = "hs_phy_irq", "ss_phy_irq",
>                                           "dm_hs_phy_irq", 
> "dp_hs_phy_irq";
>
> @@ -3844,8 +3844,8 @@
>
>                         interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 490 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 491 IRQ_TYPE_EDGE_RISING>;
>                         interrupt-names = "hs_phy_irq", "ss_phy_irq",
>                                           "dm_hs_phy_irq", 
> "dp_hs_phy_irq";
> Regards
>
> Sandeep
>
With this change, and with either EDGE_RISING or EDGE_BOTH in the lenovo 
yoga c630 dts, it does indeed boot.  Leaving LEVEL_HIGH in the c630, it 
does also boot, but there is a delay of about 30 seconds (I'm assuming 
interrupt storm?) during the boot.

-- steev

