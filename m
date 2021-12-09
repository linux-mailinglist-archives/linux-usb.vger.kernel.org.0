Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F4C46E8D2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 14:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237606AbhLINNU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 08:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhLINNU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 08:13:20 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1A2C061746
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 05:09:46 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso6053985otf.12
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 05:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Ovjxvt3z/V/L5V1pMu6B9Aj7Gd84E0spoVr5+32TFwk=;
        b=PVR0I328zg/HowCOnHdGkU5P1fwFHcI61OBFdJ149nhONZ8b6Hfm7ZXZ05XdbLx9B7
         kVEClcAfpjicuMUQg5/pBxG43qSRQk5FMNvuLUexjv6RZ/WHO6M9OxiYU6CUGcGHLEsc
         jp5zpS5EBhqODSJbWiHTufEdssuGlCrbKC5k7leMv+X5UdgjxZKEq6HY1DWhUWvcdZvH
         p5s3t3zqYDT5Qi5WSexMIIWre87G9M/COeKMj/L388elniu3ZkL5lozDkOFuVHIk48qv
         aniV9sRTZ+nySXagEjUjFbSHWdAFJxsb0j/Wpex8d1FVxm8HutdxPPmylysE2PKkUn5l
         xHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Ovjxvt3z/V/L5V1pMu6B9Aj7Gd84E0spoVr5+32TFwk=;
        b=R0OhKDr6SkiBVF9e0RuCT5hljcOw1OOQ2mKZqtbx6md4GiaJVi3spizD9Tz27TiyVG
         PvZLPR7WMWH9Wf4F47qsJdTvjOjcoPEPebIPRO/5DwCtWymy04IR5jSB6gUUyNyz75v1
         9Sc5/DJOpgLu74XOLTK3hBdyTC6pM4pMjJPBzxv1PUc1cv2X8aRwYXmbn9wbY4sYXDJB
         Ok7VitmbSe+4Fcbu4pjps+PKk+8C5jyxw3qFhQBl63+kyfgLOasYHVSY1VAo7TOkUfJl
         1bhSZA1w8qXbeVwN26fsv2JO45jEhj5xi8acbbSSXO8VEEXwaZe2p2TA91OlnGqcES1z
         F81A==
X-Gm-Message-State: AOAM533TIigXTqS4ic+/9ychiK2b/ejYsS61Y0JDkhq9qBfZ6Tx57Ar1
        l2Bl7r5+MaNr7IxXlOG0Y0bXOgXSIsT/Irxnw9Mguarrn24=
X-Google-Smtp-Source: ABdhPJxZgXWHlBNma2MnkhWLOiRoqV5bDjad13hs+2/kXB7BwATnpA7Cl66iORLuUsONLj/NMQQMIpyHaavypN2ce60=
X-Received: by 2002:a9d:24c3:: with SMTP id z61mr5102940ota.100.1639055385976;
 Thu, 09 Dec 2021 05:09:45 -0800 (PST)
MIME-Version: 1.0
From:   Maggie Maralit <maggie.roxas@gmail.com>
Date:   Thu, 9 Dec 2021 21:09:37 +0800
Message-ID: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
Subject: An inquiry on supporting USB CDC ACM on Host PC as USB Host/Master
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Sorry for the sudden email.
I would like to confirm the difference of CONFIG_USB_ACM and
CONFIG_USB_CDC_COMPOSITE.

Basically, we are developing a product and that product uses an
MCP2221A USB-UART adapter
(http://ww1.microchip.com/downloads/en/devicedoc/20005565b.pdf) that
supports "USB Protocol Composite Device: Communication Device Class
(CDC) for USB-to-UART conversion".
Our product with MCP2221A will connect to a Linux-based Host PC
(either x86_4 laptop or INTEL NUC, arm64 like Jetson Nano or armhf
like RPi) via a USB 2.0 cable.

Our product is the USB slave/peripheral.
According to MCP2221A specifications, for a Linux-based Host PC to
properly detect it, it should have "Linux=C2=AE =E2=80=93 any distribution =
with
support for CDC and HID classes".

So we are assuming that for users to use our product, their
Linux-based Host PC should be using Linux Kernel that supports CDC but
we are confused whether that meant CONFIG_USB_ACM or
CONFIG_USB_CDC_COMPOSITE, thus our question above (asking for the
background on these two).

From my understanding of:
- CONFIG_USB_ACM (reference, how to enable in kernel) that produces
cdc-acm.ko under /lib/modules/<kernel
version>/kernel/drivers/usb/class
- CONFIG_USB_CDC_COMPOSITE (reference, how to enable in kernel) that
produces g_cdc.ko under /lib/modules/<kernel
version>/kernel/drivers/usb/gadget/legacy

CONFIG_USB_ACM is the one the user needs to have in their Linux-based
Host PC's Linux Kernel  because this is the USB CDC ACM handler for
the Host PC side (having USB Host/Master settings).

CONFIG_USB_CDC_COMPOSITE seems to be the USB CDC ACM handler for the
device side (having USB Device/Slave settings) which is on the side of
our Product.

We assume that as an outcome of enabling our users enabling
CONFIG_USB_ACM in their Linux Kernels, the Linux-based Host PC don't
have to install any extra USB drivers to communicate with our product.

Hoping for your guidance.

Thank you very much.

Regards,
Maggie
