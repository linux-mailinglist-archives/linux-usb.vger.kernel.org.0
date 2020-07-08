Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C2D217FC9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 08:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgGHGrh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 02:47:37 -0400
Received: from mail-am6eur05on2077.outbound.protection.outlook.com ([40.107.22.77]:64769
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgGHGrh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 02:47:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKuvmmk/A2zsmH9MN+o0Fxby7ErRUXHClTD48a7rV9mSWFBJcdiRQ5Iqgph947N9ZB/u0eavtuPMBR2nzo8DK66VV7ZvnR3BpdWR5Y+VLzjZyc8flfGAmXz2nW0RHbqjDVt4Q6OV0s5kyyP7kniXxzWmHO+tip6PiCJJ5xtNobW0wPs9yXTiNJnjCqzV1fppK//PFfDOhjO91j/IaQJEQcPobc9Sfl7KOoHY3nXpbAHAtoqARIjT+QvejHO0FGkEp7BtI+SM5E7i25cs742/ytrfx5SYw56gbETUIJwb1UKFbr8QVoK6Z14HHrmSSRvC85BhA/RmtdvHpFhJBOQ84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq2eLOxgfKiUNuuLtJtrp+mQZRf6/+pmXeV7vL1H6go=;
 b=E4w6LZbsSM53nAVDQNzMz2K1+klUW8QMvoGbONKXOci5QX8T5VXtRNCJxm4IFNbg2nTh6BNXwW3MiAjHb6Nxzw/Si5BiDD7f2OjL1oAol4DlSEst9GgAiYNkDdT7z3CTFS0lA79ANoyjQnvlm4FnUiV8PkAgdb2FmJntqs3yaM6f+mDnZmYoTuJKfaqCYzkSoPIvMr0Fcmph4II8B3JLm4mZEMltwtxn1BKiMYMtxHxmm0xMIeduP3WowpuX46sGKdt+gZSf5Fq5WhxAMQpVK7d48rak2FriZ3IH7aG3g3RqLOGly99JxZZ1fjc3ObxWVJR5PQCbFhLLRJaxqHAygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq2eLOxgfKiUNuuLtJtrp+mQZRf6/+pmXeV7vL1H6go=;
 b=pwGyeWuP5DRdEoih55WlM9D9TylBKiYjOHbkKfHgNz3tVFlGqkE1PJ7ij6dvhlT5k4GEJps3bPHI1vIxufH+S6hoF8uSbIm4DKFYnWTgnOd4bG8tkGS4zKLM1ow/8tjFBJdSo7fXhrCYIago/QYOQANiU2IC/W8Y2H5zMhR6zPI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM6PR04MB5175.eurprd04.prod.outlook.com (20.177.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Wed, 8 Jul 2020 06:47:31 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 06:47:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sAgADOc4CAANPw0IAA3ViAgAChxYCAAO2QgIAA9LEA
Date:   Wed, 8 Jul 2020 06:47:31 +0000
Message-ID: <20200708064740.GA18440@b29397-desktop>
References: <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
 <20200707161153.GB740256@rowland.harvard.edu>
In-Reply-To: <20200707161153.GB740256@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: b4267e39-2f93-4052-801e-08d8230ac9bf
x-ms-traffictypediagnostic: AM6PR04MB5175:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB51750F18C2FB4304BB1DF58C8B670@AM6PR04MB5175.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+JLcjk+z72qHpkxecmURWnW5rbiOtflllmIp9c9rj6CPEp/BJDvpNnVT2PV0Fu+OH5PbdeT+QwRt5aSqXEle2YO9j4DJsFiNCV9LS/uYhVVqlrIK8Sz/8WtsvtsRdx2n43fY7KSd0AQYDXIwpehz4lsGfbooGlKeROXFNlZk/45yocaTlOFpgweHloCVz1i48NLx6snJm1VjXQAB0aq+x+PhOMxVPxSA4PXLU972xq0NzNw3oZVAjEBbpskmxYXUhpv1xxkMLpRlXS2NqJiyq9NIDNx37PvmEqWPthxJPQTuguf66X2QhAgWGFlPwP9Thio/3sN+8DlbW4OLO6/qA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(91956017)(66946007)(76116006)(9686003)(478600001)(2906002)(83380400001)(8676002)(6486002)(54906003)(71200400001)(6512007)(64756008)(66556008)(66446008)(1076003)(33656002)(66476007)(44832011)(5660300002)(186003)(6506007)(53546011)(86362001)(6916009)(4326008)(8936002)(26005)(316002)(33716001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4Lw/oH62xgbTBT316+eoKchmlYcECQecoBrR1323MdrMeVIHQ4q9roWckn5IozpsOC2Mi7E61XZxN/T17BjSHTVRxwB3XsCRMz8rjjDtzuf96yHvQgJYYPbTKIS0bgJ0UJ8q5BniUJmodJbZgG1brOs+7WZhYoXab9z0iWr6pOmzSk62/MfTZQTftv9CXMwrQtpKzmTE2Q3Womrwdx6zU2bQU4K2VEo+JAG8NCAeSSJ+pOtQJSP3F39WOrHeigeD8jJKDbnLYFHCFgj6EvjCpgfhLZMwzCiIUcTOx36taydcVsgOFpDiId0WhBXdifeexhJvieUohIDWi6jv/LcTRplqYqog6VzbdoaMQFzMTMixvnlntq91gDMnRTQJBm7JDp6ITG9n0jWbYZTI56rprtAnBeJD8i0ldB5cQ2BfJpTxz3psOysrEBdoGooz3wIeS/bR+AP3TOby8zQniLigkGek67hYzYbOwEFzTFhSUm0FUoHbCZ11X7TfZxHLqxVd
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DD4F4702868C24A8E3BBA06CFBE917B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4267e39-2f93-4052-801e-08d8230ac9bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 06:47:31.3733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47He+7KnDUIaoMeTqWVHOjyxmwTsvcfgrcNpNo6W8PCfta4ousVQC9v2SRxK14CPxiPZ2t6tRetBPS557///mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5175
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-07 12:11:53, Alan Stern wrote:
> On Tue, Jul 07, 2020 at 02:01:28AM +0000, Peter Chen wrote:
> > On 20-07-06 12:22:37, Alan Stern wrote:
> > > On Mon, Jul 06, 2020 at 04:03:08AM +0000, Peter Chen wrote:
> > > > So, you suggest:
> > > > At hcd-pci.c, ohci-platform.c, ehci-platform.c, and xhci-plat.c:
> > > > change device_wakeup_enable to device_init_wakeup(dev, true).
> > >=20
> > > I don't think it's necessary to do that.
> > >=20
> > > device_init_wakeup(dev, true) just calls device_set_wakeup_capable() =
and=20
> > > device_wakeup_enable().  The kernel already does the=20
> > > device_set_wakeup_capable() part for these devices in the code that=20
> > > registers them.  For instance, the PCI core calls=20
> > > device_set_wakeup_capable() when a new device is discovered and=20
> > > registered, so there's no need for hcd-pci.c to repeat this action.
> >=20
> > But, that's not all the use cases. There are still two other use cases:
> > (Taking xhci-plat.c as an example):
> > - It is a platform bus device created by platform bus driver
> > - It is a platform bus device created by glue layer parents
> > (eg, dwc3/cdns3), usually, it is dual-role controller.
>=20
> In these cases there would be a choice: xhci-plat.c could call=20
> device_init_wakeup, or the platform-bus/glue-layer driver could call=20
> device_set_wakeup_capable and xhci-plat.c could continue to call=20
> device_enable_wakeup.

You said "the PCI core calls device_set_wakeup_capable() when a new device =
is
discovered and register", why PCI core does this, is every device on
PCI bus wakeup capable?

The reason I ask this is not every device on platform-bus is wakeup
capable, to let the controller device have defaulted "enabled" value,
we need to use device_init_wakeup at xhci-plat.c

>=20
>=20
> > > > I think if controller's wakeup setting is only used for ehci or xhc=
i common code, that's ok. If
> > > > it is also used for glue layer's power control and wakeup setting; =
it may need to set "disabled"
> > > > for default value.
> > >=20
> > > What sort of wakeup events can the glue layer generate?  It seems to =
me=20
> > > that if there is no controller driver bound to the controller device=
=20
> > > then the controller shouldn't be able to wake the system up in any ca=
se.
> >=20
> > It should be the similar with PCI device you mentioned below. The
> > glue layer device is a platform device which is the parent of controlle=
r
> > device,
>=20
> I don't understand.  Let's consider EHCI as an example.  The controller=20
> device is something like 0000:00:1d.7, which is on the PCI bus and is a=20
> PCI device.  Its child is usb1, which is a root-hub device on the USB=20
> bus.
>=20
> But you're saying that the glue layer device would be the parent of the=20
> controller device, right?  This means it would be analogous to the=20
> parent of 0000:00:1d.7.  In the PCI world, that parent would be a PCI=20
> bridge or something similar.  It would have no understanding of=20
> ID/VBUS/DP/DM/RX changes, since those are all USB concepts and have=20
> nothing to do with PCI.

Sorry, my words were not precise.

From hardware level:
Controller includes core part and non-core part, core part is usually
designed by IP vendor, non-core part is usually designed by each SoC
vendors. Wakeup handling is part of non-core. The USB PHY gets
ID/VBUS/DP/DM/RX change events, the related signal ties to non-core part,
and non-core part knows the wakeup occurs.

From software level:
Taking single role controller as example:
Glue layer is a platform device, and handles non-core part events,
including wakeup events, it is the parent of common layer which handles
core part events (eg, xhci-plat.c)

So, one controller includes two platform devices, one for glue layer,
one for common layer.

>=20
> > it could detect ID/VBUS/DP/DM/RX changes and generate wakeup
> > events, these wakeup events will trigger interrupt, this interrupt
> > number could be the same with controller interrupt number or not.
>=20
> This really sounds like you are talking about the controller, not the=20
> controller's parent.  Or maybe a PHY, which is sort of next to the=20
> controller without being its parent or child.
>=20
> I like to think of it this way: A controller or device is something that=
=20
> sits at an endpoint of a bus or communication channel, or at the meeting=
=20
> place of two buses or communication channels.  Thus, an EHCI controller=20
> sits at the meeting place of a PCI bus and a USB bus.  As a result, it=20
> has interfaces to two buses: an upward-facing PCI bus interface and a=20
> downward-facing USB bus interface.  The controller and root-hub devices=20
> are abstractions used by the kernel to represent these two interfaces.
> That's why the ehci-pci controller driver registers itself with a=20
> struct pci_driver and why root hubs are bound to the usb_generic_driver,=
=20
> even though the actual hardware is all part of a single EHCI controller=20
> chip.
>=20
> So now, in the situations you're talking about, what exactly are the=20
> buses, the interfaces, and the controllers/devices?

roothub is the child of the core part, core part is the child of non-core p=
art.

>=20
> > When the system is in suspend (D3), when the wakeup events occurs,
> > the system interrupt controller could trigger wakeup request, and
> > wake system up. When the system is in full-power state (D0), this
> > interrupt just wakes up glue layer, and glue layer wakes up common
> > USB stack (EHCI/XHCI).
>=20
> When a device or controller relays information from one bus or another,=20
> the wakeup setting indicates whether or not it should relay wakeup=20
> requests.  ID/VBUS/DP/DM/RX events are all things that take place on the=
=20
> USB bus.  As a result, the corresponding wakeup requests are=20
> theoretically generated by the root-hub device -- not by the controller=20
> device, since the controller device is attached to the upward-facing bus=
=20
> and not to the USB bus.  The controller's wakeup setting thus indicates=20
> whether the controller should forward these wakeup requests from the=20
> root hub to the upward-facing bus.  Once a request reaches the=20
> upward-facing bus, it could take the form of an ordinary IRQ signal or a=
=20
> system-level wakeup signal.

You are right, ID/VBUS/DP/DM/RX signal changing occurs at the USB bus,
and detected by USB PHY physically.
  =20
The controller device (core part) or glue layer device
(non-core part)'s wakeup setting is only used to enable/disable platform
related powers (regulators) for USB (PHY) which are used to detect
ID/VBUS/DP/DM/RX signal. If the platform doesn't need USB wakeup capabiliti=
es
for system suspend, it could turn off related powers. Besides, it could tel=
l
the system if USB interrupt can be the wakeup interrupt.

>=20
> > > > I am curious how PCI USB at PC determine whether it responds USB wa=
keup events or not?
> > > > At Linux kernel or BIOS? It has two places for enabling USB wakeup,=
 one for USB devices
> > > > (including roothub), another is for PCI device?
> > >=20
> > > PCI devices send wakeup requests via a special PCI power management=20
> > > signal called PME -- you can see its state in the output from "lspci=
=20
> > > -vv" in the Power Management Capability section.  In legacy systems t=
his=20
> > > signal was handled by the BIOS, but nowadays the PCI and ACPI subsyst=
ems=20
> > > in the Linux kernel handle it.
> > >=20
> > > If a PCI host controller is in the D3 low-power state when a wakeup=20
> > > event occurs, it uses the PME# signal to request a wakeup.  If it is =
in=20
> > > the D0 full-power state when a wakeup event occurs, it uses its norma=
l=20
> > > IRQ signal to tell the system about the event.
> > >=20
> >=20
> > If the USBCMD.RS is cleared, does the interrupt could still occur when
> > the system is at D0, or this interrupt is not USB interrupt, it is a
> > PCI interrupt?
>=20
> I don't remember the details offhand.  I think pretty much the same=20
> events are generated regardless of whether USBCMD.RS is set or clear. =20
>=20
> Anyway, when one of these events occurs, it causes an interrupt flag to=20
> be set in the hardware.  If the controller is in D0 then it will raise a=
=20
> PCI IRQ whenever the interrupt flag is set (and not masked).  If the=20
> controller is in D3 then it is not allowed to raise a PCI IRQ, so it=20
> asserts the PCI PME signal instead.
>=20
> I'm not sure what you mean by "USB interrupt".  The USB protocol doesn't=
=20
> have interrupts.  (It has interrupt URBs, but those are completely=20
> different things as you know.)  The closest thing USB has to an=20
> interrupt is a wakeup request.
>=20

The "USB interrupt" I mean here is the interrupt event triggered by core
part of the USB controller, for example the interrupt at usbsts for EHCI.

--=20

Thanks,
Peter Chen=
