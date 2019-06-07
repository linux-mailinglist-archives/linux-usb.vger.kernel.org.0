Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63ECB389F7
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbfFGMOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:14:52 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:42380 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfFGMOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 08:14:51 -0400
Received: by mail-pf1-f182.google.com with SMTP id q10so1086380pff.9
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIRZ0yASylMhzQubMKFMRQwVCTv44FnWps2nTeX9GRo=;
        b=ndNFAQyvTaQJI9S82LGFVxjDjz5z8j+s0HGUOlzDMZBz1TE6Mjhbh1wAsOp0h7I6Rp
         +AjicOGEAfpdqTLt4eXClvu5Ntt8sqzZ20Q8MNT0B9ZK7BssTtyteosOllv6/mb9Ign7
         mJw6snct/AQIByAFdsuH4oNpn3wZRfiMUcp47FHEu+ret2GKxZkf/jzD2iIAlux1Ga1K
         1Q4FNwy6Sg4o/PBPrb89hNNP+r+FP+l/EGOr+3esJ6KKY2agcJNZnJDCweiQ+T8gjRiD
         RtTcr1wn1r1WB7FfztwiLhBQt3SQYKgHY+LPKlZZM0td+3RQx7Puwv2WD8vbya3kWTB0
         7u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIRZ0yASylMhzQubMKFMRQwVCTv44FnWps2nTeX9GRo=;
        b=AL73wh6mg/9YzeU4xW9jAptu3l/oLzmPQ1JrKnYvVeabX7UP6iA9ZQ4dKGS26M4fKw
         Lxpx3Xa+HfmtETk6dQLfnAGoVwf4Fa8XqSDzGEyhgkE7QXDUJaD3qodLCm2rT+jRvyrB
         SjK0/zp/N8p/By6jDfcjCv/zH8/B2KBnLsV2LKNSYW4y5ZxEGJAP+ekwxeqHca8WNsMX
         tKxbHew/z6GxbvfUxsL2rxNPJFmuEPkvl7xLAB+mmjP6wBwst3CaUR1zJSDGfLdRXsws
         2mxLQ657eFnbkVqe4itsqqjjtU/zp3jj+jsEW6T7jzJ8JPHA09x/Ejn+CAX56FLXHolF
         M2IA==
X-Gm-Message-State: APjAAAUESxymbqotXqw/86wSJidZ4MUuVSAguRQ8j6F1n50ue/lOJoEE
        IZMh1MFvgUSnwD43JD/bnZTgstPw4xx4z0K+VSjyeeqWtZbpcQ==
X-Google-Smtp-Source: APXvYqxicjuaikNek3BVniZ33E56kcJPtsWYrnEM4Ljyd3OfH5TkyGPcgQfgs2zGcLGCX/uvzuIoXovJayBkDmJxjiQ=
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr5073865pjn.129.1559909690797;
 Fri, 07 Jun 2019 05:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
 <877e9xd2nx.fsf@linux.intel.com>
In-Reply-To: <877e9xd2nx.fsf@linux.intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 14:14:39 +0200
Message-ID: <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 7, 2019 at 2:02 PM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
>
> Hi,
>
> Andrey Konovalov <andreyknvl@google.com> writes:
> > I've noticed that when the host performs a control request,
> > urb->transfer_buffer/transfer_buffer_length are not passed to the
> > gadget drivers via the setup() call, the only thing that is passed is
> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> > from within a gadget driver? If not, what approach would the best to
> > implement this?
>
> I think you need to further explain what you mean here.
>
> What do you mean by gadget driver in this case?
>
> If you mean the drivers under drivers/usb/gadget/{function,legacy}
> directories then there's no way that they can have access to anything
> from the host.
>
> Remember that gadget and host are two completely distinct units. The
> only thing they share is a USB cable. When it comes to Control
> Transfers, if a data stage is necessary, that must be encoded in the
> wLength field of the control structure.
>
> Also, host side does *not* pass its usb_ctrlrequest struct to the
> gadget, it passes a series of 8 bytes which are oblivious to where in
> memory they were from the host point of view.
>
> If if you have the same machine acting as both host and device, each
> side has no knowledge of that fact.

Hi Felipe,

What I meant is that any module (gadget driver) that implements
usb_gadget_driver struct callbacks and registers it, will only get
usb_ctrlrequest through the setup() callback, but not the
transfer_buffer/length. And therefore it can't access the data that is
attached to a control request.

I've faced this with a custom implementation of a gadget driver module
while using the dummy_hcd module, but I AFAIU it's not relevant to
those two, but rather to the whole gadget subsystem.

Thanks!

>
> --
> balbi
