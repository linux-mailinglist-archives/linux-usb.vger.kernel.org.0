Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40CA727CCE
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 12:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbjFHK2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 06:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbjFHK2r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 06:28:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA461FFA
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 03:28:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-970056276acso71410266b.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686220124; x=1688812124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c258s4U6/uB0fFK+kkkJP9/66TeoJi5GTHBuhzJ9DxY=;
        b=yeRMjPSCx+M6+/CSSeYgG+go+Ky6s/WcThZk+Y1bvAxa6PqlRTO96VCVBODsSnb75m
         5k95xXAZesqYogf8oNWeXAQwda61sbAicCouSGzKQqQLFg46ConF1t/Dm3IfNzy7vG4p
         ItwBBKt3t55BoXztH8W82fAzInjnII47/XT2yqzTx4jkSiJGFVGtEDHKqu98BMfKG4RQ
         lRVMyFquEH9/DysH7Zt5A/poaNx3jcRggJVrhgx50HhUXrG/2Hdju7nUFj96/F2cyzLQ
         R71m6etEvgsyKATt4bWBs58/an6B/OYqNSgSEnHK5z3vZBlQi/8Jle6dOk5dk5QLlvl1
         jkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686220124; x=1688812124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c258s4U6/uB0fFK+kkkJP9/66TeoJi5GTHBuhzJ9DxY=;
        b=jgi/ODZmEIdKzh/TIFKQ9EkITRVKWsFV1bdyLMu/OCNXNUypdv+1TXnyN9f+sA2/qM
         y3yhpDapmn/fw+DYEoKTFCMxq7P1vxPQNzpVks1hqLVynsQMFx2UJSl8TlYTB4akZIaI
         U0rAcc08KT735bWoflhEG3Kt7+Oyl/34aV/jodYHFw83PxEF73jwc+nsN2Zf3UOHQofz
         x+37OxTT2u2Ut+wh0AQ/Jb/wdOAkCbXV46w4r8sTanPenCri1ueTRZufjV2J5MH/bIc/
         wKAcwVpGeXq2dG38hHvwX5FflaezYY1/5KXcn8XSvJrX/9KFWCeKCXqcmZwTXRQ6h2nC
         BENA==
X-Gm-Message-State: AC+VfDyOJ5FXiWAfKh7wzqgXfkTg/Dmu682BTFFiYUQ2CVy3Mi4hGtoI
        POJ8SgrijMnfkV00Dcajw2iq/g==
X-Google-Smtp-Source: ACHHUZ51+U11KfrRo1rVILyQaHwbMYnjIsvOkpRmLtsDLsGzzIqtz06R/q88jdLafKTc3hf6zh0cUg==
X-Received: by 2002:a17:906:6a0e:b0:973:91a5:bff1 with SMTP id qw14-20020a1709066a0e00b0097391a5bff1mr10514963ejc.68.1686220124396;
        Thu, 08 Jun 2023 03:28:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906660c00b00968242f8c37sm507852ejp.50.2023.06.08.03.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:28:43 -0700 (PDT)
Message-ID: <a34a7c5e-577b-5d20-c23f-8007b3988bc8@linaro.org>
Date:   Thu, 8 Jun 2023 12:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8550-qrd: add pmic glink
 port/endpoints
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
References: <20230601-topic-sm8550-upstream-type-c-v2-0-3bbdf37575c3@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v2-8-3bbdf37575c3@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v2-8-3bbdf37575c3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/06/2023 10:05, Neil Armstrong wrote:
> Add nodes to support Type-C USB/DP functionality.
> 
> On this platform, a Type-C redriver is added to the
> SuperSpeed graph.
> 

...

> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_ss_in: endpoint {
> +					data-lanes = <3 2 1 0>;
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	fsa4480@42 {

typec-switch? typec-mux?

> +		compatible = "fcs,fsa4480";
> +		reg = <0x42>;
> +
> +		vcc-supply = <&vreg_bob1>;
> +
> +		mode-switch;
> +		orientation-switch;
> +




Best regards,
Krzysztof

