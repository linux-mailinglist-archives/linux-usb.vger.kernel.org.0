Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE5E6F436B
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 14:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbjEBMLK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 08:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbjEBMLB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 08:11:01 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F8F49E9
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 05:10:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2fa36231b1cso2282281f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683029424; x=1685621424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45dl8HRRntE2PbqYyAyWim4/Cl/d2w2wAiKRr5pDHQs=;
        b=Iv/XrGVxmUP/qLDE7zU5yZMzVUJxvjI6j8Vatr0AH2Vi0rIB9g8gA8rI5sDnFiHCQf
         fkns0nn4hrcLImuDJmbbB00sfLM2gVOAuI/kdQzmwGEYFKvJwbS9OL1dYdNzqpaAgPo2
         jf2XfiX6BHDYs5fYUdDuoN0E39vD40PZWst/JWlEoW+Rzdj8AEaDioAN8lLnZXVD659C
         on6sa6LcPkoWBouL5Yw2WWObr/6PAIkjqDDwgC7BdseJHvLebjmjXES0CdgugGan/8TN
         V5aG5wesj2hQ0jh4C6MqBk7Ea/5NqVvZodDehFcDhH0m4G5/T541SztLs364BgCawvgi
         QYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683029424; x=1685621424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45dl8HRRntE2PbqYyAyWim4/Cl/d2w2wAiKRr5pDHQs=;
        b=EsAxF7Wh5/EzEg9edcG+NMaxG6DPlYa+aFtWeOr3AZA88s79tOJcZIyXemfFdCcCE0
         NcHQaPfqj1qHgp4L7OWuMuJNK/beVZjrWvgIvBu+n4NxzSFjbZERCIkqE2kRxoNxhfdi
         gC7OhGnoQANPLJw8HSgLYZJZK+XkxKoT6UgaFhYBoqACYaTsTCjfbIbFXqOKFwLrp33u
         nlyR6l20JvQtTLQyIJmNjmhR4614BJMjdFIn5rb6Ewn0sTzLVFVfLTirLOAsnNOykI+U
         sZm773H3m4E8w5YEFQMVTiLsaTzzo9SU+x1EM+pF/0SBJB7cGFO2dLITFIFgFG5YnPaR
         lmmA==
X-Gm-Message-State: AC+VfDytGKKENp6p2MDvuCHKB5qTDrEIDrHFMi5olEKhl2HIos9dvNfE
        l/xHenMTJhxkciMgwZjmJ6Az2Q==
X-Google-Smtp-Source: ACHHUZ5spGP8NeUGfX2dk8fSczipLRaoTOM3cXf5d8pIF52usTBMLGpn7EbO/uoRIAnFoZPnucylcA==
X-Received: by 2002:a5d:6d50:0:b0:306:2638:fa6c with SMTP id k16-20020a5d6d50000000b003062638fa6cmr6795997wri.33.1683029424208;
        Tue, 02 May 2023 05:10:24 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id ay37-20020a05600c1e2500b003f18b52c73asm35084751wmb.24.2023.05.02.05.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 05:10:23 -0700 (PDT)
Message-ID: <95acfa85-d779-1459-5520-d520534c31fb@linaro.org>
Date:   Tue, 2 May 2023 13:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
 <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
 <41581143-2caa-bac1-479c-c8feaf2de1b9@linaro.org>
 <378d0ec8-5ce1-57d3-eccf-8e053d647f47@linaro.org>
 <44c26ca6-12b3-74ad-70de-1dc2d4f42dca@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <44c26ca6-12b3-74ad-70de-1dc2d4f42dca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02/05/2023 12:47, Konrad Dybcio wrote:
> 
> this part (minus remote-endpoint) would go to pm8150b.dtsi
> 
> remote-endpoint would be assigned (or left empty) on a per-device basis

Hmm.

Yes, actually I think I can locate the connector {} defintion in the 
pm8150b.dtsi.. you would need to have one tcpm {typec, pdphy} block per 
type-c port so.. yes

done

---
bod
