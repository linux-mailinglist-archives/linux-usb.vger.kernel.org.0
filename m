Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370E324C9A3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 03:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHUBrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 21:47:05 -0400
Received: from mail-eopbgr70055.outbound.protection.outlook.com ([40.107.7.55]:59454
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726957AbgHUBrD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 21:47:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT3pISgzJpEFcn6I+M5G0Oq751HMiyDq3IE22xtKZm3cbnFVM8FyhlNIRcPYbifMLm8VYzEJQvwIINgle1Fu/lNLJStTGjhB7fP4G0ZmZ706u3EjkmhzcJScYXnOiXitVJ/i0qOqinTAZA76u07+8cpnXid+9WEEJ5ddEVB7+cU1dAxFvr16qGFSUVCuzbMYdECxYloP5+cu7QeahJt3NmR0sA2EZ71pqT22O63+NFLSd6q8J8ap+GO2pwFWyNW4ucDbLPdfNNacNJlUTwkk58etZGR1at6uTP5hMYoH4S/K5MzeUe5AGf9ihLy5auyeYsb8qWKhP7lUvqAT1dPbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WutHjTQcVyqZxcCAonODRW6VAWGuoYRnhS99WBCQ7jw=;
 b=VBsiJZfaizS5tsOqo4GefAjFNSuH9biXM3mcgRaD8PlphuzwABBIIGZxb9VQv752M1y83Nbn1b+RBZlEYyI6aUwedaobburk+mPFekQhnZxEK9ZRDJ75vuuLAVcgPJgbib81cj62crf58XN7AxK2x1k9dbz+gCqDL1GUVMdMlDIbyGWC9SW7WLpDGQEilGhfVeCGgjtQzAkL8vMumyr6oddeJRRb0xGVQH8QQrFMDpFyuKrj3/Bqe+SRN36TzDlD7OVQXZt5y/sZLMuAhTY3LUVDnCdGI5UQBW/893TXfkxSbs5BOkdeWaGj+TMgys6FAWAR8CC/vsOZKjhmzYjZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WutHjTQcVyqZxcCAonODRW6VAWGuoYRnhS99WBCQ7jw=;
 b=eGKVSb/1cu73EFoIMSi/kE3G7vLTxc8MIhpHxLQXzlAK2d/4MISM5CH3sWyEV0MbDhS3XZkEM0DwmiSmk4LYKzlwziUoKH9P6X7bf+hPojnDqjLlhAmR/4GhCbr8j5GvDchLmaolHyRGKlQaEfedqJACRu5GyvEt/Mh5Y7j86XQ=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6191.eurprd04.prod.outlook.com (2603:10a6:803:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 01:46:59 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 01:46:59 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jun Li <jun.li@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Topic: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Index: AQHWYAdu6x48Q9+2vUaX8tnghdnJZqlB+bkw
Date:   Fri, 21 Aug 2020 01:46:58 +0000
Message-ID: <VE1PR04MB6528080BF8A6AB54F3F09D90895B0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a4ab3937-0c83-434a-ce72-08d8457417d5
x-ms-traffictypediagnostic: VI1PR04MB6191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6191A3AFC3D9BCBA4B4410BB895B0@VI1PR04MB6191.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmYfzDEv795/oQ/1rlq3eYJieKaEABeHBsZ455b7uYxR1JotQ0jC0ZcgP//xm2CAGF50efavLV1eyGhOhYxYLWzE18WFYBA0MKSc+mrBquHj/NiUC1YRMVEkfGVZptRIAjuxQNbkST2mzE11AxVP+Hxqm/haKkrsg3K5baZoSndLqLu1KEUfBrVISitnj8QVZzAx797t2ZglPzLKuuvEnV1lJNgydnPaq+RL7hxcrOrvRKSKoRH6h/GKHTT1njULKzCiyCWeIe+ClfgLZOnb+d4NoTU0pGQoo0Y5r/y0vcaYr3uxXY0X2yB0CCkeXQlP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8936002)(52536014)(54906003)(9686003)(110136005)(2906002)(186003)(7696005)(71200400001)(44832011)(33656002)(45080400002)(4326008)(26005)(316002)(478600001)(66476007)(8676002)(53546011)(83380400001)(76116006)(64756008)(55016002)(5660300002)(66446008)(66556008)(6506007)(66946007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: vpzb55X9XgId+Fn7tq5/uSmEDwMfRZ/wYICnk1uX3DxdvkyyLH0m2nsdpJ8TuTZUutlEb2le7XUpe8iRnCb+fZH2nyGr+LAgU8Mpxk3v5jno2AkpNOoyfgU/wsRw2frP1LB84HQ4VG4LbqlRl539diZiSiWli04em+y7yIjCcmJ17vY9ZaTjgXdEU9TtiDEC+rPA6tfRk9SP58WRBM7EO2SGRnv0An1WLf/cP4PWELkwFo93iq7EjhfQGe4E/UdNWLwDbBjbmYqptAZetESb+WjshFRiajmQAI0t7JaCcL4Nd7WzXFMNq1EreV8GcN0yOepYGVpj9aYpJBUCHwFoDaQMRkxWxPiRYZ1QBvWUSyNSKlp2k2aJUZPpsA/+OQXojHECzYovGCaZ+BC4ZVfEpg/PvubfBihzjBMOc5/sD/1E5RatRiFbMJzs6DZBOwpWjWl23d5itx8Ja4Sk6SqRxeSYWJsBMr28WJzaRQKZaN3pDliTarSQQUEjiODlYBJa+YVzIaLQAcaDiIxtSu612jQ9E3ARe7h0bByp9qWGoJe81HIlq1FjlRhpQzKP7kZvh7lUzKOCR1LcZt+VE1BDMLEocdf41Vl3m5ryKOYXuTuCS79cIDnLWBB4eMwVU/+Gx7Mzz1KS8BjQ2U4SgNbs0Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ab3937-0c83-434a-ce72-08d8457417d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 01:46:58.9846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pjb7AwcEgtyBXYO4xcax8f6xPemA5lOIxD5B8ee3asLzZQmGDShNBx88al2auCtv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6191
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi
> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Wednesday, July 22, 2020 5:07 PM
> To: balbi@kernel.org
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org
> Subject: [PATCH] usb: dwc3: debugfs: do not queue work if try to change m=
ode on
> non-drd
>=20
> Do not try to queue a drd work for change mode if the port is not a drd, =
this is
> to avoid below kernel dump:
> [   60.115529] ------------[ cut here ]------------
> [   60.120166] WARNING: CPU: 1 PID: 627 at kernel/workqueue.c:1473
> __queue_work+0x46c/0x520
> [   60.128254] Modules linked in:
> [   60.131313] CPU: 1 PID: 627 Comm: sh Not tainted
> 5.7.0-rc4-00022-g914a586-dirty #135
> [   60.139054] Hardware name: NXP i.MX8MQ EVK (DT)
> [   60.143585] pstate: a0000085 (NzCv daIf -PAN -UAO)
> [   60.148376] pc : __queue_work+0x46c/0x520
> [   60.152385] lr : __queue_work+0x314/0x520
> [   60.156393] sp : ffff8000124ebc40
> [   60.159705] x29: ffff8000124ebc40 x28: ffff800011808018
> [   60.165018] x27: ffff800011819ef8 x26: ffff800011d39980
> [   60.170331] x25: ffff800011808018 x24: 0000000000000100
> [   60.175643] x23: 0000000000000013 x22: 0000000000000001
> [   60.180955] x21: ffff0000b7c08e00 x20: ffff0000b6c31080
> [   60.186267] x19: ffff0000bb99bc00 x18: 0000000000000000
> [   60.191579] x17: 0000000000000000 x16: 0000000000000000
> [   60.196891] x15: 0000000000000000 x14: 0000000000000000
> [   60.202202] x13: 0000000000000000 x12: 0000000000000000
> [   60.207515] x11: 0000000000000000 x10: 0000000000000040
> [   60.212827] x9 : ffff800011d55460 x8 : ffff800011d55458
> [   60.218138] x7 : ffff0000b7800028 x6 : 0000000000000000
> [   60.223450] x5 : ffff0000b7800000 x4 : 0000000000000000
> [   60.228762] x3 : ffff0000bb997cc0 x2 : 0000000000000001
> [   60.234074] x1 : 0000000000000000 x0 : ffff0000b6c31088
> [   60.239386] Call trace:
> [   60.241834]  __queue_work+0x46c/0x520
> [   60.245496]  queue_work_on+0x6c/0x90
> [   60.249075]  dwc3_set_mode+0x48/0x58
> [   60.252651]  dwc3_mode_write+0xf8/0x150
> [   60.256489]  full_proxy_write+0x5c/0xa8
> [   60.260327]  __vfs_write+0x18/0x40
> [   60.263729]  vfs_write+0xdc/0x1c8
> [   60.267045]  ksys_write+0x68/0xf0
> [   60.270360]  __arm64_sys_write+0x18/0x20
> [   60.274286]  el0_svc_common.constprop.0+0x68/0x160
> [   60.279077]  do_el0_svc+0x20/0x80
> [   60.282394]  el0_sync_handler+0x10c/0x178
> [   60.286403]  el0_sync+0x140/0x180
> [   60.289716] ---[ end trace 70b155582e2b7988 ]---
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/dwc3/debugfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c inde=
x
> 6d9de33..99e7f53 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -428,6 +428,9 @@ static ssize_t dwc3_mode_write(struct file *file,
>  	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>  		return -EFAULT;
>=20
> +	if (dwc->dr_mode !=3D USB_DR_MODE_OTG)
> +		return count;
> +
>  	if (!strncmp(buf, "host", 4))
>  		mode =3D DWC3_GCTL_PRTCAP_HOST;
>=20
> --
> 2.7.4

A gentle ping...

Li Jun
