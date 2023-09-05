Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1EB792528
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbjIEQBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353624AbjIEGyW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 02:54:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2741B4
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 23:54:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99de884ad25so324579566b.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 23:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896857; x=1694501657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnhlhLhE/Awy7OSGd1LKlGWZhliLjEnOAa8ccfaPRH4=;
        b=BwFZjPsPIoA4J4JCdvGGGWdNQw9G4bMX5mJRvtHMlyB+XvcZKsbmNE5WS4oSklcOBe
         1LVGixYBSvVroZpcYFZEDOu6TysKd4gSXgkM9LP5f0RCRbxYnO80y5bfO89nKTILkoHP
         EtSZt8mjPTIMrllnoFzWWDC+umSQHRkG3+44A9scor8fdIFUzSKm/mhPQM4O5gIIUzut
         XXBc+CyLx4dr+PY6cHFh9BkjCM+gsxpCAHsZtQkoYaY3E6Hs936Hs3P/7Hu+EA4Dg6Fc
         WRMLphgw4KTeNw8hNCO55XTLCuyAXsr9IDv9LCBZhyYkAb+IhUALcQxaB0AbY+7ShEoa
         DdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896857; x=1694501657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnhlhLhE/Awy7OSGd1LKlGWZhliLjEnOAa8ccfaPRH4=;
        b=UqnMQFcCt+/TFY6YFPsKfdR5gmf2yoXFGnNGk2M++ISHdxSdc014RPggwMrjgehX55
         0/vTf4IOLWnQjcuAfaepwz/H1EgDRHp46d/ez5plPaNkgNQW0dZpRctugu/Zq98veX7o
         cJBjmyRtr37KfbS1LQIAuDVHm1F2bud61v/6U/M5Y5oJ/eJa3uLjwUnCTrX0rf1PY/3C
         8+sOSbr7lxKUFphSz+0248BXC6Y+nYSyMEs1ptHalMee3LIVA133pcDS/jszG0L1ouEV
         1DVRu74fITtEh+vrNIRIRmb/XueWyQSjzHQghbIVJqQCeDMB4X2rL7oXUhLKA7+ARiim
         UW6g==
X-Gm-Message-State: AOJu0YwDI7mkcF1A38gtAzuVy7sEPJXRr50BW5SD9MnbIwGKZTCtPIc9
        csI1dXNgL9bhlWenp/4oaKAFng==
X-Google-Smtp-Source: AGHT+IEnUt712GLa7l6H3ls8ICRUbtE/Y6r3iAIzhxkPkhXkmuW0uCxLL9ywUhnD4fUrSBpo+16v7w==
X-Received: by 2002:a17:907:2cf1:b0:9a5:cb18:3b11 with SMTP id hz17-20020a1709072cf100b009a5cb183b11mr8093371ejc.17.1693896857246;
        Mon, 04 Sep 2023 23:54:17 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906395800b00992e265495csm7161204eje.212.2023.09.04.23.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:54:16 -0700 (PDT)
Message-ID: <f348a896-93dc-8181-adfe-77ff73ae6c3a@linaro.org>
Date:   Tue, 5 Sep 2023 08:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/5] dt-bindings: usb: dwc3: Add SDX75 compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693889028-6485-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693889028-6485-5-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1693889028-6485-5-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/09/2023 06:43, Rohit Agarwal wrote:
> Document the SDX75 dwc3 compatible.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

