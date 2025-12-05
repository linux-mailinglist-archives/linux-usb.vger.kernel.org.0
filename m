Return-Path: <linux-usb+bounces-31209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E75CA85D1
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 17:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1B103280DC4
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 16:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C9732E737;
	Fri,  5 Dec 2025 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WZbyQB6C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B21F09A8
	for <linux-usb@vger.kernel.org>; Fri,  5 Dec 2025 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764950482; cv=none; b=OiHFb98X7Jp8xnAMgy/I5LWciSoxs1cKHkOaqkGBuLbULSisWNiiuLW/5XdBqbIxe6H1ruspYfmIghJVmV5qjsudvH6nfgUc+QKvTYr20g469I/42AM/ReR0p+spJLgAw7XrwEHGFTmXOiGALB1TizsBvPVxOM6cS4GDV3zrEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764950482; c=relaxed/simple;
	bh=4XxWye8toASO+B8H5GXRlien5eQQXQI9Y8We355sbuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBvAvuTBcLNMKrjAMEEEHvJ+77xmGjVNt9AxceZxJ4swOwGmCpWbZ/uT5/7pSQevFq9EA0qhQ3h+jsaujCyEPy7viZ91LYqzAc4O6qFKUatCJf4Doig+rwd+CD3a17b5DJFIm9Kh3qlj2564Y8BkVslV6IdXiBBYqxpWNQdaxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WZbyQB6C; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1825901a12.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Dec 2025 08:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1764950473; x=1765555273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgje/FKGHOer+WR0M2amreKncUyyR6LHWn375qM+dFo=;
        b=WZbyQB6CyjSKEAYvjOBfoQ72pQ6tQXezKGwmd7raUY62whx8Kg4qOqw8fCNp+KpWCU
         /r2bDJm2Z8AdIVeElngzc2R0Pslmmi3/VDBW5aAqdOtU2+va/MdC+CcC9IDBLlm/+g/y
         7xL3Wqn8KDbw0FW2iNWw+T1dfobEB2laLiVAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764950473; x=1765555273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tgje/FKGHOer+WR0M2amreKncUyyR6LHWn375qM+dFo=;
        b=g/qYASaHeTG4ewANPZCFPYBFjDr24gYYiXzsFhZEJkCYisGg6UpjcDY8jHzZHquZgz
         jCOcV+ooLfwfBZvtMIUKIw35/0fg9d/zHe3YdPa9B8dyreraWC19d3i1M6J/mFSvShgY
         dWDu1DvAApb/wBKBoErfUZh+LJ0tFSbaUgI+oG/fuoIW99xlmpwbn7B+/1EOn2MBOPdH
         FlNfqyceAQ5jPZfGBPVtR988xRQ8Ux16+qq/x5FZaq925ir6YnjQgFH9034/xLYcz8u2
         ZmYMfUpGSQ8wAIhnBIp2i8Pzi8kfivJzj29p16ZFpEBLKXpcAO7MTiQ+db8hFDNow4xf
         gpfw==
X-Forwarded-Encrypted: i=1; AJvYcCUrTu+FI3XD74mLqqNSniIzp7Y8Z42KNXbR77UOzH3R4cEiSZt1QT8t6oZ7s58OVybKvBz3CagXkXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKgcr2QooOYMBjFxtjABQqbTYXTP+x3M2Oq1RB5XysD4fJ8bb
	AW1NRBpmqk6KbWxd/AXyIf9eymCYKXZHGiIENIYrP7rSvPupGPST/iMzj50KZOI10NoVxSDKwwF
	/wahoC8sEuPcjSqRMXtJngi8RGt2XXejLi/fyzdFRVQ==
X-Gm-Gg: ASbGncsx4YNLw2YAvtArFQ6RUezma7Z/AV9NXItPZhI7/Ht4k30UeQ849SAcMiYAAk+
	fyKNsBk48pVk00CpuoaCQE36drrTo5X4Bv3VDKWSjV0PnupvF5nwYpoBHelzHhk+iqEpsvOEnAa
	nu7b5Dt8z+JX25hNirojbdyEtM0LmyecLta7aX+w/R6Ol7+DsW6M98f1fpMPRS1YsA/HD+Dcv0e
	k4i8NqWck2fz93rIrv14ah8euCON8SlT17K7HtAucgkVM4DH0XFfpFqYcy6jA84uV/l68vKyJ+m
	zDxgWJDYxyqhCoK/II+JP3gwO2go5ErpvdHSPP3DaVym/8cMeYLQxzYR+QV8
