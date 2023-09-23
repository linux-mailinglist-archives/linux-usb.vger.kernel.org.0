Return-Path: <linux-usb+bounces-535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047A7AC4AC
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 21:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by am.mirrors.kernel.org (Postfix) with ESMTP id 92B6D1F23AC9
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 19:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAB821341;
	Sat, 23 Sep 2023 19:11:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E5033CE
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 19:11:21 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744E4193
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 12:11:18 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59c0b5f984aso48386407b3.2
        for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496277; x=1696101077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KgvDrqDkrzGnPx2se7Co4Z7wm0NrGzLKtZpVnYVh4dQ=;
        b=NBYMv6UbqhpQBDeBB7XhjyHVDwtDFnEYNWtwFkjVHjv/Zp9h7H7/xAQMRozxpziPR+
         AKCBwxvMWPvxIK5fYQCVT9nw25LOWoVqBnU/EPlZU50akJd4Kx0mTJJqo9aM7lbQcvw/
         l8hJLu9qOd/rcZ0aOPx66syDfJXI5SwnOdfzXZTOZzB/Nzp5asL4ROsqC5onjntYrqOZ
         t8fiScaQ6gaihYfEodMYUIL/NOb8iUiuPj3flERpi0cC0cp8+uL/izbqcq8jW75p8fHC
         dqWMHEWTYwMy9mlU9JwGTg1y2bHG9TBl/iygZpfiM/T7rMOLzTw4UdUWMICsYTDb+TKt
         YpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496277; x=1696101077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgvDrqDkrzGnPx2se7Co4Z7wm0NrGzLKtZpVnYVh4dQ=;
        b=UPtPc6ogvpC/vHbIPiVRRE/h0bk6wV4Zq0N2kwX4o/+e0aWPxx9xbxRLiMxrT602EF
         uTNdzsGll0zq6qDk3Y6v08YoU4kyhTGcOXqsp8qbB5y6Sm2XnrWRZVy8Mm8n1P/hL3Ob
         IetOr1y3qf40xyiyzV5D46aZ1FlkTC3o5L7bUIM61EUPoi90ix1HFvb02W1eg0h2Swig
         NnTGCyZTd+jiwZB0XPHs1GEYZUlPxA/rtEfYUDh0NcutbL/PUMZLR7zONm3ipRkjL9dC
         VBfGUB8+PP6FHj9G7RLDlzk9qzreU6RUsAfGnhJuW4NEo+0WwAhKy/aoFoeMOkTcR4oM
         ad8w==
X-Gm-Message-State: AOJu0Yw5VlqXD4cPJzDRfYf/XD2ULaYsaTXjHZoTHxWcSyah3UAase9Z
	fFdLWaN2gBOIolu0AISXTWQLRMyMOgKAnsyS/ByjtA==
X-Google-Smtp-Source: AGHT+IHF5wC8V+m67IYfQK7achvgkDcmV4m+5WkcmcKITxfnn+5AmqlKIK7XbpogOhMl1yGEyLV29+Ag0oexVGoVZl0=
X-Received: by 2002:a0d:d982:0:b0:59b:eab8:7ac6 with SMTP id
 b124-20020a0dd982000000b0059beab87ac6mr2776188ywe.42.1695496277684; Sat, 23
 Sep 2023 12:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com> <1695359525-4548-6-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1695359525-4548-6-git-send-email-quic_rohiagar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Sep 2023 22:11:06 +0300
Message-ID: <CAA8EJporOrbUuzJk5xbnYYGJ86hfGC3N9x5PyeRqYFtnuAiVJQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, abel.vesa@linaro.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 22 Sept 2023 at 08:12, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Add support for USB3 QMP PHY found in SDX75 platform.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 173 ++++++++++++++++++++++++++++++++
>  1 file changed, 173 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>

-- 
With best wishes
Dmitry

