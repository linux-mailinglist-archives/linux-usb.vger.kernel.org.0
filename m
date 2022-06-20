Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B03551103
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 09:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238829AbiFTHKi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238339AbiFTHKh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 03:10:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBDADF1F
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 00:10:36 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hj18so18628690ejb.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8JWfdCIri9996188DMDfXnK/jA+xBciHXLU/t2EsnbE=;
        b=qMs9FO+Wojo0f1A3HEl/wa2KKoFlFee6SBLagowXPTIOcoVNN5tZ0xgG05YWnk7hwn
         NNZkuAMeGxPhLxBUf+NN35Che0DrUhlANUFwSEjGRo7144752lb2/UBhXHvjJeCuHQ1+
         vKT9fFUjTaGklvGhmf7IUSKeza5r9nSkqgoxwDYcYBXiq9P7HAinKhzFa8Tj1qGil/wl
         nE5lKzId7tn2QL+Oqj1oo0dJorl0IP76RHIVXy+DYXWVaFPraCN2BKSF2TaKR91STdFs
         g+hz/LX8xllRx1Tsfx1I+Uw34O7zXHEKQDib5HoqATKgu44K5SeeytXPJRve+j/uwGxv
         yqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8JWfdCIri9996188DMDfXnK/jA+xBciHXLU/t2EsnbE=;
        b=ivLVwz0y/LnwgGGU6PCEAUoKip+SJ8SPxFw/2LNLPBo4EY+PNM0kDzsMtYeCs1YBI5
         NkvsPt+vq7nBN2QXewEd6PG+cFw+SPEoSTonLa6k8ZkIY3EBKaJ9n62Jr3I8uEzNDRH6
         btefZrP6NSt/0bEvi12BYXuxmHMMWv3p3A7/7SMBenPPjkXyNIoSYYCgHjatUF9ThxIf
         IdZZwScCjz1Uha7mGUWPdAofa/nY6OKdV2j6m5eGnr8mXMoPc3h69Xz1hHPC5bSa5K3f
         ZVdAhs3xSdgM7W3N3MAs2z8ko3+KoMmoM8GUQm5hqWbEHh2njKaP15QUJkGGRorO2Qvg
         vtlQ==
X-Gm-Message-State: AJIora8eCB87k4qNNRpe/iGWdcORZ/J5mkILgkNzVcqccy7IdiPfpYHC
        BTalSGGwY+4rH/QWcN89Pn+rfz9d07xf9AlfLNvyNCM=
X-Google-Smtp-Source: AGRyM1tkrAxFpfoMIxH0PbJoiLUINjCqjWEivZ+q6Sn1sRh5xGF3bNEed2rYfblgzJo6PSX+0+52r7vG2n2RseTE6HY=
X-Received: by 2002:a17:906:51c5:b0:711:f4ee:6574 with SMTP id
 v5-20020a17090651c500b00711f4ee6574mr19131637ejk.509.1655709034927; Mon, 20
 Jun 2022 00:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
 <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com> <YrAcTDCnEiipWEM3@hovoldconsulting.com>
In-Reply-To: <YrAcTDCnEiipWEM3@hovoldconsulting.com>
From:   Giles Roadnight <giles.roadnight@gmail.com>
Date:   Mon, 20 Jun 2022 08:10:22 +0100
Message-ID: <CAA0uCUZ10rCXctv0nnYD60ugK9WDFbmnvVSVwJ5Zc9hzfPVeGg@mail.gmail.com>
Subject: Re: Prolific Technology pl2303: unknown device type
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes thanks. The new kernel has not made it to the default raspberry pi
repos yet so doing apt upgrade does not fix it. I did find a tool that
does update the kernel in an "unsafe" way and that has fixed it for
me.
I know that raspberry pi OS and its versions and repositories are not
your concern as you work on the kernel but as a linux simpleton these
were the issues preventing me from getting the update!
Thanks for your response.

Giles Roadnight
http://giles.roadnight.name

On Mon, 20 Jun 2022 at 08:05, Johan Hovold <johan@kernel.org> wrote:
>
> On Sat, Jun 18, 2022 at 07:42:43AM +0100, Giles Roadnight wrote:
> > Hi
> >
> > I am trying to connect a Prolific pl2303 to my raspberry pi 4 running
> > raspberry pi os 64 bit. When I look at dmesg I get the following
> > output:
> >
> > [ 31.714397] cam-dummy-reg: disabling
> > [ 44.046197] usb 1-1.1: USB disconnect, device number 3
> > [ 47.254348] usb 1-1.1: new full-speed USB device number 4 using xhci_hcd
> > [ 47.361386] usb 1-1.1: New USB device found, idVendor=067b,
> > idProduct=23a3, bcdDevice= 6.05
> > [ 47.361402] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > [ 47.361407] usb 1-1.1: Product: USB-Serial Controller
> > [ 47.361412] usb 1-1.1: Manufacturer: Prolific Technology Inc.
> > [ 47.361417] usb 1-1.1: SerialNumber: ALBAb115819
> > [ 47.364081] pl2303 1-1.1:1.0: pl2303 converter detected
> > [ 47.364106] pl2303 1-1.1:1.0: unknown device type, please report to
> > linux-usb@vger.kernel.org
> >
> > so I followed the example and emailed this address!
> >
> > and with lsusb:
>
> This has been fixed in mainline and backported to the relevant stable
> trees (5.17.2, 5.16.19, 5.15.33) at the beginning of April.
>
> You didn't mention which kernel you use, but updating to a more recent
> one should fix this.
>
> Johan
