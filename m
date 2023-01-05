Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB8C65F37E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 19:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbjAESJr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 13:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbjAESJo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 13:09:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE6723A
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 10:09:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bk16so23722185wrb.11
        for <linux-usb@vger.kernel.org>; Thu, 05 Jan 2023 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCNkMnPSRswrB4/cN/tNytIZs+wuZf7VPA/RAMeEvis=;
        b=BUgdp574Abl4d6f7mAU7ICKWQyO3CKfC1WalR3KSuX6qMylVBgHByF66a/g6HUBtTT
         M0kOyHyE+AMKAJa+TTNk08cczF6ITHY7X9oSXM729aCP5Z5sgaCxVPXsQOmqhtJVJ1Pu
         59KE00iEKTALzNVm9hZNxAWBnKdVWUYceEx48OaTukjFwMRF4F6jAP6z9QNol4Zgg0Dj
         YeoRl9IcNv6S/nPITHSQPTRhQ7E31zmKrDi8uBPlt+svHf14gkKn2ag61jrai3bWQ9WO
         ueLCGDsaBLAhJEwCb9JD0yFtciHOwtnT5GlwWp6CJN0TwEuFBZHrmxonPXg53suffGS2
         bbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCNkMnPSRswrB4/cN/tNytIZs+wuZf7VPA/RAMeEvis=;
        b=PhpdCpM2DW+MrZI4bBI3QYjYryQ4RlSGwrs3EPcOvYl8pKbHceppTfvjBwoe132Mtn
         TF8Z08EtTqibkvop/lUOajfgMQjdcCFVCWWHAzD/0bZ7lyLDr1YBX1bqomVLx0RlPq5V
         qC2gY3Mq+vDu5i0vPlDNb7oX371bXvl8Y1xqmBigeuS8iwax702VvqbnSCy8LO9K30Qd
         dUJdYgt/oY69pLyqvGhkG7+mEohRqwE6XDGs/gAKniYqINYBTX5wV0l4DJgBJ2J+aHtS
         +oycnpeaCMjIviF12YfH8XVI9kph+KBpC6Zo3B36W6YhQoGlL6sgLOV66P2mn4wx8L1K
         3lPg==
X-Gm-Message-State: AFqh2kppMx46zRIXU2JDNZneUrHUoSlOQi5mxulxwhwZ8wyxb+80/OdE
        yha11BnInAYXkMhMNq5X2Hg0Qw==
X-Google-Smtp-Source: AMrXdXuKJS4KYFfBIofRQW2C+0hVHSnszXj4FBaa7hFjC+VGRdw29Xt18QQAGVNmA1dTF+5JauVMlA==
X-Received: by 2002:a5d:58fa:0:b0:28e:46bc:3256 with SMTP id f26-20020a5d58fa000000b0028e46bc3256mr14579011wrd.8.1672942181384;
        Thu, 05 Jan 2023 10:09:41 -0800 (PST)
Received: from [192.168.1.100] ([178.197.217.234])
        by smtp.gmail.com with ESMTPSA id bt15-20020a056000080f00b00297dcfdc90fsm12714459wrb.24.2023.01.05.10.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 10:09:40 -0800 (PST)
Message-ID: <afde9ca3-40e2-4332-fc8e-41a1176cd37e@linaro.org>
Date:   Thu, 5 Jan 2023 19:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 14/14] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
        robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-15-quic_wcheng@quicinc.com>
 <f57d8d44-651e-b51d-dd72-bdf15801958f@linaro.org>
 <Y7RqEM+GvBQbmBTb@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y7RqEM+GvBQbmBTb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/01/2023 18:46, Mark Brown wrote:
> On Mon, Dec 26, 2022 at 01:27:21PM +0100, Krzysztof Kozlowski wrote:
>> On 24/12/2022 00:32, Wesley Cheng wrote:
> 
>>> +            link-name = "USB Playback";
>>> +            cpu {
>>> +                sound-dai = <&q6afedai USB_RX>;
> 
>> Hmm, that makes me wonder if you really tested the bindings before
>> sending? If yes, where is the USB_RX defined?
> 
> It was added in patch 2, it's in include/dt-bindings.

Thanks, indeed, I was looking for another bindings patch but this was
squashed with a driver.

Best regards,
Krzysztof

