Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A1B4D7884
	for <lists+linux-usb@lfdr.de>; Sun, 13 Mar 2022 22:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235525AbiCMVzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Mar 2022 17:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiCMVzI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Mar 2022 17:55:08 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6753915A16
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 14:54:00 -0700 (PDT)
Date:   Sun, 13 Mar 2022 21:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1647208436;
        bh=CWiy5Iy4sY8ijezS7geyEPEVE0V9xlZRML2FVU4VTCw=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=tMcSb7oP88fHQsbGXv9Oxl67cHvLELFcTRHraZfQiISaMRURr21h6t3ndSX1NOY75
         pcimQ+qk3kl0rgD0q2jy60f3XazPIOiweEcYcnOaoJoGTp7sJhXOG13pRqLGkU/65C
         h4Uxibpactwf/uGHdxDgxS4zGXSjj1ek/yoZ1CQZJ7EDIiuwUcDdlex1w9FWZZcjfM
         7D0Nup1PXy4qnxsMzQSKvo+AHzIviAQqVDXdcAQgMwqkxrh+cY/L76nVW6lIuHH6Bc
         wOfzDaIANOum8EyS3Lv95GQ8zlnZM6CAfj17M54zgaFBf37/37i5oQ+UmpOu2hhyzR
         /gmzgpiEDicsw==
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From:   micklorain <micklorain@protonmail.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Reply-To: micklorain <micklorain@protonmail.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <B-JSIrXmPNRjtsNvWoMqiYRmsf0xlANSpMWrBUjjSCZwzi-ImpPNSeqsfOXZf4rkMiUR8JiQvEffx59Eu4NZKVJ7Z3mGtuPXomhd9AyV7sI=@protonmail.com>
In-Reply-To: <Yh0wIGmoCjzKPTej@kroah.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com> <Yh0wIGmoCjzKPTej@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Thanks for taking the time to reply.

------- Original Message -------

On Monday, February 28th, 2022 at 21:27, gregkh@linuxfoundation.org <gregkh=
@linuxfoundation.org> wrote:

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
>
> This dmesg says:
>
> [ 1.049161] PCI: Using host bridge windows from ACPI; if necessary, use "=
pci=3Dnocrs" and report a bug
>
> have you tried that?

I tried to use "pci=3Dnocrs", but it didn't help.

>
> > dmesg when things work :
> >
> > https://paste.debian.net/hidden/4d1bfc0f/
>
> The messages here look different for PCI, can you diff them?
>
> I see:
>
> [ 0.342113] PCI: PCI BIOS area is rw and x. Use pci=3Dnobios if you want =
it NX.
>
> [ 0.342178] PCI: PCI BIOS revision 3.00 entry at 0xf0031, last bus=3D3
>
> [ 0.342180] PCI: Using configuration type 1 for base access
>
> That's not in the "failing" system, are you sure that's the only change
>
> here?

Sorry, my email wasn't very clear, I gave the dmesg for two very different =
kernel versions.

But anyway, it doesn't really matter since Andriy Shevchenko found the prob=
lem.

Again, thank you for your time.

Mick Lorain


