Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB75954ED77
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 00:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379047AbiFPWnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 18:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377250AbiFPWnA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 18:43:00 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB10F6466
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 15:42:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k7so2397836plg.7
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/3qjT8aePQAQgwBRNKBGi2cq5E72d9qFVFPteV2QzGY=;
        b=AHSQthb4NfiDtKyPdXYFi7qZOIDch82VkZNR+p7WRZ0184oxLk1MnLBd4hAfJMMPJ0
         m1gmMU1yv1wiB5P2eC9yzi88KjZR7Fe95QMtVs7wjymbrb0k8XQy2me3mmCNkxQoLQ0C
         m+NDXG8FeYr1OZc/oFCpbBFJ1Bnwg65hkpIXO9IWYopCi9FtSj5Y+xnH24qiz6vhtTSk
         fWR9Y/z7BJ3FOzP0Rq8CTNVGD+/e1/pyl5ftb6Q1rs1pRkDBwmD+OMiuIheK7IO2xzlV
         5cQAZmx4HyvNkd/iMMZAIelq5LZ9i6vByJr079ceet32W0d60r4AgOR+W07mH7f7gqHJ
         cb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/3qjT8aePQAQgwBRNKBGi2cq5E72d9qFVFPteV2QzGY=;
        b=MkDsaUDyc0VjkQgwUXysxK7Th4PLHlt3KBxjqIOS3GoL/WhT9Tq2iCMtX7Yz/QOQuR
         7b+FIVGcoeVH74LnQlD6c6acfFkzIKKKnriaGJcnmdk2ctCziZrnqqtNYWR3U2Xr4kq3
         KQgM9FACuhU0xT7lj9iYc5i8gkuhtO86L/rAnwDFbf7oEQY3QRFeX5spvUmPiEhm53AM
         vPrVwDE01dplP9qdqthbrH0Hu2TDmKmo+BSNSYlanqoZ5vS0KQO4sSdiNO5Xjvnoooyj
         JQT7nisGXMxklZgvQjiohtz5YN/DitLtJa6PTjriT2D7JiCde4m6nkHEMb0pYhLmklth
         xtoQ==
X-Gm-Message-State: AJIora9Pv0mRQg/i99uNkcrt/dII+L1TfghHDdklOMw5+lXdVdVMagZQ
        ECTUOSH+uiuawZhwC4fbh4heZw==
X-Google-Smtp-Source: AGRyM1unG6anfDF5um1BBec5kbCQAd7sP4RtFPT/SJ5FgWquU5j3Xlr563J59TgbcwpkvyR6kIC2cQ==
X-Received: by 2002:a17:902:d143:b0:168:d336:9de6 with SMTP id t3-20020a170902d14300b00168d3369de6mr6646970plt.124.1655419373440;
        Thu, 16 Jun 2022 15:42:53 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id f128-20020a62db86000000b0050dc7628158sm2279270pfg.50.2022.06.16.15.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 15:42:53 -0700 (PDT)
Message-ID: <e15168ac-b5a1-0c15-cfb3-34fb518e737f@linaro.org>
Date:   Thu, 16 Jun 2022 15:42:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Add
 'snps,enable_guctl1_resume_quirk' quirk
Content-Language: en-US
To:     Piyush Mehta <piyush.mehta@xilinx.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com
Cc:     git@xilinx.com, sivadur@xilinx.com
References: <20220613124703.4493-1-piyush.mehta@xilinx.com>
 <20220613124703.4493-2-piyush.mehta@xilinx.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613124703.4493-2-piyush.mehta@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/06/2022 05:47, Piyush Mehta wrote:
> Add a new DT quirk to dwc3 core to resolved issue of CRC failed error.
> On the resume path, U3/U2 exit controller fails to send proper CRC
> checksum in CRC5 field. As result Transaction Error is generated.
> Enabling bit 10 of GUCTL1 will correct this problem.
> 
> When this bit is set to '1', the UTMI/ULPI opmode will be changed to
> "normal" along with HS terminations after EOR.
> This option is to support certain legacy UTMI/ULPI PHYs.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index d41265ba8ce2..36fa87df57a9 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -234,6 +234,12 @@ properties:
>        avoid -EPROTO errors with usbhid on some devices (Hikey 970).
>      type: boolean
>  
> +  snps,enable_guctl1_resume_quirk:

No underscores in properties, use hyphens.

> +    description:
> +      Set if we enable quirk for fixing improper crc generation after resume
> +      from suspend.

Please describe actual issue, hardware property, not driver behavior. In
the description and property name. This could be something like
"snps,missing-src-after-resume" (or anything better).

Best regards,
Krzysztof
