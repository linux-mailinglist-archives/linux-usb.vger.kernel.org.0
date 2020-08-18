Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5115F249048
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 23:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgHRVki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 17:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVkh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 17:40:37 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A98C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:40:36 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i26so16448564edv.4
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NsFaOq2Gule56qnq4KRtjtOXF8AJwVO+Mh4+i3ZGp4U=;
        b=eBcBS8wLdoc5PtJVr4sQZdk4wKTOM5+747SX+4cYRqZAStri48+3WBQTBrKwZJecp/
         ZnKfy3TAtyUmGvFH0yzDPP45tOCFdfRjRkttC6YMxNBW3/Bz93ZaMt29FN2VEHNdudKa
         aPp1jOYwXejeOetZ8HVGDJjbSgJ73TmwYVtR8wd+3zgp1k6H31DUg/SPfMuQJ77D8Gao
         lT8D0Z6pTOgKNSpBoZQl5o9k96DRrJI97rTf8Oy9au2+q6ClBGjU9tIzcbEDVTPeOrSD
         HdDWvTNse481CsSLxWH8YddCP9x/75ParjpMNWBL5PadWQYKWjm5c8KejmRHd8AWbdqm
         1vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NsFaOq2Gule56qnq4KRtjtOXF8AJwVO+Mh4+i3ZGp4U=;
        b=ADH3eUOUbIZhy9rRhz+AaqLm/Dv1mVZgjm9BAuBVNvav/M4kNzeTmkCyMdSXv3HutN
         DW/uor606UL3SoHEG1SAAThWOH3StNwwdeVfzjfghn/1JFe7+NnoT51bWc8ighIgKdsE
         7N+0tqWvV1b3xdeZ0bSIO4Eiuwo3UQmhDQXm2XwdUYrOsL0jqmZDhTq9YOLpSigG+N/2
         WaIESIpM+qHsnnI/i4zIGgugdx7czsgeFH/RVyHoZgjEs/z+DJilRGcs19Qw0e/R4fcT
         Cfd0FBzTiSLtbjq4uVVEUtUbTQR9EjsqELusRaEjHcXdXGc9hibj1LqFdCtedHCC+5Dq
         n4Dg==
X-Gm-Message-State: AOAM533wycUSNTbKUxgvKkX/OOgU3S+QAyZe9F8lVi7g4OwXSWkt6gD1
        bC7JsQhoHoCjsgl5YhnGnyYjBqRuGcopMF6AV7s=
X-Google-Smtp-Source: ABdhPJzWH9PnN5Eia+vXag5MlSnQcnNe3aEzIZ2EbO/gbZ5JeOf5HhQWleHbmHfQDvt0wgEGVlP5NNQKznxaa0DQUmY=
X-Received: by 2002:a05:6402:3199:: with SMTP id di25mr22249214edb.315.1597786835343;
 Tue, 18 Aug 2020 14:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com> <20200818165848.4117493-2-lorenzo@google.com>
In-Reply-To: <20200818165848.4117493-2-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 18 Aug 2020 14:40:24 -0700
Message-ID: <CAHo-Ooy8S_XF-fpUgFbis3RTv+982zNc52qcx-aFs_nVvNq8Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: gadget: f_ncm: set SuperSpeed bulk descriptor
 bMaxBurst to 15
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 9:59 AM Lorenzo Colitti <lorenzo@google.com> wrote:
>
> This improves performance on fast connections. When directly
> connecting to a Linux laptop running 5.6, single-stream iperf3
> goes from ~1.7Gbps to ~2.3Gbps out, and from ~620Mbps to ~720Mbps
> in.
>
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index 0c073df225..57ccf30c6c 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -348,7 +348,7 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_notify=
_comp_desc =3D {
>         .bDescriptorType =3D      USB_DT_SS_ENDPOINT_COMP,
>
>         /* the following 3 values can be tweaked if necessary */
> -       /* .bMaxBurst =3D         0, */
> +       .bMaxBurst =3D            15,
>         /* .bmAttributes =3D      0, */
>         .wBytesPerInterval =3D    cpu_to_le16(NCM_STATUS_BYTECOUNT),
>  };
> @@ -376,7 +376,7 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_bulk_c=
omp_desc =3D {
>         .bDescriptorType =3D      USB_DT_SS_ENDPOINT_COMP,
>
>         /* the following 2 values can be tweaked if necessary */
> -       /* .bMaxBurst =3D         0, */
> +       .bMaxBurst =3D            15,
>         /* .bmAttributes =3D      0, */
>  };
>
> --
> 2.28.0.220.ged08abb693-goog
>

Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>
