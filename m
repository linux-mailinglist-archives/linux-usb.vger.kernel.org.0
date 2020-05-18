Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6F21D707E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 07:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgERFsy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 01:48:54 -0400
Received: from mail-db8eur05on2054.outbound.protection.outlook.com ([40.107.20.54]:6241
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgERFsx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 01:48:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/AfucqDtCt26piRq7dnYjWAiR87B2I7ebd5Zt6FP3BXJ3LngQ3gVWX4B07e1KK6EgUTncDWKhf2A5obKON0CnamHAzNdmc5YoQC/j6pEyyo+LqO0VppnHTNCG0RPXsNw0o549capScYN2oMrh0q3dxWAy3Gmg8hiV0NTY3n5DFOAKKfjgzroOSqyuj0fcrdC02J+YJ/bSjN+RaqsJ19V+OqbhbeTY9qkPqEupwE53kIRU0HbqxFMHgLV1vzgEU7fWoRsTdUD9/wmv/CBU6QQogAH7uyrwRLPXUJkr3boClxfyBExXbClf7VO4GgvTwAS1+zpNl0wE+0akISfg+oLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlC4GfOEA0GWBbzeRX4lQUdhbLmEXKYxurUej0BPsTM=;
 b=O+faEVcP+xKQP+lPiQPs9jxdcS7vkTW4X8rUolPWKADsHJK9/fe0C4JgnfZEzpNv4pio7tcBTWsD2rSfWz7B1hDKl/bjj2WxypsNCcZM3Aq5R4J5yYBnkKOE2Sb+mtRRNQFOlGOYVaGag4KY3vAxq2CHFxQQDudy6k85kBA6qLG8Fff2agH9c0ohnxF74qo7VzRBj8UJoxCqw5srTUki5oG/NS571SsmZ70XdmOKDyuWp3D9+ph4MiWAtqGtyvnoFHbst7qOhiwNDLnbCZ+0Jf8xk/MIapJd7LTVEbjMUkatleyGfJIbDS8i/OzeaPjJgknnTe6vF0e/oyJ5ewJG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlC4GfOEA0GWBbzeRX4lQUdhbLmEXKYxurUej0BPsTM=;
 b=CNJDP0RrtjikFV4aNIbMH9i0m/TeMpQTvjU5XcUFS/yK5hUZ3Tehft422gIpjkyfCjfP8jPlHMVvgMoj3mRVMM7ea/WF2/1fWIz7CXloa2plmUxwgwvmRKn2KjeHImaRGx2UlJ+kqufZ+EckqPtGbJXIaJmmU7iro/szGH9vxpk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 05:48:49 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 05:48:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Thread-Topic: Documentation for Raw USB ConfigFS
Thread-Index: AQHWHxIE3BZgWTm6XUiOBTDqqvXTpqia0EkAgAnRnwCAARJFgIAAKfQAgAH+RoCAAIp4IIAB6N+AgAMiPQA=
Date:   Mon, 18 May 2020 05:48:49 +0000
Message-ID: <20200518054914.GC27612@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
 <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
In-Reply-To: <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 90f1859f-1e36-45bf-a7e9-08d7faef238e
x-ms-traffictypediagnostic: AM7PR04MB6920:
x-microsoft-antispam-prvs: <AM7PR04MB6920A0E8B0FD8DDBE5EC21BB8BB80@AM7PR04MB6920.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s5US5L2C4KyRU19A3+xOmT+aaUOJY6Emt24YzsWY1fynaUS5ZuwJVtExC+lE5AjgQZbrkViF5zJa4dafRNgQmK3E7kyBWNZlfaJCNQbUqWS/Okoh/zSt05ha56GMik09GrSEOQu4wt61f8NxmarZRmKHQOdF4aw/VLLFR5qgvUH/3nEvFTMKJNc6ZyIi/W6AWh290+aUniwtOxJwitNSi471PbEhmMS2n7LY4M/oJMFzmuTCJriwdC5iemsAfJD9kbVPy1ies+XNGWykDVbUCZrz6/rC92MhCyHqTWzt+ASUMGn8VQ2du8y3POQa8HeXEz80TLcZHUepRbrz/04S4O0/qYHBr0usY0jEnraxwLVbwWlENZj4WS7Uyk6BE6cNIoipYs1UljTMjFjtHMtkRqxA+sIAT0W/SYh/CG/5zeltEP/W55OGQRqbpJML9y4S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(136003)(396003)(346002)(376002)(366004)(91956017)(8676002)(6506007)(33656002)(53546011)(6512007)(2906002)(9686003)(66446008)(64756008)(66556008)(66476007)(66946007)(4326008)(6486002)(76116006)(54906003)(478600001)(316002)(26005)(33716001)(6916009)(44832011)(86362001)(8936002)(5660300002)(71200400001)(186003)(1076003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NCiLtxVyLojBs/C0nGJouLXxlUrevzO0ghuAjuSqx6ZXuLMX6Rv8SOIparNevrb90LEo9z7gqHxwG2tl3Kusq4CtGrVXMDjbYxgFpthY0yvcIeIKLDlGQcQMnjoBN16uDDknr/0kAleV4Q8V2t8+N04T1f5Bo5xj1gHlpnFUppFczCG/OoKP24ikExjZ7bt81v5YyHCIeY/qC/x6O74mPWW8P7IoOuDZRqPMxMpoSmE9BZzwe25tOmUPjy6dEL5ady2mdA7wkD1yoTnmrptM57BLe1nPqz2rPHCL33lWoUHH7BBZFKfSEun/d/5NnYdHQP8ESPqw7ZptYoMkPzF1hyoPrpwNRLkqJUmweKAwCHTB33KvTArMk15r8osGA/Jc1hZoD5/6wkOIwBb7tUReQ3SPX5prhLB5qJeuqj+7E4wwwMyhD/OkihW8ekeWiLzakKI5fx4Or/uo98AQNy/XXwn/sdtOBEP1WsTIEBZQN8k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6965A254DEFF8D4D99B0435655134E8C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f1859f-1e36-45bf-a7e9-08d7faef238e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 05:48:49.5938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg6D71w0l+S0b6Yu/AX+Dbr/l/i5cB103P9KbJE7wst8Wzz7feB2M1vGGoFSxeiiUa5F4H4vKpbQ3ZEGRsmnoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-16 00:57:55, Sid Spry wrote:
> On Thu, May 14, 2020, at 8:05 PM, Peter Chen wrote:
> >=20
> > > >
> > > > Would you please let ECM gadget work first at your board, then let
> > > > f_fs work using test application (you need to compile both host and
> > > > device application for it). After that, you may have more precise
> > > > concept for Linux USB gadget framework.
> > > >
> > >=20
> > > I don't see anything that harmonizes preexsting function usage with s=
pecifying
> > > custom endpoints.
> > >=20
> > > I've gotten the ECM gadget, and then the ECM gadget via ffs working. =
I've read
> > > through the ffs test but I don't see any way to assign functionality =
to the endpoints.
> > > The example seems to transport raw data via a bulk endpoint. I know e=
nough to
> > > instead assign an isochronous endpoint to the UDC and transfer via th=
at, but I don't
> > > want it to be the *only* functionality the device offers.
> > >=20
> > > Are you saying I can assign the ECM gadget via ffs and then add anoth=
er driver
> > > after the fact?=20
> >=20
> > ffs (f_fs.c) is used for customized function, other functions, like ECM=
 (f_ecm.c)
> > and Mass Storage (f_mass_storage.c) are used for certain function. You =
could
> > use configfs (like you have done below) to put customized function and =
certain functions
> > into one configuration, and let the host see them at the same time. Do =
your
> > real requirement is one customized function and one ECM function in one=
 USB gadget?
> > If it is, below is the example to combine f_fs, mass_storage, and NCM t=
ogether.
> >=20
> > cd /sys/kernel/config/usb_gadget
> > cd g1
> > echo "0x1d6b" > idVendor
> > echo "0x0105" > idProduct
> > mkdir /dev/usb-ffs
> > mkdir functions/ffs.usb
> > mount -t functionfs usb /dev/usb-ffs
> > ln -s functions/ffs.usb configs/c.1
> > /home/root/usb_test/ffs_test/ffs-test & /* your own test application */
> > while [ ! -e /dev/usb-ffs/ep1 ]
> > do
> >  echo "."
> >  sleep 1;
> > done
> > mkdir functions/ncm.0=20
> > ln -s functions/ncm.0 configs/c.1=20
> > mkdir functions/mass_storage.0
> > ln -s functions/mass_storage.0 configs/c.1
> > echo $FILE > functions/mass_storage.0/lun.0/file=20
> >=20
> > Peter=20
> >=20
>=20
> Hi Peter, thanks for the advice. I realized I was confusing FunctionFS an=
d ConfigFS a little while after I sent my message and saw the FFS configura=
tion in the ConfigFS documentation.
>=20
> And yes, I need ECM/NCM (one is newer and faster, will go look it up agai=
n) and my custom function. I may also include a serial port.
>=20
> I have been having issues creating any file called "ffs.${id}" in the gad=
get directory. It fails with device or resource busy. I assume this means I=
 have misconfigured it, but I am copying your example; or missing the drive=
r, but I have ensured it is there.[1] I have also tried ensuring the ffs fu=
nction is added first. Any pointers?
>=20

1. Please build in all configfs functions, and choose through the
script.

CONFIG_USB_CONFIGFS=3Dy
CONFIG_USB_CONFIGFS_SERIAL=3Dy
CONFIG_USB_CONFIGFS_ACM=3Dy
CONFIG_USB_CONFIGFS_OBEX=3Dy
CONFIG_USB_CONFIGFS_NCM=3Dy
CONFIG_USB_CONFIGFS_ECM=3Dy
CONFIG_USB_CONFIGFS_ECM_SUBSET=3Dy
CONFIG_USB_CONFIGFS_RNDIS=3Dy
CONFIG_USB_CONFIGFS_EEM=3Dy
CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
CONFIG_USB_CONFIGFS_F_LB_SS=3Dy
CONFIG_USB_CONFIGFS_F_FS=3Dy
CONFIG_USB_CONFIGFS_F_UAC1=3Dy
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=3Dy
CONFIG_USB_CONFIGFS_F_UAC2=3Dy
CONFIG_USB_CONFIGFS_F_MIDI=3Dy
CONFIG_USB_CONFIGFS_F_HID=3Dy
CONFIG_USB_CONFIGFS_F_UVC=3Dy

2. Try exactly the same script I gave you, do not try change
any charaters (except the position for your application)

> > cd /sys/kernel/config/usb_gadget
> > cd g1
> > echo "0x1d6b" > idVendor
> > echo "0x0105" > idProduct
> > mkdir /dev/usb-ffs
> > mkdir functions/ffs.usb
> > mount -t functionfs usb /dev/usb-ffs
> > ln -s functions/ffs.usb configs/c.1
> > /home/root/usb_test/ffs_test/ffs-test & /* your own test application */
> > while [ ! -e /dev/usb-ffs/ep1 ]
> > do
> >  echo "."
> >  sleep 1;
> > done

>=20
> [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM set h=
owever the necessary code seemed to have been pulled in some other way and =
the modules were available. They were loaded, and as explained my shell-bas=
ed configfs code worked. They are set now and the problem persists.

--=20

Thanks,
Peter Chen=
