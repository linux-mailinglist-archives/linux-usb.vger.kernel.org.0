Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1815E38A62
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfFGMdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:33:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39100 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbfFGMdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 08:33:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so1112661pgc.6
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yzfzuxxN68URcGuNxLd40CHOzj5HNVqY8UELj1alXww=;
        b=XwgtVpWcUtxwG98gJKU47A/uSAKltkPFy2tA0ztGhP5E5q9AR5wla74Kh+zJL14ugL
         KuImIXi7UhJK6f4sqz9xfVN9wAva/GWk0+n23bERZZ7L9uV8COVIXucQdgXV/x+QegrG
         25lia7yElEX1qR6XVq0q3bF+LBrTOHUcWZCTOBzrCWZLk8+63nYuN7ZH350xiDOjpFyL
         9nlmpEq8/+ZCaQwBMikheOKujEEzb9KGG21p6s7kL20BpiuhafzDILycvJ6mLDj6M66g
         Uxzh0FpySi9xfp6NEmStPp9KwPp6TzTjBxJGrN9thtyS1MvotanWj6awKrykGHJ3DPtd
         5o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzfzuxxN68URcGuNxLd40CHOzj5HNVqY8UELj1alXww=;
        b=eC8l+jomtT1mx9vILhB4QwbJFNnkQoNUZJ1UA0TjUebrCOfCey1NAEArgpFimzpzWh
         PcHV60tHrEtTNjlst6ywgBbtF3qKaK6CBPJ7Tkd1sMBfk8eO7OpJxsZQPwVp1Zyc4wIp
         XW9CdEGXODYDP2l5wP9YD1wxJLp0xbq+1/fvyf9VsmgVrTTxnwVSN9JiPj+ZLOxsaUti
         mYHAoFE90nttJaH0YDabdazS9PwrF6EN8PDzAfoN5GthkcmsztlmStzGY/nZPXZWwn7s
         pk3D0lXqKgxBu4GqarmSxMLmaK+UKlowFz8X2rcaXlCKkJgKMGi8PUsPJDiAPgY9y3xP
         iWOA==
X-Gm-Message-State: APjAAAUyy7fCjhm1vLsuk22K0T1PE3TJX07bsC8MgoRh3YY21fgaY2Dc
        upp2CkJNMfMcwCnB6zL4SNk/tnVoks51jKJVCepgng==
X-Google-Smtp-Source: APXvYqy3O7TOJLddE/sqG/Ncg0Oh/0coZ/84vIb+d8B8x2rIe1cMa/jMrm4FoD5psspgnhZQH/UJ5TClul/yce+GJ08=
X-Received: by 2002:a62:1c91:: with SMTP id c139mr50495383pfc.25.1559910782846;
 Fri, 07 Jun 2019 05:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
 <877e9xd2nx.fsf@linux.intel.com> <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com>
 <874l51d1l3.fsf@linux.intel.com>
In-Reply-To: <874l51d1l3.fsf@linux.intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 14:32:51 +0200
Message-ID: <CAAeHK+x-6Xgefkj1279rSGru4u6jSkZ6Tm_3h9eeqzJ6xUnfgA@mail.gmail.com>
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

On Fri, Jun 7, 2019 at 2:25 PM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
>
> Hi,
>
> Andrey Konovalov <andreyknvl@google.com> writes:
> >> Andrey Konovalov <andreyknvl@google.com> writes:
> >> > I've noticed that when the host performs a control request,
> >> > urb->transfer_buffer/transfer_buffer_length are not passed to the
> >> > gadget drivers via the setup() call, the only thing that is passed is
> >> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> >> > from within a gadget driver? If not, what approach would the best to
> >> > implement this?
> >>
> >> I think you need to further explain what you mean here.
> >>
> >> What do you mean by gadget driver in this case?
> >>
> >> If you mean the drivers under drivers/usb/gadget/{function,legacy}
> >> directories then there's no way that they can have access to anything
> >> from the host.
> >>
> >> Remember that gadget and host are two completely distinct units. The
> >> only thing they share is a USB cable. When it comes to Control
> >> Transfers, if a data stage is necessary, that must be encoded in the
> >> wLength field of the control structure.
> >>
> >> Also, host side does *not* pass its usb_ctrlrequest struct to the
> >> gadget, it passes a series of 8 bytes which are oblivious to where in
> >> memory they were from the host point of view.
> >>
> >> If if you have the same machine acting as both host and device, each
> >> side has no knowledge of that fact.
> >
> > Hi Felipe,
> >
> > What I meant is that any module (gadget driver) that implements
> > usb_gadget_driver struct callbacks and registers it, will only get
> > usb_ctrlrequest through the setup() callback, but not the
> > transfer_buffer/length.
>
> A control request is *always* 8 bytes. That's mandated by the USB
> specification.
>
> > And therefore it can't access the data that is
> > attached to a control request.
>
> There is no data attached to a control request. A Control Transfer is
> composed of 2 or 3 stages:
>
> - SETUP stage
>         an 8 byte transfer descriptor type thing
>
> - (optional) Data stage
>         if wLength of control request contains a value > 0, then this
>         stage fires up to transfer the amount of data communicated in
>         wLength (during previous stage).
>
> - Status Stage
>         A zero length transfer to communicate successful end of transfer
>         (in case it completes fine) or an error (in case of STALL
>         condition).

Hm, then why does the usb_control_msg() function accepts a data and
size arguments? Which are described in the comment as "pointer to the
data to send" and "length in bytes of the data to send" accordingly?
Or is this the buffer for the response?

>
> > I've faced this with a custom implementation of a gadget driver module
> > while using the dummy_hcd module, but I AFAIU it's not relevant to
> > those two, but rather to the whole gadget subsystem.
>
> What is this custom gadget doing? Which kernel version are you using?
> What error are you facing? Could it be that you misunderstood how USB
> works?

The details are here: https://www.spinics.net/lists/linux-usb/msg179158.html

But my question is not related to that custom gadget.

>
> Best regards
>
> --
> balbi
