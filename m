Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBB548CFEB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 02:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiAMBCp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 20:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiAMBCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 20:02:44 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE00CC06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:44 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id w9so6156979iol.13
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfO2IPiu585aOv+gWS1tbBYG3Sjtk47juJEQY4GuGDQ=;
        b=iWoq3lRvbf5fsTFgbdgbiMuQ8QqZWM52nbCcFRUmDfwLM2e1vBPNzb0fu/abQmQ3Y0
         kizrLnrkVmPiPsTXMRDNmSe148e3C/Qd2aakPcPkoCr3T8lH2tgeIrL+eNPVhaaITKbu
         lJEVn2H2c4kU4DyGvvbRD0fXiPtKmOEdMTK60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfO2IPiu585aOv+gWS1tbBYG3Sjtk47juJEQY4GuGDQ=;
        b=Swpp8dDdIEBqG3i6wtZL/kkN/IdFBpDKXr4N4hPO4BeX76R+KrGgQEKNOxkdsoSx4s
         Ed8MA2hlGlXjsJ17Yd8AQwoq6+gC097FjuLwAqizHh1gdVcDnGMw+u31OZlbqjp940x7
         /c6EHebJ/Qp4O3WzpuMcn6lB7Fwh4JihumPphkbdc0+24bTP5LrYxRKhQHI4JF9WGCTd
         zgWDsfwuhwDZXSbSJkwchMLKOt8+e7D4yXNfcOcdpPECG8dEDZMFjuSxY6KlTavWC4t/
         nT0MTmP0kHLt56Ew+fhEq5X/107VCKnjznyH9kXW1que/9ajMVMORnEaCiIFeQ/RM/+0
         1gFA==
X-Gm-Message-State: AOAM530p8Ljej9fXa0UmQFHymxYm2r3Gi0rHeEsCRtdyCDLQX+/b8zli
        9xIpDN5aOGU5Ro0m1mMAyHoBCbpSciTxaw==
X-Google-Smtp-Source: ABdhPJzxDKnRWGXQsaW6dF0LMPdAbRLuRpuav/TZNIxi2Yowns0by8U3T5+lrfgZUeLHAzimFVLiEg==
X-Received: by 2002:a05:6638:22c7:: with SMTP id j7mr1041184jat.264.1642035763984;
        Wed, 12 Jan 2022 17:02:43 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id l3sm802507ilo.17.2022.01.12.17.02.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 17:02:43 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id v6so6257889iom.6
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:43 -0800 (PST)
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr1049145iok.136.1642035762993;
 Wed, 12 Jan 2022 17:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.1.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
In-Reply-To: <20220112111028.v19.1.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Jan 2022 17:02:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XyzwiOdHQLSwv2PqU6nKjedNWfTpY3Jd5nnrjszWbMGw@mail.gmail.com>
Message-ID: <CAD=FV=XyzwiOdHQLSwv2PqU6nKjedNWfTpY3Jd5nnrjszWbMGw@mail.gmail.com>
Subject: Re: [PATCH v19 1/5] of/platform: Add stubs for of_platform_device_create/destroy()
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jan 12, 2022 at 11:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Code for platform_device_create() and of_platform_device_destroy() is
> only generated if CONFIG_OF_ADDRESS=y. Add stubs to avoid unresolved
> symbols when CONFIG_OF_ADDRESS is not set.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> Changes in v19:
> - still no changes ...
>
> Changes in v18:
> - still no changes ...
>
> Changes in v17:
> - none
>
> Changes in v16:
> - none
>
> Changes in v15:
> - none
>
> Changes in v14:
> - none
>
> Changes in v13:
> - none
>
> Changes in v12:
> - none
>
> Changes in v11:
> - none
>
> Changes in v10:
> - none
>
> Changes in v9:
> - added Rob's 'Acked-by' tag
>
> Changes in v8:
> - fixed C&P error in commit message
>
> Changes in v7:
> - none
>
> Changes in v6:
> - patch added to the series
>
>  include/linux/of_platform.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

I was assuming it didn't matter with Rob's Ack, but for completeness:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