X-Google-Smtp-Source: AGHT+IExz1KoKGgYwQs4j4Ce+j475SP/DNvJugi2JZxLEG/IxoTYS9P7YVxBh/zTuCGTgCoexanBeVOopKrdm8p5WZY=
X-Received: by 2002:a05:693c:2402:b0:2a4:4ec9:89aa with SMTP id
 5a478bee46e88-2ab92ee5b29mr6566093eec.28.1764950473000; Fri, 05 Dec 2025
 08:01:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202084524.208045-1-xu.yang_2@nxp.com> <CAOf5uwkVJihpjseiZhpdE4A6GpCA+jEunSBoQMFbTs1j_M2WFQ@mail.gmail.com>
 <DB9SPRMB00226E19F9426865663A83A28CA6A@DB9SPRMB0022.eurprd04.prod.outlook.com>
In-Reply-To: <DB9SPRMB00226E19F9426865663A83A28CA6A@DB9SPRMB0022.eurprd04.prod.outlook.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 5 Dec 2025 17:01:01 +0100
X-Gm-Features: AQt7F2rOS26RzjQG8b11cdCu8vbmfuuh-M-s8Q0LgfrPsAN-Pdn1IuPCcoVy2jk
Message-ID: <CAOf5uwkf77vA=R21tDHSqFU_ZFd_HB4mW8r-neLF_9pXqw-mNw@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: make kthread worker freezable
To: Xu Yang <xu.yang_2@nxp.com>
Cc: "badhri@google.com" <badhri@google.com>, 
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jun Li <jun.li@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 4, 2025 at 12:21=E2=80=AFPM Xu Yang <xu.yang_2@nxp.com> wrote:
>
>
> > Hi
> >
> > On Tue, Dec 2, 2025 at 9:44=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrot=
e:
> > >
> > > It's observed that tcpm kthread worker may execute some works at the
> > > very end of system suspend or the very beginning of system resume sta=
ge.
> >
> > Please clarify if this works is needed to be completed before the syste=
m suspend/resume
>
> In this issue, the work is sending a single source capabilities message. =
According to Type-C PD
> Spec, the source port will send source capabilities message every 150ms f=
or at least 50 times
> until it received a GoodCRC message.  In my opinion, if the worker starts=
 the work, it needs to
> be completed as soon as possible. I suppose it should be completed before=
 system suspend if
> it gets scheduled before system suspend.

Yes but what you are doing here is to make the thread freezable during
suspend so it freezes before
suspend and it means that the fault you get before can not happen
anymore because the thread is stopped
and can not access to driver and driver will be suspended later. Now
this question is if the thread
should finish its current job and go idle in the state machine before
allowing the machine to suspend or not.

>
> >
> > > The kthread work itself won't bring any issues, but if it access some
> > > HW resource during this period, the system may hung there because alm=
ost
> > > all of the resources are inaccessible at this point.
> > >
> > > Take below kernel dump as example, if the source port hasn't finished
> > > sending Source Capabilities message when system enters into suspend, =
it
> > > will continue do the thing as long as it gets scheduled. However, the=
 i2c
> > > resource is inaccessible before system resume. Then the system is hun=
g.
> > >
> > > Fix it by making kthread worker freezable.
> > >
> > > $ echo mem > /sys/power/state
> > > [   37.605215] PM: suspend entry (deep)
> > > [   37.616067] Filesystems sync: 0.007 seconds
> > > [   37.633106] Freezing user space processes
> > > [   37.639444] Freezing user space processes completed (elapsed 0.001=
 seconds)
