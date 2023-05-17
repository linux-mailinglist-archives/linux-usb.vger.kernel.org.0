Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D853706F38
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 19:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjEQRUI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 13:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEQRUF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 13:20:05 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CEF3C30
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 10:20:03 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-25355609a04so268951a91.0
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684344002; x=1686936002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA4GEkw6Mvu6f7ZlzBV9HkqublrMhw+ZD7wnWlVurlY=;
        b=Vn37ASA4fpooxlne/eIyFg3gzMwQTlgBd2XEo9pIoaSE1kWELMmWJq4+hNrPFq5v4P
         XUZ0qY668TiAm9nplrMPSMSmzuUkoGOEo1OXg2dG8GN3A/Sh05uEB+ffFit62kBsjnm6
         a831OyGVKX4xUslo0UUanQtanXugGGLXr3xsTMuoGcPGT1UII2znsBRvCIoYHz2v/biC
         aJfB3gRszJSQJTBiawVNZ47wGDaVjf0PRN1kqaQtClOgyqRgUJkm+NlJYlE+sX9InNWh
         OrNTWhqq2rqt2nAdN6TOgN+55p2R/XVbOUXT9OjXQGREKkfqy/HEK7bTFhX3izQMpkSe
         r6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684344002; x=1686936002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA4GEkw6Mvu6f7ZlzBV9HkqublrMhw+ZD7wnWlVurlY=;
        b=R3czh+dX3Uh13/TxidbRLVoqNElSOdZjAi3i/aI/wsAB/HuQCnsFfMufBRbjefEXDo
         2LGxxtUawO/qYtj60ZjNzFt8eL1glfYjJwzManYlCp9p7boFjnANEjSm96HfXj3D6y9s
         iAmhsXmFNtBgnX3k1oLwx9L1icOy5JcpyQtQxjZiJLA2URqHeWz/Faa0YZ+ysjdWZ6bG
         uKyM+8fzbtQMwoQ5Yz6hNQUP1FyRovuCvjXBytmBfbN2KH1DYwC7THU5kb7LaXLlmk2i
         AUy+v99dyqNlP5a0MGqtJg1UtkbM7Ecupa1ub0MicgcFJ07GrBPzAQckiGSCE+r0Dduk
         i6tQ==
X-Gm-Message-State: AC+VfDyLtUfp9HHHTaAAFfKOsuoRt/Qy41YXzb93/sv9wluuqwP14j2f
        fAE+99kZDb4bCc8u/rGRNyALZuRjF2Xvbh2i+hfmiw==
X-Google-Smtp-Source: ACHHUZ5oaROI1i0tAOAu+6S33dZ4AKg8K7dRMzns2n8kWIagHNKeQSwfYLT50UbPDUsyy7EeEr7bk4iEJXyvdlmA5vg=
X-Received: by 2002:a17:90a:be15:b0:23f:81c0:eadd with SMTP id
 a21-20020a17090abe1500b0023f81c0eaddmr335771pjs.47.1684344002532; Wed, 17 May
 2023 10:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230517115955.1078339-1-badhri@google.com> <c7f19b4e-469c-4e40-bd2e-e864ca5f7872@rowland.harvard.edu>
In-Reply-To: <c7f19b4e-469c-4e40-bd2e-e864ca5f7872@rowland.harvard.edu>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 17 May 2023 10:19:25 -0700
Message-ID: <CAPTae5JB2LLEF7ZNaJxMnF==8WCWoEYvmF_FK3F=BDq0Hko0xQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: gadget: udc: core: Offload usb_udc_vbus_handler processing
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, peter.chen@freescale.com,
        balbi@ti.com, francesco@dolcini.it, alistair@alistair23.me,
        stephan@gerhold.net, bagasdotme@gmail.com, luca@z3ntu.xyz,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 17, 2023 at 7:44=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, May 17, 2023 at 11:59:55AM +0000, Badhri Jagan Sridharan wrote:
> > chipidea udc calls usb_udc_vbus_handler from udc_start gadget
> > ops causing a deadlock. Avoid this by offloading usb_udc_vbus_handler
> > processing.
>
> Surely that is the wrong approach.
>
> The real problem here is that usb_udc_vbus_handler() gets called from
> within a udc_start routine.  But this is totally unnecessary, because
> the UDC core will call usb_udc_connect_control_locked() itself, later on
> during gadget_bind_driver().

Hi Alan,

usb_udc_vbus_handler sets the udc->vbus flag as well apart from
calling usb_udc_connect_control_locked().  So, removing usb_udc_vbus_handle=
r
from chip specific start callback might prevent the controller from
starting.

void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
{
struct usb_udc *udc =3D gadget->udc;

mutex_lock(&udc->connect_lock);
if (udc) {
udc->vbus =3D status;
usb_udc_connect_control_locked(udc);

Thanks,
Badhri


>
> So a proper solution would be simply to remove the unnecessary
> usb_udc_vbus_handler() call from the chipidea driver (and similarly for
> the max3420_udc driver).
>
> Similar changes may be needed in these drivers' udc_stop routines.
>
> Alan Stern
