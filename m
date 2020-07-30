Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3655C232A1C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 04:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgG3Ch6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 22:37:58 -0400
Received: from mail-eopbgr10045.outbound.protection.outlook.com ([40.107.1.45]:44818
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726319AbgG3Ch6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 22:37:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrYRNVVKHvYlYW/cx3ZmFY9mYSQsh8etdvWdUdaecwccsDFzMNH9aG3pOGGawBfNjXghZENPjFfbGApXmMR6vUi0azZpgSSxkcz1bgw3X2s9eiJUgf+J0YhjqixM8iD6kp6kKZ72W/p8W9ZNgBZyr8LqOa4w5VjRm0cBUF8APgm3ZHxFw93Rmy8emEtvZLnJ1n9jFjuqxhddG0ZN9aAwNBfSdyaEycY+ohSXzXeFBRulMS4E3uDk/kJ2Hr4FN8qti8zuyyq0XNGEmFwNvFWNazb/z4h7WgaLMMleQ3256UXq7yb5VMlPzrM6MaL8L4A8HPCpwtvg2Db6qTD5jQ7zlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9oqU02HClnupfOLD3H7tlsi+t8DWLSf4AG5cJtilA4=;
 b=ZzGcrK/B6ZMftaMI2QMBlcqra94AJV4GH00MNlkTIB5FHGGPH0GReaGF4IPiujd52bkEkQN0+LpnBBJLQ/HjHg/1vSViIlc0aDTb72eAybjMEg4wn8ele8+piIipT+zBfUTOVfE3RbVvqwHkXulMR0h2pbS3oz2j2W/dyS1gAZjLuoEw4JzEuEs3sQjRbwb0PQl3YkpqBfjwRIwCiU1Gntg662XE5BFeFSKmCCL3rKwt/0urQxreDZkGcvlb08qTrGhsqUmtMq/kRSjXQm5mz1gaDyJv2il9ILdd5bfCLnUMFAiUUWARHfVLpV16Lx6DGUUKznrmO7E4FTRP4DCUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9oqU02HClnupfOLD3H7tlsi+t8DWLSf4AG5cJtilA4=;
 b=qibi/P2BM5zfdbxoKuTcUCBthUiHxKc4qY8W8ASf94sKxUZnprkPKRBNkY3E9Ljn/RRcgQf1AByJ331fqQWBhOrNlPfJpT8i8KF/gEZV43yb0QeRfr8m2oJRJxQ1KZcJtoCwZdvp/cTDwJ39YVQcdCiZGyauGfAbcTD2yZxiNRg=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB4220.eurprd04.prod.outlook.com (2603:10a6:5:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 02:37:53 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 02:37:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Roger Quadros <rogerq@ti.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Adding and removing the same gadget multiple times
Thread-Topic: Adding and removing the same gadget multiple times
Thread-Index: AQHWZRXhj4iPy9KaNEi9pYKiQdMqyKkdyhwAgADQ8wCAAM+AAA==
Date:   Thu, 30 Jul 2020 02:37:53 +0000
Message-ID: <20200730023728.GB26224@b29397-desktop>
References: <20200728193246.GD1507946@rowland.harvard.edu>
 <20200729014656.GA17475@b29397-desktop>
 <20200729141448.GB1530967@rowland.harvard.edu>
In-Reply-To: <20200729141448.GB1530967@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3bfb876-06e4-492d-6549-08d834318f54
x-ms-traffictypediagnostic: DB7PR04MB4220:
x-microsoft-antispam-prvs: <DB7PR04MB42207220E5FC53921CE465178B710@DB7PR04MB4220.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d+4v+hA9M3x8w449wsnRlqeNa3zxlXv6+KcpYGnCBlBX2KqMwIyy66U5/wAZd5WMrOkuYLPUN/t1ENWYaHMDHevc1zCWhajii4argFOkQU8WpTUEdToxZSdQlRV1R7NzPntoZeSEXUpf29ZlqSkhgyjsZ52pnWT7RvjCJO08OxOu26EljScwCLdu9zsQA6o7qfByz5InoCDVF4hXU6+U2u9vi3FlLnZiLCz75DElIPiXAO7LpNwNwiRbKIijR/juAeVnZWM9qenSTJmpr10h4e9UbFO6uKAt9vQI7+pkBG9lzcs+PzmEs1Ffvr7A8Xf0I2GhCL2sWPUI/altv0m9pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(44832011)(33716001)(54906003)(66556008)(8936002)(4326008)(83380400001)(64756008)(53546011)(186003)(91956017)(6486002)(66446008)(66946007)(76116006)(478600001)(6506007)(66476007)(5660300002)(33656002)(86362001)(6512007)(2906002)(6916009)(8676002)(1076003)(316002)(71200400001)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ssHCRT2olpS3lDIPSt2Vbfn5wJKvToxjJOw+tUtfVi6ig7qsOZUtg5O0dhspF6pFM1hqiMjK/msbFF450/bE5XilPTcP+2hNqPANJuJgxVAgHnwYVVdoVbOFWG02kw4lYpiRHjjID1DBY72aNLO4u8nAaP+h8r4YVNuN7IFH5F0Um05ya0zdUqe9/pyZyeGfq4VVhT3rht1qIACmrROXmZA9LVYmi1mdHvPalbHvEUjO/ULLBbS5mR0wzfF9fjfhbgu8rzUeTJ8c3vVM4zmq4a7MwfpAKEeteu1TcZwUCAlbR8bTyF9OyBg1u0RL6Yde0HsMHp4gtf8qqbkZcmdUP8PNhTQg+zmf6Wl6DGAWXdT7twUgZv39Qw7veJsdAP8M8puUp2A0phCsX4/Cf46cI3SizDvM/WspKP2GhuMwbjc6X5pdokOlfPwaEAswtozUP5G0h3fHcQGRK3iJrB9nCM+48zBRIiCZyysfmYud/Sw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86C7344507169342B466E70FA885BB44@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bfb876-06e4-492d-6549-08d834318f54
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 02:37:53.4554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7dYajIQoJEmsuFpjR8ABXaAvF6RU09C9KKzAtRGDt6Z4szGsPQhckX83dwmpOMtOQ48touSPdPMTUK9v1TX4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4220
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-29 10:14:48, Alan Stern wrote:
> On Wed, Jul 29, 2020 at 01:47:20AM +0000, Peter Chen wrote:
> > On 20-07-28 15:32:46, Alan Stern wrote:
> > > Roger:
> > >=20
> > > Your commit fac323471df6 ("usb: udc: allow adding and removing the sa=
me=20
> > > gadget device") from a few years ago just caught my eye.  (I don't=20
> > > recall whether I noticed it at the time.)
> > >=20
> > > In any case, we need to talk about it.  What you're doing --=20
> > > unregistering and re-registering the struct device embedded in the=20
> > > gadget structure -- is strictly forbidden by the kernel's device mode=
l.=20
> > > It's even mentioned specifically in the kerneldoc for device_add().
> > >=20
> > > Now, I guess doing this would be okay _if_ you took care not to=20
> > > re-register the device until all references to the previous incarnati=
on=20
> > > have been dropped.  In particular, setting the structure's memory to =
0=20
> > > should not be done immediately after calling device_unregister() --=20
> > > which is what the commit does -- but rather in the release routine.
> > >=20
> > > Do you know which UDC drivers actually do re-register their gadgets? =
 In=20
> > > particular, do they have their own release routines or do they rely o=
n=20
> > > the default usb_udc_nop_release() provided by the UDC core?
> >=20
> > dwc3 and cdns3 gadget driver do that, they use default usb_udc_nop_rele=
ase()
> > provided by the UDC core. The usb_add_gadget_udc is called when the
> > controller role switch to device mode (the host VBUS is seen at device
> > side), and usb_del_gadget_udc is called when the cable is disconnected
> > from host.
>=20
> What if the role switches back to host without the cable being
> disconnected?

This kinds of role switch is through the sys entry directly, without
considering hardware signal. Taking cdns3 as an example for this use
case, usb_del_gadget_udc will be called for stopping device mode, and
create xhci platform device for starting host.

--=20

Thanks,
Peter Chen=
