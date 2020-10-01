Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAFE27F6FC
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 03:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgJABGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 21:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgJABGW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 21:06:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00347C061755
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 18:06:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q4so973619pjh.5
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=m6cLqlOp/ft31zLwPBCSH8KF/odeeRwTKCbnI0xj5qE=;
        b=LyIjeA4dyrhNIm/akablUCCJYBhKlLNSGA/iiKvwcRgAG1GrfkEF63ZlnAjV73+g+g
         ZSrY/NdQlZ0nLfsak6m+eEfoR2UWk/UK9x7dnkULwZfkKdQ0mjWYZ29eTX8PalTZXGaS
         IJ+6bOhE2qfXk5mt8/9u3z9Dt5zfCnSDjO8TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=m6cLqlOp/ft31zLwPBCSH8KF/odeeRwTKCbnI0xj5qE=;
        b=aReA2bP29rHLk0ZymKXTBJ02MuPsGOvrU7Y5kzYTLu75XEQUaRMvVNiG/FbuuVVnN+
         MpTSKeVBvqQrqLaphLHgYqX/2PwoZqPalQ4ID1AVQsCmBd/swqekagIafM26W8gNBeyS
         3wstv/Xk0UBlnAWIxOhaiAI4ZC/WhYijHy0pN2IgpoLqQFzPtvEYMlfFPq3hh6oP+4JU
         YuB9lhvKObpxmf/rlAbXPVR/QoR/3EGdxoiccRzbWyNjM3bncJl/BWgSwU9ipOehV/2u
         DtsHfFxCOUCqQdUF1Ysww5D8CslIvh/zjzsCw1cXgon6sCcz47dh/OnhZ/4MDZ75Dh9I
         EVlA==
X-Gm-Message-State: AOAM530VeBEHknjiMkoKvTSnq0R5g6Qtva5YUb09FuMo9OygX3KA0krn
        Kv6hoTlFlsB8DGjibbjLb8jLAA==
X-Google-Smtp-Source: ABdhPJza+Q5K1BONpRm+emY42aJcB6XhACjqTvUYShtCdNbTcf1vQZnnGILcDLseKsMN8Oh/yGmySw==
X-Received: by 2002:a17:90a:69e3:: with SMTP id s90mr4673762pjj.130.1601514380501;
        Wed, 30 Sep 2020 18:06:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c4sm3536519pjq.7.2020.09.30.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 18:06:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org> <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Add wakeup-source property for USB controller node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Wed, 30 Sep 2020 18:06:18 -0700
Message-ID: <160151437880.310579.6472711522859117116@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2020-09-29 03:47:32)
> Adding wakeup-source property for USB controller for SC7180 boards.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
