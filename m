Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAB7733C14
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jun 2023 00:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbjFPWF0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jun 2023 18:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjFPWFZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jun 2023 18:05:25 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00BB30F9
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 15:05:23 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-62ddb103e1dso11414976d6.2
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686953123; x=1689545123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jSIeGP9ZPoz0n6/jj5NUMeWqWyQU5QesEZSaTcadtY=;
        b=RGNCNxtTZ102fSjEXdSg6iyB6CGjK5bE/C+fJ6eepU6+GWGm6cfkuVUQnuw9a+cwFP
         9iyJjaEtNtySvx6jQ47RkzZBz97tEatsOfxxcyzw8qQBvHaX/vm56xaJ8FrGOnA06pr0
         JhGzAMXin+cj+qEr4xh7mdCrrOS3FkNykpQGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686953123; x=1689545123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jSIeGP9ZPoz0n6/jj5NUMeWqWyQU5QesEZSaTcadtY=;
        b=JO7mp/joTDyBQFtFWFlyfHOhoiu5Li2REyb+hFv2fYXFkI4xzT0AAON3j1vi0LO0pJ
         TJOWg2fytLKqOOHdvdz/Qx37n9EY9PMqCYygxhP8I+TAY3Q2zzoxMrzt9bh7S/db5VAJ
         a4pdVtlbFLZugmsNDsxH25gt6VRvAAbAWyMyBaOZnUZzDnyP6hPelV4vZCZQxy784hB6
         K7Yjt8YVSn7IpEPBgwoyQzm0DCXMk8GGwMQRzst1sn1ZaZ7y7TBOeA2/UvMPkrvq9C4X
         hkqClvB1qwubtJyusCAttcwsaGr+VLTB5a7Jm9+R/cZKWpinzY2r6GfsWdj1E4hac2up
         DyaA==
X-Gm-Message-State: AC+VfDxDXgb3Wae8qpYjz4OpUrp3EwPSM/xCMG0nGx2YMpPkjK7NZqfR
        j6L0DQJ1G0CCWqLLAEM23tawzNCvaf8kp/rtK3xSdA==
X-Google-Smtp-Source: ACHHUZ7EFXbGsruOXXBR9w8qHS4xZ0ojrPrjTaZjQSByQPjIdxgahRvzkniFb6KN1CON98fwMYckrKErT/5YBl2TAaQ=
X-Received: by 2002:a05:6214:1c85:b0:623:8494:9946 with SMTP id
 ib5-20020a0562141c8500b0062384949946mr3533851qvb.45.1686953122817; Fri, 16
 Jun 2023 15:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230605010117.794691-1-utkarsh.h.patel@intel.com>
 <20230605010117.794691-2-utkarsh.h.patel@intel.com> <CACeCKaeVw4UJ8oCj-wmWgf6TCcKYdprqb8Wdu-g2ZC5npgs71g@mail.gmail.com>
 <MWHPR11MB0048F68F717892378FF64E5FA958A@MWHPR11MB0048.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0048F68F717892378FF64E5FA958A@MWHPR11MB0048.namprd11.prod.outlook.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 16 Jun 2023 15:05:11 -0700
Message-ID: <CACeCKac9YRbGYVSVjVWKX0hzJ2PJnenWxasABf2QoUQKK52XvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Configure Retimer
 cable type
To:     "Patel, Utkarsh H" <utkarsh.h.patel@intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "bleung@chromium.org" <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Utkarsh,

On Fri, Jun 16, 2023 at 2:57=E2=80=AFPM Patel, Utkarsh H
<utkarsh.h.patel@intel.com> wrote:
>
> Hi Prashant,
>
> Thank you for the review and feedback.
>
> > > Connector class driver only configure cable type active or passive.
> > > With this change it will also configure if the cable type is retimer
> > > or redriver if required by AP. This details will be provided by Chrom=
e
> > > EC as a part of cable discover mode VDO.
> > >
> > > This change also brings in corresponding EC header updates from the E=
C
> > > code base [1].
> >
> > Please separate this into another patch.
>
> I can do that but since it's just one line change and related, kept it to=
gether.

It's fine to have a 1 line patch. That said (see below)...

>
> > > a/include/linux/platform_data/cros_ec_commands.h
> > > b/include/linux/platform_data/cros_ec_commands.h
> > > index ab721cf13a98..c9aa5495c666 100644
> > > --- a/include/linux/platform_data/cros_ec_commands.h
> > > +++ b/include/linux/platform_data/cros_ec_commands.h
> > > @@ -4963,6 +4963,8 @@ struct ec_response_usb_pd_control_v1 {  #define
> > > USB_PD_CTRL_TBT_LEGACY_ADAPTER  BIT(2)
> > >  /* Active Link Uni-Direction */
> > >  #define USB_PD_CTRL_ACTIVE_LINK_UNIDIR  BIT(3)
> > > +/* Retimer/Redriver cable */
> > > +#define USB_PD_CTRL_RETIMER_CABLE BIT(4)
> >
> > Why are we adding this to this host commands interface? Is this informa=
tion
> > not available from the Cable (plug)'s Identity information? We register=
 all of
> > that in the port driver already [1], so we should just use that, instea=
d of
> > changing the host command interface.
>
> All the cable details used to configure Alternate mode and USB4 mode in t=
his driver are provided from EC host command.
> To stay consistent with the existing implementation, it was added to the =
existing host command.

I think it's fine to use the cable VDO from the registered port plug
for this. It's
less disruptive than introducing another (superfluous) host command
modification.
It is also more clear; right now we don't know what information populates t=
he
USB_PD_CTRL_RETIMER_CABLE. Please use the existing cable VDO from the
cable struct for this purpose.

Thanks,
