Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E7B72FF9D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 15:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244878AbjFNNLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 09:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244903AbjFNNLq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 09:11:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8C92102
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 06:11:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977d4a1cf0eso100431766b.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 06:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748304; x=1689340304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHVpbgvRKoN6WozJ1cqg+kiNeYvG89UWqiwLlRl1pkU=;
        b=uAlBhr6AHLRFpqdWqfW6NXeJfp6XKhTrePvF6sAgrFcnN/IYkHGX4wTfF9yMCD3pqI
         ip1b8OcJ+adTH30jPry2Rv55YPzxuRAx5zIiifq4MwDLrdc8haKTdH2zG19BKNOuo0KE
         GzaQzCJLG4xDpVDVOmXMxXHGUPzqiQobKaF3RomE6tXk+N7GwCba5NdHzJ/qEGJgajc1
         ByEkNmwKoCPH3UBKHN7Jj/CDOrrzhOo2wU6LKPTqzxMqB94pYS2IC3Tn1K77c11s73Dj
         HuphU+ODSM7BTPPDhaN6QL2mRcY3Tfl/LC7UhxRsNwrFORJirO3qIdoMxXt8UERncVb6
         lbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748304; x=1689340304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHVpbgvRKoN6WozJ1cqg+kiNeYvG89UWqiwLlRl1pkU=;
        b=W59nxTXG7pYbG3y0ahIVhItnbn1zZyhLC/82+t4ZeXukhbhT6AmeG6T/3yzk5A11J9
         qI7PiOlcQDv75YEFM+W1Iq1RzNTXkmcj5Irz+4u0C8DHq7J59r1o+V0/1WVaLqzOhNSb
         e2m4J4MONMRUtNol9bE5PXuuYdxOFpaGvgMQMJ01ms+Vze4EANIUrgB0O5OzMqBzhyNI
         2zO82+BzJeBV6d1eWjaMwCBVP/L39WIvj4WkQ0BwZotkjMrtvm3IPvr9N7n4nydDlRzX
         K+QQ6CONacOCwfGgATLfh2H4+gam5xlAYZKvPp053YhI6WyvhXPqpegXhS0W/P31M8TM
         REMQ==
X-Gm-Message-State: AC+VfDzMALANPcdVJcjM99txNwxcnt1AdZJvR7Ce3RmWwMmizxR0OjmO
        h+Uk9ZJC/LpJSLP97lAnoojr+Q==
X-Google-Smtp-Source: ACHHUZ6io8NV9CKI/2/RCobs405rIgebZrJp4ccfsvljmvWWOKsQmTR3b2ZenwQLwYikNvqc77NDEQ==
X-Received: by 2002:a17:907:25c1:b0:978:94b1:2568 with SMTP id ae1-20020a17090725c100b0097894b12568mr13926596ejc.32.1686748303758;
        Wed, 14 Jun 2023 06:11:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b7-20020a170906038700b009787b18c253sm8062623eja.181.2023.06.14.06.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:11:43 -0700 (PDT)
Message-ID: <fec7c59d-df2b-e10c-7eb2-235cca5b0ead@linaro.org>
Date:   Wed, 14 Jun 2023 15:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] usb: typec: ucsi: call typec_set_mode on non-altmode
 partner change
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230614-topic-sm8550-upstream-type-c-audio-v1-0-15a92565146b@linaro.org>
 <20230614-topic-sm8550-upstream-type-c-audio-v1-1-15a92565146b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614-topic-sm8550-upstream-type-c-audio-v1-1-15a92565146b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/06/2023 15:10, Neil Armstrong wrote:
> Add support for calling typec_set_mode() for the DEBUG, AUDIO
> accessory modes.
> 
> Let's also call typec_set_mode() for USB as default and SAFE
> when partner is disconnected.
> 
> The USB state is only called when ALT mode is specifically
> not specified by the partner status flags in order
> to leave the altmode handlers setup the proper mode to
> switches, muxes and retimers.
> 


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

