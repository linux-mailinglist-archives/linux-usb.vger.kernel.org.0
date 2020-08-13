Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7302243813
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 11:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHMJ5g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 05:57:36 -0400
Received: from mail-eopbgr60065.outbound.protection.outlook.com ([40.107.6.65]:37382
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbgHMJ5f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 05:57:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpCjEjFCVqAzR+Z/PiuN9z1Gd5HMdbw/IE2dZpYUae+QJcIQll88ZeAVVYmwu/pIlVXt8Ji2QsevdrJYtjZcHSZ0wZG5IEGPXb+hXfDd+zo3fbBbcyHmJwZ2bFykHC6QeEkglMv2VSXeQQLwdhgOxVlNVwvET7rqIxNIwbjN485hlukKnjNouvyluuFuaxyxyczMJFbDMgurSNKg29sz18pbQ3egrUCkOYS8mpvHtyRmIX9KCNH2/szwjOL13Dhupmow8xgNoOBQZ7UIe3wUDsEleFEHSGdnuKDQfQIjHINt7P+mYykelT+4hlYsIdAmSAAOfdfYIOUtegzgPrwykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDklXIctGsDeA/9jn2aJikLFAeqEWHAm80wEYSttXGU=;
 b=dFTJmv9JB62qZ3sq8mesMEr76xI5eldnPgKblmyamqg+AfhKrHfqC33nUNJ0pLi4aMskT/c2h2hnWbeKeMZB6sszEwsu9DEHuchBJOsgmMBV7MR9KP0m8W+nOrNPV9wRmPqDahXL6xOoTQabGPGD/N0rDAP3buYv2j86U2ujBTpqHmeDsLjKq1EpxcM9xZl/nfdmMn0HdPWBwR9Z82uEeDgcY2D+urJWg/k20L0k5crJX60WaahtBZ2571PHdna41WE+vdUAN2z4Eh/ljbyIojXP9iG482j53nmtl/g65qGXK4GZf6MR6+jlmSncemrQkkVGzUGfaLPj09dMdFXFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDklXIctGsDeA/9jn2aJikLFAeqEWHAm80wEYSttXGU=;
 b=idNvhQelP/CX+GufVRvch0h/e7bnRNMbvzNkRTqgJDmxOrimKwWbsQrUe78YWuQNVjVSvnhm0bnbBkJaK+Qs4SoSVIAogmjcH4ow4hCvVo8JCLyUSL7NdNNsX5UYJMi/YdeXkodgbd35aEStPS0zaHjMJ1JVG5W21vy7WkY2sBU=
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6428.eurprd04.prod.outlook.com (2603:10a6:10:102::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Thu, 13 Aug
 2020 09:57:31 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14%3]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 09:57:29 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWW240LsQE47DpHka0ISI6aMQrkKk1+RLg
Date:   Thu, 13 Aug 2020 09:57:29 +0000
Message-ID: <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e9e8effe-23e7-4b12-5ef0-08d83f6f4a55
x-ms-traffictypediagnostic: DB8PR04MB6428:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB642806D3C0795930804110C689430@DB8PR04MB6428.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oIV/LKHaA1KTHcZZ3GZRe463qtAg+Lvid0w9KdEbBmX5eNdukCS5OEW51JQiQTNbb9erCl7mg4hgDdSewHw840YrqmsklvcSvAgYkZGDE0bhehcn4u5LugywmS147UNPUoLu9pu5rAaYh5/KQD5TWjLmru+BI26MA4yRt6X3XhKYnQ6+hFyqkfhyzPbp8KcyChMUlxRwlxCIVuNNLG1MY2+3Dacyr0125mkp1PnIvaqPSy6ZxBVhwW4dH0gciguU9Y1xJVz9W9w5qmfBooxgxj79qC8Ftg3QPeWcDN+163x06ZfmBlZn7Kfsh9XTVFNZxp3DiDVYtKTJi6s0RG8AKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(26005)(186003)(83380400001)(6506007)(53546011)(9686003)(86362001)(478600001)(7696005)(8936002)(55016002)(52536014)(33656002)(66946007)(76116006)(66556008)(71200400001)(2906002)(8676002)(66446008)(44832011)(64756008)(110136005)(316002)(4326008)(66476007)(5660300002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BVyXaXL6UXne1sfWeKGqbNznEgtsaxxqTPUnowF1Go0ddN25GGwdjiM8106lkHT3DwxQRhlmxg/JERKXiQ2ajVcXksXHfud7pIRvh3JrC6TuomUBeRQ7E2GfSRrm9lpGtgYq8plqipqwhRQOL7YDoeL2u2jkYeooLtjO1EV2LVvwFxLM3YxOMgCN9Fjjq91LaYVt+ITHUXtq3539ea05vGQ0oSaSXCBiUgPqOqSXyqFTPGNV8ECiDPPTAkfYeVqse3HWAgqyMBaakdenNMxhdVdKiw8MmK+6XFCdAFkFeVT5bHC8uQ6USNeG8F4NKaMHqkzokINXC05V8R172IlUTiQoHAsNkGEADQLo6Ds/C0eQtOaDlCH5P18CY1gn92DthsefYPzpdDgLtF2CF08z5rs45xtVoJsuBCZq3+Jl5JP5gbJOA1ZrMV9w31PnWAtutW6KULeSNjwluvjvBQhlz9qjP1OaLqtVInj4TqJPBi8Q1BnxgM2lAujGnVmVXmp24l+q07UB9TtBVgyl5LnlBXXlXWZXToZ6zGBXuIktp2U5wn9W2clUhtOHUiC2OOs9lda3wSXeQdyJCaqZ/K5XL1dyC1RwaAiMztC7smg38UcBKijbRQUzsWqx9cp/cXy2WYsbZ0BpeQoIgmO4o9C84Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e8effe-23e7-4b12-5ef0-08d83f6f4a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 09:57:29.2094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DP0M2qHhNAs+h+gyOqaFNCeVVt87mRLz0/wAcGHQAqJhs/fFJXO9xy9yWIhLvji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6428
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Thursday, July 16, 2020 8:40 PM
> To: mathias.nyman@intel.com
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: [PATCH v2] usb: xhci: add debugfs support for ep with stream
>=20
> To show the trb ring of streams, use the exsiting ring files of bulk ep t=
o show
> trb ring of one specific stream ID, which stream ID's trb ring will be sh=
own, is
> controlled by a new debugfs file stream_id, this is to avoid to create a =
large number
> of dir for every allocate stream IDs, another debugfs file stream_context=
_array
> is created to show all the allocated stream context array entries.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> chanages for v2:
> -  Drop stream files remove, the stream files will be removed
>    with ep dir removal, keep the ep but only remove streams
>    actually does not make sense in current code.
> -  Use the new_ring for show_ring pointer for non-zero ep.
>=20
>  drivers/usb/host/xhci-debugfs.c | 112 ++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/usb/host/xhci-debugfs.h |  10 ++++
>  drivers/usb/host/xhci.c         |   1 +
>  3 files changed, 122 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debu=
gfs.c
> index 65d8de4..708585c 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -450,9 +450,14 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *x=
hci,
>  	if (!epriv)
>  		return;
>=20
> +	if (dev->eps[ep_index].ring)
> +		epriv->show_ring =3D dev->eps[ep_index].ring;
> +	else
> +		epriv->show_ring =3D dev->eps[ep_index].new_ring;
> +
>  	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
>  	epriv->root =3D xhci_debugfs_create_ring_dir(xhci,
> -						   &dev->eps[ep_index].ring,
> +						   &epriv->show_ring,
>  						   epriv->name,
>  						   spriv->root);
>  	spriv->eps[ep_index] =3D epriv;
> @@ -474,6 +479,111 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *=
xhci,
>  	kfree(epriv);
>  }
>=20
> +static int xhci_stream_id_show(struct seq_file *s, void *unused) {
> +	struct xhci_ep_priv	*epriv =3D s->private;
> +
> +	if (!epriv->stream_info)
> +		return -EPERM;
> +
> +	seq_printf(s, "Supported stream IDs are 1 ~ %d, trb ring to be shown is=
 for
> stream id %d\n",
> +		   epriv->stream_info->num_streams - 1, epriv->stream_id);
> +
> +	return 0;
> +}
> +
> +static int xhci_stream_id_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xhci_stream_id_show, inode->i_private); }
> +
> +static ssize_t xhci_stream_id_write(struct file *file,  const char __use=
r *ubuf,
> +			       size_t count, loff_t *ppos)
> +{
> +	struct seq_file         *s =3D file->private_data;
> +	struct xhci_ep_priv	*epriv =3D s->private;
> +	int			ret;
> +	u16			stream_id; /* MaxPStreams + 1 <=3D 16 */
> +
> +	if (!epriv->stream_info)
> +		return -EPERM;
> +
> +	/* Decimal number */
> +	ret =3D kstrtou16_from_user(ubuf, count, 10, &stream_id);
> +	if (ret)
> +		return ret;
> +
> +	if (stream_id =3D=3D 0 || stream_id >=3D epriv->stream_info->num_stream=
s)
> +		return -EINVAL;
> +
> +	epriv->stream_id =3D stream_id;
> +	epriv->show_ring =3D epriv->stream_info->stream_rings[stream_id];
> +
> +	return count;
> +}
> +
> +static const struct file_operations stream_id_fops =3D {
> +	.open			=3D xhci_stream_id_open,
> +	.write                  =3D xhci_stream_id_write,
> +	.read			=3D seq_read,
> +	.llseek			=3D seq_lseek,
> +	.release		=3D single_release,
> +};
> +
> +static int xhci_stream_context_array_show(struct seq_file *s, void
> +*unused) {
> +	struct xhci_ep_priv	*epriv =3D s->private;
> +	struct xhci_stream_ctx	*stream_ctx;
> +	dma_addr_t		dma;
> +	int			id;
> +
> +	if (!epriv->stream_info)
> +		return -EPERM;
> +
> +	seq_printf(s, "Allocated %d streams and %d stream context array entries=
\n",
> +			epriv->stream_info->num_streams,
> +			epriv->stream_info->num_stream_ctxs);
> +
> +	for (id =3D 0; id < epriv->stream_info->num_stream_ctxs; id++) {
> +		stream_ctx =3D epriv->stream_info->stream_ctx_array + id;
> +		dma =3D epriv->stream_info->ctx_array_dma + id * 16;
> +		if (id < epriv->stream_info->num_streams)
> +			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma,
> +				   id, le64_to_cpu(stream_ctx->stream_ring));
> +		else
> +			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
> +				   &dma, le64_to_cpu(stream_ctx->stream_ring));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(xhci_stream_context_array);
> +
> +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
> +				      struct xhci_virt_device *dev,
> +				      int ep_index)
> +{
> +	struct xhci_slot_priv	*spriv =3D dev->debugfs_private;
> +	struct xhci_ep_priv	*epriv;
> +
> +	if (!spriv || !spriv->eps[ep_index] ||
> +	    !dev->eps[ep_index].stream_info)
> +		return;
> +
> +	epriv =3D spriv->eps[ep_index];
> +	epriv->stream_info =3D dev->eps[ep_index].stream_info;
> +
> +	/* Show trb ring of stream ID 1 by default */
> +	epriv->stream_id =3D 1;
> +	epriv->show_ring =3D epriv->stream_info->stream_rings[1];
> +	debugfs_create_file("stream_id", 0644,
> +			    epriv->root, epriv,
> +			    &stream_id_fops);
> +	debugfs_create_file("stream_context_array", 0444,
> +			    epriv->root, epriv,
> +			    &xhci_stream_context_array_fops); }
> +
>  void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)  {
>  	struct xhci_slot_priv	*priv;
> diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debu=
gfs.h
> index f7a4e24..f3348da 100644
> --- a/drivers/usb/host/xhci-debugfs.h
> +++ b/drivers/usb/host/xhci-debugfs.h
> @@ -91,6 +91,9 @@ struct xhci_file_map {  struct xhci_ep_priv {
>  	char			name[DEBUGFS_NAMELEN];
>  	struct dentry		*root;
> +	struct xhci_stream_info *stream_info;
> +	struct xhci_ring	*show_ring;
> +	unsigned int		stream_id;
>  };
>=20
>  struct xhci_slot_priv {
> @@ -113,6 +116,9 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xh=
ci,  void
> xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>  				  struct xhci_virt_device *virt_dev,
>  				  int ep_index);
> +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
> +				      struct xhci_virt_device *virt_dev,
> +				      int ep_index);
>  #else
>  static inline void xhci_debugfs_init(struct xhci_hcd *xhci) { }  static =
inline void
> xhci_debugfs_exit(struct xhci_hcd *xhci) { } @@ -128,6 +134,10 @@ static =
inline
> void  xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>  			     struct xhci_virt_device *virt_dev,
>  			     int ep_index) { }
> +static inline void
> +xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
> +				 struct xhci_virt_device *virt_dev,
> +				 int ep_index) { }
>  #endif /* CONFIG_DEBUG_FS */
>=20
>  #endif /* __LINUX_XHCI_DEBUGFS_H */
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index
> bee5dec..2d6584c 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3529,6 +3529,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, =
struct
> usb_device *udev,
>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>  			 udev->slot_id, ep_index);
>  		vdev->eps[ep_index].ep_state |=3D EP_HAS_STREAMS;
> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>  	}
>  	xhci_free_command(xhci, config_cmd);
>  	spin_unlock_irqrestore(&xhci->lock, flags);
> --
> 2.7.4

A gentle ping...

Thanks
Li Jun

