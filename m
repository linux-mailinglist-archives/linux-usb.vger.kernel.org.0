Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83C22198FC
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 09:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGIHC5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 03:02:57 -0400
Received: from mail-eopbgr50065.outbound.protection.outlook.com ([40.107.5.65]:12328
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbgGIHCy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 03:02:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a783skOnSyzqLzp92+z3Ny/Ng/0yQImQQTCicq7ShL7Q+l4ojBa5elr2rN8DRipk5YQ4VUUq6Nf+DoPcS+qYhZc6GtTEdNFtaTzsnGLiVblbu9v6S5QjFoC7TctJeFEw7i5u1jLlfws8jBU+6vI3eUZ2k7GlF2AARgf5PEU26crFsNF++DYCiI9eKzditTeGsO7Izq2nSvkkdDznSnhQLyVOYOR8cfKUBY0Cn35TcBiM/8zv9mhBuXuAzbpIAywnFXmIsew1YjFXw/HtTQallzUMvbpmh6jxzul2eUdXMBmpjSQrrHi50CPBXjLGw2IHNyvWS1ettv4iyh2FbFrbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYu/OVXyoAwjgPjr8RlKOK/GlR+EfatDIbYFllt1yIM=;
 b=DvEkI8wux2SS97VDZc6wPEH4+vhiq4mRwYv/eFSBwxt8lQgETYKlPfW83iAPqqmeOCsGtjzAWwrTEMmSvJLGS0INd1jia4sAsTXrg2iRyghzDpogut/3m4d5sJRubIheIfr55jnBmwAvYkAvw53hzIlF+9DZdPC94Zh1r5zwKvDEVfMQoE+afq6kV0BYniNbJgO5MI1GK3GndmBXefWGQ7TOem9Qj/F7nOOKhVlnZfCkIRkcqRXWMIqNqcIP5OXAU5ALJlyCctTTKrwrZOKcxMNrnSFNwmAPN7UiP7LzxJWGvm4WOpR1VSaLCLmTV+VbKdwj3m7PXI1fFjUyFgU6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYu/OVXyoAwjgPjr8RlKOK/GlR+EfatDIbYFllt1yIM=;
 b=CoAXe8hJKhh25jDZXE5Pg7/8h9WzzJFxVENB99ApPC6784she8E3+YtMU/nqZoWqf0+CUwrW6MdKzflhiFrsZItxGFzCXcFcbedpGIMcuTb1D4hPJD0BtL2+YQxgvI+t7oXY19xrAtxIzMT8uLZUTZXrB/g6fmC96EDsZ6g9KAo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3025.eurprd04.prod.outlook.com (2603:10a6:206:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Thu, 9 Jul
 2020 07:02:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 07:02:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/3] usb: cdns3: ep0: fix some endian issues
Thread-Topic: [PATCH 1/3] usb: cdns3: ep0: fix some endian issues
Thread-Index: AQHWOXO6sZYH9su3hECCrbzFM8G876j/BhgAgAADwEA=
Date:   Thu, 9 Jul 2020 07:02:51 +0000
Message-ID: <AM7PR04MB7157D60ED21E2B29461DC3F08B640@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200603065356.14124-1-peter.chen@nxp.com>
 <20200603065356.14124-2-peter.chen@nxp.com> <87fta16vb9.fsf@kernel.org>
In-Reply-To: <87fta16vb9.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.67.222.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ea9979c8-be10-49bf-102e-08d823d61871
x-ms-traffictypediagnostic: AM5PR04MB3025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3025EC8298167A5623147EF98B640@AM5PR04MB3025.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04599F3534
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AjpmgWBbtf3P97L7h5Sw4xmh6YiS5z2zCmlaxyLgtxJszeLwZ7clSetNNK6PBetvDDWWEm/KYKit1XEpOG+aLQkHNjK2fCbKJxPunj7Qtgh2FmdUEVTCElL8G0dOW0K+kwE9M567lDqBnV7+noINhVr3RAR7Ij2ywJR2To4GnTTCcyJIk+08VXiwukw3mumAhHQ05kRXe/SiVU8P9LcSaJqzhzFbT5EF6CkDsQOGy08HrSxoBnqBzTrFEqezSnfLAQjIuTP6DQRsd5cBS0s7Y6Txps5kWGzcrsQ6HICt9yuks2ESNkAra3WqqtijFvHX1efA/ZqWbpdL3Ego/xj17A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(54906003)(316002)(52536014)(26005)(558084003)(8676002)(55016002)(33656002)(186003)(478600001)(9686003)(86362001)(5660300002)(2906002)(6506007)(4326008)(7696005)(76116006)(66476007)(64756008)(66556008)(6916009)(66946007)(44832011)(71200400001)(8936002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7XtgBdZwMwR60iAxQ2tIDPm+TrZqnsp4RLRzsgq66N6Ms2HWkReut7zHttFRXRDm5LGoonew5Wqz7DWdtpH2LQbj9lOaaqnH/w2oo0IEwDG5GojWA2W+Zawaqe2d+zrvPEo7dTwMpQGS6vr/7uIl4g3dB+qfEGdBK8Bd8NTLTbkUkCWG4BUdd5oZaiMVTdVSSz8/hZaQog/SmbnXF7esBR9u/qloOKT8z/LWH/7akEuId+ZjT4GGBod1sByabPRtEQOrwNPYTQBKkXgmw4muYo9YZPBW3fM2j8qwfAt0w4kmj5mg7D0TFZ/LY747BwuuXZX3SL02bpFcf3T7OSFncprOkNTYjX0gLSXLPtt4C1OZCex1hkVd4OcAWhyr4fRBQbBqU1PcOkJV20QkOQLL95XvPoLqOM6Kij7MV0Id50NqqZ+8kj0ENENbZJjE4i0EzZYT6/HOsaTj0sCuQmKTojqMcTRChiEJql8CW8co+i4o/xd6q0MUIkFqSw0iyJuS
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9979c8-be10-49bf-102e-08d823d61871
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 07:02:51.1896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +oY/L+XidUsvjZdZT89HaUS59SSPG6cMjmPXm5DC377Ervj+ZrJSDsbtL1C+ioKhrQYfwQTwyMz6jhTJ6W26Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3025
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>=20
> Fixes?
> Cc stable?
>=20

It does not fix a bug, and only improve the code for cross platforms
So, don't need to go stable tree.

Thanks,
Peter
