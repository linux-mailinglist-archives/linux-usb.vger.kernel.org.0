Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A985E6C7FCA
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 15:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjCXOW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 10:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjCXOW6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 10:22:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91151ACC8
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 07:22:56 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u1so1225245wmn.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679667775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eb1ftSmj+xdrfhPd1oOZD6u0EwjOsCwL6TaXlh1MWGs=;
        b=GaLfV6E/57+XYqc2gIai8+bFqPle3FZi2vK/rvt+oGuYxPtU+mP5ZEHBHMrUHZPiet
         YYxYg/JPyjHbTbe3rdTpgYROpmnQY4zrboESPcMmuSuWAJTHy7PYsZIuqBwjJOE0coYT
         fMSM1ZENj3C/qBnASAQOPsf3f8Ge+yG/d3wKNbTXbjUcWzhlTKKJfA1MBajJ9MVoyyF1
         pUO9xYySWEtN4wk8MqvdoXwCZPQiUn7LfXlg7dS/q0eUdQuP3zxiAdlCs+uZrA5Pn7ts
         UwT2D55Rf4Z3sVG3nMHc09G/hES5n/YvMMBkN4Izxicigqf2UbhyJZKQn7kgoDVzEBlw
         5iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679667775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb1ftSmj+xdrfhPd1oOZD6u0EwjOsCwL6TaXlh1MWGs=;
        b=RM7tYYdZRhoE2Z6n+nhmk5IxwNxJj9rl0qE33ulQRHdSAMZTozVg2RpyNGm3T63QFJ
         7ZrIl4qMHmr5z7wyclrDoIs8ieUpApPTn/FjOYED6VfoJxYqjvp71J9uHoaxYWqwlpru
         SVpF0CuNmaa+n7/EicA7PyNcKS+qw/CUQx9vQ9Z7eOcm+sXxIRze0KOwgFqaBZ9IdRks
         uXroMSpJpGoi/gQyxbdhFunM7hO7kBTwUNDlbxHIbQXU/yh36oKtoGUxr8KdY0trfnzU
         EoVMVGqIT34bYH4ytuiCimwZSo1j+FGwHedyPjO3fmcg4B9T+HYsP6a835AmHzZUVtiD
         mMww==
X-Gm-Message-State: AO0yUKVsAtVkP4fR8avMYYYvu6h9bOO2tbGj+ncsVBpB3K+tue+QqvlJ
        hN1nHOBphczfgMFdRHcsHwXr/A==
X-Google-Smtp-Source: AK7set+lapN5yF8rSNUrMo+59+lIZHrLvNBHJQuTxcvZW8FzVktbSmUQ/84BBsYq3IEw40yC3F8j5Q==
X-Received: by 2002:a05:600c:25a:b0:3ed:358e:c1c2 with SMTP id 26-20020a05600c025a00b003ed358ec1c2mr2526361wmj.18.1679667775323;
        Fri, 24 Mar 2023 07:22:55 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id fm15-20020a05600c0c0f00b003ede3f5c81fsm5016744wmb.41.2023.03.24.07.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 07:22:54 -0700 (PDT)
Message-ID: <153826ae-aee2-8da9-ecb7-1c8eb0d9b873@linaro.org>
Date:   Fri, 24 Mar 2023 14:22:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZB2tBkUY85yhzm67@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZB2tBkUY85yhzm67@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/03/2023 14:00, Heikki Krogerus wrote:
> I'm sorry I never asked this before, but is that virtual device really
> necessary? Couldn't you just merge that qcom_omic_virt_tcpm.c into
> qcom_pmic_typec.c?

You did ask it I think but, yeah that's what I'm doing/have done now.
