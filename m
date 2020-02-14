Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAFE15D303
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 08:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgBNHmK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 02:42:10 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:39530 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728841AbgBNHmK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Feb 2020 02:42:10 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01E7UHgK009514;
        Thu, 13 Feb 2020 23:42:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=lIpCQD0OqpoCE+5ISa1Q0Shmcb6bjnvwKmGjk9gd6LU=;
 b=hZBoYWfIHqyHhjtO1+S2KvywNtdFs+65aWOdiaeHb/XPkeLWPA9OtREDgaRoek+nLVu6
 ndCiozAsJhovCNL7jrQ56LApQIXgfkjbZWn65hgPRf01HeXnO+nQamClO1r2TnMdSfwr
 xxkXF+L3D2XgowpS5EiW2EklTz9FaE7i45bJRAWRC3/wiL8QGvrNeDmyLKv4jW47UQ1y
 Yd0eHBNe4XDksF1aqY9GjU7JheEpSRKYU2auqiqmXfBZiYuqVF70CG02MRbkF1X9XJBM
 w/YEchkMszB2gg5UqeljhQiSyaPChj+yx3sQMp1Fcd3Az1aFc0Z4I0+3NBJmrlIUrFVR 6Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2y1u17xpb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Feb 2020 23:42:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAHGm1wAbp5ZPnCaUMWwglDGwxAzVXxM9bDWOQmgU4oGxxW7NY/ycxp1niirZ+GT7p0EFTJFY0vfN1+I1zYH1AZGg78EEhKYZRlkCZti5eb7O/Eof7bX6+ZC/5146nNeNb483IWOUC+Jts24G3GeN7fxh/z7Kw9cK/n22HbwVfDVzDjuDUoJqODme6GnOZwVusDUQ1miy1vO/yzfiqUTZXTxto5fyAhoGRcvD7xFPYuFkMnyNfoFmkm/eklb1kgJEwg9zeqUR6jBzwoQuOgOYUQuhgQJEsSzwDGv5zmED5hzL1FW0lVS8C+6jGMQ3gHcFk5NCRgiMQfjDz/M+ZShsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIpCQD0OqpoCE+5ISa1Q0Shmcb6bjnvwKmGjk9gd6LU=;
 b=k09462MNoKFw++gnJ9yehrx4XOZEL6j7uKisjF4SUbtgdE3VQo1WYE0HuTwYDQpt46AeRRF5062MgA/HcORGk1ydgzF4NtyUzRvBk0Qj5U4KmMViB5Zdhv/sfBDgiTjpVJxT+O3MypS37ch7eykczJNRA385J82FRDp1lN6LeVPSkWTAwwYXdQG3AQBTnhfsI4sVKq4gwi7czwEk9fDVZl6saQhrz8V8l5dLvN+RVOR0ll58kg8VuJ1mKQ2GhdojgHVRe1KOfD4Rt3omXQALVznk9/VnAKSUxshcHVlbk4a3PJWnkxYJJLdPTPZQFvDCCBDCdPOZqhJYjvcmKSUnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIpCQD0OqpoCE+5ISa1Q0Shmcb6bjnvwKmGjk9gd6LU=;
 b=u2Z9eXthObiyZXLLEQl2FM4xj8I5egBpg6Bx9f+6nj6JqnL0J7dV7QOZhdDZKgsH99WorO1kH2mf2GihAph3QwcH7qqY3zYVt8KFA3nlE2pU3K/iT1KMIURA5R67IoYRRd6IX+HHNggku0OyC5yGdum8/jbMM4L1/8UJhuM+lEI=
Received: from BYAPR07MB4709.namprd07.prod.outlook.com (52.135.204.159) by
 BYAPR07MB5494.namprd07.prod.outlook.com (20.177.229.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 07:41:58 +0000
Received: from BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::d9f8:fb5c:51c6:12]) by BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::d9f8:fb5c:51c6:12%5]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 07:41:58 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: RE: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Topic: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Index: AQHV4waNcxKuvYTPREatGaKJlUFShqgaSj/Q
Date:   Fri, 14 Feb 2020 07:41:58 +0000
Message-ID: <BYAPR07MB47098D0E50FA44A8111E94A2DD150@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <20200214071414.7256-1-peter.chen@nxp.com>
 <20200214071414.7256-3-peter.chen@nxp.com>
