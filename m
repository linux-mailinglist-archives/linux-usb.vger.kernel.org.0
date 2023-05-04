Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC11A6F4212
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 12:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjEBK4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 06:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjEBK4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 06:56:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC1E5241
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 03:56:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-506c04dd879so6158966a12.3
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025002; x=1685617002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9NjcIUjZd/aHaGZ2xuuhHfRWq9d1voqSmHCETTSD5is=;
        b=Azp5BksA5jtXU083Qc0HaNLyaZp24roDKJ3QreC7NI2J/FlO5PpxkyToIjFXfohf4C
         VkKLsh6nXUBR2azgLeEa4R3V4VhGaWnqdL1WoEeDPwza9DbsaEU7eXRb+uCE+p40FXzq
         HphnQrfYBdlsMbExQR9nflRhuMRJ6DYFy2qcuZqKa0Ge2BHisP76aOOzHhyecsgZpPf2
         DjLjGZwWuHc3Sb4TeQQhQMQG+FljDruGc1hpo3AIhZ9lqvgWcSqmq+RvSa9+Uj5sdgmA
         DoKo6wBezunp+ktY9VNveg3g1+tOzNi4HFKJWB0VyzBBfwZNdgGNLrGyD9tcN3XqlEtX
         KXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025002; x=1685617002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NjcIUjZd/aHaGZ2xuuhHfRWq9d1voqSmHCETTSD5is=;
        b=YR/+tVzjepMkrsz02wHqCLCFY4g5K2V6xRvJla1dIHT/CcTn1+Wdjp+YnSr+fpv4kZ
         FhROZG9rNm7BoU7o4YWQ5mzH/RGTPHoSpZVBPclxslX5192+LEsebrBtSdFEbVzLpVLd
         F/xdumCcOAN3ACxl60kxTyv/znaBO3pVebVrGBiYis31C5LmqczW3XWKDemlLOytdz5+
         WLf/VLIhGemFPo7VIzFW7T+fuyoGYaSoQoxwT+sT5ONZVAGKZe3xgSj+FDzgq+vr1X3q
         8bTsHTQrMe8CnUu564+cnZK5pe7vPNVDK+XrvDXX/OCfvr+5Z2+QtWOxg9tbx1rltdoS
         4G3Q==
X-Gm-Message-State: AC+VfDxkgdvq0RYoLmmxPQcdfHG0ue5o5CLqyQPNp8FrUTJRhJhSUpYk
        ZeCpqpJUh02Mvx3UP2J2EgjW/Q==
X-Google-Smtp-Source: ACHHUZ4gm3w2Of6tRjKjcEwPjEbUqHC2XDsHiFi0uBHHr4lA+NA2LY/j4Jf+cyYU0XFC9TcPkm6sTQ==
X-Received: by 2002:a17:907:628a:b0:958:801b:9945 with SMTP id nd10-20020a170907628a00b00958801b9945mr16301349ejc.31.1683025002105;
        Tue, 02 May 2023 03:56:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090681c100b0094f67ea6598sm15886267ejx.193.2023.05.02.03.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:56:41 -0700 (PDT)
Message-ID: <cf85112d-2b61-18a1-571d-8149386eeaa2@linaro.org>
Date:   Tue, 2 May 2023 12:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 05/13] dt-bindings: usb: Add Qualcomm PMIC Type-C
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Wesley Cheng <wcheng@codeaurora.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-6-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501121111.1058190-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/05/2023 14:11, Bryan O'Donoghue wrote:
> Add a description for the Type-C silicon interface inside Qualcomm's
> PM8150b hardware block.
> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Thank you for your patch. There is something to discuss/improve.

Two nits below

> +                    port@1 {
> +                        reg = <1>;
> +                        pmic_typec_role_switch_out: endpoint {
> +                            remote-endpoint = <&usb_controller_role_switch_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +    usb_controller {

No underscores in node names, just "usb"

> +        dr_mode = "otg";
> +        usb-role-switch;
> +        port {
> +            usb_controller_role_switch_in: endpoint {
> +                remote-endpoint = <&pmic_typec_role_switch_out>;
> +            };
> +        };
> +    };
> +
> +    usb_phy {

usb-phy


With fixes above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

