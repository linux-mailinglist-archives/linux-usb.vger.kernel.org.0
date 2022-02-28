Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345444C7A08
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 21:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiB1UUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 15:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiB1UUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 15:20:04 -0500
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70198532F8
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 12:19:24 -0800 (PST)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4K6s4m3GfMz4wyN5
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 20:12:56 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
        dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DwQkGTOR"
Date:   Mon, 28 Feb 2022 20:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1646079171;
        bh=SDxGAO65YfVls01gqwJXElo9FyZCXBZw0GS7u2G0v9E=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=DwQkGTOREVMEdoKdxNnTBSHNdDTIcTRz6SG87zLHUlo1efaDGJZjwZXERluwBZ0tC
         S0oan07rDhBF3TTVKKyz5AQ0i5UgwvegC7gjqhL1fgVfBiffu0QP7WFQIROkCJpoH2
         VuoHNw3FXVv+KmXfBODTeJDqfXj+w8sOJ2n7RYeO2NDsoBgq1pTMp4RREbsN5KBQY2
         rAfFw/KC9Uhm4M7zx8aDp6JUAoLFbkoZujrj3uCO06/PpkjtGe49y8F7fXGsmPemwV
         OphD1rZOmfreFtwQSSW2sVy143YSi5zEjCiT7nhhANHBtFR0JVlyMIYw/AwUhV09Sd
         w/mmKMB5uGEjQ==
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
From:   micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Reply-To: micklorain <micklorain@protonmail.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
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

Hi,

This patch breaks USB for me. I noticed when I upgraded from debian's 4.19.=
0-18 (working) to 5.10.0-10 (broken). I git bisect'ed until I found that th=
is patch is the culprit. Upstream 5.17.0-rc2 is still broken, but 5.17.0-rc=
2 with this patch reverted works.

lsusb when things work :
https://paste.debian.net/hidden/2a964425/

lsusb when things are broken :
https://paste.debian.net/hidden/0376920c/

dmesg when things are broken :
https://paste.debian.net/hidden/780ca112/

dmesg when things work :
https://paste.debian.net/hidden/4d1bfc0f/

Let me know if you need anything else from me.

Thanks !
Mick Lorain

-------- Original Message --------

On 02/07/2020 16:30, Andy Shevchenko wrote:

> It appears that some platforms share same IRQ line between several device=
s,
> some of which are EHCI and OHCI controllers. This is neither practical no=
r
> performance-wise, especially in the case when they are supporting MSI.
>
> In order to improve the situation try to allocate MSI and fallback to leg=
acy
> IRQ if no MSI available.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/core/hcd-pci.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index 1547aa6e5314..4dc443aaef5c 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -194,20 +194,21 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const st=
ruct pci_device_id *id,
>  =09 * make sure irq setup is not touched for xhci in generic hcd code
>  =09 */
>  =09if ((driver->flags & HCD_MASK) < HCD_USB3) {
> -=09=09if (!dev->irq) {
> +=09=09retval =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_LEGACY | PCI_I=
RQ_MSI);
> +=09=09if (retval < 0) {
>  =09=09=09dev_err(&dev->dev,
>  =09=09=09"Found HC with no IRQ. Check BIOS/PCI %s setup!\n",
>  =09=09=09=09pci_name(dev));
>  =09=09=09retval =3D -ENODEV;
>  =09=09=09goto disable_pci;
>  =09=09}
> -=09=09hcd_irq =3D dev->irq;
> +=09=09hcd_irq =3D pci_irq_vector(dev, 0);
>  =09}
>
>  =09hcd =3D usb_create_hcd(driver, &dev->dev, pci_name(dev));
>  =09if (!hcd) {
>  =09=09retval =3D -ENOMEM;
> -=09=09goto disable_pci;
> +=09=09goto free_irq_vectors;
>  =09}
>
>  =09hcd->amd_resume_bug =3D (usb_hcd_amd_remote_wakeup_quirk(dev) &&
> @@ -286,6 +287,9 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const stru=
ct pci_device_id *id,
>
>  put_hcd:
>  =09usb_put_hcd(hcd);
> +free_irq_vectors:
> +=09if ((driver->flags & HCD_MASK) < HCD_USB3)
> +=09=09pci_free_irq_vectors(dev);
>  disable_pci:
>  =09pci_disable_device(dev);
>  =09dev_err(&dev->dev, "init %s fail, %d\n", pci_name(dev), retval);
> @@ -343,6 +347,8 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  =09=09up_read(&companions_rwsem);
>  =09}
>  =09usb_put_hcd(hcd);
> +=09if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
> +=09=09pci_free_irq_vectors(dev);
>  =09pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
> @@ -454,7 +460,7 @@ static int suspend_common(struct device *dev, bool do=
_wakeup)
>  =09 * synchronized here.
>  =09 */
>  =09if (!hcd->msix_enabled)
> -=09=09synchronize_irq(pci_dev->irq);
> +=09=09synchronize_irq(pci_irq_vector(pci_dev, 0));
>
>  =09/* Downstream ports from this root hub should already be quiesced, so
>  =09 * there will be no DMA activity.  Now we can shut down the upstream
> --
> 2.27.0


