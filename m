Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9061617F0B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 15:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbiKCONV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 10:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbiKCONC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 10:13:02 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D33175A4
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 07:12:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id z14so2962355wrn.7
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DW6qOLggUDgASb5BXWgCGBn6wiJ6RjTplDMM4RvHv1c=;
        b=szGfA5+M7RAuJB1RtigO8OXQnPyhSSGas+YyiakeOYmPUpGUE0ADMCc2/g+DMiQggO
         0awI303q89XBifILuOCdf9y2/b6mq6D6HrBD58ZICMYPRUkHL3/Iuct87QptioaXQiUb
         8Bnt2+VIzshGlCDK3bwtpaht99yOc9iPNZi4fgtel3xBl9UAwO5yHoN1WMH5ATwSsb44
         VO2EVWWE56QgaA+IQECwMT1S3tWfVRFdItFfj2HEkaR4JKShBPy+yIhnKzPpnq7zKjH/
         vZCHDjKzarQ8jX6IQNG2aUcsbMLiQ+YOKtRC4Cf9bfQjQlvCDoz57weFZRHwHOpnqpsp
         hkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW6qOLggUDgASb5BXWgCGBn6wiJ6RjTplDMM4RvHv1c=;
        b=hjmjVRYX1fme0damOM4w0jDY8u0oZPQU4au5pV7GX0G+uHMbGj8ywGzifRpzVs9cuY
         jQpz7LAY+BvNN6tgjdeWZplgXRPEpyBT7KlO1hUGe9dt3D90AOYHhb1M6GohtRF5z4pU
         s8smSnKNlPAowW45XbDmAPzpmwTLJERljjrWu9StVHOar+MemHxZxqw3TPoha4S7KZfb
         y5fNo70QfYYua0G8qtrj5NAKm1qwWLmWSGFF00V7wnKypUDFa++Rpz4lhV02/RhxMj+i
         7TK6DOAATEs0KNROY5PYso6IEI8o+L7FNOcMSv9Bw2o46BLoU+2OmXfuWrJRekaSk9hQ
         Z1dg==
X-Gm-Message-State: ACrzQf1kGCZpk43J3ItES4B7qimwdzr0h7jtKtlSeIYHtg9TkFpFmcZG
        0f1/W0MGgSPJvobQXEkuy+Oyt9jAPwF9QZrGsY2/dA==
X-Google-Smtp-Source: AMsMyM5IngcZNcehorWq6IuX0vGpEwpnOakPgOR/8mDTynUw7/vFc41S411CVdIbzMmXMYIVD5Xcmk+c/RbP4ad4h/0=
X-Received: by 2002:adf:db4d:0:b0:236:699b:be5e with SMTP id
 f13-20020adfdb4d000000b00236699bbe5emr18209276wrj.147.1667484777461; Thu, 03
 Nov 2022 07:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221027004050.4192111-1-albertccwang@google.com>
 <20221027004050.4192111-3-albertccwang@google.com> <Y1oj7TlC93oOKyB7@kroah.com>
In-Reply-To: <Y1oj7TlC93oOKyB7@kroah.com>
From:   Albert Wang <albertccwang@google.com>
Date:   Thu, 3 Nov 2022 22:12:45 +0800
Message-ID: <CANqn-rjNKJasYe4LxMcSNANCOVkGaiQ8=nwaMTjvBkyts=uG8w@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci-plat: add xhci_plat_priv_overwrite
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@intel.com, badhri@google.com, howardyen@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Understood, will fix and re-upload v2 patch set.

Thanks,
Albert

Albert Wang | Pixel USB Software  | albertccwang@google.com | +886-918-695-245


On Thu, Oct 27, 2022 at 2:22 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 27, 2022 at 08:40:49AM +0800, Albert Wang wrote:
> > From: Howard Yen <howardyen@google.com>
> >
> > Add an overwrite to platform specific callback for setting up the
> > xhci_offload_ops, allow vendor to store the xhci_offload_ops and
> > overwrite them when xhci_plat_probe invoked.
> >
> > Signed-off-by: Howard Yen <howardyen@google.com>
> > Link: https://lore.kernel.org/r/20210119101044.1637023-1-howardyen@google.com
> > Signed-off-by: Greg Kroah-Hartman <gregkh@google.com>
>
> Again, no, I do NOT sign off on this submission.
>
> Also, you did not sign off on it, yet you forwarded it on.  That's not
> allowed either, and makes this whole series not even able to be
> accepted, if it were a valid set of changes :(
>
> Please fix.
>
> thanks,
>
> greg k-h
