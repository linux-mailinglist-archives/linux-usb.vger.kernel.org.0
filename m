Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63C2C99C5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 09:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgLAIoG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 03:44:06 -0500
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]:55626
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726604AbgLAIoE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 03:44:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fH8USBM4cNd4O8HWjcj9FTa334F97B5wxVMFkHq/yXgSjtOTi4EjICaE2CQsjp2eyo3Q+5/JK6FaKiM/dbq4OAmuCTP6o0dyioo1c5ELYbiWA9AhP/JdoBkkJAlUXDIoovUADl0/xAnufscsy5paN5SCsszDr4DaCgeiImS2Hol/ZYlK+omzlYI2qKh7LHu6o0RfRQGYe1nOWPsjQV+6Ds4kIf1ecA1lya9ckvaY3r36VmVrgUjeBWyela3SRRsWfRxO6HVwQn58IxASVwNllAvEIk9rD3brFcQ830kuz/lmpGl6gCOCpZ2Vq5en6kzUvCObyIpT3FuWK0bTQZB0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt9TXJ2QBDpnJPF3VNnU50Qr5dJWuF6/v37DgkM/fL0=;
 b=S+FuJ4VL/53Tf9urRp3486NPVSAWiN85Dx6qwK6rJ9o+RYAEtHEnSfaKsKW19gVSX46hBRVIKm1afcmlTnkH6z4uF2+vUi5VWIdj5UiglLr7YhwxQj1LI2dGQtEpjKRMgEnoF23OJ4B9Qb2z6w0C5sGiHkmLxVw5WAqk8fz2LxStz+YXv19jM9GmHCja/i5FP+d2w+7sCTxy2JitnV0AMH/yLl4mT3fL5RV8ibgjNlgWiLJhHLsTJzb0ffe9ekikKQqnCWwnqDQWOmMEiNDkYQ1cL0vpw3BJg8pOfAh4RFPS9vaEQTeWdujN5DYThjQGetk9RquAqyEc/4v/JFyijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt9TXJ2QBDpnJPF3VNnU50Qr5dJWuF6/v37DgkM/fL0=;
 b=DtVNjqqIXVl+SChHTH2YwpBF+jmQHx50NeeS6D6qAmXCuEmK8NCno7MeZrGA3BHyi1DX8aP1OCo2BcG586PADNFg/JUZZ2q7ygtdRDxi+61STzSAR/oGQh5JBHdhL1l2QnnLF0tZI0DKx6eB5GlHSAjfs5HLwq6UgW/0hjjitGE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 08:43:15 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 08:43:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
