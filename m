Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD6F6BFC04
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 18:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCRRrc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 13:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjCRRrb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 13:47:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8A72BF0E
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 10:47:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q16so6982815wrw.2
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679161647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAVMze14D3bLTi3r2lL73yYKOfT+PJedJY69Qu4icNU=;
        b=uhDdOD72uEKuMcHfi5r4/E7221laOeUis6eIXTNzheGO7lkU3PirfmB5foxlqm69G1
         nN/jqs8M9aNEJN1pkTXt1sD3P8BgCUyYP3G2q6G2woEgEzJrKsSZI/00Aq7fCr6NA1VL
         y6/SJy6FmNnP409tB2/DnYNKghpLlixx7z2Hw/adcwxxy8j7IrsDDhGEg4wJox8oQBKA
         OoW+EMSXOQ9MVADqzUG1TJbYVzPiGu2Wn0bQ5AsamJUPlxPiGfd1zQljlsviBYNGQ5W/
         0V8/tMWGytiggH5C2yikuln6bi5dN4MBZXaXKVvNRup46rIikpiICuACiEu+Et4jPkwC
         T4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679161647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAVMze14D3bLTi3r2lL73yYKOfT+PJedJY69Qu4icNU=;
        b=NOdXdAvFW3VauVQq26HEOqWv2F5+h4vM4TbN6u8iHPFwYSNgHKdLnmnaSsRf1r7rmH
         6MbdXBECuD1Lq0DnoiJN+mWSJDaGy1tgewI4zNmkeuXYbFLG7rYa93BdMENA4WlbOZn4
         3wZLYYFiJ9K23krb+/YMPA+2Wkw34501uu51I7aDZlTuXdyba2pPAU32nsyyAcFY/9cW
         BGQcGBmi1IALeYadDbNAqvT8oBZ8wnevAPoCAWmdd/fCNAJ4UfcVn79DUAet9K/xm8xV
         0jdg5jKOsrxLSG7PbtReWcAg+JVpJyRWeAPmNJfe/87TmfL73UloQlBxx4HeiEMvIQNo
         ifMA==
X-Gm-Message-State: AO0yUKXOYIuUtYfH/zYQ8A5ptCwUegVQx8RR9XBrEUjdCSXo8iYfLZ5B
        x0lBhh9eNtKLGT6zA5Ye63sE8w==
X-Google-Smtp-Source: AK7set9/4vjf9YgA05fYJN/QuMd1vMUXuK4u9w6vBtN0XTXbwx1KwqrqImF91HDJ2r5k2G942pd0ow==
X-Received: by 2002:adf:e74c:0:b0:2ce:a0c1:bcaa with SMTP id c12-20020adfe74c000000b002cea0c1bcaamr5742751wrn.9.1679161646775;
        Sat, 18 Mar 2023 10:47:26 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600010c900b002c7163660a9sm4778336wrx.105.2023.03.18.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 10:47:26 -0700 (PDT)
Message-ID: <6f895b66-9e9f-5af3-08ef-cdbed303f2ee@linaro.org>
Date:   Sat, 18 Mar 2023 17:47:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 orientation-switch for usb_1_qmpphy
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-19-bryan.odonoghue@linaro.org>
 <3f223bda-fc1e-4340-ece2-183dca7b2f77@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3f223bda-fc1e-4340-ece2-183dca7b2f77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/03/2023 13:11, Konrad Dybcio wrote:
>> +	orientation-switch;
> I think this property could be put in the SoC DTSI, the hardware
> does support roleswitching

Orientation switching, yes.

It is a PHY not a board property.

---
bod
