Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871F5CEFA7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 01:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfJGXhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 19:37:14 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:41860 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfJGXhO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 19:37:14 -0400
Received: by mail-io1-f41.google.com with SMTP id n26so32527278ioj.8
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1Tj4mSGf/g0a5ohfxBFamzYSGJV3v3RAnmKYO0BI6FI=;
        b=vYxRic0/SzJ6Vx8ALZr8GKAbOHW++cYzY3ZdAEkbudjS/j/6oHUInIb685BI3uKzMu
         onv8C35VtMYIiWwlyWpoGoRG00FZyetib/zGxFLenPSIQ6bO2C9GODe1pyNLRgiH1sGS
         K9ngwT1QKAcjGEyhxKZIaV/fmCLPmDIIrs4E6cl+NzKt4BAUgdoqiessDVLRl8oDjxLv
         Qlv94eGcI22DSz1DCvNIZdIW2isBsqf0YhPYrLDH1E79tpNEbltlR91sVQmRqCMb/A5e
         PWOXafdzdWuWnm3X1GUe0gM5kDRTJjhkUuJtegrALq6ll9/PRz2c9U3LIYg0fiGCKc/B
         BFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1Tj4mSGf/g0a5ohfxBFamzYSGJV3v3RAnmKYO0BI6FI=;
        b=GMV4pmplxpdm4zP22ZnWYl4VZSt11T91WU94GDPFKGiNdomUYUStReB1nEPdY7RO/g
         dj8PMo48nvLBS2gk0k7DBbr9BMxnR9RkqnJpiTk4RIwK1IwVVTgQ0BVZols0wunUOYxQ
         LAFrKKRbK8EM5uMaPIaBrSPuddL5JtxT8HImwlupEUviqbYfV1/f6Uiim4YHRumVwNQM
         ZpyAax5LaOmoOgi3f3q6v56mBMWeAgZRYnL2zvCkd3Rgw0Obn0o2e4pinRqoE/Iwmr8/
         65y823VcS88/ZIMMDjisIuw+KSkSoYjdkuFSDMyFWEQP6e37d0o2sQUgXvYHMhjJD/rF
         SnTA==
X-Gm-Message-State: APjAAAUkKq/iDSg3P0lO0a0LiPGjwg8Ff9j1enHSVy917fMnO77ODU92
        SepDyCoWbkT5CS1lZxHu9QgWmpQXRTByyk6PrrYeIw==
X-Google-Smtp-Source: APXvYqxpLCVBO+8Of/MU06kU1ROuNP6QtKOalJ+ORe3L0qaGULT/aywO2PEXWy7DJkOHMI3pr224q+ZML1nuhtymuEc=
X-Received: by 2002:a5e:c709:: with SMTP id f9mr8974843iop.118.1570491433358;
 Mon, 07 Oct 2019 16:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
 <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com> <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
 <CANMwUkjWY0cNV9dJ1YWN+_9LBZb=Wcws7Vw52bR6CBMKyfTTJQ@mail.gmail.com>
 <36d828f1-eb5d-a75e-fe0d-0b95c35b527c@linux.intel.com> <CANMwUkioh3QoYfWiTO7z9Pi54z=_+a=H01sHFL2HaJYut5RLuw@mail.gmail.com>
In-Reply-To: <CANMwUkioh3QoYfWiTO7z9Pi54z=_+a=H01sHFL2HaJYut5RLuw@mail.gmail.com>
From:   =?UTF-8?Q?Lo=C3=AFc_Yhuel?= <loic.yhuel@gmail.com>
Date:   Tue, 8 Oct 2019 01:37:02 +0200
Message-ID: <CANMwUkgBKfdbQ36FYycApdQ-UxVdj7HyEmqhVOUuMF3HuM5U3Q@mail.gmail.com>
Subject: Re: ASM2142 issues
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le mar. 24 sept. 2019 =C3=A0 17:50, Lo=C3=AFc Yhuel <loic.yhuel@gmail.com> =
a =C3=A9crit :
> > Looks like the xHCI PCI controller wasn't fully powered up to D0 state =
yet
> > when xhci_resume was called. Looks similar to what is discussed in thre=
ad:
> >
> > https://marc.info/?l=3Dlinux-usb&m=3D156681068319529&w=3D2
In fact the kernel keeps the device, port, and the two bridges in D0 state.

On suspend :
[  860.578478] xhci_hcd 0000:08:00.0: PME# enabled
[  860.578511] xhci_hcd 0000:08:00.0: PCI PM: Suspend power state: D0
...
[  860.580329] pcieport 0000:02:09.0: PCI PM: Suspend power state: D0
...
[  860.603786] pcieport 0000:01:00.2: PCI PM: Suspend power state: D0
[  860.603836] pcieport 0000:00:01.1: PCI PM: Suspend power state: D0

On resume :
<restoring config space for 0000:02:09.0, then 0000:08:00.0>
...
[  861.135868] xhci_hcd 0000:08:00.0: PME# disabled
[  861.135934] xhci_hcd 0000:08:00.0: enabling bus mastering
...
[  861.235966] xhci_hcd 0000:08:00.0: WARN: xHC restore state timeout
[  861.235972] xhci_hcd 0000:08:00.0: PCI post-resume error -110!
[  861.235973] xhci_hcd 0000:08:00.0: HC died; cleaning up
[  861.235981] PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -110
[  861.235984] PM: Device 0000:08:00.0 failed to resume async: error -110

Setting the XHCI_RESET_ON_RESUME quirk avoids the issue.
But the real problem might be the device being marked as only supporting D0=
,
which seems strange for suspend.

> On my machine, the PCIe "port" is supposed to support 8GT/s (but the
> controller is on the motherboard,
> so there is no official specification about how the internal
> peripherals are linked), the device too,
> but it's always in 5GT/s mode (in Windows too), so perhaps it changes
> the delays.
This is unrelated to the other problems, but if someone else has the same H=
W,
I found I can enable 8GT/s :
setpci -v -s 0000:08:00.0 CAP_EXP+0x30.w=3D0x0003:0x000f
setpci -v -s 0000:02:09.0 CAP_EXP+0x30.w=3D0x0003:0x000f
setpci -v -s 0000:02:09.0 CAP_EXP+0x10.w=3D0x0020:0x0020
