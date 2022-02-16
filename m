Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C154B7D1F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 03:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343582AbiBPCNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 21:13:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343574AbiBPCNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 21:13:32 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D975325EA1
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 18:13:20 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so905361ooi.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 18:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=taHbG7vguVUZGIRIt0xRnIiEKtB/IGIttgv3NTDr6gs=;
        b=h2UalFiYpNDlTDki+0A62tKmSWsYYNjV6hmMaPMU+3FpXazninHX/6hheyBNbTxxZl
         gymYvx/OspLZBOPsQO169uYqB3bhtHeh9CfE3YrAupjKc7rF505e6mTSvbL0NhmgjaGN
         NvxV6F0nhliU4tVjhgsJUwgghCPfZpjxD9tFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=taHbG7vguVUZGIRIt0xRnIiEKtB/IGIttgv3NTDr6gs=;
        b=evTRypKmNDLKAQEMIewzo7C24XX1V2Fl2xTQ5/7MuXMN01pDwRQpEVNSbEsvDt8LQ7
         12p+nqwFp7GRRWL3UkSG2isqQjrTXJPXs1x5/5smdGE2eJgiopuDbr6bzLj0kOHWAjYx
         e8KiVc/By9hEq62ucVN6pY3+fCfNBuTrXhxkFJZHYpjp0h78rxcyw+4/JAPtJvWWSeBR
         4IbUzs3LJ1ZHgQBkrMkoZXL0hSXw7zQTLzBAKyQ1tO+weXrtTpyfIzo+yeeMM3CBvXkJ
         0OCgDw97YfrEW/OFoeRWH/RC1QGHpZWkxQEL8gnnkE05iCryRbg7gU0f8imeoQbuEmtZ
         E4LQ==
X-Gm-Message-State: AOAM530qNZq7G9CpeP/atTfk9G3f/nS54DQ697fsuLHhcEgDQ9/IqQEf
        5l0yyCCw0ecm6u+ju6/ebCUkMHdzuTykpNxdmw5xKA==
X-Google-Smtp-Source: ABdhPJxWIA5NJGfvSR96eXmNG+KkosKCT5zXWtFTw3F3O/ohr//+bginiELxGFqcnrY10SPLW//S8meYeB0ReME7oJA=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr220837oon.25.1644977599258; Tue, 15 Feb
 2022 18:13:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:13:18 -0800
MIME-Version: 1.0
In-Reply-To: <1644949454-814-2-git-send-email-quic_c_sanm@quicinc.com>
References: <1644949454-814-1-git-send-email-quic_c_sanm@quicinc.com> <1644949454-814-2-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:13:18 -0800
Message-ID: <CAE-0n522ctciYfxCxKqF0p3QFWcZU03nP5HoKsc=uKnokg7BCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: xhci: refactor quirks and plat private data
To:     Aswath Govindraju <a-govindraju@ti.com>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2022-02-15 10:24:13)
> From: Pavankumar Kondeti <quic_pkondeti@quicinc.com>
>
> This refactoring allows drivers like dwc3 host glue driver to
> specify their xhci quirks.
>
> Signed-off-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>

Your SoB should be here as well.

> diff --git a/include/linux/usb/xhci-plat.h b/include/linux/usb/xhci-plat.h
> new file mode 100644
> index 0000000..58a56ae
> --- /dev/null
> +++ b/include/linux/usb/xhci-plat.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xhci-plat.h - xHCI host controller driver platform Bus Glue.
> + *
> + * Copyright (C) 2015 Renesas Electronics Corporation
> + */
> +
> +#ifndef _XHCI_PLAT_H
> +#define _XHCI_PLAT_H
> +
> +#include <linux/types.h>
> +#include <linux/usb/hcd.h>

It would be great to remove this include and forward declare struct
usb_hcd instead to avoid include hell. Maybe a followup patch?

> +
> +struct xhci_plat_priv {
> +       const char *firmware_name;
> +       unsigned long long quirks;
> +       int (*plat_setup)(struct usb_hcd *hcd);
> +       void (*plat_start)(struct usb_hcd *hcd);
> +       int (*init_quirk)(struct usb_hcd *hcd);
> +       int (*suspend_quirk)(struct usb_hcd *hcd);
> +       int (*resume_quirk)(struct usb_hcd *hcd);
> +};
> +
> +#endif /* _XHCI_PLAT_H */