In-Reply-To: <20200214071414.7256-3-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNzg3ZmQ1ZGYtNGVmZC0xMWVhLTg3NTQtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDc4N2ZkNWUwLTRlZmQtMTFlYS04NzU0LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMjUyNyIgdD0iMTMyMjYxMzk3MTU0MDI4NjI1IiBoPSJETmFGRmt3YTU4a0tkcThrY1FORFpzcUNFV0E9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88cbee8-24fd-4f5d-cd26-08d7b1215f3f
x-ms-traffictypediagnostic: BYAPR07MB5494:
x-microsoft-antispam-prvs: <BYAPR07MB549439DD5A908F06772A8082DD150@BYAPR07MB5494.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(189003)(199004)(36092001)(478600001)(86362001)(64756008)(6506007)(66946007)(66556008)(66446008)(66476007)(26005)(2906002)(186003)(71200400001)(7696005)(81156014)(52536014)(8936002)(8676002)(33656002)(110136005)(55016002)(81166006)(5660300002)(54906003)(4326008)(9686003)(76116006)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB5494;H:BYAPR07MB4709.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xNdB+Yd+pB2x7mhGnU4/qP5kloK+q6D2ANUoioesXrAyBiNcXlBj1HCylf+vG73lWcz4nA9iIwSilF3zfOnJD5RCBr8w7/yRXtqqey5HKdOz6ol69vBixFREZ0t3aynmAFr83JbDd5ItBbMvt+nZURUqAqPLYI7rOQ4rB+QvinHzKqp2BhQuAq+SqRof0i3bunFaQK1DQ1lvLV1ZQNgDVzyoq57TmDd1FCtU3qekDv+9CRrEER7gqjHohnxe0alJvnF5G0nXcMSfah2QZrLMj/JUD5h52AEOvl+T3/fvFbLCa1Np9tKHurzWM+f/BlTuHmiTGicrp+QtBYfOof+CuStX7pn3SFb/QupZ4uBXAdT/8dDuLVdGPeqVw2s0u/FtCqwadlQgJBDJdlfChwW+oTBdbvumLtQokIMCxSwNjs5uIHSyKmXjj853XFHi4znLYiJ0Uact4vLzUKY7Oz3ZJ1gwDvqFrFvEPVK6ZlAfe1XwWn1LFQl8AblsOJn7cAB1
x-ms-exchange-antispam-messagedata: thT5PZbG3uBGoduYrNpWczap+VAD0Ni0D3aiQ3OR3F2eDhfjkiEQrWY8B4nlcaYWeOl8VbIClkh1tXTnbHiGwfX/25Iq9f6Wxs57nSQ6pLGWRuLr2snizYOwv8n42zhLeNeFqkQI1rgcmbWFsnSV3Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88cbee8-24fd-4f5d-cd26-08d7b1215f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 07:41:58.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfcR9s00DSvZ7hhZdvY5Gy5/yvbDGjfdmSLqotZcOYrSeOGXKVXUcQVrOFyWEugFPbxp9k2z2iCWv3GYlM41TGOndV5Kw5t2txLlwnSKTuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5494
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-14_01:2020-02-12,2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=525 clxscore=1011 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002140061
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>If there are TRBs pending during clear stall and reset endpoint, the
>DMA will advance after reset operation, but it doesn't be expected,
>since the data has still not be ready (For OUT, the data has still
>not received). After the data is ready, there isn't any interrupt
>since the EP_TRADDR has already points to next TRB entry.
>
>To fix it, it toggles cyclt bit before reset operation, and restore
>it after reset, it could keep DMA stopping.
>
>Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
>Signed-off-by: Peter Chen <peter.chen@nxp.com>
>---
> drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>index 1d8a2af35bb0..7b6bb96b91d1 100644
>--- a/drivers/usb/cdns3/gadget.c
>+++ b/drivers/usb/cdns3/gadget.c
>@@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endp=
oint *priv_ep)
> {
> 	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> 	struct usb_request *request;
>+	struct cdns3_request *priv_req;
>+	struct cdns3_trb *trb =3D NULL;
> 	int ret;
> 	int val;
>
> 	trace_cdns3_halt(priv_ep, 0, 0);
>
>+	request =3D cdns3_next_request(&priv_ep->pending_req_list);
>+	if (request) {
>+		priv_req =3D to_cdns3_request(request);
>+		trb =3D priv_req->trb;
>+		if (trb)
>+			trb->control =3D trb->control ^ 1;
>+	}
>+

What about doing simple read/write on ep_traddr register:
	u32 ep_traddr;=20
	ep_traddr =3D readl(&priv_dev->regs->ep_traddr);

> 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
=09
	writel(&priv_dev->regs->ep_traddr, ep_traddr);
=09
It should work in the same way but is simpler. =20

And maybe we could add some comment because this code look little strange. =
 Something like:
When endpoint is armed during endpoint reset the controller can advance TRA=
DDR to next TD,
so driver need to restore the previous value.=20

>
> 	/* wait for EPRST cleared */
>@@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endp=
oint *priv_ep)
>
> 	priv_ep->flags &=3D ~(EP_STALLED | EP_STALL_PENDING);
>
>-	request =3D cdns3_next_request(&priv_ep->pending_req_list);
>-
>-	if (request)
>+	if (request) {
>+		if (trb)
>+			trb->control =3D trb->control ^ 1;
> 		cdns3_rearm_transfer(priv_ep, 1);
>+	}
>
> 	cdns3_start_all_request(priv_dev, priv_ep);
> 	return ret;
>--
>2.17.1

