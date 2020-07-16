Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF61D221DAF
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 09:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgGPHyv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 03:54:51 -0400
Received: from mail-vi1eur05on2064.outbound.protection.outlook.com ([40.107.21.64]:55744
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725867AbgGPHyu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jul 2020 03:54:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHhEkfrT8qguyGjsBcUDd3KRbhda/0hAQj7bPAPH01BkZS1DsRA9nwtcEW2HIlhWBS6K/WJaytB/FCT0S7Zn7ZRT/3MeVjGYpGLdNsfbpHOGmYNwKKeeAzoccoBXTUbjip/o1BKa+jaFJH+hc8ulSuILC/k0kIkqbbCoXUcex0VTBwx2TW9yBmtcKmENCdqz/pAAmd4HBGBlhhqr3RcAiCKrR1nARgeTa9Tj+mCG4K7AfhiU+PbtRnVQbl/4Z+oDssSacyoqL0TDh5Bn4oZeFxuALogJGaNCaDZayDQhRRfMo/Bl7m0L1snPAPTt8hAhpQIKbNTGQsss+VsxDGCj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqwSktHFFb7jwO9qUv8hw9uf9WBOMJraxa00f77ey3k=;
 b=JdFmt89ur+0S3uVMNE85CXVnZxzlUQSexVm0Qbc5avQ2FyMjGvVDbiZUyF7nuqpXJGZcYdWX7SYh7KsWP0Foxp5JClXXRfyhnm3CiQeV5VR/xYLg3OBKc+2rEbGDkvZlUexfaEYlBneOv2NRaRvIFN0wGzBQYx6qL1P1wnmGlXeJZNzYxAAlcGHoW+wouLr2GbISxuT3FBmIcG1txfPFEIgYIUkbFFPY6EDg9fo/F2Y9LXixmOXq6eiAa9k0yJiRglfK9fc9FxCuORVrRL0PpEi6+LgPvktS7DsVaVOuaf99KvWrrCFv8kZijk4YZYjLK8dha+pI/kPc5cftR08wzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqwSktHFFb7jwO9qUv8hw9uf9WBOMJraxa00f77ey3k=;
 b=g6YbP6qGdNR9BbONn0ry8ouS4sHG4oN2VYnepNI/cMxAYMX3ZPQ8IWRPHvANCe4HXUNkZQ0PRXVNIo+mpReMCE3mbsl159JAa9BbLHTUl8Xzx24k6Frof9FqD6lDaoWOUKr4x4gqw5mbdqkI9shOu1aiiou9C89N0RZ4I+QStTY=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB3231.eurprd04.prod.outlook.com (2603:10a6:802:10::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 07:54:45 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 07:54:45 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWWrmNErF9KioOFUiOW4rlSx+i3akIzj0AgAEF1LA=
Date:   Thu, 16 Jul 2020 07:54:45 +0000
Message-ID: <VE1PR04MB65282D58EE495A38580654B2897F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594823729-8165-1-git-send-email-jun.li@nxp.com>
 <20200715160606.GA761587@kroah.com>
In-Reply-To: <20200715160606.GA761587@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c1ee01e-5b84-4767-8d8b-08d8295d81cd
x-ms-traffictypediagnostic: VI1PR04MB3231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB32312E8088F731C9AD41A685897F0@VI1PR04MB3231.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Lej39SYK5mH88g+kpeXCU/Sg+PR4Ortz6gcseNV4akxlyuY1Vo4Oe7emCcgd8UCK5ILxsxmE4+K/+Ji9zKy9+58C/zWhZ5tp92SQONomiSxuDupf+oT+KaQ1wBi+BDwxFpPLG3mDPxOKAiLKZPsI5O2bBkYZNiBzeg/P/9SXj2U0Carl495HI/h9/IEHf5IHAWqzdb0rIm2pMqlzL9fIL08w1jyqFggJEIKTvgLkOhrNnKVOOO5rFnEOWw5YfPcqtmBhQjAd/psBN/Dboi6hOafdz8Fi5h5YDrgD6NWuRjO7J0bnM+D1DagSB4sUjfTRvDR51vigh2Vp3FfycbSlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(8676002)(316002)(71200400001)(6506007)(33656002)(6916009)(55016002)(9686003)(53546011)(83380400001)(2906002)(26005)(64756008)(44832011)(4326008)(52536014)(66556008)(66446008)(7696005)(66476007)(5660300002)(66946007)(54906003)(478600001)(8936002)(76116006)(186003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +P15aeLWIU1E4LHF9kg/SctYyHE7ZXa6Y1EUragTlnrGZip3E+QzaEHFqQx8RMnus5ScHJYAKAi1COgMORYCoKsMAAN1wQsDfY+pJir7dGyxgANuj+2RIw1jbupqeyukeQ1XKFjoUm6+PfBWvNjjDsXK4pjwpx7w07vNhQ4I7SaYxVN3lD0ypWCtZZpxwm4hvTyAfq6kGTVy87tDPIXCSlczOnOgypCQr+V7c4+WjurfX5LGmSdvSInmbGt1UUgwqbpTl7ODs9xMVv9hRpe1r9zxWBpiT7xKm17+Pm6C4E7V6+o1t7c5d8+WHbe2rWBUtvUHAN7fWDwPbjEYQaS4gzH83DwNJ5oY1qi4m2ukFM+QVUeK6nOMspDrnUL+PXrPX87eT81+pjhKjIWbfDgT0+Oh9oo1t4nC6mgnzNP2pboCJ7i3PfPnGF+RDFD7UD+r3dWnbTyDAe3LliO1LLD7C96RTHr+J/8f6TNgXlgOJC8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1ee01e-5b84-4767-8d8b-08d8295d81cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 07:54:45.8754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOWpdq/udCRU5/zWgvv51Xkco4zRlooaRRIV1jYEkbsoepRfFirOH/SbPe7rS0Ul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3231
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, July 16, 2020 12:06 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: mathias.nyman@intel.com; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH] usb: xhci: add debugfs support for ep with stream
>=20
> On Wed, Jul 15, 2020 at 10:35:29PM +0800, Li Jun wrote:
> > To show the trb ring of streams, use the exsiting ring files of bulk
> > ep to show trb ring of one specific stream ID, which stream ID's trb
> > ring will be shown, is controlled by a new debugfs file stream_id,
> > this is to avoid to create a large number of dir for every allocate
> > stream IDs, another debugfs file stream_context_array is created to
> > show all the allocated stream context array entries.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/usb/host/xhci-debugfs.c | 117
> > +++++++++++++++++++++++++++++++++++++++-
> >  drivers/usb/host/xhci-debugfs.h |  19 +++++++
> >  drivers/usb/host/xhci-mem.c     |   4 +-
> >  drivers/usb/host/xhci.c         |   4 ++
> >  4 files changed, 142 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-debugfs.c
> > b/drivers/usb/host/xhci-debugfs.c index 65d8de4..0e17c4b 100644
> > --- a/drivers/usb/host/xhci-debugfs.c
> > +++ b/drivers/usb/host/xhci-debugfs.c
> > @@ -450,9 +450,10 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd =
*xhci,
> >  	if (!epriv)
> >  		return;
> >
> > +	epriv->show_ring =3D dev->eps[ep_index].ring;
> >  	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
> >  	epriv->root =3D xhci_debugfs_create_ring_dir(xhci,
> > -						   &dev->eps[ep_index].ring,
> > +						   &epriv->show_ring,
> >  						   epriv->name,
> >  						   spriv->root);
> >  	spriv->eps[ep_index] =3D epriv;
> > @@ -474,6 +475,120 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd=
 *xhci,
> >  	kfree(epriv);
> >  }
> >
> > +static int xhci_stream_id_show(struct seq_file *s, void *unused) {
> > +	struct xhci_ep_priv	*epriv =3D s->private;
> > +
> > +	seq_printf(s, "Supported stream IDs are 1 ~ %d, trb ring to be shown =
is for
> stream id %d\n",
> > +		   epriv->stream_info->num_streams - 1, epriv->stream_id);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xhci_stream_id_open(struct inode *inode, struct file
> > +*file) {
> > +	return single_open(file, xhci_stream_id_show, inode->i_private); }
> > +
> > +static ssize_t xhci_stream_id_write(struct file *file,  const char __u=
ser *ubuf,
> > +			       size_t count, loff_t *ppos) {
> > +	struct seq_file         *s =3D file->private_data;
> > +	struct xhci_ep_priv	*epriv =3D s->private;
> > +	int			ret;
> > +	u16			stream_id; /* MaxPStreams + 1 <=3D 16 */
> > +
> > +	/* Decimal number */
> > +	ret =3D kstrtou16_from_user(ubuf, count, 10, &stream_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (stream_id =3D=3D 0 || stream_id >=3D epriv->stream_info->num_stre=
ams)
> > +		return -EINVAL;
> > +
> > +	epriv->stream_id =3D stream_id;
> > +	epriv->show_ring =3D epriv->stream_info->stream_rings[stream_id];
> > +
> > +	return count;
> > +}
> > +
> > +static const struct file_operations stream_id_fops =3D {
> > +	.open			=3D xhci_stream_id_open,
> > +	.write                  =3D xhci_stream_id_write,
> > +	.read			=3D seq_read,
> > +	.llseek			=3D seq_lseek,
> > +	.release		=3D single_release,
> > +};
> > +
> > +static int xhci_stream_context_array_show(struct seq_file *s, void
> > +*unused) {
> > +	struct xhci_ep_priv	*epriv =3D s->private;
> > +	struct xhci_stream_ctx	*stream_ctx;
> > +	dma_addr_t		dma;
> > +	int			id;
> > +
> > +	seq_printf(s, "Allocated %d streams and %d stream context array entri=
es\n",
> > +			epriv->stream_info->num_streams,
> > +			epriv->stream_info->num_stream_ctxs);
> > +
> > +	for (id =3D 0; id < epriv->stream_info->num_stream_ctxs; id++) {
> > +		stream_ctx =3D epriv->stream_info->stream_ctx_array + id;
> > +		dma =3D epriv->stream_info->ctx_array_dma + id * 16;
> > +		if (id < epriv->stream_info->num_streams)
> > +			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma, id,
> > +				   le64_to_cpu(stream_ctx->stream_ring));
> > +		else
> > +			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
> > +				   &dma, le64_to_cpu(stream_ctx->stream_ring));
> > +	}
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(xhci_stream_context_array);
> > +
> > +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
> > +				      struct xhci_virt_device *dev,
> > +				      int ep_index)
> > +{
> > +	struct xhci_slot_priv	*spriv =3D dev->debugfs_private;
> > +	struct xhci_ep_priv	*epriv;
> > +
> > +	if (!spriv || !spriv->eps[ep_index] ||
> > +	    !dev->eps[ep_index].stream_info)
> > +		return;
> > +
> > +	epriv =3D spriv->eps[ep_index];
> > +	epriv->stream_info =3D dev->eps[ep_index].stream_info;
> > +
> > +	/* Show trb ring of stream ID 1 by default */
> > +	epriv->stream_id =3D 1;
> > +	epriv->show_ring =3D epriv->stream_info->stream_rings[1];
> > +	epriv->stream_ctx_dentry =3D debugfs_create_file("stream_context_arra=
y",
> > +					0444, epriv->root, epriv,
> > +					&xhci_stream_context_array_fops);
> > +
> > +	epriv->stream_id_dentry =3D debugfs_create_file("stream_id", 0644,
> > +					epriv->root, epriv,
> > +					&stream_id_fops);
>=20
> Do you really need to save these files off, or could you use
> 'debug_remove_recursive()' to remove them all when the device goes away?
>=20
> > +}
> > +
> > +void xhci_debugfs_remove_stream_files(struct xhci_hcd *xhci,
> > +				      struct xhci_virt_device *dev,
> > +				      int ep_index)
> > +{
> > +	struct xhci_slot_priv	*spriv =3D dev->debugfs_private;
> > +	struct xhci_ep_priv	*epriv;
> > +
> > +	if (!spriv || !spriv->eps[ep_index] ||
> > +	    !dev->eps[ep_index].stream_info)
> > +		return;
> > +
> > +	epriv =3D spriv->eps[ep_index];
> > +	epriv->show_ring =3D dev->eps[ep_index].ring;
> > +	debugfs_remove(epriv->stream_ctx_dentry);
> > +	debugfs_remove(epriv->stream_id_dentry);
> > +}
> > +
> >  void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)  {
> >  	struct xhci_slot_priv	*priv;
> > diff --git a/drivers/usb/host/xhci-debugfs.h
> > b/drivers/usb/host/xhci-debugfs.h index f7a4e24..d4d0af0 100644
> > --- a/drivers/usb/host/xhci-debugfs.h
> > +++ b/drivers/usb/host/xhci-debugfs.h
> > @@ -91,6 +91,11 @@ struct xhci_file_map {  struct xhci_ep_priv {
> >  	char			name[DEBUGFS_NAMELEN];
> >  	struct dentry		*root;
> > +	struct dentry		*stream_ctx_dentry;
> > +	struct dentry		*stream_id_dentry;
>=20
> As I say above, are you sure you need to save these files?

Actually no need after check, whole ep dir will be removed,
I will remove these in v2.

Thanks
Li Jun
>=20
> thanks,
>=20
> greg k-h
