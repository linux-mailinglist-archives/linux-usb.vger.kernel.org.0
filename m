Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061FD7268FC
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 20:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbjFGShK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 14:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjFGShH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 14:37:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76A519B6
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 11:36:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso1857035a12.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163009; x=1688755009;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUrZIzSJIRlczWd6GDv9NQC7NlUjf5TxBBAYmp5SqcM=;
        b=qNtY3+bmVG8jU5WdiB+8DA6SyFimd3qArmdD82vsrPRn2/h2gRi/9aarnRIgH+j9mM
         ThwPsaJrj6qNYiwYb/N7Jl4wzA6BHxyuqEuhfsyl7C1UKepauBZoKVYiGz311OPceDsx
         4sDeJ0FDwq0Lj/F7WZEV63zt/a4+9wXLlYj5/hFsJBHuyDbOvFxqdmLOQ4CMfuT/qf3T
         dMzQQL+oJYJnmwuxR13OIMXpl2WojUuKKMbjGzeU+X4FeZt5IpaRlvvsiGvZPZDt1FXU
         8HD40xMTMv5a4HhBfVsxjPDz/0C3nGUDZ80HoxPq5wiTE3dUwv+ibj51RsArP2wKAHBw
         +caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163009; x=1688755009;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUrZIzSJIRlczWd6GDv9NQC7NlUjf5TxBBAYmp5SqcM=;
        b=cDoP9i7XuWpOSfl4iHzLP4flawbrPtPPxdM2ya2wSWbg5HVYC/g1LRG3Z9+UKDNhq3
         HOGQUPt8lkl70pbkb5nCkyj/I7aUiNNbRJ/W3CckrOTzP7p4PtaTBD2dckQ/BPgPljo6
         Rihc8rWNBXve9uCVXfP6Sd6MswRxJCc4TsOA9w0MMLkBiOWIPEOpHbbuKTBtIfDV+0Nb
         BEbsX7TrokWK/fa/h6z8ofaGdtiMaZPpQhkmgviZ7fSwxFMHCiMQQAExh6qYrs+qT6oh
         3yHsa6vxggT7+i5c/YcDOd5j17wXXB21AQgc3pSFSt1LBB3M7L1S3phATPGOM+61XYqH
         MZWQ==
X-Gm-Message-State: AC+VfDzW3pF3JVLb+ifoSMKdE/R1ULgCVlihMSSr65+8qwQcG2gp5Ng4
        rAgCPutcnNjSvqD6b4jK8ImCKg==
X-Google-Smtp-Source: ACHHUZ6Kslk/hZ+XFOlhi4ADtp8yKeRWk+pl++7bGMlZBsOk5y3KrpkIDuTfF8PrEbppQ+zPjcZmvg==
X-Received: by 2002:a17:907:c1e:b0:974:5ef9:f4d4 with SMTP id ga30-20020a1709070c1e00b009745ef9f4d4mr6992165ejc.5.1686163009416;
        Wed, 07 Jun 2023 11:36:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id fx12-20020a170906b74c00b0094ebc041e20sm7167411ejb.46.2023.06.07.11.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:36:48 -0700 (PDT)
Message-ID: <1904d271-8db1-e012-ab00-060e418f4c14@linaro.org>
Date:   Wed, 7 Jun 2023 20:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 6/9] phy: qcom: Add qcom,m31 USB phy driver
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <353c5affd1d638bdc7e4ed187616a938e8d763a4.1686126439.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <353c5affd1d638bdc7e4ed187616a938e8d763a4.1686126439.git.quic_varada@quicinc.com>
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

On 07/06/2023 12:56, Varadarajan Narayanan wrote:
> Include M31 phy driver if CONFIG_PHY_QCOM_M31_USB is enabled
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

That's not a separate commit.

Best regards,
Krzysztof

