Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6216C027B
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 15:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjCSOvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 10:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjCSOvD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 10:51:03 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7751C586
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 07:51:01 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso6047330wmo.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679237460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg+WtsRKLyVBBHQPTuGjWIy3wZhbGvyEZxefNeAgn4g=;
        b=ZvBgspzAabXpgXX5mQkbTa8jXN4N7/XhaPzqFnI2cuGxZ3A0AkZb1C82QQ5J8Ij0EF
         WN43AH2dxtMWl0zpk0Txw9ZoR6Qo7lIlpt+JKOzdf6M05b8A5XZ9WPlJH8MrXkkvZOW1
         j4tBfKbfgBQIiCPoh2TmUrSgRhpImD8z+2eDEtoe9DcsVpBinqIaEA4qREto084vcN/U
         i1HNPgDJqoULdZSLLWQlerH9r50jITN4EFL7RcEomCiTs7gE4kwgwdKUK3F1IkxHjH5O
         2tVZdxY0FQzzPvmIaZZivUWMhoVgihYnSn4uPd6+1mrWl1eKxhWZwhMoXwXYFHpUl/B8
         Qcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679237460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg+WtsRKLyVBBHQPTuGjWIy3wZhbGvyEZxefNeAgn4g=;
        b=0MljQgulG8VhrymXQRnvtGE19rblXPpwqecUn4jwToQ/PwJiamPBNYelN9j4k6ietv
         Ql8Ex9EFeHbohAw9PhxIY83MIYNFahn6RLenx8lX/nKgu5+jdqZLlef3uvbBtUVBen0L
         28ipOL9aMWkHA74c9kaueKmyd1W5kKZtXSGv1uF6Jq3Lt39+WnEhnLnIUZW9v/VQ9f/T
         QD3ZIKGfrkLt1YPyeFKvXMWoWAHF7/lM2drcYseuPAlqxuD3nQgx/hG8UIlKf5YwmHiP
         0BnAquvODCI4UWY7jrTaI0Bq2eLzvdZybLC7TETAQDQ2xowE3KdzeDN9DNIQTX4rrxBO
         3kjQ==
X-Gm-Message-State: AO0yUKVXpIoQUvRNTgqtrc9lilHIlp09wFF4dQt+9QXBqtrw6XRzZ9E8
        jzR0La+bWWyryvZs8EANlxWGUw==
X-Google-Smtp-Source: AK7set+WpTUcnREx/cybLShYysBfZXOBLshiUx4JE/BB846vHWsEwxgI3/T0ksOqAgOrs5JOaPy+pA==
X-Received: by 2002:a05:600c:5250:b0:3ed:4685:4618 with SMTP id fc16-20020a05600c525000b003ed46854618mr12296749wmb.34.1679237460029;
        Sun, 19 Mar 2023 07:51:00 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003ecc64edf7esm7758646wmi.39.2023.03.19.07.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 07:50:59 -0700 (PDT)
Message-ID: <4ec17ff9-6e7a-fa3d-06d1-bb6919bc1444@linaro.org>
Date:   Sun, 19 Mar 2023 14:50:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 05/18] dt-bindings: usb: Add qcom,pmic-typec dt-binding
 header
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-6-bryan.odonoghue@linaro.org>
 <c1f91a8a-2844-393b-6dc1-127828446c6c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c1f91a8a-2844-393b-6dc1-127828446c6c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/03/2023 11:50, Krzysztof Kozlowski wrote:
> And squash it with next patch. Binding headers are not a separate
> feature. It's the same as adding bindings.

Actually I can drop these headers, you're right.
