Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C05161BED
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 20:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgBQTxg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 14:53:36 -0500
Received: from mail-qt1-f182.google.com ([209.85.160.182]:37182 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbgBQTxg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 14:53:36 -0500
Received: by mail-qt1-f182.google.com with SMTP id w47so12864776qtk.4
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 11:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=5FCNgjnteQ0OyYqtkh0NymYoXBRl4Pb7b/qKGOfqyHw=;
        b=K4VHEb7uWe7s8epMPfElb4KMwxgbyEweI0BKran3Ied6o9vY/hFjjb12g4o68DWaI4
         05Q4BT/6NyafhoDXo0q1v5ibv8d+sWUWRr4tr6iZMHP3WcXob1k5OS4003IzQzcaMoWG
         ae720+renJqzonLSPEdrw13zJ2uBBp2ttKx5kB3LDqb06L10jn3PBRDr6KpJRKxHoGi2
         gm1dMA+FpueiyW+jUzTlLWw2KsNogn+hNVdbIFg+IGwu5/rCtjKou00XO7rGO8nsa9MW
         tcrqUPaypWEc3CDkcENwLmXtm57isa8S4edFPrEIUqBkX2YaKvieGqooYCVcKD8kx4uP
         Cydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=5FCNgjnteQ0OyYqtkh0NymYoXBRl4Pb7b/qKGOfqyHw=;
        b=OpdNJn5jgUWBY2UNh5wYLPqMP6KAhx52GygAjiMCJzbD8Msel8Ra3i+BMC2LhnlCR8
         kkjAfySu2mSHDe0mHUVYqrcLv3YO38J0D17jIdGDQMnhKyoRJCq8Fmw4HUaTY5S3KgkL
         GFkwxHFPslL/hUpVzlWYAZo3Lp3lHGynJ0S1I+d0fs938XK2BJKf/VQnQ0n969LAK7S8
         AoDfQ33j0qnbdFCcD1dOGgjwZAI7oXAiUgvJMd52ErJ8nO+RdJzAiqqMHCT4yd64T5tE
         q3SObU0p27gUzmiDND5wMvEVUUcT0T1uzbsXWPNZiBh6K5pynMtpaG1d157/WxR+0Zpv
         nAlQ==
X-Gm-Message-State: APjAAAWu+qrjUp89Bsv8hfp+pHINBVRba/9+Ljc7Cn/PtD4NdeYG8CsK
        tJ6E4sOOeJC4NS59iKtQ9k3dMnkSYfQcyA==
X-Google-Smtp-Source: APXvYqyWqHrAhbb0GDkGdWufsaUq8vKyT9XRl99vAZbgnGXuuZ81gVq342muOz1TzHN6gqxw/eozZw==
X-Received: by 2002:ac8:7644:: with SMTP id i4mr14660181qtr.150.1581969209045;
        Mon, 17 Feb 2020 11:53:29 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id k29sm700226qtu.54.2020.02.17.11.53.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 11:53:28 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f50.google.com with SMTP id y8so8104978qvk.6
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 11:53:28 -0800 (PST)
X-Received: by 2002:a05:6214:6f0:: with SMTP id bk16mr14061443qvb.23.1581969206310;
 Mon, 17 Feb 2020 11:53:26 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com> <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
In-Reply-To: <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
Date:   Mon, 17 Feb 2020 16:53:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
Message-ID: <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Minas,

On Mon, Feb 17, 2020 at 10:26 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> Enable debug prints to get full dwc2 debug prints to see what happen
> with dwc2.

[ 1053.870042] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1053.870051] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1053.870069] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1053.870086] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0305, I=0409, L=00ff
[ 1053.870109] dwc2 30180000.usb: ep0: req e7f6a9ab: 66@abed5c1d,
noi=0, zero=1, snok=0
[ 1053.870128] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1053.870141] dwc2 30180000.usb: ureq->length:66 ureq->actual:0
[ 1053.870157] dwc2 30180000.usb: dwc2_hsotg_start_req: 2@66/66,
0x00100042 => 0x00000910
[ 1053.870172] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1053.870182] dwc2 30180000.usb: ep0 state:1
[ 1053.870193] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1053.870205] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1053.870242] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1053.870255] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1053.870273] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1053.870287] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00180066
[ 1053.870302] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 66
[ 1053.870316] dwc2 30180000.usb: req->length:66 req->actual:66 req->zero:1
[ 1053.870327] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1053.870377] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.870390] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.870405] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1053.870419] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=00000000
[ 1053.870430] dwc2 30180000.usb: zlp packet received
[ 1053.870445] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1053.870456] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1053.870472] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1053.870487] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1053.870499] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1053.870513] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1053.870526] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1053.870537] dwc2 30180000.usb: ep0 state:0
[ 1053.870548] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1053.870561] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1053.870585] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.870598] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.870612] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1053.870623] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1053.870641] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1053.870658] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0306, I=0409, L=00ff
[ 1053.870681] dwc2 30180000.usb: ep0: req e7f6a9ab: 26@abed5c1d,
noi=0, zero=1, snok=0
[ 1053.870698] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1053.870712] dwc2 30180000.usb: ureq->length:26 ureq->actual:0
[ 1053.870726] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@26/26,
0x0008001a => 0x00000910
[ 1053.870742] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1053.870752] dwc2 30180000.usb: ep0 state:1
[ 1053.870763] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1053.870776] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1053.870806] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1053.870819] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1053.870835] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1053.870849] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=0010004c
[ 1053.870866] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 26
[ 1053.870878] dwc2 30180000.usb: req->length:26 req->actual:26 req->zero:1
[ 1053.870889] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1053.870931] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.870945] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.870962] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1053.870976] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=60000078
[ 1053.870986] dwc2 30180000.usb: zlp packet received
[ 1053.871002] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1053.871014] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1053.871030] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1053.871046] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1053.871058] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1053.871072] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1053.871086] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1053.871097] dwc2 30180000.usb: ep0 state:0
[ 1053.871110] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1053.871122] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1053.872817] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.872834] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.872850] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1053.872862] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1053.872880] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1053.872897] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0300, I=0000, L=00ff
[ 1053.872920] dwc2 30180000.usb: ep0: req e7f6a9ab: 4@abed5c1d,
noi=0, zero=1, snok=0
[ 1053.872939] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1053.872950] dwc2 30180000.usb: ureq->length:4 ureq->actual:0
[ 1053.872966] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@4/4,
0x00080004 => 0x00000910
[ 1053.872980] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1053.872992] dwc2 30180000.usb: ep0 state:1
[ 1053.873005] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1053.873021] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1053.873060] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1053.873073] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1053.873091] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1053.873112] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00080048
[ 1053.873129] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 4
[ 1053.873142] dwc2 30180000.usb: req->length:4 req->actual:4 req->zero:1
[ 1053.873155] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1053.873202] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.873216] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.873235] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1053.873248] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=20000070
[ 1053.873259] dwc2 30180000.usb: zlp packet received
[ 1053.873277] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1053.873290] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1053.873306] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1053.873324] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1053.873338] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1053.873352] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1053.873366] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1053.873380] dwc2 30180000.usb: ep0 state:0
[ 1053.873390] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1053.873404] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1053.873432] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.873446] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1053.873461] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1053.873474] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1053.873492] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1053.873512] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=00ff
[ 1053.873532] dwc2 30180000.usb: driver->setup() ret -22
[ 1053.873542] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1053.873558] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1053.873567] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1053.873583] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1053.873600] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1053.873613] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1053.873627] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1053.873640] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1053.873650] dwc2 30180000.usb: ep0 state:0
[ 1053.873663] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1053.873675] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80228000
[ 1053.873873] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1053.873894] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1053.873912] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1053.873927] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00098200, DXEPTSIZ=140ede0a
[ 1053.873948] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
963b7097, 0 => 6513dd96
[ 1053.873978] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00098200, ep 2, dir out
[ 1053.873991] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1053.874009] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1053.874028] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1053.874042] dwc2 30180000.usb: ep0 state:0
[ 1053.874054] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84098200
[ 1053.874066] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80098200
[ 1054.053865] dwc2 30180000.usb: ep2out: req 963b7097: 512@d2001eff,
noi=0, zero=0, snok=0
[ 1054.108727] dwc2 30180000.usb: ep1in: req 01eff31b: 353@bf8d62d8,
noi=0, zero=1, snok=0
[ 1054.108761] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x008a8200, ep 1, dir in
[ 1054.108778] dwc2 30180000.usb: ureq->length:353 ureq->actual:0
[ 1054.108799] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@353/353,
0x20080161 => 0x00000930
[ 1054.108819] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1054.108833] dwc2 30180000.usb: ep0 state:0
[ 1054.108846] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x848a8200
[ 1054.108862] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80888200
[ 1054.108909] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.108930] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1054.108954] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1054.108972] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00898200, DXEPTSIZ=14d61208
[ 1054.108994] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 353
[ 1054.109008] dwc2 30180000.usb: req->length:353 req->actual:353 req->zero:1
[ 1054.109029] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
01eff31b, 0 => b0bb1e62
[ 1054.212217] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.212241] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1054.212264] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1054.212285] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00088200, DXEPTSIZ=1406dd48
[ 1054.212317] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
1ed2ea34, 0 => 6513dd96
[ 1054.212380] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00088200, ep 2, dir out
[ 1054.212399] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1054.212420] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1054.212437] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1054.212452] dwc2 30180000.usb: ep0 state:0
[ 1054.212463] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84088200
[ 1054.212479] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80088200
[ 1054.212571] dwc2 30180000.usb: ep2out: req 1ed2ea34: 512@12ae06de,
noi=0, zero=0, snok=0
[ 1054.267399] dwc2 30180000.usb: ep1in: req 01eff31b: 353@bf8d62d8,
noi=0, zero=1, snok=0
[ 1054.267438] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00898200, ep 1, dir in
[ 1054.267457] dwc2 30180000.usb: ureq->length:353 ureq->actual:0
[ 1054.267480] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@353/353,
0x20080161 => 0x00000930
[ 1054.267498] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1054.267514] dwc2 30180000.usb: ep0 state:0
[ 1054.267527] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84898200
[ 1054.267541] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80898200
[ 1054.267590] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.267608] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1054.267633] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1054.267653] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00888200, DXEPTSIZ=14ce10a7
[ 1054.267674] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 353
[ 1054.267690] dwc2 30180000.usb: req->length:353 req->actual:353 req->zero:1
[ 1054.267712] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
01eff31b, 0 => b0bb1e62
[ 1054.370753] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.370777] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1054.370800] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1054.370818] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00098200, DXEPTSIZ=13fedc86
[ 1054.370848] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
21db14dd, 0 => 6513dd96
[ 1054.370907] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00098200, ep 2, dir out
[ 1054.370924] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1054.370943] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1054.370961] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1054.370976] dwc2 30180000.usb: ep0 state:0
[ 1054.370987] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84098200
[ 1054.371003] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80098200
[ 1054.371122] dwc2 30180000.usb: ep2out: req 21db14dd: 512@229f7a33,
noi=0, zero=0, snok=0
[ 1054.426075] dwc2 30180000.usb: ep1in: req 01eff31b: 353@bf8d62d8,
noi=0, zero=1, snok=0
[ 1054.426112] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00888200, ep 1, dir in
[ 1054.426129] dwc2 30180000.usb: ureq->length:353 ureq->actual:0
[ 1054.426149] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@353/353,
0x20080161 => 0x00000930
[ 1054.426168] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1054.426184] dwc2 30180000.usb: ep0 state:0
[ 1054.426197] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84888200
[ 1054.426211] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80888200
[ 1054.426257] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.426278] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1054.426298] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1054.426315] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00898200, DXEPTSIZ=14c60f46
[ 1054.426335] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 353
[ 1054.426352] dwc2 30180000.usb: req->length:353 req->actual:353 req->zero:1
[ 1054.426375] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
01eff31b, 0 => b0bb1e62
[ 1054.529548] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.529579] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1054.529602] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1054.529621] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00088200, DXEPTSIZ=13f6dbc4
[ 1054.529652] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
26bd9b9f, 0 => 6513dd96
[ 1054.529704] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00088200, ep 2, dir out
[ 1054.529721] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1054.529741] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1054.529758] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1054.529774] dwc2 30180000.usb: ep0 state:0
[ 1054.529785] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84088200
[ 1054.529801] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80088200
[ 1054.529928] dwc2 30180000.usb: ep2out: req 26bd9b9f: 512@06b7dbca,
noi=0, zero=0, snok=0
[ 1054.537095] dwc2 30180000.usb: dwc2_hsotg_irq: 04008428 00000400
(d88c3cc4) retry 8
[ 1054.537119] dwc2 30180000.usb: GINTSTS_ErlySusp
[ 1054.540147] dwc2 30180000.usb: gintsts=04008828  gintmsk=d88c3cc4
[ 1054.540172] dwc2 30180000.usb: USB SUSPEND
[ 1054.540191] dwc2 30180000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x5ad801
[ 1054.540211] dwc2 30180000.usb: DSTS.Suspend Status=1 HWCFG4.Power
Optimize=1 HWCFG4.Hibernation=0
[ 1054.540242] dwc2 30180000.usb: dwc2_hsotg_irq: 04008028 00000000
(d88c3cc4) retry 8
[ 1054.585402] dwc2 30180000.usb: ep1in: req 01eff31b: 353@bf8d62d8,
noi=0, zero=1, snok=0
[ 1054.585422] dwc2 30180000.usb: dwc2_hsotg_ep_queue: submit request
only in active state
[ 1054.661667] dwc2 30180000.usb: dwc2_hsotg_irq: 04008428 00000400
(d88c3cc4) retry 8
[ 1054.661694] dwc2 30180000.usb: GINTSTS_ErlySusp
[ 1054.664715] dwc2 30180000.usb: gintsts=04008828  gintmsk=d88c3cc4
[ 1054.664741] dwc2 30180000.usb: USB SUSPEND
[ 1054.664760] dwc2 30180000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x5ad801
[ 1054.664781] dwc2 30180000.usb: DSTS.Suspend Status=1 HWCFG4.Power
Optimize=1 HWCFG4.Hibernation=0
[ 1054.664807] dwc2 30180000.usb: dwc2_hsotg_irq: 04008028 00000000
(d88c3cc4) retry 8
[ 1054.799737] dwc2 30180000.usb: dwc2_hsotg_irq: 04809028 00801000
(d88c3cc4) retry 8
[ 1054.799758] dwc2 30180000.usb: dwc2_hsotg_irq: USBRstDet
[ 1054.799776] dwc2 30180000.usb: dwc2_hsotg_irq: USBRst
[ 1054.799788] dwc2 30180000.usb: GNPTXSTS=00080010
[ 1054.799816] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, -108 => 84063983
[ 1054.799838] dwc2 30180000.usb: dwc2_hsotg_complete_setup: failed -108
[ 1054.799866] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
f278d077, -108 => 6513dd96
[ 1054.799914] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
841f6058, -108 => 6513dd96
[ 1054.799935] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
5215e7bb, -108 => 6513dd96
[ 1054.799954] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
9daf426b, -108 => 6513dd96
[ 1054.799976] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
9aafdbc0, -108 => 6513dd96
[ 1054.799995] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
03c36521, -108 => 6513dd96
[ 1054.800015] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
21266e76, -108 => 6513dd96
[ 1054.800033] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
00a94f37, -108 => 6513dd96
[ 1054.800052] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
fb52ff47, -108 => 6513dd96
[ 1054.800072] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
c53f7751, -108 => 6513dd96
[ 1054.800092] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
bcead652, -108 => 6513dd96
[ 1054.800110] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
53122b2a, -108 => 6513dd96
[ 1054.800129] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
963b7097, -108 => 6513dd96
[ 1054.800148] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
1ed2ea34, -108 => 6513dd96
[ 1054.800166] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
21db14dd, -108 => 6513dd96
[ 1054.800185] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
26bd9b9f, -108 => 6513dd96
[ 1054.800232] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep c5cae4f8)
[ 1054.800250] dwc2 30180000.usb: dwc2_hsotg_ep_stop_xfr: stopping
transfer on ep2out
[ 1054.800271] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08080200
[ 1054.800292] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 4ee0de58)
[ 1054.800304] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08890200
[ 1054.800402] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 022471aa)
[ 1054.800417] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x098c000a
[ 1054.800446] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 4ee0de58)
[ 1054.800458] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x088b0200
[ 1054.800472] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep c5cae4f8)
[ 1054.800483] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x080a0200
[ 1054.800496] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 022471aa)
[ 1054.800507] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x098e000a
[ 1054.800521] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 4d7d1abb)
[ 1054.800533] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800546] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 961b389a)
[ 1054.800558] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800573] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep cd493b4d)
[ 1054.800584] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800599] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 8ba68a83)
[ 1054.800613] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800628] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep ff21bf72)
[ 1054.800640] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800653] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 717d8735)
[ 1054.800665] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800680] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 15b03b70)
[ 1054.800692] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800707] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 23ec528d)
[ 1054.800718] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[ 1054.800735] dwc2 30180000.usb: HS UTMI+ PHY selected
[ 1054.800764] dwc2 30180000.usb: FIFOs reset, timeout at 100
[ 1054.800792] dwc2 30180000.usb: EP0: DIEPCTL0=0x00208000, DOEPCTL0=0x80228000
[ 1054.800808] dwc2 30180000.usb: gsintmsk now 0xd88c3cc4
[ 1054.800825] dwc2 30180000.usb: DCTL=0x00000000
[ 1054.803847] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.803872] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.803897] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x80208000, ep 0, dir out
[ 1054.803913] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.803933] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.803949] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.803961] dwc2 30180000.usb: ep0 state:0
[ 1054.803973] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80208000
[ 1054.803988] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80208000
[ 1054.804003] dwc2 30180000.usb: EP0: DIEPCTL0=0x00208000, DOEPCTL0=0x80208000
[ 1054.854485] dwc2 30180000.usb: dwc2_hsotg_irq: 04002020 00002000
(d88c3cc4) retry 8
[ 1054.854513] dwc2 30180000.usb: EnumDone (DSTS=0x001ad800)
[ 1054.854533] dwc2 30180000.usb: new device is high-speed
[ 1054.855048] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.855060] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup already queued???
[ 1054.855074] dwc2 30180000.usb: EP0: DIEPCTL0=0x00208000, DOEPCTL0=0x80208000
[ 1054.922959] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.922982] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.923005] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.923020] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.923048] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.923076] dwc2 30180000.usb: ctrl Type=00, Req=05, V=0036, I=0000, L=0000
[ 1054.923094] dwc2 30180000.usb: new address 54
[ 1054.923511] dwc2 30180000.usb: dwc2_hsotg_send_reply: buff 80653c92, len 0
[ 1054.923536] dwc2 30180000.usb: ep0: req 788a45df: 0@2fe5a4b6,
noi=0, zero=0, snok=0
[ 1054.923560] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.923576] dwc2 30180000.usb: ureq->length:0 ureq->actual:0
[ 1054.923597] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@0/0,
0x00080000 => 0x00000910
[ 1054.923614] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.923628] dwc2 30180000.usb: ep0 state:3
[ 1054.923640] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.923657] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.923758] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.923780] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.923798] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.923818] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=00000048
[ 1054.923837] dwc2 30180000.usb: zlp packet sent
[ 1054.923856] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
788a45df, 0 => 47923a45
[ 1054.923874] dwc2 30180000.usb: dwc2_hsotg_complete_oursetup: ep
c20b8608, req 788a45df
[ 1054.923892] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.923912] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.923937] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.923952] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.923968] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.923983] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.923995] dwc2 30180000.usb: ep0 state:0
[ 1054.924006] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.924019] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.939622] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.939640] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.939664] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.939680] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.939705] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.939732] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0100, I=0000, L=0008
[ 1054.939765] dwc2 30180000.usb: ep0: req e7f6a9ab: 8@abed5c1d,
noi=0, zero=0, snok=0
[ 1054.939787] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.939803] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.939822] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000910
[ 1054.939838] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.939850] dwc2 30180000.usb: ep0 state:1
[ 1054.939861] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.939874] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.939926] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.939943] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.939960] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.939976] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00180040
[ 1054.939998] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 8
[ 1054.940012] dwc2 30180000.usb: req->length:8 req->actual:8 req->zero:0
[ 1054.940027] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.940076] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.940091] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.940106] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.940123] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=40000078
[ 1054.940138] dwc2 30180000.usb: zlp packet received
[ 1054.940158] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.940173] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.940192] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.940213] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.940224] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.940238] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.940251] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.940264] dwc2 30180000.usb: ep0 state:0
[ 1054.940276] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.940288] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.940319] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.940334] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.940349] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.940360] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.940378] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.940396] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0100, I=0000, L=0012
[ 1054.940420] dwc2 30180000.usb: ep0: req e7f6a9ab: 18@abed5c1d,
noi=0, zero=0, snok=0
[ 1054.940436] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.940451] dwc2 30180000.usb: ureq->length:18 ureq->actual:0
[ 1054.940468] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@18/18,
0x00080012 => 0x00000910
[ 1054.940486] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.940496] dwc2 30180000.usb: ep0 state:1
[ 1054.940507] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.940522] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.940556] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.940569] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.940586] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.940600] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=0010002e
[ 1054.940617] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 18
[ 1054.940629] dwc2 30180000.usb: req->length:18 req->actual:18 req->zero:0
[ 1054.940642] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.940688] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.940703] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.940717] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.940731] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=20000070
[ 1054.940743] dwc2 30180000.usb: zlp packet received
[ 1054.940762] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.940774] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.940790] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.940808] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.940821] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.940836] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.940849] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.940859] dwc2 30180000.usb: ep0 state:0
[ 1054.940870] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.940884] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.940915] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.940927] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.940942] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.940952] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.940972] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.940988] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0200, I=0000, L=0009
[ 1054.941016] dwc2 30180000.usb: ep0: req e7f6a9ab: 9@abed5c1d,
noi=0, zero=0, snok=0
[ 1054.941035] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.941048] dwc2 30180000.usb: ureq->length:9 ureq->actual:0
[ 1054.941062] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@9/9,
0x00080009 => 0x00000910
[ 1054.941075] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.941085] dwc2 30180000.usb: ep0 state:1
[ 1054.941098] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.941111] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.941146] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.941160] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.941176] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.941192] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00080025
[ 1054.941208] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 9
[ 1054.941222] dwc2 30180000.usb: req->length:9 req->actual:9 req->zero:0
[ 1054.941234] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.941262] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.941276] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.941291] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.941305] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=00000068
[ 1054.941315] dwc2 30180000.usb: zlp packet received
[ 1054.941333] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.941347] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.941363] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.941378] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.941391] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.941405] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.941418] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.941428] dwc2 30180000.usb: ep0 state:0
[ 1054.941441] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.941455] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.941484] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.941499] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.941514] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.941526] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.941544] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.941562] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0200, I=0000, L=004b
[ 1054.941585] dwc2 30180000.usb: ep0: req e7f6a9ab: 75@abed5c1d,
noi=0, zero=0, snok=0
[ 1054.941605] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.941618] dwc2 30180000.usb: ureq->length:75 ureq->actual:0
[ 1054.941634] dwc2 30180000.usb: dwc2_hsotg_start_req: 2@75/75,
0x0010004b => 0x00000910
[ 1054.941650] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.941664] dwc2 30180000.usb: ep0 state:1
[ 1054.941674] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.941688] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.941724] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.941737] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.941755] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.941768] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=0018005a
[ 1054.941786] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 75
[ 1054.941802] dwc2 30180000.usb: req->length:75 req->actual:75 req->zero:0
[ 1054.941813] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.941849] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.941862] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.941877] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.941891] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=60000060
[ 1054.941902] dwc2 30180000.usb: zlp packet received
[ 1054.941918] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.941932] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.941949] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.941967] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.941979] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.941993] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.942007] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.942019] dwc2 30180000.usb: ep0 state:0
[ 1054.942031] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.942045] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.942073] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.942085] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.942100] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.942111] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.942129] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.942146] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0300, I=0000, L=00ff
[ 1054.942170] dwc2 30180000.usb: ep0: req e7f6a9ab: 4@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.942189] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.942201] dwc2 30180000.usb: ureq->length:4 ureq->actual:0
[ 1054.942215] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@4/4,
0x00080004 => 0x00000910
[ 1054.942229] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.942239] dwc2 30180000.usb: ep0 state:1
[ 1054.942251] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.942263] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.942296] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.942311] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.942327] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.942341] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00100056
[ 1054.942357] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 4
[ 1054.942369] dwc2 30180000.usb: req->length:4 req->actual:4 req->zero:1
[ 1054.942380] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.942416] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.942431] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.942446] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.942460] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=40000058
[ 1054.942470] dwc2 30180000.usb: zlp packet received
[ 1054.942487] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.942501] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.942516] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.942532] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.942547] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.942563] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.942575] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.942586] dwc2 30180000.usb: ep0 state:0
[ 1054.942597] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.942609] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.942642] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.942656] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.942672] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.942683] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.942703] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.942720] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0302, I=0409, L=00ff
[ 1054.942748] dwc2 30180000.usb: ep0: req e7f6a9ab: 20@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.942766] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.942778] dwc2 30180000.usb: ureq->length:20 ureq->actual:0
[ 1054.942792] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@20/20,
0x00080014 => 0x00000910
[ 1054.942807] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.942817] dwc2 30180000.usb: ep0 state:1
[ 1054.942829] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.942845] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.942877] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.942891] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.942908] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.942922] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00080042
[ 1054.942937] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 20
[ 1054.942950] dwc2 30180000.usb: req->length:20 req->actual:20 req->zero:1
[ 1054.942962] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.943001] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.943015] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.943030] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.943044] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=20000050
[ 1054.943055] dwc2 30180000.usb: zlp packet received
[ 1054.943070] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.943082] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.943099] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.943117] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.943129] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.943143] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.943158] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.943170] dwc2 30180000.usb: ep0 state:0
[ 1054.943182] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.943196] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.943225] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.943238] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.943253] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.943263] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.943281] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.943301] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0301, I=0409, L=00ff
[ 1054.943323] dwc2 30180000.usb: ep0: req e7f6a9ab: 20@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.943342] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.943354] dwc2 30180000.usb: ureq->length:20 ureq->actual:0
[ 1054.943370] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@20/20,
0x00080014 => 0x00000910
[ 1054.943382] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.943393] dwc2 30180000.usb: ep0 state:1
[ 1054.943405] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.943419] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.943451] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.943467] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.943483] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.943498] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=0000002e
[ 1054.943518] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 20
[ 1054.943532] dwc2 30180000.usb: req->length:20 req->actual:20 req->zero:1
[ 1054.943545] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.943627] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.943644] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.943660] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.943676] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=00000048
[ 1054.943688] dwc2 30180000.usb: zlp packet received
[ 1054.943707] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.943722] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.943741] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.943760] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.943772] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.943788] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.943804] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.943816] dwc2 30180000.usb: ep0 state:0
[ 1054.943829] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.943843] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.943876] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.943890] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.943905] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.943916] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.943934] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.943955] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=00ff
[ 1054.943974] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.943988] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.944006] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.944017] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.944032] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.944051] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.944063] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.944077] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.944090] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.944101] dwc2 30180000.usb: ep0 state:0
[ 1054.944112] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.944125] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.944157] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.944172] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.944186] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.944197] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.944214] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.944231] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=00ff
[ 1054.944244] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.944255] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.944271] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.944281] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.944297] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.944315] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.944327] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.944341] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.944354] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.944364] dwc2 30180000.usb: ep0 state:0
[ 1054.944377] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.944391] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.944424] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.944438] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.944453] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.944465] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.944485] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.944502] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=00ff
[ 1054.944518] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.944530] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.944544] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.944555] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.944571] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.944585] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.944597] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.944611] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.944627] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.944637] dwc2 30180000.usb: ep0 state:0
[ 1054.944648] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.944661] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80228000
[ 1054.944690] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.944706] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.944722] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.944733] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.944752] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.944770] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=0002
[ 1054.944786] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.944796] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.944810] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.944821] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.944837] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.944855] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.944868] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.944882] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.944895] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.944905] dwc2 30180000.usb: ep0 state:0
[ 1054.944916] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.944929] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.944959] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.944972] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.944986] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.944997] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.945014] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.945030] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=0002
[ 1054.945045] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.945055] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.945069] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.945080] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.945096] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.945112] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.945123] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.945137] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.945150] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.945161] dwc2 30180000.usb: ep0 state:0
[ 1054.945172] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.945184] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.945214] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.945227] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.945243] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.945255] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.945275] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.945291] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=0002
[ 1054.945305] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.945316] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.945330] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.945340] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.945356] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.945374] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.945388] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.945402] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.945415] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.945427] dwc2 30180000.usb: ep0 state:0
[ 1054.945438] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.945451] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80228000
[ 1054.946562] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.946576] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.946592] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.946604] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.946621] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.946638] dwc2 30180000.usb: ctrl Type=00, Req=09, V=0002, I=0000, L=0000
[ 1054.946658] g_serial gadget: high-speed config #2: CDC ACM config
[ 1054.947231] dwc2 30180000.usb: dwc2_hsotg_ep_enable: ep ep3in: a
0x83, attr 0x03, mps 0x000a, intr 9
[ 1054.947251] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read
DxEPCTL=0x018e0400 from 0x00000960
[ 1054.947276] dwc2 30180000.usb: dwc2_hsotg_ep_enable: write DxEPCTL=0x118e800a
[ 1054.947290] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read DxEPCTL=0x018e800a
[ 1054.947313] dwc2 30180000.usb: dwc2_hsotg_ep_enable: ep ep1in: a
0x81, attr 0x02, mps 0x0200, intr 0
[ 1054.947329] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read
DxEPCTL=0x008b0400 from 0x00000920
[ 1054.947347] dwc2 30180000.usb: dwc2_hsotg_ep_enable: write DxEPCTL=0x108b8200
[ 1054.947360] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read DxEPCTL=0x008a8200
[ 1054.947377] dwc2 30180000.usb: dwc2_hsotg_ep_enable: ep ep2out: a
0x02, attr 0x02, mps 0x0200, intr 0
[ 1054.947390] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read
DxEPCTL=0x000a0400 from 0x00000b40
[ 1054.947402] dwc2 30180000.usb: dwc2_hsotg_ep_enable: write DxEPCTL=0x100a8200
[ 1054.947414] dwc2 30180000.usb: dwc2_hsotg_ep_enable: read DxEPCTL=0x000a8200
[ 1054.947485] dwc2 30180000.usb: ep2out: req 788a45df: 512@0542b9d7,
noi=0, zero=0, snok=0
[ 1054.947508] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x000a8200, ep 2, dir out
[ 1054.947521] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1054.947537] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1054.947553] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1054.947566] dwc2 30180000.usb: ep0 state:3
[ 1054.947577] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x840a8200
[ 1054.947590] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80088200
[ 1054.947609] dwc2 30180000.usb: ep2out: req a40532cf: 512@51b87fad,
noi=0, zero=0, snok=0
[ 1054.947631] dwc2 30180000.usb: ep2out: req b11aed86: 512@6ac5f592,
noi=0, zero=0, snok=0
[ 1054.947649] dwc2 30180000.usb: ep2out: req 1190cac0: 512@fce7854c,
noi=0, zero=0, snok=0
[ 1054.947666] dwc2 30180000.usb: ep2out: req b620c645: 512@d63e4d5b,
noi=0, zero=0, snok=0
[ 1054.947683] dwc2 30180000.usb: ep2out: req 61d44c54: 512@1fc1d262,
noi=0, zero=0, snok=0
[ 1054.947701] dwc2 30180000.usb: ep2out: req ce9944e1: 512@0f49be3a,
noi=0, zero=0, snok=0
[ 1054.947720] dwc2 30180000.usb: ep2out: req a8c33c25: 512@1c5e703c,
noi=0, zero=0, snok=0
[ 1054.947737] dwc2 30180000.usb: ep2out: req 27e820b2: 512@2d4f8b5d,
noi=0, zero=0, snok=0
[ 1054.947755] dwc2 30180000.usb: ep2out: req 24da46aa: 512@ddb75599,
noi=0, zero=0, snok=0
[ 1054.947772] dwc2 30180000.usb: ep2out: req 837d9562: 512@4ccef93d,
noi=0, zero=0, snok=0
[ 1054.947790] dwc2 30180000.usb: ep2out: req ad58562c: 512@b1448277,
noi=0, zero=0, snok=0
[ 1054.947807] dwc2 30180000.usb: ep2out: req 19349ad6: 512@cdcf0375,
noi=0, zero=0, snok=0
[ 1054.947824] dwc2 30180000.usb: ep2out: req 22d0fa51: 512@ffc24d73,
noi=0, zero=0, snok=0
[ 1054.947842] dwc2 30180000.usb: ep2out: req 3fd4a46f: 512@bf469af9,
noi=0, zero=0, snok=0
[ 1054.947859] dwc2 30180000.usb: ep2out: req b2cd63ff: 512@e2d90c44,
noi=0, zero=0, snok=0
[ 1054.947886] dwc2 30180000.usb: ep3in: req a135c511: 10@e89c4f72,
noi=0, zero=0, snok=0
[ 1054.947902] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x018e800a, ep 3, dir in
[ 1054.947914] dwc2 30180000.usb: ureq->length:10 ureq->actual:0
[ 1054.947929] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@10/10,
0x2008000a => 0x00000970
[ 1054.947944] dwc2 30180000.usb: dwc2_hsotg_start_req: 67100000 pad
=> 0x00000974
[ 1054.947955] dwc2 30180000.usb: ep0 state:3
[ 1054.947966] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x858e800a
[ 1054.947980] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x818c800a
[ 1054.948004] dwc2 30180000.usb: ep0: req e7f6a9ab: 0@abed5c1d,
noi=0, zero=0, snok=0
[ 1054.948021] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.948034] dwc2 30180000.usb: ureq->length:0 ureq->actual:0
[ 1054.948048] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@0/0,
0x00080000 => 0x00000910
[ 1054.948060] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.948071] dwc2 30180000.usb: ep0 state:3
[ 1054.948082] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.948094] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.948134] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.948150] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000009
[ 1054.948168] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.948182] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=0018002e
[ 1054.948196] dwc2 30180000.usb: zlp packet sent
[ 1054.948215] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.948230] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.948246] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.948265] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.948277] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.948291] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.948305] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.948316] dwc2 30180000.usb: ep0 state:0
[ 1054.948327] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.948340] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.948361] dwc2 30180000.usb: dwc2_hsotg_epint: ep3(in) DxEPINT=0x00000001
[ 1054.948377] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x018c800a, DXEPTSIZ=0007fce0
[ 1054.948394] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 10
[ 1054.948409] dwc2 30180000.usb: req->length:10 req->actual:10 req->zero:0
[ 1054.948428] dwc2 30180000.usb: complete: ep 022471aa ep3in, req
a135c511, 0 => 493062e0
[ 1054.948470] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.948485] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.948503] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.948515] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.948535] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.948557] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0304, I=0409, L=00ff
[ 1054.948584] dwc2 30180000.usb: ep0: req e7f6a9ab: 30@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.948601] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.948613] dwc2 30180000.usb: ureq->length:30 ureq->actual:0
[ 1054.948629] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@30/30,
0x0008001e => 0x00000910
[ 1054.948643] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.948655] dwc2 30180000.usb: ep0 state:1
[ 1054.948666] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.948680] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.948715] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.948727] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.948746] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.948760] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00100010
[ 1054.948775] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 30
[ 1054.948788] dwc2 30180000.usb: req->length:30 req->actual:30 req->zero:1
[ 1054.948801] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.948839] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.948854] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.948869] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.948882] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=00000008
[ 1054.948894] dwc2 30180000.usb: zlp packet received
[ 1054.948913] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.948925] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.948941] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.948957] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.948969] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.948983] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.948998] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.949010] dwc2 30180000.usb: ep0 state:0
[ 1054.949023] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.949037] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.949068] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.949081] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.949096] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.949107] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.949125] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.949142] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0305, I=0409, L=00ff
[ 1054.949165] dwc2 30180000.usb: ep0: req e7f6a9ab: 66@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.949181] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.949191] dwc2 30180000.usb: ureq->length:66 ureq->actual:0
[ 1054.949206] dwc2 30180000.usb: dwc2_hsotg_start_req: 2@66/66,
0x00100042 => 0x00000910
[ 1054.949220] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.949231] dwc2 30180000.usb: ep0 state:1
[ 1054.949242] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.949255] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.949289] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.949303] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.949319] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.949333] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=0000004e
[ 1054.949348] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 66
[ 1054.949360] dwc2 30180000.usb: req->length:66 req->actual:66 req->zero:1
[ 1054.949373] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.949405] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.949420] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.949436] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.949452] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=60000000
[ 1054.949464] dwc2 30180000.usb: zlp packet received
[ 1054.949482] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.949497] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.949513] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.949528] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.949540] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.949554] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.949567] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.949579] dwc2 30180000.usb: ep0 state:0
[ 1054.949591] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.949606] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.949641] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.949653] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.949668] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.949679] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.949698] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.949714] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0306, I=0409, L=00ff
[ 1054.949737] dwc2 30180000.usb: ep0: req e7f6a9ab: 26@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.949754] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.949769] dwc2 30180000.usb: ureq->length:26 ureq->actual:0
[ 1054.949784] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@26/26,
0x0008001a => 0x00000910
[ 1054.949797] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.949809] dwc2 30180000.usb: ep0 state:1
[ 1054.949820] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.949834] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.949869] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.949881] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.949896] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.949911] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00180034
[ 1054.949927] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 26
[ 1054.949939] dwc2 30180000.usb: req->length:26 req->actual:26 req->zero:1
[ 1054.949952] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.949985] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.949997] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.950012] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.950026] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=60000078
[ 1054.950036] dwc2 30180000.usb: zlp packet received
[ 1054.950052] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.950064] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.950080] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.950097] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.950111] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.950125] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.950137] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.950148] dwc2 30180000.usb: ep0 state:0
[ 1054.950159] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.950171] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.951154] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.951168] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.951184] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.951197] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.951216] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.951233] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0300, I=0000, L=00ff
[ 1054.951256] dwc2 30180000.usb: ep0: req e7f6a9ab: 4@abed5c1d,
noi=0, zero=1, snok=0
[ 1054.951276] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir in
[ 1054.951291] dwc2 30180000.usb: ureq->length:4 ureq->actual:0
[ 1054.951305] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@4/4,
0x00080004 => 0x00000910
[ 1054.951318] dwc2 30180000.usb: dwc2_hsotg_start_req: 67556000 pad
=> 0x00000914
[ 1054.951330] dwc2 30180000.usb: ep0 state:1
[ 1054.951343] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
[ 1054.951357] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[ 1054.951393] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1054.951409] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000001
[ 1054.951427] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
[ 1054.951442] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00008000, DXEPTSIZ=00100030
[ 1054.951460] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 4
[ 1054.951472] dwc2 30180000.usb: req->length:4 req->actual:4 req->zero:1
[ 1054.951486] dwc2 30180000.usb: Receiving zero-length packet on ep0
[ 1054.951519] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.951533] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.951551] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
[ 1054.951565] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00028000, DXEPTSIZ=40000070
[ 1054.951577] dwc2 30180000.usb: zlp packet received
[ 1054.951595] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
e7f6a9ab, 0 => a0d18b50
[ 1054.951609] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.951625] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.951641] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00028000, ep 0, dir out
[ 1054.951652] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.951666] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.951679] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.951689] dwc2 30180000.usb: ep0 state:0
[ 1054.951702] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
[ 1054.951717] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
[ 1054.951743] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.951756] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00010000
[ 1054.951772] dwc2 30180000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000009
[ 1054.951782] dwc2 30180000.usb: dwc2_hsotg_epint: Setup/Timeout
[ 1054.951800] dwc2 30180000.usb: complete: ep c20b8608 ep0, req
f2c3bdd7, 0 => 84063983
[ 1054.951816] dwc2 30180000.usb: ctrl Type=80, Req=06, V=0303, I=0409, L=00ff
[ 1054.951833] dwc2 30180000.usb: driver->setup() ret -22
[ 1054.951844] dwc2 30180000.usb: ep0 stall (dir=1)
[ 1054.951860] dwc2 30180000.usb: written DXEPCTL=0x04228000 to
00000900 (DXEPCTL=0x00208000)
[ 1054.951869] dwc2 30180000.usb: dwc2_hsotg_enqueue_setup: queueing
setup request
[ 1054.951885] dwc2 30180000.usb: ep0: req f2c3bdd7: 8@7d68f802,
noi=0, zero=0, snok=0
[ 1054.951900] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00228000, ep 0, dir out
[ 1054.951912] dwc2 30180000.usb: ureq->length:8 ureq->actual:0
[ 1054.951926] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[ 1054.951938] dwc2 30180000.usb: dwc2_hsotg_start_req: 67558000 pad
=> 0x00000b14
[ 1054.951948] dwc2 30180000.usb: ep0 state:0
[ 1054.951959] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80228000
[ 1054.951972] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80228000
[ 1054.952469] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1054.952482] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1054.952498] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1054.952511] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00098200, DXEPTSIZ=13eedb02
[ 1054.952532] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
788a45df, 0 => 6513dd96
[ 1054.952564] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00098200, ep 2, dir out
[ 1054.952578] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1054.952592] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1054.952605] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1054.952615] dwc2 30180000.usb: ep0 state:0
[ 1054.952626] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84098200
[ 1054.952638] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80098200
[ 1055.132227] dwc2 30180000.usb: ep2out: req 788a45df: 512@0542b9d7,
noi=0, zero=0, snok=0
[ 1055.187167] dwc2 30180000.usb: ep1in: req b3bab221: 353@8cbff1b5,
noi=0, zero=1, snok=0
[ 1055.187204] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x008a8200, ep 1, dir in
[ 1055.187223] dwc2 30180000.usb: ureq->length:353 ureq->actual:0
[ 1055.187246] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@353/353,
0x20080161 => 0x00000930
[ 1055.187265] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1055.187279] dwc2 30180000.usb: ep0 state:0
[ 1055.187290] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x848a8200
[ 1055.187304] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80888200
[ 1055.187350] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1055.187370] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1055.187394] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1055.187413] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00898200, DXEPTSIZ=14be0de5
[ 1055.187432] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 353
[ 1055.187448] dwc2 30180000.usb: req->length:353 req->actual:353 req->zero:1
[ 1055.187469] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
b3bab221, 0 => b0bb1e62
[ 1055.290485] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1055.290506] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1055.290529] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1055.290550] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00088200, DXEPTSIZ=13e6da40
[ 1055.290583] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
a40532cf, 0 => 6513dd96
[ 1055.290645] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00088200, ep 2, dir out
[ 1055.290662] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1055.290682] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1055.290700] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1055.290714] dwc2 30180000.usb: ep0 state:0
[ 1055.290726] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84088200
[ 1055.290742] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80088200
[ 1055.290897] dwc2 30180000.usb: ep2out: req a40532cf: 512@51b87fad,
noi=0, zero=0, snok=0
[ 1055.346177] dwc2 30180000.usb: ep1in: req b3bab221: 353@8cbff1b5,
noi=0, zero=1, snok=0
[ 1055.346213] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00898200, ep 1, dir in
[ 1055.346231] dwc2 30180000.usb: ureq->length:353 ureq->actual:0
[ 1055.346252] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@353/353,
0x20080161 => 0x00000930
[ 1055.346273] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1055.346287] dwc2 30180000.usb: ep0 state:0
[ 1055.346299] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84898200
[ 1055.346316] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80898200
[ 1055.346364] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1055.346386] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1055.346409] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1055.346428] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00888200, DXEPTSIZ=14b60c84
[ 1055.346451] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 353
[ 1055.346465] dwc2 30180000.usb: req->length:353 req->actual:353 req->zero:1
[ 1055.346488] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
b3bab221, 0 => b0bb1e62
[ 1055.449424] dwc2 30180000.usb: dwc2_hsotg_irq: 04088028 00080000
(d88c3cc4) retry 8
[ 1055.449446] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00040000
[ 1055.449469] dwc2 30180000.usb: dwc2_hsotg_epint: ep2(out) DxEPINT=0x00000001
[ 1055.449489] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00098200, DXEPTSIZ=13ded97e
[ 1055.449523] dwc2 30180000.usb: complete: ep c5cae4f8 ep2out, req
b11aed86, 0 => 6513dd96
[ 1055.449583] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00098200, ep 2, dir out
[ 1055.449601] dwc2 30180000.usb: ureq->length:512 ureq->actual:0
[ 1055.449624] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@512/512,
0x00080200 => 0x00000b50
[ 1055.449642] dwc2 30180000.usb: dwc2_hsotg_start_req: 67102000 pad
=> 0x00000b54
[ 1055.449657] dwc2 30180000.usb: ep0 state:0
[ 1055.449668] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84098200
[ 1055.449684] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80098200
[ 1055.449841] dwc2 30180000.usb: ep2out: req b11aed86: 512@6ac5f592,
noi=0, zero=0, snok=0
[ 1055.504683] dwc2 30180000.usb: ep1in: req b3bab221: 352@8cbff1b5,
noi=0, zero=1, snok=0
[ 1055.504719] dwc2 30180000.usb: dwc2_hsotg_start_req:
DxEPCTL=0x00888200, ep 1, dir in
[ 1055.504737] dwc2 30180000.usb: ureq->length:352 ureq->actual:0
[ 1055.504760] dwc2 30180000.usb: dwc2_hsotg_start_req: 1@352/352,
0x20080160 => 0x00000930
[ 1055.504778] dwc2 30180000.usb: dwc2_hsotg_start_req: 67101000 pad
=> 0x00000934
[ 1055.504792] dwc2 30180000.usb: ep0 state:0
[ 1055.504803] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84888200
[ 1055.504817] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80888200
[ 1055.504865] dwc2 30180000.usb: dwc2_hsotg_irq: 04048028 00040000
(d88c3cc4) retry 8
[ 1055.504884] dwc2 30180000.usb: dwc2_hsotg_irq: daint=00000002
[ 1055.504909] dwc2 30180000.usb: dwc2_hsotg_epint: ep1(in) DxEPINT=0x00000001
[ 1055.504929] dwc2 30180000.usb: dwc2_hsotg_epint: XferCompl:
DxEPCTL=0x00898200, DXEPTSIZ=14ae0b24
[ 1055.504948] dwc2 30180000.usb: dwc2_hsotg_complete_in: adjusting
size done 0 => 352
[ 1055.504964] dwc2 30180000.usb: req->length:352 req->actual:352 req->zero:1
[ 1055.504985] dwc2 30180000.usb: complete: ep 4ee0de58 ep1in, req
b3bab221, 0 => b0bb1e62

