Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEF621499C
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 04:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgGECMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 22:12:53 -0400
Received: from mail-eopbgr10043.outbound.protection.outlook.com ([40.107.1.43]:34510
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728039AbgGECMw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Jul 2020 22:12:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7qQlcZy+6dFbwaAS3ptpWi+CZgcdB4ReXDwms/yKXDj5iFeKYHca5AJEbfl1NohaR9xWDL008zl8NLOyv3NoYxSM7A4Wa+6Whh9sLmW13mV7y1p/6MlU/CxVuq/I88IwN/s4seA7AvA/GzA8nl4lsNKk4NypD3ed8OLinVmidegOpIv0ldk/5ceNZmoXcllvD0h+tt7piXjLvsZEm4yqROFbRQD5SANUy9VL6tH/axOphG2hBdvBCFp5H0F7pfNK4JfbGoNTXbKUtcVaEW7tSaIJKvbHob6pK2QUu0M1nG1LzuHKtfA3j5w5fvEp4sh9EuTpkGxSXzF9lhIsU44AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6fHyz5V2jQZCt6uISunkF2Y0gvedRVH//iPfIKo9D8=;
 b=EZ+K5ANGvozfLnv97JAKwgtHuxWbbimTyma9BA10STqt4/dQ6YW5TNKNOWuRdDyuV/kfFjyoAPcNb3KsIYECKk/THINb2iXFPnD+fPqBCpKKxQl9Dct6v6NdrrV8xjSlK/CwhZZFJviKuHd5Hpj1CUOVpLbtAJ+00p7e1f4OtSX95RtJUDa8qm9WrqxwKEhPIxrKNcV8piqhE+CWh5Xxp8Fa59GFdRkqUCDyu612uQCcEGzGHHIp36M61D6Csqd6UPrpLbU90jCa/xy0wcukRq5PABtIjjyFGTTzfeg64Ehl8ANOKpSANE4H8tFyalmm3M8J/+XXvYwblcURsgB2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6fHyz5V2jQZCt6uISunkF2Y0gvedRVH//iPfIKo9D8=;
 b=Eb8zmEFIwvEM+W0E7y1DjMfv7Hd007Ww+ODiwUvd2U9mJGWx5azknIYEHrbk6buCcZUdMlsj/ywwUj2yNO8+v90Eq+pz2MkVrvbuNDSXiyDbjMvFJV9StWo+kfD7KywXQBh94GIPflMXUQaKkgqlqSY7O9Smc41s91u59fts/rg=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Sun, 5 Jul
 2020 02:12:47 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 02:12:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sA
Date:   Sun, 5 Jul 2020 02:12:47 +0000
Message-ID: <20200705021256.GA29527@b29397-desktop>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
 <20200703141911.GA623139@rowland.harvard.edu>
 <20200704092255.GA5695@b29397-desktop>
 <20200704144816.GA650205@rowland.harvard.edu>
In-Reply-To: <20200704144816.GA650205@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: af24c883-f0b6-4135-db82-08d82088e95a
x-ms-traffictypediagnostic: AM6PR04MB5911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5911A4FC6958B33AB45458168B680@AM6PR04MB5911.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 045584D28C
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U7ltvWNT92z4oapdmFVbyMF3ROqBvhh9bmRiOsDQpyEaINNmznpVbHAS1blvjS/t8hFq1hS/hM+mOmkmqsHFqUr9KkhEjc7+9OR0rk0Cp46rtBOVaWiY1y8tWf55QpMLti1X290IXrg20aeDJJxo5LNabkhRIcDT+XH7iHbIJsqIppcxXCkOY01LfvWh58Cd7Oz/V6PI7za+96ZMRN27Gm49OzX4U1FzwzdNjMTAGWSXbmYP43eyGj5jQNBQZtbeLLROFbXxYo1gDvBott/hi42lMSVfE0hvMwC+TaRk13mCV0SbgBup+uOs/8eDPGUM+5ZUINEpTlJlzsIKxoACwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(76116006)(66446008)(6486002)(64756008)(1076003)(66476007)(66946007)(91956017)(66556008)(4326008)(6506007)(53546011)(2906002)(6916009)(33716001)(186003)(26005)(33656002)(5660300002)(83380400001)(8936002)(478600001)(44832011)(8676002)(316002)(6512007)(9686003)(54906003)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JZu7FIQxbgSe5QGXlXV2j1urgZaIYwC6Bv1j/sazXXNA3WeLaLmNKX6+LKf+7p0V/yG88RsBZ5Os1uZCX+08I/I+ci6DK0kY4Lxf6KET8+cq0DdH4XzA6Yenhzmu733bJd0EIavY6kz4qHQFS9fAzgQFdI94b1b/LVEgMUuqNghW1fmu59xhC+Dhm4+BeeHB8VolI+cpGYDP2bOanBsYUYl1FAXYfa8NqSpIAiYfTetxn+qiUb4gw3GZ6C131FhiJAroA06VxxkcOQsP3fS6q1whgjWvZRcobdpjCpDANi+XBgPqB5OIUcUARfOCE/t5i6vJHnkU47nzAOD1VfaF5iftHT+WhP/EWIs6u4aH7NCAzie6hs+2UY46h9ZgkdMd0VOlf89ZyI0WDu+tqA2jx+IzhXEL7ndcUg9uxTwUW+zjNHvnlutnSlPwFD1dWnjeDxOwRA2j7Ewhp7FnLwewVEdxhWlQMVGVKgVkN/AjxJ8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F4E252E855CF045975C398224BD4FF1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af24c883-f0b6-4135-db82-08d82088e95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2020 02:12:47.4397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Vfg98teg3sET2+utku07YwKMYgQolXoXI4/2pRmJmHEEuwO2gqUXAy+0Aqt1uCo/ODqvO2NskjqbyTBaC/2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-04 10:48:16, Alan Stern wrote:
> On Sat, Jul 04, 2020 at 09:22:45AM +0000, Peter Chen wrote:
> > On 20-07-03 10:19:11, Alan Stern wrote:
> > > On Fri, Jul 03, 2020 at 02:25:32PM +0800, Peter Chen wrote:
> > > > After that, the user could enable controller as wakeup source
> > > > for system suspend through /sys entry.
> > > >=20
> > > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > > ---
> > > >  drivers/usb/host/xhci-plat.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-p=
lat.c
> > > > index cebe24ec80a5..bb5d73f0a796 100644
> > > > --- a/drivers/usb/host/xhci-plat.c
> > > > +++ b/drivers/usb/host/xhci-plat.c
> > > > @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_devi=
ce *pdev)
> > > >  		*priv =3D *priv_match;
> > > >  	}
> > > > =20
> > > > -	device_wakeup_enable(hcd->self.controller);
> > > > +	device_set_wakeup_capable(hcd->self.controller, true);
> > >=20
> > >=20
> > > In fact both this patch and the original code are wrong.  It really s=
hould=20
> > > be:
> > >=20
> > > 	device_init_wakeup(hcd->self.controller, true);
> > >=20
> > > This will add the wakeup entry in sysfs and set it to Enabled.  This =
is=20
> > > the appropriate behavior, as explained in the kerneldoc for=20
> > > device_init_wakeup().  The reason is because the controller device do=
esn't=20
> > > create any wakeup events on its own; it merely relays wakeup requests=
 from=20
