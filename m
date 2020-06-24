Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C0820698B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 03:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388386AbgFXBeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 21:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387804AbgFXBeU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 21:34:20 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A36C061573
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 18:34:20 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id e11so619321ilr.4
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z8bZV8f7/ZPDDOr48dMfi58k+Y1qEbiKxe/JWYfh92E=;
        b=UUYXp/RqJpLxTVPgKBec2qwAIUq7PCO54ZW0WiRY5ziYNrIs0LP4kCsGtAb2vSfYh8
         qX5kWBCUqc+Zpu1fhqDP24gKL0jmw8nJLY3OjAXvqkmk0WgTOCplQkfzVGPKc1jBleEq
         5WvSCskyRBfwTfu37UPV+8VRQSILZm99WtgD39nGFCav5WA0O7E/pMEVmHnXZcg33fcB
         iC3QgHLX6sLSH35kZDMG7l2d6tZL50HdO45ia8o4aTST+D5BBCeMYMCX42zGryB/+p+0
         q2XqCWDXcijfdMmm1peWjCXg13hu8b64eUT6LNXySd+tzis44Qkj3iPWDQm0JWyLN0Rq
         L/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z8bZV8f7/ZPDDOr48dMfi58k+Y1qEbiKxe/JWYfh92E=;
        b=CqtUig6bYRunZtYzaiCbC+YmnaJ0cJijFn4E5j52p7n2MYv0/OSW9oWMjpb1hvZTSr
         0dOUdLbgWgRYcL3VWBAq771cor9876iXhio30yc4/JfPVXGf3amr+NylFQGK8aet0Gvt
         V7dfWZglI9g1Z0i/YtOLW6QaLms5R4tWEWHf+DdHg2GzTOAkTYqr0HnT/+QCFpwr0sVo
         UOIF+oAnFvshHh/UzJ+Ovs+TAzCxQGYAYhKv3axHz+tu/Q9Cf+dJZNzeCxz99Z3m8Knu
         fFcJJg3FWTu+iGHAY6JbDPGsEHbhgad1EoiUFgc9y2cdFJtu8vBdJassRhTvdU9fu1O4
         LT3Q==
X-Gm-Message-State: AOAM531z0gFLEmuL9L4siAa4d9kJmYueAKren1qVyE9wLR3MNz/n8L5I
        evIrHF02+c0+rw0Oh7pboDSK8+fdu/ZwemyKN9QPtTO+
X-Google-Smtp-Source: ABdhPJyPLUH63XGQ1n+Inz6qpMyh6a3vIuwON1o8D7lci/d9N/1XGBLgpR3VWm8NjvrnQgAwCuc3qrIWZQdLZT9AbmE=
X-Received: by 2002:a92:d64d:: with SMTP id x13mr19384399ilp.287.1592962459459;
 Tue, 23 Jun 2020 18:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200608071052.8929-1-peter.chen@nxp.com>
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 24 Jun 2020 09:34:07 +0800
Message-ID: <CAL411-r+wW79navpVoJyvDqyS81LCBrStw0CUc2faMmmu1Ovkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] usb: some PM changes for cdns3 and xhci-plat
To:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org,
        pawell@cadence.com, rogerq@ti.com
Cc:     mathias.nyman@intel.com, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 8, 2020 at 3:12 PM Peter Chen <peter.chen@nxp.com> wrote:
>

Hi Felipe, Pawel, and Roger,

Would you please have any comments for this series?

Peter

> Hi Felipe & Mathias,
>
> In this series, it adds cdns3 runtime PM support as well as some
> xhci-plat changes, and verified at NXP i.MX8QM and i.MX8QXP platforms.
>
> Patch 1-3: add main runtime PM support for cdns3 core and imx glue layer
> Patch 4-9: add platform data support and two quirks for xhci-plat.c.
> - .suspend_quirk for platform special sequence between xhci_bus_suspend
> and xhci_suspend.
> - add XHCI_SKIP_PHY_INIT quirk for skip PHY management from HCD core.
>
> Changes for v2:
> Add Jun Li=E2=80=99s reviewed-by [Patch 1 and Patch 6]
> Add Mathias=E2=80=99s acked-by [Patch 4-6]
> Some wakeup logic improvement [Patch 2]
> Add dedicated wakeup interrupt for core, and improve the commit log [Patc=
h]
> Fix build error found by kbuild test robot [Patch 3]
> Using xhci_plat_priv quirk for skip PHY initialization [patch 7, patch 9]
> Some other typo and tiny improvements
>
> Changes for v1:
> - Add the 1st patch. Without it, the build on the usb-next will fail.
> - Change the subject for cover letter a little to reflect all contents.
>
> Peter Chen (9):
>   usb: cdns3: introduce cdns3_set_phy_power API
>   usb: cdns3: add runtime PM support
>   usb: cdns3: imx: add glue layer runtime pm implementation
>   usb: host: xhci-plat: add platform data support
>   usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
>   usb: host: xhci-plat: delete the unnecessary code
>   usb: host: xhci-plat: add priv quirk for skip PHY initialization
>   usb: cdns3: host: add .suspend_quirk for xhci-plat.c
>   usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
>
>  drivers/usb/cdns3/cdns3-imx.c   | 203 ++++++++++++++++++++++++++++++--
>  drivers/usb/cdns3/core.c        | 199 ++++++++++++++++++++++++++-----
>  drivers/usb/cdns3/core.h        |  16 +++
>  drivers/usb/cdns3/drd.c         |   3 +
>  drivers/usb/cdns3/gadget.c      |   4 +
>  drivers/usb/cdns3/host-export.h |   6 +
>  drivers/usb/cdns3/host.c        |  48 ++++++++
>  drivers/usb/host/xhci-plat.c    |  36 +++++-
>  drivers/usb/host/xhci-plat.h    |   1 +
>  drivers/usb/host/xhci.h         |   1 +
>  10 files changed, 469 insertions(+), 48 deletions(-)
>
> --
> 2.17.1
>