> > > [   37.646496] OOM killer disabled.
> > > [   37.649745] Freezing remaining freezable tasks
> > > [   37.655695] Freezing remaining freezable tasks completed (elapsed =
0.001 seconds)
> > > [   37.689794] fec 5b040000.ethernet eth0: Link is Down
> > > [   37.713391] PM: suspend devices took 0.052 seconds
> > > [   37.741175] Disabling non-boot CPUs ...
> > > [   37.747120] psci: CPU5 killed (polled 0 ms)
> > > [   37.754129] psci: CPU4 killed (polled 0 ms)
> > > [   37.762217] psci: CPU3 killed (polled 0 ms)
> > > [   37.770037] psci: CPU2 killed (polled 0 ms)
> > > [   37.776936] psci: CPU1 killed (polled 4 ms)
> > > [   37.782481] Enabling non-boot CPUs ...
> > > [   37.787991] Detected VIPT I-cache on CPU1
> > > [   37.788043] GICv3: CPU1: found redistributor 1 region 0:0x00000000=
51b20000
> > > [   37.788093] CPU1: Booted secondary processor 0x0000000001 [0x410fd=
034]
> > > [   37.789587] CPU1 is up
> > > [   37.810632] Detected VIPT I-cache on CPU2
> > > [   37.810661] GICv3: CPU2: found redistributor 2 region 0:0x00000000=
51b40000
> > > [   37.810689] CPU2: Booted secondary processor 0x0000000002 [0x410fd=
034]
> > > [   37.811714] CPU2 is up
> > > [   37.833013] Detected VIPT I-cache on CPU3
> > > [   37.833042] GICv3: CPU3: found redistributor 3 region 0:0x00000000=
51b60000
> > > [   37.833071] CPU3: Booted secondary processor 0x0000000003 [0x410fd=
034]
> > > [   37.834201] CPU3 is up
> > > [   37.856437] Detected PIPT I-cache on CPU4
> > > [   37.856469] GICv3: CPU4: found redistributor 100 region 0:0x000000=
0051b80000
> > > [   37.856501] CPU4: Booted secondary processor 0x0000000100 [0x410fd=
082]
> > > [   37.857651] CPU4 is up
> > > [   37.872890] SError Interrupt on CPU2, code 0x00000000bf000002 -- S=
Error
> > > [   37.872902] CPU: 2 UID: 0 PID: 147 Comm: 2-0051 Tainted: G   M    =
            6.18.0-rc7-06207-gee9dedcfd432-dirty #396 PREEMPT
> > > [   37.872912] Tainted: [M]=3DMACHINE_CHECK
> > > [   37.872915] Hardware name: Freescale i.MX8QM MEK (DT)
> > > [   37.872919] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> > > [   37.872926] pc : lpi2c_imx_xfer_common+0x150/0xff0
> > > [   37.872942] lr : lpi2c_imx_xfer_common+0x54/0xff0
> > > [   37.872949] sp : ffff80008358b960
> > > [   37.872952] x29: ffff80008358b9e0 x28: 0000000000000001 x27: ffff0=
00810bcc080
> > > [   37.872964] x26: 0000000000000000 x25: ffff8000820e9000 x24: 00000=
00000000000
> > > [   37.872973] x23: 0000000000000001 x22: ffff8000820e7000 x21: 00000=
00000000001
> > > [   37.872981] x20: ffff80008358bae8 x19: ffff000810b4c010 x18: 00000=
0000000000a
> > > [   37.872990] x17: ffff00081ab43f00 x16: 0000000000000002 x15: 00000=
00000000000
> > > [   37.872999] x14: 0000000000000001 x13: 00000000ffff0a10 x12: 00000=
00000000006
> > > [   37.873008] x11: ffff00081a38db07 x10: 0000000000000000 x9 : 00000=
00000000004
> > > [   37.873016] x8 : 0000000022b63cbf x7 : 00000000016e3600 x6 : 00000=
00000000000
> > > [   37.873025] x5 : 0000000000000002 x4 : 00000000000186a0 x3 : 00000=
000000000c0
> > > [   37.873033] x2 : 0000000000000002 x1 : 0000000000000018 x0 : 00000=
00000000023
> > > [   37.873044] Kernel panic - not syncing: Asynchronous SError Interr=
upt
> > > [   37.873050] CPU: 2 UID: 0 PID: 147 Comm: 2-0051 Tainted: G   M    =
            6.18.0-rc7-06207-gee9dedcfd432-dirty #396 PREEMPT
