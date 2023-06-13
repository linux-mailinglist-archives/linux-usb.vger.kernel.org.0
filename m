Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C1772DC1D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 10:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbjFMINw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 04:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239336AbjFMINu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 04:13:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E64910C2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 01:13:48 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51873d9a75dso821514a12.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686644027; x=1689236027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3OpJMeBVyPepT6y+19D62Yik2MazC7XQyqeriZ2hjI=;
        b=r8Y8fjt5fMiHz0pISTvJKANp2ZgWGUj3gwCQO9RiTQ/TSc3u81Cz4Ekt1bsA3Ykyaq
         qDqe2Sf2ngfh/66GS+6ERaOT5UghxXPlrRXlHXAHrx7TDrKG/YHB8aKlkyU9t82HBNXy
         8WK4ydHiUV/ox6uAteG+4U6EJLgi4+enxOhzTiMlk2NAqM3z7kIHZYbcNKaFrJwum/xs
         kOThqg3Hk4OnrqNEy73i84g5Pc9x10011n7RUUJxxroRMM839rv2sA/Mnig8qtT6jEZl
         UZcdKLmtxB+M8F8nltlbwIuBEOL64SRPiK+a/LsMi+wiX5A25LjIuj9h0llzctdYIE0X
         RhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644027; x=1689236027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3OpJMeBVyPepT6y+19D62Yik2MazC7XQyqeriZ2hjI=;
        b=LOqvu1L7U4HQbTu/yECnzMUXMwBEqkNzSrHr5Dv89aw4h9HNcwh/ujxpXTzV6yP2hx
         up3lg/KAUTOODGdOXpP4sg892DnfjO5h9Yp/ZXuueVfzV1lshrDsEVy3LhltFK2L11WD
         sYFgB60TR/DAOKfutuu5ky3luI4PvDPVDqCO9UnQJUyXKasrJRQheMBADOJezNcW+O2T
         Pn15Bc20FUQ3CGP6G8kVE6lJq5naQWjWHLWoDwyNUONn0VCvyRYQWDCJTMz312USSTkN
         RIUcCbgrZB4tn7vSbI9Dyw3Z45K9EV4GgYZfnbwnZQtsQbo8wUeFIVptgiHKzX5sYCEj
         P53Q==
X-Gm-Message-State: AC+VfDxMRBbQUzXHbq1q8OmrlKfqF/hEl32AhZ6DLm75TJA8cnH8ts5a
        v4KhpECefMy+WmaMwDwFG6WfpQ==
X-Google-Smtp-Source: ACHHUZ5Zn9o91CfqxYX0+GVqhAXFnI/K40JMaG31uTxV1T+b4dB4r9CiuDfNCCG6VyFuo99I52jvyg==
X-Received: by 2002:aa7:d6d5:0:b0:516:2dcf:d027 with SMTP id x21-20020aa7d6d5000000b005162dcfd027mr8192013edr.10.1686644027155;
        Tue, 13 Jun 2023 01:13:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z4-20020aa7cf84000000b005187a57fba1sm146765edx.77.2023.06.13.01.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:13:46 -0700 (PDT)
Message-ID: <e26878e5-fedc-b2fb-2213-5afd8479de4f@linaro.org>
Date:   Tue, 13 Jun 2023 10:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/8] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v3-1-22c9973012b6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v3-1-22c9973012b6@linaro.org>
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

On 13/06/2023 09:55, Neil Armstrong wrote:
> On some platforms, the Type-C plug orientation is given on a GPIO line.
> 
> Document this optional Type-C connector property, and take the
> assumption an active level represents an inverted/flipped orientation.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Rob had here objections as these are bindings for the connector, not
PMIC glink/altmode. I still doubt that Qualcomm USB Type-C connectors
have such pin exposed. If you open the schematics, the GPIO is actually
coming out from PMIC and is nowhere around the connector. Please drop my
Ack.

This however could be a pin of the PMIC because it clearly is on the
schematics.



Best regards,
Krzysztof

