Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F274C211232
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 19:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732800AbgGARvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 13:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgGARvm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 13:51:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354C3C08C5C1
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 10:51:42 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id p20so25827883ejd.13
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwOQ5aHEcC3Jyc/Qh2jDAhoCcHWl56+r+PeIpM17vNM=;
        b=Gzzdife9D1K3w/YC8VoeMV3F7faZp2S073RRj6rWZ7iGodzqo9wNfMZ+ZbofuWV8R2
         RgLoK4ZjtPnwX97ZQ0w4WV7sU+uiopcnn9Dq3pfQRL3HK1pC6hatn5VQEHaghgXgjz05
         UIq6siPwpJhpxRuuqIrmKxxIAFSilQ22RUyNoNX2O2HQ9uDVnra90Eve2ztP5ZrCuLCr
         5ZtNq1mvkBCRVzsx5e3L20bI86DzzRaQrCMItWvJZHKWCQYZg08GeBAFJhoyUmqcvC3o
         QmXjUvR979/Tk7lxSFQixOF040MKApj5l+G5E6lRQRxJ6UfvBgpHOX9ATfxx6KUgkalN
         QjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwOQ5aHEcC3Jyc/Qh2jDAhoCcHWl56+r+PeIpM17vNM=;
        b=hczm+MMkWyeKBHeni+1iLCFWhrgwVQN7ZlgdOd9Qt1esCjF5CK7rG0t7dgF5zPLb4+
         eCR7b0d4N1cYnmE8kqt+aYtonQmOFqSBXbfoiSdRKcbMvLA2LYgWAzxj4PTBDKcnQIsO
         opSkk9UEuI5bvJ1SuY0i1u5BTs5XF7Tf8Xlpw2fSNGGG1DrIIogRW8uGlyG2H850996I
         xSBBTU8WVMWkf2ixlNFCeOlSGmMtF+dNq6GO4HQhR8XgEabUiLMuYM9uEXFUyNoYnEFq
         yg9IHc6M8fpdczaQdKz7jqmoDMMkWXoXO+TK8a4xwlvcfLNuQch7HGcd3VH8Xrm6YI1j
         cgCg==
X-Gm-Message-State: AOAM532DgRzV/irbhjBephiyFPUChfTtySqvi4MwYl3/wEL3oQtQMeCR
        NxPylTIYtKukzqiXL7gGnl4=
X-Google-Smtp-Source: ABdhPJziXQhKIcl9aBErV7qKXrcBHePnY2FgWFZngHK4DoRB3HBXt0eWB5MLwh5Yr0AMzVp515wUXg==
X-Received: by 2002:a17:906:2c53:: with SMTP id f19mr21929465ejh.523.1593625900803;
        Wed, 01 Jul 2020 10:51:40 -0700 (PDT)
Received: from ping (x4dbf847f.dyn.telefonica.de. [77.191.132.127])
        by smtp.gmail.com with ESMTPSA id v24sm5049637eja.29.2020.07.01.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 10:51:40 -0700 (PDT)
Date:   Wed, 1 Jul 2020 19:51:38 +0200
From:   Fabian Melzow <fabian.melzow@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD
 ep_index 4 comp_code 1
Message-ID: <20200701195138.21940697@ping>
In-Reply-To: <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
References: <20200620211913.1535bac0@ping>
        <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
        <20200630185803.2a72c123@ping>
        <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Tue, 30 Jun 2020 22:03:29 +0300
schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:

> On 30.6.2020 19.58, Fabian Melzow wrote:

> > I successful applied the patch against Linux 5.7.4, but get this
> > error when compiling drivers/usb/host/xhci-ring.c:
> >=20
> >   CC [M]  drivers/usb/host/xhci-ring.o
> > drivers/usb/host/xhci-ring.c: In function =E2=80=98xhci_handle_cmd_stop=
_ep=E2=80=99:
> > drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of
> > function =E2=80=98xhci_reset_halted_ep=E2=80=99
> > [-Werror=3Dimplicit-function-declaration] 857 |
> > xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type); |
> > ^~~~~~~~~~~~~~~~~~~~=20
>=20
> Right, forgot that you need another patch before this.

Applied it and after recompiling I get:

Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Get port status 5-1 rea=
d: 0x2a0, return 0x100
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stag=
e event
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq P=
tr cmd, deq =3D @fedf51f0
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep compl=
etion code of 1
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 0000000096=
cbf5fe, len =3D 0, expected =3D 4, status =3D -32
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new=
 deq seg =3D 00000000a8c5372f (0xfedf5000 dma), new deq ptr =3D 00000000037=
c6b7a (0xfedf51f0 dma), new cycle =3D 1
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue st=
ate
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer =3D=
 0xfedf51f0 (DMA)
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment =3D=
 00000000a8c5372f (virtual)
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cycle state =3D 0x1
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled end=
point ring
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for sl=
ot 1 ep 0
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq P=
tr cmd, deq =3D @fedf51c0
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new=
 deq seg =3D 00000000a8c5372f (0xfedf5000 dma), new deq ptr =3D 000000007e1=
8677c (0xfedf51c0 dma), new cycle =3D 1
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer =3D=
 0xfedf51c0 (DMA)
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment =3D=
 00000000a8c5372f (virtual)
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cycle state =3D 0x1
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Removing canceled TD st=
arting at 0xfedf5190 (dma).
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Stopped on Transfer TRB=
 for slot 1 ep 0
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cancel URB 000000009a11=
684b, dev 2, ep 0x0, starting at offset 0xfedf5190
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq P=
tr cmd, deq =3D @fede7830
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep compl=
etion code of 1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 000000009a=
11684b, len =3D 0, expected =3D 4, status =3D -32
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new=
 deq seg =3D 0000000010319786 (0xfede7000 dma), new deq ptr =3D 0000000083e=
ff911 (0xfede7830 dma), new cycle =3D 1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue st=
ate
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer =3D=
 0xfede7830 (DMA)
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment =3D=
 0000000010319786 (virtual)
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cycle state =3D 0x1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled end=
point ring
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for sl=
ot 2 ep 0
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq P=
tr cmd, deq =3D @fede7800
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep compl=
etion code of 1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 000000009a=
11684b, len =3D 0, expected =3D 10, status =3D -32
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new=
 deq seg =3D 0000000010319786 (0xfede7000 dma), new deq ptr =3D 00000000ad8=
5653f (0xfede7800 dma), new cycle =3D 1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue st=
ate
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer =3D=
 0xfede7800 (DMA)
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment =3D=
 0000000010319786 (virtual)
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cycle state =3D 0x1
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled end=
point ring
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for sl=
ot 2 ep 0
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stag=
e event
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stag=
e event
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stag=
e event
Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: xhci_hub_status_data: s=
topping port polling.
Jul 01 19:06:24 ping kernel: usb usb6: bus auto-suspend, wakeup 1

Look like the problem is fixed, but if you want, you can check the
debuglogs at http://fabi.bplaced.net/debuglogs2.tar.xz

Thanks!

Fabian
