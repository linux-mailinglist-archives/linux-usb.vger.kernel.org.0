Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45739E625
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 20:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFGSFN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 14:05:13 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:42809 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhFGSFK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 14:05:10 -0400
Received: by mail-pj1-f50.google.com with SMTP id md2-20020a17090b23c2b029016de4440381so558039pjb.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 11:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SB3t00B9zPM5yaUI2+ruhcfIsffuOXawBHSe3cpDdU4=;
        b=PC4GnugU6GnO5H9JwdMPTOj8ziAy8B4XvczRplgSkQqYMynmxPkh19hyrZNygIwGVH
         FRipR9cJR4Eepf0YwTCD/NOVs/ZKiQNVmSB+MNwjbzZYFsYYeoTBiwRxkxLig09T3i77
         aC03IGl0qryW74x0DCXd3c/Pjflf+RFxX4GEE7/nNhprqj60ONQXDW0RuPnRwHcHdVvW
         51O+avDzUesIV4SmquMKLjReRrlxKuwmpB+DmN5PvF9D8V0aKV7jJjjs6VjwB3W7uKsq
         1pRojYHL7sJAU36+mjjWW7Rhq+XJFpl6dwkNCJA5Lsn0TgBPknS4RC9xxhhhA6B2rBLG
         7oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SB3t00B9zPM5yaUI2+ruhcfIsffuOXawBHSe3cpDdU4=;
        b=hCNHSKJeDM7fhyaAghZWLK5vhxWx2TTIqQKUlASRftKbtRekVxyWYDVSAsZa6xN9l9
         O/6AbchQEe4c/Dqxl9wnu+8richCzNh3UgeV1+6cYxclWY2gBETAk7/yAM4LzWMtuavL
         AIEXmrEZyeGDshlIP/PD5fp8C/YBcHaN0hNb5o7XGtAowV3WfQvfYokA73nb7Rui+AN1
         H/2EV0WEPDzU5L5WONAh9EypeiajigIfiMODo1osBFM1Kr+x5Uvf9t83v+UdSKGlXvfC
         gqNwL7H3VmXe3wiY27ZPy0+OYhQUrLm2HVyeFQczxEP0PgRRwPBNpwxSVK4kTSh2jq66
         s4cw==
X-Gm-Message-State: AOAM5333J27Q2LyXc/zd1aA5UEvJywMztZ/CxlnG2JHxR5LRpcl2io+f
        OHw56dNCokz7QnWKvKVGOTalzmdHiuYnG0MyZbc=
X-Google-Smtp-Source: ABdhPJzjT4Z4Tj842LI5Rai8rmH0FSWvhYB1yJUzHdue8+TdX6bsrBv4gClBbVe7jU9IoKpKDPUAXNYWoMnFKfBflso=
X-Received: by 2002:a17:90a:fee:: with SMTP id 101mr375906pjz.230.1623088938454;
 Mon, 07 Jun 2021 11:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <YLXmrmW9/fB1WbzR@hovoldconsulting.com> <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com> <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com> <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com> <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com> <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
 <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
In-Reply-To: <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
From:   David Frey <dpfrey@gmail.com>
Date:   Mon, 7 Jun 2021 11:02:32 -0700
Message-ID: <CAAvkfd91cdQ-6RwGErJuBTwQh9=8cajbngcOgjsThnFruz27DQ@mail.gmail.com>
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     =?UTF-8?Q?Alex_Villac=C3=ADs_Lasso?= <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 7, 2021 at 9:53 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Jun 07, 2021 at 09:44:59AM -0700, David Frey wrote:
> > On Sat, Jun 5, 2021 at 3:13 AM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > I found an errata for A01 on here, but no mention if this particular
> > > bug:
> > >
> > >         https://www.silabs.com/documents/public/pcns/190315471-CP2102=
N-Product-Revision-with-Datasheet-and-Errata-Update.pdf
> >
> > I believe this document has some more errata details:
> > https://www.silabs.com/documents/public/errata/cp2102n-errata.pdf'
>
> Thanks for the link.
>
> This seems to confirm that this is a known issue with A01 that was fixed
> in A02:
>
>         3.6 CP2102N_E104 =E2=80=93 IO Exception in .NET Applications when
>         Manually Controlling RTS
>
>         The CP2102N uses the incorrect byte of the SERIAL_HANDFLOW
>         structure
>         (https://msdn.microsoft.com/en-us/library/windows/hard-
>         ware/jj680685(v=3Dvs.85).aspx) to control the RTS signal. Instead
>         of looking at the first byte of FlowReplace, the device is
>         reading the first byte of the XonLimit and interpreting that as
>         the first byte of FlowReplace.
>
>         Applications written in .NET set the Xon/Xoff limits to 160,
>         equal to 0xA0, which the CP2102N interprets as hardware flow
>         control, and so it returns an error when manually setting RTS.
>
> Now we just need to figure out how to determine the firmware revision.
>
> Johan

I made a bit of progress.  I found that CP210xManufacturing.dll was
bundled with Simplicity Studio and in the same folder as the DLL was
inspect_usbxpress.exe.  It looks like that tool is able to report the
firmware version of the device.  In the output below, the first run is
against the device that I am able to program successfully on any
kernel and that shows firmware 1.0.6.  The second run is against a
device that I can't program and it shows firmware version 1.0.4.  I
recall reading some information that 1.0.6 is A02 and that 1.0.4 is
A01, but I think there might have been another firmware revision
that's also A01 (maybe 1.0.2?).  I can't find the source of this
information anymore.  I'm going to try to figure out how to use
wireshark to capture USB traffic now.

C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpres=
s>.\inspect_usbxpress.exe
-slist
serial_no =3D
deviceCount =3D 1
device (0) {
  SoftIndex =3D 0
  adapterLabel =3D CP2102N USB to UART Bridge Controller (ID:0)
  SerialNo =3D 1017bfe99d98e8118ea47540c3e5cfbd
  Vid =3D 0
  Pid =3D 0
  PartNumber =3D 32
  BoardID =3D
  BoardCount =3D 0
  FirmwareVersion =3D 1.0.6
  Name =3D cp2102N version 1.0.6
  Type =3D CP210x
  Family =3D USBXpress
  Locked =3D 1
}

C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpres=
s>.\inspect_usbxpress.exe
-slist
serial_no =3D
deviceCount =3D 1
device (0) {
  SoftIndex =3D 0
  adapterLabel =3D CP2102N USB to UART Bridge Controller (ID:0)
  SerialNo =3D f06e721e74e1ea11bd9ddc2d9a583cc7
  Vid =3D 0
  Pid =3D 0
  PartNumber =3D 32
  BoardID =3D
  BoardCount =3D 0
  FirmwareVersion =3D 1.0.4
  Name =3D cp2102N version 1.0.4
  Type =3D CP210x
  Family =3D USBXpress
  Locked =3D 1
}
