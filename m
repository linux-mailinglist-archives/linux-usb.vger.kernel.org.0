Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78CE715BD72
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 12:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729888AbgBMLMS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 06:12:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39154 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729544AbgBMLMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 06:12:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id c84so6211129wme.4
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 03:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HjbPZrEbtFmqBlxSEQ8uJW/5jdaC0VtLl/huovljPNk=;
        b=XvOWm20J8V2hJtzrfZP9BsSVOpuodtNgDW83ikwOXQBl1TJEaHj94NjxXPbANZznnn
         OGeoiFim/TK2WS9FCW6wBzogEtRGt/GftYzZYxRSO2j/4Z8PlHtExSFMfKeNvzb68q4s
         VHUvSQnHlzcXp9lIlZR0ciHcdLkOKKAb3r95vbLVJPBEKQdKAXNswuQ5kQ3eEYINkKYN
         RdA+VK/zmq0+7J2Gjh88EuIZhmEuQYsplNQEeumrTzXXenYqvwuSSYCHNM+6nTw9mAv6
         SIk8xIsuQtJMYYEPDWMZR7Cz4nLV0JJVzvcaRxen8iRwyIMMpITMHTk/EPimIERJXwGL
         RC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HjbPZrEbtFmqBlxSEQ8uJW/5jdaC0VtLl/huovljPNk=;
        b=HwnPkdi4QObgblGvDdP32QdJBkNAvdorFkuc4IHDeQ4SuWsLoO7nKlvXQZujZtxFbV
         Wsl0XgaKn7ls7lY2lLe7Ub1DcwzOqL6whl4KRrSwQu2sKLGywmxvv1oZNKDk6jz0YulP
         rydaPV/OfQcjT7lJqn8yNvIOhNm1h6FaQKgz6p4gTTsYvxgJKShRDcG0MaqrVeeQkwWA
         iVpzXPE9i9oqPRX4/DjtYbjdPSXbryYZvghC0bSZgYyyjUJduWI6IUPN93/mZ5hJdgnN
         z5YvbLnQs76d0CAKUvdEYBz1u+aBEj+IKms7SNUL5Ylys6i7vnQzIhQJBzc9F/TDOOOB
         /fxw==
X-Gm-Message-State: APjAAAVpcsJn4nFWFuNzBNIuh9vUnm5oWaREohgr+f3xgo3is3SIXaDS
        OVmQ77sgNfHQguuTBxhMaqAY1ysTP9cnrcdFWR28HA==
X-Google-Smtp-Source: APXvYqxrfIYPP1alv0HAEx19Rj2wPXEesEtdsffep7m+n7renjP/jG11icrYenbgM8sL3AwqLhoQFTxp1g29tBjw2Zk=
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr5174972wma.62.1581592332274;
 Thu, 13 Feb 2020 03:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20200211174126.GA29960@embeddedor> <CAMuHMdVZq3Lho0HxEvhv8di=OCBhvNEo=O198b1iayX_Wz_QcA@mail.gmail.com>
In-Reply-To: <CAMuHMdVZq3Lho0HxEvhv8di=OCBhvNEo=O198b1iayX_Wz_QcA@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 13 Feb 2020 11:11:59 +0000
Message-ID: <CAKv+Gu-eRn+H2xj=iYW8gqKRCWWzeOTbC=9W5nKae0ytq5NYGA@mail.gmail.com>
Subject: Re: [PATCH] treewide: Replace zero-length arrays with flexible-array member
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 Feb 2020 at 12:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Gustavo,
>
> On Tue, Feb 11, 2020 at 10:49 PM Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> > The current codebase makes use of the zero-length array language
> > extension to the C90 standard, but the preferred mechanism to declare
> > variable-length types such as these ones is a flexible array member[1][2],
> > introduced in C99:
> >
> > struct foo {
> >         int stuff;
> >         struct boo array[];
> > };
> >
> > By making use of the mechanism above, we will get a compiler warning
> > in case the flexible array does not occur last in the structure, which
> > will help us prevent some kind of undefined behavior bugs from being
> > unadvertenly introduced[3] to the codebase from now on.
> >
> > All these instances of code were found with the help of the following
> > Coccinelle script:
> >
> > @@
> > identifier S, member, array;
> > type T1, T2;
> > @@
> >
> > struct S {
> >   ...
> >   T1 member;
> >   T2 array[
> > - 0
> >   ];
> > };
>
> I've stumbled across one more in include/uapi/linux/usb/ch9.h:
>
>     struct usb_key_descriptor {
>             __u8  bLength;
>             __u8  bDescriptorType;
>
>             __u8  tTKID[3];
>             __u8  bReserved;
>             __u8  bKeyData[0];
>     } __attribute__((packed));
>
> And it seems people are (ab)using one-sized arrays for flexible arrays, too:
>
>     struct usb_string_descriptor {
>             __u8  bLength;
>             __u8  bDescriptorType;
>
>             __le16 wData[1];                /* UTF-16LE encoded */
>     } __attribute__ ((packed));
>
> As this is UAPI, we have to be careful for regressions, though.
>

These were probably taken straight from the specification. The [1]
trick is used a lot in the UEFI specification as well, for instance.
