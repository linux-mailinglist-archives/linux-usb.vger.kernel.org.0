Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61646F1EE4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 21:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346501AbjD1Tvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 15:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345984AbjD1Tva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 15:51:30 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CCF1BCD
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 12:51:28 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54fe2e39156so3637677b3.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682711488; x=1685303488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2iUrTPEcxwWc1vNuZJ0gmdY5s32MtFeY+VlTLWDJ5mA=;
        b=IYwVfznzCb27JVtO7XYFTgG9lBTn6zfLk7WiEJQUf6G1Oe4VXbqKnK6E2OGpFsZH/M
         LrWUXblHF+S+sg4XZXYlx+M3sNNuObYln5mr0O1HyiBnzx/la/UmVbFQpNYCrw12NgdG
         d4G7ybCs2F8mI7oCAyLIt3XaMlU0Xvo4ZgXZ4S7uxIHBHKRcHxHSvOw2CVGsv++KQROw
         7QMd9nSy9kLQwY/v7SMVM1xmLKrF/WCG+I8097teM6D4yF+UfQMLrz7r/ik9PtjS8o5h
         9lAqRgSIweGOXM652o3j3CDUu0xB/Ez75eA9E4jOlDqd59WJibjjUw/T6jxrU3BIQEkZ
         EETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682711488; x=1685303488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iUrTPEcxwWc1vNuZJ0gmdY5s32MtFeY+VlTLWDJ5mA=;
        b=OSGV+NAX3/nUPi1ZD6+/esr+YV4mnLThO9VcfHnel4FsW6emSdWr7dKgsyFHyYQP0Z
         pWNFJ5ObcdU0H1TV5INyl6QoiaeHtTx4xY0W0EwDgZ0JFS1URFwU8wRR8oi3tBXN8VN+
         jyvMaC1aM6BKFbzfW9NV3N7O+Dg+Zl4KbTW8EGHaaYPgcmABlUf3PUH8Dr3H29b9Mqoy
         Dr2N7sdLc3Cdd2L2fjk07yyTGdCTA/kAoSFNR+uo+6004k8Frph+io9FrG4/Hm0DBXVy
         6wjG6xGcuPdeMeu3br75dzPzfhyM4yVZ5tUgsmLoIgwFihxxTxJWUY578VYNttbNWn4g
         U3/Q==
X-Gm-Message-State: AC+VfDyB5hp+3WeCsaXUh8nHbXgwW7bWID2+hG5ne4traoavyIZKeaJh
        po3I0m64Yv6fhtB8hsiJoh7jmVY5qpGrtWpSDd28kw==
X-Google-Smtp-Source: ACHHUZ6b2Zhn/Hf+c8mpZ1dPunRRP2tAfSGwIMtecKEcAfaGGa72JA+vw89D1VNEwvTUPKxVX1/bDBkuQCL1hQSvp9Y=
X-Received: by 2002:a81:6bc2:0:b0:552:dfbf:b19a with SMTP id
 g185-20020a816bc2000000b00552dfbfb19amr6068497ywc.4.1682711486494; Fri, 28
 Apr 2023 12:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428130824.23803-1-quic_shazhuss@quicinc.com> <20230428130824.23803-5-quic_shazhuss@quicinc.com>
In-Reply-To: <20230428130824.23803-5-quic_shazhuss@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Apr 2023 22:51:15 +0300
Message-ID: <CAA8EJpqKBoJoxgjRKT0zPtqtg7f52aw6pyz6WTnYghVCJ6UH5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] phy: qcom-qmp: Add SA8775P USB3 UNI phy
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, athierry@redhat.com,
        robh@kernel.org, konrad.dybcio@linaro.org,
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

On Fri, 28 Apr 2023 at 16:09, Shazad Hussain <quic_shazhuss@quicinc.com> wrote:
>
> The SA8775P platform has 5nm USB3 UNI phy attached to the USB0 and USB1
> controllers.
>
> Add QMP PHY config, pcs entries and support for the new compatible for
> SA8775P platform.
>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 45 +++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
