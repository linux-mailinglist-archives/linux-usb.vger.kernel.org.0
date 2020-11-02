Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7952A2765
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 10:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgKBJuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 04:50:09 -0500
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:31150
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727992AbgKBJuJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 04:50:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH7MDAADYNd5ddf91V8eCVivIfTPLCrXf5QxRsyiCvMY/0RSGvJVk/lIbb/FWJl1y48zDJ2hRfDMKNJglORwKa5RH8QmqHJgVlj6fPMkRcmsAxlj/N3gI8rFJ+wtfq0FDbDNpvT5WDNLWN6G3iYZlQCe2kPPrSpIrwYjbS71CE3c6ZXVpPFX+T6W78xyAiu9FFQk3tKB+KWzR9gw0ooqJ8WYVRVZ0h82kCM1+ir//rrcrvpge8+NSQrE7vAtWxhg9GpIXtr7b4yhkc5SZO/EwPXuO2VbGcMFfq4Ky3M7AdNdfVGmg7HcidshBHj3BKo7WCttWp/cgMWYAF5mf1IXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvAFuIFj4b1ln6qJT5CZjQVPY0F9P2ibE0j2Axb7vas=;
 b=ZjxBLJq/3bd9FePOjlaNpvgZBU4YjqVp1rv+kKNbsW5HwIVMpE8P0zLTCeYNeXklB4enwmwGRXoclYZIy6762akvSphVnwCwld3tiHKC/GQa3YKoxiUVjcdBXTckhHlHpyXv8XyFBQQCBMutiENY+x4szvj9yebz8BOy52GVUkrO6/zWz98EQPcRlHBVh5AHW6dRVIxMbc3Kra7F+P4O74gCcAPhmlcEtaDa9dC6jJYW/Zer2gDnOJjsxB0DUswvyulNxFDZin78jmrdK5Om5GMIjRfxHDqBnyj9rbXgb096t95tEFQnV0rSvc2OeUl8WdN1mgV20mNCGF95MX4XvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvAFuIFj4b1ln6qJT5CZjQVPY0F9P2ibE0j2Axb7vas=;
 b=TmgXnzm0y6Rk/obWE71jBW59Xm3XqsjGO8YvmKofi5MXoi5M4ERp8m4EolsY666RkN5UjljBs3OTsmHZHZYSyL9Go+UXTnBIMCLuyh9EWARk0jvD5zwKIwcWGjGOy510YE065NgTx0v541uGLUJ63b9TdzHvgEbumTeKrnchvAg=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4004.eurprd04.prod.outlook.com (2603:10a6:208:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 09:50:05 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:50:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: strange call stack when running uvc-gadget application
Thread-Topic: strange call stack when running uvc-gadget application
Thread-Index: AQHWsP2KqDDTmfpLkEq9OY9yxv5Few==
Date:   Mon, 2 Nov 2020 09:50:05 +0000
Message-ID: <20201102094936.GA29581@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4c8ca668-75d2-42d8-5576-08d87f14ad2b
x-ms-traffictypediagnostic: AM0PR04MB4004:
x-microsoft-antispam-prvs: <AM0PR04MB40040CDFC0BE83D0BB4CD4668B100@AM0PR04MB4004.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q1AFJBTqDT80hgYh/mahI9BBxCJEYZVYJ/+CXQSuhvW266NSjhKxT0lJ9jd2RcMw6qHfEvgU1loukv6pwopkJBYOTAAKESxU7hgWCB/5uz2FTOkwe6Vqp9C9pgf50nD+nzxHPjnq/Mh4umpiyxmU7GGwembseEryAFSsR1j3ISsX4TmD1oCEgQt0WIot3Y3jlao6z7lqKHp+N1jvBfbX1zUb48uCG7c/uB6UgtsV5VUOskDMaBtcRIHX6LC0WT7zwOAdAcXY2hvH1yb3it/AUaDVXx1pi+JpBkhCfaSzAHHhz5WPsLBXlZi5pnZjbWTf5X0P+4cxKU5MVNaKuFtiEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(186003)(478600001)(6916009)(8676002)(5660300002)(1076003)(2906002)(33716001)(6506007)(316002)(86362001)(33656002)(8936002)(6512007)(9686003)(91956017)(6486002)(4326008)(66446008)(26005)(64756008)(66556008)(66476007)(44832011)(66946007)(76116006)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: eJjGg8XvbnmmjdYgYXc1+WKmVXSOKNvz1mfy9XNW1VVpef7wruDUlZ5dTehVH+7b4C8ETsjvUXyV93t4v5vof49Nz+AmMELy5n1NzQgy/5zd4o8yGl7Ot9eOxKB2FPaNd5qB4cuzyRqoHtUbswWGpgBFAhWNy5qnhYRj2PDcc/9Idu/1ko23NehF50zQ176Td/RriF3L4l709jmuuXD+zWHY/hebWNJK2W8l8vYvLxQJyivY1rCbtPm/1GhND0h7N3GaiieFOlfw23mfp0OtybsdzLf6VCYPTT+xGvtQK8nOY0wDEJWXycSA8bQqmiTjXZGwFyLAKyHk/nQbMkNP9XkWsEGU64aLYV7P2VrpqrBRck6A8e+z1xZ1t7buOzq24lqyzdA36MIhvWBJVRqDLkLwM1/aLw2Rnoqw/xoDa07JKpenutNOEB5G7DjEVj5I3Lii/vR1xIqakNscLIxNiu4EbYu0FpbNEsMVCDjEXekd9c68Mz0riAGKBP1P9co3+vF1NgdIepnOpfDndAh5atG0oalhlvEonxr7dIv1DkLJZbUy6mx5A5WK2tObdvhbl9EMCFFnVrgEDgwgUZFZ0fI+YmsTuOTe9qS4bmMX42S6067eGCOMSH5Oko5lyL8eHG4mxBuOMzKrCATbIWWyNA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BD0130E0ABA7742B0885F1C9B040A55@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8ca668-75d2-42d8-5576-08d87f14ad2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 09:50:05.2743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obPrUpjJQJ9LISMvj+4RGU7CkHyhyPP71ewlSes7Nc0R0biaYhXZ4fJo+ymi8ZPaKAkBtH2MRP9CDRAHdIAwBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4004
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

When running run uvc-gadget application at HS using dwc3 gadget at Linux
v5.10-rc1, the video stream will be stopped after 1-2 minutes running. The
trace log like below, I wonder how _raw_spin_lock_irqsave calls __switch_to=
?
Any hints? Thanks.

usb_test# [ 4757.322728] configfs-gadget gadget: uvc: VS request completed =
with status -18.
[ 4757.329971] configfs-gadget gadget: uvc: VS request completed with statu=
s -18.
UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBUF

usb_test# [ 4812.376465] check_interval: 37 callbacks suppressed
[ 4825.307665] configfs-gadget gadget: uvc: VS request completed with statu=
s -18.
[ 4825.314912] configfs-gadget gadget: uvc: VS request completed with statu=
s -18.
UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBUF
[ 4826.231392] check_interval: 3 callbacks suppressed
select timeout
[ 4827.336088] dwc3 38100000.dwc3: request 0000000080ebefd3 was not queued =
to ep2in
[ 4827.343547] dwc3 38100000.dwc3: request 00000000b578605c was not queued =
to ep2in
[ 4827.350989] dwc3 38100000.dwc3: request 00000000c6d191cd was not queued =
to ep2in
[ 4827.358422] dwc3 38100000.dwc3: request 0000000085205409 was not queued =
to ep2in
UVC: Stopping video stream.

[ 4848.381718] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[ 4848.387824] rcu:     3-...0: (1 GPs behind) idle=3D162/1/0x4000000000000=
000 softirq=3D10819/10819 fqs=3D2356
[ 4848.396956]  (detected by 2, t=3D5252 jiffies, g=3D20129, q=3D3770)
[ 4848.396959] Task dump for CPU 3:
[ 4848.405925] task:uvc-gadget_wlhe state:R  running task     stack:    0 p=
id:  674 ppid:   636 flags:0x00000202
[ 4848.415842] Call trace:
[ 4848.418294]  __switch_to+0xc0/0x170
[ 4848.421785]  _raw_spin_lock_irqsave+0x84/0xb0
[ 4848.426143]  composite_disconnect+0x28/0x78
[ 4848.430327]  configfs_composite_disconnect+0x68/0x70
[ 4848.435290]  usb_gadget_disconnect+0x10c/0x128
[ 4848.439733]  usb_gadget_deactivate+0xd4/0x108
[ 4848.444089]  usb_function_deactivate+0x6c/0x80
[ 4848.448534]  uvc_function_disconnect+0x20/0x58
[ 4848.452976]  uvc_v4l2_release+0x30/0x88
[ 4848.456812]  v4l2_release+0xbc/0xf0
[ 4848.460301]  __fput+0x7c/0x230
[ 4848.463353]  ____fput+0x14/0x20
[ 4848.466495]  task_work_run+0x88/0x140
[ 4848.470157]  do_notify_resume+0x240/0x6f0
[ 4848.474166]  work_pending+0x8/0x200

--=20

Thanks,
Peter Chen=
