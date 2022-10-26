Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A2760DB76
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 08:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiJZGkZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 02:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbiJZGkX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 02:40:23 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E2B3ECD3
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 23:40:21 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f193so13961165pgc.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 23:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t84snMklNQgAUUFtqaZeJX3WNh39jvDGq6ud9s+DjwI=;
        b=P8LMEncS7UpMFZ9kjr8UTqD4Xw5hk+O7tlYxzzatXbpfIaYT8zJD3wmuPIBBD63DKM
         u5+BHymviF8baEQA7DbkT0av0l66UJwf43/odKYV4lrrJ8DDBX/Ijz+9iu3d9WEXxyNU
         MWP2qh09idhRP1g8BXd2qm33noMqcBewC2Ors=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t84snMklNQgAUUFtqaZeJX3WNh39jvDGq6ud9s+DjwI=;
        b=h8ZuT4hO/boLXf4DynilxAtJiP1lU1vQnypOCgUgfG1SFZY6caVjBKGjnQR7wEkuas
         2x8vJU3H22IsiXMXHGmgop/BmTHzq3Ime2tqKvAJLYG6cHAXfQdepPAMeXrdgeMuD0xt
         mquNRya3qLDWzVbKlHxPBUue/iw7JCNQcNfn2gDGmYJQa0HbJ505x1FtZGl3PHrSL36o
         cKxwiXXr73sJjIIgB6X1ejlRZpUA++VZ7lehQvUHZDLoSBlD8bEYf4Kabnpk6CxV911a
         nKf9kWdqK/UyUqxNdXtKf2eQ0F+7BaR3ZqGCdPYTfl8l1SmmDiaiZ7K9e9OdkepY25l0
         O94g==
X-Gm-Message-State: ACrzQf1H1vQI/FNZS8tu6TqxoRXoHV73OMiThGVkswtD7Kk0/FOILoYr
        3uEyBL7AjMydvMv8pGYXYbQZdSZD3teffF1VwCtEDA==
X-Google-Smtp-Source: AMsMyM73hBksBZIsg2tJ8obDeVovGPgqNfOE2e8nLDMqCQ5y8BIkgbTn5oXMqsXLRcBFmWQ0tzF1jv7W7D3F7xbe0+w=
X-Received: by 2002:a62:a503:0:b0:56b:cb10:2d87 with SMTP id
 v3-20020a62a503000000b0056bcb102d87mr14986305pfm.79.1666766421409; Tue, 25
 Oct 2022 23:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221024142720.4122053-1-mathias.nyman@intel.com> <20221024142720.4122053-3-mathias.nyman@intel.com>
In-Reply-To: <20221024142720.4122053-3-mathias.nyman@intel.com>
From:   Reka Norman <rekanorman@chromium.org>
Date:   Wed, 26 Oct 2022 17:40:10 +1100
Message-ID: <CAEmPcwsBDwFoXOcXKXkx1aebnq3CV036Ygz_oXOobcyKoQQNnQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] xhci: Add quirk to reset host back to default state
 at shutdown
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 26, 2022 at 5:01 PM Mathias Nyman <mathias.nyman@intel.com> wrote:
>
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>
> Systems based on Alder Lake P see significant boot time delay if
> boot firmware tries to control usb ports in unexpected link states.
>
> This is seen with self-powered usb devices that survive in U3 link
> suspended state over S5.
>
> A more generic solution to power off ports at shutdown was attempted in
> commit 83810f84ecf1 ("xhci: turn off port power in shutdown")
> but it caused regression.
>
> Add host specific XHCI_RESET_TO_DEFAULT quirk which will reset host and
> ports back to default state in shutdown.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-pci.c |  4 ++++
>  drivers/usb/host/xhci.c     | 10 ++++++++--
>  drivers/usb/host/xhci.h     |  1 +
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 6dd3102749b7..fbbd547ba12a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -257,6 +257,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>              pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI))
>                 xhci->quirks |= XHCI_MISSING_CAS;
>
> +       if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
> +           pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI)

We need this quirk for ADL-N too (device ID 0x54ed). Would you mind
updating the patch? Or I can send a separate patch if you prefer.

> +               xhci->quirks |= XHCI_RESET_TO_DEFAULT;
> +
>         if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>             (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
>              pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 5176765c4013..79d7931c048a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -810,9 +810,15 @@ void xhci_shutdown(struct usb_hcd *hcd)
>
>         spin_lock_irq(&xhci->lock);
>         xhci_halt(xhci);
> -       /* Workaround for spurious wakeups at shutdown with HSW */
> -       if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
> +
> +       /*
> +        * Workaround for spurious wakeps at shutdown with HSW, and for boot
> +        * firmware delay in ADL-P PCH if port are left in U3 at shutdown
> +        */
> +       if (xhci->quirks & XHCI_SPURIOUS_WAKEUP ||
> +           xhci->quirks & XHCI_RESET_TO_DEFAULT)
>                 xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
> +
>         spin_unlock_irq(&xhci->lock);
>
>         xhci_cleanup_msix(xhci);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index c0964fe8ac12..cc084d9505cd 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1897,6 +1897,7 @@ struct xhci_hcd {
>  #define XHCI_BROKEN_D3COLD     BIT_ULL(41)
>  #define XHCI_EP_CTX_BROKEN_DCS BIT_ULL(42)
>  #define XHCI_SUSPEND_RESUME_CLKS       BIT_ULL(43)
> +#define XHCI_RESET_TO_DEFAULT  BIT_ULL(44)
>
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
> --
> 2.25.1
>
