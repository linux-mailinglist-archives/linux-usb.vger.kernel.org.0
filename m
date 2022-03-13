Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117F04D7877
	for <lists+linux-usb@lfdr.de>; Sun, 13 Mar 2022 22:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbiCMVpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Mar 2022 17:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiCMVpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Mar 2022 17:45:51 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8239D47559
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 14:44:41 -0700 (PDT)
Date:   Sun, 13 Mar 2022 21:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1647207877;
        bh=jE8I87acYvfUCVQGGBgOyDXoB9kr/X6s8MJ1AzlD6Cc=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=OQWk5m3pEWgtauTrJ19hF7z1tozRztxD1pxmV2ZMOTZ9CLTyMsQ5QQxTxjZEln8RY
         SkYD8yTkbH0Oe2oe9oVdIXRdFGRWLU4aq06yMsliZDiN7aS9/uVTwPTKPCIHoYZzE4
         Uc8cgJNAvyE/r+vxSwrQgRzQ1eLGCj2YW8FKS22MuPNbSVYvFDI9GHvPqtKJi3zIU7
         cZuA+eGAVVJpjHRCEB40Yz4o05exb/fsM1DE4G/LduFL6Sb0av48OlOK0Ivj+ESx5z
         9IdqZEKsiPtXr+912we1vX/KPl9EgbOGflxY6hH6nAr6Cz+vPRAK+LF1bgs3+HU7Zz
         5LwP6qYG3tDyg==
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
From:   micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Reply-To: micklorain <micklorain@protonmail.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <pVZSQtquqT8_tNfgSacEQWJO4agPMHUT5gF3FkkWuJ3LERhq0JswT2y22oDz7Jvn_Vz28uA8rS2SAfJbPwq3EEQi2Vb-zySZdBozgVdR308=@protonmail.com>
In-Reply-To: <YijoMAZJ1elUfZnh@smile.fi.intel.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com> <Yh03mFSESvwT8Wt0@smile.fi.intel.com> <GCkSeDmZAyagb-3ogwNAwxsKYpxXSQRM6HeO_O9WxSYO1-8WL8ook5WQ9JchpyBqo4SIJ2XuW2DWFJeJrCzqzcedaBjNvfjNLZo1j3hU5tc=@protonmail.com> <YijoMAZJ1elUfZnh@smile.fi.intel.com>
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

Hello,

On Wednesday, March 9th, 2022 at 18:47, andriy.shevchenko@linux.intel.com <=
andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Mar 06, 2022 at 04:09:49PM +0000, micklorain wrote:
>
> > On Monday, February 28th, 2022 at 21:59, andriy.shevchenko@linux.intel.=
com andriy.shevchenko@linux.intel.com wrote:
> >
> > > On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:
>
> ...
>
> > > Last time I have got something similar it becomes that PCI bridge whi=
ch is used
> > >
> > > to connect USB controller to the PCI Root Bridge was not capable of M=
SI, while
> > >
> > > advertising that capability. I.o.w. HW bug.
> > >
> > > To understand if it's something similar, please run (under the root) =
each of
> > >
> > > the following commands:
> > >
> > > lspci -nk -vvv
> > >
> > > cat /proc/interrupts
> > >
> > > in both cases, i.e. working and non-working.
> > >
> > > And then share the output (all 4 files).
>
> > Thanks for your reply.
> >
> > This is the results of the commands you requested :
> >
> > * When things work (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60 wit=
h commit 306c54d0edb6ba94d39877524dddebaad7770cf2 reverted)
> >
> > - lspci -nk -vvv :
> >
> > https://paste.debian.net/hidden/77d92dc9/
> >
> > - cat /proc/interrupts
> >
> > https://paste.debian.net/hidden/67208c8e/
> >
> > * When things are broken (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b=
60)
> >
> > - lspci -nk -vvv :
> >
> > https://paste.debian.net/hidden/121362b3/
> >
> > - cat /proc/interrupts :
> >
> > https://paste.debian.net/hidden/dbe8d1bb/
> >
> > Hope this can help.
>
> Thank you for sharing. Are you able to compile a kernel and boot it? If s=
o,
>
> can you try the following patch?

I tried the patch, but it didn't help...

>
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>
> index 65f7f6b0576c..149742aa5f4d 100644
>
> --- a/drivers/pci/quirks.c
>
> +++ b/drivers/pci/quirks.c
>
> @@ -3041,6 +3041,13 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_BROADCOM,
>
> PCI_DEVICE_ID_TIGON3_5715S,
>
> quirk_msi_intx_disable_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4386, quirk_msi_intx_disabl=
e_ati_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4387, quirk_msi_intx_disabl=
e_ati_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4388, quirk_msi_intx_disabl=
e_ati_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4389, quirk_msi_intx_disabl=
e_ati_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438a, quirk_msi_intx_disabl=
e_ati_bug);
>
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438b, quirk_msi_intx_disabl=
e_ati_bug);
>
> +
>
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4390,
>
> quirk_msi_intx_disable_ati_bug);
>
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4391,
>
> In case it doesn't help, remove 'ati_' part from the function name and tr=
y again.

... but removing 'ati_' from the function name indeed fixed my issue.

Will this fix be upstreamed now ?

Thank you very much for your help.

Mick Lorain