> >> Please provide me dump of follow dwc2 debugfs's: regdump, hw_params, params.
> >
> > Do you want this on working and failing state or just the failing one?
> >
> After failing.

[root@rv1108 30180000.usb]# cat regdump
GOTGCTL = 0x000d0000
GOTGINT = 0x00000000
GAHBCFG = 0x0000002f
GUSBCFG = 0x4000140f
GRSTCTL = 0x80000400
GINTSTS = 0x04008028
GINTMSK = 0xd88c3cc4
GRXSTSR = 0xe1a60002
GRXFSIZ = 0x00000118
GNPTXFSIZ = 0x00100118
GNPTXSTS = 0x00080010
GI2CCTL = 0x00000000
GPVNDCTL = 0x00000000
GGPIO = 0x00000000
GUID = 0x32000001
GSNPSID = 0x4f54310a
GHWCFG1 = 0x00006664
GHWCFG2 = 0x228e2450
GHWCFG3 = 0x03cc90e8
GHWCFG4 = 0xdbf04030
GLPMCFG = 0x00000000
GPWRDN = 0x00600010
GDFIFOCFG = 0x039803cc
ADPCTL = 0x00000000
HPTXFSIZ = 0x00000000
DPTXFSIZN(1) = 0x01000128
DPTXFSIZN(2) = 0x00800228
DPTXFSIZN(3) = 0x008002a8
DPTXFSIZN(4) = 0x00400328
DPTXFSIZN(5) = 0x00200368
DPTXFSIZN(6) = 0x00100388
DPTXFSIZN(7) = 0x000003e8
DPTXFSIZN(8) = 0x000003a8
DPTXFSIZN(9) = 0x01000128
DPTXFSIZN(10) = 0x00800228
DPTXFSIZN(11) = 0x008002a8
DPTXFSIZN(12) = 0x00400328
DPTXFSIZN(13) = 0x00200368
DPTXFSIZN(14) = 0x00100388
DPTXFSIZN(15) = 0x000003e8
DCFG = 0x00840360
DCTL = 0x00000000
DSTS = 0x003bb600
DIEPMSK = 0x0000020f
DOEPMSK = 0x0000022f
DAINT = 0x00000000
DAINTMSK = 0x0005000b
DTKNQR1 = 0x00000000
DTKNQR2 = 0x00000000
DTKNQR3 = 0x0c100020
DTKNQR4 = 0x00000000
DVBUSDIS = 0x00000b8f
DVBUSPULSE = 0x000002c6
DIEPCTL(0) = 0x00208000
DIEPCTL(1) = 0x00898200
DIEPCTL(2) = 0x00020400
DIEPCTL(3) = 0x018c800a
DIEPCTL(4) = 0x00020400
DIEPCTL(5) = 0x00020400
DIEPCTL(6) = 0x00020400
DIEPCTL(7) = 0x00020400
DIEPCTL(8) = 0x00020400
DIEPCTL(9) = 0x00020400
DIEPCTL(10) = 0x00020400
DIEPCTL(11) = 0x00020400
DIEPCTL(12) = 0x00020400
DIEPCTL(13) = 0x00020400
DIEPCTL(14) = 0x00020400
DIEPCTL(15) = 0x00020400
DOEPCTL(0) = 0x80228000
DOEPCTL(1) = 0x00020400
DOEPCTL(2) = 0x80098200
DOEPCTL(3) = 0x00020400
DOEPCTL(4) = 0x00020400
DOEPCTL(5) = 0x00020400
DOEPCTL(6) = 0x00020400
DOEPCTL(7) = 0x00020400
DOEPCTL(8) = 0x00020400
DOEPCTL(9) = 0x00020400
DOEPCTL(10) = 0x00020400
DOEPCTL(11) = 0x00020400
DOEPCTL(12) = 0x00020400
DOEPCTL(13) = 0x00020400
DOEPCTL(14) = 0x00020400
DOEPCTL(15) = 0x00020400
DIEPINT(0) = 0x00002090
DIEPINT(1) = 0x00002090
DIEPINT(2) = 0x00000080
DIEPINT(3) = 0x00000080
DIEPINT(4) = 0x00000080
DIEPINT(5) = 0x00000080
DIEPINT(6) = 0x00000080
DIEPINT(7) = 0x00000080
DIEPINT(8) = 0x00000080
DIEPINT(9) = 0x00000080
DIEPINT(10) = 0x00000080
DIEPINT(11) = 0x00000080
DIEPINT(12) = 0x00000080
DIEPINT(13) = 0x00000080
DIEPINT(14) = 0x00000080
DIEPINT(15) = 0x00000080
DOEPINT(0) = 0x00002010
DOEPINT(1) = 0x00000000
DOEPINT(2) = 0x00000000
DOEPINT(3) = 0x00000000
DOEPINT(4) = 0x00000000
DOEPINT(5) = 0x00000000
DOEPINT(6) = 0x00000000
DOEPINT(7) = 0x00000000
DOEPINT(8) = 0x00000000
DOEPINT(9) = 0x00000000
DOEPINT(10) = 0x00000000
DOEPINT(11) = 0x00000000
DOEPINT(12) = 0x00000000
DOEPINT(13) = 0x00000000
DOEPINT(14) = 0x00000000
DOEPINT(15) = 0x00000000
DIEPTSIZ(0) = 0x00100030
DIEPTSIZ(1) = 0x14ae0b24
DIEPTSIZ(2) = 0x00000000
DIEPTSIZ(3) = 0x0007fce0
DIEPTSIZ(4) = 0x00000000
DIEPTSIZ(5) = 0x00000000
DIEPTSIZ(6) = 0x00000000
DIEPTSIZ(7) = 0x00000000
DIEPTSIZ(8) = 0x00000000
DIEPTSIZ(9) = 0x00000000
DIEPTSIZ(10) = 0x00000000
DIEPTSIZ(11) = 0x00000000
DIEPTSIZ(12) = 0x00000000
DIEPTSIZ(13) = 0x00000000
DIEPTSIZ(14) = 0x00000000
DIEPTSIZ(15) = 0x00000000
DOEPTSIZ(0) = 0x20000068
DOEPTSIZ(1) = 0x00000000
DOEPTSIZ(2) = 0x13ded97e
DOEPTSIZ(3) = 0x00000000
DOEPTSIZ(4) = 0x00000000
DOEPTSIZ(5) = 0x00000000
DOEPTSIZ(6) = 0x00000000
DOEPTSIZ(7) = 0x00000000
DOEPTSIZ(8) = 0x00000000
DOEPTSIZ(9) = 0x00000000
DOEPTSIZ(10) = 0x00000000
DOEPTSIZ(11) = 0x00000000
DOEPTSIZ(12) = 0x00000000
DOEPTSIZ(13) = 0x00000000
DOEPTSIZ(14) = 0x00000000
DOEPTSIZ(15) = 0x00000000
DIEPDMA(0) = 0x67556000
DIEPDMA(1) = 0x547e49a0
DIEPDMA(2) = 0x3c23f762
DIEPDMA(3) = 0x5fffa83a
DIEPDMA(4) = 0x3c23f762
DIEPDMA(5) = 0x9526fdc6
DIEPDMA(6) = 0x3c23f762
DIEPDMA(7) = 0x943260eb
DIEPDMA(8) = 0x63d0d24e
DIEPDMA(9) = 0xfa5165f4
DIEPDMA(10) = 0x3c23f762
DIEPDMA(11) = 0x3c23f762
DIEPDMA(12) = 0x3c23f762
DIEPDMA(13) = 0x3c23f762
DIEPDMA(14) = 0x3c23f762
DIEPDMA(15) = 0x3c23f762
DOEPDMA(0) = 0xa32822e3
DOEPDMA(1) = 0xad4e6d7d
DOEPDMA(2) = 0x0ad3d634
DOEPDMA(3) = 0xad4e6d7d
DOEPDMA(4) = 0x0d62a196
DOEPDMA(5) = 0xad4e6d7d
DOEPDMA(6) = 0x07286ede
DOEPDMA(7) = 0xad4e6d7d
DOEPDMA(8) = 0x8b00e8e1
DOEPDMA(9) = 0x3ed6811f
DOEPDMA(10) = 0xad4e6d7d
DOEPDMA(11) = 0xad4e6d7d
DOEPDMA(12) = 0xad4e6d7d
DOEPDMA(13) = 0xad4e6d7d
DOEPDMA(14) = 0xad4e6d7d
DOEPDMA(15) = 0xad4e6d7d
DTXFSTS(0) = 0x00000010
DTXFSTS(1) = 0x00000080
DTXFSTS(2) = 0x00000010
DTXFSTS(3) = 0x0000000d
DTXFSTS(4) = 0x00000010
DTXFSTS(5) = 0x00000010
DTXFSTS(6) = 0x00000010
DTXFSTS(7) = 0x00000010
DTXFSTS(8) = 0x00000010
DTXFSTS(9) = 0x00000010
DTXFSTS(10) = 0x00000010
DTXFSTS(11) = 0x00000010
DTXFSTS(12) = 0x00000010
DTXFSTS(13) = 0x00000010
DTXFSTS(14) = 0x00000010
DTXFSTS(15) = 0x00000010
PCGCTL = 0x00000000
HCFG = 0x00840360
HFIR = 0x00000b8f
HFNUM = 0x50f90776
HPTXSTS = 0x00080100
HAINT = 0x00000000
HAINTMSK = 0x00000007
HFLBADDR = 0x00000000
HPRT0 = 0x00000000
HCCHAR(0) = 0x00898200
HCCHAR(1) = 0x00020400
HCCHAR(2) = 0x80098200
HCCHAR(3) = 0x00020400
HCCHAR(4) = 0x00020400
HCCHAR(5) = 0x00020400
HCCHAR(6) = 0x00020400
HCCHAR(7) = 0x00020400
HCCHAR(8) = 0x00020400
HCCHAR(9) = 0x00020400
HCCHAR(10) = 0x00020400
HCCHAR(11) = 0x00020400
HCCHAR(12) = 0x00020400
HCCHAR(13) = 0x00020400
HCCHAR(14) = 0x00020400
HCCHAR(15) = 0x00020400
HCSPLT(0) = 0x00000000
HCSPLT(1) = 0x00000000
HCSPLT(2) = 0x00000000
HCSPLT(3) = 0x00000000
HCSPLT(4) = 0x00000000
HCSPLT(5) = 0x00000000
HCSPLT(6) = 0x00000000
HCSPLT(7) = 0x00000000
HCSPLT(8) = 0x00000000
HCSPLT(9) = 0x00000000
HCSPLT(10) = 0x00000000
HCSPLT(11) = 0x00000000
HCSPLT(12) = 0x00000000
HCSPLT(13) = 0x00000000
HCSPLT(14) = 0x00000000
HCSPLT(15) = 0x00000000
HCINT(0) = 0x00002010
HCINT(1) = 0x00000000
HCINT(2) = 0x00000000
HCINT(3) = 0x00000000
HCINT(4) = 0x00000000
HCINT(5) = 0x00000000
HCINT(6) = 0x00000000
HCINT(7) = 0x00000000
HCINT(8) = 0x00000000
HCINT(9) = 0x00000000
HCINT(10) = 0x00000000
HCINT(11) = 0x00000000
HCINT(12) = 0x00000000
HCINT(13) = 0x00000000
HCINT(14) = 0x00000000
HCINT(15) = 0x00000000
HCINTMSK(0) = 0x0000020f
HCINTMSK(1) = 0x00000000
HCINTMSK(2) = 0x00000000
HCINTMSK(3) = 0x00000000
HCINTMSK(4) = 0x00000000
HCINTMSK(5) = 0x00000000
HCINTMSK(6) = 0x00000000
HCINTMSK(7) = 0x00000000
HCINTMSK(8) = 0x00000000
HCINTMSK(9) = 0x00000000
HCINTMSK(10) = 0x00000000
HCINTMSK(11) = 0x00000000
HCINTMSK(12) = 0x00000000
HCINTMSK(13) = 0x00000000
HCINTMSK(14) = 0x00000000
HCINTMSK(15) = 0x00000000
HCTSIZ(0) = 0x14ae0b24
HCTSIZ(1) = 0x00000000
HCTSIZ(2) = 0x13ded97e
HCTSIZ(3) = 0x00000000
HCTSIZ(4) = 0x00000000
HCTSIZ(5) = 0x00000000
HCTSIZ(6) = 0x00000000
HCTSIZ(7) = 0x00000000
HCTSIZ(8) = 0x00000000
HCTSIZ(9) = 0x00000000
HCTSIZ(10) = 0x00000000
HCTSIZ(11) = 0x00000000
HCTSIZ(12) = 0x00000000
HCTSIZ(13) = 0x00000000
HCTSIZ(14) = 0x00000000
HCTSIZ(15) = 0x00000000
HCDMA(0) = 0xa32822e3
HCDMA(1) = 0xad4e6d7d
HCDMA(2) = 0x0ad3d634
HCDMA(3) = 0xad4e6d7d
HCDMA(4) = 0x0d62a196
HCDMA(5) = 0xad4e6d7d
HCDMA(6) = 0x07286ede
HCDMA(7) = 0xad4e6d7d
HCDMA(8) = 0x8b00e8e1
HCDMA(9) = 0x3ed6811f
HCDMA(10) = 0xad4e6d7d
HCDMA(11) = 0xad4e6d7d
HCDMA(12) = 0xad4e6d7d
HCDMA(13) = 0xad4e6d7d
HCDMA(14) = 0xad4e6d7d
HCDMA(15) = 0xad4e6d7d
HCDMAB(0) = 0x60068ee1
HCDMAB(1) = 0xc08782bb
HCDMAB(2) = 0xca6a7f91
HCDMAB(3) = 0xc08782bb
HCDMAB(4) = 0xdde691d4
HCDMAB(5) = 0xc08782bb
HCDMAB(6) = 0x97489e9b
HCDMAB(7) = 0xc08782bb
HCDMAB(8) = 0xa71f3fe5
HCDMAB(9) = 0x6cb816bb
HCDMAB(10) = 0xc08782bb
HCDMAB(11) = 0xc08782bb
HCDMAB(12) = 0xc08782bb
HCDMAB(13) = 0xc08782bb
HCDMAB(14) = 0xc08782bb
HCDMAB(15) = 0xc08782bb

