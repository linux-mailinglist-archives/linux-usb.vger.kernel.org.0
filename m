Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B207C3C1CC7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jul 2021 02:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhGIAjD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jul 2021 20:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhGIAjD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jul 2021 20:39:03 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00FDC061762
        for <linux-usb@vger.kernel.org>; Thu,  8 Jul 2021 17:36:20 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so7700032otp.8
        for <linux-usb@vger.kernel.org>; Thu, 08 Jul 2021 17:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WN27oMEfY9NvPwjWgA4bGtEV8WjeXNxGHtmdD1XiQgg=;
        b=LYb3C7pX7CdWNjzz/dCcvpGx6ZT+diawAVGMRVLOPoNQwMwCfwv6gN1TkdNzGFWlH2
         nmG1zxCK2EojDkDVGT6tkoN7H30xt8iyNKH2EiGgBpPP7lHz2GGc3OfSg6Cx0JpUaOvL
         MLalO4PXIvEf+gFx2YkgVJmTPsSNbxUiqRx88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WN27oMEfY9NvPwjWgA4bGtEV8WjeXNxGHtmdD1XiQgg=;
        b=ELQFFQzym9gqlJNwwsdJZvSiDPT2r9y9GuWq6MJBrsMteEyde+AHJXCI/qZJoli/3B
         LsV1YCA0yphUansW1dfvGjyRiRM52ut50otpJ6aP0iHi2+mkEZN0IeLoJI59Vch9v+uK
         bztlzobkEkC+moUDDg+z5hQIKZ/OUu+jKCZSN2RRcO91j7n8+MsiS5CrMCJgWtHrEOS8
         wgS4Rcm/aQ53evFUVXywynIrpp2PmiX5kZVxTvMJBN9kTYLrP/zX/+mZ0JSWiukg6qyY
         N4+Ts4XP2iBL3Yzr1hiBrZVipyxSyCN9dkzMy2UUZ2BVpy4mmXGJmKXi0eIfTVflvT4H
         L47Q==
X-Gm-Message-State: AOAM5316UV8t3u3mKlx/HTf8LXNKu1ABGuCiW7aPweByE5moJdNEYz/T
        B/jheiSeePAppQ2PMDvZ2BvO1gwRqCc/0cBfDIyCXg==
X-Google-Smtp-Source: ABdhPJzFkW00qYYeua+6zU03xXprYJxRcPLW1BYAEd4K+IzQ0JKM3/M4Exln63R8Zri80MwpRkZYNR0JH2U9ee5UxW0=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr25341894otb.34.1625790979986;
 Thu, 08 Jul 2021 17:36:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 00:36:19 +0000
MIME-Version: 1.0
In-Reply-To: <1625576413-12324-3-git-send-email-sanm@codeaurora.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org> <1625576413-12324-3-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 00:36:19 +0000
Message-ID: <CAE-0n52x1ZY1kOsbmt-8P1gzZhbRBTkZSHoeRQXb1Kpgvb23aw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add USB related nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-07-06 06:00:12)
> Add nodes for DWC3 USB controller, QMP and HS USB PHYs in sc7280 SOC.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
