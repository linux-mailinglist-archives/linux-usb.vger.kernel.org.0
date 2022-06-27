Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F4255C981
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbiF0MI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 08:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240409AbiF0MHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 08:07:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4D0F2C
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:05:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2481D61506
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B32C3411D;
        Mon, 27 Jun 2022 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656331556;
        bh=67Ik/eoZyJhS4eBAvMTvEKN7fzs6K6+e5ThzPYKP6E8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YKBPjpLNmgzfGN4jLiBJCgfjCdGHGsXDDq+A3qCBepae9zbc6mOY3mr9U1DbdM1AR
         ENFacF4IrU0GjGasW62YqHBf5dVRgQIl7SFTcbZrTzSHjvVEbFjG/uFfij602T1fkB
         eziPNjLqh/dASBe4VXHXECmLymwq7yUcSrHZPYds=
Date:   Mon, 27 Jun 2022 13:44:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: f_hid GET_REPORT extension
Message-ID: <YrmYMO+u4EqSjTZ8@kroah.com>
References: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
 <YrlacG25I8bZZ1VR@kroah.com>
 <CAOf5uw=X=y7BZZpdW-89orU=aL5oc01b19q7CvvQpXfOjm+m3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOf5uw=X=y7BZZpdW-89orU=aL5oc01b19q7CvvQpXfOjm+m3Q@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 27, 2022 at 10:02:27AM +0200, Michael Nazzareno Trimarchi wrote:
> Hi Greg
> 
> On Mon, Jun 27, 2022 at 9:21 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jun 27, 2022 at 09:06:05AM +0200, Michael Nazzareno Trimarchi wrote:
> > > Hi Felipe and Greg
> > >
> > > I'm starting to write some code to extend the GET_REPORT and let the
> > > userspace on the device side to pre-fill the answer on this request.
> > > Right now the answer is always 0. The idea is to create a sysfs
> > > support to fill reports struct on report request on the host side.
> > > This will help to
> > > emulate devices that export features report for example. As far as I
> > > understand the hidg side just use read and write and read is used to
> > > extract
> > > the result of SET_REPORT is that the gadget is properly configured. Is
> > > it the right direction?
> >
> > Without code, it is very hard to understand what you are doing here,
> > sorry.
> >
> 
> Agree, I need only a suggestion what is the best way to expose it
> 
> > Also, why sysfs?
> 
> Let me clarify this point. Right now the userspace manage the set_report
> 
> static ssize_t f_hidg_read(struct file *file, char __user *buffer,
>                            size_t count, loff_t *ptr)
> {
>         struct f_hidg *hidg = file->private_data;
> 
>         if (hidg->use_out_ep)
>                 return f_hidg_intout_read(file, buffer, count, ptr);
>         else
>                 return f_hidg_ssreport_read(file, buffer, count, ptr);
> }
> 
> The report can be write from usb side and read on gadget side if use_out_ep
> is 0 (this is a configuration). Now, the answer to set_report is done
> sync on request
> and the usb message is buffered on the kernel side. During the
> get_report as far I understand we should reply
> the same way on bus. The idea is handle the type and report number and
> find it on a list of report that must be prepared
> on the gadget side. The hidg ops interface need to handle report
> preparation so I was thinking in two solutions:
> - sysfs kind of interface
> - ioctl like interface

sysfs is good for "one value per file", but not good for interactions
where you have back/forth from userspace to the kernel.  ioctls are good
for "do something in the kernel and get this value back" type of
operation.  configfs is good for initializing data for something before
you "finalize" it.  So it all depends on what your userspace
interaction is going to be here as to what interface to use.

prototype it and see what works.

greg k-h
