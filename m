Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620C555C5C7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239740AbiF0MIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 08:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238821AbiF0MIZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 08:08:25 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF1EBE2A
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:08:24 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 184so8891995pga.12
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06jPNAZfzAoGgQl8zbNvqdsYgxEmj2PgncyI+QMckww=;
        b=jNbUtmgWgbaqG1I8zhOW7EJd+LDRzF8lzb3MP1Teq9WYEDAPdJ03ZelH2VqOQAhOH9
         jJXlEoqQFChUZC5tV2ku2uipkRISCl7P3MfaoQr2HL6xG88maqXYNVzF+X+j26TEak55
         68w0+kLoYFAsvnM2ayEE2hp7EcQ4oEa2MIUMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06jPNAZfzAoGgQl8zbNvqdsYgxEmj2PgncyI+QMckww=;
        b=OKXB0n65gBdJ0ZT+FJMclslJxB5kKu6QMFarMIVXKLpoFL7RqXLLmsog+yBgJ/gpmO
         2CZyfrUsltr+yM49+M+Ym8x6SZQR0WdxAxbjWBddS97bD7dlGxQRHw65EFDvxDouqkeO
         BbhzrteeOHdBnGLADwrBZmf42XsEiTs8B7xkrDJiCyilkJjqmqZQoNlW4qxT+xonK+tt
         Hu3841Q4w9jbch/CWgZ19bGamkOwvi7guWKVSJV5KfLLkRfRe4Dy/Q3d7k/QFxjM0Wlq
         F+pgHCIViRxdlXNjx/yx+HwVflXBOvphc7aKPULf/Qi1qH7h4Y8otkcfTgKMlueXLUMK
         UVjA==
X-Gm-Message-State: AJIora82dYiFc19Hvqa3qeoJFyCshvi503sThfKryOvXuhjiXOw7z0Av
        MGIjw9Cn6sATJQwhEes/pRoHgAgxHsLSI06b49PIiQ==
X-Google-Smtp-Source: AGRyM1tn7CTUAGa8vxwDHEtcApJ0iPpY0zAFtVf+pIjjpIceKh16KQCYU3O27H9kS7acv6DSw/yGlZIFtxKnuuYHGfg=
X-Received: by 2002:a63:6ac3:0:b0:411:4aa9:9034 with SMTP id
 f186-20020a636ac3000000b004114aa99034mr699050pgc.94.1656331704192; Mon, 27
 Jun 2022 05:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
 <YrlacG25I8bZZ1VR@kroah.com> <CAOf5uw=X=y7BZZpdW-89orU=aL5oc01b19q7CvvQpXfOjm+m3Q@mail.gmail.com>
 <YrmYMO+u4EqSjTZ8@kroah.com>
In-Reply-To: <YrmYMO+u4EqSjTZ8@kroah.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 27 Jun 2022 14:08:12 +0200
Message-ID: <CAOf5uwki+0dhpXTXJxZr7KNOUDZx8UgrJSssRYzVVsUzsLhsTA@mail.gmail.com>
Subject: Re: f_hid GET_REPORT extension
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

On Mon, Jun 27, 2022 at 2:05 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 27, 2022 at 10:02:27AM +0200, Michael Nazzareno Trimarchi wrote:
> > Hi Greg
> >
> > On Mon, Jun 27, 2022 at 9:21 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 09:06:05AM +0200, Michael Nazzareno Trimarchi wrote:
> > > > Hi Felipe and Greg
> > > >
> > > > I'm starting to write some code to extend the GET_REPORT and let the
> > > > userspace on the device side to pre-fill the answer on this request.
> > > > Right now the answer is always 0. The idea is to create a sysfs
> > > > support to fill reports struct on report request on the host side.
> > > > This will help to
> > > > emulate devices that export features report for example. As far as I
> > > > understand the hidg side just use read and write and read is used to
> > > > extract
> > > > the result of SET_REPORT is that the gadget is properly configured. Is
> > > > it the right direction?
> > >
> > > Without code, it is very hard to understand what you are doing here,
> > > sorry.
> > >
> >
> > Agree, I need only a suggestion what is the best way to expose it
> >
> > > Also, why sysfs?
> >
> > Let me clarify this point. Right now the userspace manage the set_report
> >
> > static ssize_t f_hidg_read(struct file *file, char __user *buffer,
> >                            size_t count, loff_t *ptr)
> > {
> >         struct f_hidg *hidg = file->private_data;
> >
> >         if (hidg->use_out_ep)
> >                 return f_hidg_intout_read(file, buffer, count, ptr);
> >         else
> >                 return f_hidg_ssreport_read(file, buffer, count, ptr);
> > }
> >
> > The report can be write from usb side and read on gadget side if use_out_ep
> > is 0 (this is a configuration). Now, the answer to set_report is done
> > sync on request
> > and the usb message is buffered on the kernel side. During the
> > get_report as far I understand we should reply
> > the same way on bus. The idea is handle the type and report number and
> > find it on a list of report that must be prepared
> > on the gadget side. The hidg ops interface need to handle report
> > preparation so I was thinking in two solutions:
> > - sysfs kind of interface
> > - ioctl like interface
>
> sysfs is good for "one value per file", but not good for interactions
> where you have back/forth from userspace to the kernel.  ioctls are good
> for "do something in the kernel and get this value back" type of
> operation.  configfs is good for initializing data for something before
> you "finalize" it.  So it all depends on what your userspace
> interaction is going to be here as to what interface to use.
>
> prototype it and see what works.

Thank you for the explanation. I will prototype it

Michael

>
> greg k-h
