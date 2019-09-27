Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A608EBFF8B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 09:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfI0HDW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 03:03:22 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:29903
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725836AbfI0HDW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 03:03:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avb4maYLWxva7bgNLUr36ZeKPeDQH3pfwHumeXEP+3n5tp6mY6Pz3gS1etKZMhK0I9ZmV/WG1abWiPqo1oyAH36achA/jEF6LYhRpBO6HZDrdOhOMPRmxRdUYr/gYeznxQIIDlVpPBDGKn8dGXrVAvdSlZ1/a66qVTG8Q07wLiaCdwIDnJKB4Ukh9EWoMYuEL6CiN6MvO4wJ213E7OXJI7tm8OtkGC7AdXSqzeClgIRC/lPh5tDHVbM1yTMDQNPs7RBQYP0wo9tBwY31bz3tffwfQPhRojLHYd80jDArIvn889oCB28DylVsYZYKbgOb5bx/TepeoPyQZ7edlhjJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssx7L05ATyXe7ywv/ZPu3fSJTRAoTHSy3XuaTzp+yU8=;
 b=J/y+Q4L+UjzIl4HkosnDhGV6tZPJWQ4nkcwAfOH4qkl1madZrPSRelv91AgDIulag5dSyAMj5DBoVT5NdVr260M6s7F+PybQaJBPUZzT9cUGzXGGj9/UJMfNKDEaVj/54qJpgr9JSAfxWJPMinPBsdbCHaNruIzi3WpaeIZIUz1eYBgRD3JtI9nGhlSAdH17Q78bTlkEi5GBoVpkbeMCpQkPys8mtGT8hegLoQ7mNyE3kJiX/XYAYBG1NgaUz40IYmhcfWT3FHF0VdUYw8kswk15nF0nmf8j2I3IqwnjRrtF/imSZvArqtjcpYxojAkFP6c9sOVqvSm0GQtZOieSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssx7L05ATyXe7ywv/ZPu3fSJTRAoTHSy3XuaTzp+yU8=;
 b=aigktuisI3RjbWsfvvQ/x3pwQGhtVnwqFUgb375vGuIHK1dBtnnuwTSe+/BWcKZm6J48KL8SpVZ6aSZCBZt2ROknPQ8vxHbyxHrX5jKnmpTB752TIzyZG6ejU3GZvSay7L5IH3QWi4/K7i3Pfg19Hpr9mogRcCnKebZzxTEVW54=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5712.eurprd04.prod.outlook.com (20.178.126.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 07:03:16 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 07:03:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: host: xhci: update event ring dequeue pointer on
 purpose
Thread-Topic: [PATCH 1/1] usb: host: xhci: update event ring dequeue pointer
 on purpose
Thread-Index: AQHVcrMKaurOoYA1KEG+PiAfH5L+xac9xBWAgAFaaoA=
Date:   Fri, 27 Sep 2019 07:03:14 +0000
Message-ID: <20190927070531.GA2609@b29397-desktop>
References: <20190924083727.22260-1-peter.chen@nxp.com>
 <0e024b5e-8cc4-438f-920b-6a3523c241ae@linux.intel.com>
In-Reply-To: <0e024b5e-8cc4-438f-920b-6a3523c241ae@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b0b95d0-15a2-4092-94fc-08d74318c520
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB5712:|VI1PR04MB5712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5712E023985481ACAE90F1378B810@VI1PR04MB5712.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(396003)(376002)(136003)(366004)(199004)(189003)(446003)(6506007)(26005)(53546011)(8676002)(4326008)(6916009)(86362001)(76176011)(64756008)(14454004)(66556008)(66446008)(229853002)(91956017)(6246003)(33656002)(54906003)(15650500001)(14444005)(76116006)(66946007)(66476007)(6436002)(81156014)(2906002)(256004)(476003)(316002)(81166006)(6486002)(44832011)(6512007)(186003)(9686003)(11346002)(5660300002)(486006)(66066001)(33716001)(25786009)(6116002)(305945005)(478600001)(8936002)(3846002)(102836004)(7736002)(71190400001)(71200400001)(99286004)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5712;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7QKEGzgwjL6ITW25pdhGabY+L+v8+niW++AgEFSkJVTswDaPJuMDM/zl/0g2QbDbFzdotH9fph0EKg5fe3Gy4I7DmyvSmdFSR7URY9UNb8QQUK2BwN54/H9yzmsPa0mEnay88B2IlzsYgmqX6xCzKsHDhSqB/kY4CMNZKTNtAcL4yyigu5SmKRRlz87PtbYp35PDJqKHeuL5kfamyNApmH9+IAN6c2WENC+IEvuGXchW9mBCze+QNCpiagDgWTKWP63+WZbMQ6G0HDNX5fI8qWGid9t3dbPSHfcxfR/xZRDLnYDmqOGbmR+0dMo4Zjor4nxkKCA3UwUFF2cJTxpduVw/n/27onRK2JLgcM36mTX4rxUqnLMFYyU0g0ccg6JGmZLPt2hJNSHoQ2MTOyqhHU1agvTDYamTeLv+27Zv/G4=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61C2F48507529144A7A816A11BA5772C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b95d0-15a2-4092-94fc-08d74318c520
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 07:03:15.3732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7uXpWnLp5DZCzjSD6dylq40DtqJWReqjppMN6q022bvFarPZe7KwKUhd8yWuiNgum5vYx0p2U6TrqS17/77Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5712
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-09-26 13:25:39, Mathias Nyman wrote:
> On 24.9.2019 11.35, Peter Chen wrote:
> > On some situations, the software handles TRB events slower
> > than adding TRBs, then xhci_handle_event can't return zero
> > long time, the xHC will consider the event ring is full,
> > and trigger "Event Ring Full" error, but in fact, the software
> > has already finished lots of events, just no chance to
> > update ERDP (event ring dequeue pointer).
> >=20
> > In this commit, we force update ERDP if half of TRBS_PER_SEGMENT
> > events have handled to avoid "Event Ring Full" error.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >   drivers/usb/host/xhci-ring.c | 53 ++++++++++++++++++++++++-----------=
-
> >   1 file changed, 36 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.=
c
> > index e220bcbee173..92b6b07cf33d 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -2737,6 +2737,35 @@ static int xhci_handle_event(struct xhci_hcd *xh=
ci)
> >   	return 1;
> >   }
> > +/*
> > + * Update Event Ring Dequeue Pointer:
> > + * - When all events have finished
> > + * - To avoid "Event Ring Full Error" condition
> > + */
> > +static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> > +		union xhci_trb *event_ring_deq)
> > +{
> > +	u64 temp_64;
> > +	dma_addr_t deq;
> > +
> > +	temp_64 =3D xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
> > +	/* If necessary, update the HW's version of the event ring deq ptr. *=
/
> > +	if (event_ring_deq !=3D xhci->event_ring->dequeue) {
> > +		deq =3D xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
> > +				xhci->event_ring->dequeue);
> > +		if (deq =3D=3D 0)
> > +			xhci_warn(xhci, "WARN something wrong with SW event "
> > +					"ring dequeue ptr.\n");
> > +		/* Update HC event ring dequeue pointer */
> > +		temp_64 &=3D ERST_PTR_MASK;
> > +		temp_64 |=3D ((u64) deq & (u64) ~ERST_PTR_MASK);
> > +	}
> > +
> > +	/* Clear the event handler busy flag (RW1C) */
> > +	temp_64 |=3D ERST_EHB;
> > +	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
> > +}
> > +
> >   /*
> >    * xHCI spec says we can get an interrupt, and if the HC has an error=
 condition,
> >    * we might get bad data out of the event ring.  Section 4.10.2.7 has=
 a list of
> > @@ -2748,9 +2777,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
> >   	union xhci_trb *event_ring_deq;
> >   	irqreturn_t ret =3D IRQ_NONE;
> >   	unsigned long flags;
> > -	dma_addr_t deq;
> >   	u64 temp_64;
> >   	u32 status;
> > +	int event_loop =3D 0;
> >   	spin_lock_irqsave(&xhci->lock, flags);
> >   	/* Check if the xHC generated the interrupt, or the irq is shared */
> > @@ -2804,24 +2833,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
> >   	/* FIXME this should be a delayed service routine
> >   	 * that clears the EHB.
> >   	 */
> > -	while (xhci_handle_event(xhci) > 0) {}
> > -
> > -	temp_64 =3D xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
> > -	/* If necessary, update the HW's version of the event ring deq ptr. *=
/
> > -	if (event_ring_deq !=3D xhci->event_ring->dequeue) {
> > -		deq =3D xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
> > -				xhci->event_ring->dequeue);
> > -		if (deq =3D=3D 0)
> > -			xhci_warn(xhci, "WARN something wrong with SW event "
> > -					"ring dequeue ptr.\n");
> > -		/* Update HC event ring dequeue pointer */
> > -		temp_64 &=3D ERST_PTR_MASK;
> > -		temp_64 |=3D ((u64) deq & (u64) ~ERST_PTR_MASK);
> > +	while (xhci_handle_event(xhci) > 0) {
> > +		if (event_loop++ < TRBS_PER_SEGMENT / 2)
> > +			continue;
> > +		xhci_update_erst_dequeue(xhci, event_ring_deq);
> > +		event_loop =3D 0;
> >   	}
> > -	/* Clear the event handler busy flag (RW1C); event ring is empty. */
> > -	temp_64 |=3D ERST_EHB;
> > -	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
> > +	xhci_update_erst_dequeue(xhci, event_ring_deq);
>=20
> Otherwise looks good, but in rare cases when we handle  TRBS_PER_SEGMENT/=
2 events
> we might write the ERST twice in a row with the same dequeue value.
>=20
> xHCI specification section 4.9.4 forbids this:
>=20
> "Note: Software writes to the ERDP register shall always advance the Even=
t Ring
> Dequeue Pointer value, i.e. software shall not write the same value to th=
e ERDP
> register on two consecutive write operations."
>=20

