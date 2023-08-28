Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EDD78A917
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 11:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjH1Jnw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 05:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjH1JnZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 05:43:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B49107
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:43:22 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso23776655e9.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693215801; x=1693820601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usms/QTjPy6vDpU62iDg5ogXpigRM+J+p1k1vPFiBhg=;
        b=GxjrjbwCM+5NxPZApMdix+C8GGzGID+O4ZMzpUwjnGJnLYU6GVEBHxPq+WtK2RoTWD
         YSwnAHFyF942T4Nnb3cbuYCay/FmMQHQqXcKXeCFnXhMze4Ua1V/YZJOZumHcqGp6I1W
         IYiRiS36ZxaEzn8Zf8Vf71K/dTUQBJZGSwRvKK+6rCcC4LATdt4KEWp98+N60aSopl5Z
         0/eDQRK4HHiRu022QyBluz6UVW4c+awzLZC8X9MV02j9dtMQ2tBEGniPWktdmjDByYHF
         EeDhZd20QQK/TiWCir+99wbZCSAQwRM/SxE9HXj+IUJQYUd8L4VzjzSE0VC6C7WKQHDe
         /X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693215801; x=1693820601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usms/QTjPy6vDpU62iDg5ogXpigRM+J+p1k1vPFiBhg=;
        b=F11wlHl6u1bnUKSzUAmrCA3hu/y3zllkvQ+unwzL2WaxRVVyZ5WJkn9YiOAtZ+dPpR
         d3vmuw+GvVCegoKKZ2QNRjhBQWZAY3Ss2R91CAW6NAUaMLvBZEs7OaYQ5Q8on0IaD5QI
         ETUSL/kAY2mltTrpHM2ZaDgV0pry2KVPII8DUr/6gyZDjg0cxZ+zkvEPje840c35MX61
         35HkYJke/rQN6XKT8tcoTVXgWgyndE1BfMAJfgAS9lIzF6yi42c6ItOqdioRjPa9gdSW
         Y0V1HG6xxIHBe9yuow634QLAIv1N8hVAJ8bkSWG4/DVu6PXkDa6x+6t3trifv3ma7UJ8
         5oFA==
X-Gm-Message-State: AOJu0Ywu4q8o2nlHHdJ7uv5QkmAczDMjOlf2Dc7H8MfHbY6qFAZmC9h3
        YtRTUDxSicxPMZjvlTpfjSVuL2z+c+3HMX7tmX8=
X-Google-Smtp-Source: AGHT+IGsdYbjgiJP5lOqF22vSL0cb3wcECPsBh+Uph1FAFH941e3xekJyrRRk78O/9PxN3mJBqXrEg==
X-Received: by 2002:adf:fc06:0:b0:319:6896:6e8e with SMTP id i6-20020adffc06000000b0031968966e8emr17251804wrr.62.1693215801155;
        Mon, 28 Aug 2023 02:43:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f17-20020adfdb51000000b0031912c0ffebsm9968473wrj.23.2023.08.28.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 02:43:20 -0700 (PDT)
Message-ID: <64f5f891-b0ba-b2a9-9756-39464d1cacc9@linaro.org>
Date:   Mon, 28 Aug 2023 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     hui liu <quic_huliu@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230824-qcom-tcpc-v2-1-3dd8c3424564@quicinc.com>
 <ZOdlOQ+N2J7jyIEZ@kuha.fi.intel.com> <ZOdt+dz7XXljFJcK@kuha.fi.intel.com>
 <0b6b864c-3e41-4b41-ac35-9ab8edb156a0@quicinc.com>
 <47547f9e-73d3-f4bc-e3ac-f1be42730dd6@linaro.org>
 <6187e719-d1a4-4985-b43f-efaeca2dde89@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6187e719-d1a4-4985-b43f-efaeca2dde89@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/08/2023 06:51, hui liu wrote:
> 
> 
> On 8/25/2023 6:11 PM, Bryan O'Donoghue wrote:
>> On 25/08/2023 11:03, hui liu wrote:
>>> Hi Heikki,
>>>
>>> I will let Bryan to comment, I am using the driver to support the 
>>> pdphy in SMB2352 and there is no external regulator required, so I am 
>>> just using a dummy regulator device and I saw this unbalanced 
>>> regulator disabling warnings, so my intention for this change is just 
>>> fixing the warning message. However, I am fine with whatever 
>>> suggestion you have, since the logic is straightforward, and I can 
>>> make the changes once you have the agreement.
>>>
>>> Thanks,
>>> Hui
>>
>> Err well on real hardware with a real regulator I don't see this error.
> Just a doublt, if real regulator has no this error, who enabled it 
> before it was reseted?

adb/xbl most likely i.e. the bootloader

If you think about it, be it on an embedded dev board or on a phone, 
enabling the type-c port -> regulator that goes with it, would be common 
practice, especially if you boot the board, as I do via USB to begin with.

>>
>> I'd say we should try the second proposed changed in pdphy_start 
>> pdphy_stop since it looks neater.
>>
> I updated the code refer to the proposal, and it worked well,but I just 
> thought it makes code a little redundant. Why don't we only keep one 
> pdphy_enable/pdphy_disable or pdphy_start/pdphy_stop?

Not sure I follow you there.

We should have only one regulator enable/disable in pdphy_start and 
pdphy_stop per my understanding.

https://lore.kernel.org/linux-arm-msm/9574a219-3abf-b2c9-7d90-e79d364134bb@linaro.org/

---
bod

