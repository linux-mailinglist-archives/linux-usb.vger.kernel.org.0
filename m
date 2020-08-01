Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8FD2350DC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Aug 2020 09:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgHAHEo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Aug 2020 03:04:44 -0400
Received: from mail-vi1eur05on2089.outbound.protection.outlook.com ([40.107.21.89]:51553
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbgHAHEo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Aug 2020 03:04:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9wm0rt9jQeat/Ah+05rfDTbH+iTq3DyFz5apS53z+JzGIp5yHBEjSc2vKlJYUPScuxuZAm3UJdCEFUvVYCTWQnsBObGiNHmeYwFOIdf9j0bOJRiZSjLZSWKv8HlqLSl5g5n/BKWFq8IC1wMkxniJ2mxNM5ThqUBeeye6vJd0TuFjiWN0TqGvN8HRvwCi2e++bxB1UKbJL44HbYpSnAkh2P79cpTDEIkjzqBp9JrmEMzDVGPSwY4B3jQyB5FkJR1St5bzmWZmzAakp5RPQPt/UlxBUFrY0szFeYXMIb9xRfyBSc6b1vj5xQN/j4wK8WOW9cRDPWhHKMKpeLSeyGkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+Y9mi7DBUnOmas21VVkAGESTgcuNQrDYsDrKLIrO7I=;
 b=j8Sbjdvmw01wQP68jew59OUcEHVjH1VdVKO83wZsaIzmW3fMfQ0jV8qZApJaA/V6URFyTi6c7YaN6IcuF7EPzMFCNMl8CJ5bJvIyxetozL6B9/yJuTjoZzhKcq2KpnY2SK4eY/g1PrQ2t/u2qp3jmrOmXN1soXJR/sz6vA0ROmPWHmjHPDYNClnNHnNi/Zl58RebE4lizBQ//y2VgQ4p/n22FPNH2Ypupf2MqVI4dVpNOTQEDwdkMYDJmeCBnlJTsOyukYEfyzidnboTMGhUWaTxRAVe13h54KFXGtLkmBllsGtja+ENRu8SAd16TLQp0O4sJHapcO+M7Vlv93S5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+Y9mi7DBUnOmas21VVkAGESTgcuNQrDYsDrKLIrO7I=;
 b=VYxaEtTxotBZuBRDrj36rrd+8VrylydRbOHWVN5K6R7izQiZierwZ3jpomeMMFeLZtNzVm3qOr6d6EH92z2YwF9MXlQYRjVFTPNB9kVvI6skU62PlMlRfTiRQfTD4aBO8GUjo+xH6aWQ+5ztTsi84bYzknnhOYiNkcrSsIjv460=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4256.eurprd04.prod.outlook.com (2603:10a6:803:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Sat, 1 Aug
 2020 07:04:39 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3239.018; Sat, 1 Aug 2020
 07:04:39 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Topic: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Index: AQHWZyFkM3xFFODcZkGE9soNTZjwlqkhlL4AgAAEcwCAAAPbAIAAHDgAgAABzwCAAJ9GAIAAeF0AgAABk3A=
Date:   Sat, 1 Aug 2020 07:04:39 +0000
Message-ID: <VE1PR04MB65285671C1F7DD36DB2C48F3894F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com> <20200731140553.GA8013@b29397-desktop>
 <20200731141248.GC36650@rowland.harvard.edu>
 <20200731234224.GA13414@b29397-desktop>
 <DB8PR04MB7162CC76A1957F83F6079F688B4F0@DB8PR04MB7162.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB7162CC76A1957F83F6079F688B4F0@DB8PR04MB7162.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f116a92-31b1-450c-d5ae-08d835e92858
x-ms-traffictypediagnostic: VI1PR04MB4256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB42569BACB99E3BB85BE4AC6A894F0@VI1PR04MB4256.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sq9nTnxbABAuI9YTXO5vmusPV5/6DUvlyfabQZc7KObzPcDfqjj7faJ/7ocs9O7FSUWrYQpvAafzD6R1Vi3e5+obprWxhp1t+l5DmW5+r1s1QxbusdZQ0vuXMxNgjBLjIuXorgH8VGeVUuC2iiNg3VkcXOHheD7gJk3gMdI7+7ZYmYVKsXodnrwSGQdYqQ0hPrPhljBmQMf4En6ceSrcQlHe1P0fkdIyCpem40J3EljwGcnJIln2foDT2B91x6vNEvlxgi3sQQCzHTkmj9jL6jTtnL0w2FwJatwPrgpU4R+SGO+HuFX1eELEWR+rj2aUFYojgfuiXqELRsoyyZlDh/TRiPLgVAAD5fgs/4vfKuvfBpoQbik38aKjo+1RBXe+rrFAfxxzQJg823MnhSfMwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(55016002)(478600001)(44832011)(7696005)(8676002)(2906002)(8936002)(4326008)(9686003)(86362001)(53546011)(52536014)(26005)(66446008)(66476007)(66556008)(5660300002)(64756008)(71200400001)(66946007)(83380400001)(110136005)(54906003)(316002)(33656002)(76116006)(6506007)(186003)(142923001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: u9AilfsTnLB3jXjyRmaZx+3Qz3IaZpXmDaYK+0abhZqDpWAjePtE0Ku1p6GyONjPQrZT6yNwPiyD57FHI+WU9qG4vReCUXzFijelW+cXBA0yFb2ImbqJmYTShMmEPZeGBbbgWy6xXvDhOA+DrPNVepLe0xUB6SAa4IdW+YL3Fsck4b+0yL72Sej3P8U5q3nrEMycUXM7cJh3kYH6JV8J0JOJuuW5tDRs6XEw4ehS9Zlrn0vqGiUonBBQOUwZgk0Wx6pn47XbuF6bcxBkGc90txmyzsB9BVHOWYFCkT8j7aiYuv6X4A6lc9yWjUrhrFkEkc3sYKuSnYdJzG7Qp73rU/8ykXRujg/Vw1E1vF0oUIGsA7/q8rxySJc8EcZtWkuKx2RysOPOejJxqyOJVFW9d0m2wtr5P+w5Q7R2WBCtCmPDKnZYpZaw5tvnwZ72ACGfpsz/UWb4XT6x1HVZ3aiD+fZcMrnGO+RTCB+3ujeBZ8TOsD5nTeZPj/WdcZQT7/+eApsTjKVadLu9jhUhPLqTmO9sF/7doukTyK7f/xz4e6MzsWbQdgofqgl0KkEQ+pSZUq2RqCX29Qo+ab5nMGPBNO7reFA4ewEy6OH3ln/U21RR2LKkVkPNrIiTpkp43s1g2JtkD3WUJ9FvoOO1Beg0/A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f116a92-31b1-450c-d5ae-08d835e92858
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2020 07:04:39.2618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRKQFTeWrhpPh7zAaMzczoEk4vL45+o6M820C2BBK/WQjEEuXr/mZO6JF5X3EiuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4256
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@nxp.com>
> Sent: Saturday, August 1, 2020 2:54 PM
> To: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; balbi@kernel.org;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: RE: [PATCH 1/1] usb: gadget: core: wait gadget device .release f=
inishing
> at usb_del_gadget_udc
>=20
>=20
> >
> > On 20-07-31 10:12:48, Alan Stern wrote:
> > > On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> > > > On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> > > > > On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
> > > > >
> > > > > Grab a reference from somewhere else and do not give it up for a
> > > > > long time.
> > > > >
> > > >
> > > > So wait_for_completion_timeout is suitable? The similar use case
> > > > is when we open the file at the USB Drive at Windows, and we click
> > > > "Eject", it will say "The device is currently in use", and refuse o=
ur "Eject"
> > > > operation.
> > > >
> > > > When we try to remove the gadget, if the gadget is in use, we
> > > > could refuse the remove operation, reasonable?
> > >
> > > No, the real solution is to fix the UDC drivers.  They need to
> > > allocate the gadget structure dynamically instead of reusing it.
> > > And they should have a real release routine that deallocates the gadg=
et structure.
> > >
> > > Alan Stern
> >
> > So, the basic routine should like below. I thought the usb_gadget
> > should be deallocated before the UDC driver remove itself (UDC device
> > is the parent of usb_gadget device), I may not need to wrong about it,
> > it is just a memory region, it could release later.
> >
> > xxx_udc_release(struct device *gadget_dev) {
> > 	struct usb_gadget *gadget =3D container_of(gadget_dev, struct
> > 			usb_gadget, dev);
> > 	kfree(gadget);
> > }
> >
> >
> > xxx_udc_probe(pdev)
> > {
> > 	udc_priv_data =3D kzalloc(sizeof(*udc_priv_data), GFP_KERNEL);
> > 	gadget =3D kzalloc(sizeof(struct usb_gadget), GFP_KERNEL);
> > 	udc_priv_data->gadget =3D gadget;
> > 	...
> > 	usb_add_gadget_udc_release(&pdev->dev, gadget, xxx_udc_release);
> >
> > }
> >
> > At xxx_udc_remove(pdev)
> > {
> > 	usb_del_gadget_udc(udc_priv_data->gadget);
> > 	/* need to never reference udc_priv_data->gadget any more */
> > 	udc_priv_data other deinit;
> > 	kfree(udc_priv_data);
> > }
> >
> > Since all structures xxx_udc_release uses are common one, it could
> > replace usb_udc_nop_release at udc/core.c.
> >
>=20
> Since gadget structure is allocated at UDC drivers, I think it should be =
freed at
> the same place. Current common release function at udc/core.c may not a g=
ood idea
> per our discussion.

Could all those allocation and free in UDC core? Have them in one central p=
lace
will ease/force UDC drivers to correctly handle this.

Li Jun
>=20
> Peter
