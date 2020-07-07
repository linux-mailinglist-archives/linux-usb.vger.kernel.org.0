Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42127216394
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 04:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgGGCBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 22:01:34 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:51983
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725987AbgGGCBe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 22:01:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU121Z5wBTFDwIw8VQhiAGPuZLYOljav7VVL37WEeloQn5UKaFUnFxbzPYcB6NErxHmWLF3vr4QbsiWimi43OzsVyCW+hc+oFcutxLJuasoXPgmj2KGvqnHlaTP4jnkjRK34TMiPZCZZ6Kv1WCTr7teqweQNFQ1D0JA2lqdwq+KMuOHDEdEPx+HvOW0NnIYGXOELRg+7lSbOa9pYqT04gkInwqH7j1nl6t/SbM7HRml8JLOGa1yC3yYBXJFIbQjybdi4wk1JjXWrvq+q/4jv+DUUjhnDhapYAkFQwYAeIRkaqO+tT6GKgjw/4njGhXl8wHL6BRNrefZr2YDgCLKm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jYJITAb+McSk2R9l6jdrXZCMmSx1KhU7B1JujMy/OA=;
 b=OphMbzxb5K78UnTyB78riNZsVv4gvxoGudhLKA+SE65BUqoCyZYyIGeg8RQo92wFzB+ABvb01LsgcsyLHvReRgW6MgjrIZej9w90xdTq9ghptKMVRa2xEY8SuoJeCQaw6o0RE1J6n886c7D047L3vJZNFiiTXvvaka5wccOcR+A2DljqwnOkaIvoHrMRA6mVnp2o5gJsLpPZpI9xe0vORKlox0GHLychGz0Zq78rm76VNcAw8UZYo7iCTyM46DIW9nx3FgfPkL9VJjvpMPNBQfWIfI01aUgBMf1szy1xUI9SvQZY/DqTg9DYUDJznOvmO+J3ctE57JOe3JaiWgHsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jYJITAb+McSk2R9l6jdrXZCMmSx1KhU7B1JujMy/OA=;
 b=EO1U8O4AQjS23e3uaSGCla73CIR/YaDE9UHJx2Nn1sQPk9OplD0EBj0XVouInt5SsOhEGvK+DVxjdUhqY4a69WfsnDacNybrlO94yk3yTgX9/hnP1Nyyh/Mts2kGVTFTRxTwUtwGpjjlKfUail5gMpEr+yv9XCf+EVEoGapgACA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5493.eurprd04.prod.outlook.com (2603:10a6:20b:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Tue, 7 Jul
 2020 02:01:28 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 02:01:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sAgADOc4CAANPw0IAA3ViAgAChxYA=
Date:   Tue, 7 Jul 2020 02:01:28 +0000
Message-ID: <20200707020137.GA5373@b29397-desktop>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
In-Reply-To: <20200706162237.GC704149@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: f9ddd324-4cbb-4d65-7aa6-08d82219a94f
x-ms-traffictypediagnostic: AM6PR04MB5493:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5493631CBFAA383ED7D154698B660@AM6PR04MB5493.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pE2bG66owkKChztuSfbxKtCI+Wrnax6I66MdQMqz7/3wgbykqxS0n1tHaZHejlMiYUrv4vyFn1a/kfUC8Eidl3pPektki7PTqurracnVW1o/VBqNFJfWosnu1Ii7aFpSjc5jn5leVILzEM6TZS7ZkTBuTwSO0T7xlcC8vh+b6/TJQ/HEDp2ez8u9v2azG0sqdrFHFxeXMxJ6dn71qF6uuQV8BEOXD+c1jh2USkuqy+0YD4TRUiD1e2BPS+0kBOIepqKEcckk4HgEN84hyPe5rAYZaHo+uHkaz0NvJGMpW7aUzp75uWOZ7OU2M99GZHCF4M7NQeZjLoDSB2homb+AJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(6506007)(53546011)(1076003)(33656002)(4326008)(5660300002)(8936002)(478600001)(316002)(54906003)(83380400001)(9686003)(6512007)(186003)(8676002)(2906002)(64756008)(33716001)(86362001)(71200400001)(26005)(6486002)(6916009)(44832011)(66946007)(66476007)(66556008)(76116006)(66446008)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: G6NECboiR2sI4wvWAot2pcvuKwLBSaGc7wjynsOI6In7iCQaPDZcG/ZjHxFHT3hGb57GvkXAuIcT8/zE173z+X6q257pA5V22NC2WL6EtjctJ9Kbq8n/vtlH3r+V8Z4kDtJJQj4LAZeH2Vyo9bIjWqdKZSLPW0ERnKp0yhTEhX3tNusi0ZsXwFmYlhNQtuULyltAqqkV91f74TwGI+qnQ2PkAJAD+oBae77Ovzbbr2G7EztBHFHw6HLqXyM2Z6W7rEa/0vTWlGxrwS/Ecfys97eZp431wpKIhLdS+Y8goZb7NbyJag31j35LxkXT78w/xWx45x9WoaDCAIqseSumVB1HEUivr9uEQXrZlrmrM8x/5g9EuaK6GwaUAeXXmfAVWFVVrXkklODAmk1a0rjcmdwpweMo4ZTamBRUt6Fb7/2C6PQ3nrkgxfBhLKEMaSsSEoFlsTHtdJOmEpLO/EKkpIWoSaVCOOuoREEEbOP7rnrL/uckUCYsEBdPp5kuYWjE
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35D1E9AF4FF2B147B48AA6A18ED8A015@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ddd324-4cbb-4d65-7aa6-08d82219a94f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 02:01:28.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8t27fgcgWeIkBbDTySEYDA0pKeb9xcBDhOquX2nl+5rK99Fw82TYUonqWlwZ4F31nGyIorQCF6gjmkgbFxdcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5493
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-06 12:22:37, Alan Stern wrote:
> On Mon, Jul 06, 2020 at 04:03:08AM +0000, Peter Chen wrote:
> > > > Thanks for the information, Alan.
> > > >
> > > > I could not understand why device_wakeup_enable is used in these
> > > > device drivers? At Documentation/driver-api/pm/devices.rst, L189, i=
t also says:
> > > >
> > > > 	during a system sleep transition.  Device drivers, however, are
> > > >        	not expected to call :c:func:`device_set_wakeup_enable()` d=
irectly
> > > >        	in any case.
> > >=20
> > > It also says:
> > >=20
> > > 	It should also default to "enabled" for devices that don't
> > > 	generate wakeup requests on their own but merely forward wakeup
> > > 	requests from one bus to another (like PCI Express ports).
> > >=20
> > > The controller device falls into this category.  It doesn't generate =
wakeup requests
> > > on its own; it merely forwards wakeup requests from the root hub or U=
SB devices.  I
> > > think the intention was that drivers for these devices would call dev=
ice_init_wakeup()
> > > instead of calling both
> > > device_set_wakeup_capable() and device_wakeup_enable().
> > >=20
> > > In any case, the rule about setting the default value is more importa=
nt than the rule
> > > about not calling device_set_wakeup_enable() directly.
> > >=20
> > > If you're concerned about connect-detect or disconnect-detect wakeup =
signals,
> > > these are supposed to be enabled or disabled by the root hub's wakeup=
 setting.
> > > The idea is that root hubs should behave the same as external hubs --=
 and whether
> > > or not an external hub generates a wakeup request when a connect or d=
isconnect
> > > event occurs is controlled by the hub's wakeup setting.
> > >=20
> >=20
> > So, you suggest:
> > At hcd-pci.c, ohci-platform.c, ehci-platform.c, and xhci-plat.c:
> > change device_wakeup_enable to device_init_wakeup(dev, true).
>=20
> I don't think it's necessary to do that.
>=20
> device_init_wakeup(dev, true) just calls device_set_wakeup_capable() and=
=20
> device_wakeup_enable().  The kernel already does the=20
> device_set_wakeup_capable() part for these devices in the code that=20
> registers them.  For instance, the PCI core calls=20
> device_set_wakeup_capable() when a new device is discovered and=20
> registered, so there's no need for hcd-pci.c to repeat this action.

But, that's not all the use cases. There are still two other use cases:
(Taking xhci-plat.c as an example):
- It is a platform bus device created by platform bus driver
- It is a platform bus device created by glue layer parents
(eg, dwc3/cdns3), usually, it is dual-role controller.

>=20
> > For xhci_suspend, use both controller's wakeup setting and roothub wake=
up setting to
> > judge if connect or disconnect wakeup needs to enable or not, like func=
tion ehci_adjust_port_wakeup_flags.
>=20
> Yes, something like that.  This probably should be done in any case. =20
> Some hardware might not like it if port-level connect/disconnect wakeups=
=20
> are enabled but the controller-level wakeup signal is disabled.
>=20
> > > If the controller's wakeup setting defaulted to "disabled", then anyb=
ody who wanted
> > > to get USB wakeup requests would have to enable them on both the USB =
device
> > > and the controller.  This would confuse users and cause problems.
> > >=20
> >=20
> > I think if controller's wakeup setting is only used for ehci or xhci co=
mmon code, that's ok. If
> > it is also used for glue layer's power control and wakeup setting; it m=
ay need to set "disabled"
> > for default value.
>=20
> What sort of wakeup events can the glue layer generate?  It seems to me=20
> that if there is no controller driver bound to the controller device=20
> then the controller shouldn't be able to wake the system up in any case.

It should be the similar with PCI device you mentioned below. The
glue layer device is a platform device which is the parent of controller
device, it could detect ID/VBUS/DP/DM/RX changes and generate wakeup
events, these wakeup events will trigger interrupt, this interrupt
number could be the same with controller interrupt number or not.
When the system is in suspend (D3), when the wakeup events occurs,
the system interrupt controller could trigger wakeup request, and
wake system up. When the system is in full-power state (D0), this
interrupt just wakes up glue layer, and glue layer wakes up common
USB stack (EHCI/XHCI).

>=20
> > I am curious how PCI USB at PC determine whether it responds USB wakeup=
 events or not?
> > At Linux kernel or BIOS? It has two places for enabling USB wakeup, one=
 for USB devices
> > (including roothub), another is for PCI device?
>=20
> PCI devices send wakeup requests via a special PCI power management=20
> signal called PME -- you can see its state in the output from "lspci=20
> -vv" in the Power Management Capability section.  In legacy systems this=
=20
> signal was handled by the BIOS, but nowadays the PCI and ACPI subsystems=
=20
> in the Linux kernel handle it.
>=20
> If a PCI host controller is in the D3 low-power state when a wakeup=20
> event occurs, it uses the PME# signal to request a wakeup.  If it is in=20
> the D0 full-power state when a wakeup event occurs, it uses its normal=20
> IRQ signal to tell the system about the event.
>=20

If the USBCMD.RS is cleared, does the interrupt could still occur when
the system is at D0, or this interrupt is not USB interrupt, it is a
PCI interrupt?

--=20

Thanks,
Peter Chen=
