Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC07AB01A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 03:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390936AbfIFB2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 21:28:19 -0400
Received: from mail-eopbgr140079.outbound.protection.outlook.com ([40.107.14.79]:25315
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390964AbfIFB2T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Sep 2019 21:28:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOqN36YYs0ZiGUIl0D0dFiaLZyB+lNpmU/0bQ3O/qqZHiDS2x0MuIXUWKkb9NOIPG2ipq0N+Y98N64vsFoFOboVVkvkHi42I3YdhKbNO70KV1mvpHxgCt1ANcnnYjuyFukXtSC0H4+WgH3X9wjQSoGg5Yrz+82aH+GZdNVn37B0t3JegZKhwdHAazYCR7Alw8zrbGpdg9KdFZt6zIru70r31r9hu5sN6IEiZBwY51AiSRb132bZMX5PpYqH70JcbHPWXNMpuPynhZalONzqUDB35Zh6WiV3oRN2VYWQXOlyOmsy3AK4IO1KN9bYs7KJqsH7IATd4+VnTY4rflhDhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB2cQqIAgryi2kIBjvgB5u1fwQ5S8P5huXIWzoElVL0=;
 b=TMAaUgVQjp/xcNjkIk+zGd67CCzUO4UbFAr7oj9F8RpOZ3zP6uI+zmFYD6/y0XazLGocQijB/DbrhpMYX+0qNPJ1pWvqL6yOugKy3uUH8l54ubLy9oUwvJPcNueXAqiE7rU0BkHntWWyqEpo9ywMOSt22UOcXE7UgbGfNTHN3hS1LpUZ1xpk9sJM3SDly5aQ2yOQfeliZU05Ec7nkFdPa+W0OwpjY4td1AYVm/Fzj7pk10xrZeYHVnvGqU5m86QiggAUOS3iDhxLwaoBpc0woqlHcERkci5C6/22rizZWl420r35eF5IdYq16kifikBxfHaEA/jGdgVgtRVzW0tfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB2cQqIAgryi2kIBjvgB5u1fwQ5S8P5huXIWzoElVL0=;
 b=TrAVbe3eLboH6pkv/zytBQ7k3eB6NrTGsEqcxjnwAscoI8yaaP1bqzk0+tWt+JT8LMUJrW2ooG5kqyea08LkgfDQD7J9dFUR9Ug2dAg2xziG5huGvF0qvS4KkQqhz82K5Z/+pY61lbWxoUQgUf+27Aw/NVEkrOyiMUOYBpziS7M=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4576.eurprd04.prod.outlook.com (20.177.55.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Fri, 6 Sep 2019 01:28:07 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 01:28:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: configfs: fix concurrent issue between
 composite APIs
Thread-Topic: [PATCH 1/1] usb: gadget: configfs: fix concurrent issue between
 composite APIs
Thread-Index: AQHVW92DsLn5Wqd4KEy+WBn2qEfv46cd7QIA
Date:   Fri, 6 Sep 2019 01:28:06 +0000
Message-ID: <20190906012822.GC13573@b29397-desktop>
References: <1566846655-23935-1-git-send-email-peter.chen@nxp.com>
In-Reply-To: <1566846655-23935-1-git-send-email-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdc179a4-941b-4959-872e-08d732697876
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4576;
x-ms-traffictypediagnostic: VI1PR04MB4576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB457675B4CF14B5EC2D1846B78BBA0@VI1PR04MB4576.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(5660300002)(26005)(186003)(99286004)(53546011)(102836004)(2906002)(6486002)(305945005)(33716001)(9686003)(11346002)(6246003)(44832011)(446003)(6436002)(476003)(6512007)(5640700003)(6506007)(30864003)(53946003)(3846002)(6116002)(53936002)(6916009)(4326008)(76176011)(486006)(45080400002)(1076003)(81156014)(66556008)(229853002)(91956017)(2351001)(76116006)(8936002)(1730700003)(66066001)(316002)(54906003)(33656002)(66946007)(81166006)(2501003)(25786009)(14444005)(66476007)(478600001)(14454004)(71200400001)(86362001)(256004)(71190400001)(7736002)(66446008)(64756008)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4576;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DiqZw88lXnXprN1AfDO6X7/oFl0f7XimEiVA6OAh463vK120TMNBhQQN9JQPhh/TgywOTURWZogbFGXtvC82XkHH05eD7nsLWScLZE35J4V2UZqh6ddAsqYD9Dz28N4at91Nigo6/qgQ77ev+lwHUqPsYa7JDOb/4osIx71WwsyKprcmNoP71Iy8JDanEaac4Q3JhAkhIpcmZ8z+05oCuNEsC+puY2gjbpFXto73oi5vTmKw7c2spoHYN/Nx3+TuDCVU5FRMxU0KJF7tZ083Qre6kQ7wUGx6zHkDC2b8o3YjmACM3IXbkASfg5FM9HAVo2VCSeNRmSlrwL1N2i9gonAafG7HbnzEZL800gdwIfUQBW/OGyYdEPxqgBHGUNnt5OQ6qb9gkege7b3LlA5cJiIjDXyDfrfQ+/vxYpnhRj8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6566C9EC73DD35468CF9C00A43CE59C6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc179a4-941b-4959-872e-08d732697876
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 01:28:06.9045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeilWlPNpElxXN9zSqCRwUdza9JgCZET0J/WLHRJ3pdC7ocRO4VV9btkyvyu75MPy663413HibMRpgyHkxwYTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4576
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-08-26 15:10:55, Peter Chen wrote:
> We meet several NULL pointer issues if configfs_composite_unbind
> and composite_setup (or composite_disconnect) are running together.
> These issues occur when do the function switch stress test, the
> configfs_compsoite_unbind is called from user mode by
> echo "" to /sys/../UDC entry, and meanwhile, the setup interrupt
> or disconnect interrupt occurs by hardware. The composite_setup
> will get the cdev from get_gadget_data, but configfs_composite_unbind
> will set gadget data as NULL, so the NULL pointer issue occurs.
> This concurrent is hard to reproduce by native kernel, but can be
> reproduced by android kernel.
>=20
> In this commit, we introduce one spinlock belongs to structure
> gadget_info since we can't use the same spinlock in usb_composite_dev
> due to exclusive running together between composite_setup and
> configfs_composite_unbind. And one bit flag 'unbind' to indicate the
> code is at unbind routine, this bit is needed due to we release the
> lock at during configfs_composite_unbind sometimes, and composite_setup
> may be run at that time.
>=20

A gentle ping...

Peter
> Several oops:
>=20
> oops 1:
> android_work: sent uevent USB_STATE=3DCONNECTED
> configfs-gadget gadget: super-speed config #1: b
> android_work: sent uevent USB_STATE=3DCONFIGURED
> init: Received control message 'start' for 'adbd' from pid: 3515 (system_=
server)
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
02a
> init: Received control message 'stop' for 'adbd' from pid: 3375 (/vendor/=
bin/hw/android.hardware.usb@1.1-servic)
> Mem abort info:
>   Exception class =3D DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000004
>   CM =3D 0, WnR =3D 0
> user pgtable: 4k pages, 48-bit VAs, pgd =3D ffff8008f1b7f000
> [000000000000002a] *pgd=3D0000000000000000
> Internal error: Oops: 96000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 4 PID: 2457 Comm: irq/125-5b11000 Not tainted 4.14.98-07846-g0b40a9b=
-dirty #16
> Hardware name: Freescale i.MX8QM MEK (DT)
> task: ffff8008f2a98000 task.stack: ffff00000b7b8000
> PC is at composite_setup+0x44/0x1508
> LR is at android_setup+0xb8/0x13c
> pc : [<ffff0000089ffb3c>] lr : [<ffff000008a032fc>] pstate: 800001c5
> sp : ffff00000b7bbb80
> x29: ffff00000b7bbb80 x28: ffff8008f2a3c010
> x27: 0000000000000001 x26: 0000000000000000                              =
                            [1232/1897]
> audit: audit_lost=3D25791 audit_rate_limit=3D5 audit_backlog_limit=3D64
> x25: 00000000ffffffa1 x24: ffff8008f2a3c010
> audit: rate limit exceeded
> x23: 0000000000000409 x22: ffff000009c8e000
> x21: ffff8008f7a8b428 x20: ffff00000afae000
> x19: ffff0000089ff000 x18: 0000000000000000
> x17: 0000000000000000 x16: ffff0000082b7c9c
> x15: 0000000000000000 x14: f1866f5b952aca46
> x13: e35502e30d44349c x12: 0000000000000008
> x11: 0000000000000008 x10: 0000000000000a30
> x9 : ffff00000b7bbd00 x8 : ffff8008f2a98a90
> x7 : ffff8008f27a9c90 x6 : 0000000000000001
> x5 : 0000000000000000 x4 : 0000000000000001
> x3 : 0000000000000000 x2 : 0000000000000006
> x1 : ffff0000089ff8d0 x0 : 732a010310b9ed00
>=20
> X7: 0xffff8008f27a9c10:
> 9c10  00000002 00000000 00000001 00000000 13110000 ffff0000 00000002 0020=
8040
> 9c30  00000000 00000000 00000000 00000000 00000000 00000005 00000029 0000=
0000
> 9c50  00051778 00000001 f27a8e00 ffff8008 00000005 00000000 00000078 0000=
0078
> 9c70  00000078 00000000 09031d48 ffff0000 00100000 00000000 00400000 0000=
0000
> 9c90  00000001 00000000 00000000 00000000 00000000 00000000 ffefb1a0 ffff=
8008
> 9cb0  f27a9ca8 ffff8008 00000000 00000000 b9d88037 00000173 1618a3eb 0000=
0001
> 9cd0  870a792a 0000002e 16188fe6 00000001 0000242b 00000000 00000000 0000=
0000
> using random self ethernet address
> 9cf0  019a4646 00000000 000547f3 00000000 ecfd6c33 00000002 00000000
> using random host ethernet address
>  00000000
>=20
> X8: 0xffff8008f2a98a10:
> 8a10  00000000 00000000 f7788d00 ffff8008 00000001 00000000 00000000 0000=
0000
> 8a30  eb218000 ffff8008 f2a98000 ffff8008 f2a98000 ffff8008 09885000 ffff=
0000
> 8a50  f34df480 ffff8008 00000000 00000000 f2a98648 ffff8008 09c8e000 ffff=
0000
> 8a70  fff2c800 ffff8008 09031d48 ffff0000 0b7bbd00 ffff0000 0b7bbd00 ffff=
0000
> 8a90  080861bc ffff0000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 8ab0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 8ad0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 8af0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
>=20
> X21: 0xffff8008f7a8b3a8:
> b3a8  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> b3c8  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> b3e8  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> b408  00000000 00000000 00000000 00000000 00000000 00000000 00000001 0000=
0000
> b428  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> b448  0053004d 00540046 00300031 00010030 eb07b520 ffff8008 20011201 0000=
0003
> b468  e418d109 0104404e 00010302 00000000 eb07b558 ffff8008 eb07b558 ffff=
8008
> b488  f7a8b488 ffff8008 f7a8b488 ffff8008 f7a8b300 ffff8008 00000000 0000=
0000
>=20
> X24: 0xffff8008f2a3bf90:
> bf90  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bfb0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bfd0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bff0  00000000 00000000 00000000 00000000 f76c8010 ffff8008 f76c8010 ffff=
8008
> c010  00000000 00000000 f2a3c018 ffff8008 f2a3c018 ffff8008 08a067dc ffff=
0000
> c030  f2a5a000 ffff8008 091c3650 ffff0000 f716fd18 ffff8008 f716fe30 ffff=
8008
> c050  f2ce4a30 ffff8008 00000000 00000005 00000000 00000000 095d1568 ffff=
0000
> c070  f76c8010 ffff8008 f2ce4b00 ffff8008 095cac68 ffff0000 f2a5a028 ffff=
8008
>=20
> X28: 0xffff8008f2a3bf90:
> bf90  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bfb0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bfd0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> bff0  00000000 00000000 00000000 00000000 f76c8010 ffff8008 f76c8010 ffff=
8008
> c010  00000000 00000000 f2a3c018 ffff8008 f2a3c018 ffff8008 08a067dc ffff=
0000
> c030  f2a5a000 ffff8008 091c3650 ffff0000 f716fd18 ffff8008 f716fe30 ffff=
8008
> c050  f2ce4a30 ffff8008 00000000 00000005 00000000 00000000 095d1568 ffff=
0000
> c070  f76c8010 ffff8008 f2ce4b00 ffff8008 095cac68 ffff0000 f2a5a028 ffff=
8008
>=20
> Process irq/125-5b11000 (pid: 2457, stack limit =3D 0xffff00000b7b8000)
> Call trace:
> Exception stack(0xffff00000b7bba40 to 0xffff00000b7bbb80)
> ba40: 732a010310b9ed00 ffff0000089ff8d0 0000000000000006 0000000000000000
> ba60: 0000000000000001 0000000000000000 0000000000000001 ffff8008f27a9c90
> ba80: ffff8008f2a98a90 ffff00000b7bbd00 0000000000000a30 0000000000000008
> baa0: 0000000000000008 e35502e30d44349c f1866f5b952aca46 0000000000000000
> bac0: ffff0000082b7c9c 0000000000000000 0000000000000000 ffff0000089ff000
> bae0: ffff00000afae000 ffff8008f7a8b428 ffff000009c8e000 0000000000000409
> bb00: ffff8008f2a3c010 00000000ffffffa1 0000000000000000 0000000000000001
> bb20: ffff8008f2a3c010 ffff00000b7bbb80 ffff000008a032fc ffff00000b7bbb80
> bb40: ffff0000089ffb3c 00000000800001c5 ffff00000b7bbb80 732a010310b9ed00
> bb60: ffffffffffffffff ffff0000080f777c ffff00000b7bbb80 ffff0000089ffb3c
> [<ffff0000089ffb3c>] composite_setup+0x44/0x1508
> [<ffff000008a032fc>] android_setup+0xb8/0x13c
> [<ffff0000089bd9a8>] cdns3_ep0_delegate_req+0x44/0x70
> [<ffff0000089bdff4>] cdns3_check_ep0_interrupt_proceed+0x33c/0x654
> [<ffff0000089bca44>] cdns3_device_thread_irq_handler+0x4b0/0x4bc
> [<ffff0000089b77b4>] cdns3_thread_irq+0x48/0x68
> [<ffff000008145bf0>] irq_thread_fn+0x28/0x88
> [<ffff000008145e38>] irq_thread+0x13c/0x228
> [<ffff0000080fed70>] kthread+0x104/0x130
> [<ffff000008085064>] ret_from_fork+0x10/0x18
>=20
> oops2:
> composite_disconnect: Calling disconnect on a Gadget that is             =
         not connected
> android_work: did not send uevent (0 0           (null))
> init: Received control message 'stop' for 'adbd' from pid: 3359 (/vendor/=
bin/hw/android.hardware.usb@1.1-service.imx)
> init: Sending signal 9 to service 'adbd' (pid 22343) process group...
> ------------[ cut here ]------------
> audit: audit_lost=3D180038 audit_rate_limit=3D5 audit_backlog_limit=3D64
> audit: rate limit exceeded
> WARNING: CPU: 0 PID: 3468 at kernel_imx/drivers/usb/gadget/composite.c:20=
09 composite_disconnect+0x80/0x88
> Modules linked in:
> CPU: 0 PID: 3468 Comm: HWC-UEvent-Thre Not tainted 4.14.98-07846-g0b40a9b=
-dirty #16
> Hardware name: Freescale i.MX8QM MEK (DT)
> task: ffff8008f2349c00 task.stack: ffff00000b0a8000
> PC is at composite_disconnect+0x80/0x88
> LR is at composite_disconnect+0x80/0x88
> pc : [<ffff0000089ff9b0>] lr : [<ffff0000089ff9b0>] pstate: 600001c5
> sp : ffff000008003dd0
> x29: ffff000008003dd0 x28: ffff8008f2349c00
> x27: ffff000009885018 x26: ffff000008004000
> Timeout for IPC response!
> x25: ffff000009885018 x24: ffff000009c8e280
> x23: ffff8008f2d98010 x22: 00000000000001c0
> x21: ffff8008f2d98394 x20: ffff8008f2d98010
> x19: 0000000000000000 x18: 0000e3956f4f075a
> fxos8700 4-001e: i2c block read acc failed
> x17: 0000e395735727e8 x16: ffff00000829f4d4
> x15: ffffffffffffffff x14: 7463656e6e6f6320
> x13: 746f6e2009090920 x12: 7369207461687420
> x11: 7465676461472061 x10: 206e6f207463656e
> x9 : 6e6f637369642067 x8 : ffff000009c8e280
> x7 : ffff0000086ca6cc x6 : ffff000009f15e78
> x5 : 0000000000000000 x4 : 0000000000000000
> x3 : ffffffffffffffff x2 : c3f28b86000c3900
> x1 : c3f28b86000c3900 x0 : 000000000000004e
>=20
> X20: 0xffff8008f2d97f90:
> 7f90  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 7fb0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> libprocessgroup: Failed to kill process cgroup uid 0 pid 22343 in 215ms, =
1 processes remain
> 7fd0
> Timeout for IPC response!
>  00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> using random self ethernet address
> 7ff0  00000000 00000000 00000000 00000000 f76c8010 ffff8008 f76c8010 ffff=
8008
> 8010  00000100 00000000 f2d98018 ffff8008 f2d98018 ffff8008 08a067dc
> using random host ethernet address
>  ffff0000
> 8030  f206d800 ffff8008 091c3650 ffff0000 f7957b18 ffff8008 f7957730 ffff=
8008
> 8050  f716a630 ffff8008 00000000 00000005 00000000 00000000 095d1568 ffff=
0000
> 8070  f76c8010 ffff8008 f716a800 ffff8008 095cac68 ffff0000 f206d828 ffff=
8008
>=20
> X21: 0xffff8008f2d98314:
> 8314  ffff8008 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 8334  00000000 00000000 00000000 00000000 00000000 08a04cf4 ffff0000 0000=
0000
> 8354  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 8374  00000000 00000000 00000000 00001001 00000000 00000000 00000000 0000=
0000
> 8394  e4bbe4bb 0f230000 ffff0000 0afae000 ffff0000 ae001000 00000000 f206=
d400
> Timeout for IPC response!
> 83b4  ffff8008 00000000 00000000 f7957b18 ffff8008 f7957718 ffff8008 f795=
7018
> 83d4  ffff8008 f7957118 ffff8008 f7957618 ffff8008 f7957818 ffff8008 f795=
7918
> 83f4  ffff8008 f7957d18 ffff8008 00000000 00000000 00000000 00000000 0000=
0000
>=20
> X23: 0xffff8008f2d97f90:
> 7f90  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 7fb0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 7fd0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 7ff0  00000000 00000000 00000000 00000000 f76c8010 ffff8008 f76c8010 ffff=
8008
> 8010  00000100 00000000 f2d98018 ffff8008 f2d98018 ffff8008 08a067dc ffff=
0000
> 8030  f206d800 ffff8008 091c3650 ffff0000 f7957b18 ffff8008 f7957730 ffff=
8008
> 8050  f716a630 ffff8008 00000000 00000005 00000000 00000000 095d1568 ffff=
0000
> 8070  f76c8010 ffff8008 f716a800 ffff8008 095cac68 ffff0000 f206d828 ffff=
8008
>=20
> X28: 0xffff8008f2349b80:
> 9b80  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 9ba0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 9bc0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 9be0  00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 9c00  00000022 00000000 ffffffff ffffffff 00010001 00000000 00000000 0000=
0000
> 9c20  0b0a8000 ffff0000 00000002 00404040 00000000 00000000 00000000 0000=
0000
> 9c40  00000001 00000000 00000001 00000000 001ebd44 00000001 f390b800 ffff=
8008
> 9c60  00000000 00000001 00000070 00000070 00000070 00000000 09031d48 ffff=
0000
>=20
> Call trace:
> Exception stack(0xffff000008003c90 to 0xffff000008003dd0)
> 3c80:                                   000000000000004e c3f28b86000c3900
> 3ca0: c3f28b86000c3900 ffffffffffffffff 0000000000000000 0000000000000000
> 3cc0: ffff000009f15e78 ffff0000086ca6cc ffff000009c8e280 6e6f637369642067
> 3ce0: 206e6f207463656e 7465676461472061 7369207461687420 746f6e2009090920
> 3d00: 7463656e6e6f6320 ffffffffffffffff ffff00000829f4d4 0000e395735727e8
> 3d20: 0000e3956f4f075a 0000000000000000 ffff8008f2d98010 ffff8008f2d98394
> 3d40: 00000000000001c0 ffff8008f2d98010 ffff000009c8e280 ffff000009885018
> 3d60: ffff000008004000 ffff000009885018 ffff8008f2349c00 ffff000008003dd0
> 3d80: ffff0000089ff9b0 ffff000008003dd0 ffff0000089ff9b0 00000000600001c5
> 3da0: ffff8008f33f2cd8 0000000000000000 0000ffffffffffff 0000000000000000
> init: Received control message 'start' for 'adbd' from pid: 3359 (/vendor=
/bin/hw/android.hardware.usb@1.1-service.imx)
> 3dc0: ffff000008003dd0 ffff0000089ff9b0
> [<ffff0000089ff9b0>] composite_disconnect+0x80/0x88
> [<ffff000008a044d4>] android_disconnect+0x3c/0x68
> [<ffff0000089ba9f8>] cdns3_device_irq_handler+0xfc/0x2c8
> [<ffff0000089b84c0>] cdns3_irq+0x44/0x94
> [<ffff00000814494c>] __handle_irq_event_percpu+0x60/0x24c
> [<ffff000008144c0c>] handle_irq_event+0x58/0xc0
> [<ffff00000814873c>] handle_fasteoi_irq+0x98/0x180
> [<ffff000008143a10>] generic_handle_irq+0x24/0x38
> [<ffff000008144170>] __handle_domain_irq+0x60/0xac
> [<ffff0000080819c4>] gic_handle_irq+0xd4/0x17c
>=20
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/gadget/configfs.c | 110 ++++++++++++++++++++++++++++++++--
>  1 file changed, 105 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.=
c
> index 025129942894..33852c2b29d1 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -61,6 +61,8 @@ struct gadget_info {
>  	bool use_os_desc;
>  	char b_vendor_code;
>  	char qw_sign[OS_STRING_QW_SIGN_LEN];
> +	spinlock_t spinlock;
> +	bool unbind;
>  };
> =20
>  static inline struct gadget_info *to_gadget_info(struct config_item *ite=
m)
> @@ -1244,6 +1246,7 @@ static int configfs_composite_bind(struct usb_gadge=
t *gadget,
>  	int				ret;
> =20
>  	/* the gi->lock is hold by the caller */
> +	gi->unbind =3D 0;
>  	cdev->gadget =3D gadget;
>  	set_gadget_data(gadget, cdev);
>  	ret =3D composite_dev_prepare(composite, cdev);
> @@ -1376,31 +1379,128 @@ static void configfs_composite_unbind(struct usb=
_gadget *gadget)
>  {
>  	struct usb_composite_dev	*cdev;
>  	struct gadget_info		*gi;
> +	unsigned long flags;
> =20
>  	/* the gi->lock is hold by the caller */
> =20
>  	cdev =3D get_gadget_data(gadget);
>  	gi =3D container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	gi->unbind =3D 1;
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> =20
>  	kfree(otg_desc[0]);
>  	otg_desc[0] =3D NULL;
>  	purge_configs_funcs(gi);
>  	composite_dev_cleanup(cdev);
>  	usb_ep_autoconfig_reset(cdev->gadget);
> +	spin_lock_irqsave(&gi->spinlock, flags);
>  	cdev->gadget =3D NULL;
>  	set_gadget_data(gadget, NULL);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +}
> +
> +static int configfs_composite_setup(struct usb_gadget *gadget,
> +		const struct usb_ctrlrequest *ctrl)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +	int ret;
> +
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev)
> +		return 0;
> +
> +	gi =3D container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return 0;
> +	}
> +
> +	ret =3D composite_setup(gadget, ctrl);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +	return ret;
> +}
> +
> +static void configfs_composite_disconnect(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev)
> +		return;
> +
> +	gi =3D container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return;
> +	}
> +
> +	composite_disconnect(gadget);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +}
> +
> +static void configfs_composite_suspend(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev)
> +		return;
> +
> +	gi =3D container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return;
> +	}
> +
> +	composite_suspend(gadget);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +}
> +
> +static void configfs_composite_resume(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev)
> +		return;
> +
> +	gi =3D container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev =3D get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return;
> +	}
> +
> +	composite_resume(gadget);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
>  }
> =20
>  static const struct usb_gadget_driver configfs_driver_template =3D {
>  	.bind           =3D configfs_composite_bind,
>  	.unbind         =3D configfs_composite_unbind,
> =20
> -	.setup          =3D composite_setup,
> -	.reset          =3D composite_disconnect,
> -	.disconnect     =3D composite_disconnect,
> +	.setup          =3D configfs_composite_setup,
> +	.reset          =3D configfs_composite_disconnect,
> +	.disconnect     =3D configfs_composite_disconnect,
> =20
> -	.suspend	=3D composite_suspend,
> -	.resume		=3D composite_resume,
> +	.suspend	=3D configfs_composite_suspend,
> +	.resume		=3D configfs_composite_resume,
> =20
>  	.max_speed	=3D USB_SPEED_SUPER,
>  	.driver =3D {
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
