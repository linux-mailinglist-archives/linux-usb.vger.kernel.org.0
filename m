Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA272EBC4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 21:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbjFMTRF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 15:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjFMTQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 15:16:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372F810F7
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 12:16:58 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9745d99cfccso1020293166b.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686683816; x=1689275816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QiIVN2qmRu0RlVv/nR9+1R3uiMi6fTBhf5g6TXOa9O8=;
        b=U6fGe/M2omiDprOWpv12kKu3/6ZFSlsbPlbVX9KwaJlLOpltC3YsdUr/KdBlSv2f16
         OAmzgOlbMRnGR6mXsoDsuaZRaX53NZLrxulbYg315KX9yMOyf0BEFN3u5y2gHt74MAX8
         l/W7nPzdEizeD3f1qXT+eWge0s8cQnJejR+7pEmYSdtYq7Ka3+/zHBD6GOEMnhBGGh6N
         f7U3+OOtutEAAu8LAo1nmwtyC1T7KDApC72cIYU1NKpOH3eBUTSBys4l4UIXyz6p8m3C
         YUvzA2KQoohs/3R6Z/RayXwdulTjHt/uTigttzrT6h3QuHAwgap+SKkcu4qsb6s9UXEw
         Wktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683816; x=1689275816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiIVN2qmRu0RlVv/nR9+1R3uiMi6fTBhf5g6TXOa9O8=;
        b=OYjV49zuDvSmsiOBBRSefS8T6DsYBbbezux47kPAZJEK1acvN/r80PmeU+pvC7iIU0
         2P21KLoCsOnuO6SnLUaxHYNAjmjy3yokE92yTA4VaXPcjvKv3V3P9fY4HbqvN8AAs8uY
         vVHtFTfoLE8pf6DevZfkjagBS/s5WRBYyOVTUhgbNbiUrK00ULDRwHIxQEIRki13OCLq
         eT52hgttOKbTecQHuI+bbMc5IEGqEkN5Byh+3ZkG1D1778NUgpbtkAa59Vd7iOkFKVcy
         LXut9pfRGifxdTrvmYNg4bx0WRYP2i1O5qkDuE0+09peW0tVSgCzLGIjnHqLdgzDx/7Z
         TG1A==
X-Gm-Message-State: AC+VfDweT46ZxQwFnF2B7WWlU+TK01Nbv2Vb4pP0QctA3dzcjf/L9a7Z
        zVgziskMbME7XUCc2znhxQ2Dzw==
X-Google-Smtp-Source: ACHHUZ5Xqkw6q8HvW4/ZuOo8wI/2E0FwC9XIJ3UNObKhGpgNEJA3xUKvTO2npkHCPJPOUQSSzoNhxA==
X-Received: by 2002:a17:907:26c5:b0:974:4f34:b043 with SMTP id bp5-20020a17090726c500b009744f34b043mr14352963ejc.1.1686683816693;
        Tue, 13 Jun 2023 12:16:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ce14-20020a170906b24e00b00977cc3d37a2sm6978685ejb.133.2023.06.13.12.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:16:56 -0700 (PDT)
Message-ID: <f4c229d1-5dea-68f3-ca1a-28638f49d4a5@linaro.org>
Date:   Tue, 13 Jun 2023 21:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT
 schema format
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613083445.1129137-1-xu.yang_2@nxp.com>
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

On 13/06/2023 10:34, Xu Yang wrote:
> Convert the binding to DT schema format. Besides, this also add clocks,
> '#phy-cells', phy-3p0-supply and power-domains properties which are not
> contained in txt file due to txt file lack updates.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

