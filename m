Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05588BA185
	for <lists+linux-usb@lfdr.de>; Sun, 22 Sep 2019 10:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfIVIfb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Sep 2019 04:35:31 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:52806 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfIVIfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Sep 2019 04:35:31 -0400
Received: by mail-wm1-f53.google.com with SMTP id x2so6553123wmj.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Sep 2019 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AgbnPBRhCSXoNOUvqp0Hr2/jLPxDty0mDTI87UvhhWc=;
        b=Bf6REYvadphjvbWm0/lC6uiytZvHcamYBFD2UgCp8zkuTVBPLh5k06Ksckm4PxlRen
         SIAkp2hLq8hOEXNESR8RObeWc61ca3wbxvw/Cmo++9uB8umVdTIyP65FUyP1s4Jb2HFZ
         MWIT3RqJTCa5wI35OzAenw3QI59Cn6yOmCaM4S28ECE8BJuZYhJSizYaeDSOh9RVd3cJ
         i2VfGVTq9D+9IoqSOZM7GvEejp2xqnoFRThs/NrIrbvxhyeykvLdO5tXusGTjPbm6LEh
         y1GHowkUQ/EVbw5ySeN9mLoQ1t6dXiPvrshud6GUAoE5VXlR3USOKGl5sTy9h3Ep/eZD
         S5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AgbnPBRhCSXoNOUvqp0Hr2/jLPxDty0mDTI87UvhhWc=;
        b=HhgWSJkxFf4Zv3A8IoE6wrMPeDCX4tICNDDDoXsHVh31LvDRgPzCLz4CKMCfaGWAiR
         6Ib/pHWRCj966HkVZvapAViBvKgOB/fU0+QGW/Hd/YzOf0ZqZ6pGN94ocB3gnIA9l+hI
         SJqbd5LKKFLwj4fosoKxBnlUz2HlKmBjHD74de15JNNRjMppgq1uXxkr832hH1R7p3W8
         tWlb1PhScc9357CFTOeVHrkU2WflpWHG28p9vAbWm6LOaUN95ByTaq4jzhJSOUMRGPbx
         vLdTrinTpmZutbu+wY2l6RonMLeXT+1j/yG6Pv8uMDj3nxoZ0Rh96NlJfRiYgYAbuHMT
         OpLw==
X-Gm-Message-State: APjAAAVvE4NIIxiuTT+vqECdv5igpNesdH9OH9T9Mi0kvikkipPeEvAQ
        qIzkUXqU8d504NaEFdPzF/lLGJ8cuDJEmeLl7/4KkN4N
X-Google-Smtp-Source: APXvYqyVHQvZp+wvaO6yMRb4fBlckCIOlFu5l5YuQ8LojfoXTkH05hUFmppQOiBHwfVqwv8EAbz1xYUyXYUxR8ZrxMc=
X-Received: by 2002:a1c:a5c3:: with SMTP id o186mr10247486wme.51.1569141329050;
 Sun, 22 Sep 2019 01:35:29 -0700 (PDT)
MIME-Version: 1.0
From:   alex zheng <tc0721@gmail.com>
Date:   Sun, 22 Sep 2019 16:34:52 +0800
Message-ID: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
Subject: BUG report: usb: dwc3: Link TRB triggered an intterupt without IOC
 being setted
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I am a user of dwc3 USB host controller, I found there are some
confused behavior of trb event on this controller.
When I run a raw USB data transfer(run bulk in&out transfer with
libusb) and iperf3(over rndis) at the same time,
there are some strange interrupts occurs and make the driver report
error(ERROR DMA transfer).
And:
1. this problem only hapened in USB SS mode
2. this problem seems not hapen when I run same test case with other
xhci controller(such as asmedia/intel pcie xhci controller) on PC.
3. the kernel version is 4.9.130

I think this may be a hw bug of DWC3 USB controller, could anyone
please give me some help to debug this problem=EF=BC=9F

The detail log see as below:
[  131.074102] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: xHCI
handle event, 8000
27630 [  131.074109] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
process trans event : ep_index =3D 11, event_dma =3D 1eb13e90
27631 [  131.074117] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
inc_deq, start trb dma =3D 1eb13e90, dequeue_p =3D e482ce90, trb_free num
=3D 1871, ring type =3D 2
27632 [  131.074123] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
inc_deq 111, start trb dma =3D 1eb13ea0, dequeue_p =3D e482cea0, trb_free
num =3D 1872, ring type =3D 2
27633 [  131.074130] c0 3 (ksoftirqd/0) xhci-hcd xh[  133.057617] c0 3
(ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: ERROR Transfer event TRB DMA
ptr not part of current TD ep_index 16 comp_code 1
27634 [  133.059312] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb0fff0 trb-start 000000001eb10000
trb-end 000000001eb10000 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27635 [  133.066215] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1
27636 [  133.067908] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb10000 trb-start 000000001eb10230
trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27637 [  133.070572] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1
27638 [  133.072260] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb10010 trb-start 000000001eb10230
trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27639 [  133.075052] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1
27640 [  133.076739] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb10020 trb-start 000000001eb10230
trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27641 [  133.079472] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1
27642 [  133.081159] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb10030 trb-start 000000001eb10230
trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27643 [  133.083896] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1
27644 [  133.085584] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
Looking for event-dma 000000001eb10040 trb-start 000000001eb10230
trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
000000001eb10ff0
27645 [  133.088328] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
comp_code 1

1. According these logs above the link trb whose address is 0x1eb0fff0
occurs a transfer event, but this DMA address is not in the trb ring,
then the driver report an error(and followed a few error logs witch
invalid DMA address).
2. I dump the data of the address(0x1eb0fff0) and find the IOC bit is
not set, see as below:
# dump_reg.sh 0x1eb0fff0 4
0x1eb0fff0:0x1EB10000 0x00000000 0x00000000 0x00001800
