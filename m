Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DBF2144A7
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGDJWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 05:22:51 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:6177
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbgGDJWv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Jul 2020 05:22:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wiz19WCE9TwsZVVyousDwfAw07rzKSx9jxucJhGKo/KAneDOI8wXbeOtTq0uKL37pXDJP+oTEX9oPayiGa8bxyvNoAcbeLnOkFva0ZyLS1UhL2FFYxaJM0+gevh8328hLePGV3dKh6JoE9ASnO/iH100ma1TruBcyk+sFMYCVpCbzUW18lBK2DBgcxFi8zrP/SsbTJ+a1qmBKn1M0y3/51vmKtvgIHL3evjd+MStFJrvF3cg1IWGw054uxT+lKhqD1/gEY3aEbWirS5sk8PjKPw78puui/3e0CqjD9UOR2m3Vd1GymLMcGWyi42WrEdJJnf3c47v1i4RJzV9qto/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Amk9npL3FY77VMBT6ohOZLLwTgNhJz4t0y4jKPjn3EA=;
 b=GMXctIuiPvs/daU78BVGpW6IFtU2PRl0jvjLcXvl1Vc0lGS0jeAdBGGTKigLfCc9tDpSXYijf+HQSrHoroA75wyQQyd+Cxcs1Mnat9F2UHhMeQ+QzBsx56H6HFt8TO4ceFZJyN6qqUe1c/hd5yG5lldhfZQ9olAsFjIKMKpBNOH4omlkeU20iri3QXZyXkCeK7zwZ5J7lAoZlMvvW/xYFEmpg1JYfWztLAqiufm65NRYzsKvh0PQB1dl3/Q+8o36iqC36kLAX4V/26StSOtu4zXj24P042lzSGg9NfICCxZkOIo68jORiN3lDcMIrnFKUrP5z5b/qlN63ZJM28ZJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Amk9npL3FY77VMBT6ohOZLLwTgNhJz4t0y4jKPjn3EA=;
 b=VLaBnf5WcztyDGGyOi6o/3raLVW+YA4jVX6h4YuH/s89jwhA7bzFwF6WcpM2koT/kG0HutptIpBQe+dZJBMqqMkvOe2nQa7GlnFop9zEo1KYFdCV8c0vUxCiS3J612fhw0qfM8LCI7IdmYUnaIkPiMVVhzRIgvBH9LEoibXO9wo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6280.eurprd04.prod.outlook.com (2603:10a6:20b:71::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Sat, 4 Jul
 2020 09:22:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Sat, 4 Jul 2020
 09:22:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joA=
Date:   Sat, 4 Jul 2020 09:22:45 +0000
Message-ID: <20200704092255.GA5695@b29397-desktop>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
In-Reply-To: <20200703141911.GA623139@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 99303da2-4b4e-44b1-753c-08d81ffbd009
x-ms-traffictypediagnostic: AM6PR04MB6280:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6280DE140C30644FBA10AE108B6B0@AM6PR04MB6280.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0454444834
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jcg1IetVoVJC4WyPT6hEYl6IxN+As/2DZXc/K6pE93t99H/ihwYhcYogPNhKFYyMzY5t3Fr9WQgHLSLxO7s6oIr9hajBRj6nxhhkBTXV5b8WyUrmkzTaazlCxEK21NJjeCHE4kDwYRxWlV5RYctaEFHKtYk3GLpD1APiZLD+LwJYq0Fa1AV+3uH9kok8ScKYUMRgloYE3d1oZV2rKnE5wrLSG6NXOnE6KIGvtoh3RlyLDeBLABBV7tbGZC9Kxbqx9bue7UiY/bffw8m28Xbo/bK6gTchsifaTKhErQ6v0hNqDYYwKgN3pATx7YFiWRl08HLCrR2YKPFo0FfJ10eOJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(6512007)(9686003)(71200400001)(8936002)(186003)(478600001)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(26005)(4326008)(66556008)(53546011)(6506007)(86362001)(33716001)(6916009)(1076003)(316002)(44832011)(54906003)(5660300002)(83380400001)(2906002)(8676002)(33656002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /xiG5A1yP5M53NQ6wQ2k6PNzVD6Qb3fJfIhVn3/OY1jFflXsmqP/CqJw76X+ZqYmx27HSlD68NS0e8fFWNHsWpn1IW27wV7mRLUfzAF2AKDZxkbQqx/lya+1e9a9Y+EZwa7pSczoFvLtwpvyKi9jr8hoEop/qpb8qD83+f//UnyNRpSeqHnQGWCdSr+itbyhJmwhzEquxTqMZ1zZ/q9uqJ4+SHc1EgHgj9zyxCUF4HoSRXxAWMLbWxykiZ1WjPQsVqRYjFlLra4wLkP0Rslf0NfReVKjUX2G459LNRAQoN4jhdSyunQglVxMIbSnat8XgmUH/NKyXw+3VfUmsIrfq90L3w8Ox2VNGgVyjY3fwme7foWSV8I24CRenx1o2oHCTLEtlDZBVufX7BYRL7gVU59n6awNtO2P5Y/ZyODJKA6zdpgC0n4A7LpsDa4OVGNynG0KcQpqH3OvouZFOHly5GUF46tbAYdA4vENrTMnjFA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DC9026FA5B686459DFA9C4F82826831@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99303da2-4b4e-44b1-753c-08d81ffbd009
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2020 09:22:45.8925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qc3DeyT3c6VAQ10C/Yfimb+GyFb5GZp7HKhLe2nXIZSmfXNRvVts7f2TqnFGGwAa8KpeYjb7F+sDRG/XeCmLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6280
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-03 10:19:11, Alan Stern wrote:
> On Fri, Jul 03, 2020 at 02:25:32PM +0800, Peter Chen wrote:
> > After that, the user could enable controller as wakeup source
> > for system suspend through /sys entry.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/host/xhci-plat.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.=
c
> > index cebe24ec80a5..bb5d73f0a796 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *=
pdev)
> >  		*priv =3D *priv_match;
> >  	}
> > =20
> > -	device_wakeup_enable(hcd->self.controller);
> > +	device_set_wakeup_capable(hcd->self.controller, true);
>=20
>=20
> In fact both this patch and the original code are wrong.  It really shoul=
d=20
> be:
>=20
> 	device_init_wakeup(hcd->self.controller, true);
>=20
> This will add the wakeup entry in sysfs and set it to Enabled.  This is=20
> the appropriate behavior, as explained in the kerneldoc for=20
> device_init_wakeup().  The reason is because the controller device doesn'=
t=20
> create any wakeup events on its own; it merely relays wakeup requests fro=
m=20
> descendant devices (root hubs or USB devices).

Hi Alan,

At xhci-plat.c's system suspend API xhci_plat_suspend, it depends on
power/wakeup value to determine whether the controller should enable
port wakeup capabilities, and from the system level, whether the system
supports USB wakeup or not is better to be determined by user, and is
disabled by default.

Yes, you are right. The wakeup events are from controller's descendant
devices, and it is better to use roothub's wakeup capability to control
portsc's wakeup setting. At controller driver, the meaning for wakeup
setting is enabling wakeup interrupt for hardware signal events (dp/dm for =
USB2,
and RX-detect for USB3), this hardware logic is the glue layer and
designed by each vendors, without this logic, the USB controller can't
be woken up due to the USBCMD.RS bit is cleared, and there is no
standard EHCI or xHCI interrupt. The controller's wakeup setting is
better to be disabled by default, and decided by user too.

For me, either this patch or use roothub's wakeup capability to
control portsc wakeup setting, both are OK. Mathias, what's your
opinion?

--=20

Thanks,
Peter Chen=
