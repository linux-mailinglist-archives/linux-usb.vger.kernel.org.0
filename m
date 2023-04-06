Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1067C6D8F72
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 08:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbjDFGbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 02:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbjDFGbs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 02:31:48 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA9540DC
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 23:31:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so39693487pjl.4
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680762706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obqxU2mz+jsw4Hq+pdxHcftpRbpV6+H1hg2uFdKXnJg=;
        b=ptJ5Ich+H+NtwSCosTGyCsY/Pp8sDLBBsJO3lvmHJWFzVRghQY6PrLbGWedx3zug+q
         wSAXcIfZKbYI8+XSF4EtFioPbIG+l4U+P4n4GbbdLj2DUQZBpHOTn2K/AtKxAc79YakZ
         6Fzw/Zdad+E4P8kZ4z4AZwliiD7Jf04Hx9CUtIWhtkkDd12bdxiuiv7zknh/YMlnuMqx
         kfykzcr+Y+DK+HRFlA4++5JDf+LdXpA9olP5rj+AqMId4X1H566ZHEWgk6IJYvwJF8YD
         EQO8+qrAhPiWtTravKJwe8WwDGc6xdXJDJsTrTcxEqIMmT7gOcaG6uOHN0bpsebBEeaz
         0Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680762706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obqxU2mz+jsw4Hq+pdxHcftpRbpV6+H1hg2uFdKXnJg=;
        b=kyIWjamdlqKnRNCIU3W9a31g5SIZF4YEjBbEu4Co+/jGVWLzI6AXqRGd3XO8iiYfoq
         tNNFdYER13cG8y0tvmv7DeSyZHOl0CndnYzx8ArWLTrgWILENmNOvHsFMZBlV/Ey985w
         lIlUG7G8gTI7gjnwdFHksvW1l2WHeF25YdRoiu1lHVk0VWMaDwjFnxYxyJNTRHSrOKsr
         U1lMDZuxgFi9PTAHdK68l2dEbmLGAMcOZ95SFdvhyw2K9f8wgUrflk9JGVqbSa0q0l4B
         ehbhgA752s3VM50di1DJ7LR1hYb8Qrzvpl3rQFSFwjoIg4Hmjzci/cvmKoB0xN0qYufU
         Brww==
X-Gm-Message-State: AAQBX9dY2qtUoZklBvEIVEinHfKvKiUjMIRpY6fpbLfEb9710yAhy1xx
        SZIvyu7WNaKYCuDq5NbInsUlO1Pxq0SWcs7nbAULNA==
X-Google-Smtp-Source: AKy350bD/Y64vs0qD2MjbI2NJK9P6rHL4AOtwZ1mlHpfcDrjjo6HIcGlm9zSWVu5nF5ZmUVlW1s6jp7cSID+mqvlTXA=
X-Received: by 2002:a17:90b:1083:b0:244:9620:c114 with SMTP id
 gj3-20020a17090b108300b002449620c114mr318232pjb.1.1680762706468; Wed, 05 Apr
 2023 23:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230406061905.2460827-1-badhri@google.com> <ZC5m0onNYztT4Zbl@kroah.com>
In-Reply-To: <ZC5m0onNYztT4Zbl@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 5 Apr 2023 23:31:10 -0700
Message-ID: <CAPTae5J40pmziEk6k0iBEuJ7=NMeFdnk-hkzUCibqRj4aGbzjQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] usb: gadget: udc: core: Invoke usb_gadget_connect
 only when started
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     stern@rowland.harvard.edu, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, peter.chen@freescale.com,
        balbi@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 5, 2023 at 11:29=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Apr 06, 2023 at 06:19:04AM +0000, Badhri Jagan Sridharan wrote:
> > usb_udc_connect_control does not check to see if the udc
> > has already been started. This causes gadget->ops->pullup
> > to be called through usb_gadget_connect when invoked
> > from usb_udc_vbus_handler even before usb_gadget_udc_start
> > is called. Guard this by checking for udc->started in
> > usb_udc_connect_control before invoking usb_gadget_connect.
> >
> > Guarding udc_connect_control, udc->started and udc->vbus
> > with its own mutex as usb_udc_connect_control_locked
> > can be simulataneously invoked from different code paths.
> >
> > Cc: stable@vger.kernel.org
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > Fixes: 628ef0d273a6 ("usb: udc: add usb_udc_vbus_handler")
> > ---
> >  drivers/usb/gadget/udc/core.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
>
> Why resend v1 when it's been reviewed already?

I just now sent a note.
Apologies resent V1 again instead of V2. Have sent V2 for real.
Sorry for the confusion.

>
> confused,
>
> greg k-h
