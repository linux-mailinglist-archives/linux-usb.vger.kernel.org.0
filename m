Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B244366DC12
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 12:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbjAQLPS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 06:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236840AbjAQLO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 06:14:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0734F34543
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:24 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h16so30188545wrz.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFlBtUA9NIzJ+Xj5+nFksMtQglLnDQLd6VLPQ/Pooa0=;
        b=snpHESDxX1Vxaw5PQT1Y/Jbqk9pnB6CBgGsF04oMFvYrDY/b9ZcOz4zonAnfVeJZuT
         4RJnfQ/RLIhEkhsqkIWy25q/oHBjq1cWnNG+/VCS833NNymCMnIrZepUHhoI+4fH3Slg
         D61XfzM30fGnEYEZNp2HY/8BaXGaAFv9MUKGAZG4prnVt0jxrsLCHjQerPZmNg6WQmsP
         AmhfGLPHH6+DBEtxk8t1FYX53RKgPbIcbjpYFawc7EMUhw6f3NV76HwMSY3F8R8UYDJ3
         F/1T/IE/bWvdLoWQpx1bHRu4VPPO1n6sv+/dYSWX7i6lMn1i4ByXym89VREh5vfJZmVq
         Eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFlBtUA9NIzJ+Xj5+nFksMtQglLnDQLd6VLPQ/Pooa0=;
        b=jxk0nhT9gpQISn/2yteBLceo/pkGUX2UHnxDD5pV6MnxffaRmPxYK3dRwUsSqmyksD
         rkmy8MFvPcXp/kE/5QhBZqN12059adG9QZyD7c4NtaRDZMk6hD5ZKRWgYRL57Ce/5jL9
         r2aDi0f1rtPSwcKgvDyFMzAOkTPtiLye8286lhvWfkTfvSu+0CUM+wkJuuT4f2tu5kfj
         zReGXvbFIodgn/sHckT1+R6H0m+kphvDNqB+VkYozOdmEh6sCivlN2RwEBh9e9kjcjeQ
         NfLWVQSmZlpraD/wcwhZKhCkrisrCs/MFCEsqFMUXA8GI+4/pZZ5JJoGwOgum3Rmc9Qm
         zPIQ==
X-Gm-Message-State: AFqh2kr9aIjyRvsdZDV2xv7vDasA2axEEMfIsy7g7CRHGMc50kwI/hcz
        jHH7GS89Zhz0NZOTxLefRVZhBw==
X-Google-Smtp-Source: AMrXdXsmG4bl6joXx+CVOeEvwnUHC/f2bfOz0R/qWQZo3huwHefkZB5ncWzhOURdhZimrBa9haFXNg==
X-Received: by 2002:adf:d4cc:0:b0:2bb:ebc4:2f62 with SMTP id w12-20020adfd4cc000000b002bbebc42f62mr2614967wrk.52.1673954062742;
        Tue, 17 Jan 2023 03:14:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b002366553eca7sm5980643wro.83.2023.01.17.03.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:14:22 -0800 (PST)
Message-ID: <73ac4da5-0fec-40de-cc4a-55fc403d62e5@linaro.org>
Date:   Tue, 17 Jan 2023 12:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH V4 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234
 XUDC support
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
 <20230116151917.94193-4-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116151917.94193-4-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/01/2023 16:19, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Extend the Tegra XUSB controller device (XUDC) tree binding with
> Tegra234 support.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