Thread-Topic: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
Thread-Index: AQHWx1iN78Nptb1oeka3004/VodEvanh7S+A
Date:   Tue, 1 Dec 2020 08:43:14 +0000
Message-ID: <20201201084245.GC11393@b29397-desktop>
References: <20201130203453.28154-1-jackp@codeaurora.org>
In-Reply-To: <20201130203453.28154-1-jackp@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43d175db-2249-4935-2724-08d895d524ce
x-ms-traffictypediagnostic: DB8PR04MB6859:
x-microsoft-antispam-prvs: <DB8PR04MB6859939D0E117E75497514008BF40@DB8PR04MB6859.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PDuggsU9CaV0sxJs8MKpsnLkfwwA2CQJONMkymg6MHoAAklu0ihkV4eXmvIup1dvixGOOWy1+VS5yy3GYFnzvYVrye1LR4Wcbx62XduF/FzCrcYLi3y8iRV5JbnwYsOW8n1P3c4eK3Bh1i0SWUhqwJoG6xlfVUD/4IMTIpu6bgsYmwY3khBBrW7WsIg796uIsdWEtYHOXgZRUKySt9B5OEn9A9kwUfo5XQCSnvsF3gdLW3Jgp+RHllkyvcK9mePJR9ORFR25pKq6K+kfBH7Oh+05huQG98R6xcjh8jOOdM+0hqiJOFZ387DZrVwjMag4zLiCWZRg8SvJr6HWearcYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(396003)(376002)(366004)(346002)(33716001)(5660300002)(8936002)(8676002)(26005)(6486002)(33656002)(54906003)(186003)(2906002)(6506007)(53546011)(6916009)(1076003)(44832011)(9686003)(6512007)(316002)(86362001)(4326008)(83380400001)(66556008)(64756008)(66446008)(71200400001)(478600001)(91956017)(76116006)(66946007)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MpvRZjgDkhdn/NUCaydonq1Zzamtg5NxVg/ZcI2EkB46CLN+1TPwu0Utqyvb?=
 =?us-ascii?Q?ET3PDhykUUBqxf6bpQD+ENnbR0RAD8tI8RsOmxwP1APleD3kgKxZ5NbA+nB9?=
 =?us-ascii?Q?o7cjdQ6aCR7/rAy0uypW1zGV2TR4q7CmKQPL/WvEpXKL0ohfsoTXj0v0pL2+?=
 =?us-ascii?Q?NAdtm1aJMka7cBtfTO7pdU1xKZX5YfVWjdZ/jNM0IldeuIP78eu6cGF2B+cN?=
 =?us-ascii?Q?Gq9zb02TkXCy9i3kTR3huJJ/JU0Xm1w7rauV1Q+dTPb6tLuQhYkjvMoC3oIG?=
 =?us-ascii?Q?RtNqhpOqIGgFCY9oFnKiriisrdWfjYaTZYbOZKg3IaCE1WUmEre63aS3o6TZ?=
 =?us-ascii?Q?7J6K5EGcvxu0JLEsr+jZao7cog6OdZWZxPPROWexuzaGLkDPrHKb+mgjfIRp?=
 =?us-ascii?Q?wxNkvl55B4vI9dF6u+5WxUvvDou7scro9b6KxRvC2CTeB0dHPQS2nutaBxT2?=
 =?us-ascii?Q?O5Istr2HnaRSfoIDs4Q3s4vM095Bpxfy6wRqv4U58uCEnA3NrExc4AKfEPCl?=
 =?us-ascii?Q?4mtOFB2K71WFadDzPaKPl6U+4tj51UJCJLNXmXvB65YIAQ6e0148jNQ0J87T?=
 =?us-ascii?Q?h6CsQQ4V8WJR2wqGPv8C2/Kfk1cS6KlQR+D6Xm6tOc8SVrF4bCk+Hj+mdzHR?=
 =?us-ascii?Q?CHQr1sVDLViESLgGgUqDrHW+14g6ziogTM80V1sln6pVSRl1ZwmQUB0xF/Sy?=
 =?us-ascii?Q?05qYhmq0u6iyhsq2Wd2jj0u3wiNIRsbR3rNgbo3yGaf82/1IqtCxeRmb0phh?=
 =?us-ascii?Q?XKfo1txcBM0KBr8aczaGrcA8uajZfDnismdfggFb6Ll6Yl3dCiTEA5tAqsO4?=
 =?us-ascii?Q?UCG6d+txwNcw4Ijl+xbezMdGh42oDIAG9WMtBnHfXcwKUTvTMyejF2NAHBBK?=
 =?us-ascii?Q?CJHyGoNwrIyKX+zm7VHQnd3IG2eX5Y1KhuRK8s4nJrkw1aCTY0LI/Cv4i+6x?=
 =?us-ascii?Q?KMz4XqtTSBnXBRmpIWViwS5mWIwjOQGOwrjmMYbhlfIrwglmTuopvyQuX2Oh?=
 =?us-ascii?Q?1bI+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6ECF9C4634D0E4A81214F48D91BB68E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d175db-2249-4935-2724-08d895d524ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 08:43:15.0131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPCl8rw/Sg3Gs0x6Hyq7U1QFCtxQxEXI+JhdkGDhxNT5LpHpuueV//tdX85i3KK0Wc6CmlR+nmTWir9oiaYd2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-30 12:34:53, Jack Pham wrote:
> From: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
>=20
> The function may be unbound causing the ffs_ep and its descriptors
> to be freed while userspace is in the middle of an ioctl requesting
> the same descriptors. Avoid dangling pointer reference by first
> making a local copy of desctiptors before releasing the spinlock.
>=20
> Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descripto=
r")
> Signed-off-by: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 046f770a76da..c727cb5de871 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1324,7 +1324,7 @@ static long ffs_epfile_ioctl(struct file *file, uns=
igned code,
>  	case FUNCTIONFS_ENDPOINT_DESC:
>  	{
>  		int desc_idx;
> -		struct usb_endpoint_descriptor *desc;
> +		struct usb_endpoint_descriptor desc1, *desc;
> =20
>  		switch (epfile->ffs->gadget->speed) {
>  		case USB_SPEED_SUPER:
> @@ -1336,10 +1336,12 @@ static long ffs_epfile_ioctl(struct file *file, u=
nsigned code,
>  		default:
>  			desc_idx =3D 0;
>  		}
> +
>  		desc =3D epfile->ep->descs[desc_idx];
> +		memcpy(&desc1, desc, desc->bLength);
> =20
>  		spin_unlock_irq(&epfile->ffs->eps_lock);
> -		ret =3D copy_to_user((void __user *)value, desc, desc->bLength);
> +		ret =3D copy_to_user((void __user *)value, &desc1, desc1.bLength);
>  		if (ret)
>  			ret =3D -EFAULT;
>  		return ret;
> --=20

Do you have any backtrace to show the problems? I see ffs->ref will be
increased at .open, and the .unbind should not free memory if ffs->ref
is still two.

--=20

Thanks,
Peter Chen=
