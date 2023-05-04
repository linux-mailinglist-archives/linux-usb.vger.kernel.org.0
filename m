Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71AB96F334D
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 18:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbjEAQBH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 12:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbjEAQBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 12:01:04 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F269133
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 09:01:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3062d764455so717920f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682956861; x=1685548861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8XFH13zanbc2i0C+jTsrlpaQVDgaN9DzDRKTIvVf2Y=;
        b=K9UUnLiQXZ9TOhPoJ2eLUXLFjcKWkb2/Ft/e5ZRiTmh6rwZ9OF0Gxsm+p7W8jcVewI
         HTMNeVSS554DA5Wlb2V4AKLnGNOnQlto0KA9C109/yeGRNkoP30jHz0h1RrwkZSMEIWz
         dju14qDOsvvppcg3Aeyp9oWMAsVNo20e4XxNpCM+h9CJtAsUkn58ZUf0ipj+6eJNMGsA
         6+oSpgPGBaBu2rAC81GcBAqZWfzDDL88d1/F77VKq0H5k0EbF0hWoAt+0t8gtIUdF3OF
         3nLB/OfxdyGlyNT+kv3AvxGffaSgQWd9Ow8e1JSbmQcxMbGzkFKlZq3dDEdvcvHtV1Qu
         BSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682956861; x=1685548861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8XFH13zanbc2i0C+jTsrlpaQVDgaN9DzDRKTIvVf2Y=;
        b=SI18dPhyEMCMivLY+KUAbeQtQmoTyNJrqW2m1bSR+ujca7sYjVv+kdz6liOjDm1+yC
         azwclpIBabpAR/F8OWyjYMbHLppWB6z9G0yW4pa3sotfl34AXDAbaB03xEqrM6FcJqgq
         umy2hjMcwbCPyhWaTcfBPC7IWCYKBcBl36rtV9jSr1mHSTMFpT/YS41e3toP1lnd0053
         zs/TjwHOTf+IDCGiQBpcx1iENo4hK2BWrjv2ceCBMCbzd5cDGPPiH7Fo8Vyyy8CgjlWO
         uQrQpQJtKlxI7/Uw9rqdHVEDNeWQ/ea18mPVaHEfMb7TxPS+wxhUXi1PpAERG74JuK5x
         iO8w==
X-Gm-Message-State: AC+VfDwM33W6AprcUoD0AP4X3fmF8T3u6pDZZUOpUdVbrmAk71/PfcfU
        g2fDL0q0CRTIZWWLTJ5NuHL7uA==
X-Google-Smtp-Source: ACHHUZ64n5TqDLh64E0B7bmlfS56FhfwmZTNP1/WJaNvdHvKL9I43O+hXpP+SWtQr+7qy1TCfMafdg==
X-Received: by 2002:adf:ef06:0:b0:304:8149:239b with SMTP id e6-20020adfef06000000b003048149239bmr9031893wro.50.1682956861574;
        Mon, 01 May 2023 09:01:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d63cb000000b003062cdc6ac5sm3318628wrw.89.2023.05.01.09.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 09:01:01 -0700 (PDT)
Message-ID: <c390365c-7293-5528-3432-48a23aeddfe1@linaro.org>
Date:   Mon, 1 May 2023 17:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 13/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 orientation-switch for usb_1_qmpphy
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-14-bryan.odonoghue@linaro.org>
 <ZE_b_sVAEd8Roz87@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZE_b_sVAEd8Roz87@Gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/05/2023 16:34, Jianhua Lu wrote:
>>   &usb_2 {
>> @@ -1375,6 +1383,12 @@ pm8150b_role_switch_out: endpoint {
>>   					remote-endpoint = <&dwc3_role_switch_in>;
>>   				};
>>   			};
> Should add port@0 for usb_1_hsphy because it is required

Not by the hardware its not. The combophy is exclusively responsible for 
processing the orientation switch.

The only required port in usb-c-connector is port@0 i.e. you have to 
have one thing the usb-c-connector can connect to for data-role switching.

Now.. I'd take the input that <&qmpphy_typec_mux_in> is not documented 
but relies on

commit d56de8c9a17d8f5202d0f37dd06ce186cc512586
Author: Li Jun <jun.li@nxp.com>
Date:   Tue Mar 28 16:23:04 2023 +0800

     usb: typec: tcpm: try to get role switch from tcpc fwnode

because that is the case.

I will add something to documentation to capture the case where we use a 
usb-c-connector to trigger an type-c mux orientation switch.

---
bod
