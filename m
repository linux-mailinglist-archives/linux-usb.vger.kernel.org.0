Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5632AE5E7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 02:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732511AbgKKBhp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 20:37:45 -0500
Received: from mail-eopbgr50071.outbound.protection.outlook.com ([40.107.5.71]:37458
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732506AbgKKBhp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 20:37:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr9HGlaptwP7cW5ugSlqrlWFnqOouW3n8r/adMNNcjBhlZ4evwbyMz3LylOmoEccxmBlBQcRoVHFgXxpvPfNxLDaKtlkzooOxpiRKfPZqnYGIYUHYJ+kNNhWXOFvoCqq5NVehsSbdAzK6RABAYIL3HzImWkVmvcDyf0yujPKqbUUWCmWUvwS24iKLAnz18iFZGt1AWkdpEZtKdwlgVN2hZM5h6O3ubnw+i0zsVjaehixZwlgXan9RcY4x2FYmf625qQSN8bO4iG37hxj2VfQev7qYB4fZ/5B+6YXn/CwGpzaVDiAiQ2nhOlbr5c6xbFXfYZBn0LAh5D0bNdHyjNN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSNA4I80I2UA1QUiXoIitM9AD3rqIs+Qjj0PsF9sNGU=;
 b=FUBAokDHGOYp0wpR1QKcxAkWZ5vPWuGqcwRMyQ+Z1JFezc2VgirLcUmHvCP5BsA9G6rpohi/rloNqEakVNmLOWmbcS3RJUMITzBiDI0La92BY+qKmuEkrw8uhzfKRNA+Z2LQul2otMEw73/Lpq0kLEtFW8f6fClyXR17/jdWyyjKHKPForSE97uLqCx6kxsmqGB3Sdh7nC7DjHD7krIgCj+YEOXxpSCBwY4uIkaYXgpkD1Q6WwrBM9yxpqdJqifE9m1Eflo11Ay556OaQYA0gZaMoyGeyti13rFl+kdD2vuDRNLIaKh9Gc9tUr5yXCHSkHvJpfv/AKtayk2Gf6R7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSNA4I80I2UA1QUiXoIitM9AD3rqIs+Qjj0PsF9sNGU=;
 b=ZyHoP/Z+mgp/ribKIJwlogxcEIsPHE5Xcn59uK0sFX3VW15aIzRmnvZoy+SgD0Y4i1voep+RacxMH2oJpcno0U4zlJohOAwW8PnqVy84jMIsvzgr1jj4urK5EqO62Qtn4E7QZZHgUkrDT0rdb+41j6N5xBxFDb98FD9Imc5MSE4=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR04MB3127.eurprd04.prod.outlook.com (2603:10a6:6:c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.27; Wed, 11 Nov 2020 01:37:40 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 01:37:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     USB list <linux-usb@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>, Jun Li <jun.li@nxp.com>
Subject: Re: chip idea: Crash on i.MX27
Thread-Topic: chip idea: Crash on i.MX27
Thread-Index: AQHWt1yHJ9O+tJmkPUaZqcU76hhJeqnCJ6CA
Date:   Wed, 11 Nov 2020 01:37:40 +0000
Message-ID: <20201111013711.GA14896@b29397-desktop>
References: <CAOMZO5AMuRv5AZ2HOEgqzaPcbLeNXWajpTB40Dejs7gcsL=BhQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AMuRv5AZ2HOEgqzaPcbLeNXWajpTB40Dejs7gcsL=BhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eada2652-19aa-47e1-fa83-08d885e260d4
x-ms-traffictypediagnostic: DB6PR04MB3127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB3127C667AC9C4F4343FCB9378BE80@DB6PR04MB3127.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1G7VXn2Wbu/Rb/j+fYz2xvtETl3JyiLQ/VwlScEY5/EZQnqnT9c4dAd/Z3iLosm5fyUeyB2YMc3aCm6UAtfxWTXoT4fGq3o+S85JgulkRWJR05CJtbwptt8pBQyQAwhPsKP/T1cyJ8subp5A2RfSGDo9yleLOXCp81iDuir27+DndW+cNuv8R+vy4JRntR62ziFpxsO3h+C0KAHfh2zEEiC+iAiozRZRnc6Bk1u+tOCLAycmOW7MHp6nFjGMQWy8dUvy3W77xGvIYR192Fml+8/IuY6fdU74Oi7YUjyhvzsW2gsIoC/4GWXph+rRCuNN/YGXnBHkXZyv9FAzds0XAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(66556008)(66476007)(66446008)(66946007)(64756008)(316002)(54906003)(8676002)(478600001)(44832011)(6506007)(91956017)(26005)(6916009)(4326008)(76116006)(53546011)(186003)(83380400001)(33656002)(71200400001)(8936002)(33716001)(86362001)(1076003)(5660300002)(45080400002)(9686003)(2906002)(6512007)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WxJlWHaUTtCNXJhzUwZc7+MQvCxTHGPa2EABD+Gmmu5P9LQo81jwex6tkUaKkke+SO8EhO1vDIbc+oXQICOsuYiflLiEuct1fGoZ+/ZlVMNZg7RdzzzC2coL+ul2uUu3NB66X1sDBKm2JmnzF8r1T3V/CiiOpaYWbIciiRLVOzPyOr1Axz7o/Cevy4wpbC0vzyx/kiMi7vMJUEP1OY/PbOuyAco1P90CE3mNORD9KxFl1s9s6Bs99ADZumd6abqaxR6AfqBaGKVMI4Lemb9wlUBIUWnirsjG3XwU5rN7aLe6oymjnQvT1665f3OAXx7nJXTSWXiqPn+qWmm65VPhdz47hxwclKNzD6+wcMxPWFJBt3VtdXMf8eHY9scSqNSptyhzm8lKmHZ4xa3mHvZxuATIesh1rr6J/4z74D9sn9OL/ckYFgZ63NNrxrxZ8rd8c05Qba0wFPGSC8Xq/vWz2YymHQtjKAmofcMyDmhkl1UV+6hMgSjznTZghteHNTCfy2PgiH/tcOxd8cbcgUyMn1JIE9g97e4OgODIPQtSPH7WiqiMcr471MfiJDWDlGEFgKblnyhxX2yIjZTiu/ZCXrtq4lidk+y/+vwKgF2CqnnJ6SMbi3uGVjBrT7hG0q6uJcvAeEYJTjOD2Chy4dllEw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AEA21CEA210BA842AF51247A06D67FED@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eada2652-19aa-47e1-fa83-08d885e260d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 01:37:40.5901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dD8UsVGRbzHXp/J41hYOH6dsjLrSSa8FXsGnqHhNB7Bj57EaDu3TzaDTjkN7dVBZ8cQv24smYDJFVm96vSFMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3127
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-10 09:24:54, Fabio Estevam wrote:
> Hi Peter,
>=20
> On a imx27-pdk board I see the following error.
>=20
> Any suggestions?
>=20
> Thanks,
>=20
> Fabio Estevam
>=20
> imx_usb 10024000.usb: No over current polarity defined
> 8<--- cut here ---
> Unhandled fault: external abort on non-linefetch (0x808) at 0xf4424184

0xf4424184 should be the virtual address for the register PORTSC. There are
two possible reasons for this issue:
- The PHY is not initialized correctly
- The related clock has not opened correctly.

Peter

> pgd =3D (ptrval)
> [f4424184] *pgd=3D10000452(bad)
> Internal error: : 808 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 27 Comm: kworker/0:1 Not tainted
> 5.10.0-rc2-next-20201109-00002-g4bce163a428-dirty #135
> Hardware name: Freescale i.MX27 (Device Tree Support)
> Workqueue: events deferred_probe_work_func
> PC is at hw_phymode_configure+0x4c/0x120
> LR is at 0x80000000
> pc : [<c0523108>]    lr : [<80000000>]    psr: 60000013
> sp : c1185c70  ip : 00000000  fp : c0950638
> r10: 3f888caf  r9 : c196e038  r8 : c196e08c
> r7 : c11b1a20  r6 : c18fb200  r5 : c196f020  r4 : 40000000
> r3 : 00000000  r2 : 8c000c04  r1 : 00000000  r0 : f4424184
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 0005317f  Table: a0004000  DAC: 00000053
> Process kworker/0:1 (pid: 27, stack limit =3D 0x(ptrval))
> Stack: (0xc1185c70 to 0xc1186000)
> 5c60:                                     c196e020 c0523f74 c12feb58 c12f=
eb58
> 5c80: c18f5d68 c18f7160 c12fa280 c18fb210 00000000 c18fb210 00000000 c09b=
7814
> 5ca0: c09b7814 00000001 00000000 c09aae28 c0950638 c04359e0 c18fb210 c09f=
9a84
> 5cc0: 00000000 c043371c c18fb210 c09b7814 c0433b40 c0949028 00000001 0000=
0000
> 5ce0: c09aae28 c0433a30 00000000 c1185d24 c0433b40 c04318ec 20000013 c10c=
9f5c
> 5d00: c12eb574 4da732e0 c0950638 c18fb210 c18fb254 c0949028 c0949028 c043=
3478
> 5d20: c12d2000 c18fb210 00000001 4da732e0 c18fb210 c09ab3f0 c18fb210 c094=
9028
> 5d40: 00000000 c043280c c18fb210 c10f6810 00000000 c042f5b0 c18fb210 c039=
8468
> 5d60: c094e9fc c0021038 c094e9fc 4da732e0 c12fa2a0 00000002 c18fb200 c18f=
b210
> 5d80: c094e9fc c094e9dc 00000000 c0435798 c1185dd8 00000000 c18fb200 c10b=
1f40
> 5da0: 00000002 00000000 c18faca0 c0523ad8 00000000 60000013 c18faca0 c10f=
6810
> 5dc0: c10f6800 c0949028 c7ef88a8 00000000 c18faca0 c052a2f4 c10f4420 0000=
0100
> 5de0: 00000000 00000000 c11b1a20 00000003 0000000a 00000003 c0529924 0000=
0000
> 5e00: 01010000 00000000 00000001 00000000 00000000 00000000 00000000 ffff=
ffed
> 5e20: 00000000 c0524684 00000000 00000000 00000000 ffffffed 00000000 c052=
4684
> 5e40: 00000000 00000000 00000000 c12fa500 c12ffea0 00000000 00000000 4da7=
32e0
> 5e60: c10f6810 00000000 c09b7990 c09b7990 00000001 00000000 c09ab198 c043=
59e0
> 5e80: c10f6810 c09f9a84 00000000 c043371c c10f6810 c09b7990 c0433b40 c094=
9028
> 5ea0: 00000001 00000000 c09ab198 c0433a30 00000000 c1185eec c0433b40 c043=
18ec
> 5ec0: 20000013 c10c9f5c c12eb454 4da732e0 c0950638 c10f6810 c10f6854 c094=
9028
> 5ee0: c09ab184 c0433478 c10f6810 c10f6810 00000001 4da732e0 c10f6810 c09a=
b3f0
> 5f00: c10f6810 c09ab184 00000000 c043280c c10f6810 c09ab178 c09ab178 c043=
2cbc
> 5f20: c09ab194 c1004920 c09d64a0 c7ee9400 00000000 c0036110 ffffe000 c095=
064c
> 5f40: c1004920 c0950638 c1004934 ffffe000 c095064c c0965940 00000008 c003=
6748
> 5f60: 00000000 c114a100 c114e2c0 c1184000 00000000 c109dec0 c00364ac c100=
4920
> 5f80: c114a120 c003d5c8 00000000 c114e2c0 c003d480 00000000 00000000 0000=
0000
> 5fa0: 00000000 00000000 00000000 c0008568 00000000 00000000 00000000 0000=
0000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 0000=
0000
> [<c0523108>] (hw_phymode_configure) from [<c0523f74>]
> (ci_hdrc_probe+0x35c/0x8f8)
> [<c0523f74>] (ci_hdrc_probe) from [<c04359e0>] (platform_drv_probe+0x4c/0=
xa0)
> [<c04359e0>] (platform_drv_probe) from [<c043371c>] (really_probe+0x228/0=
x3d0)
> [<c043371c>] (really_probe) from [<c0433a30>] (driver_probe_device+0x54/0=
xb0)
> [<c0433a30>] (driver_probe_device) from [<c04318ec>]
> (bus_for_each_drv+0x58/0xc0)
> [<c04318ec>] (bus_for_each_drv) from [<c0433478>] (__device_attach+0xd8/0=
x14c)
> [<c0433478>] (__device_attach) from [<c043280c>] (bus_probe_device+0x8c/0=
x94)
> [<c043280c>] (bus_probe_device) from [<c042f5b0>] (device_add+0x3b0/0x764=
)
> [<c042f5b0>] (device_add) from [<c0435798>] (platform_device_add+0x100/0x=
208)
> [<c0435798>] (platform_device_add) from [<c0523ad8>]
> (ci_hdrc_add_device+0x414/0x4e0)
> [<c0523ad8>] (ci_hdrc_add_device) from [<c052a2f4>]
> (ci_hdrc_imx_probe+0x2fc/0x5ec)
> [<c052a2f4>] (ci_hdrc_imx_probe) from [<c04359e0>]
> (platform_drv_probe+0x4c/0xa0)
> [<c04359e0>] (platform_drv_probe) from [<c043371c>] (really_probe+0x228/0=
x3d0)
> [<c043371c>] (really_probe) from [<c0433a30>] (driver_probe_device+0x54/0=
xb0)
> [<c0433a30>] (driver_probe_device) from [<c04318ec>]
> (bus_for_each_drv+0x58/0xc0)
> [<c04318ec>] (bus_for_each_drv) from [<c0433478>] (__device_attach+0xd8/0=
x14c)
> [<c0433478>] (__device_attach) from [<c043280c>] (bus_probe_device+0x8c/0=
x94)
> [<c043280c>] (bus_probe_device) from [<c0432cbc>]
> (deferred_probe_work_func+0x60/0x90)
> [<c0432cbc>] (deferred_probe_work_func) from [<c0036110>]
> (process_one_work+0x210/0x5ac)
> [<c0036110>] (process_one_work) from [<c0036748>] (worker_thread+0x29c/0x=
608)
> [<c0036748>] (worker_thread) from [<c003d5c8>] (kthread+0x148/0x170)
> [<c003d5c8>] (kthread) from [<c0008568>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xc1185fb0 to 0xc1185ff8)
> 5fa0:                                     00000000 00000000 00000000 0000=
0000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: e3530000 1a000002 e3c224d2 e182200e (e5802000)
> ---[ end trace 5e6eafe484314edc ]---

--=20

Thanks,
Peter Chen=