> > > descendant devices (root hubs or USB devices).
> >=20
> > Hi Alan,
> >=20
> > At xhci-plat.c's system suspend API xhci_plat_suspend, it depends on
> > power/wakeup value to determine whether the controller should enable
> > port wakeup capabilities, and from the system level, whether the system
> > supports USB wakeup or not is better to be determined by user, and is
> > disabled by default.
> >=20
> > Yes, you are right. The wakeup events are from controller's descendant
> > devices, and it is better to use roothub's wakeup capability to control
> > portsc's wakeup setting. At controller driver, the meaning for wakeup
> > setting is enabling wakeup interrupt for hardware signal events (dp/dm =
for USB2,
> > and RX-detect for USB3), this hardware logic is the glue layer and
> > designed by each vendors, without this logic, the USB controller can't
> > be woken up due to the USBCMD.RS bit is cleared, and there is no
> > standard EHCI or xHCI interrupt. The controller's wakeup setting is
> > better to be disabled by default, and decided by user too.
> >=20
> > For me, either this patch or use roothub's wakeup capability to
> > control portsc wakeup setting, both are OK. Mathias, what's your
> > opinion?
>=20
> Mathias is starting a long vacation, so he might not reply for a while.
>=20
> Note that hcd-pci.c, ohci-platform.c, and ehci-platform.c all call=20
> device_wakeup_enable().  This indicates that xhci-plat.c should do the=20
> same -- presumably device_set_wakeup_capable() is already called somewher=
e=20
> in the platform-specific code.
>=20

Thanks for the information, Alan.

I could not understand why device_wakeup_enable is used in these device
drivers? At Documentation/driver-api/pm/devices.rst, L189, it also says:

	during a system sleep transition.  Device drivers, however, are
       	not expected to call :c:func:`device_set_wakeup_enable()` directly
       	in any case.

--=20

Thanks,
Peter Chen=
