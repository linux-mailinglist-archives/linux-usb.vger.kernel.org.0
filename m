Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6986681CA5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 22:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjA3VYc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 16:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjA3VYb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 16:24:31 -0500
Received: from mx0a-00445d01.pphosted.com (mx0a-00445d01.pphosted.com [205.220.171.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C5B46165
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 13:24:29 -0800 (PST)
Received: from pps.filterd (m0303598.ppops.net [127.0.0.1])
        by mx0a-00445d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UAxr65031386
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 16:24:29 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by mx0a-00445d01.pphosted.com (PPS) with ESMTPS id 3ndmvv8tg4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 16:24:28 -0500
Received: by mail-io1-f70.google.com with SMTP id a2-20020a5d89c2000000b00717a8ac548cso3595355iot.9
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bostondynamics.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPlUSnaRUT/7/dvJ11yaw2lsU8F81kZ90nZ7dwdDlqI=;
        b=AiOb+m/x57bJOWNHc9ugHlWjkHLsGYn7LDPhEYTs64VSLgUcgS2z4aSsy+GzSxkiyF
         fmZuimdIrL7fYD0uHTkPqiuqzJiRIMBPfT5YZOQSTDvPYdQD6/r56TuHBxmsZxDJk9m1
         ngSjDz0tr4QlpHTaIC2xSS6zGikGQlT5uyhIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPlUSnaRUT/7/dvJ11yaw2lsU8F81kZ90nZ7dwdDlqI=;
        b=cQENqKOvDxXk/VHqriXqYNQCOU/WYDAVHdkY9Ks8j1YxaXYtKbs9BUJO6Xpo4pstyG
         c8gXOmfc04E+9RLCuHxVi/LnyIUWMjMbz7P590XhioLLkdjz0wVtICTwOeRjSvib9Q2V
         YXZXBGA2qar5E5sNH/ipbZtKwkTHY2bS36vS0ye7hN8PsrhpCt+E0BZO6LCmjHIfMxAG
         ovegFQZrB7C+HRpcx2IwXy+vhH1iuaucp4ExXm/anyLwj2wZfBRGGh8xAxYI4bXGAt9j
         5mz2vY529c+apxOi1yGdSMRp9XA6K22znHLa5q2GVGZHPWUjK/8ckP+gVfjtqK8gZZDV
         Zrxw==
X-Gm-Message-State: AO0yUKW1yV3TU2rw3KgSpSw9Ai/DH1WrfkS0/b2e+Vc2ifYdPAcC0phU
        b1FUO2gXmFdSpsLInfPL82PAEyGviP8jqBC+lkQbZ9UbJD2S3zcnx0eLXcYC/Jdn1P6VF8r/G7R
        rgN56ilYN/ozIkE0hAurDucbM+S3HFMAl+6xM
X-Received: by 2002:a05:6e02:8a2:b0:310:fcab:409b with SMTP id a2-20020a056e0208a200b00310fcab409bmr694872ilt.77.1675113867743;
        Mon, 30 Jan 2023 13:24:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9mzw0JqvnWwN2hV9QfkKLo/pqVy1hfNQDfNjYfFAYLu2Augz6xMn6SA5f0Gey524VQGASGZmJJksvkT6QLwNM=
X-Received: by 2002:a05:6e02:8a2:b0:310:fcab:409b with SMTP id
 a2-20020a056e0208a200b00310fcab409bmr694867ilt.77.1675113867354; Mon, 30 Jan
 2023 13:24:27 -0800 (PST)
MIME-Version: 1.0
References: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
 <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com> <CAHPEz-30ypzfmCp7kqszSOa=-wXqgE8ZeysejO_mebo4UonEGg@mail.gmail.com>
 <aa6fd5d9-a0db-391b-7626-ee7e8531a8cc@linux.intel.com> <5ae25a36-03f2-6867-263b-1844a2ed90b9@linux.intel.com>
In-Reply-To: <5ae25a36-03f2-6867-263b-1844a2ed90b9@linux.intel.com>
From:   Joe Bolling <jbolling@bostondynamics.com>
Date:   Mon, 30 Jan 2023 16:24:16 -0500
Message-ID: <CAHPEz-26NdHTDaYGqw_B6GiPPUOPd7472e=hK7dtPcWZ_C2uSA@mail.gmail.com>
Subject: Re: PROBLEM: Error 110 from ASMedia Host Controller
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: k2T0-s8Bjfka8eZ1Z63qSbySOioy1Ran
X-Proofpoint-ORIG-GUID: k2T0-s8Bjfka8eZ1Z63qSbySOioy1Ran
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ah, good catch. The PCI ID did indeed change -
New firmware:
01:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM2142 USB 3.1
Host Controller [1b21:2142]
Vs. with old firmware:
01:00.0 USB controller [0c03]: ASMedia Technology Inc. Device [1b21:3042]

I'll see if ASMedia can fix this for me.

Thanks,
Joe

On Mon, Jan 30, 2023 at 8:40 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 30.1.2023 15.19, Mathias Nyman wrote:
> > On 28.1.2023 0.47, Joe Bolling wrote:
> >> Thanks Mathias!
> >>
> >> I received an updated firmware image from ASMedia. It seems to improve
> >> the 110 error problem a little bit - after the error occurs, I can
> >> still run lsusb without it hanging. However, the streaming performance
> >> of the camera has worsened with the new firmware; even with only one
> >> camera connected, I get "ERROR Transfer event TRB DMA ptr not part of
> >> current TD ep_index 8 comp_code 1" after just a few frames.
> >>
> >> I guess the good news is these logs might be easier to analyze, since
> >> there's only one endpoint needed to reproduce the error. I'm not sure
> >> if this is the same behavior I was seeing before or not.
> >> Trace: https://urldefense.com/v3/__https://bostondynamics1.box.com/s/3=
ovxdzu8g276os0pur5rmqbj2vzsgk79__;!!ELB4yx2gjxJSXcA!btzGCEEYedD6MZAqpvvmijH=
hBcA0TI0JPKQoPU3LbRxGf0lssEIl2UJkRlbk1Wwzipg8vnYafvoAXsR_Wo2IpmSLqan3nQVmoM=
o$
> >
> > Trace is missing most events, maybe the CPU handing the xHC interrupts
> > is not being traced. Getting all the events would help.
> >
> >> dmesg: https://urldefense.com/v3/__https://bostondynamics1.box.com/s/7=
420hi96o5o0f8rmsc2vaafwxf8fcv9y__;!!ELB4yx2gjxJSXcA!btzGCEEYedD6MZAqpvvmijH=
hBcA0TI0JPKQoPU3LbRxGf0lssEIl2UJkRlbk1Wwzipg8vnYafvoAXsR_Wo2IpmSLqan3H2yiEZ=
Q$
> >
> > Combining dmesg and trace it looks like ASMedia hosts fails to create a
> > transfer completion event for the last normal transfer block (TRB) on t=
he
> > last segment before ringbuffer wraps back and continues handling events=
 at
> > the beginning of the ring.
> >
> > [  116.226252] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr =
not part of current TD ep_index 8 comp_code 1
> > [  116.226254] xhci_hcd 0000:01:00.0: Looking for event-dma 000000003f8=
2b000 trb-start 000000003f82cfe0 trb-end 000000003f82cfe0 seg-start 0000000=
03f82c000
> >
> > The xHC host hardware itself probably handled the transfer as it contin=
ues
> > handling later TRBs on this ring (cycling back to first segment).
> > So driver is waiting for an event for TRB at 0x3f82cfe0, while driver i=
s
> > generating events for later TRBs at:
> > 000000003f82b000
> > 000000003f82b010
> > 000000003f82b020
> > 000000003f82b030
> >
> > bulk endpoint 4 i(n) has a ring buffer with two segments. each fits 256=
TRBs
> > 0x000000003f82b000
> > 0x000000003f82c000
> >
> > last TRB of each segment contains a link TRB (at 0x..bff0 and 0x..cff0)=
 that
> > points to next segment, link TRB on last segment has a cycle bit set.
> >
> > Looks like TRBs are queued normally,
> > queue TRB @ 0x3f82cfe0
> > 116.257625: xhci_queue_trb: BULK: Buffer 000000003f930000 length 32768 =
TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> > 116.257625: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82cff0=
(0x000000003f82c000) deq 0x000000003f82cfa0(0x000000
> > ...
> > queue TRB @ 0x3f82b000
> > 116.259186: xhci_queue_trb: BULK: Buffer 000000003f910000 length 32768 =
TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> > 116.259186: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82b010=
(0x000000003f82b000) deq 0x000000003f82cfb0
> >
> > A wild guess would be that this is somehow related to the cycle bit in =
of the
> > Link TRB. Maybe ASMedia HW processes the link TRB before creating the e=
vent for
> > the last normal TRB, and sets the cycle bit incorrectly for it?
> >
> > Thanks
> > Mathias
> >
>
> Just recalled this same issue was seen some time ago.
>
> https://urldefense.com/v3/__https://lkml.org/lkml/2021/4/2/197__;!!ELB4yx=
2gjxJSXcA!btzGCEEYedD6MZAqpvvmijHhBcA0TI0JPKQoPU3LbRxGf0lssEIl2UJkRlbk1Wwzi=
pg8vnYafvoAXsR_Wo2IpmSLqan3YieQYsY$
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-us=
b/patch/20210416093729.41865-1-ole@salscheider.org/*24159595__;Iw!!ELB4yx2g=
jxJSXcA!btzGCEEYedD6MZAqpvvmijHhBcA0TI0JPKQoPU3LbRxGf0lssEIl2UJkRlbk1Wwzipg=
8vnYafvoAXsR_Wo2IpmSLqan3g2uDSUQ$
>
> Also make sure the new firmware has proper PCI ID so that xhci driver run=
s
> the correct ASMedia quirks
>
> This one especially:
> 9da5a1092b13 xhci: Bad Ethernet performance plugged in ASM1042A host
>
> Thanks
> Mathias



--=20
Joe Bolling (he/him)
Hardware Engineer
Boston Dynamics
jbolling@bostondynamics.com
