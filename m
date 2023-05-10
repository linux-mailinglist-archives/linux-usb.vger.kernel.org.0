Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55436FD698
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 08:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235856AbjEJGLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 02:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjEJGLp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 02:11:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DB51727
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 23:11:43 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so12196084a12.0
        for <linux-usb@vger.kernel.org>; Tue, 09 May 2023 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683699102; x=1686291102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvOjxeXjp/s5nF6xUiypalrBmJNS17l+gcLsfcpdhVE=;
        b=bhfMsF43uXoJr2Shrpb/8RFFe9fUB1rYCyUZ7qklrRCX5sS7ZMnDgiEGnQGIJ0gRu5
         nwkdX9nUr76zq6bz8MECkhyC+QeczGGw9GnOUpe1L/jeliwzqEKQJpDiLntsMTBbudDF
         3sAgRXzIyk4tk+jFgqULXE3XtUfKUjopEPQOllOun1rVab01YSepvd/1Ow2QgsLln45j
         Umysn9DRvUFreadIwJUpiBaxU6LE+hg/xN+fxkeNx9X+D4QHFtIh6xinSdE+6IHdIA2I
         KOJo1q4trv1agOQoesuYkxmvckeoC9+ylH0hBmzSBdCcCviQNxYGPwPVgC4r9zRLiXVU
         VQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683699102; x=1686291102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvOjxeXjp/s5nF6xUiypalrBmJNS17l+gcLsfcpdhVE=;
        b=glUlACV3J4G4OBaOtvkLDXkIBckw3YveBpWkjmB3wjTEUXDniToD52VYPeHyyd8hjQ
         QiWPFj2S6SgzTG6x3ES3imUo2/TK1taS1dMwNyyiXtgr2fg0i0laCmbscWWvSyqW1o6s
         9xIRIK/qZ78CEoNUrrQ3Gt5M+Z8KY0UTJIEM8wtmTOR9vhY1reeCpVggV3Cj5dKMcWVD
         pYV80hMdEqyjiaonZHevZzXSvo3dGjjdf1/pWye59Ap2hxNv+kY+Quc/qlMLOw/0WVKG
         NCJ6kNSo2BRZHiweSkHemyAsb28yLsd3oCG9dCBHlL6tuvGO2awRQLAcCh52z5C4HYgS
         Z2Qg==
X-Gm-Message-State: AC+VfDyaVJRgmFaMhddMhzh/bG+CrpG03r1TZHXeC6IVBHRh72Ouxtb9
        ahL9x5QQ7QRTp3oD9EhNq9Q=
X-Google-Smtp-Source: ACHHUZ6L8s3FZVu6mRV4Hw5m+JgUM68N1zFJ169zsmvNR19x9mn7bt71Lz8Je3BClPhnkim1DGy88Q==
X-Received: by 2002:a17:907:8688:b0:96a:3005:61b7 with SMTP id qa8-20020a170907868800b0096a300561b7mr494666ejc.74.1683699102007;
        Tue, 09 May 2023 23:11:42 -0700 (PDT)
Received: from [10.10.10.83] ([79.142.132.242])
        by smtp.gmail.com with ESMTPSA id hf15-20020a1709072c4f00b0094f58a85bc5sm2211660ejc.180.2023.05.09.23.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 23:11:41 -0700 (PDT)
Message-ID: <f8aa160b-83dc-59cc-03dc-d9e8edbd497f@gmail.com>
Date:   Wed, 10 May 2023 08:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
To:     =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230407060731.20537-1-stanley_chang@realtek.com>
 <519bc128c0ded61b64d26c6e9260bc1fd7c6dea3.camel@gmail.com>
 <f9f4c477a5a64687900d5a68feb8a586@realtek.com>
Content-Language: en-US
From:   Klaus Kudielka <klaus.kudielka@gmail.com>
In-Reply-To: <f9f4c477a5a64687900d5a68feb8a586@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.05.2023 05:16, Stanley Chang[昌育德] wrote:
> Hi Klaus,
>
>>
>> I'm booting 6.4-rc1 on a Turris Omnia
>> (arm/boot/dts/armada-385-turris-omnia.dts)
>> and get those error messages:
>> [    0.231609] xhci-hcd f10f0000.usb3: xhci_plat_probe get usb3phy fail
>> (ret=-6)
>> [    0.239716] xhci-hcd f10f8000.usb3: xhci_plat_probe get usb3phy fail
>> (ret=-6)
>>
>> It looks like a cosmetic issue with error codes, but maybe it can be fixed?
>>
> 1. I checked arm/boot/dts/armada-385-turris-omnia.dts.
> The xhci node doesn't seem to have usb-phy.
> In this case it should get error code -ENODEV (-19).
> I'm not sure why the error code is -ENXIO (-6).
> Can you provide more details?

I have CONFIG_USB_PHY disabled. In that case, devm_usb_get_phy_by_phandle
is declared static inline and returns -ENXIO. See include/linux/usb/phy.h.

> 2. This error message will be printed only when getting the usb3 phy fails.
> And usb_phy set to NULL, It does not affect the original behavior.
> Maybe I'm missing checking -ENXIO or some other error code.
> I can delete this log according to usb2 phy situation.

Checking for -ENXIO in addition to -ENODEV would cover the !CONFIG_USB_PHY
case, I guess. Whether there are other "false alarm" cases, I don't know.

> Thanks,
> Stanley

Best regards, Klaus
