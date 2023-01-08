Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE47466162A
	for <lists+linux-usb@lfdr.de>; Sun,  8 Jan 2023 16:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbjAHPWB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 10:22:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234522AbjAHPV7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 10:21:59 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AD8DF8D
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 07:21:58 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so4706513wms.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Jan 2023 07:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmqnWhGVnGXf4z5iUyR0gaF/db/IFFmf8a/NQk8Ec0w=;
        b=DRlWD25KJYqLPuqeKNdVsd7XGtJF3VfMjWbYz8tdqLmYHX/0NzlDsTOBwPMKBZd/AH
         V0EHbzIPEYNmc8qPCV/X0DWW3guW3HlZ6IGcqMlTeclifRVYnlkci5HuC1XjwzvCV4Wg
         UjUXduv6FHtchHldTgKUVkLm5P8csXw3kfR58z1cMQ8QBp4DmeTLKQ9y7ZTpyvYn/Yhy
         +i+/fyy6t9JDKn77sRE4uobwXVQvkfwQr0k2lsiar/+Zpw36zJGtOzJgen/I17u+aCTP
         S0ridvr9BmjwM4R8IRM+dnWiOaK8pKpQ1jNyRQCJSidnXh55XNZrlZJf+Ge6UrH0+BeO
         jmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmqnWhGVnGXf4z5iUyR0gaF/db/IFFmf8a/NQk8Ec0w=;
        b=7YJPDDaKtOy1QsWOM6IupKfc547G+AeE0AYZHRFGc7TvMm08Zr5FlFyfWyQkhVn+nZ
         6xO5Jv6CDFBN2UxsO+NYYC0wSPa9jzFb2CSULXsIfW/yDNu3N9B4WJeY1jcBHJXak4Av
         SEFre0KYfxVfWUjTb9XyBxGvSSuvr/VTVlQzEdJ4hk1pEvdxBVhzkE7wcRBqgDCIud4J
         lH24lLzfRCevCQby3PJsHm6uG+OSk3xisInk0p7728z2bAfQTyi4ES6QciNshKR2FQmL
         K0jTLei7GJNiIKR+YZWeOY/Ira+2Zm2AQCsrdAzV3GGHgaimxT9nWuW30tgcYIGkIgq7
         RYmg==
X-Gm-Message-State: AFqh2krTHAPuJzFddcyJnpuUGIZ3Vvswr36lx4nxNeRJI9pQMOp0RcVy
        FU4eBsDI/61wRIchatix/1hkqg==
X-Google-Smtp-Source: AMrXdXtuZRg/gBm0bgy2aUR8V6wgJ5IygC3CHsw7sL4lbwAqP0DPH6RsEVWXcOa19rjzOcEZzMPKkQ==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id iw2-20020a05600c54c200b003d33c74dbd0mr43779703wmb.13.1673191317055;
        Sun, 08 Jan 2023 07:21:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003d9b87296a9sm14129935wmo.25.2023.01.08.07.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:21:56 -0800 (PST)
Message-ID: <d333c404-01df-22f1-8532-6081cb0a6d55@linaro.org>
Date:   Sun, 8 Jan 2023 16:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V5 2/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-3-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106152858.49574-3-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/01/2023 16:28, Jon Hunter wrote:
> Add the compatible string for the Tegra234 XUSB PHY.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V3 -> V5: Fixed compatible string


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

