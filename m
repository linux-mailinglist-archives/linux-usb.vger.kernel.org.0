Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3421D1D42B5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 03:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgEOBFw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 21:05:52 -0400
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:33153
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgEOBFv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 21:05:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaKuU5Z/0OlioxojlurR7qBnB0Jso68l5IyDWCHvWk1y6HotIQqxcj77xu7oqNFN4zwxzyL58UQ6afO6POvIX4IegsyWJPKQwHym7t3EVGDWg+cXuEiH0WjrmAlNuHCNuN1GCpEJnjRWgMNQv4Ywl81mLCMh20T4WkEWN2yzZN7Fa8oU+Uz1faqnAtRaHNkBLSuydvbMt1wJ99WF2WtTqPz+I3t9u388qdoD9na6L8L8dn0ptFFv48M1m9AhVBWuUAq5Veo1lNhQ3Cl1SmWB7ezvJCj2lVyWxvByigNpQRBmQ/MaKV+AbcPQlXBConzJ6zi7pDlvr12vsROWtIy+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGJaOiZAFsguFLuUXCoJvCq8uZP4EEi2UPyeJN2S5yo=;
 b=YkkGEHKBp+wNH445z78pGTbZrFPJREvSXlSaVy8+olY3vCUGFhgjfqg1EuxGjtGZ8LJd3cQdbFuW49FuVuPqHOQHLXYNuXasKXZNjLWh3+teGUwBEm1kgQ+7aoWZJgXq+WtVfbUFCxfRXxICAl1MbfnoRlRNXtHtWvmK99p83KLfpWjYraEBcT0UuHci60VliY4t1o07NONiToGJAAkfixxnbHC5PdUBlkHoM2ESUUqKQwL7zz5j2+iXthWF4HjUoQXqwp7/hhZYFcR30/WcfluAdLOQnanfolsib8dXWqWkXsAdyThyksYfC4B9zK56J4YyxdmVuvc0ChiWvOeU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGJaOiZAFsguFLuUXCoJvCq8uZP4EEi2UPyeJN2S5yo=;
 b=LfwVqg8cvAThyLmF2MASN5kV24In9He/VckiuYj+ktnSO4jhqaxPRAMhDgqXS/X56TcSvHzBuwU5QpiH6wSBHf1zQXGuw04AmdlWsXTJ+yxJS0c3XarADbLqcg8Rhrw+RVnm/TY7eTCgvC9q5isX8jKKujXE5oK+6JmX8eFiEa0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7143.eurprd04.prod.outlook.com (2603:10a6:20b:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 01:05:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 01:05:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sid Spry <sid@aeam.us>, Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Documentation for Raw USB ConfigFS
Thread-Topic: Documentation for Raw USB ConfigFS
Thread-Index: AQHWHxIE3BZgWTm6XUiOBTDqqvXTpqia0EkAgAnRnwCAARJFgIAAKfQAgAH+RoCAAIp4IA==
Date:   Fri, 15 May 2020 01:05:47 +0000
Message-ID: <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
In-Reply-To: <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.171.74.255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe49dc73-c61d-46f2-90be-08d7f86c1a88
x-ms-traffictypediagnostic: AM7PR04MB7143:
x-microsoft-antispam-prvs: <AM7PR04MB71433C076DCAF65413F189208BBD0@AM7PR04MB7143.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +SP+qpgAZGjrGHJai2OgrPoef69p6Wk2zpdnBaPcYQR9vIb/E8H9LwSz1/p5mxVL2pqjyvOGnGj8kscZCFna3v99Wa1bTS1BhhDqLpZ2r63A3eOWj+kfVYiuaq8+Kcvos8E69WCo5y2jDRXJshlj6VyrxkeLGfO95g3YJRdYNHCAQPPeMLS/ytieUfdg2CcGYeY0HISF06N5Elmr8LUA0VWE6m94aX+yo7RURgRJ3SZU2GdrLTAl3sPrFMfQOrcP9ki/oqvtXrHkvRlFAXPp6RDLwSARCrfADW3xnHsU+6cf9TtBLMDdoRV9bHIFhShPFin/nAa0rdPJrReRjm60f6bUN+vB5D1oDEK1h1y0EXFiYMl5WASwqEh6FY/8MKpV8UtOlmWufD+p5YH6YADlu7x3F5duumfGQpkEnPZJhyKYo2sXpbxX3jgsRB1hGr2G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(86362001)(9686003)(33656002)(71200400001)(55016002)(4326008)(2906002)(5660300002)(316002)(478600001)(8936002)(8676002)(66556008)(66446008)(6506007)(26005)(7696005)(44832011)(186003)(76116006)(110136005)(66946007)(52536014)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dHFWiTCWfDhJ1R8eV+DixF5FHIXw2tOuHCmHHZf+R4gL5LEZldzeyWmjvdMhcAQrP49hj6d2r9+rUqE/F5cQy4OOj7qzo7TvSQLkB67CtIedEvy17shelkZ8uH2VsI/F6aS8v+IoIpM8mu5gHF4pAbtiY727zhs0NEM/+zrhrNdqslOsMd8wXnrA6tbcUdWmkCCjps9pUNqywKpo/p2BOTegEr9Tc0OzIdrsNbLms19lleEa1ZrTAkprI7QevIJHwWI8FzOkhk8V7eAt4Hypyf2SkwK/rNr7gdl2uC1Xo+mZtPBns1F5PHup4HdOhqfyCmWOdLPISgrHL8hZO2QG4gLEUmDTF2fruRJowb295Gp/V1gQxOL5RxwIZMQ691UD3gNbx6lyJd4vqnIBOL0gmjwlmIZ2YkfwJOIkjOK4D712+aNzFdzkfPVVhDN28K2JXxOQsPSDS/6BrfKOOUjClMVWYuC66HID3FNhzhnDV61AFGSye0KYOx6JeMTs+cwS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe49dc73-c61d-46f2-90be-08d7f86c1a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 01:05:48.0970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQDDGYlwLf8gkoB6YxJgiT5XTvQUa2pC7/j2xPdS0ybXk1cn2HVYMiV1rCKTO+umdZnnfRq97I7MfyYNW5gjgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7143
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >
> > Would you please let ECM gadget work first at your board, then let
> > f_fs work using test application (you need to compile both host and
> > device application for it). After that, you may have more precise
> > concept for Linux USB gadget framework.
> >
>=20
> I don't see anything that harmonizes preexsting function usage with speci=
fying
> custom endpoints.
>=20
> I've gotten the ECM gadget, and then the ECM gadget via ffs working. I've=
 read
> through the ffs test but I don't see any way to assign functionality to t=
he endpoints.
> The example seems to transport raw data via a bulk endpoint. I know enoug=
h to
> instead assign an isochronous endpoint to the UDC and transfer via that, =
but I don't
> want it to be the *only* functionality the device offers.
>=20
> Are you saying I can assign the ECM gadget via ffs and then add another d=
river
> after the fact?=20

ffs (f_fs.c) is used for customized function, other functions, like ECM (f_=
ecm.c)
and Mass Storage (f_mass_storage.c) are used for certain function. You coul=
d
use configfs (like you have done below) to put customized function and cert=
ain functions
into one configuration, and let the host see them at the same time. Do your
real requirement is one customized function and one ECM function in one USB=
 gadget?
If it is, below is the example to combine f_fs, mass_storage, and NCM toget=
her.

cd /sys/kernel/config/usb_gadget
cd g1
echo "0x1d6b" > idVendor
echo "0x0105" > idProduct
mkdir /dev/usb-ffs
mkdir functions/ffs.usb
mount -t functionfs usb /dev/usb-ffs
ln -s functions/ffs.usb configs/c.1
/home/root/usb_test/ffs_test/ffs-test & /* your own test application */
while [ ! -e /dev/usb-ffs/ep1 ]
do
        echo "."
        sleep 1;
done
mkdir functions/ncm.0   =20
ln -s functions/ncm.0 configs/c.1   =20
mkdir functions/mass_storage.0
ln -s functions/mass_storage.0 configs/c.1
echo $FILE > functions/mass_storage.0/lun.0/file=20

Peter=20
=20
