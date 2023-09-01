Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70FD4790389
	for <lists+linux-usb@lfdr.de>; Sat,  2 Sep 2023 00:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350844AbjIAWOY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 18:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350843AbjIAWOR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 18:14:17 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C71F213F
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 14:50:57 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d66f105634eso1902553276.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Sep 2023 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693605057; x=1694209857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7T5FXxzSpNMSTBIFW6gCFjur69dUAN6sqrMcK/o/Gpk=;
        b=Ymda5+8ljp+0KZOhHvhgDp8+oLS9+RFYewQGFNBVcJ00n3hF4IQA10EWBkJ385SooA
         svNvF1xIp0ZW51VWTFh3kXFtj9EEQpUCg+GM9ysXBZLvQ47+2kBd9AcCgJnU6Qa1PQr5
         V7AkzxVS/IOZhDqvTdQE+dxK51BHBOfgooFFCQUbG5SpJe26iPKKRvmCYGn4wJ5Ni76r
         CR6XG8OmSOYo3WpV4LLLT2bFAKKYKW6OXY2MCh+l+YOiEmaTxhL1BImxxNhcOp4CxiBO
         QGLHEBMLuRTCr5GFDAJOQm0zrG42n5LGU9NacZqO0gSB3k6R/gXWt7Q+q2Uf5VsPhoIn
         vPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693605057; x=1694209857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5FXxzSpNMSTBIFW6gCFjur69dUAN6sqrMcK/o/Gpk=;
        b=Euz103EdjApyOVmErp3FRyQEDcgQpAEhJVe5ARNJqe/hhPUQZ9HwrqCHGEHB9coX0d
         2r+Bem78RHKJ76n/i9gTLYrGO8qZVRFml+uRGq/rwQ5nZWDLrwV+d+lmqHk14ZMZZdU5
         MXrGiNhPHIcwCGUmE7kgu0IPuy2aHjLyLTEzK+4cbICxyGG49jByczsGKTJxVxQwk5pD
         UHWbAtf3nEX7+uvIo3U8CpUpU0o4CerwOvwXqKHX+cxBG6mzNikVLMzLnOg7CyXeZG8Z
         Q40cSUhyrdkWL3V6QbjS0IOMSTkWGibLjNKd6KaI5YMhbvqf/PbSRM/Wj8dG58KPb01j
         I7Mw==
X-Gm-Message-State: AOJu0YwKWne5YIGI/KI++xUwd0gMOLB5Jrr1MjooR7x95Mt0yvMALL7g
        rX4ND5DCkJiXyDOChiLEiG1pV3qmX64YaqV1ZCHVkA==
X-Google-Smtp-Source: AGHT+IHZQWWQfsVRShlkEDLQEG+XgcCkRipps2a4WR5lRLbz5QhPjZI81c9oDeBkoqagzkt8tqC2L2HBVFJuCDOZa1I=
X-Received: by 2002:a25:b201:0:b0:cfd:1bb9:e356 with SMTP id
 i1-20020a25b201000000b00cfd1bb9e356mr4588793ybj.32.1693605057193; Fri, 01 Sep
 2023 14:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230901092645.20522-1-quic_nsekar@quicinc.com> <20230901092645.20522-5-quic_nsekar@quicinc.com>
In-Reply-To: <20230901092645.20522-5-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 2 Sep 2023 00:50:46 +0300
Message-ID: <CAA8EJpqsox3HPh45UhtqcWXyKeQ74LxLcyxHuDMz+G8Go9Todg@mail.gmail.com>
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: ipq5018: Enable USB
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Amandeep Singh <quic_amansing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 1 Sept 2023 at 12:27, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
> V3:
>         Renamed usb2_0_dwc  to usb_dwc and sorted
>         the USB related nodes.
> V2:
>         Sort and reorder USB related nodes.
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
