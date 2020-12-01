Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7082C9774
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 07:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLAGNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 01:13:24 -0500
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:16514
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725859AbgLAGNY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 01:13:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ5sP/qC9cxJBEsPWFu7Lk3EIJifKDkO824jN5w/+9msigPhLDpg4wcW59wimjzzaul2lVDcyRHxPmWc1+9YeE97g4i8tdwcMS5sZQ+9UtyBS8b3zmuS+gpHUbI3YHIZKX3Rvg3uT9qQ5rZDLH2GsOLpEIDnCGPYSl3zjLpTZ76DdA3hxQw0WlErUCp8T0zCylQh3cLpR309Rl1soxPYc2ZESAD7+hrwSuzpcdN49QfLfkeldKOdOIOEOUCgIIxbVACNpxmSGP18ZZfcIeDpJOIFk9I+X/ICt5RPprxtu8yFmZjVlcovZjske5OMUiZvq/I7ks9x42NbofBat9pdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vblG6W04doK/1IA+1G9IvKUiz6MDaOFIbS9QFBwIygE=;
 b=M0UFKU5SAu40Og4A7+5qL2e2gRP1Gs4daNe9FALrmiZ349RAILP2oUxmUHlp/VXGon8Cl4StYGYg6ZANpH+QGnenHQFDYLR5BdE5AGdRkhVgZBQyHrGMLAZhAvCwJyCcDjDj831/BTkycJr67c2c9Huzf/S4dVAQdnYX3f5cJz72dZoU26UMjFQDNBNSZx7YT29Tk3hnCr5VmZwMRzCWnqvhG3gQg0Ba45KiF8Aj1VaNec+VcymZjMNmGP9d3zTQIToEYDjPsqHTNodVgCLrAeQn5kCYakEWZ3mmslHRJd31YA4ZYOr7UMHu+LAJlbOSDrT6sDdd3eW5oHOnVthWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vblG6W04doK/1IA+1G9IvKUiz6MDaOFIbS9QFBwIygE=;
 b=Vz57+OLvSB0mDog+igfjZKp8e76rU0Q71JcJJigNW5YrpqBhhNFRE+CjxghuzgXpgAljjubFmNII1R4T3EKkHuewOqjQf5AKJh0f5z/FdPHbyUHHAG3KyAEZVlp3YLtOw4gpsreuKulYbxrhveoZaJigJ5Tls8ti/pdJhsqsMCE=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6525.eurprd04.prod.outlook.com (2603:10a6:803:120::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 06:12:33 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Tue, 1 Dec 2020
 06:12:33 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
Thread-Topic: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
Thread-Index: AQHWsdO/dqhU2/rHA0iX6fFqD5cydKnh7hWw
Date:   Tue, 1 Dec 2020 06:12:33 +0000
Message-ID: <VE1PR04MB6528A9C9B77B4F2A9CFF9C0D89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8cd090de-d7b0-4a3b-b288-08d895c0176f
x-ms-traffictypediagnostic: VE1PR04MB6525:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65258C1B070C62EBBCB42B9589F40@VE1PR04MB6525.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gS9F8O6NT0cDI540KjbG04Px4waozMQXrJq30TeJwVeSOk2PFVzbAh5Xstpq3KLXryCuqyQd9TBBM7zpCUpM+Wz85Y2Sc2jZMvLH/y/I/r/TqT+SlxYb63Fs6Dc1iL/7dJyC8gMwYtoQ0tEp6KJi6S/ZYfruBtLfA9VWhQvDWpuEM89yg8fiLk7MvvDP7DPEayfXI3VjGAgwVF9X/FBtQIRowwl61DSZFnzf0YZz3zQ0L4b/PQ/Zi2jTfogqooANhKiniRy76ixIw8pRN30SQMoyHPS0+yzXW/VUFt/c2Ptt1lUMw32W0lklrXkyb6oPnr/bkYbjPMsKkTfJZwqelg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(64756008)(66556008)(76116006)(44832011)(66446008)(186003)(66946007)(8676002)(8936002)(52536014)(5660300002)(478600001)(66476007)(110136005)(54906003)(316002)(83380400001)(4326008)(55016002)(71200400001)(9686003)(7696005)(86362001)(15650500001)(6506007)(53546011)(2906002)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0a2E4v2SRu2ptJYUGMPfpviFXRqwPmcsoV8Pup4maLCY0F9f4H7VARvESfjG?=
 =?us-ascii?Q?2nJihFwH855Rrk4kwqNuDeOaIuPaOsgqJvsqzSgDas046Ml8iqmE66ZP/j8b?=
 =?us-ascii?Q?DS7pLnCg829sZJXvQJAyfbAR06ZYqDe5Hifqs0sRO43RiXn/wQDW3cLlLPd2?=
 =?us-ascii?Q?Ihb2fJJOihvhfzBzRJNBtZ2EMFIx03u3A3ReFlU6dbM7EDZA4Tg09YOAqX0C?=
 =?us-ascii?Q?2JRzmdzLvvkvEU2KaYYie3zI0zBKr9IaKHUL9bz/vf4jSC9pYSeaMNgDIZMJ?=
 =?us-ascii?Q?QOi8EDntJuJpx6JDJ0wAfFQsqXKdq//hXVq071YRiSAwOP6QtpAhazI2wDZg?=
 =?us-ascii?Q?ojxzyZfrL0/HPQ8izqXK+3fX9yAwcqh0ExK9UQX4S2zit8liqJDvV5eH4Cz+?=
 =?us-ascii?Q?KFcldRyLSxWog/s7CScYcf117O911x3cAVpmAZVVg4yEQzFRPdu3mEN6klCN?=
 =?us-ascii?Q?gNVN8zmy5/aOXj/hYf5J4IL8zhlapYyIOUrGr9BR54rkK6zEv+Uc8y42Qkd/?=
 =?us-ascii?Q?LrvHx4G5heI5AW5FbRr02TQucZIF0tOQY+nOLX4ItcU8xytxasEfwgoGbrBs?=
 =?us-ascii?Q?J+WyZs7G3kiuUiFX0nhgW4Nvtk1pItPiSLkPAC50T4hHPKW1OiAutS+FHe3A?=
 =?us-ascii?Q?NODLXkHLXwzEjeYci1JCAAUAJKSO2mxpnNK3h/pUMfkQrd/7/kVHAdOIR+CF?=
 =?us-ascii?Q?0EjZpSPA+ffpIOxtTTNB5pp8diaPRtDzHiYKPpBIw8j2bBJewh7p44AUNHwe?=
 =?us-ascii?Q?rCWj4NafYgQiBT0utiARYDACAwoIyAlMBMlCZ5YVIxa97qr9Xbh8wI8iuoJD?=
 =?us-ascii?Q?VQUU8Br1o1ak3TbDxORqPootbbs/jNZj58eFaHyx3l7MF4HRWttLtky42Ncm?=
 =?us-ascii?Q?pfiVk/Yw87cSGEgxB18jPoD69Y9ytWbziYd3hZvNNjd9VpQS9vtuRrBP3pcU?=
 =?us-ascii?Q?IHPYwy+Qt94oncNDbKotiWYsPisIl+KMOf81TE337ik=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd090de-d7b0-4a3b-b288-08d895c0176f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 06:12:33.1331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqSU5h3rNn5BeUNhMKOCmFLz+Q0Rztzes0T2I88u0bKWE9TAh5w1r+Fz214lKmPs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6525
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Tuesday, November 3, 2020 7:23 PM
> To: mathias.nyman@intel.com
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Peter Chen
> <peter.chen@nxp.com>
> Subject: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus su=
spend
>=20
> If the connected USB2 device wakeup is not enabled/supported, the link st=
ate
> may still be U0 when do xhci bus suspend, after we suspend ports in U0, w=
e
> need give time to device to enter suspend before do further suspend opera=
tions
> (e.g. system suspend), otherwise we may enter system suspend with link st=
ate
> at U0.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/host/xhci-hub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index c799ca5..1e054d0 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1598,6 +1598,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  	struct xhci_hub *rhub;
>  	struct xhci_port **ports;
>  	u32 portsc_buf[USB_MAXCHILDREN];
> +	bool wait_port_enter_u3 =3D false;
>  	bool wake_enabled;
>=20
>  	rhub =3D xhci_get_rhub(hcd);
> @@ -1706,12 +1707,17 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>  				xhci_stop_device(xhci, slot_id, 1);
>  				spin_lock_irqsave(&xhci->lock, flags);
>  			}
> +			wait_port_enter_u3 =3D true;
>  		}
>  		writel(portsc_buf[port_index], ports[port_index]->addr);
>  	}
>  	hcd->state =3D HC_STATE_SUSPENDED;
>  	bus_state->next_statechange =3D jiffies + msecs_to_jiffies(10);
>  	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	if (wait_port_enter_u3)
> +		usleep_range(5000, 10000);
> +
>  	return 0;
>  }
>=20
> --
> 2.7.4

A gentle ping.

Thanks
Li Jun

