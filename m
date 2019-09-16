Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAAEB32D9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 03:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbfIPBLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Sep 2019 21:11:07 -0400
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:43649
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728927AbfIPBLG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Sep 2019 21:11:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnmTJzXERTJJ/4Z/w6iptXNihSmHuZmRHZYTcWuDeDiBiGSKAYwuVS917mssWP3wUgetEEMOuKJsInno2XLeqqfDIGW+0Vn8C440m3RtIBlHBWmXTOECfyjp8iX5TFaix1XlfvIfSidQIJHnozTWmgMvOmO4mGPn0+g/tfYiQT4r/1VX1qX49uEhuxVI2g5WFSYRmFyaqZZLZTUFcwqPbF6V1m5g5sbSdHT7M4SFaHYtyeaCWp+FXD2Cf51s9+kQXkEQ/SDCQpCZ/0m4zGeq6SSjduJ1IJWP+ucdRHK9ByQj924jD0FSkvYlPQbzTcvnHSz8TdJEZ0QEF6xk/CVVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nXtvvwhNAxpvptXgf0R0d4agj2JQmw0NRO9VENt9/o=;
 b=BbIrCgXcv1RWw1NdC7jUEVlklBImdLeZTtnK2lICUeKmiEzX6UPRiLRvPGmSrBqs+OyN5lqDjjbXMNrYSr0UHbJ7mVJvC5c4s9h23j7sJXtccRk8bU6I8LtjL7E0EIl8TU0ih0B5rlQmTki9mYgqKzNo6bFvvivAIWCN9CnBW2iH7OEUetRAuUiIUNDNvcLd1fwK/xVWLrIBWvSKpARwpKn28xKjJzrUn+/345RE4ZJoJLe1qfjzfeCrw1EEq5AfLDDc05/04rIsAMcM8oVWxYwiIxn8bN+I3KJd4SI61PMkVIIcEmMrWa+ASgJGjRboarQIp7jaTyEoMC/ctniW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nXtvvwhNAxpvptXgf0R0d4agj2JQmw0NRO9VENt9/o=;
 b=mLlbMSkOr33PS1RYAX61UKC9nl+wM8i7f3hUlqpEC7ve/gV4WXgFZWA9eb0QB+nOefRNva07GBSNyq1lZlKeHpBm9mMFVUaIx7ESxHbsilk5UWVKuu3paFjaJGj3Vstlug758OwUkwh7+ump6LZ1V735l2qO2Bf+f9IkVsotjaw=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4111.eurprd04.prod.outlook.com (52.133.14.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 01:11:02 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 01:11:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Allen Blaylock <AllenB@epiloglaser.com>
CC:     Manu Gautam <mgautam@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwgAKZ+wAAAH42gAAIn25MAAlq/6AAABKNoAADCIvYAABOL2AAJ85rvA=
Date:   Mon, 16 Sep 2019 01:11:02 +0000
Message-ID: <VI1PR04MB532760F579C327DC4C4529598B8C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <BYAPR20MB2501A4FBEDBBC6353B6EC585CCB00@BYAPR20MB2501.namprd20.prod.outlook.com>
 <Pine.LNX.4.44L0.1909121648280.1305-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909121648280.1305-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6bb41b9-b30a-49ca-0134-08d73a42be27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB4111;
x-ms-traffictypediagnostic: VI1PR04MB4111:
x-microsoft-antispam-prvs: <VI1PR04MB411131BA21AAD78C55660F0C8B8C0@VI1PR04MB4111.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(53754006)(199004)(189003)(186003)(74316002)(14454004)(33656002)(9686003)(6116002)(6246003)(53936002)(26005)(3846002)(2171002)(7696005)(99286004)(2906002)(305945005)(478600001)(55016002)(6506007)(229853002)(86362001)(102836004)(6436002)(8676002)(81156014)(81166006)(76176011)(8936002)(52536014)(54906003)(64756008)(110136005)(66556008)(66946007)(66476007)(25786009)(7736002)(66066001)(66446008)(76116006)(4326008)(71190400001)(71200400001)(19627235002)(5660300002)(11346002)(5024004)(256004)(14444005)(486006)(446003)(44832011)(476003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4111;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R1j+jdP2KZmuATpFL9HwkIPO++UsYQHgtRW8uSi6c7qtpuv5J5cwu2KU4T6xasrBReYTzYHAVD3yfIlB+A2dtWR3mejq71digkKMs1rMAQsFAhU+5bGQ01+1/xKMsa6CpUSQ7xkgSQGndL2nTOR4Hv0s3WnVnNN1OUC3HufNMvGkiYXCGchggoNOwUQX6y17OjoTjEvJanzPW5dudZULM6mwJxLqYSvX01QJ6ywf15Ic8Ct/6+XJyMfT+g7nh1jAhxzPaPZXoRYZdKzGxBfPKdAok1mINBz+/J7CVZWRL5CBmlTth5c82uCoMjKxDjDza3eQM3JD/wofc63oDp4atCVK3uKvrDMnyvpavuiv0nRuUNIpIqjqS3u7dOwwKwRip5AkmRIvY2tsiADSoUVWtH6pg2jxqEU4N8f6h/N+yns=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bb41b9-b30a-49ca-0134-08d73a42be27
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 01:11:02.7934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwmTBIuh7lF+FncKtHkumd4zazrOOeejruzNGWGTWQV8tUADfoXZ1Wgb15Fl0C8eUi5KvxyHJs7Z7r1u7F4fgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4111
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > >I should add that the USB 2.0 spec includes the following text (from s=
ection
> 11.24.2.13):
> > >
> > >        Test mode of a downstream facing port can only be used in
> > >        a well defined sequence of hub states. This sequence is
> > >        defined as follows:
> > >
> > >        1)  All enabled downstream facing ports of the hub containing
> > >            the port to be tested must be (selectively) suspended via
> > >            the SetPortFeature(PORT_SUSPEND) request.  Each downstream
> > >            facing port of the hub must be in the disabled,
> > >            disconnected, or suspended state (see Figure 11-9).
> > >
> > >So you can see the hub probably failed the request because a
> > >non-suspended device was connected to port 3.  (And who knows what
> > >was attached to the other ports -- the usbmon trace doesn't say.)
> > >
> > >Alan Stern
> >
> > This was very helpful.
> >
> > I was able to get the USB3503 to generate test packets by adding a
> SetPortFeature(PORT_SUSPEND) request to suspend the port before setting t=
he
> PORT_TEST feature. Is there a way to tell that a device is a hub but not =
a root hub
> so ports on root hub ports aren't suspended prior to calling
> SetPortFeature(PORT_TEST)?
> >
> > I tried to use hub_udev->maxchild to determine if something was a hub b=
ut this
> appears misguided since root hubs can have multiple children, nothing els=
e in the
> usb_device structure jumped out as being directly related to a hub.
>=20
> That's a perfectly good way to see that the device really is a hub.  In a=
ddition, if
> hub_udev->parent =3D=3D NULL then hub_udev is a root hub, otherwise it is=
n't.
>=20

Hi Allen & Alan,

Good finding.

Besides, if you would like to generate a formal patch, per 7.1.20 Test Mode=
 Support, you may
support Test_SE0_NAK/Test_J/Test_K/Test_Packet all for non-root hub. The ot=
her three test
modes should be embedded host required.

Peter

