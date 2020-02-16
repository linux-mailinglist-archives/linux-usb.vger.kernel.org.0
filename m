Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B83160430
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 14:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgBPNnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 08:43:02 -0500
Received: from mail-eopbgr60046.outbound.protection.outlook.com ([40.107.6.46]:57157
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgBPNnC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Feb 2020 08:43:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN93HU0jKxuhtOYf5F7N88qS1pVSWW3bPCENLJY67Gi3+FZ3cnhyuOM0eVJX1+UJ9CScMringH13ppMPAWN1KXXCRJYY9SCnZVrriLRfYdd5hRej5K8EhAFojlktxSgpAkjSulxrCc8h9aPrRY9Aq/qMsIMyYhufpuA9/+QZeW9gWiT6aKNIvb4LpjlngTJop8FkhOANn2HvNjZp+neomaEXJJz0uIkT2pZnpw/yy3qtkOZzGenhc+zRN1D7oLu/TV7y5a4Eicv6FU9SxgP0D0Op4eoTUFgTgWFZ+hXWOdQrRV54pmpGt85BY+xxCLxUIYiRf/jjep5nkiJN2p40hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4/g72CKUmyqG15DI3JkKgy897rr7JKD/dyb/WkP/ec=;
 b=MiZDOttv3WfcDWbwuCOjHeDGoVFyCP2G9z3sic1Fzmda5F8pOEtjit+uUy97/nIB8gMrZru05JPQNBlPhxBHslZUmQqgYckF7UlUXISxxcjyE+aVc3iQCMTKHdocKQl6JReRkblTTUJhaIF97l8MfTBEwSNpeFSdq0+4EG0bG/JeYXpM1kPoWyKyNrDEYEHFe7Sd8sL2HBdxMh1Sb8c7zD7c6XeAK1HwJaNAHLkCd7+WxL2zP+CaHQAS1Y5K6F2BB5xkKvarbqfAKBg64sQ1WyUTHr99naYxHoFmg/IQVGQw7z+KB8Onm+DzAXIjVNAHoLEZgU/SkXtjDdsoIIr5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4/g72CKUmyqG15DI3JkKgy897rr7JKD/dyb/WkP/ec=;
 b=p2A3icez56F0o2wkD6qP3XD1M04rN5KJpKn9TrAeAKO/T0Mr3jIRN9SDHAX8K8WUy+IFok40yS151hz7a/FeHCa29eS+AsVaSygZksAGCU3Sr5uSAf6u3oyPkYNswQFi5yr4HgRYRKyYI7dc7iZ500yi+X/kAR/a/u47qBbTwz4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4925.eurprd04.prod.outlook.com (20.177.52.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.27; Sun, 16 Feb 2020 13:42:55 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.028; Sun, 16 Feb 2020
 13:42:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Pawel Laszczak <pawell@cadence.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Topic: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Index: AQHV4wZvpgdaVZifT0KdjSwZbI+W/KgaTmsAgAOJg4A=
Date:   Sun, 16 Feb 2020 13:42:54 +0000
Message-ID: <20200216134255.GA12539@b29397-desktop>
References: <20200214071414.7256-1-peter.chen@nxp.com>
 <20200214071414.7256-3-peter.chen@nxp.com>
 <BYAPR07MB47098D0E50FA44A8111E94A2DD150@BYAPR07MB4709.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB47098D0E50FA44A8111E94A2DD150@BYAPR07MB4709.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ed93d902-2556-44fe-1250-08d7b2e62067
x-ms-traffictypediagnostic: VI1PR04MB4925:|VI1PR04MB4925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4925F2138AA821B3EFF851568B170@VI1PR04MB4925.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(199004)(189003)(66946007)(33716001)(6512007)(76116006)(9686003)(6916009)(91956017)(66446008)(66476007)(66556008)(64756008)(53546011)(186003)(316002)(86362001)(6486002)(4326008)(6506007)(26005)(44832011)(5660300002)(81166006)(8936002)(54906003)(1076003)(71200400001)(2906002)(8676002)(33656002)(478600001)(81156014)(414714003)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4925;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nd9R0orFXK/aY5/aFHFygVVc8tTuVKFVhYdDBl+6qk16XdyVIP3qrffHajCEDIpmA2FkUnJNcdAYlhn+4MPXgFEMRWg0eLTbZkjH98DYBfk7H2+2enDmARYfpBzdd89YFsMer2fh5bIlWGegn0yrCCHk6POVPjP5Td8fZiLHXlrSWHCW/UZ5ekwgbqRnPEnK+a4TYCKLveAXHD3UsJpeLx/9jzla/I/pgLkq5WWcYLPw+8gXGLRhgXfLLf4AnjNxZgyNtUXOl/kG2h32IqsTHx2x8U7EgYgTpJdfIhlCCJgYrq3w3ZX8gFhK954GnNHj3Pf7/MYqEwoI+nB2XmphG24Z7ahVQIuEoI502V58GNZISo4PrfF2ptKzw0GvwyLg7lZyAB+IEvydU/4L58lHediObfVefvtpkd7DwGebZQZFz9UojGV6LoenaKDnQh4VhL2VNrBgE5VpZUc/djLfmYbcLeC6aMrL5ss3rQ7x2tqmvCTUxQnVFtPQTc52i8bYiW1Rafx37sxS9InT+mHjQA==
x-ms-exchange-antispam-messagedata: YlfasiDkMwpWnaPfL+yVigvMCCwXtEKpV91K83QW3gfqBHFsD0WIprEy4xju0/oJJN1pPskUyuNytT0beYYWXRwhJIS4YAQq+RPmTcamKuL81hs2TQAMdr90A0ENqByePRcBiZT0iieKZ/y3B49tAg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78EC86EBED378F4091EC5A54CEC1EF73@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed93d902-2556-44fe-1250-08d7b2e62067
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2020 13:42:54.8924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpWJXsyLH6x+2XTaLCX+zfZtXDas1TRPv9LiFAzw7gEY0SUhz79hR1/Uxiu1s03p821ihyRiNWPee1jAgwRypA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4925
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-14 07:41:58, Pawel Laszczak wrote:
> >
> >If there are TRBs pending during clear stall and reset endpoint, the
> >DMA will advance after reset operation, but it doesn't be expected,
> >since the data has still not be ready (For OUT, the data has still
> >not received). After the data is ready, there isn't any interrupt
> >since the EP_TRADDR has already points to next TRB entry.
> >
> >To fix it, it toggles cyclt bit before reset operation, and restore
> >it after reset, it could keep DMA stopping.
> >
> >Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> >Signed-off-by: Peter Chen <peter.chen@nxp.com>
> >---
> > drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
> > 1 file changed, 14 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> >index 1d8a2af35bb0..7b6bb96b91d1 100644
> >--- a/drivers/usb/cdns3/gadget.c
> >+++ b/drivers/usb/cdns3/gadget.c
> >@@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_en=
dpoint *priv_ep)
> > {
> > 	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> > 	struct usb_request *request;
> >+	struct cdns3_request *priv_req;
> >+	struct cdns3_trb *trb =3D NULL;
> > 	int ret;
> > 	int val;
> >
> > 	trace_cdns3_halt(priv_ep, 0, 0);
> >
> >+	request =3D cdns3_next_request(&priv_ep->pending_req_list);
> >+	if (request) {
> >+		priv_req =3D to_cdns3_request(request);
> >+		trb =3D priv_req->trb;
> >+		if (trb)
> >+			trb->control =3D trb->control ^ 1;
> >+	}
> >+
>=20
> What about doing simple read/write on ep_traddr register:
> 	u32 ep_traddr;=20
> 	ep_traddr =3D readl(&priv_dev->regs->ep_traddr);
>=20
> > 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> =09
> 	writel(&priv_dev->regs->ep_traddr, ep_traddr);
> =09
> It should work in the same way but is simpler. =20

No, we can't do thing like this since the controller may change
TRB content during the reset. The trb address 0x96003024 is the
pending one. At this context, I still not add changes for link trb.

    file-storage-4050  [003] d..1   128.390623: cdns3_ep_queue: ep1out: req=
: ffff8008366ac100, req buff ffff8008378b0000, length: 0/1024 , status: -11=
5, trb: [start:2, end:2: virt addr 0x0000000000000000], flags:0=20
    file-storage-4050  [003] d..1   128.390628: cdns3_log: 5b110000.usb3: W=
A1 set guard

    file-storage-4050  [003] d..1   128.390633: cdns3_log: 5b110000.usb3: d=
orbel 1, dma_index 2, prev_enqueu 3
    file-storage-4050  [003] d..1   128.390637: cdns3_log: 5b110000.usb3: W=
A1: update cycle bit

    file-storage-4050  [003] d..1   128.390639: cdns3_prepare_trb: ep1out: =
trb ffff00000a418024, dma buf: 0xfc7a1000, size: 1024, burst: 16 ctrl: 0x00=
000425 (C=3D1, T=3D0, ISP, IOC, Normal)
    file-storage-4050  [003] d..1   128.390642: cdns3_log: 5b110000.usb3: U=
pdate ep_trbaddr for ep1out to 96003024

    file-storage-4050  [003] d..1   128.390647: cdns3_ring:=20
		Ring contents for ep1out:
		Ring deq index: 3, trb: ffff00000a418024 (virt), 0x96003024 (dma)
		Ring enq index: 4, trb: ffff00000a418030 (virt), 0x96003030 (dma)
		free trbs: 28, CCS=3D1, PCS=3D1
		@0x0000000096003000 fc79f000 0000001f 00000427
		@0x000000009600300c fc7a0000 0000001f 00000427
		@0x0000000096003018 fc7a0800 10020400 00000425
		@0x0000000096003024 fc7a1000 10020400 00000425
		@0x0000000096003030 00000000 00000000 00000000
		@0x000000009600303c 00000000 00000000 00000000
		@0x0000000096003048 00000000 00000000 00000000
		@0x0000000096003054 00000000 00000000 00000000
		@0x0000000096003060 00000000 00000000 00000000
		@0x000000009600306c 00000000 00000000 00000000
		@0x0000000096003078 00000000 00000000 00000000
		@0x0000000096003084 00000000 00000000 00000000


    file-storage-4050  [003] d..1   128.390654: cdns3_doorbell_epx: //Ding =
Dong ep1out, ep_trbaddr 96003024
 irq/42-5b110000-2246  [001] d..1   128.390692: cdns3_ep0_irq: IRQ for ep0O=
UT: 00010c85 SETUP IOC TRBERR=20
 irq/42-5b110000-2246  [001] d..1   128.390696: cdns3_ctrl_req: Clear Endpo=
int Feature(Halt ep1out)
 irq/42-5b110000-2246  [001] d..1   128.390700: cdns3_log: 5b110000.usb3: C=
lear Stalled endpoint ep1out

 irq/42-5b110000-2246  [001] d..1   128.390719: cdns3_log: 5b110000.usb3: R=
esume transfer for ep1out, ep_sta:0xc00

 irq/42-5b110000-2246  [001] d..1   128.390724: cdns3_ring:=20
		Ring contents for ep1out:
		Ring deq index: 3, trb: ffff00000a418024 (virt), 0x96003024 (dma)
		Ring enq index: 4, trb: ffff00000a418030 (virt), 0x96003030 (dma)
		free trbs: 28, CCS=3D1, PCS=3D1
		@0x0000000096003000 fc79f000 0000001f 00000427
		@0x000000009600300c fc7a0000 0000001f 00000427
		@0x0000000096003018 fc7a0800 10020400 00000425
		@0x0000000096003024 fc7a1000 00000000 00000467	=09
		@0x0000000096003030 00000000 00000000 00000000
		@0x000000009600303c 00000000 00000000 00000000
		@0x0000000096003048 00000000 00000000 00000000
		@0x0000000096003054 00000000 00000000 00000000

Peter

>=20
> And maybe we could add some comment because this code look little strange=
.  Something like:
> When endpoint is armed during endpoint reset the controller can advance T=
RADDR to next TD,
> so driver need to restore the previous value.=20
>=20
> >
> > 	/* wait for EPRST cleared */
> >@@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_en=
dpoint *priv_ep)
> >
> > 	priv_ep->flags &=3D ~(EP_STALLED | EP_STALL_PENDING);
> >
> >-	request =3D cdns3_next_request(&priv_ep->pending_req_list);
> >-
> >-	if (request)
> >+	if (request) {
> >+		if (trb)
> >+			trb->control =3D trb->control ^ 1;
> > 		cdns3_rearm_transfer(priv_ep, 1);
> >+	}
> >
> > 	cdns3_start_all_request(priv_dev, priv_ep);
> > 	return ret;
> >--
> >2.17.1
>=20

--=20

Thanks,
Peter Chen=
