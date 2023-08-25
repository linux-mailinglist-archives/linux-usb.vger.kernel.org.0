Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA3D78844F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 12:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240728AbjHYKLX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 06:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242332AbjHYKLI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 06:11:08 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65B0210C
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:11:03 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so6539575e9.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692958262; x=1693563062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewEmMj7inmpoDVoJmiDKQWGdDQMW87QVH0DgLN63V+o=;
        b=LWoMKVGuTx2dD5wMViWXkWE7t3BwmOK3pL5fn7kTrZ0W8KYPgmnhfh0ShwgviaCXCd
         4U0n/6iHpQe7hdMp/dw/W4828WhZhMhlW565A6zZ2hKaxQxKk3TtHCLBHBZ7WSB8jclX
         pK3BWuhFCfAOn+Fj73W4S1I3Js0uQoB3XyR/roTMdMyDuecqhAstCUYVgs/XrcoUUQ6n
         Iw6pQ0FZau4skOy+hzH00OpTrwwjfq87alJ/1DgNR+mCcjI4Jx+qkgd+G27sXZQv+LGG
         zcgsf3/F6x5xnq0bUrf0lGWEoG9FemMWMRaxSH6RV5US+BDR9EkaRprt2kPUbaNjTW5x
         79iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692958262; x=1693563062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewEmMj7inmpoDVoJmiDKQWGdDQMW87QVH0DgLN63V+o=;
        b=T9QR8GylIRGn6rRw9Y2RW0NgEjhxLOaw+hUsQl0TzOS/61eyiOaMEWsQHaEfWDxtyU
         l0aWhqv1REt6ukY+2Ixp7Y644yxOndYUXUHWX29pVgg7eiMhbb+Th32XIFMGS4CptS/t
         iU+MH/fUev9PVUeX14up1WBDL7MU9BraysaNeoKQ/T6Tfjxq/BczYk7wUsi0vKyKNdTZ
         V2JL2U5QpnO6RobSDN2ToAqU3KaJvhxu3GzP7nxZPotxc7cIpKoY8jO9RZEpd/H4IYnC
         6JLFm/KjXbta1SZ0O0bVL3sLvRAV2qAkbvNWa+aQ5ywf6H/rIdupYj6HAyOscTPGCfDF
         mhqA==
X-Gm-Message-State: AOJu0YzwWnuzUo9aj3QiQ7j8KJJ2lxF7ONZVSDFnAm5dj98EDv0vYN59
        D6Q6MiFVg5hqNkxtq6iP6cyQtw==
X-Google-Smtp-Source: AGHT+IE9Tg89RzMnFa3pPMS6nzca0eFOlPDkBtm+P0GnVAQd++4vHTy36sLAIytj6NM+u3TcrDCvAA==
X-Received: by 2002:a1c:f204:0:b0:3fe:4548:1892 with SMTP id s4-20020a1cf204000000b003fe45481892mr13682104wmc.16.1692958262370;
        Fri, 25 Aug 2023 03:11:02 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d4904000000b0031779a6b451sm1752447wrq.83.2023.08.25.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:11:01 -0700 (PDT)
Message-ID: <47547f9e-73d3-f4bc-e3ac-f1be42730dd6@linaro.org>
Date:   Fri, 25 Aug 2023 11:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     hui liu <quic_huliu@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230824-qcom-tcpc-v2-1-3dd8c3424564@quicinc.com>
 <ZOdlOQ+N2J7jyIEZ@kuha.fi.intel.com> <ZOdt+dz7XXljFJcK@kuha.fi.intel.com>
 <0b6b864c-3e41-4b41-ac35-9ab8edb156a0@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0b6b864c-3e41-4b41-ac35-9ab8edb156a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2023 11:03, hui liu wrote:
> Hi Heikki,
> 
> I will let Bryan to comment, I am using the driver to support the pdphy 
> in SMB2352 and there is no external regulator required, so I am just 
> using a dummy regulator device and I saw this unbalanced regulator 
> disabling warnings, so my intention for this change is just fixing the 
> warning message. However, I am fine with whatever suggestion you have, 
> since the logic is straightforward, and I can make the changes once you 
> have the agreement.
> 
> Thanks,
> Hui

Err well on real hardware with a real regulator I don't see this error.

I'd say we should try the second proposed changed in pdphy_start 
pdphy_stop since it looks neater.

If it works then fine, else lets stick to your original fix.

---
bod