[root@rv1108 30180000.usb]# cat hw_params
op_mode                       : 0
arch                          : 2
dma_desc_enable               : 1
enable_dynamic_fifo           : 1
en_multiple_tx_fifo           : 1
rx_fifo_size                  : 1024
host_nperio_tx_fifo_size      : 0
dev_nperio_tx_fifo_size       : 16
host_perio_tx_fifo_size       : 0
nperio_tx_q_depth             : 4
host_perio_tx_q_depth         : 4
dev_token_q_depth             : 8
max_transfer_size             : 524287
max_packet_count              : 1023
host_channels                 : 9
hs_phy_type                   : 1
fs_phy_type                   : 0
i2c_enable                    : 0
num_dev_ep                    : 9
num_dev_perio_in_ep           : 0
total_fifo_size               : 972
power_optimized               : 1
utmi_phy_data_width           : 1
snpsid                        : 0x4f54310a
dev_ep_dirs                   : 0x6664

[root@rv1108 30180000.usb]# cat params
otg_cap                       : 2
dma_desc_enable               : 0
dma_desc_fs_enable            : 0
speed                         : 0
enable_dynamic_fifo           : 1
en_multiple_tx_fifo           : 1
host_rx_fifo_size             : 525
host_nperio_tx_fifo_size      : 128
host_perio_tx_fifo_size       : 256
max_transfer_size             : 524287
max_packet_count              : 1023
host_channels                 : 0
phy_type                      : 1
phy_utmi_width                : 16
phy_ulpi_ddr                  : 0
phy_ulpi_ext_vbus             : 0
i2c_enable                    : 0
ipg_isoc_en                   : 0
ulpi_fs_ls                    : 0
host_support_fs_ls_low_power  : 0
host_ls_low_power_phy_clk     : 0
ts_dline                      : 0
reload_ctl                    : 1
ahbcfg                        : 0xe
uframe_sched                  : 1
external_id_pin_ctl           : 0
power_down                    : 0
lpm                           : 0
lpm_clock_gating              : 0
besl                          : 0
hird_threshold_en             : 0
hird_threshold                : 4
service_interval              : 0
host_dma                      : 0
g_dma                         : 1
g_dma_desc                    : 1
g_rx_fifo_size                : 280
g_np_tx_fifo_size             : 16
g_tx_fifo_size[0]             : 0
g_tx_fifo_size[1]             : 256
g_tx_fifo_size[2]             : 128
g_tx_fifo_size[3]             : 128
g_tx_fifo_size[4]             : 64
g_tx_fifo_size[5]             : 32
g_tx_fifo_size[6]             : 16
g_tx_fifo_size[7]             : 0
g_tx_fifo_size[8]             : 0
g_tx_fifo_size[9]             : 0
g_tx_fifo_size[10]            : 0
g_tx_fifo_size[11]            : 0
g_tx_fifo_size[12]            : 0
g_tx_fifo_size[13]            : 0
g_tx_fifo_size[14]            : 0
g_tx_fifo_size[15]            : 0

Is this information you need? If need we can gather more info.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
