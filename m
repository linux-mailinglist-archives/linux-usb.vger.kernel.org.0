Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610FE72FFA4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbjFNNMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 09:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244911AbjFNNMS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 09:12:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698D72100
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 06:12:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51a1d539ffaso447215a12.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748336; x=1689340336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mh3rTE8xbH3GEFFRDIFqlk1x7uwXyL+WDonR/+P6664=;
        b=p/Y1/dGuDwnc71Zk5XMEnW62C4zoUokel7VoqfAvUrgMceILVTUOOE2SJZjOsA5SKt
         PTAwvrKXEXMRxki1WZQGWO3t2pqfD+aPQQjkE2AM0C1ObytK4A87x0pVFxSRHKSt2VtD
         D3kVbDAbv/676eXRfni7BloWvZRW4l4E4xhj1QsjQlRxe0YznY7F/2cqYnFJ1BsICK0P
         3PIRgfAjOmmZ5PdNQbK1fHlABmTOfzs+uIwzBHAIVg1wEdXupMCJ0JZcXg/gmR7IKLe3
         gLoXFqQyHEUMVi/BTZaTuar+jUvLGvDGCX7ioRq4/gpUMGcoNzxVjvrTQxThbDi+f8Py
         J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748336; x=1689340336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh3rTE8xbH3GEFFRDIFqlk1x7uwXyL+WDonR/+P6664=;
        b=JLz8lpYSLIxIe2fWL9QlmeEJy+DjfFU0oUNkuRjdRGDs1L+K4Oh4sEa13IZ8gyzaDB
         Ia+Le7vTawtks1CVZ7fQL5p7KYQY5mcoUW6nLdU+c1zQXqfkUwVj/4bpD4z61znqvljq
         yIZDXZ/XlTxpyP8kynXqNKHEV+NaGTBckOLXtX3kHwm0t1kZycJbyg5KqSDHm5pnmfoq
         bu6YXb5EptTbJl3hT8NVjbY7+QfQReNCPybSHumFdSM8pV7J8o/jLYG6PO1vjupPf0sz
         uxn/4XdoTV6GSCdp0PcFj8tX+vGk173lb1UvOXEAG+1Ez3csFxeCKd1rIR/pgX/B3g25
         lVlA==
X-Gm-Message-State: AC+VfDz57Wca5eZknyviqVco1EGuXXl1TAgn52lZPZ5suZNX8ackItg+
        se8JkLZKDqyOJRM0crH53cXVPw==
X-Google-Smtp-Source: ACHHUZ7GvhWfwrjzRXpMDseArxpcMah8+fPBc1JcLep3h15z5uvHSViQdESVuNN9qmKn5qQ9djrLhg==
X-Received: by 2002:a05:6402:4409:b0:506:bbf8:5152 with SMTP id y9-20020a056402440900b00506bbf85152mr1714369eda.9.1686748335838;
        Wed, 14 Jun 2023 06:12:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w8-20020aa7cb48000000b0051632dc69absm7685355edt.86.2023.06.14.06.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:12:15 -0700 (PDT)
Message-ID: <5d195f77-88c4-6539-d8dc-2a4ee3945acb@linaro.org>
Date:   Wed, 14 Jun 2023 15:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] usb: typec: fsa4480: rework mux & switch setup to
 handle more states
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230614-topic-sm8550-upstream-type-c-audio-v1-0-15a92565146b@linaro.org>
 <20230614-topic-sm8550-upstream-type-c-audio-v1-2-15a92565146b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614-topic-sm8550-upstream-type-c-audio-v1-2-15a92565146b@linaro.org>
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

On 14/06/2023 15:10, Neil Armstrong wrote:
> In order to handle the Audio Accessory mode, refactor the mux
> and switch setup in a single function.
> 
> The refactor will help add new states and make the process
> simpler to understand.
> 


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

