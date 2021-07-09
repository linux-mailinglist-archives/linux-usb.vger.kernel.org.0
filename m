Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C9D3C1CC3
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jul 2021 02:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhGIAiK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jul 2021 20:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhGIAiJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jul 2021 20:38:09 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B56C06175F
        for <linux-usb@vger.kernel.org>; Thu,  8 Jul 2021 17:35:26 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t39so254885oiw.6
        for <linux-usb@vger.kernel.org>; Thu, 08 Jul 2021 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=feTmuUZ3YlEtdPQY+U32K276WevJpE+FiuInMlT3biM=;
        b=kxOFARsh7VuHf7Gbgk6uYnq9+iGD5vIQxZUZa6FqpiEvuq9ectHlbA9j4wF2FrNgKL
         HRejUsrkUE32G4Kj1gXp0FcxSaw5PuvnY2PHhL9QYEvt+o36gzyzRnibLOkHJwghQMsl
         bbo/G/lk++UHbfj7dDUfTJO0DMAYdMOSe02JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=feTmuUZ3YlEtdPQY+U32K276WevJpE+FiuInMlT3biM=;
        b=JJNoxUq+eePT6wUy260Xijx53IFsv7zaeFdGzVz74/LtrMrMB2YMetLq2j1fdTuJtR
         iSSVtMFYFBmIeYMGqqQmWGhCJ6haDsNG9HGWxswMqdMcQu+nDWdIURaBUrKTLg/U40N8
         hBeOOcA2xldq1Zc5MDPlIcsjuGZIkGycfFxyTolF8TzxhIbReYQRRaf6dmk7laO9WubC
         YN6TNLpxHhikZawjJPaiRU5ZxQi559Y5/n3TLpa0fyWB+cRSHry+QErtv5dc9TMvpxeq
         DmZEtvHibVMztSSZGZFoCaJYGq9FNVYbSXZ6Hb4BPiJA5NjCGN/GKCsiOb/GF2gPnQdg
         TKEA==
X-Gm-Message-State: AOAM532KpHn7yy5Ez/rC/+qs/04oPstCUU8GYsWQt3suWaWkGmRPZgt8
        6se9qpZktQP1xnZC52yZuBxcVrQz013gKs+7dQKBPQ==
X-Google-Smtp-Source: ABdhPJxIBfTDfbmT1hRD2/wJx94a64VaxjCzvR+Lnx8ng77JFxc4MS7LQ1bcUZ2EhHWpvcjz0sg+NAVbt8qQv3G+nKY=
X-Received: by 2002:aca:7545:: with SMTP id q66mr6173670oic.19.1625790925910;
 Thu, 08 Jul 2021 17:35:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 00:35:25 +0000
MIME-Version: 1.0
In-Reply-To: <1625576413-12324-2-git-send-email-sanm@codeaurora.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org> <1625576413-12324-2-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 00:35:25 +0000
Message-ID: <CAE-0n50UtAVYDwDcFrwOWti+BrQvCSf4nZk+1ai53hRcG8mh1g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SC7280
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

Quoting Sandeep Maheswaram (2021-07-06 06:00:11)
> Add compatible for SC7280 in QMP USB3 DP PHY bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
