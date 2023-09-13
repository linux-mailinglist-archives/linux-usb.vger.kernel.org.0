Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D8E79E071
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 09:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238475AbjIMHHw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 03:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbjIMHHv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 03:07:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8C41984
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:07:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so858041666b.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694588866; x=1695193666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQ2nEJFL1xkjEyk0YmCbI44Cb7r640D/NpFhcEOFdXM=;
        b=rfJWOudOsHoTrFcRlxv2qkeUB4Bg3qM8JS2/V8KUjYls6/fD4I80f/4HgAHdLvXXKH
         /nOGnSNT14SD9EZfjC/cGsSP0D6cmhAC11nHqqXbR0XL4FjjpOAqI4ft5TU22qm0/jSs
         MvQYlf4+NAWNk9vlu73FQKJe5QO69t0i8uenBlOVD1B0F2Zw9j8vsFPG6s7vx9RLPNd5
         krrw0S4XTOuQRFlLn1txQbWB4Fsy4W2qCZXKnaurKUz525DUxwPO0SG3KJ9o5S6E3hTp
         vJulbzuP6ul1MW5WchMidEwooYpuoMYkrfFJ+0juR0mYSOl0P0jpbuTl/x3VtWJETXFw
         nboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694588866; x=1695193666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ2nEJFL1xkjEyk0YmCbI44Cb7r640D/NpFhcEOFdXM=;
        b=M4ABVx2pvafTco/hN9yPKgWPgYpT8xO3lWFMNIgEnFWo9xc0LX4en//OJYvxTODFeX
         mF847dAlo0U3Zj/Ig3yVaeQcPL/k0n4eSufEw0vYpP61BbS1DmaFtiUlqg7FP6al++/G
         u9xE581z9XozvJzENE7BhGoRQMT80hKdCxmnVnjHP4sZqasZL4j90Wzc1kwNnlTOle/X
         DIWZcI26eJ4LcqwSrMiW+8yADiWMdlLAN8/1hJRDS6GnmiurvpwqTXIQm1iEcrEezJK5
         +nX5Szm2GxghnRCOJ1dYfgI3F0k1njwu6V9TcZwMfuJDpXysZlkqypjjzIhr5gqS3DJO
         +jsg==
X-Gm-Message-State: AOJu0Yz1cCC3XDophXCNNUJhhLRlbF5zGGDuH3vF1obptxs9zu0E3iI8
        GmKDtj1amWsXXdkoBrIxmAY+Tw==
X-Google-Smtp-Source: AGHT+IEDdTdAYJBvC/NTElwaroM1jCmLl9Ptm9/vSLtcb32A5skuiBvr0hCVl70ozremDvSEn4TN4w==
X-Received: by 2002:a17:906:32c9:b0:9a1:bd82:de1c with SMTP id k9-20020a17090632c900b009a1bd82de1cmr1165437ejk.41.1694588865733;
        Wed, 13 Sep 2023 00:07:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906490900b00992f2befcbcsm7892650ejq.180.2023.09.13.00.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:07:45 -0700 (PDT)
Message-ID: <bd11d1b1-efe5-4f96-43e7-163fca5d3278@linaro.org>
Date:   Wed, 13 Sep 2023 09:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 01/14] arm64: dts: qcom: msm8916: Drop RPM bus clocks
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
 <20230721-topic-rpm_clk_cleanup-v2-1-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-1-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> These clocks are now handled from within the icc framework and are

That's a driver behavior, not hardware.

> no longer registered from within the CCF. Remove them.
> 

Changes in Linux clock drivers should not cause some clocks to disappear
from DTS...


Best regards,
Krzysztof

