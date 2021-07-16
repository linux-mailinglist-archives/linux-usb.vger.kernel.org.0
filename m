Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3353CB0FE
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 05:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhGPDPM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 23:15:12 -0400
Received: from mail-eopbgr130053.outbound.protection.outlook.com ([40.107.13.53]:22542
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231230AbhGPDPM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 23:15:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpKbkw6vo1EHneDBBwfHy67CbW3DIOqb2N6GYQjdnuQU9qODczPq06bHHQkdR7lvVary5IpYxAjFQ8XHXxekOSFBXZGBEid2R+i4L/0RFS9Xu55sZ90F8E72JyA+d8YPQxTbMbbULzkbzoIKwnKPZdZH7xFd5mIOFNT2/qGHy3Y6bnT4DJKN1oH3VZA1k400vjpbY2dtyDy6c4IvYheJ9w507beTuqjedXUmst4L+lZ/t3DqOFohmJH7tKRLvef+wP3+UAcMRkCP1FSSvos4MfifkP/HMvEdkF0GIsNky5GESXDsjxBjmE0p/ENWydVzhOSv8vP4keLfeJ3/jPkt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdXCSqWJQBNDAWSTl5tjqvu/DaSxAJ+4ZZ3TnaOwqnM=;
 b=iOrNnM/628YCmHM4aabwmYmtR7Jk+LaQIMfXe8MWGfQRhDJdfyVnBNbtmkG8EI0EhdNZp7GelhvIHriOgIW2raaeZTdaDGTEWPeyHW5SgDMOX1oZPYrPr08Fq2z9wAaDIwEoUkOqxzFc52+F8zbmwaWushTXkkQ/XZbmTBLo1taCvvKdx4c+4YKseiA6eQrxqjX4BQ6llcix4taZzXDpWFFKlBbQZPqlY1BWaK0iBaI/vJCKULyuZWIo5OxC+LV0eqDGn6DBPvErBw/aiI9mVI4igcMg/izTHJVh4ncOTqCvGXOUmLV3fNrw2vcOkBk8owZHDGIuRZwZd7r9lxLjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdXCSqWJQBNDAWSTl5tjqvu/DaSxAJ+4ZZ3TnaOwqnM=;
 b=ojke3/Ia8/SAEwZA1RBw2H7JcvsxnJC1D9KilzjNsNE3hy8FInTiwUuuFBcd5gcEw3oX71G3KgxE1dU9GlQQE12t83jPCgsL4W0ZKygAZL5goFlEBWnD8DsSTXE73cSIrN5m5tfwhVbo4MfFEG62pBi5YxjeHgqlYXBwHf4BXsk=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (20.178.204.81) by
 VE1PR04MB7357.eurprd04.prod.outlook.com (20.181.179.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Fri, 16 Jul 2021 03:12:14 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a%4]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 03:12:14 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Topic: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Index: AQHXQxCW2zwo/NGYwk29lWCvxWaIvKsOvmuggDabpLA=
Date:   Fri, 16 Jul 2021 03:12:14 +0000
Message-ID: <VI1PR04MB59357337AC481C31887C474C89119@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
 <1620370682-10199-2-git-send-email-jun.li@nxp.com>
 <VI1PR04MB5935A2455109376878C8440689349@VI1PR04MB5935.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5935A2455109376878C8440689349@VI1PR04MB5935.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc69952f-e9fc-49ba-9868-08d9480782df
x-ms-traffictypediagnostic: VE1PR04MB7357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB735753C00EBC1743BAE8E5DF89119@VE1PR04MB7357.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5FePKh5bEi02NhakB02naU3w1iOKo6kws18G/wRnhRNTe+zqzz5TaQnqmpNXxQ97zARcGpqQo9GnAAQZZvHWA11IQD7iD5Ws3x+NDW17YlfQCnkP7WvCqct5Irh2zgwinxWoAsAQPKNcRBYz+SfoMzsLN4+iCBAgKHVZAc8W3bLrhYt4PMmIkvZM3obE8ZLsSnylqopYk5ZQEoYojSKvno9m5EgIAdy1vIcYazcklu4xnGd2K5oqLW9O3x9QdHF+m1ahVYdwPy9+Wm2qwGd3nE7bwtDyneQCz8UlNEVqkD5d04UItjkIpPJbpOQaAPpOb0peTnTM5xVr36mJWD+QyotQm931Y/lXy6ufz7UNNhaAMW+PnoEWELzM3VlQCyBiVOA3ulG2Iahki6RM16wqWtZf75Lk57BcxZLcELUcCtyeJUmbwwfYM3h1ocU+qz2XzXqIfwguVJ/qf4Nkkvt10JjXL/n6dGDSPq9egpYCyn0GHdKCYqW1p7IBxxNdmf7xts8s4H6OBSyyMMPRJzt2E3wA6ajlpwb93y/PtL6xOkKP0zCqO6fZ7ZuqjShUb0LVNals5rHgo7l3XmZo/JzM9BzzTKG/b+R2zEHj8OKY8zBuWkKyeGMHmSo3lYItNORuRaVHT6Q3EiVsqtq16zgj8+SXHqCgf6dTuX+OYN6ferFpvCEHqX0N3iOST+aVHIt2pE8t3tvXqS8NLWYsyiphQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(7696005)(5660300002)(52536014)(8936002)(110136005)(316002)(122000001)(83380400001)(55016002)(4326008)(186003)(8676002)(38100700002)(9686003)(44832011)(66446008)(53546011)(64756008)(54906003)(66476007)(6506007)(66556008)(26005)(66946007)(76116006)(71200400001)(2906002)(478600001)(86362001)(33656002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qjreZ0kSr9sPQYg0K2G8a95+OFvfqK/pnv99DZdBYDSL/XsO0et7L/eud1Wb?=
 =?us-ascii?Q?Jr6gWYhMQJql3sTqfzQ9bkJMq0UxboP2GGJuB3QK+I62u6ECF7dT8ASqZbSy?=
 =?us-ascii?Q?wGTIjXCMuUz6Ixv8/rAO2dVogkXRo3t3KffVcnCDRL3SiIuS+rY3v0GNXqih?=
 =?us-ascii?Q?GMCmOTOEjT1BfKrgmfDsML6SfHS3E+HljP3POHNLrR3WTDR4XQYvfTQ1Bgwz?=
 =?us-ascii?Q?+b96OJjGeXw8wWr3hnBXTAttGUyE32qTHAZNX/ElgTi1g+4D1PfEV1OC3qxk?=
 =?us-ascii?Q?2M26HIeMbslDpNaa9WOvseJP6Hz4flyO3yrpyMexqomxrzHlDlOBJ1PqKX2p?=
 =?us-ascii?Q?UEx6aDZkWd3wgbNvy2k+k0w5WlzXzJyTQNTgfTWCS1wZofLxXalkeOB7yET1?=
 =?us-ascii?Q?327yeWI+4YTxZUGncH6xmR48F5Nl0KYOVK0dWeizLqifUJlPqmtWTinWwqHV?=
 =?us-ascii?Q?iIWPNNp79xkKmWOwtmuFAW2CNFrKviS0GC7E7SIXkcpA5yMxSGeLakuqe48M?=
 =?us-ascii?Q?Bm7Tnn9i6xRWFQv07HnQFm+Qq8qHu6YQvnre4JlB/UYiEwV5JW5XUvl3Na0l?=
 =?us-ascii?Q?kEZSgBkCpMRyGLamuYD3ybGRSUoA1yl6UAvINLcb2SSzoDRKC7J0qI5VUzUm?=
 =?us-ascii?Q?TkA16VF48JEDykMj+FsoZTDkT1nhwnkpmfYSfwlCJD677mG97lGsGKk7GsTE?=
 =?us-ascii?Q?wdwDQSU7LTWMT6WYnm2zKieleYFuQVR652O0YxkaOoXQus1mf1vM0MG13Q8Q?=
 =?us-ascii?Q?5GMmn6aAMCrLSK0P7sTEpz//hvGpq/bvix4nf33Ltw3MNI+UVH10TV6EV6A8?=
 =?us-ascii?Q?zmIeW8Mhccjtz5hKCSuaXsDBKoEHbaOX6Rof+uSWOw730+Po21UiZ3azPc/p?=
 =?us-ascii?Q?lDjVgGEzjw4YTN2WMIJ452bmmTf2xC9VG4XFbO/qXJ2MvGWrOJA9P+L7PCGT?=
 =?us-ascii?Q?WQj6m98kiIZTRSkeyqQ2QfD7RgYB92+EStlplxd2INfuo9aHzmf0pDuDESl8?=
 =?us-ascii?Q?748l/bldmkTTvwI3oWBAuFLrNSGCwXClzG0RMckQ3UMna8JM9bQDpX/Vh2+T?=
 =?us-ascii?Q?5JaaBxZ1bBfJZweznVtQXJNggOiqPiciy4dMYQXDXNL4O0P+/MPcWUDGb5R+?=
 =?us-ascii?Q?zPJoK4x7EtDulNqjwmsNAX7pzxzldZpYjyaUwuWEDHlxvfWY6stnXTZGROZz?=
 =?us-ascii?Q?Tw+VvFljiMjlCfi/VxPL8SZXETdXITzgLeUY1jqWQguZG6q0kNaUJgl4+EqF?=
 =?us-ascii?Q?E144DdrebCcpVvErx0kqh4tFTOKhM34PhS51GB1B/otciL6HbzPma8bQ2TgR?=
 =?us-ascii?Q?9wg6ErZ43tT7K4UbXEanM6rp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc69952f-e9fc-49ba-9868-08d9480782df
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 03:12:14.5909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYT6+yFJ6n9Kfja5u9D7XCvEWIL6kyhGIlWoOogPFbCwZSOlwFJjwgc6tur31cdE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

> -----Original Message-----
> From: Jun Li
> Sent: Friday, June 11, 2021 5:19 PM
> To: mathias.nyman@intel.com
> Cc: peter.chen@kernel.org; jackp@codeaurora.org;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> gregkh@linuxfoundation.org; stern@rowland.harvard.edu
> Subject: RE: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATU=
RE
> Test for USB2
>=20
>=20
>=20
> > -----Original Message-----
> > From: Jun Li <jun.li@nxp.com>
> > Sent: Friday, May 7, 2021 2:58 PM
> > To: gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> > mathias.nyman@intel.com
> > Cc: peter.chen@kernel.org; Jun Li <jun.li@nxp.com>;
> > jackp@codeaurora.org; linux-usb@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>
> > Subject: [PATCH v3 2/3] usb: host: xhci: add EH
> > SINGLE_STEP_SET_FEATURE Test for USB2
> >
> > From: Peter Chen <peter.chen@nxp.com>
> >
> > This function is similar with EHCI's, but implemented using XHCI.
> > The USB2 host needs to send SETUP packet first, then wait 15 seconds
> > before DATA (IN) + STATUS stage.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > Change for v3:
> > - No change.
> >
> > Change for v2:
> > - No change.
> >
> >  drivers/usb/host/xhci-hub.c  |  10 +++  drivers/usb/host/xhci-ring.c
> > | 123 +++++++++++++++++++++++++++++++++++
> >  drivers/usb/host/xhci.c      |   1 +
> >  drivers/usb/host/xhci.h      |  10 +++
> >  4 files changed, 144 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> > index e9b18fc17617..c64ee95cc89b 100644
> > --- a/drivers/usb/host/xhci-hub.c
> > +++ b/drivers/usb/host/xhci-hub.c
> > @@ -1511,6 +1511,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16
> > typeReq,
> > u16 wValue,
> >  			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
> >  			if (hcd->speed !=3D HCD_USB2)
> >  				goto error;
> > +
> > +#ifdef CONFIG_USB_HCD_TEST_MODE
> > +			if (test_mode =3D=3D EHSET_TEST_SINGLE_STEP_SET_FEATURE) {
> > +				spin_unlock_irqrestore(&xhci->lock, flags);
> > +				retval =3D ehset_single_step_set_feature(hcd,
> > +								wIndex + 1);
> > +				spin_lock_irqsave(&xhci->lock, flags);
> > +				break;
> > +			}
> > +#endif
> >  			if (test_mode > USB_TEST_FORCE_ENABLE ||
> >  			    test_mode < USB_TEST_J)
> >  				goto error;
> > diff --git a/drivers/usb/host/xhci-ring.c
> > b/drivers/usb/host/xhci-ring.c index 05c38dd3ee36..87a9c1e3325a 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -3793,6 +3793,129 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci,
> > gfp_t mem_flags,
> >  	return 0;
> >  }
> >
> > +#ifdef CONFIG_USB_HCD_TEST_MODE
> > +/*
> > + * This function prepare TRBs and submits them for the
> > + * SINGLE_STEP_SET_FEATURE Test.
> > + * This is done in two parts: first SETUP req for GetDesc is sent
> > +then
> > + * 15 seconds later, the IN stage for GetDesc starts to req data from
> > +dev
> > + *
> > + * is_setup : argument decides which of the two stage needs to be
> > + * performed; TRUE - SETUP and FALSE - IN+STATUS
> > + * Returns 0 if success
> > + */
> > +int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
> > +	struct urb *urb, int is_setup)
> > +{
> > +	int slot_id;
> > +	unsigned int ep_index;
> > +	struct xhci_ring *ep_ring;
> > +	int ret;
> > +	struct usb_ctrlrequest *setup;
> > +	struct xhci_generic_trb *start_trb;
> > +	int start_cycle;
> > +	u32 field, length_field, remainder;
> > +	struct urb_priv *urb_priv;
> > +	struct xhci_td *td;
> > +	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
> > +
> > +	/* urb_priv will be free after transcation has completed */
> > +	urb_priv =3D kzalloc(sizeof(struct urb_priv) +
> > +			sizeof(struct xhci_td), GFP_KERNEL);
> > +	if (!urb_priv)
> > +		return -ENOMEM;
> > +
> > +	td =3D &urb_priv->td[0];
> > +	urb_priv->num_tds =3D 1;
> > +	urb_priv->num_tds_done =3D 0;
> > +	urb->hcpriv =3D urb_priv;
> > +
> > +	ep_ring =3D xhci_urb_to_transfer_ring(xhci, urb);
> > +	if (!ep_ring) {
> > +		ret =3D -EINVAL;
> > +		goto free_priv;
> > +	}
> > +
> > +	slot_id =3D urb->dev->slot_id;
> > +	ep_index =3D xhci_get_endpoint_index(&urb->ep->desc);
> > +
> > +	setup =3D (struct usb_ctrlrequest *) urb->setup_packet;
> > +	if (is_setup) {
> > +		ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
> > +				ep_index, urb->stream_id,
> > +				1, urb, 0, GFP_KERNEL);
> > +		if (ret < 0)
> > +			goto free_priv;
> > +
> > +		start_trb =3D &ep_ring->enqueue->generic;
> > +		start_cycle =3D ep_ring->cycle_state;
> > +		/* Save the DMA address of the last TRB in the TD */
> > +		td->last_trb =3D ep_ring->enqueue;
> > +		field =3D TRB_IOC | TRB_IDT | TRB_TYPE(TRB_SETUP) | start_cycle;
> > +		/* xHCI 1.0/1.1 6.4.1.2.1: Transfer Type field */
> > +		if ((xhci->hci_version >=3D 0x100) ||
> > +				(xhci->quirks & XHCI_MTK_HOST))
> > +			field |=3D TRB_TX_TYPE(TRB_DATA_IN);
> > +
> > +		queue_trb(xhci, ep_ring, false,
> > +			  setup->bRequestType | setup->bRequest << 8 |
> > +			  le16_to_cpu(setup->wValue) << 16,
> > +			  le16_to_cpu(setup->wIndex) |
> > +			  le16_to_cpu(setup->wLength) << 16,
> > +			  TRB_LEN(8) | TRB_INTR_TARGET(0),
> > +			  /* Immediate data in pointer */
> > +			  field);
> > +		giveback_first_trb(xhci, slot_id, ep_index, urb->stream_id,
> > +				start_cycle, start_trb);
> > +		return 0;
> > +	}
> > +
> > +	ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
> > +			ep_index, urb->stream_id,
> > +			2, urb, 0, GFP_KERNEL);
> > +	if (ret < 0)
> > +		goto free_priv;
> > +
> > +	start_trb =3D &ep_ring->enqueue->generic;
> > +	start_cycle =3D ep_ring->cycle_state;
> > +	field =3D TRB_ISP | TRB_TYPE(TRB_DATA);
> > +
> > +	remainder =3D xhci_td_remainder(xhci, 0,
> > +				   urb->transfer_buffer_length,
> > +				   urb->transfer_buffer_length,
> > +				   urb, 1);
> > +
> > +	length_field =3D TRB_LEN(urb->transfer_buffer_length) |
> > +		TRB_TD_SIZE(remainder) |
> > +		TRB_INTR_TARGET(0);
> > +
> > +	if (urb->transfer_buffer_length > 0) {
> > +		field |=3D TRB_DIR_IN;
> > +		queue_trb(xhci, ep_ring, true,
> > +				lower_32_bits(urb->transfer_dma),
> > +				upper_32_bits(urb->transfer_dma),
> > +				length_field,
> > +				field | ep_ring->cycle_state);
> > +	}
> > +
> > +	td->last_trb =3D ep_ring->enqueue;
> > +	field =3D TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state;
> > +	queue_trb(xhci, ep_ring, false,
> > +			0,
> > +			0,
> > +			TRB_INTR_TARGET(0),
> > +			field);
> > +
> > +	giveback_first_trb(xhci, slot_id, ep_index, 0,
> > +			start_cycle, start_trb);
> > +
> > +	return 0;
> > +free_priv:
> > +	xhci_urb_free_priv(urb_priv);
> > +	return ret;
> > +}
> > +#endif /* CONFIG_USB_HCD_TEST_MODE */
> > +
> >  /*
> >   * The transfer burst count field of the isochronous TRB defines the
> > number of
> >   * bursts that are required to move all packets in this TD.  Only
> > SuperSpeed diff --git a/drivers/usb/host/xhci.c
> > b/drivers/usb/host/xhci.c index
> > ca9385d22f68..a27616775845 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -5426,6 +5426,7 @@ static const struct hc_driver xhci_hc_driver =3D =
{
> >  	.disable_usb3_lpm_timeout =3D	xhci_disable_usb3_lpm_timeout,
> >  	.find_raw_port_number =3D	xhci_find_raw_port_number,
> >  	.clear_tt_buffer_complete =3D xhci_clear_tt_buffer_complete,
> > +	.submit_single_step_set_feature	=3D
> > xhci_submit_single_step_set_feature,
> >  };
> >
> >  void xhci_init_driver(struct hc_driver *drv, diff --git
> > a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h index
> > 2595a8f057c4..f93fc8f59af6 100644
> > --- a/drivers/usb/host/xhci.h
> > +++ b/drivers/usb/host/xhci.h
> > @@ -2165,6 +2165,16 @@ int xhci_find_raw_port_number(struct usb_hcd
> > *hcd, int port1);  struct xhci_hub *xhci_get_rhub(struct usb_hcd
> > *hcd);
> >
> >  void xhci_hc_died(struct xhci_hcd *xhci);
> > +#ifdef CONFIG_USB_HCD_TEST_MODE
> > +int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
> > +	struct urb *urb, int is_setup);
> > +#else
> > +static inline int xhci_submit_single_step_set_feature(struct usb_hcd
> > *hcd,
> > +	struct urb *urb, int is_setup)
> > +{
> > +	return 0;
> > +}
> > +#endif
> >
> >  #ifdef CONFIG_PM
> >  int xhci_bus_suspend(struct usb_hcd *hcd);
> > --
> > 2.25.1
>=20
> A gentle ping.

Could you please take a look this patch?

Thanks=20
> Li Jun

