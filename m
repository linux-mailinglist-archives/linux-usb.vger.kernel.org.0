Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CEA2AEAB3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 08:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgKKH7j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 02:59:39 -0500
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:47841
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725916AbgKKH7i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 02:59:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlCOygZDvFLjZL94YbsSVJeQfxOiw2LZ14oYqnVTBriZbi61Vj9fQSJjx5YLwuuf3XE6O9fSzayMqYAHlsK5aPXYnwRRqW4n7Z7Q/Oo0X3aIUv8fkqQhwIciRsxFik22DsRZKTrF1avjWAor6VU1HLgLLNzQd5Mmwv5WXKMWFm7YXDuimprvp68+fJt+m2w2ZE45vL4fUcAsh2b6Q/Xy6b5phu5xY0Z9m3i/V4PE3dGpDUJWJSOlRgDjizidnSynrXRFHgKIkPBZJ6ik7tuNEaXudEucM4mh0U5uvdX8byyzKtFo0jJMQ0QWTT6OGiqAyHvEN+bx92xdORYP5A49/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dThueIcu5VwntL8WKJqXQs81wzZiKnLbSYYw53rwng=;
 b=TU2Du2kI+/kfl05O4oWvkbba6Xs5HzTwB+OKLykGnGhjg1tBGASs7L6dM/GwmpmnJU3nynhlfU+jBe1GC6qluhJzwevqmCiG+rZC16TtaxsLVMCF6q84ckFfvc/oACDYoKlXF4s25iYixdq4k/yo2FYlLLiD0WxxZeI4hsdDzQVp0+vMsFCxnvR5ugabFVvzkm+zarRYpmsKP79oK82Mb7PmQ6gizJMiGiwagBDkfoWUsgkSw6eUHwlMzAc44+R3xuPmE0YBIjRylgRfN0Mygi42jPJRwW0QYM1jIBEWqltsMDuVuHV3j5ySMZVhyxd4z71xBNwL4bbI/dabw8UrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dThueIcu5VwntL8WKJqXQs81wzZiKnLbSYYw53rwng=;
 b=mnsEO0PdUr/UwOztMTUE56bBPRcRUzKPqnZKC7Jq3GmEMPPAfvLLh9Hd1Ksqc11BL2x8PfL8ZNJj0YWRrdsYP1ex9z5oq7Zfvs63kExtXod26RAFa5ywF7OReRWC7Zef8uidCakt4Jg/uukOGOP7c78GcGbyQhMoCL4ojtYYW30=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0401MB2533.eurprd04.prod.outlook.com (2603:10a6:4:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 07:59:34 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 07:59:34 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Kyungtae Kim <kt0755@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Thread-Topic: WARNING in usb_composite_setup_continue
Thread-Index: AQHWts63EhYqxw4n/06tOdNAYgT+7anBhpYAgAEM2YA=
Date:   Wed, 11 Nov 2020 07:59:34 +0000
Message-ID: <20201111075905.GF14896@b29397-desktop>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
In-Reply-To: <20201110155650.GC190146@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: d95bd4d8-5ba5-42b8-10e7-08d88617ba9b
x-ms-traffictypediagnostic: DB6PR0401MB2533:
x-microsoft-antispam-prvs: <DB6PR0401MB253373AC02E82F978EE7C7018BE80@DB6PR0401MB2533.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w0JyDXa03rrtUpDVBRusoWlNIUg6YHVHJFWQzkH+C8QPUxsFIOClsONO7X4E5KxafKm12Ofo56o+uUZJjKE8Av8JN3oi8W+kx8/C/gGB8JiWM6vZGu6Qm1VxivBuklfKb52zsQdVXhmmvSblgKBTdNfZBGfaCbtbkZlxbEMMXQoIy1xzL+b8KNwUTk5s2SVbvfqaZQ75VKNIJy04aHLNoQ3NEp/OuhPxDAnBrFVDX52G+5Yz+3dqy2ON6tj2w7hbFyp20KCLX4Ys2Zgtnqu7IFaU2+8iwoQ+tCTtZN55/D9u7Xe08mLO3JrCcR2bri6eF5+8k1Yj5yxDVYvxOz8g/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(9686003)(6512007)(478600001)(1076003)(8676002)(8936002)(64756008)(83380400001)(2906002)(54906003)(7116003)(26005)(6506007)(53546011)(66476007)(66446008)(66946007)(6916009)(316002)(71200400001)(66556008)(76116006)(33656002)(4326008)(186003)(5660300002)(86362001)(91956017)(6486002)(33716001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FD2zYXO723qTjBzuGj3QJuU1rBLFz6sG2j5jbR+wKJ2NJJFET0JjUoBKWuiN9qmOFE8kw7x1YeKNCW6Kn2uqmeMJN6uaW5oYL8fbhVo3EeNyzkXkkofDdanLIvvoOo5ZsyHa9fu2WBk7N//8pf1AjXiCNyGCtRPvGuFu4E9E8cwHrWCTQKxFeNy/P11eUgT5mrUlpS7dML79C0B8MRZpTNiA3mMukUU/vccAYfKDhZehPc44UFgGbJpHcuq0n1TkPvKgISq5VSNS2+ZU7Pwiejro2c/vh+W7StOy8ek5uevBNJlrEJYROsMs0wS5iYM2/nLMBTsw3HE108hFv8clEv6hzqKssiUDkrRIO8e7F+KTeyaeMrHhM0pOdM5oqYRzhYmunpOIlF5RzxItoUbsjrwwyCUeOaBRRGvhIYQpQRx+y/SbhOm1PXo6MO43u550iOr9J9iXRNsQsWycJbwpzqhlTnn9CcRnPaRfZ5nrt7UK5U8pOkPxwobaWwviQSL/bKbJrUDiZXVtA5FsZzJ6BajtJT7EkCQW4rvDo3KqvtLMsWmhAuiaSmIdplZSr7oyCLucXOjf0kCqBHMFg1Lj7SOY5vPyNY4Y1bhkNAv4HI2gzFakYcsUKdvxq5VQ3OaJdl8edCGWHgxA1SxCC8d5OQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A8FB55B26BD3046825496389EDF5380@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95bd4d8-5ba5-42b8-10e7-08d88617ba9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:59:34.5382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8m/sPDwlkxddMwGKhzVkoM33pg8AZ9Fh+Ab+DoBNrzYW0u72IgjnTOXmqkoRoJQQKLvRALBERLiorC1IvNhVIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2533
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-10 10:56:50, Alan Stern wrote:
> Felipe:
>=20
> On Mon, Nov 09, 2020 at 02:29:42PM -0500, Kyungtae Kim wrote:
> > We report a bug (in linux-5.8.13) found by FuzzUSB (a modified version
> > of syzkaller).
> >=20
> > (corrected analysis)
> > This bug happens while continuing a delayed setup message in mass
> > storage gadget.
> > To be specific, composite_setup() sets FSG_STATE_CONFIG_CHANGE via
> > fsg_set_alt() (line 1793),
> > and followed by cdev->delayed_status++ (line 1798).
> > Meanwile, the mass gadget tries  check cdev->delayed_status =3D=3D 0
> > through handle_exception() (line 2428),
> > which occurs in between the two operations above.
> > Such a race causes invalid operations eventually.
>=20
> Do you know who maintains composite.c (or the composite framework) these=
=20
> days?  This is a real race, and it needs to be fixed.
>=20
> Part of the problem seems to be that cdev->delayed_status is sometimes=20
> accessed without the protection of cdev->lock.  But I don't know when it=
=20
> is safe to take that lock, so I can't tell what changes to make.
>=20
> Another part of the problem is that cdev->delayed_status doesn't count=20
> things properly.  That is, its value is incremented each time a function=
=20
> driver asks for a delayed status and decremented each time a function=20
> driver calls usb_composite_setup_continue(), and the delayed status=20
> response is sent when the value reaches 0.  But there's nothing to stop=20
> this from happening (imagine a gadget with two functions A and B):
>=20
> 	Function driver A asks for delayed status;
> 	Function driver A calls setup_continue(): Now the value
> 		of the counter is 0 so a status message is queued
> 		too early;
> 	Function driver B asks for delayed status;
> 	Function driver B calls setup_continue(): Now a second
> 		status message is queued.
>=20
> I'm willing to help fix these issues, but I need assistance from someone=
=20
> who fully understands the composite framework.
>=20

Hi Alan & Kyungtae,

I quite not understand why this occurs, since cdev->delayed_status's
increment and decrement are both protected by cdev->lock.

cdev->delayed_status's increment:

Place 1:
case USB_REQ_GET_CONFIGURATION:
spin_lock(&cdev->lock);
set_config(cdev, ctrl, w_value);
	f->set_alt;
	cdev->delayed_status++;

spin_unlock(&cdev->lock);

Place 2:
case USB_REQ_SET_INTERFACE:
spin_lock(&cdev->lock);
value =3D f->set_alt(f, w_index, w_value);
if (value =3D=3D USB_GADGET_DELAYED_STATUS) {
	DBG(cdev,
	 "%s: interface %d (%s) requested delayed status\n",
			__func__, intf, f->name);
	cdev->delayed_status++;
	DBG(cdev, "delayed_status count %d\n",
			cdev->delayed_status);
}
spin_unlock(&cdev->lock);

cdev->delayed_status's decrement:
function: usb_composite_setup_continue which called by fsg_main_thread
due to FSG_STATE_CONFIG_CHANGE.

spin_lock_irqsave(&cdev->lock, flags);

	if (cdev->delayed_status =3D=3D 0) {
		WARN(cdev, "%s: Unexpected call\n", __func__);

	} else if (--cdev->delayed_status =3D=3D 0) {
		...

spin_unlock_irqrestore(&cdev->lock, flags);
--=20

Thanks,
Peter Chen=
