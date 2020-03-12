Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2881182CC1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 10:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCLJxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 05:53:07 -0400
Received: from mail-eopbgr150045.outbound.protection.outlook.com ([40.107.15.45]:62886
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726023AbgCLJxG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 05:53:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvhUyv+iJjO8i9m8QxOXMBzfwpPZ0TxXIsJwSBDBiTLL3GhNd96Uly4xxGc8v5myxS4ww+l2BAUGtw+uug7AcTc0SeyS87Q6mHy1kdF7Jq8AJI5yfURzIkSKo8xAcDvWb0c98R9d+hc98zLpHZ/J4FsUNo+3UUXn1f+fd4hB0WSPnGxeH5jrEzPeRK/YiwPuBWoJUhVlGO+BAAKFXmsjQnsOU1xGxkE5Q32SDZEd9P/W2stThBksue3BqF2xyHDrn0uYjy47wpnrraj0z65hbt0+C32P4QI8eXortRFkXjgnTCMOjfhs7XsotARQx/cOd8syuBY7P7zGNkpYQ7YvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMTiA2bIXVz02kVN3KS7m9F53Hd97qZuRt7w/WMby6k=;
 b=I5evHZTRZ9oiJY56uhkZnmvbpE+QryUayPGNnNOuL+pwK14WIQvPbJHNszzUplc2nqpztQNmG/HqlkmoP0hxN0JHvscMfKOCcD4IJDdbQqkIdGH5K/zIalyxdXG9tomv4JqPRclV80z/h7jSpGM8zubalwXbxXUO9WUmmIul40NB5Urj5WakgECOKCXAsB8m0VSkxDH4wVO/TANJjYCnw7hW7OIXh8HXlcr/TP7NmcdEZMqRLojbqgcWBgW5Xs33W+oKf3/pqnmdkQ3Zsej1RCyDddarr7Yb6GBuA5vX0mbohc8EO/jvU9t3Qi9SWLYVERLcIb0foRzADsMP5VGz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMTiA2bIXVz02kVN3KS7m9F53Hd97qZuRt7w/WMby6k=;
 b=izwyzP3dS/vkwkRuBUBn6Q+sodriLPnOuK0365vNL6LeNARLOGCuNwqtT0QtigtlDLoXcJZsVW3sva81EG5WJUCvRO1UKZxVen4rJdnHcnVy8Ur2GCPZH85C1wVAXyT5E4F1pjQJIBlX5rWgf0FEi+1aB4G/LEzwh9ya2TNUi9g=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3967.eurprd04.prod.outlook.com (10.171.182.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Thu, 12 Mar 2020 09:53:01 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 09:53:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>
CC:     Otavio Salvador <otavio@ossystems.com.br>,
        Felipe Balbi <balbi@kernel.org>,
        "sorganov@gmail.com" <sorganov@gmail.com>,
        "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>,
        "felixhaedicke@web.de" <felixhaedicke@web.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: Error when unloading g_serial module
Thread-Topic: Error when unloading g_serial module
Thread-Index: AQHV9CNuWl2rtT59tUWJ/W3PD9OK8qg9i2UAgAc0YAA=
Date:   Thu, 12 Mar 2020 09:53:01 +0000
Message-ID: <20200312095304.GE14625@b29397-desktop>
References: <CAP9ODKrH_7p1p1+9pXc-85m3yHHo_2YLouuXFBOLBr+gsSe+Ew@mail.gmail.com>
 <CAP9ODKrrgYgHvn6Rm8aC18z9gaCS51AFztD7xYF2H53hbPXS=w@mail.gmail.com>
In-Reply-To: <CAP9ODKrrgYgHvn6Rm8aC18z9gaCS51AFztD7xYF2H53hbPXS=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 736b71b0-89ba-4ed8-d53b-08d7c66b26e8
x-ms-traffictypediagnostic: VI1PR04MB3967:
x-microsoft-antispam-prvs: <VI1PR04MB3967D4755F64618E395EB9E88BFD0@VI1PR04MB3967.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(33716001)(6506007)(54906003)(316002)(71200400001)(186003)(6486002)(53546011)(4326008)(9686003)(6916009)(33656002)(6512007)(26005)(81156014)(81166006)(8936002)(1076003)(5660300002)(2906002)(76116006)(91956017)(478600001)(8676002)(64756008)(86362001)(66556008)(66476007)(66946007)(44832011)(966005)(66446008)(45080400002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3967;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L/s1vsGpwnpZhb+3zBFJvzl+M7Q90oVQt28A2AphXV+oFfxH000bmnWZM/1w28ag/Jk1OfK7JD3j84C+JIKz8xWMOmZc6hvwWQut7YbykeqZVJzkAAM1lE3kawz7RBnU/my7mk3UtOpn/1cmnYMhKqUrWHsmEiFWm2HOWM/eGcoeGUW/X4VXcczlZgVxhUuV6mwdduxrRgEqCcHBhLdP4HXnROVD7aH0eDfN0E+WYDwZvdo0h6+96B+7YSriuUfWOF6MP+BS/+QF8wTFTlGrMzAC9/TZvvNIeoQ2s8AhLz9RSTFdF/2+s+YxgD+gLYB7gcV6CsvvKiqbH4LzAyizlOBD4mIplinIJdIIrxBzNfPYDH2MbyD0W2PaMdGJW5H1XMDHwY3nM9EgDgoZsMnacbUrU6YfKJjaWs9mvhjM4zDLaixZB80RxmjxNXp5fSCOIo2vZdcs4o0O9O5iTShWeUH23k9n+8QJf5Hz+FFOnKwDKjbNT5+MgtLliZnZnHZ7PWts1XAnjZ3FIMISHkzBeg==
x-ms-exchange-antispam-messagedata: VoZAsXRc4qxd8nGVnr9knDWi1knv3P3sBIs8eWjh6igTZ3EqQPyXvBwYC8yTTIPwyze9TAGlfA9pZqQGlJ1vm1dpP419/VKhDs/1wBJF0c4L9LFu8I2FSrf6r2YX4LxbdylvKLCL7hQtuonVVItwKA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74B1507B2EFBA84DB4CFD99DFB041432@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736b71b0-89ba-4ed8-d53b-08d7c66b26e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 09:53:01.2168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUa+TKwiMEw2CFJxjy9unAwM+HPVQbDqgq2HWGJIGGYgc7JC9JRBSFLtZyfrhEKJu/NO/fYuTx2kyxGNlxbf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3967
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-07 16:51:48, Otavio Salvador wrote:
> Sorry, here is the log withoiut any out-of-tree module:
>=20
> [root@rv1108 ~]# modprobe  -r g_serial
> [   86.928476] 8<--- cut here ---
> [   86.928781] Unable to handle kernel NULL pointer dereference at
> virtual address 000000d4
> [   86.929511] pgd =3D 2c058c2d
> [   86.929766] [000000d4] *pgd=3D6591f835, *pte=3D00000000, *ppte=3D00000=
000
> [   86.930350] Internal error: Oops: 17 [#1] SMP ARM
> [   86.930778] Modules linked in: usb_f_acm u_serial g_serial(-)
> libcomposite configfs zram zsmalloc clk_rk808 rtc_rk808 spi_rockchip
> [   86.931872] CPU: 0 PID: 498 Comm: sat Not tainted 5.4.23 #41
> [   86.932376] Hardware name: Rockchip (Device Tree)
> [   86.932818] PC is at _raw_spin_lock_irq+0x8/0x44
> [   86.933254] LR is at gs_close+0x28/0x1e4 [u_serial]
> [   86.933696] pc : [<c08483b0>]    lr : [<bf03fd28>]    psr: a00e0093
> [   86.934255] sp : c5c05d38  ip : 00005401  fp : ffffffed
> [   86.934724] r10: c6716db8  r9 : 00000000  r8 : c096d664
> [   86.935191] r7 : c5c07b40  r6 : 000000d4  r5 : c0d05c88  r4 : 00000000
> [   86.935774] r3 : 79f4b188  r2 : c63ca600  r1 : c5c07b40  r0 : 000000d4
> [   86.936366] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
> Segment none
> [   86.937010] Control: 10c5387d  Table: 65be406a  DAC: 00000051
> [   86.937528] Process sat (pid: 498, stack limit =3D 0x87e8ad9f)
> [   86.938041] Stack: (0xc5c05d38 to 0xc5c06000)
> [   86.938440] 5d20:
>     0f300000 c6716db8
> [   86.939172] 5d40: c5c07b40 c63ca600 c5c07b40 79f4b188 c63ca600
> 00000000 c0ae9318 c5c07b40
> [   86.939904] 5d60: c096d664 00000000 c6716db8 c04f47cc 00000000
> c04fc400 c63ca600 00000000
> [   86.940637] 5d80: 00000000 c63ca600 c5c07b40 c0ae9318 c5c04000
> c096d664 0f300000 c6716db8
> [   86.941370] 5da0: ffffffed c04f66a0 800e0093 00000902 c0d8ecd8
> c593d180 c0d05c88 00000081
> [   86.942101] 5dc0: 00000000 79f4b188 00000000 c096d6e4 c0d05c88
> c5910e40 00000000 c6716db8
> [   86.942833] 5de0: c5c07b40 00000000 c5c07b40 c02b3250 c5c05ec0
> 79f4b188 c5c05ec0 c5c07b40
> [   86.943565] 5e00: c6716db8 c5c07b48 c02b3174 00000006 c6716db8
> c02aa874 c5c05ec0 00000000
> [   86.944296] 5e20: 00000902 00000000 00000000 00000006 c6716db8
> c02bd920 c0161a04 00000100
> [   86.945029] 5e40: 00000000 000041ed 00000000 00000000 c0d05c88
> 00000041 00000000 c014fc70
> [   86.945761] 5e60: ffffe000 00000000 c0a7273c c0152494 600e0013
> c5813b90 00000002 c6716db8
> [   86.946493] 5e80: c708b9d0 c6ef1bb0 00000000 c5813b7c c0a6abdc
> 79f4b188 c0d8ecd8 c0d05c88
> [   86.947225] 5ea0: c0d05c88 c5c05f70 00000001 fffff000 c5c04000
> 00000142 b63a3874 c02bf5f0
> [   86.947958] 5ec0: c708b9d0 c6ef1bb0 ad6e75ef 00000006 c70da015
> c6371e40 00000000 c6cba6e8
> [   86.948689] 5ee0: c6716db8 00000101 00000002 00000054 00000000
> 00000000 00000000 c5c05f00
> [   86.949424] 5f00: c583b600 c583ba58 00000000 c0843628 c583ba40
> c583b600 c0d05c88 c01556a8
> [   86.950155] 5f20: ffffe000 79f4b188 00000011 00000020 c70da000
> 00000000 00000000 00000002
> [   86.950890] 5f40: ffffff9c c02cea14 00000902 79f4b188 ffffff9c
> 00000011 c0d05c88 ffffff9c
> [   86.951622] 5f60: c70da000 c02abd18 00000000 79f4b188 00000902
> c0150000 00000006 00000100
> [   86.952355] 5f80: 00000001 79f4b188 003e75dc 00677470 00000011
> 00000142 c0101204 c5c04000
> [   86.953088] 5fa0: 00000142 c0101000 003e75dc 00677470 ffffff9c
> 003e75dc 00000902 00000000
> [   86.953824] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
> 00020000 00020000 b63a3874
> [   86.954555] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c 600e0010
> ffffff9c 00000000 00000000
> [   86.955312] [<c08483b0>] (_raw_spin_lock_irq) from [<bf03fd28>]
> (gs_close+0x28/0x1e4 [u_serial])
> [   86.956121] [<bf03fd28>] (gs_close [u_serial]) from [<c04f47cc>]
> (tty_release+0xf0/0x47c)
> [   86.956864] [<c04f47cc>] (tty_release) from [<c04f66a0>]
> (tty_open+0x118/0x3fc)
> [   86.957528] [<c04f66a0>] (tty_open) from [<c02b3250>]
> (chrdev_open+0xdc/0x1a8)
> [   86.958184] [<c02b3250>] (chrdev_open) from [<c02aa874>]
> (do_dentry_open+0x21c/0x3f0)
> [   86.958898] [<c02aa874>] (do_dentry_open) from [<c02bd920>]
> (path_openat+0x470/0x1174)
> [   86.959615] [<c02bd920>] (path_openat) from [<c02bf5f0>]
> (do_filp_open+0x70/0xdc)
> [   86.960293] [<c02bf5f0>] (do_filp_open) from [<c02abd18>]
> (do_sys_open+0x180/0x214)
> [   86.960985] [<c02abd18>] (do_sys_open) from [<c0101000>]
> (ret_fast_syscall+0x0/0x54)
> [   86.961671] Exception stack(0xc5c05fa8 to 0xc5c05ff0)
> [   86.962130] 5fa0:                   003e75dc 00677470 ffffff9c
> 003e75dc 00000902 00000000
> [   86.962863] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
> 00020000 00020000 b63a3874
> [   86.963591] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c
> [   86.964054] Code: f57ff05b e12fff1e f10c0080 f590f000 (e1903f9f)
> [   86.964603] ---[ end trace 2e9f93ef91ffad40 ]---
> [root@rv1108 ~]#
>=20

Did you run any applications on it? I can't trigger it by using
the latest usb-linus tree, no matter the connection is there or not.

Peter

> Thanks
>=20
> On Fri, Mar 6, 2020 at 10:54 PM Otavio Salvador <otavio@ossystems.com.br>=
 wrote:
> >
> > Hi,
> >
> > Running kernel 5.4.23 on a RV1108 based board the following issue is
> > seen when removing the g_serial module.
> >
> > [root@rv1108 ~]# rmmod g_serial
> > [root@rv1108 ~]#
> > [   78.090775] ------------[ cut here ]------------
> > [   78.091252] WARNING: CPU: 0 PID: 617 at
> > drivers/usb/gadget/function/u_serial.c:706 gs_close+0x8c/0x1e4
> > [u_serial]
> > [   78.092164] Modules linked in: usb_f_acm u_serial libcomposite
> > configfs zram zsmalloc emlog(O) wdtoken(O) clk_rk808 rtc_rk808
> > spi_rockchip [last unloaded: g_serial]
> > [   78.093529] CPU: 0 PID: 617 Comm: nm-online Tainted: G           O
> >     5.4.23 #41
> > [   78.094198] Hardware name: Rockchip (Device Tree)
> > [   78.094655] [<c0111100>] (unwind_backtrace) from [<c010c638>]
> > (show_stack+0x10/0x14)
> > [   78.095363] [<c010c638>] (show_stack) from [<c082b19c>]
> > (dump_stack+0xc0/0xd4)
> > [   78.096027] [<c082b19c>] (dump_stack) from [<c01357c8>] (__warn+0xe0=
/0xf8)
> > [   78.096655] [<c01357c8>] (__warn) from [<c0135890>]
> > (warn_slowpath_fmt+0xb0/0xb8)
> > [   78.097341] [<c0135890>] (warn_slowpath_fmt) from [<bf04ad8c>]
> > (gs_close+0x8c/0x1e4 [u_serial])
> > [   78.098137] [<bf04ad8c>] (gs_close [u_serial]) from [<c04f47cc>]
> > (tty_release+0xf0/0x47c)
> > [   78.098877] [<c04f47cc>] (tty_release) from [<c02afb14>] (__fput+0x8=
8/0x214)
> > [   78.099517] [<c02afb14>] (__fput) from [<c01556a4>] (task_work_run+0=
xa4/0xc8)
> > [   78.100164] [<c01556a4>] (task_work_run) from [<c01397a4>]
> > (do_exit+0x3e4/0xac8)
> > [   78.100835] [<c01397a4>] (do_exit) from [<c013ad04>]
> > (do_group_exit+0x3c/0xc8)
> > [   78.101486] [<c013ad04>] (do_group_exit) from [<c013ada0>]
> > (__wake_up_parent+0x0/0x18)
> > [   78.102190] ---[ end trace f34de27d5eaf8688 ]---
> >
> > Looks like port.count is not being correctly handled.
> >
> > Does anyone have any suggestions on how we could fix this?
> >
> > Thanks
> >
> > --
> > Otavio Salvador                             O.S. Systems
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.=
ossystems.com.br&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Ced20bf39cd2646=
6f004008d7c2d10414%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63719207528=
2592940&amp;sdata=3DUiYXQuxW%2BA95IorbdZm4GMp%2BYd8npRF5mp5mOeFcpbs%3D&amp;=
reserved=3D0        https://eur01.safelinks.protection.outlook.com/?url=3Dh=
ttp%3A%2F%2Fcode.ossystems.com.br&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com=
%7Ced20bf39cd26466f004008d7c2d10414%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%=
7C0%7C637192075282592940&amp;sdata=3DwsaXtyIqj9h46wnfqlwLCjUtBbG7n7%2BOjail=
DbGbATA%3D&amp;reserved=3D0
> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>=20
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.os=
systems.com.br&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Ced20bf39cd26466f=
004008d7c2d10414%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371920752825=
92940&amp;sdata=3DUiYXQuxW%2BA95IorbdZm4GMp%2BYd8npRF5mp5mOeFcpbs%3D&amp;re=
served=3D0        https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
p%3A%2F%2Fcode.ossystems.com.br&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7=
Ced20bf39cd26466f004008d7c2d10414%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C=
0%7C637192075282592940&amp;sdata=3DwsaXtyIqj9h46wnfqlwLCjUtBbG7n7%2BOjailDb=
GbATA%3D&amp;reserved=3D0
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--=20

Thanks,
Peter Chen=
