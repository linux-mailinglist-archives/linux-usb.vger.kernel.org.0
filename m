Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4F8BCBD2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 17:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390551AbfIXPuf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 11:50:35 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:43843 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388230AbfIXPuf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 11:50:35 -0400
Received: by mail-io1-f53.google.com with SMTP id v2so5588019iob.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j9yiih5GRx+5X3utwiDTT0H4LxXrJe645ul7drUVxyI=;
        b=opMaVuybYW2YdiyFS9xjXXh1nS5A/DgXxYWJ9/M5cu6Qr5hP0MLi0o6gtjxwgh0AJf
         HWkiVDzhrsZyikybK1M9n6ahElkn/W5RZ+h+wHg+w4ilfF4iuCTgtdrInWvfp4wH1az6
         28pnY9G2bf82fubANTuTu8PnwvfH7DjAEYgGvbesKffZnAy7+JyD6gHnlHIkR3TZGjv1
         /NLR7cfLgOno4WCPAFis530W71Fn2Tq8ksbCMoslVWb91LkLSUOo2QrT1zMsF/hh9YS/
         3E3YIiC7mi8756ueAMQ4bIlmymTj726L+jyf9ubUkNCoGO/w8E1w3x0w69dlBpZDaSIv
         ZLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j9yiih5GRx+5X3utwiDTT0H4LxXrJe645ul7drUVxyI=;
        b=E2OckKuFJv9sUGNbe1ve9F0BarX1ApnSO9h/nIz70Azgs8n8KZ9bSSKMawTv0bYv3M
         nrgQX7ATnjryTGxymD/o5pOkarZtTTSgWFsrmO4hjlO8hKCJVrqpVRR5Go/4YY7QDZnb
         tZ/g6rmnrP+jDZVmvPLl5C5WBMLWwwHJgurLB6EYLWEJrSxoWfxhx8INyRo1BMh0w9vq
         GhN7iJrCsUVOu0XBk2tTPa15JHAy+GMh7aZzYcCJYfJU45CMJfE7TiOm2hIgRIEERtUX
         WKys00dnZs2ivXjQju9uZEAeCYRxL3PJHpYQ3MqcJ1HjuyyxW9N2ZN+Mf5lwsmALjmN1
         0Nbg==
X-Gm-Message-State: APjAAAW7zf+soT4VYtk5kizs9Y2fB2oDrVWHJfIenBNECmekya4+sVsv
        iqTHFxc7Pi7n1nL3NFx/9yi0JZHd+yYW0vV+S1QOU+Q/
X-Google-Smtp-Source: APXvYqyrx2/FJ69DudM8UJboBfZRSD/ll3Exv6H72dplHcNO1WB3hqPWIOudOnQjLKhY18v1FLTOr1G4Q586nMTUK0c=
X-Received: by 2002:a02:3786:: with SMTP id r128mr4471007jar.76.1569340232332;
 Tue, 24 Sep 2019 08:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
 <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com> <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
 <CANMwUkjWY0cNV9dJ1YWN+_9LBZb=Wcws7Vw52bR6CBMKyfTTJQ@mail.gmail.com> <36d828f1-eb5d-a75e-fe0d-0b95c35b527c@linux.intel.com>
In-Reply-To: <36d828f1-eb5d-a75e-fe0d-0b95c35b527c@linux.intel.com>
From:   =?UTF-8?Q?Lo=C3=AFc_Yhuel?= <loic.yhuel@gmail.com>
Date:   Tue, 24 Sep 2019 17:50:21 +0200
Message-ID: <CANMwUkioh3QoYfWiTO7z9Pi54z=_+a=H01sHFL2HaJYut5RLuw@mail.gmail.com>
Subject: Re: No SuperSpeedPlus on ASM2142
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le mar. 24 sept. 2019 =C3=A0 09:55, Mathias Nyman
<mathias.nyman@linux.intel.com> a =C3=A9crit :
> Just fyi, turns out initial xHCI 1.1 spec was a bit unclear about SBRN
> and minor revision numbers, later xHCI specs clarify them better.
> A few USB 3.1 capable xHCI hosts were based on that spec, not just the AS=
M2142.
> They have SBRN set to 30h and minor revision 0x1.
> I'll send a patch to detect those correctly.
>
> But it won't fix your inconsistency with PortSpeed bits in PORTSC registe=
r.
Do you know anything I could try do debug the problem if it happens again ?
>
> >
> > Btw, I found another problem on resuming the system after a suspend :
> > [  137.029272] pcieport 0000:00:01.1: PME: Spurious native interrupt!
> > ...
> > [  137.129618] xhci_hcd 0000:08:00.0: WARN: xHC restore state timeout
> > [  137.129624] xhci_hcd 0000:08:00.0: PCI post-resume error -110!
> > [  137.129625] xhci_hcd 0000:08:00.0: HC died; cleaning up
> > [  137.129633] PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -=
110
> > [  137.129636] PM: Device 0000:08:00.0 failed to resume async: error -1=
10
> > Then a "echo 1 > remove, then "echo 1 > ../rescan" on sysfs got it back=
.
> > This is a completely different issue, but at least, I can reproduce
> > this one reliably.
> >
>
> Looks like the xHCI PCI controller wasn't fully powered up to D0 state ye=
t
> when xhci_resume was called. Looks similar to what is discussed in thread=
:
>
> https://marc.info/?l=3Dlinux-usb&m=3D156681068319529&w=3D2
In the runtime suspend case, on this laptop the xhci is stuck in D3,
where in my case it stays in D0.

I tried https://lore.kernel.org/linux-pci/20190821124519.71594-1-mika.weste=
rberg@linux.intel.com/,
but it doesn't help.
On my machine, the PCIe "port" is supposed to support 8GT/s (but the
controller is on the motherboard,
so there is no official specification about how the internal
peripherals are linked), the device too,
but it's always in 5GT/s mode (in Windows too), so perhaps it changes
the delays.
