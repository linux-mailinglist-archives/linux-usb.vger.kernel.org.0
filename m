Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0116E3F87
	for <lists+linux-usb@lfdr.de>; Mon, 17 Apr 2023 08:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjDQGQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Apr 2023 02:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDQGQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Apr 2023 02:16:33 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F6A30D3
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 23:16:31 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dx24so17169317ejb.11
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712190; x=1684304190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n81Qz44HINu6zkbOJGniDIX8pJTKOROh6OkTUSCmQLw=;
        b=SdiVtGFq9ksUJgATxqVUuVBiUXuiFc7KG/a6C3AOViBMqjIBUFht+CfPOJkxSTz5/I
         40pjus69CRagrd9KkeLMhMWntlUhn/fjhUiP6OSXA18vqm9zIX1iCgomVKd/vgZWZtyw
         gHbwmZwQ33uvyF+lB8C5bSnjCaReH5tkL8hkaPh73nqJNrXWVu5hav+sSpQ8DF2rRY6n
         1rEkWOq1phIhQBYky1acfTzjK7Z++zjA1uZJqeua2T+ATmA0qgndUJvmYj9emYJHtPUC
         qOcd1bzwp4aqoc5979K6QqK+IZBNWn/ahrUpPKa2C1ba9F9YEXxxXsk4kPhQnxzBPe2u
         E6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712190; x=1684304190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n81Qz44HINu6zkbOJGniDIX8pJTKOROh6OkTUSCmQLw=;
        b=XtNg8cwzjscMGKr6t+s2fGYUwYx6YZC0fusm/3mHASaCum7sIMLXI1AWqlR1yftQJo
         XH9NYhzIul2tvqpUB5zwqW1OW0y4jOucykJTMsFKOjOSBYL1qhp1D5ulRwlNsG8MwdG2
         FaiD8tiOFl1nt9MjBrN9fyr1kPHaKmU8bsNbKokaPBBmCildJjk+aHYBK4oR575+K84d
         f25uTYjGxPMAjdzkfUbxQfQZTZ8jY85nsYNhb8XNVHVs2g87dzYRoa918Q0nXL1iMymZ
         czrlArTpSgYvsrhBEas2NBvP0BJxAGMrtTUitMSZQCZp5xyjTWvQGyMtKoLwUaduD6kd
         08KQ==
X-Gm-Message-State: AAQBX9fFxEz+ceRM4Qlbkm1w0Esgr8vria7IYNwEH0pL1eek1bTPp7C+
        M6VHebM87vgyzy6vo0wHQd2rMA==
X-Google-Smtp-Source: AKy350aDciXQyPkyplcrfR6WzMIzPP+ITc3iNHmWjBw331UbBWUSDcre5N0y7jnRZYNuAuTP8JrKvA==
X-Received: by 2002:a17:907:3f24:b0:94f:19b5:bafd with SMTP id hq36-20020a1709073f2400b0094f19b5bafdmr7379577ejc.42.1681712189764;
        Sun, 16 Apr 2023 23:16:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id ds12-20020a170907724c00b0094f556a941dsm1781153ejc.49.2023.04.16.23.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:16:29 -0700 (PDT)
Message-ID: <5ae4013e-399c-64c8-8bd8-d769f0ea7fca@linaro.org>
Date:   Mon, 17 Apr 2023 08:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add ports as an optional
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
 <6ec55a3d-8b9a-2a44-6a0c-0dfc0100e88a@linaro.org>
 <b2388450-28a9-3dd9-8557-3649518c6619@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b2388450-28a9-3dd9-8557-3649518c6619@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/04/2023 02:09, Bryan O'Donoghue wrote:
> On 16/04/2023 18:47, Krzysztof Kozlowski wrote:
>> I assume both ports are required? Could it work without input or output?
> 
> It can work without an output because we might not have DP switched on 
> -> bog-standard USB orientation-switching in host-only, device-only or 
> dual-role modes.
> 

Then I guess:
required:
 - port@0
(or whichever was input)

Best regards,
Krzysztof

