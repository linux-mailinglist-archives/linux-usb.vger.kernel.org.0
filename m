Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF7F69C57D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Feb 2023 07:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjBTGy2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Feb 2023 01:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjBTGy1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Feb 2023 01:54:27 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B48EB6E
        for <linux-usb@vger.kernel.org>; Sun, 19 Feb 2023 22:54:26 -0800 (PST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 951993F585
        for <linux-usb@vger.kernel.org>; Mon, 20 Feb 2023 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676876064;
        bh=6loQ2derknDF1fwYr1ujI7Q/SpJj4KMMMpxnbRSctLQ=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=ishZJqNz24rt6ljUH8gmE8hQgOmat3xEaXUIpQ0KvCjir4YQn5UjnGSqIBA6cktCF
         MBMhYZNC9F0zKE0asFg+6otg3bdsVcT2rrpqSkHFQ89UHcsimdQFo6Lah3yWIrGAYk
         5u3FpHXk42WleSr8OGwahrUfD8B4/aiYNOccVCrAOmQzS2VXrEfW+9ctptJvEnyvIt
         d4Za4QR6UD45TsMQH638JMjWUqbJWAtTH6cVDjziyDRyroDHZvpV0RPTndHAw5JQvs
         Opy0uFEfBXS2Sq7Vb7PfSlld7pirFZuKr5zMbVS8Y8C2oJtlm1QnnosiWPoXLvQqEF
         5OZN+/bVQzn5A==
Received: by mail-yb1-f199.google.com with SMTP id w68-20020a257b47000000b00944353b6a81so64689ybc.7
        for <linux-usb@vger.kernel.org>; Sun, 19 Feb 2023 22:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6loQ2derknDF1fwYr1ujI7Q/SpJj4KMMMpxnbRSctLQ=;
        b=QiKK/7v37GmDi/zSC6AEqqrAC+6AfWrDxmuZYZ3n0+XrAyWX1zXTw8F5EvVRNxWtsP
         6GBQPu0z90G4Lzb8lVrK191Om/K0dxK2mMyMvQ6IH9JvwlCrenaFz9b5EBgSFztO1nT8
         nQf67PPgYglT9IpY7Okog8nhMobMOE6n3DyT4gI4gtThVJIwrTJw3AB9aK7ILUXcKOyi
         ioY3eki7hETOtVpP1UFoa4RjRdfvTXezFPXR6avmhmGOphRcsNiUoTpVj3QaYRJED23x
         RsrE9kqZ0BT3/A2kBj/JLWddu4qULmS7BUoPUYtysLCSX1aA+uScRwNYuAXutZBUJw1a
         x1gQ==
X-Gm-Message-State: AO0yUKX4Ps1+Gz5MUJbQw+bFtu01KaQCzVZjwqZD8Lowl5wm4bnm2bIN
        1wbof5mAodQRFXbrs460BDLLI0FT3dM/0B9788UJ6AbXeP3wapUpOGbIzhJYE8gNl1pD5Cy8hMw
        OP6TLmev7CFfD4xiy9zNBqJzVZa4xrDQvoBPGtIfIoVlnsmHC8uFiVA==
X-Received: by 2002:a0d:e4c2:0:b0:506:3aca:6ff6 with SMTP id n185-20020a0de4c2000000b005063aca6ff6mr2563816ywe.213.1676876062511;
        Sun, 19 Feb 2023 22:54:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/BVRO9NeOsU+tO5ARGrKD0myhKVlAaKv66ZF0A3G7P/VDIqxuQ2SQM6upwT1jKTQHFnYQNYv3QUFoAI/H/XF0=
X-Received: by 2002:a0d:e4c2:0:b0:506:3aca:6ff6 with SMTP id
 n185-20020a0de4c2000000b005063aca6ff6mr2563801ywe.213.1676876062284; Sun, 19
 Feb 2023 22:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20230215075855.46204-1-acelan.kao@canonical.com> <141b6b13-00ca-c941-e315-6b2fe62e6515@amd.com>
In-Reply-To: <141b6b13-00ca-c941-e315-6b2fe62e6515@amd.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Mon, 20 Feb 2023 14:54:11 +0800
Message-ID: <CAFv23Qk2yG+KPGd1s1JsY8rBfU_z-tFe6KSo6r=q7DsQ6ETL_w@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: Workaround for runpm issue on AMD xHC
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Tsao, Anson" <anson.tsao@amd.com>,
        "Gong, Richard" <Richard.Gong@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        "Oakes, Gregory" <Gregory.Oakes@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mario,

Mario Limonciello <mario.limonciello@amd.com> =E6=96=BC 2023=E5=B9=B42=E6=
=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> + a bunch of AMD guys
>
> Please don't submit quirks for AMD systems without talking to AMD about
> if they make sense.
Got it.

>
> On 2/15/23 01:58, AceLan Kao wrote:
> > From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> >
> > When the xHC host is runtime suspended, the device connects to it will =
be
> > disconnected while trying to use it.
> > The quirk in commit 2a632815683d ("usb: xhci: Workaround for S3 issue o=
n
> > AMD SNPS 3.0 xHC") also works for this issue, so added its ID to the
> > quirk, too.
> >
> > 05:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Devic=
e [1022:1505] (prog-if 30 [XHCI])
> >          Subsystem: Dell Device [1028:0c3f]
> >          Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- Pa=
rErr- Stepping- SERR- FastB2B- DisINTx+
> >          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbor=
t- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >          Latency: 0, Cache Line Size: 64 bytes
> >          Interrupt: pin A routed to IRQ 60
> >          IOMMU group: 21
> >          Region 0: Memory at c0000000 (64-bit, non-prefetchable) [size=
=3D1M]
> >          Capabilities: <access denied>
> >          Kernel driver in use: xhci_hcd
> >          Kernel modules: xhci_pci
> >
> > [   20.769275] xhci_hcd 0000:05:00.0: xHCI host not responding to stop =
endpoint command
> > [   20.771429] xhci_hcd 0000:05:00.0: xHCI host controller not respondi=
ng, assume dead
> > [   20.771444] xhci_hcd 0000:05:00.0: HC died; cleaning up
> > [   20.771733] usb 5-1: USB disconnect, device number 2
> >
> > Cc: stable@vger.kernel.org #v4.19+
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>
> Is this system that you're finding this bug already launched?  This
> looks like a BIOS bug.
>
> If it's not launched we should fix it from BIOS, reach out to AMD off
> list to talk about it.
This system is not launched yet, any hints about the BIOS issue?
I tried to disable D3Cold, but the symptom is the same.
The xHC enters D3Hot and then it can't be waken up.

>
> > ---
> >   drivers/usb/host/xhci-pci.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index fb988e4ea924..b8f6843a8cd1 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -177,7 +177,9 @@ static void xhci_pci_quirks(struct device *dev, str=
uct xhci_hcd *xhci)
> >           (pdev->device =3D=3D 0x15e0 || pdev->device =3D=3D 0x15e1))
> >               xhci->quirks |=3D XHCI_SNPS_BROKEN_SUSPEND;
> >
> > -     if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD && pdev->device =3D=3D =
0x15e5) {
> > +     if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD &&
> > +             (pdev->device =3D=3D 0x15e5 ||
> > +              pdev->device =3D=3D 0x1505)) {
> >               xhci->quirks |=3D XHCI_DISABLE_SPARSE;
> >               xhci->quirks |=3D XHCI_RESET_ON_RESUME;
> >       }
>
