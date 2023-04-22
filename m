Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601156EB63E
	for <lists+linux-usb@lfdr.de>; Sat, 22 Apr 2023 02:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjDVALN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Apr 2023 20:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233685AbjDVALM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 20:11:12 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C00B212D
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 17:11:10 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54fe0146b01so26679007b3.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 17:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682122269; x=1684714269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r3HVdBHp8ZBwMLtZhZM5THuZ2ayBVN8mjzgRnQU8doU=;
        b=TjWZ3JK9IrZTvA1Bv6JMW20hD5ah5RMXp0tjjtzTlUyd+jMQ+x4f1teFgMqG+4lqaI
         m+7CzrP2VyA1O97vbAgY8i76DQ0mHZjwNk5w98X0C6Mgm3Q9cNOl1POlCNpQVjWAw4pP
         Hv8qDMxEK5hdPhwikYvjsU9I8ENe3RW9dyYETQwruOElgdzEEtUOry3T97pqvJlkYdWa
         Zcny1b0NrqcW3tqnWqIBpxv7JVQBsyWjrCQQlcfJbHDz+yNkf3H2BqR7TuIvN5+qdbCK
         8mKGbkwQEZgEQxm4iiHHv94lf2GfHuaNBrZkxaGGUvbfwcsZw8VlJNALiCt/xoeVx+Oc
         UYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682122269; x=1684714269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3HVdBHp8ZBwMLtZhZM5THuZ2ayBVN8mjzgRnQU8doU=;
        b=LjzES7iM+PCughkE9WpScUG8I/QJmHUwGfeazvFBKf/MWo4VzvKscuD/M9AU9wyEc8
         dPrg7yZdXRc1GCzowy9Y0vFYdZ+8Q4XKmGJlHFQPGMnPLP0qM2irUcgii6nt0mNFGKH6
         go0Uoo0D62+eYiUPVPA27vihi3k4T68ZOyEDI3JhTuIWXjA9yHU9f8WM7GI1pE7+2vYa
         gvLRDcQhjgA3tbNBuyTcioUSzP9NLapTH7BhAh4qWJuCV+5WLpaCBafrP8gM23Efzdi8
         av0HF7qBrsK76so5gy/vUa7Zf7ntWSc4REnP98WTy4LnpgnIsN+mJBOl+c3apWFuBfSp
         TKRw==
X-Gm-Message-State: AAQBX9fIeKCj7EWWONYgcyqPmWkHsqvhzzL/N7vWZg99i4IsoV2i9K3u
        cjPSqEiYCNyq/Z5G3fXtj+xpmO+76W5WnC7UD8iYfw==
X-Google-Smtp-Source: AKy350axjsvBsIM3jCVhZmPPFcVSlFJAhwx2i17gUtOdiELJB+ptq7C/I/6poiIDNXWz2u2AhTVw2PMBoYbPM4q2pZo=
X-Received: by 2002:a81:61c2:0:b0:552:b9ad:f2e4 with SMTP id
 v185-20020a8161c2000000b00552b9adf2e4mr3038639ywb.51.1682122269662; Fri, 21
 Apr 2023 17:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230421133922.8520-1-quic_shazhuss@quicinc.com> <20230421133922.8520-7-quic_shazhuss@quicinc.com>
In-Reply-To: <20230421133922.8520-7-quic_shazhuss@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 22 Apr 2023 03:10:58 +0300
Message-ID: <CAA8EJpov_2TS65NZimVmXe0meNV8rz_wXyNDz_0wK-qQJHW7tQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: sa8775p-ride: enable USB nodes
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 21 Apr 2023 at 16:41, Shazad Hussain <quic_shazhuss@quicinc.com> wrote:
>
> Enable usb0, usb1 and usb2 nodes and their respective phy's.
>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 92 +++++++++++++++++++++++
>  1 file changed, 92 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
