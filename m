Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544E5599861
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 11:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347964AbiHSJJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 05:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346985AbiHSJJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 05:09:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFA2F14DA
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 02:09:47 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e15so5384590lfs.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=G5NAqTux0bOKykcXT0wq7j9epj8v8D7Om8beKuCJzt8=;
        b=GEm+toPB7s/85Tf4ejtzhH+vMhvU+PeGUhf7rXYBXhLcgaPZRYan8pyh47nO0P3rfL
         TdjsMv2NONrjdYIJEJD3YSyKfnCunWW2/EAfXZubV5emXm48dBhDONK7MdkGr71TCPFr
         b7mwBc5GsC63xQd4Lg/XY5gtbRW73Hs2HtMTbguE8jaHv03/tYxGzOlhICrW/Q8b72qt
         j2h4ovR9MH46YtmAq4Rg7iefCFUj22H7rA9eqwhFHQ5Ba9moPjmZJrFEjcZcVlZgyNFA
         VnHIC6kSiLH3aYFavmH+OYhgYgxmpmoffHi2IIsxwYq5hWzZCUX2EtCgGDb8qI5RiFYO
         fwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=G5NAqTux0bOKykcXT0wq7j9epj8v8D7Om8beKuCJzt8=;
        b=7j4yc5h+F7thHKeAEgt15gHy9Lyf4H1rV9/jFKmnsqffuowu3gRhMGT7i3lrybhwJi
         hswMr+OtToJzRxXJHXCLDUoSRt4p10XfdGxcBnM6YndfnAXij1oR01XXUtQOaZbYQ7Hn
         FeMMY1WriUfDyAGdLe8ZdPbEKsRtZOaewsSmpeUJYRrmaD/eApO2SgD3VxxxkhwPdOqT
         FodrjdTGz0qlxobQ0WSebXrgr51mGo5KT/Kpi/750Kx+jQFvc5yAayCIhKAq5VAufdiZ
         KI4qnGJ1fzUYBXmw7+UQAw3APoaSV4BCArax/Vk8moMtCz9enkx5jAsyZbUYZQvfmRHn
         ZgFQ==
X-Gm-Message-State: ACgBeo3O0PRdTEzyAmJOMXkjnqUvvQbz9i0bzoPLJWbKBr/lwtci2U1u
        4MbdrCa6MoNb6SnvLmMLv+QArw==
X-Google-Smtp-Source: AA6agR6N3Py2jGhuCpuhSNB73nreMYs2MhssmyKwqw2ZIa+aUj65/gNBqA/6D2rGBHLR6HDoAltPRA==
X-Received: by 2002:a05:6512:280e:b0:48b:132:c420 with SMTP id cf14-20020a056512280e00b0048b0132c420mr2080357lfb.542.1660900185712;
        Fri, 19 Aug 2022 02:09:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id cf29-20020a056512281d00b0048a828b6b2dsm561027lfb.182.2022.08.19.02.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:09:45 -0700 (PDT)
Message-ID: <9bf85483-61b4-f57c-d46e-fd18b8cce399@linaro.org>
Date:   Fri, 19 Aug 2022 12:09:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: usb: mtu3: add compatible for mt8188
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220819081027.32382-1-chunfeng.yun@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819081027.32382-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/08/2022 11:10, Chunfeng Yun wrote:
> Add a new compatible for mt8188
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
