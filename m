Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778684CEC32
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 17:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbiCFQKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 11:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiCFQKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 11:10:50 -0500
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25BAFD23
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 08:09:56 -0800 (PST)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4KBRPb1LFNz4xQ95
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 16:09:55 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
        dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l66YgoUw"
Date:   Sun, 06 Mar 2022 16:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1646582990;
        bh=QUOJwC+A9V07d3DFaD6t61oC9Dik2Q4ioYUQDnLR7s0=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=l66YgoUw8phyMwLd26lwPX+DLo02S2DcXcoavS8sbhv4vEBUSKGiPr+3TEUUeRKs7
         SZsj4fFqv7WabNopS02DbyHVqEfveOILvFn2tI1qazSbb86t6IxrEiWIHzPEmmbkOC
         N3oFf9RMjdTsHQ1y3G2/x+2uwOwk3DQLpkGeUM9Mbn1yQ4JbSpH4aGDb8Ll7C+lAbt
         vyPeEQUowlkgfRJsQ/hyfeE6fQreBl3yYo6WgUhgM6I7ds6QR2Ds01IFWv6EWer4cK
         08Io5ki3aofe49+vGU7nShqj6RLuIwwNEZEhyokgSD0N/yNHg+9vnyEPJqmXZ4oqmX
         bolos8z3LNQ9g==
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
From:   micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Reply-To: micklorain <micklorain@protonmail.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <GCkSeDmZAyagb-3ogwNAwxsKYpxXSQRM6HeO_O9WxSYO1-8WL8ook5WQ9JchpyBqo4SIJ2XuW2DWFJeJrCzqzcedaBjNvfjNLZo1j3hU5tc=@protonmail.com>
In-Reply-To: <Yh03mFSESvwT8Wt0@smile.fi.intel.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com> <Yh03mFSESvwT8Wt0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

------- Original Message -------

On Monday, February 28th, 2022 at 21:59, andriy.shevchenko@linux.intel.com =
<andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:
>
> > Hi,
> >
> > This patch breaks USB for me. I noticed when I upgraded from debian's 4=
.19.0-18 (working) to 5.10.0-10 (broken). I git bisect'ed until I found tha=
t this patch is the culprit. Upstream 5.17.0-rc2 is still broken, but 5.17.=
0-rc2 with this patch reverted works.
> >
> > lsusb when things work :
> >
> > https://paste.debian.net/hidden/2a964425/
> >
> > lsusb when things are broken :
> >
> > https://paste.debian.net/hidden/0376920c/
> >
> > dmesg when things are broken :
> >
> > https://paste.debian.net/hidden/780ca112/
> >
> > dmesg when things work :
> >
> > https://paste.debian.net/hidden/4d1bfc0f/
> >
> > Let me know if you need anything else from me.
>
> Thanks for your report!
>
> Last time I have got something similar it becomes that PCI bridge which i=
s used
>
> to connect USB controller to the PCI Root Bridge was not capable of MSI, =
while
>
> advertising that capability. I.o.w. HW bug.
>
> To understand if it's something similar, please run (under the root) each=
 of
>
> the following commands:
>
> lspci -nk -vvv
>
> cat /proc/interrupts
>
> in both cases, i.e. working and non-working.
>
> And then share the output (all 4 files).
>
> --
>
> With Best Regards,
>
> Andy Shevchenko

Hi,

Thanks for your reply.
This is the results of the commands you requested :

* When things work (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60 with co=
mmit 306c54d0edb6ba94d39877524dddebaad7770cf2 reverted)
- lspci -nk -vvv :
https://paste.debian.net/hidden/77d92dc9/

- cat /proc/interrupts
https://paste.debian.net/hidden/67208c8e/

* When things are broken (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60)
- lspci -nk -vvv :
https://paste.debian.net/hidden/121362b3/

- cat /proc/interrupts :
https://paste.debian.net/hidden/dbe8d1bb/

Hope this can help.

Thanks.
Mick Lorain
