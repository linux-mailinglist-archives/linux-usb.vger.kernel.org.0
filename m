Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9BE5FC5A1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 14:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJLMye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 08:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiJLMyd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 08:54:33 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47764C90E7
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 05:54:31 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id mx8so10804623qvb.8
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDmIyNGRZCjISh+av2/snzsmNkw+/RdEmnVjrV7qdwA=;
        b=MPt8Sk/IUIwny690NdwVOgLL8ZVfyEMs5S7kASEpJ0In9Gdnbbx0jOOJYpZNLSHAJo
         UfUkmaj53Nf+Im4E2ME/WdlgtJj3hBQQiX1OWtKYjjMfHkEESXqV/fgBr2Pl/3UFch3E
         FWPUHJKNAHTaKUM/rSQUfbgkZyVa+Pf2oed3toInT74UiVbtnEtAoIpcG0UZc6DuRyG0
         8EQdrRvfzf5oF6TLBX5zj4klmfrQJz/fEfbDmGQkVtynKSukdou7aaImPwkV96s/XUOe
         WG1IPG/SElDMNwaLPKGtmKdCca1giXbgufzI6gGj7vKWPIyLCCZWmta3T67n56h31ChI
         eb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDmIyNGRZCjISh+av2/snzsmNkw+/RdEmnVjrV7qdwA=;
        b=6X8LsVMdqgmSdZRiNhDhf1jLBw/QDcflK4VFBq3cTEJ120peLDqaGtdKK9muXLRwPL
         4cb1PAae/JQX8PRgRmkRs5XcfVxNabZG0qKowIB/DfxQOI0ro+zL1OzMw9LQo6ILnrAr
         TydIWH3K0LDWvDNgCt9iTpBb3KS3DVKLNDiN1Dkfm9ksP+UPmCSS9WXSTVNL3qjjof23
         eFdNEx373f75I6X1Ji+rVqp8qh903B9UfW4R4UlRFEoaXnXyikgD8VwsAKMgD3FCwMUe
         Rrfrikdi2z6k8Z4GycBoRka3ctYMoc3xATlATsIUDVv0MRVe0VWIXB3O153cZf+hBEiF
         FJ2w==
X-Gm-Message-State: ACrzQf0Jw7A4h/H+vuTPgPQ+4G3sUiigQPaopm9qq7hLhoFZVd5LJhiu
        cc6tcnMYlvWVJPv1F0QJIswa8jUZmz3+Gg==
X-Google-Smtp-Source: AMsMyM6gdRPBXPqKgDCvHQLk4l/duVu5uvWiHfioon8NxNJCdExWX+lxL8+xLCfwXlLgSfX6NNfQHQ==
X-Received: by 2002:a0c:b256:0:b0:4b1:9f77:91da with SMTP id k22-20020a0cb256000000b004b19f7791damr23055272qve.84.1665579270431;
        Wed, 12 Oct 2022 05:54:30 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id e18-20020ac84912000000b0039442ee69c5sm6103773qtq.91.2022.10.12.05.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 05:54:29 -0700 (PDT)
Message-ID: <35369a53-112d-8773-f612-a7d409f81b8c@linaro.org>
Date:   Wed, 12 Oct 2022 08:52:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v9 08/12] dt-bindings: phy: mxs-usb-phy: Add i.MX8DXL
 compatible string
To:     Peng Fan <peng.fan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <20220607111625.1845393-1-abel.vesa@nxp.com>
 <20220607111625.1845393-9-abel.vesa@nxp.com> <YqDM0umwk6QizT/b@matsya>
 <DU0PR04MB9417A516C062EA7E40C9349888229@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417A516C062EA7E40C9349888229@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/2022 07:45, Peng Fan wrote:
> Hi Vinod, Rob, Krzysztof
> 
>> Subject: Re: [PATCH v9 08/12] dt-bindings: phy: mxs-usb-phy: Add i.MX8DXL
>> compatible string
>>
>> On 07-06-22, 14:16, Abel Vesa wrote:
>>> Add compatible for i.MX8DXL USB PHY.
>>
>> Applied, thanks
> 
> I would like to know the rule that whether such new compatible string or new
> property added to txt binding doc still is still ok to be accepted?
> 
> Or only fixes are accepted for txt binding?

Adding only compatibles is .

Best regards,
Krzysztof

