Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C88E26F4CA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 05:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgIRDmp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 23:42:45 -0400
Received: from mail-eopbgr50050.outbound.protection.outlook.com ([40.107.5.50]:13218
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726306AbgIRDmo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 23:42:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqmiAhNCj9A47hbQN9LgHJIuplSF3E24aZhhMYX3OcQgdhENulPpb/LLeFvCSNcaYsp8cJLnb7ReDavPUJyd0o78cFX/Z2N8+RIqKzzolbh3Mz8+ac318H+o1mWoNDrvIIpjHUc+902wjfAmEWDR2lwlK+7reQmhmw/uhpef7EumqomS7HXgqsjJJNSEuHFDTPt0SZVOtGb1Sh7np8V/w8XgMDQG2ayZ0MESv13VqttizFF0fDV7DxhHBLq+m9trDGZGlAtaeEsol8aEWcCff8Dqk4AcASoN0qLTIF+Gv81z/kzMnyvuO2+OnlAgT6Xrk1rWn4xkU62adhoXKRsDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGR1c87Rk9xknO1pEwG0iS+HXpWE4AUi/XCau1CKkMQ=;
 b=JwBv5rBth1u7q+MWsUjfImFyaxaP/FnF6P7JhVJPgAVqjz5xL6XkzQqrmEuXuvSzejVTpu8v+1EnU8XnjSuASpagCcUTZOpDeHdHsAqIyxI/M6L7fhEKRep34Uo78h2Xnu7VT4AvaSh+t0KWc5syebTrPgYI/k66/NC33fs/gk0/xLQL0m3wrchlmVhuh6brithn7jrOVYPZjxfQnR1BrlAvUv83dM4rGGLdcCxcTr9xLrkGT1AKrk538KzbSUBG9K3NvUFN1LNdcMFyCwEMSDPSbS6IU1EQtK4Gz9B6gBSw3qlxd0pETYcYwlE2DLfTk4/wsUXDJwaq/4aJG6Owbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGR1c87Rk9xknO1pEwG0iS+HXpWE4AUi/XCau1CKkMQ=;
 b=Kj4Gv8O51MWjTkuRTRdu2q/ReCLmUCEe3DwavjC22LVNMqYmbOJ/wv8M5qeWVi2isNEz4mgv6qgze8qZtsbgdHjr0uyz/0fjOi5acLuFUoeCOOb6BKf0SXhT3KYiAjxmAgyBZASJnrpoYpJ8PPyxJkVGAxTrYYPyD3EmBATCtoE=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB6517.eurprd04.prod.outlook.com (2603:10a6:20b:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Fri, 18 Sep
 2020 03:42:41 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 03:42:41 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Enabling Device DWC3 Device Mode
Thread-Topic: Enabling Device DWC3 Device Mode
Thread-Index: AQHWjU7JiBHQvCKfrkqZwjWYHFt6aqltlBoQgAAjIQCAAAMm8A==
Date:   Fri, 18 Sep 2020 03:42:41 +0000
Message-ID: <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
In-Reply-To: <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9f32e952-e3c9-4b63-2ec0-08d85b84e531
x-ms-traffictypediagnostic: AM6PR04MB6517:
x-microsoft-antispam-prvs: <AM6PR04MB65173C85ED5A66A9BE4B83C3F13F0@AM6PR04MB6517.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CAM8gmltdhM5HUka1iHNSkwQAmwXTrhRhKMF5LLJe3Li9SrQfW/zohv9N7g/no684IQ8ufx1GrAOsk3qcA8BlVTNA+oPopwsuzfqAkJh2+UWv5kqXZKWXkmmebnLYlWCCbSk28QwrJqZTczx86UNUvxPWr0vbMDY4gxwqmCv1omld6OyRY8jUR/zvyDY65Z93vRsF12lV7J9hZOUeywirLhIE+yBvo4nn5HA95jVpkA7xJgXYnxpAxFIK6K1de5p39z1GyhiTl66NFXWyEDh7qnNnRcma+T1UtC1YCMbEI4kxD5giif4Q66LLqf8FWUX1nPk6Qx5vfQ08EdAB36ycA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(6506007)(33656002)(478600001)(53546011)(52536014)(83380400001)(8936002)(55016002)(316002)(186003)(5660300002)(8676002)(86362001)(66946007)(66446008)(64756008)(66476007)(2906002)(76116006)(66556008)(6916009)(26005)(71200400001)(7696005)(9686003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JoKoHMDLvSSiQdEBt/tKs0/Vobn2B3kaPpBr7GBfCCapHKhhBTG1UlEj39gKpSMFcH0mQEW6bKcr6tbii7/CorwsN2jrxKNQEpp22ANa12uWqPd8FcnZZtP9RgwH134ujfzIS8zEZ2QKkGjxK/dKffH5OJthGl03abqw5uxvaEar1psTgYXPRdS/I/4I/EsKxyL7VqA0UCs9y++DjaTj6qqQOZPoOQ+lD6y1P+KMg6sVzSFRLuxUtxQGF5m+A3k4WfX4KvaChlN43P2zDTqcaAA5BQVOWEspq1ffB2x59ueBokHMBRRJc5QmQw+H6OnwNAEXhBHeOwG0s2YwR6iJeNzsmXuQC7FtjZujUloRRVOPVNJVNNjV4JKzGj4qravwKKkOqqPEXopGw+IFSJVGS+sNo/VWAis+q7rlk5ctYLUMBBF0Rflf3wVmciJOv9HRBIj9DXBg4pSSzLzsJMYw8n2ifniVa4H66HmI1GE7vlcUP431NnPbd7swFz1CiNpcIjYe8gAFLov5++FEmcQu2T0co/8Fxh9Vyseh2iCCdTw7KZnRV3zjcDp9yAq5tEs26UZ8pH0B9s6S8xQO9k4JpFDiMAiSGztjXmIPMka4MIRNETuUjuXtj6NtF5SA0IFxab3lMp240yMbYyN7T63KDQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f32e952-e3c9-4b63-2ec0-08d85b84e531
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 03:42:41.0612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAdevMbiGQWCuogFLTCLX4+fZ4U1jeT57qUAma/ipBBigF/tA4SoEbtPOvccSAtfd7OL5pe+9qi6u4Fxp/41fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6517
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid,

> -----Original Message-----
> From: Sid Spry <sid@aeam.us>
> Sent: Friday, September 18, 2020 11:08 AM
> To: Ran Wang <ran.wang_1@nxp.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: Enabling Device DWC3 Device Mode
>=20
> Thanks Ran. I took a look at the document, if you or anyone else can weig=
h in
> I'd appreciate it. The platform devices seem to be active, see below.

<snip>

>
>=20
> Thanks for the pointer. Around line 771 is what I expected to see for my =
board.
> However, in arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi (I have th=
e
> v2
> board) the USB related entries I see are:
>=20
> &usbdrd3_0 {
>         status =3D "okay";
> };
>=20
> &usbdrd_dwc3_0 {
>         status =3D "okay";
>         dr_mode =3D "otg";
> };
>=20
> &usbdrd3_1 {
>         status =3D "okay";
> };
>=20
> &usbdrd_dwc3_1 {
>         status =3D "okay";
>         dr_mode =3D "host";
> };

So you want to use 'otg' or 'preripheral'? The SW flows is a little bit dif=
ferent (in dwc3/core.c)
If you want otg, I guess module solution would not be good. But I have no i=
dea how to enable
mass storage gadget in build-in way, to be honest. So you could try etherne=
t gadget which
doesn't require passing parameters, it works on my part.

> Starting at line 767. It's a lot sparser, but the dr_mode is there. I fee=
l I should
> note that despite the lack of devices in /sys/class/udc I have nodes in
> /sys/bus/platform/drivers/dwc3:
>=20
> # ls /sys/bus/platform/drivers/dwc3
> bind  fe800000.usb  fe900000.usb  module  uevent  unbind
>=20
> > One of the example in DTS is
> > arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > and arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts, and you need to
> > manually update it by following above doc to enable device mode.
> >
>=20
> The document linked is relevant beginning page 445. The above dts setting=
s
> seem appropriate and I have the necessary kernel configuration enabled. A=
ny
> relevant drivers are modules.
>=20
> I'm not really sure how to diagnose it from here. Any help is appreciated=
.

Parsing property 'dr_mode' is the key to control driver logic path.

I think you could begin with drivers/usb/dwc3/core.c, see what happen in dw=
c3_core_init_mode()
which handling role switching (host/peripheral/otg) in calling dwc3_probe()
if you have made sure all kernel configuration had been done correctly, suc=
h as (ethernet gadget):
CONFIG_USB_DWC3=3Dy
CONFIG_USB_DWC3_DUAL_ROLE=3Dy
CONFIG_USB_GADGET=3Dy
CONFIG_USB_CONFIGFS=3Dy
CONFIG_USB_ETH=3Dy

With dr_mode=3Dperipheral (or otg), it should work (if above dwc3_probe() e=
ncountered no error).

> Thanks in advance!

Welcome

Regards,
Ran

