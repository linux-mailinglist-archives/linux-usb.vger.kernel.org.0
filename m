Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E76F910B30B
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 17:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfK0QQg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 11:16:36 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39758 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0QQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 11:16:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id s14so1392126wmh.4
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=moELcd/jkr7vQOtvllvWgDrPt6P9qhS3kXSqfGxAJ0I=;
        b=FTInKfLPMivjRtKNClr+p2YQHkX5U50egPgyrGseSw0WV5Mg+2JHE6Vln4vi6AcXOk
         6SgIAG/HyxGSKH4rZ2AiDituXb3Ja49PD/i+95umMPZ2kJhyDWVYhcGNNOwmNi8YfNox
         pCAtGAvWUBVMjvxbMGy/ikM5sjc6Xh39vYd9Mr7vssRhF9jIbbKb/9h5IsNn1+LsizWA
         HKRkNLKKXKkGaksFOeqzxOYMPWzlF9jz6zNRq63jPpAgx0e7M3KYlfHX5wlFWG/V1v0j
         BIWx5+l2NcL3CCYyC7BOOHm+6zlxXVS3RggG33AGt+4HZS3yHvVXnRAD6mpb9a4Kb6rD
         m+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moELcd/jkr7vQOtvllvWgDrPt6P9qhS3kXSqfGxAJ0I=;
        b=Mu5k6IctryY+t5a/6ccMZeKyylySBjN958Crbo//Thr11ILAyzY2J2OWW7GbjhqiKf
         jbEcLIu0iHVU0HjJffI7UV6qGzMCN5qE29ym3q92z8srnZ3iH+aZ+BemBnLUrYUCldki
         XUGbdNI37X2L2iBEBiWgwKiTk8/GLo4zVq33/nfIvHmzFfRUkrU/ESPJ72llzQ0f06FI
         8tSNIAKQ/1dArMX003MlvJEkzcidZb6dcM2ZKG8lta8gjxTCsRSXAFJCXECKA5tN74N/
         9WaulZAY4u9/mxgzdLl+dZ79Qhq6ruyUv66B9T4yza2Yw5ImO0HQW3b5MrXwIZBEgnkt
         tHrQ==
X-Gm-Message-State: APjAAAWCkQ8SqvOgAocmmfZxdPeHgUaa0pUxGVeiCmWO8xNnT2EQJsv7
        n4f6skDtzORKD9uKOD3SJUXn8ELt+CcgusQyp7G9Qw==
X-Google-Smtp-Source: APXvYqwBG57VuX/+VOxHz1AZKhwlXywJLwM+IZt/VfZagKkutCb5FPqqipFqpNBLsVflNuxheKtXKQdhawRMHt5VzeI=
X-Received: by 2002:a7b:c392:: with SMTP id s18mr4688291wmj.61.1574871394328;
 Wed, 27 Nov 2019 08:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20191127153015.58171-1-ardb@kernel.org> <b9f82108-edd8-d701-4a4f-f5d0e918d863@linux.intel.com>
In-Reply-To: <b9f82108-edd8-d701-4a4f-f5d0e918d863@linux.intel.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Wed, 27 Nov 2019 17:16:23 +0100
Message-ID: <CAKv+Gu8Rgmn9EywOOY6niKwN40v8sNLDZq3eHapB7pUo_-JHtA@mail.gmail.com>
Subject: Re: [PATCH] xhci: enable XHCI_TRUST_TX_LENGTH quirk for ThunderX2
 builtin hosts
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 27 Nov 2019 at 16:56, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 27.11.2019 17.30, Ard Biesheuvel wrote:
> > When using a USB webcam on a ThunderX2 workstation, the kernel log
> > gets flooded with messages like
> >
> >    xhci_hcd 0000:00:0f.0:
> >    WARN Successful completion on short TX for slot 7 ep 2: needs XHCI_TRUST_TX_LENGTH quirk?
> >
> > Enabling the quirk manually makes the issue go away, so let's enable
> > it unconditionally for this hardware.
> >
>
> This issue starts to be common for many vendors, many report successful
> completions after a initial short transfer in a TD
>
> Does the patch below help in your case? It worked for a Renesas controller
> with similar issues. It's a more generic solution.
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9ebaa8e132a9..d23f7408c81f 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2381,7 +2381,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>          case COMP_SUCCESS:
>                  if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
>                          break;
> -               if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
> +               if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
> +                   ep_ring->last_td_was_short)
>                          trb_comp_code = COMP_SHORT_PACKET;
>                  else
>                          xhci_warn_ratelimited(xhci,

Yes, that works too. If you roll that into a patch

Tested-by: Ard Biesheuvel <ardb@kernel.org>

and please consider cc'ing stable as well.
