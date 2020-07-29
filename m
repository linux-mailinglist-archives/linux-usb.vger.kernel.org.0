Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95E3231764
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 03:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbgG2Br0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 21:47:26 -0400
Received: from mail-am6eur05on2074.outbound.protection.outlook.com ([40.107.22.74]:12685
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730346AbgG2BrZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 21:47:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knuPJQm7Eq+kExnHMAJqlRjOHZI4h+aVYwKQI6SOPl2C9wuEabrDXXfLmItIr1ZPp+/MxZDoDfusFRWkzyB8VHcJvGNpr0o2mWXrrg2xzoAVWzg741dBXcIRMIMJ97AWSAJx4ZwxvWoXTF4VTbS1Xsa+ePEsVnMPeAsppYXLhgvAnBumy1InWVJqO4k2Kxr+uQra+cB33o9b8bwCLOJZ1jBT++VOxNf0V6Ii+8gP0LzTK+qw1a2b5yoj5utJ4qk54tVpCA1q33Q1n3ph83G2JRqf5vBaTSV17vSBTtkR65yXuJuxrmUl5iDcgmOcjm/tjZWyKOobqJJXtsb3y4/MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K3Ofsqq5iP2Q5RJ191UMVK+PK+CCQvapngv5WDpG20=;
 b=YyH7cYy+s3Sr0mSMOBTRzTEsMTvWT2RBhSgAMRY+IOuZ122I1L+1zKwqBg0rH/TZZcoNJRtDLlukY3ko7HRsQJaAkZeAtTaI6vzhWSH1iloYX8Jj5jkVENjmR+KAe10z01uIB9GyuVs1B7i42dUjltrMjZJo9xSbafDUSkMIBK3GgCQHx29ptCtPZraAMdJ3LeE+/JxOQpiTe4A2bxf3Q/eCroSyL3DPfooszSXPyh67IJZOiWOMLkNQfHX1RY/dOIpVoyk8PdqyMAis0ZZ/FGv2aW21lm+Ggrgwz7InbvtsCgIdJ+D6ZbcEY2Ubx3IBwOIflhDxy2nUxw4/PH9CkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K3Ofsqq5iP2Q5RJ191UMVK+PK+CCQvapngv5WDpG20=;
 b=k3nG5eABeBfkZ+aRAccuOnQCIqO7uCOpD+pvToKzBB28oxQg5QQJhTKeUJM7iqOKt5exr7KKAywKmcHzfFQbS6sFPvccgpUTMHNAOPLyw0XfZEezjXJh7p/iSJUvNSztPEBb0+684wK6wgcfBqMd8R4foxWUm5I+wzbffnAr9Yo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3319.eurprd04.prod.outlook.com (2603:10a6:209:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 29 Jul
 2020 01:47:21 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 01:47:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Roger Quadros <rogerq@ti.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Adding and removing the same gadget multiple times
Thread-Topic: Adding and removing the same gadget multiple times
Thread-Index: AQHWZRXhj4iPy9KaNEi9pYKiQdMqyKkdyhwA
Date:   Wed, 29 Jul 2020 01:47:20 +0000
Message-ID: <20200729014656.GA17475@b29397-desktop>
References: <20200728193246.GD1507946@rowland.harvard.edu>
In-Reply-To: <20200728193246.GD1507946@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 7bb39718-3cf7-46da-abcb-08d833615581
x-ms-traffictypediagnostic: AM6PR0402MB3319:
x-microsoft-antispam-prvs: <AM6PR0402MB3319B94F42879B029FD3AD3D8B700@AM6PR0402MB3319.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LJUDzeLMQwcACEfrjsbuSLalfm9NiqbXs0wTXWiWyN6mF77zyudFoDGneauE00P0YP9ZChYfdsGb2YqsU/hKf0yXdewsLG4YBNl78mfn3RSO4O5RzzCLbdjFOCoVOc6q0YiwEL8+qDSOvMXoCQbr3nXKj4O4/TZB7MHfB4tJiTfeaqJGU5kahwcHMxiRMEmX5ACA1ZveYNrhpGFbdIrVsAKD/wQ5a/pH19cKK9ZfJ4+p0mO3yvkGxY6Ph1xSlBR/6XlOnhsktr2xbGmQ5XTEyRsNm1ymg3h5ZM3cc9HnDbSgA2O2ziX4fUhF9kTlmxNo4/BKcUzEEyir32jtFLveI0H8miu71sz257XAdV4gFtN9ljwIaeaFt7pco0BL9UToOEM/nJs2vRF2lIRfHC/39Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(1076003)(8676002)(316002)(478600001)(66946007)(4326008)(33716001)(6486002)(64756008)(66556008)(66476007)(2906002)(66446008)(71200400001)(44832011)(8936002)(91956017)(6916009)(6512007)(86362001)(54906003)(5660300002)(26005)(53546011)(6506007)(186003)(33656002)(76116006)(66574015)(9686003)(83380400001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 72z2+1YF1vS3A2itKhL3Ep4VcHJ5n2bnsWusWcna3Ewh7G1NAaAOD5FW3DYIuIkAx6Tw4FbCVIjUxyFcepWFdZOV0EB2bhQOg1W75V7FE1c7hHMxbOzpu33+8b436Om5zaKkyLWB2x4Gyc/pIKQKTQ8G5XepSjiSOy5D2MNKkZSqPa6BU06P0+fE0Ji5146hk+fyYg3VUtX/E2KacmmZq8aZ8p5wYq4GDJv3VerQcamEpeFVYsUkuH8/JY3ExkXIkS5oc412oMd6qmQv2P5ykQz7cxd4tegUO2R74lxBHqE1WZDkGv2UBhIbQQI33FDrJiTk48EekPs2iYUKsQFz7r0wqaa6CE0EBrQvZQlgK/Mza743YAhNqkK1Ofzazg66w/h18OlU0K8nF7vFwEZnatoEfwrEsaAIHtVr9vYbEe9lCprOGCuO+Iye589VbbGVE/vAksxoa3m+aXAvA0SHaIHYXp/dUq7S0ZuMzcF3I3g=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9E6C9FA39C3804D903ED9C60A9AD8AA@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb39718-3cf7-46da-abcb-08d833615581
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 01:47:21.0966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wvPW2rwn0v/XedEkQ3/XoKpP+wSfMp1nPVET4tru40ovpXYv89MCkvKEU5pW6r6UJxGgJ9nktYDmpjq8uhZ/zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3319
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-28 15:32:46, Alan Stern wrote:
> Roger:
>=20
> Your commit fac323471df6 ("usb: udc: allow adding and removing the same=20
> gadget device") from a few years ago just caught my eye.  (I don't=20
> recall whether I noticed it at the time.)
>=20
> In any case, we need to talk about it.  What you're doing --=20
> unregistering and re-registering the struct device embedded in the=20
> gadget structure -- is strictly forbidden by the kernel's device model.=20
> It's even mentioned specifically in the kerneldoc for device_add().
>=20
> Now, I guess doing this would be okay _if_ you took care not to=20
> re-register the device until all references to the previous incarnation=20
> have been dropped.  In particular, setting the structure's memory to 0=20
> should not be done immediately after calling device_unregister() --=20
> which is what the commit does -- but rather in the release routine.
>=20
> Do you know which UDC drivers actually do re-register their gadgets?  In=
=20
> particular, do they have their own release routines or do they rely on=20
> the default usb_udc_nop_release() provided by the UDC core?

dwc3 and cdns3 gadget driver do that, they use default usb_udc_nop_release(=
)
provided by the UDC core. The usb_add_gadget_udc is called when the
controller role switch to device mode (the host VBUS is seen at device
side), and usb_del_gadget_udc is called when the cable is disconnected
from host.

> Moving the=20
> memset into that routine ought to be okay; leaving it where it is would=20
> be a time bomb waiting to go off.  I'm suprised it hasn't caused=20
> problems already.

I have not seen problem when do hot plug, maybe one second is enough to
free all resources for gadget device? Below is the log for one iteration
for plug in and out.

[  156.308659] cdns-usb3 5b130000.usb: Waiting till Device mode is turned o=
n
[  156.308688] cdns-usb3 5b130000.usb: Initializing non-zero endpoints
[  156.308713] cdns-usb3 5b130000.usb: Initialized  ep0 support: =20
[  156.308725] cdns-usb3 5b130000.usb: Initialized  ep1out support: BULK, I=
NT ISO
[  156.308736] cdns-usb3 5b130000.usb: Initialized  ep2out support: BULK, I=
NT ISO
[  156.308747] cdns-usb3 5b130000.usb: Initialized  ep3out support: BULK, I=
NT ISO
[  156.308758] cdns-usb3 5b130000.usb: Initialized  ep4out support: BULK, I=
NT ISO
[  156.308768] cdns-usb3 5b130000.usb: Initialized  ep5out support: BULK, I=
NT ISO
[  156.308779] cdns-usb3 5b130000.usb: Initialized  ep6out support: BULK, I=
NT ISO
[  156.308791] cdns-usb3 5b130000.usb: Initialized  ep7out support: BULK, I=
NT ISO
[  156.308804] cdns-usb3 5b130000.usb: Initialized  ep1in support: BULK, IN=
T ISO
[  156.308815] cdns-usb3 5b130000.usb: Initialized  ep2in support: BULK, IN=
T ISO
[  156.308826] cdns-usb3 5b130000.usb: Initialized  ep3in support: BULK, IN=
T ISO
[  156.308837] cdns-usb3 5b130000.usb: Initialized  ep4in support: BULK, IN=
T ISO
[  156.308847] cdns-usb3 5b130000.usb: Initialized  ep5in support: BULK, IN=
T ISO
[  156.308858] cdns-usb3 5b130000.usb: Initialized  ep6in support: BULK, IN=
T ISO
[  156.308869] cdns-usb3 5b130000.usb: Initialized  ep7in support: BULK, IN=
T ISO
[  156.308880] cdns-usb3 5b130000.usb: Device Controller version: 0302450c
[  156.308889] cdns-usb3 5b130000.usb: USB Capabilities:: 19203324
[  156.308897] cdns-usb3 5b130000.usb: On-Chip memory configuration: 00000b=
12
[  156.309120] udc 5b130000.usb: registering UDC driver [g1]
[  156.309150] configfs-gadget gadget: adding 'Mass Storage Function'/00000=
000d982ebdb to config 'c'/00000000160499b7
[  156.309170] cdns-usb3 5b130000.usb: match endpoint: ep1in
[  156.309180] cdns-usb3 5b130000.usb: match endpoint: ep1out
[  156.612127] cdns-usb3 5b130000.usb: Configure ep1out: with val 0c000114
[  156.612143] cdns-usb3 5b130000.usb: Configure ep1in: with val 0c000104
[  156.612155] configfs-gadget gadget: super-speed config #1: c
[  156.612186] configfs-gadget gadget: set_config: interface 0 (Mass Storag=
e Function) requested delayed status
[  156.612191] configfs-gadget gadget: delayed_status count 1
[  156.612232] configfs-gadget gadget: usb_composite_setup_continue
[  156.612241] configfs-gadget gadget: usb_composite_setup_continue: Comple=
ting delayed status
[  156.645179] configfs-gadget gadget: reset config
[  156.645235] configfs-gadget gadget: bulk_out_complete --> -104, 0/31
[  156.645246] configfs-gadget gadget: reset interface
[  156.714984] configfs-gadget 5b130000.usb: unregistering UDC driver [g1]
[  156.715042] configfs-gadget gadget: unbind function 'Mass Storage Functi=
on'/00000000d982ebdb
[  156.715048] configfs-gadget gadget: unbind
[  156.715246] udc 5b130000.usb: releasing '5b130000.usb'
[  158.312637] cdns-usb3 5b130000.usb: Waiting till Device mode is turned o=
n

>=20
> Furthermore, drivers that do re-register their gadgets should wait until=
=20
> gadget->dev.release is NULL, indicating that the release routine has=20
> been called and the memory has been wiped.  If they re-register before=20
> that, the re-registration will fail for the same reasons you observed=20
> when you wrote the commit.
>=20
> Of course, a cleaner alternative would be to allocate the gadget=20
> structure dynamically.  Then instead of re-registering the old one, the=20
> driver could allocate a new one and register it instead, with no=20
> concerns about reuse.
>=20
> Alan Stern

--=20

Thanks,
Peter Chen=
