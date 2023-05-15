Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2D77031D9
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 17:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242327AbjEOPuk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 11:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240291AbjEOPuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 11:50:39 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7241FDF
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 08:50:37 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so19107913a12.0
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684165836; x=1686757836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9ir8VjD7MAqquvJv40c/6+htwdH9IBw366Pp2iRs/M=;
        b=Nbs+zq9wXaEp0Xr+tVC3RQmnkbX032OScImE/xWT+SQ9UIwGiaPR44f5nilova52+6
         t5bSsUshr0n1a1RLse2NDfvuquBFFC2NchVEc9UciePF+vF5hP6MbzeBAA6QcJA5UkQT
         asd5YPoifnGlnRr4VIUB8x7k+tTAHKUHkLMuKbApe9Rye76hWhbwTXFLmpJ3/oqsZ3Uc
         sB6L072XzqEmFV+ermZ+YmfnBlXfrXevM3RbUuAWj6qNNciVhLyS1S85P0geeav8FOom
         fB57btP2THPdAt+qdHUvMgL9a/9wOTXcicgY/kwJwdsPoYCLP8I63GDnC3DYfUPHpcU1
         v6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165836; x=1686757836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9ir8VjD7MAqquvJv40c/6+htwdH9IBw366Pp2iRs/M=;
        b=Y4YGbuSXRkczYBsv0cvetxDvf7dm7JL0jEUk6/SJHn+wesiNeJ6CUfU2GRavLgmwEw
         F1xSd/E3BmOHnzTGFhGoe3utd8nJACn4brx5o52L9+f+P27KfzELlZCgofrIAiNkZDnu
         R60YNio5JVomIG8541Lv1mKPJG1d7oNNy4wXAnCGpuGtc1itHR1AYlDlD7LuqLQ8PPd2
         1fauY0H5LJ2F1mvYD3Je9GWgzywPTAO/AAzXcAcMitCvwkBC30UcHOSXkR+aKrB5gvlI
         T6XrpoEmLNKa9xGLHj7wYkr9E8J8LmVx1YFba1C80th+4lO+26dkKsj/6OBIEgwTTi/s
         2Qtg==
X-Gm-Message-State: AC+VfDzQnQVpVHb+iVb8wvMow5BfPFQmLLXqJUMgD4V/EmR/ei7vtujk
        37dHpnXqOavsEkQjflFskEyNiA==
X-Google-Smtp-Source: ACHHUZ7K0gcmiNFnYb+oMM9HY+xnS0+OTG2o+6ATw0GEllGGmnO8V/LL60oko2lvxXwM5mvdYMIgVw==
X-Received: by 2002:a17:907:2dab:b0:96a:2b4:eb65 with SMTP id gt43-20020a1709072dab00b0096a02b4eb65mr19324293ejc.9.1684165836436;
        Mon, 15 May 2023 08:50:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id rq12-20020a17090788cc00b0094f0f0de1bcsm9412732ejc.200.2023.05.15.08.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:50:35 -0700 (PDT)
Message-ID: <0648846c-4d12-21f4-7522-a869c75f2587@linaro.org>
Date:   Mon, 15 May 2023 17:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: usb: snps,dwc3: Fix "snps,hsphy_interface"
 type
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org
References: <20230514231102.788841-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514231102.788841-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/05/2023 01:11, Marek Vasut wrote:
> The "snps,hsphy_interface" is string, not u8. Fix the type.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Fixes: 389d77658801 ("dt-bindings: usb: Convert DWC USB3 bindings to DT
schema")

And cc-stable.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

