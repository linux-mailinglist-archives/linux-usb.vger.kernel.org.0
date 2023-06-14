Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A518A726901
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 20:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbjFGShc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 14:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbjFGSha (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 14:37:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758F42132
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 11:37:11 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9745ba45cd1so1028164566b.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163030; x=1688755030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBJvAcEQG2LY1vEFF1IyEE7RE0JoBORvfJiXnm2YgHM=;
        b=qrWeIk4YwcZ/UP+m3nmcJ36ROhF2tdABqHxKNMe5BdbmFqzTHXpZ7BuVvAtn6yqK/L
         ALPZQnxm1/nS8iSTebGIQexO+ajZd0VjL9GP+LfB9dwmBCGkLLbhO8diXgDzfX9VnEy9
         neI7aHWUOKygd7ijcszY01vUrIiP2AqDbCCULt/jVPrp+Q5xInjGaYTwisoftEKwXDJz
         eBzpT0E/PpX5CIiYmHj/Trw68oW2FqdWHqfC8hsHYuelvU52sYDUB8VwEyTQvYyDtb/k
         +d8ubF6geMCquX3h4qgXNT1Oc8PiKyK6F/ZXQnKBC++F7TaqLRqiROVdKtWdTgceUjxf
         aHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163030; x=1688755030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBJvAcEQG2LY1vEFF1IyEE7RE0JoBORvfJiXnm2YgHM=;
        b=PatNgS4jK9EMBZ1KzcwL6Kdaou/MY47pDwAzBvK3CTMMLd6PEHU4f7ArbBWGowlXMV
         4Bp8C6zcfwIYche3igHLXogsNfa1m3FAHld8LgC3OEJskgrbo7ImWTJRC99+tyFtmEB6
         2bZIQ6AaiyiXzWthC9LcUfq650IUwHcK0MooToCN5dujqUFCZ+kXV/cFnnUdvyLz+d0v
         ZMBRmJr3a02rZYD2p9py7No6rfKBQWwrE6qnHD4WIKMWMBlvJ106wdMP3Dy4LIzNpB01
         aC4wh9nXnuQ/ob7MdFZo/0c8kEnrjLfEnpIzPpQZTvLFltvDtm50REcMh/+nCQN0f4SU
         tKVQ==
X-Gm-Message-State: AC+VfDzPRskU2yM75yuCqQYIv8hVOLoa5jkaPBelnzV6k97KEJcgi4Aw
        uH0WRCzz8g9lRnjm323m4uUb0g==
X-Google-Smtp-Source: ACHHUZ4ZTFG+XhRWtjV8bpPXmdRsoCVVFTbyApWlPN15wkPN8gqENfBjyZhOMvcU//hPfzQqyCf1Qg==
X-Received: by 2002:a17:907:a426:b0:96f:912e:5ec4 with SMTP id sg38-20020a170907a42600b0096f912e5ec4mr7063552ejc.16.1686163029840;
        Wed, 07 Jun 2023 11:37:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os20-20020a170906af7400b0097887b68c17sm803492ejb.98.2023.06.07.11.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:37:09 -0700 (PDT)
Message-ID: <cba3834a-8ed3-b3a8-32cc-b0397fa5ae41@linaro.org>
Date:   Wed, 7 Jun 2023 20:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/9] phy: qcom-m31: Introduce qcom,m31 USB phy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
 <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/06/2023 13:20, Dmitry Baryshkov wrote:
> On 07/06/2023 13:56, Varadarajan Narayanan wrote:
>> Introduce CONFIG_PHY_QCOM_M31_USB for including the M31 phy driver
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> Is there any reason to keep Kconfig, Makefile and driver in different 
> commits?

KPI? Yearly objectives/goals?

Best regards,
Krzysztof