Thanks Mathias.

I am evaluating the change that compares value reading from register
xhci->ir_set->erst_dequeue and the software dequeue pointer at my
two xHCI platforms, some changes like below:

+static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+		union xhci_trb *event_ring_deq)
+{
+	u64 temp_64;
+	dma_addr_t deq;
+
+	temp_64 =3D xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+	/* If necessary, update the HW's version of the event ring deq ptr. */
+	if (event_ring_deq !=3D xhci->event_ring->dequeue) {
+		deq =3D xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
+				xhci->event_ring->dequeue);
+		if (deq =3D=3D 0)
+			xhci_warn(xhci, "WARN something wrong with SW event "
+					"ring dequeue ptr.\n");
+
+		/*
+		 * Per 4.9.4, Software writes to the ERDP register shall
+		 * always advance the Event Ring Dequeue Pointer value.
+		 */
+		if ((temp_64 & (u64) ~ERST_PTR_MASK) =3D=3D
+				((u64) deq & (u64) ~ERST_PTR_MASK))
+			return;
+
+		/* Update HC event ring dequeue pointer */
+		temp_64 &=3D ERST_PTR_MASK;
+		temp_64 |=3D ((u64) deq & (u64) ~ERST_PTR_MASK);
+	}
+
+	/* Clear the event handler busy flag (RW1C) */
+	temp_64 |=3D ERST_EHB;
+	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
+}
+

Regarding the comments you raised, I have a question, what's the
situation the xHC ERDP is not updated after calling xhci_handle_event
(event_ring_deq =3D=3D xhci->event_ring->dequeue)?

If this condition is existed, then software will write the same value
twice at ERDP register?

--=20

Thanks,
Peter Chen=
