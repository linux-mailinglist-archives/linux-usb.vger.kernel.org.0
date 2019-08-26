Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA31D9CCD8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 11:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbfHZJva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 05:51:30 -0400
Received: from mail-eopbgr30063.outbound.protection.outlook.com ([40.107.3.63]:55214
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726616AbfHZJva (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 05:51:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdEOqw90Z7y+UJfpGsyzy8S++5jnoPqva6hK6UW7w8J1/6V+D5tcHgDge5WbYxlTTzM5oaemjQ5wSww7r+9fg6vXcPLcenlPhuuEyaOG8U80cNhS0o1i9e3R1DBJU+wejNJtZJvMddnQg7BT1BAgIEeMMEn2RrRQiI+J/1v9vaRTg5AzZX7V+FowpcpM6fgyWOZCMtr1AKxTOazDaqpwrimyAtFK/5jMilByiHDIjQazfPNsAr3MCfaxkd7stoYe3DWmWxTous6dQ1SSRGoJ8T+LwLQPiWtMVfAsjH3iYZ/OmiuO+/IzlVbOfopgvUo/a+QzfP9VoihUeBWTWjDNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M7uUUoLeN8toY+mGUJDjucBSv9VscYR+iDVpsBhTas=;
 b=lFfqQW+kQREpf38R41vk6eMozqZPry7Q6GeaXJzkNjsd9yFTqo0BSDHLgIFxvePDXWX5j5K6jGkYWaE9tcEYxc1HnwMJel/otZD0FJwPjncGtFtJaRtnkiE5C78oGnFX20q0vcMy0xNkyCyKBIgwE5GvhBs8Nvin1V4jCEddvqNaEKGdOMAnKv+sOvHwv9n80jzSZpYe4zQJgh7LYIuuAx2Y0TTEqsIR3bKI799r6azX1vWEWm8BH61FiipM0QzZqt+81QQ9aQpSsoyLtG+Y0nBiagMMxE+JHQlkObDeC430w4Glbg/qlcg/9RY8cCzrTw05/YLt+HecKHqTxLcn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M7uUUoLeN8toY+mGUJDjucBSv9VscYR+iDVpsBhTas=;
 b=YPa8h/9BhEq5M3h08pLqbK8ybad8E/JqnA5ylXrYIi/F7K8QjkiPAGu4NLrW4tQDMafp2h++3EUZt6TgpjMEZKZJpQVWUADQd4Nx4f9sHJhZCzABJ451Yrm4YWy9vUID5lRwb6zNT6ok6S3dPOgHOWXghd983GHbRI1LI7dRdWY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6000.eurprd04.prod.outlook.com (20.178.123.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 09:51:23 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 09:51:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: NULL pointer issue due to .pullup timeout at dwc3
Thread-Topic: NULL pointer issue due to .pullup timeout at dwc3
Thread-Index: AdVb8eJSVZMUahJuRLegunLmKmF7Ew==
Date:   Mon, 26 Aug 2019 09:51:23 +0000
Message-ID: <VI1PR04MB5327779C65037389EB8400148BA10@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b73b162-e0fb-4629-a007-08d72a0af4a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB6000;
x-ms-traffictypediagnostic: VI1PR04MB6000:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6000FE328560BECE1ABD42C98BA10@VI1PR04MB6000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(199004)(189003)(478600001)(45080400002)(2906002)(14454004)(44832011)(2501003)(7736002)(66066001)(86362001)(476003)(486006)(99286004)(7696005)(74316002)(6116002)(305945005)(3846002)(33656002)(186003)(26005)(316002)(6506007)(102836004)(6916009)(54906003)(25786009)(71190400001)(71200400001)(66446008)(81156014)(76116006)(66946007)(256004)(14444005)(66556008)(66476007)(64756008)(81166006)(5640700003)(8676002)(55016002)(5660300002)(9686003)(1730700003)(53936002)(4326008)(52536014)(2351001)(8936002)(6436002)(142923001)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6000;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zUmWCyb8Xd8kwPX6SvFh2FKCNQ4yAKAcGI379fqraLcrSVOZl9tSNLi6hHdoFWyLW08jw7lC7yqfeuFm/RZItwWsln0SNtzeeT8r5DNbC/KyLh5FJNE3wFZI4Z4zlvbkd7lSxwFjGJ4sEKPuy2OOgcFSPsHGgEM5d/WDOIMRZRtZjCz3sA0jayPl/425MBq7qVkXGDHTJw/ZIanLJe07+0kSexGkNX72fWW277h1Ttv8bM5r12d0fy2mzlWZWdPGFhF0A3bLTfxTAQBVmw4ySskuxtuKMhAP1dkTM2oXl/Y3tZnwxlS60eGQh4bbc+Q38mH/i/I8bXy+uyhgcxNGz+QLMdn8d2bhn00Btvv7XNcTazBxtiFr6FYszfJKjVQYvWeX2spqkLAonPlq43be8kL0FjS4IFoGY3Zswzab9w0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b73b162-e0fb-4629-a007-08d72a0af4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 09:51:23.7710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxgAHIO5dwPXeZGZhIk7xYq/8d+DSN4rQHoVuc9LeglmxOiZMPh4zGRvqmZ9d/A59GbM3wfDxAhPzJ6LJsL16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6000
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Balbi,

When do configfs function add and remove stress test, I find dwc3 gadget .p=
ullup will
timeout if there is a request on the way. Even I enlarge the delay, there i=
s still
timeout for .pullup.

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f13bef950951..e95955b6a225 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1827,6 +1827,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int=
 is_on, int suspend)
        do {
                reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
                reg &=3D DWC3_DSTS_DEVCTRLHLT;
+               udelay(1);
        } while (--timeout && !(!is_on ^ !reg));
=20
        if (!timeout)
@@ -1861,6 +1862,8 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, i=
nt is_on)
        spin_lock_irqsave(&dwc->lock, flags);
        ret =3D dwc3_gadget_run_stop(dwc, is_on, false);
        spin_unlock_irqrestore(&dwc->lock, flags);
+       if (ret)
+               dev_err(dwc->dev, "%s:ret =3D %d\n", __func__, ret);
=20
        return ret;
 }

