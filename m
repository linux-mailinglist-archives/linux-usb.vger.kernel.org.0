Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66978D880
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbjH3Sai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241722AbjH3HFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 03:05:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C88F1BF
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 00:05:36 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1216617a12.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693379135; x=1693983935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvAK6jjE3YzRP6mlz2y2Vxt0E/0zHEbo4pXAcUmbFmY=;
        b=xR3+tphzOq4LAh31HwDyHeEOvhg6YSPDvVC97ovXTOBm+I7dZ6lTGAxsE44dDn+g3l
         LpQLgURqvPgZw8VBkh2F+WtCUBVIMC9cV+YJH8qKp54WCrGG0ItiZSyIqx9vTIFwUGXl
         0g8Gvxwtyxvje8eYog3qDthpOIlrRdbZjKIfg12W4MPxrfO/wz/1Yaq1BejhE4gDAYUJ
         qBGAYAFcQA8hMFWucDkddXau/GoREtJAw74ffqacNubcF0xgOaw/657/M/oJgeIHVSJ9
         +yoaom1Dlug0k9rIdJ3tGhrJ9wGoQ4ZH2JNeEtD9Ppap9mj0dXzY3hv8+g5EcWVDcdzu
         ctMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693379135; x=1693983935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvAK6jjE3YzRP6mlz2y2Vxt0E/0zHEbo4pXAcUmbFmY=;
        b=CId2T3LcAszpHVf7dXRiqlCFNzzCJQFhlPavEdd0CbfwuH24JNsIuzNf7DOt4c98gM
         kf1KCVJ5v8HJNOFep6Jzz/GDJwCDDBHQ7MGgXv6HQNsHUjUy6z3SgRnhKTHVMRKABUB/
         zogm7RbD42V4V5OlPYUtLPWsq+It8jb9cPCMQYUyqAvaqXzJ4Pc9yyo06SNjjcCX0OE9
         KyJYzjesLs5gPxoROmA8JVXxtH9NfqZfoBHSi7/ncRMsh9n6+5owbWYHJ1qdNLa7XsvB
         swOtEkxWdKLb8aJNLP3U3xvV0Tj3TPCD53z11zgzqeEaEdTuyFuxsSDddu5b+hGyz5As
         BpwA==
X-Gm-Message-State: AOJu0Yy6/TFS3glB6su68D1Lc4qfvilpfKtHo90+3pc9SBlM6Mm7S/Fe
        ALJ4BdqGQJu2Hl68y3WZP4K7Sg==
X-Google-Smtp-Source: AGHT+IGs9RuawEvgzuln7v19oDV9TpEAvyCRWM8dqn7lFgSkk+mtqzbjb3PtujKk1zwiA5AOyeD2tQ==
X-Received: by 2002:a17:906:518a:b0:9a2:295a:9bbc with SMTP id y10-20020a170906518a00b009a2295a9bbcmr1415763ejk.37.1693379135039;
        Wed, 30 Aug 2023 00:05:35 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906355500b0098d2d219649sm6936092eja.174.2023.08.30.00.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 00:05:34 -0700 (PDT)
Message-ID: <6f70a710-c409-23c0-890b-370ccd23e088@linaro.org>
Date:   Wed, 30 Aug 2023 09:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: snps,dwc3: Add
 runtime-suspend-on-usb-suspend property
Content-Language: en-US
To:     Elson Serrao <quic_eserrao@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230814185043.9252-3-quic_eserrao@quicinc.com>
 <a77403f5-8b99-3012-3843-1999ee8d12ce@linaro.org>
 <6b27cd55-4e44-7a26-30ff-9692344cae4c@quicinc.com>
 <31fa930a-51fb-6a7f-300d-e71f6b399eb1@linaro.org>
 <a0a6c561-6319-00ba-c6db-f1dec9f0f0aa@quicinc.com>
 <5dfae814-7233-eb1f-cae7-f335e54ce1b6@linaro.org>
 <cf0227c8-cd02-81b6-9e13-2e7fe6f505f2@kernel.org>
 <20230826015257.mbogiefsbz5474ft@synopsys.com>
 <afd4843b-427a-8535-78e2-f81879378371@linaro.org>
 <969988f6-f01f-0e31-6a98-7d02c5a3a4ad@quicinc.com>
 <20230830013739.srnh2uyhly66yvu2@synopsys.com>
 <d30a8d6a-236a-b6eb-76d7-115cc9950ce1@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d30a8d6a-236a-b6eb-76d7-115cc9950ce1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/08/2023 06:31, Elson Serrao wrote:
> 
> 
> On 8/29/2023 6:37 PM, Thinh Nguyen wrote:
>> Just want to clarify, there are dwc3 properties and there are dt binding
>> properties. Often the case that dt binding matches 1-to-1 with dwc3
>> driver property. Now, we need to enhance the checkers so that the dwc3
>> driver property to match cases where it is platform specific and through
>> compatible string.
>>
> 
> Thank you for the clarification Thinh.
> To confirm, we would need to modify the driver to parse a new compatible 
> string (say "snps,dwc3-ext-wakeup") and add .data field so that the 
> driver is aware that this particular platform supports external wakeup 
> detection.Right ?

No, it's not then platform specific. You said it depends on each
platform. Platform is Qualcomm SM8450 for example.

Best regards,
Krzysztof

