Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEE6173EA5
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 18:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgB1RgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 12:36:16 -0500
Received: from mail-qv1-f48.google.com ([209.85.219.48]:36246 "EHLO
        mail-qv1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1RgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 12:36:16 -0500
Received: by mail-qv1-f48.google.com with SMTP id ff2so1721628qvb.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=nuESWKUUXRjbZoRtl7WNgFU6uak+VOQSEMvSHcqgaro=;
        b=1v6WjwovMS8KM8nWeLGZxzzUeIHzKX6CsWI3MX6QPE2j1puJyJ+RAZcBLLoobyUeKf
         sw+iV1gwM2/3AaMaZEhHd7l4iOnHH9eRrs0gKZELvyWNF6PvBAJQv7D3ZqdcxsMBGY/n
         85KXzHq11dwZBd1dnxZM6jjQNeva+nsBzg24Yr6eq6ye/5UAOadphy++l2Dz6jDs94wA
         cuvfw/DzGZz5UUXqv1u4yfghFJv9a+yY9u+0fulZNG47lxgW7fjs2kr+iB/NwE5eVWYw
         oPxKS+kDOSRcljQY+DYhMtso03vQcaFiJE+FK9SQzPq7IUn6dY3eewU/Q6Jq5wM8eXrf
         /Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=nuESWKUUXRjbZoRtl7WNgFU6uak+VOQSEMvSHcqgaro=;
        b=eKWPmzjnP7gc2AffTSAZgBjrBkPQDr9LNdtg3OfYCjTxECtVNQByYK/DPZVnln/oa2
         C6/FOLfSJbTxzzSzXtABQF2pY80PkfiHzl0qlHsovc9klTxvwP67HI9we6sv2KzR0x+K
         dUSFKqpldYme3aAj9pUwBmnuxVuaudt44gCPpaSrQRzATrJC+QG9quJqmKZu9GUpXW7a
         xPnLYClosN3wvltSW86L0IYmAvQv99L79VSXhHpbg+9xZcY/HLFgaj5T/1NIb/LAq3Gp
         uclB7eJMYzgQGUCY1OI4oSqD+odFGwRmN8u1MtiAXL4LJh2ulhyv/A+3SAJpIUOnFH4H
         SzNw==
X-Gm-Message-State: APjAAAWPXvY+Stt85A1gzFmlq7DxIv+ewFhCQHlak77hMxBNSiqiUAIY
        LBsLCGOp0P8upxDDvFIjYkUaX7Q8koVOaA==
X-Google-Smtp-Source: APXvYqw/qrnuWkbEIFfOZVRj6M8slKck6y543BcxtfZlTW8lCh51FIzUXVI8sBGALsp+qIg5aEPReg==
X-Received: by 2002:a05:6214:974:: with SMTP id do20mr4702544qvb.221.1582911372555;
        Fri, 28 Feb 2020 09:36:12 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id 11sm5621306qkr.101.2020.02.28.09.36.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 09:36:11 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f176.google.com with SMTP id u124so3679022qkh.13
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 09:36:11 -0800 (PST)
X-Received: by 2002:a37:a402:: with SMTP id n2mr5280207qke.71.1582911370834;
 Fri, 28 Feb 2020 09:36:10 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com> <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com> <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com> <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com> <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
 <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com> <CAP9ODKoS5KQrhTrUvahHEhQG-WA+bfLnP4tTFxzrQaGh1nTcZw@mail.gmail.com>
 <CAP9ODKoRuB-nyjr1ksGU61PVMjFTMMWKwgpHQ=e7bChAu5Okhg@mail.gmail.com> <665fe49e-ebfa-bcb0-fcd1-ea1e9252b306@synopsys.com>
In-Reply-To: <665fe49e-ebfa-bcb0-fcd1-ea1e9252b306@synopsys.com>
Date:   Fri, 28 Feb 2020 14:35:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo=YSNa-uNgzwP2X5yDy_qDzYjLogZLg11rRcSXr+wrFw@mail.gmail.com>
Message-ID: <CAP9ODKo=YSNa-uNgzwP2X5yDy_qDzYjLogZLg11rRcSXr+wrFw@mail.gmail.com>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Otavio Salvador <otavio@ossystems.com.br>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Fri, Feb 28, 2020 at 6:01 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> On 2/21/2020 6:07 PM, Otavio Salvador wrote:
> > On Fri, Feb 21, 2020 at 11:06 AM Otavio Salvador
> > <otavio@ossystems.com.br> wrote:
> >> On Fri, Feb 21, 2020 at 3:52 AM Minas Harutyunyan
> >> <Minas.Harutyunyan@synopsys.com> wrote:
> >>> On 2/20/2020 5:16 PM, Otavio Salvador wrote:
> >>>> Hello Minas,
> >>>>
> >>>> Thanks for all your help on this, ...
> >>>>
> >>>> On Thu, Feb 20, 2020 at 3:59 AM Minas Harutyunyan
> >>>> <Minas.Harutyunyan@synopsys.com> wrote:
> >>>>>
> >>>>> On 2/19/2020 7:10 PM, Otavio Salvador wrote:
> >>>> ...
> >>>>>> What sequence do you want us to do?
> >>>>>
> >>> Please provide dwc2 debug log when stop working with g_serial exception
> >>> dump inside.
> >>> Also provide dwc2 log when it's work without issue.
> >>
> >> Attached.
> >
> Reviewed all logs. Not found any dwc2 related issue. Not able to
> reproduce on my setup. My log on rmmod g_serial:
>
> [68784.817773] g_serial gadget: reset config
> [68784.817775] g_serial gadget: acm ttyGS0 deactivated
> [68784.817779] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable(ep 000000005e9ae420)
> [68784.817784] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable: DxEPCTL=0x08080200
> [68784.817791] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable(ep 00000000e6730f2b)
> [68784.817796] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable: DxEPCTL=0x08880200
> [68784.817805] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable(ep 00000000cef05e9b)
> [68784.817809] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable: DxEPCTL=0x084c000a
> [68784.817820] g_serial gadget: acm ttyGS0 deactivated
> [68784.817894] usb 5-4: USB disconnect, device number 6
> [68784.817975] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable(ep 00000000e6730f2b)
> [68784.817980] dwc2 dwc2.1.auto: dwc2_hsotg_ep_disable: DxEPCTL=0x088a0200
>
> Pay attention g_serial twice performing ttySG0 deactivation.
> In my setup second deactivation passed Ok, but in your case exception
> back trace print out with NULL pointer de-reference on spin_lock_irq.
> Could you please add debug print before spin_lock_irq() in function
> gs_close() in file u_serial.c to check tty, tty->driver_data. Are these
> vars NULL or no.
> Just rmmod g_serial case fully enough.

[  207.715898] dwc2 30180000.usb: dwc2_hsotg_pullup: is_on: 0 op_state: 3
[  207.715942] dwc2 30180000.usb: complete: ep b45e8dac ep0, req
9e5949b0, -108 => 863fc1b9
[  207.715966] dwc2 30180000.usb: dwc2_hsotg_complete_setup: failed -108
[  207.715996] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
c659a301, -108 => f0de5013
[  207.716050] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
f46b68c4, -108 => f0de5013
[  207.716078] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
24890a46, -108 => f0de5013
[  207.716100] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
fc4810fd, -108 => f0de5013
[  207.716119] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
f641bdad, -108 => f0de5013
[  207.716139] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
92871573, -108 => f0de5013
[  207.716158] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
fe77b603, -108 => f0de5013
[  207.716177] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
3e9064d5, -108 => f0de5013
[  207.716196] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
5aae2e11, -108 => f0de5013
[  207.716216] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
7c5834db, -108 => f0de5013
[  207.716236] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
968af244, -108 => f0de5013
[  207.716257] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
fa68c2eb, -108 => f0de5013
[  207.716276] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
6cfbcee5, -108 => f0de5013
[  207.716296] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
eea82a2b, -108 => f0de5013
[  207.716315] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
56ccd82d, -108 => f0de5013
[  207.716335] dwc2 30180000.usb: complete: ep edfa46d3 ep2out, req
a00b7148, -108 => f0de5013
[  207.716389] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep edfa46d3)
[  207.716410] dwc2 30180000.usb: dwc2_hsotg_ep_stop_xfr: stopping
transfer on ep2out
[  207.716438] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08080200
[  207.716457] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 03f40054)
[  207.716469] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x088a0200
[  207.716567] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 108f89fa)
[  207.716581] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x098c000a
[  207.722600] gs_close: before spin_unlock_irq 1: tty->driver_data is baf4a00d
[  207.722625] gs_close: ttyGS0 (11bbbfea,dc9a1db1) ...
[  207.722646] gs_close: ttyGS0 (11bbbfea,dc9a1db1) done!
[  208.040122] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 03f40054)
[  208.040153] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x088a0200
[  208.040177] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep edfa46d3)
[  208.040194] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x080a0200
[  208.040214] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 108f89fa)
[  208.040227] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x098e000a
[  208.040243] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 12d21028)
[  208.040255] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040271] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep fb6b3e60)
[  208.040282] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040298] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep abea3d06)
[  208.040310] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040326] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 8074ac21)
[  208.040338] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040355] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 9449e3ee)
[  208.040367] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040383] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 3b6cd68c)
[  208.040395] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040412] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 38c4d9db)
[  208.040426] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.040443] dwc2 30180000.usb: dwc2_hsotg_ep_disable(ep 67b37434)
[  208.040457] dwc2 30180000.usb: dwc2_hsotg_ep_disable: DxEPCTL=0x08020400
[  208.061914] gs_close: before spin_unlock_irq 1: tty->driver_data is baf4a00d
[  208.061980] 8<--- cut here ---
[  208.062283] Unable to handle kernel paging request at virtual
address 00766500
[  208.062934] pgd = b41c9e7b
[  208.063189] [00766500] *pgd=00000000
[  208.063528] Internal error: Oops: 5 [#1] SMP ARM
[  208.063945] Modules linked in: usb_f_acm u_serial libcomposite
configfs zram zsmalloc emlog(O) rtc_rk808 clk_rk808 spi_rockchip
wdtoken(O) [last unloaded: g_serial]
[  208.065303] CPU: 0 PID: 1203 Comm: sh Tainted: G           O      5.4.21 #1
[  208.065923] Hardware name: Rockchip (Device Tree)
[  208.066364] PC is at __cancel_work_timer+0x64/0x200
[  208.066819] LR is at try_to_grab_pending+0x44/0x1a0
[  208.067257] pc : [<c0153c70>]    lr : [<c0152a34>]    psr: 20010093
[  208.067818] sp : c5d91e98  ip : 00000000  fp : c094e8c8
[  208.068289] r10: 00000000  r9 : c648fb7c  r8 : c5c88f00
[  208.068760] r7 : 00000000  r6 : 00000000  r5 : c648d204  r4 : c5d90000
[  208.069343] r3 : 00766500  r2 : 00766565  r1 : c648d204  r0 : 00000000
[  208.069933] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment none
[  208.070581] Control: 10c5387d  Table: 6591006a  DAC: 00000051
[  208.071102] Process sh (pid: 1203, stack limit = 0x7c1578a9)
[  208.071614] Stack: (0xc5d91e98 to 0xc5d92000)
[  208.072012] 1e80:
    60010013 c04a2f50
[  208.072745] 1ea0: c648fa00 00000000 00000000 c5c8c580 c5c88f00
c0c05c88 00000000 c648fa00
[  208.073478] 1ec0: c648fa00 00000000 c5c8c580 c049af84 c0c6f3b4
c049b080 c648fa00 00000000
[  208.074211] 1ee0: c648fba8 c049be10 00000000 00000000 00000178
c648fb04 c648fb04 c09883c0
[  208.074944] 1f00: 8010000a c5c88f00 000e0003 c5907398 c720a850
c6e68cc0 00000008 c5c88f08
[  208.075677] 1f20: 00000000 c02b476c 00000000 00000000 c5d95800
c5d95c54 c0cb15b4 c5d95c3c
[  208.076411] 1f40: c634aa80 00000000 000000f8 c0157f78 c5d95800
c640b400 c5d90000 c640b440
[  208.077146] 1f60: ffffe000 c013bf64 0000080f c01165cc b6f09abc
c0c05c88 00000000 000000f8
[  208.077879] 1f80: 00000000 c013d4b8 00000000 00000004 0050201c
000000f8 c0101204 c013d554
[  208.078611] 1fa0: 00000000 c0101000 00000000 00000004 00000000
00000000 00503150 00000000
[  208.079344] 1fc0: 00000000 00000004 0050201c 000000f8 00000000
00000000 00501a78 00000000
[  208.080077] 1fe0: 00501b28 bec798e4 0048e360 b6e695e4 20010010
00000000 00000000 00000000
[  208.080831] [<c0153c70>] (__cancel_work_timer) from [<c049af84>]
(release_tty+0x88/0x104)
[  208.081585] [<c049af84>] (release_tty) from [<c049b080>]
(tty_release_struct+0x34/0x40)
[  208.082315] [<c049b080>] (tty_release_struct) from [<c049be10>]
(tty_release+0x43c/0x640)
[  208.083056] [<c049be10>] (tty_release) from [<c02b476c>] (__fput+0x88/0x218)
[  208.083702] [<c02b476c>] (__fput) from [<c0157f78>] (task_work_run+0xa4/0xc4)
[  208.084357] [<c0157f78>] (task_work_run) from [<c013bf64>]
(do_exit+0x430/0xaec)
[  208.085029] [<c013bf64>] (do_exit) from [<c013d4b8>]
(do_group_exit+0x3c/0xc8)
[  208.085684] [<c013d4b8>] (do_group_exit) from [<c013d554>]
(__wake_up_parent+0x0/0x18)
[  208.086397] Code: e5953000 e3130004 13c330ff 01a042a3 (15933000)
[  208.086948] ---[ end trace 9aa9566e42b92f1c ]---
[  208.087367] Fixing recursive fault but reboot is needed!

The diff I applied was:

@@ -662,6 +662,9 @@ static void gs_close(struct tty_struct *tty,
struct file *file)
    struct gs_port *port = tty->driver_data;
    struct gserial  *gser;

+    pr_debug("gs_close: before spin_unlock_irq 1: tty->driver_data is %p\n",
+             tty->driver_data);
+
    spin_lock_irq(&port->port_lock);

    if (port->port.count != 1) {
@@ -687,6 +690,10 @@ static void gs_close(struct tty_struct *tty,
struct file *file)
        wait_event_interruptible_timeout(port->drain_wait,
                    gs_close_flush_done(port),
                    GS_CLOSE_TIMEOUT * HZ);
+
+        pr_debug("gs_close: before spin_unlock_irq 2:
tty->driver_data is %p\n",
+                 tty->driver_data);
+
        spin_lock_irq(&port->port_lock);

        if (port->port.count != 1)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