This timeout causes the NULL pointer issue for ethernet gadget, eg. NCM, th=
e reason
is ncm->notify_req is NULL, but the ncm_notify_complete is not called befor=
e .unbind is
called. See below oops:

using random self ethernet address
using random host ethernet address
udc 38100000.usb: registering UDC driver [g1]
configfs-gadget gadget: adding 'cdc_network'/000000001a44bfe6 to config 'c'=
/000000008bd6a9b3
usb0: HOST MAC 12:a5:cf:42:92:fd
usb0: MAC 5e:bc:ca:27:92:b1
configfs-gadget gadget: CDC Network: super speed IN/ep1in OUT/ep1out NOTIFY=
/ep2in
configfs-gadget gadget: resume
configfs-gadget gadget: high-speed config #1: c
configfs-gadget gadget: reset ncm control 0
configfs-gadget gadget: init ncm ctrl 0
configfs-gadget gadget: notify speed 425984000
configfs-gadget 38100000.usb: unregistering UDC driver [g1]
dwc3 38100000.usb: dwc3_gadget_pullup:ret =3D -110
configfs-gadget gadget: unbind function 'cdc_network'/000000001a44bfe6
configfs-gadget gadget: ncm unbind
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
000000000
Mem abort info:
  ESR =3D 0x96000006
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
Data abort info:
  ISV =3D 0, ISS =3D 0x00000006
  CM =3D 0, WnR =3D 0
user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000000f29ca000
[0000000000000000] pgd=3D00000000f4ee8003, pud=3D00000000f4eec003, pmd=3D00=
00000000000000
Internal error: Oops: 96000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 3 PID: 673 Comm: sh Not tainted 5.3.0-rc3-next-20190809-01677-g1fb6524=
44ffb-dirty #89
Hardware name: NXP i.MX8MQ EVK (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO)
pc : ncm_unbind+0x48/0x90
lr : ncm_unbind+0x44/0x90
sp : ffff00001280bbd0
x29: ffff00001280bbd0 x28: ffff8000b289aa00=20
x27: ffff8000b4f0e4b8 x26: ffff8000b4f0e520=20
x25: ffff8000b4dc9c98 x24: ffff00001169ade8=20
x23: ffff00001229ba28 x22: ffff8000b4dc9800=20
x21: ffff8000b4f0e600 x20: ffff8000b4f0e520=20
x19: ffff800001d2be00 x18: 0000000000000030=20
x17: 0000000000000000 x16: 0000000000000000=20
x15: ffffffffffffffff x14: ffff000011ff98c8=20
x13: 0000000000000000 x12: ffff0000122db000=20
x11: ffff000012018000 x10: ffff0000122db5b8=20
x9 : 0000000000000000 x8 : 0000000000000007=20
x7 : 00000000000001eb x6 : ffff0000122db000=20
x5 : ffff000010bc2100 x4 : ffff7e0002dd52a0=20
x3 : 0000000080100008 x2 : ffff8000b754ae00=20
x1 : 6621d6314c7f8200 x0 : 0000000000000000=20
Call trace:
 ncm_unbind+0x48/0x90
 purge_configs_funcs+0xa4/0x138
 configfs_composite_unbind+0x60/0xa0
 usb_gadget_remove_driver+0x40/0xa0
 usb_gadget_unregister_driver+0xc4/0xf8
 unregister_gadget+0x28/0x58
 gadget_dev_desc_UDC_store+0xa0/0x100
 configfs_write_file+0xe8/0x180
 __vfs_write+0x48/0x90
 vfs_write+0xb8/0x1c0
 ksys_write+0x74/0xf8
 __arm64_sys_write+0x24/0x30
 el0_svc_common.constprop.0+0x94/0x158
 el0_svc_handler+0x34/0x90
 el0_svc+0x8/0xc
Code: aa1303e0 392c203f 97ff8732 f940a260 (f9400000)=20

It is very easy to reproduce it, just create ncm function,
and sleep 1 second, then, remove it.

I am not sure if it is the common issue for dwc3, there is no such
requirement for chipidea and cadence3. Would you please have a check?
Thanks.

Best regards,
Peter Chen
