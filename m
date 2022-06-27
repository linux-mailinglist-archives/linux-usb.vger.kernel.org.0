Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4955C7EF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiF0ICz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 04:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbiF0ICt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 04:02:49 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22FB219E
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 01:02:39 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d5so7437394plo.12
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9ZhIgUUmsDiTy1D6RsSS6DjCwopLYM2je5TrJXuLs0=;
        b=ld8kUiYomFxvXk5s54yQmCoo3n9AMf7RE/Iu7+6QFv2JiE/ytuZ8vuREpIxmd5OiqP
         pSxYrTsZ6366kdB4+7WwBmSCDUUqImazJhzLc8nBP6lZPYYl05UrJZW0NjY+9Y8GvWK1
         scrl9aVX38HREnsQsk/FKoSRmJomB9UWNKKpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9ZhIgUUmsDiTy1D6RsSS6DjCwopLYM2je5TrJXuLs0=;
        b=OLUeZIdrjYAsMVgM1R0Q1MSVDesWR1sJh6AWyLEB5cClewcbRIT/SO4yU8jiuSrSSU
         SERYz16moG9Wn5wzNL6BEQ5G0L32TunL1GjcjoRcuqWE8GKU+QrKmmDSnywn3IQdbDkz
         VJUzwJ+hAiFkhHrdOfdD/LMzL2ISyu/ez2jLTT76s9D2OqPxYE34bTf2sVCy2XEKzhLA
         mNpdnbejWfAAc9/Uz8Vw6d1cl/p1J/P92pgCaKroil8ZUX5kFAfRfm2uY4in+GX9dXQI
         uiBnC1qG3o3TbIKOWIeGjvuYHqtXl4QnJg7lVDJoHfX/2IPzAy5ZVJ7S8Hu32df7+Y4K
         +DiQ==
X-Gm-Message-State: AJIora/wTE+RCY6fbFRHzEqRRad/XYKVWHnt4qsf5rHfIb3Uhtw/5Akv
        TonUNKbo9ikJ0SNlo6hGnYzga9bstGc8KHJyDqeSz01NJd6QqA==
X-Google-Smtp-Source: AGRyM1sG2yZxivB0dfIEyo6536JIF3Z0n/ms9dkOq/dB6dUo/5ydBENbI/9MxkHfnfrz+78QFoHU9KF1x1VeX3tWtIw=
X-Received: by 2002:a17:903:22cc:b0:16a:612e:7962 with SMTP id
 y12-20020a17090322cc00b0016a612e7962mr13280170plg.134.1656316959290; Mon, 27
 Jun 2022 01:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
 <YrlacG25I8bZZ1VR@kroah.com>
In-Reply-To: <YrlacG25I8bZZ1VR@kroah.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 27 Jun 2022 10:02:27 +0200
Message-ID: <CAOf5uw=X=y7BZZpdW-89orU=aL5oc01b19q7CvvQpXfOjm+m3Q@mail.gmail.com>
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

On Mon, Jun 27, 2022 at 9:21 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 27, 2022 at 09:06:05AM +0200, Michael Nazzareno Trimarchi wrote:
> > Hi Felipe and Greg
> >
> > I'm starting to write some code to extend the GET_REPORT and let the
> > userspace on the device side to pre-fill the answer on this request.
> > Right now the answer is always 0. The idea is to create a sysfs
> > support to fill reports struct on report request on the host side.
> > This will help to
> > emulate devices that export features report for example. As far as I
> > understand the hidg side just use read and write and read is used to
> > extract
> > the result of SET_REPORT is that the gadget is properly configured. Is
> > it the right direction?
>
> Without code, it is very hard to understand what you are doing here,
> sorry.
>

Agree, I need only a suggestion what is the best way to expose it

> Also, why sysfs?

Let me clarify this point. Right now the userspace manage the set_report

static ssize_t f_hidg_read(struct file *file, char __user *buffer,
                           size_t count, loff_t *ptr)
{
        struct f_hidg *hidg = file->private_data;

        if (hidg->use_out_ep)
                return f_hidg_intout_read(file, buffer, count, ptr);
        else
                return f_hidg_ssreport_read(file, buffer, count, ptr);
}

The report can be write from usb side and read on gadget side if use_out_ep
is 0 (this is a configuration). Now, the answer to set_report is done
sync on request
and the usb message is buffered on the kernel side. During the
get_report as far I understand we should reply
the same way on bus. The idea is handle the type and report number and
find it on a list of report that must be prepared
on the gadget side. The hidg ops interface need to handle report
preparation so I was thinking in two solutions:
- sysfs kind of interface
- ioctl like interface

Michael

>
> thanks,
>
> greg k-h
