Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D9D72086D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 19:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbjFBRe4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 13:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbjFBRex (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 13:34:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483981B7
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 10:34:52 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25676b4fb78so1274148a91.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685727291; x=1688319291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWIa/hYf2V21JsH65jMMneaHDH++6Qy4w6MXkMzKbeA=;
        b=CF5VYZUNTPPKcmz/AL0FUm8zCeVsv4UWgQoT2GTpOMwIegL4cKT5KMgJflTMFC66+V
         xeoJJhQw9zCxlpRsFzKpcpk3IpHpJUgokoZxTf+vySbVKwjMVbv0w+9YzyxJbq2eLLkQ
         QoaTjNiq3cQBnG8j61My0iFJIOzzkd9fBERi81X/woRS8hpe71y3/8Ndud2zBENlqgzm
         ASjZOEX674wCxJVFg10odu9fkYILiCqbqc0McsqS/c2yCEMGdb+Cl48xS8RCvg7irJfg
         2gtIjL7KtA3r3hj70bKu5SV0dM5u1c1mZHqxkwMrBdD2AVbBTLlF9+sXVHfNZ5r17QzG
         pfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685727291; x=1688319291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWIa/hYf2V21JsH65jMMneaHDH++6Qy4w6MXkMzKbeA=;
        b=HDGlEyA2RoFivh8eGqJNs6Yk+eE5q2gXXIzY9732tQKhA5525FNEGqgwtn7oYhEXgg
         eTUiu0/533ef9cvQS5m4/dINfbvbpPHyuUOvg31PLYxFNDldQY83EUGEuyVRsB0feDt6
         AhFusKb9hvG+f1Kol9P2Uwz5v9f44Y3Op+WK40lH3dkg5emvCpcl+p7LcR4M68c3/aIe
         4rxbMofXgu6GG3qr7fdrfIHysBUv+LqjGx4stldCoxwjMD0paSyaSO9ppPvupzKINHGm
         +Ryzqkxi+27F07Mgj7PNm9JG20fhIIFj3cL14dS1ScWa9rfHzDToYxeHCO5QZQP1rj/V
         Nwlw==
X-Gm-Message-State: AC+VfDwS8NoHPlCNPsZoRPEqYajsC5BtkqONO/HQ7icba5lzeN0o7Imb
        1dumXErNS424L6jHi2U9AmHdEVYUk+8mxOAmppok3Q==
X-Google-Smtp-Source: ACHHUZ7TXiL2cGXn5F7xjRx6tmKXIWHTmLk4eDufEfMDEnkoYiBpO3aTnkMsCO6fu5T/GC6Oh8VkS7YwWqGpMRW8+9I=
X-Received: by 2002:a17:90a:6b09:b0:253:3d00:a55a with SMTP id
 v9-20020a17090a6b0900b002533d00a55amr546994pjj.34.1685727291547; Fri, 02 Jun
 2023 10:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230531040203.19295-1-badhri@google.com> <20230531040203.19295-2-badhri@google.com>
 <618e4f17-2799-4838-a21c-184c9303bef6@rowland.harvard.edu>
 <CAPTae5KrTBa-=JuBDD8iVCx1+Hqd14yWOiCRkAg0+a75Q9QcXA@mail.gmail.com> <0125d274-bac3-41e1-bd29-156a3bfcc995@rowland.harvard.edu>
In-Reply-To: <0125d274-bac3-41e1-bd29-156a3bfcc995@rowland.harvard.edu>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Fri, 2 Jun 2023 10:34:14 -0700
Message-ID: <CAPTae5KEBNyVJOwa3Ft2BVUU_SOGArxfcujdc7L+eHi8kbcKjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: gadget: udc: core: Invoke usb_gadget_connect
 only when started
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, francesco@dolcini.it,
        alistair@alistair23.me, stephan@gerhold.net, bagasdotme@gmail.com,
        luca@z3ntu.xyz, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 31, 2023 at 3:55=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, May 31, 2023 at 03:40:26PM -0700, Badhri Jagan Sridharan wrote:
> > On Wed, May 31, 2023 at 10:55=E2=80=AFAM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > >
> > > On Wed, May 31, 2023 at 04:02:02AM +0000, Badhri Jagan Sridharan wrot=
e:
> > > > usb_udc_connect_control() does not check to see if the udc has alre=
ady
> > > > been started. This causes gadget->ops->pullup to be called through
> > > > usb_gadget_connect() when invoked from usb_udc_vbus_handler() even
> > > > before usb_gadget_udc_start() is called. Guard this by checking for
> > > > udc->started in usb_udc_connect_control() before invoking
> > > > usb_gadget_connect().
> > >
> > > After a merged version of patches 1/3 and 3/3 have been applied, it
> > > seems like most of this will not be needed any more.  Maybe not any o=
f
> > > it.
> >
> > Without the connect_lock introduced in this patch, wouldn't the
> > usb_gadget_connect()/
> > usb_gadget_disconnect() through soft_connect_store() race against
> > usb_gadget_connect()/ usb_gadget_disconnect() through
> > usb_udc_connect_control() ?
>
> Okay, yes, that's a good point.  It needs to be mentioned in the patch
> description so that people will understand it is the real reason for
> this change.

Thanks Alan !
I had posted the v6 version of the series with 1/3 and 3/3 of v5
squashed together. I have made changes to address your concerns in v5.
Instead of adding a new lock, I used the connect_lock in this patch to
protect the allow_connect flag.
Eager to know your thoughts !

Regards,
Badhri

>
> Alan Stern
