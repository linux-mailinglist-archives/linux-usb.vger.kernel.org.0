Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0CC79E099
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 09:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238545AbjIMHP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 03:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbjIMHP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 03:15:57 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0091986
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:15:53 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so1371624a12.0
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589351; x=1695194151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBCDvXDryw/KYfK9g4kN2ilPFiBF/RnPpswQ/I6D7Bg=;
        b=POaXxQO8+vLLolHqXpAHPdXfFRIYo2c5qxCDbOrzrB8ZSL8RbheU4dqTiYuWcYAbjI
         wbnu7e1SODIMQZ3XajwcQyDmyE03gEyHHFt0gsXBOS/9+gk9Y49PdIt8+2uI4esR8EII
         BP3xbEMC3GiPEKFQHsl2h2tJ4zr4FrB7J3K6EihxNgO57LOyXNG1iGYYJbEMiAAWcBZu
         9F4afbX7g2Kob3k9WANd4HcL/Og8TMhcGZTjhAw5CSQ9g6HkuRbA78A+zwdFMNLG3jWy
         uDx4f30gt/tjR9i8Bhvl5ma6cyM/pLNJaiUNu5okVM/DXFJEsqDBeJ+9qun2+8SFZyk2
         /xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589351; x=1695194151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBCDvXDryw/KYfK9g4kN2ilPFiBF/RnPpswQ/I6D7Bg=;
        b=MuqHqdfZXuJeGW4xW20ZypYBmfM5kaHzwhIdqWT/2hqdXtmyEsqq3pOJPYkhJYbd2q
         5+Zx9UnpWvpKxp8PYp1hB/1mPzl+5vVt8XKgLNbfGKcIAfMiVS7oPlB9bw5whyfJ8Dro
         jTCFLsn8QkSY+K1TFflCUtyDrH7KnAv5B5QFCVSNlUCruRtJPoumdzs4TT3OiDa/wl5V
         mnE6thK6NGokRDY+LbgNAowg6keoU/HVnSfyzHxWImdR7Vmjj+5muSV7JzB+cddyxL/z
         z1mqug79FKPodsRC1aCyhHS+LzvNvSDyMO/4YK39bU3DV4YRS0PHngCMKnQQHTeSQepb
         z7xw==
X-Gm-Message-State: AOJu0Yx1VskkY6hofoWnQWYgmLe4Sleal3CGdfa09KfBFZ+AVO9sfeoH
        hWvZOm7NoeyxXrljSAbIY9Nr2w==
X-Google-Smtp-Source: AGHT+IFCV4YlTvAtDyAlzkHEVsoI9Be6Y3BoL0WQT09ZQ0JwTHlrVtgJXzAz7QRzMOmKIWA+yiInow==
X-Received: by 2002:a05:6402:d06:b0:51d:b184:efd with SMTP id eb6-20020a0564020d0600b0051db1840efdmr6286295edb.20.1694589351445;
        Wed, 13 Sep 2023 00:15:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id y22-20020a056402135600b0051e0be09297sm6921977edw.53.2023.09.13.00.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:15:50 -0700 (PDT)
Message-ID: <a2586dbb-30e6-d2d6-3580-c074701b1374@linaro.org>
Date:   Wed, 13 Sep 2023 09:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 07/14] arm64: dts: qcom: msm8939: Drop RPM bus clocks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-7-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-7-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> These clocks are now handled from within the icc framework and are
> no longer registered from within the CCF. Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

