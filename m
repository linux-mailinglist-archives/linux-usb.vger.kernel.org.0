Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464072197B9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 07:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgGIFPc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 01:15:32 -0400
Received: from mail-eopbgr10059.outbound.protection.outlook.com ([40.107.1.59]:57191
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgGIFPb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 01:15:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkXkA3D+zHsl9UX5ZkEJAhYGOlRriA2Fyg16xUXbosMVdu871CanA+pGEi5Dcje+wHUDdtzNAa43l6Gd1/yvYKoebZ01qQWCW4R957BTeIP7Ap7kRzHUahzrXni1hkz3q+TMTeNQjL7LOSd1791RicVxQcjEkRaeX/+VojP8QPW9yls2Td8qExhRH3BPcLLsioGoIulqRdXvt/liviZohG4iMOO9hJmWEJyP4zRpn0HPwdZXgY01N6Qu2nI1m3SnVOJaVKcJGOcrtBv3s81T1NeV4qv2M0wYk5R0vWXv2UEBv9pYuWSYQ9+7N3/xkeOJurGD5Y5nyz9poPvX9azoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZAmpFbAqNcKWv0UCgIFg3CG2/4Dycq2adFm8YqRWag=;
 b=bPqeDwVmJI8sfAydK7nv88QU+sh/rVjgkDXkiCv2i18d5oQCY/Mf61IyC25RIIhn4smuZ7dUhPBO7vZt+NEu67DVEcEe/rlCHWGGtTTHmyMcPPxixf37iFBwgu5O1FIWhQiz36vKgdFvWBY/Nbm0qLPtoMkVI6pU7xwFYKLq0l1ZSQWdAIdeRoXFebRx05Lt/0T1Vvq99HQFdmtWTeBnMT+3X1dQ0Qf0FVNULYLMaT7EqPcbgcENCzgTaZWeD1BQXvwgvorGEoNVbtd3MoPnl3l36qZH06XFo/2C6NauCBZ2NHsCcLOwjaUb9TZ6LrbdktyuaGU1sXEfx46CZUXssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZAmpFbAqNcKWv0UCgIFg3CG2/4Dycq2adFm8YqRWag=;
 b=RMooYyer2WYt9d15c26LOwWSD7hajVgc0ZJPoAzkatZ/yxDX9D1uwyRHPXsA/L49DX3N9JXHDjgKy0gP1Y01KWWIprKEiWbuIeaYWeWK4RboHK8eScHKPkWb7YPJofntSiiX3/mntYWqEHk6xveEX7+PmyH8wkHh+hy4EFDJXRA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM6PR04MB6150.eurprd04.prod.outlook.com (20.179.18.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24; Thu, 9 Jul 2020 05:15:26 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 05:15:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sAgADOc4CAANPw0IAA3ViAgAChxYCAAO2QgIAA9LEAgACKIgCAAO53AA==
Date:   Thu, 9 Jul 2020 05:15:25 +0000
Message-ID: <20200709051534.GA17510@b29397-desktop>
References: <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
 <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
 <20200707161153.GB740256@rowland.harvard.edu>
 <20200708064740.GA18440@b29397-desktop>
 <20200708150204.GC776368@rowland.harvard.edu>
In-Reply-To: <20200708150204.GC776368@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 886af9d2-ebd7-45ae-e0ba-08d823c716c2
x-ms-traffictypediagnostic: AM6PR04MB6150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB61505196D7AAF26D0DC11F0A8B640@AM6PR04MB6150.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04599F3534
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7oSvR7QoS54B+fBBTXJiviRmh+cnHWbl7EOhqqGn67hvCX9nEr/8uO65g76A7fqqLC3lwyhakpkZr0KGLvfIwRhZPn5EDHsKLIMfVYj5vI+zj23iRTQoipB1/A/7PoIwhhoNYZCtXQ5OBKJK09x/KU5Gl/MWXkP1jnGHl/i/DuMOwjH4OIkT6D+Ijyiiq5hDOgneeru6ZkW3CerMLOUKHrkE3BTqRMaDx8g2MZPk/U9H2p6DzaDjSJ23l52G3tLIo85MCx/xP1/4J/d+YqALqY+uwToWYn5tWYLFK1DT/RIj8eXnSgTtN4+9adkI85UCpiOPTvvpSR4twkcUu1TaMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(396003)(376002)(366004)(136003)(346002)(33716001)(316002)(54906003)(8676002)(9686003)(86362001)(6506007)(6916009)(33656002)(5660300002)(53546011)(83380400001)(26005)(6486002)(66446008)(66556008)(478600001)(6512007)(44832011)(64756008)(2906002)(66946007)(66476007)(71200400001)(76116006)(8936002)(91956017)(4326008)(1076003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ip3HXOmgAdekhYB3H8El4/5yVykB1PDS2N6bEn1mvq082nA5CKYCtTPbD3cO0YZPpIeE/Z/b1Pz6tTM2Nx8NHsm6DwANx5dAVCtJ2iclt2dBsrY8h5n3DvELBC0PObpCM8EbB11NY6PqcH4q5RjcppVVfp3GKkXq5dhfYvlNbwWwRgDKoSdEuDShCuC58vVvSg+w1WNearKfA0bz3oXvx15ft5TaYjMsLAP5QvGBjzpAIU7IMijb4EzBCj/i95etaKe1TPrdGrAU/bCGFTWYqc2qN/vRVYIDMXf7nNp9JF2411JzKWgetyjPK2RhNYnpnWGEiRPH2fncXP/IUX26mFZrSjXcvkwBdmHbLhmeL5p+02Qq1kQWoQ0fc0rLOE6z7iXsDxsTX1mv2CAlFEFJG17CJN9mDpyRgz+6aOegSdtZG4+CTXWett+AtQHqeySFHdTzdzVrKyBB3xzMu/CQtCUa3K5AG5lYW4v6+xteoaM=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8F9D1254F03AD4B969E4963B6ECB623@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886af9d2-ebd7-45ae-e0ba-08d823c716c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 05:15:25.9741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ywdvpKxbGV1aSnsgFiwvYuACVfkVivmIFuTbD7vrFT8SIGHnwNH6biCP+0QdhWiYYpq910F62XLr9VIn+XEHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6150
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-08 11:02:04, Alan Stern wrote:
> On Wed, Jul 08, 2020 at 06:47:31AM +0000, Peter Chen wrote:
> > On 20-07-07 12:11:53, Alan Stern wrote:
>=20
> > > > But, that's not all the use cases. There are still two other use ca=
ses:
> > > > (Taking xhci-plat.c as an example):
> > > > - It is a platform bus device created by platform bus driver
> > > > - It is a platform bus device created by glue layer parents
> > > > (eg, dwc3/cdns3), usually, it is dual-role controller.
> > >=20
> > > In these cases there would be a choice: xhci-plat.c could call=20
> > > device_init_wakeup, or the platform-bus/glue-layer driver could call=
=20
> > > device_set_wakeup_capable and xhci-plat.c could continue to call=20
> > > device_enable_wakeup.
> >=20
> > You said "the PCI core calls device_set_wakeup_capable() when a new dev=
ice is
> > discovered and register", why PCI core does this, is every device on
> > PCI bus wakeup capable?
>=20
> Sorry, I should have said that the PCI core does this for all devices=20
> that are able to generate wakeup requests.  This ability is indicated by=
=20
> a PCI capability setting, which the PCI core can read.
>=20
> > The reason I ask this is not every device on platform-bus is wakeup
> > capable, to let the controller device have defaulted "enabled" value,
> > we need to use device_init_wakeup at xhci-plat.c
>=20
> Yes.  In your case it makes sense for the glue layer or platform code to=
=20
> call device_set_wakeup_capable for the appropriate devices.  Then the=20
> generic code can call device_enable_wakeup (which doesn't do anything=20
> if the device isn't wakeup-capable).
>=20

Yes, in my case, I could do it. But xhci-plat.c is generic code, some
controller devices using this driver are created by generic platform
bus driver. So I think we should use device_init_wakeup(dev, true) like
you suggested at the first, this driver should not be used by PCI USB
controller, so no effect on PCI USB, right?

> >=20
> > From hardware level:
> > Controller includes core part and non-core part, core part is usually
> > designed by IP vendor, non-core part is usually designed by each SoC
> > vendors. Wakeup handling is part of non-core. The USB PHY gets
> > ID/VBUS/DP/DM/RX change events, the related signal ties to non-core par=
t,
> > and non-core part knows the wakeup occurs.
> >=20
> > From software level:
> > Taking single role controller as example:
> > Glue layer is a platform device, and handles non-core part events,
> > including wakeup events, it is the parent of common layer which handles
> > core part events (eg, xhci-plat.c)
>=20
> Can you give an example of how these different layers show up in sysfs=20
> (the device names and paths)?

Our platforms are more complicated than this example, there are dual-role
controllers (chipidea/cdns3/dwc3) at SoCs. Taking cdns3 as an example:

/sys/bus/platform/devices/: the devices on the platform bus
5b110000.usb3: non-core part (cdns3/cdns3-imx.c)
5b130000.cdns3: the dual-role core part (cdns3/core.c)
xhci-hcd.1.auto: the host core part (xhci-plat.c)
usb1/usb2: roothubs for USB2 and USB3

root@imx8qmmek:~# cat /sys/bus/platform/devices/5b110000.usb3/
5b130000.cdns3/  driver_override  power/           uevent
consumers        modalias         subsystem/      =20
driver/          of_node/         suppliers       =20
root@imx8qmmek:~# cat /sys/bus/platform/devices/5b110000.usb3/5b130000.cdns=
3/
consumers        modalias         power/           uevent
driver/          of_node/         subsystem/       usb_role/
driver_override  pools            suppliers        xhci-hcd.1.auto/
root@imx8qmmek:~# cat /sys/bus/platform/devices/5b110000.usb3/5b130000.cdns=
3/xhci-hcd.1.auto/
consumers        modalias         suppliers        usb2/
driver/          power/           uevent          =20
driver_override  subsystem/       usb1/           =20

>=20
> > So, one controller includes two platform devices, one for glue layer,
> > one for common layer.
>=20
> Is there a mechanism that allows the xhci-hcd core driver to tell the=20
> non-core or PHY driver to enable or disable these wakeup events?
>=20

Not easy, see my comments below.

> Or maybe better would be a way for the non-core/PHY driver to examine=20
> the root hub's usb_device structure to see whether these wakeup events=20
> should be enabled.
>=20
> > You are right, ID/VBUS/DP/DM/RX signal changing occurs at the USB bus,
> > and detected by USB PHY physically.
> >   =20
> > The controller device (core part) or glue layer device
> > (non-core part)'s wakeup setting is only used to enable/disable platfor=
m
> > related powers (regulators) for USB (PHY) which are used to detect
> > ID/VBUS/DP/DM/RX signal. If the platform doesn't need USB wakeup capabi=
lities
> > for system suspend, it could turn off related powers. Besides, it could=
 tell
> > the system if USB interrupt can be the wakeup interrupt.
>=20
> We want to make the system simple and logical for users, not necessarily=
=20
> easy for hardware engineers.  This means that wakeup events such as port=
=20
> connect, disconnect, and so on should be controlled by a single sysfs=20
> setting, for a single device.  The most logical device for this purpose=20
> is the root hub, as I mentioned earlier in this discussion.
>=20
> As a result, the wakeup settings for the other components (non-core or=20
> PHY) should be based on the settings for the root hub.  If the root hub=20
> is disabled for wakeup then the non-core hardware components shouldn't=20
> generate any wakeup requests, no matter what their power/wakeup files=20
> contain.  And if the root hub is enabled for wakeup then the non-core=20
> hardware components should generate these requests, unless their own
> power/wakeup settings prevent them from doing so.
>=20
> From these conclusions, it logically follows that the default wakeup=20
> setting for the non-core components should be "enabled" -- unless those=20
> components are physically incapable of waking up the system.
>=20

I agree with you that the default wakeup setting of core part for host
(xhci-plat.c) should be "enabled", but if for the dual-role controller,
the wakeup events like VBUS and ID do not related with roothub, we can't
set core part for controller (cdns3/core.c) for defaulted enabled, and
there is no thing like gadget bus's wakeup setting we could depend on.

Besides, the non-core part (glue layer) somethings can't visit core
part, we had to depend on itself wakeup setting, but not the child's
wakeup setting.

--=20

Thanks,
Peter Chen=
