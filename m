Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7F65784F8
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 16:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbiGROMS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 10:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbiGROMQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 10:12:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7657327FF9
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 07:12:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z25so19572337lfr.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=3A1pwYA+9FmIi8p2b6mGGlRlD8boBkr9tedQRRE3OGw=;
        b=LtRuShdjnX5B6eYwnoEW+6QtEzDFPpA2ejTnRmXXrdZykusYnUqHAX4SotY4JxubfL
         MbN7ksokGRoZgHHzjdJYTjwnzqPIc9gngsDhjjs2xoQ8qv9IWB9xDHmaHrku3IxHsxCG
         T+fKxsnt4SpUciNjMQ3KSODdGp4QxDUSbOxz6ZIqx4xMVUXaW2Z7XeNSla1WML63xoYG
         n2aA6vPFHlYAhST1/N5F/GN7uEW+VfFwsW3ueK7hUfrmUe+xA221FADW/fga/tdZ/4PW
         W8SVtoN14bZXp375LdzaOlutOGFvdHtzc0q0HARmPHpIKd9+8gvOJVrawqDU4fmnYQQa
         0X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3A1pwYA+9FmIi8p2b6mGGlRlD8boBkr9tedQRRE3OGw=;
        b=WeSV4CcdrBCNfownpqc1ZQpBGAOMiuQdRhoXQy6EHOUXgg6IBVRMBtLaWUhtLHfPDc
         EhlhhKfwDEWJN04bS+wFVLjcdgeBY4EdZQEpRIUsVkYufk+1Dllxav2QkNLz7Ci2hLRq
         1DNqstWdEKTMym1RBFvm810c+bLAZw3nrxISxMq+fRIuM9wUcW2FWmYpqXmgOU2R0GVc
         i/npER8wn1RalMyRyYxeN2KcSFaiO/U5EZ6m6nboF8cQb7DIo+QXVUS9g2n/O1hqsowk
         1c5tiBC/2KUNFcY8v9PuSH6pTfYm4xueEU+P2uLnP+aQurv3HxDBCg+5iC1Izkb+EBI6
         157w==
X-Gm-Message-State: AJIora+DjoWkfBN3GDB9yDZh59GO/bBKdy36+RDOAhGpIZ1a092cZO4a
        vHdUtigioKU0K4tEXzUzFvqDIQ==
X-Google-Smtp-Source: AGRyM1uPqgWas+MQLu7jqyCHTRDKBBuAtsxPfwX2Ln/MOsU/F89ubYmh0biVDDxjB+NwN2IIol0VTA==
X-Received: by 2002:ac2:5dc6:0:b0:488:e498:1d71 with SMTP id x6-20020ac25dc6000000b00488e4981d71mr14580614lfq.140.1658153531868;
        Mon, 18 Jul 2022 07:12:11 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id v14-20020a056512348e00b0047f6b8c2127sm2611415lfr.186.2022.07.18.07.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:12:11 -0700 (PDT)
Message-ID: <13e66ec9-f9be-c384-a581-b0b05ca549ed@linaro.org>
Date:   Mon, 18 Jul 2022 16:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/2] dt-bindings: phy: Add bindings doc for Sunplus
 USB2
Content-Language: en-US
To:     Vincent Shih <vincent.sunplus@gmail.com>, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        wells.lu@sunplus.com
References: <1658141480-9291-1-git-send-email-vincent.sunplus@gmail.com>
 <1658141480-9291-3-git-send-email-vincent.sunplus@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1658141480-9291-3-git-send-email-vincent.sunplus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/07/2022 12:51, Vincent Shih wrote:
> Add bindings doc for Sunplus USB2 PHY driver
> 
> Signed-off-by: Vincent Shih <vincent.sunplus@gmail.com>
> ---
> Changes in v4:
>  - No change

You should keep Rob's review tag:
Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
