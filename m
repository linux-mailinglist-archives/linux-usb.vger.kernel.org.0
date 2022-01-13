Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB49048CFF2
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 02:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiAMBDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 20:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiAMBDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 20:03:13 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBF3C061751
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:03:13 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id n137so226030iod.4
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wHg2A2NJ6UT4MzZgddCFAkaAuebXYA54j3jymBNq3bQ=;
        b=hcY89bjSYMmSQ24yWz7MQ7PxwnpW0ag4Pu7D8vG1bspNAMS8x5xk77MMVuyzXzjgQ7
         zc9volWa9dRnhpQXAi6KyCVRkTN/ZvG6Jw3sBxygDfXk+/v7sMEh+TWy4rlScY+N1HAx
         w+Sno9TOw+GhiMMRW+N2LF7I7vPEhkkYHrY4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wHg2A2NJ6UT4MzZgddCFAkaAuebXYA54j3jymBNq3bQ=;
        b=EqVzaeOxy8oA2u+S6y/uvngg4vgrfVaridA2agAxupMAJBH0yGyHYY+XlpAgok+DMK
         NcdFSYNA9iM6t7gT1PlOROTy1U6nEhBzYX9LZnXvTMg30K/7xIYEF8Zjvch2ZWwwcURm
         HLCj+Ylyl32lhNox5uEVDUUhW/na3z8apBl741UMZnrM8mc9KMl4NVGnzDUAJDLNCjad
         khhehx4raZOC4bZBeeNzejpReXlk8kIBIIpSXm/1ku5IwAUxKfju4NZVVCvtfgeAqUdP
         CvVoXO6wQWvvMiLMIYZgTpIuWVr2Vpf5/cuA4xdZ+zsKAYbLzmB5mxejJtc8Z34proZI
         v4UA==
X-Gm-Message-State: AOAM530R/RngxohZAy6VdvX3DMAoGfxQN33NgxMNWlZb6aLcCeUDRqC2
        lRpj6ItC8BYAudW9907gLyjiqdAKVzWYCQ==
X-Google-Smtp-Source: ABdhPJzlJGmycosBTzKppyjxlKZqp0Q+sunsjL0vwhJ6/Br/4US0cmIc3fikox5yNTNDNOiFZ3wqxA==
X-Received: by 2002:a05:6602:2d88:: with SMTP id k8mr1082112iow.57.1642035792583;
        Wed, 12 Jan 2022 17:03:12 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id o16sm888622ioo.36.2022.01.12.17.03.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 17:03:11 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id c4so4131325iln.7
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:03:11 -0800 (PST)
X-Received: by 2002:a05:6e02:2187:: with SMTP id j7mr1201909ila.120.1642035791335;
 Wed, 12 Jan 2022 17:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.4.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
In-Reply-To: <20220112111028.v19.4.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Jan 2022 17:03:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XPx0jtRLVaxvah_JsdrUa_u7XVPspqOLB-b=ZaWeh9LQ@mail.gmail.com>
Message-ID: <CAD=FV=XPx0jtRLVaxvah_JsdrUa_u7XVPspqOLB-b=ZaWeh9LQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/5] usb: core: hcd: Create platform devices for
 onboard hubs in probe()
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
        <devicetree@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Li Jun <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Sasha Levin <sashal@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jan 12, 2022 at 11:11 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Call onboard_hub_create/destroy_pdevs() from usb_add/remove_hcd()
> for primary HCDs to create/destroy platform devices for onboard
> USB hubs that may be connected to the root hub of the controller.
> These functions are a NOP unless CONFIG_USB_ONBOARD_HUB=y/m.
>
> Also add a field to struct usb_hcd to keep track of the onboard hub
> platform devices that are owned by the HCD.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v19:
> - none
>
> Changes in v18:
> - none
>
> Changes in v17:
> - create the platform devices in the generic HCD code instead of
>   the xhci_platform driver
> - updated subject and commit message to reflect the above change
> - dropped initialization of platform device list, which is now
>   done in onboard_hub_create_pdevs()
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
> - added comment for 'depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB'
>   construct
>
> Changes in v12:
> - none
>
> Changes in v11:
> - use onboard_hub_create/destroy_pdevs() to support multiple onboard
>   hubs that are connected to the same root hub
> - moved field/list to keep track of platform devices from struct
>   usb_hcd to struct xhci_hcd
> - updated commit message
>
> Changes in v10:
> - none
>
> Changes in v9:
> - added dependency on USB_ONBOARD_HUB (or !!USB_ONBOARD_HUB) to
>   USB_XHCI_PLATFORM
>
> Changes in v8:
> - none
>
> Changes in v7:
> - none
>
> Changes in v6:
> - none
>
> Changes in v5:
> - patch added to the series
>
>  drivers/usb/core/hcd.c  | 6 ++++++
>  include/linux/usb/hcd.h | 1 +
>  2 files changed, 7 insertions(+)

No changes since v17 which I gave my tag for [1], but happy to give it again:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=FV=VcAdSWWVykGrw2r5BFMe4Esotb+ieggczcrY2TH-4VSA@mail.gmail.com/