> > > [   37.873058] Tainted: [M]=3DMACHINE_CHECK
> > > [   37.873061] Hardware name: Freescale i.MX8QM MEK (DT)
> > > [   37.873064] Call trace:
> > > [   37.873068]  show_stack+0x18/0x30 (C)
> > > [   37.873081]  dump_stack_lvl+0x60/0x80
> > > [   37.873091]  dump_stack+0x18/0x24
> > > [   37.873100]  vpanic+0xf8/0x2dc
> > > [   37.873108]  abort+0x0/0x4
> > > [   37.873115]  nmi_panic+0x64/0x70
> > > [   37.873125]  arm64_serror_panic+0x70/0x80
> > > [   37.873134]  do_serror+0x34/0x74
> > > [   37.873143]  el1h_64_error_handler+0x38/0x60
> > > [   37.873156]  el1h_64_error+0x6c/0x70
> > > [   37.873163]  lpi2c_imx_xfer_common+0x150/0xff0 (P)
> > > [   37.873172]  lpi2c_imx_xfer+0x14/0x20
> > > [   37.873179]  __i2c_transfer+0x1b8/0x3c8
> > > [   37.873190]  i2c_transfer+0x6c/0xf8
> > > [   37.873199]  i2c_transfer_buffer_flags+0x5c/0xa0
> > > [   37.873208]  regmap_i2c_write+0x20/0x60
> > > [   37.873221]  _regmap_raw_write_impl+0x5cc/0x660
> > > [   37.873230]  _regmap_bus_raw_write+0x60/0x80
> > > [   37.873238]  _regmap_write+0x58/0xc0
> > > [   37.873246]  regmap_write+0x48/0x74
> > > [   37.873254]  tcpci_pd_transmit+0x10c/0x1a8
> > > [   37.873264]  tcpm_pd_transmit+0x60/0x164
> > > [   37.873273]  tcpm_pd_send_source_caps+0x12c/0x1c4
> > > [   37.873280]  tcpm_state_machine_work+0xb10/0x3574
> > > [   37.873288]  kthread_worker_fn+0xc4/0x178
> > > [   37.873300]  kthread+0x12c/0x204
> > > [   37.873310]  ret_from_fork+0x10/0x20
> > > [   37.873322] SMP: stopping secondary CPUs
> > > [   37.875528] Kernel Offset: disabled
> > > [   37.875531] CPU features: 0x080000,04105800,40004001,0400421b
> > > [   37.875536] Memory Limit: none
> > > [   38.148805] ---[ end Kernel panic - not syncing: Asynchronous SErr=
or Interrupt ]---
> > >
> > > Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT prior=
ity for processing events")
> >
> > I think that this does not Fix this sha because most probably it moves =
the failure window,
>
> How do you know that? Do you think which commit should this fix?
>

According to the commit they move the workqueue to rt priority. So it
really depends if the problem was
even present before this commit.

> >
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/t=
cpm.c
> > > index 4ca2746ce16b..2196de231b9b 100644
> > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > @@ -7836,7 +7836,7 @@ struct tcpm_port *tcpm_register_port(struct dev=
ice *dev, struct tcpc_dev *tcpc)
> > >         mutex_init(&port->lock);
> > >         mutex_init(&port->swap_lock);
> > >
> > > -       port->wq =3D kthread_run_worker(0, dev_name(dev));
> > > +       port->wq =3D kthread_run_worker(KTW_FREEZABLE, dev_name(dev))=
;
> >
> > This flags as far I can see has no user in all the linux kernel, so thi=
s let me think that this general
> > problem is addressed differently by other drivers
>
> Yes, I do see no user to user this flag. For this issue, if it's caused b=
y other drivers it depends on, do you have
> any better suggestions? Should all dependent drivers be fixed? I suppose =
tcpm should stop further jobs when
> the system is going to suspend. :)
>

No right now, I have no idea, but I think that before was not WQ_FREEZABLE

Michael



> Thanks,
> Xu Yang
>
> >
> > Michael
> >
> >
> > >         if (IS_ERR(port->wq))
> > >                 return ERR_CAST(port->wq);
> > >         sched_set_fifo(port->wq->task);
> > > --
> > > 2.34.1
> > >
> > >

