Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA772FCF8
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 16:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfE3OLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 10:11:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44341 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfE3OLx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 May 2019 10:11:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so5129518lfm.11
        for <linux-usb@vger.kernel.org>; Thu, 30 May 2019 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2S5HoYs79Odxrbeb8difiMYaumXfmehHJ+8imC8jIQ=;
        b=ZGNoM0MufgNxpy5au/RpL1RWLfTcCp5dw7bOKw6FcYKCvwtkYTvQrc2Xtk0qswYStF
         hQUJ7qJkfRSCxCVkTmA3NTCFoj2dHsvZfWlwG+0M8NJuQ6gR8TBHxLfrMu8KLDAEf54t
         HGOLO+TV7oUe3FWYonOuR6FzY2mmdxprOak2jwFefz2gATTIlnrqblzoVAIQ3SCONyLA
         RAV4Ryut8qSCFo5ngtopHtoJ5NMIRfiqM2zWUfIvaCm3In0HsPJVqnS/VWG8Um2KPPeW
         gKsmfAYFc+d1paGYQoAZDZGAOrMwoAM20YhM1xFkRMbO1lH42OVPUjb90jRziSqgbtFP
         jYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2S5HoYs79Odxrbeb8difiMYaumXfmehHJ+8imC8jIQ=;
        b=sRwSGvDWQO6CLACenbUinndaKesU6pMJn8SPrILBMlX8BZOY4BKbwqJPWBsJRX26bM
         9c3t0hb45FHhEAyZ3Cv9HClPYdqDWX0QZSWH+oq7BYae725CZKH5CseBrK6vop6nanxx
         uIFY0fwIhcsXpaoAbikRN0XqTL3DbwcGKEhLvYimWs6ntCSW3dKct3OgZIR790PCiGWq
         jErglH/uTuQZafEeMOFMOhveXUTaWVEeHJ8XMM6Fqg0f6DwxbTKd8eZy1gMRyc1Ui3nu
         8yKcC3VcYf71T+qju5lFAIsU/LEWPDaISkkIDxH6ywntosVgi6izosUoYK+OAlAOO6O7
         7HMw==
X-Gm-Message-State: APjAAAUX5N5etZNp+HXoFNHsGQ21Zf1t9KwUc9Yc8C7kFgtnt/2i1u5J
        EBwdqHnuuNq+d4AWsGUhD1JFTwfiTs+RLWxbduM=
X-Google-Smtp-Source: APXvYqyXRtbrrA9YasSa08wpIlkOMBDNDQHMFV/DWJbIQNdDI2qyAzRM157KrBwqUfJjtMRA5looBWA4+nCaj/evul0=
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr2288753lfm.20.1559225511385;
 Thu, 30 May 2019 07:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190530085039.34557-1-peter.chen@nxp.com>
In-Reply-To: <20190530085039.34557-1-peter.chen@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 30 May 2019 11:11:42 -0300
Message-ID: <CAOMZO5Ci9KfZBeSp-ukNgOVwjxGYrz4-uftgBZsix_6Ybuw9Eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: chipidea: udc: workaround for endpoint
 conflict issue
To:     Peter Chen <peter.chen@nxp.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Thu, May 30, 2019 at 5:50 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> An endpoint conflict occurs when the USB is working in device mode
> during an isochronous communication. When the endpointA IN direction
> is an isochronous IN endpoint, and the host sends an IN token to
> endpointA on another device, then the OUT transaction may be missed
> regardless the OUT endpoint number. Generally, this occurs when the
> device is connected to the host through a hub and other devices are
> connected to the same hub.
>
> The affected OUT endpoint can be either control, bulk, isochronous, or
> an interrupt endpoint. After the OUT endpoint is primed, if an IN token
> to the same endpoint number on another device is received, then the OUT
> endpoint may be unprimed (cannot be detected by software), which causes
> this endpoint to no longer respond to the host OUT token, and thus, no
> corresponding interrupt occurs.
>
> There is no good workaround for this issue, the only thing the software
> could do is numbering isochronous IN from the highest endpoint since we
> have observed most of device number endpoint from the lowest.
>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Should this patch have Cc stable so that it gets applied for older kernels?

> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 829e947cabf5..21c1344bfc42 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1622,6 +1622,28 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
>  static int ci_udc_start(struct usb_gadget *gadget,
>                          struct usb_gadget_driver *driver);
>  static int ci_udc_stop(struct usb_gadget *gadget);
> +
> +

One blank line is enough.
