Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E632D448D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 15:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733044AbgLIOlx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 09:41:53 -0500
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:53918 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733040AbgLIOlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 09:41:46 -0500
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B9ERFrt009797;
        Wed, 9 Dec 2020 06:41:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=9j1WgT59MXWRTC0T02x79h/v7xcrTkzwpn+h/4vI4/Q=;
 b=KfPSbalbwPbRjMwP7DFyoW/nOAsYT5TQWkm1tBjpjYCZYrIF6jzFpk/vo4embaoZKk9g
 LKlwlTjFPvo37ZhsMCl+vbvI7H9lS6390DUVdL6xj3LrCwpi8HrweEv4s1rozUIaK4xb
 4yzu13cgHVdnH7K95QGYliey4qZ046vGHgKYGX3dXH4l40JqQIHOymVH53Dciq/jVoEj
 Q6vYsuJY3bVOKHSeOpabBnIKMJRdVveRVS6n+LXpUK+q5sgKFRmXMWwvH/88lxGyCIgo
 yadMbbg0GrwqlA2kfrJOS5SX37jduSdsGIml1CVecMp3pn3ASGWvaD3NFOdnBiC950In hg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3587n2w5sb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 06:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1J4nVmjmCOUL5Z8q8BbXxxTMO+Zt66lJ0vQ0NEdRUgTODYOTwKI38QWhDr2trb1wSQZfQC6mwZILl93rZ61/SKDxlc73x2lkjTigN9kdXaDKt4HEIHqJxdlVAc4MKUwIbBTs+ehq1ZOy3niLVxp7JZv3qnovo0b2NX+z//K21lCdncBe+iqjAgmOR4HpoLuszgGh01O6nvYbNqHU5K678pqDekW4MY47Ved4FdTVZbRPDiLcFyCs4CbX1u5im9RrgwwuWbsZEFa3/wuBcfE7toUGYvdLVxj8J0T4mk3ANqDmfPmtm9VznUQejDVdHu+WzPXB84V0tZOzdXhHV1DPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j1WgT59MXWRTC0T02x79h/v7xcrTkzwpn+h/4vI4/Q=;
 b=dEy60xHD1TOzSA02S/3i9U2kqVJfPuA5759W9qyREszUlMFEbFmZ2D96ribkbkgCtlqvVd5X5B3mBToLyCiHTCuo1K4YL/E81zi6t/4AfPrcvMFKCO4wxYLm9LkSyE++jlkZO2tLhLp+1APlFaJaVy+sau3WycRCra1Taj7GZ2jiCh554yaDbzVAN4tboyFO3ENHfojHl833K3JmqgNG0Qy5xRZvp/+wwfoW73Rz6d/6NvSWokndlktzTeQwgzk3eBu50kfkMDanSv/iktkxWj0cPpc/6oLacDmC+1zKckl+NrWTzdXI6IpTyfCQxYsSuNUYGQinq2nVDNUcTOie9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j1WgT59MXWRTC0T02x79h/v7xcrTkzwpn+h/4vI4/Q=;
 b=VB7JU/+/lnkw6XsGrndmDC+Q94c1KRLwSgTuh4SVbNqoiOG/hoHdlKZ00mYYqqBZAOTfLzCG3zhxBs8FreQGArqiPgo/JFFp6UsJGBsWOogfLekQW4A0CVgya9GrB1TuFFd11a0gPHQPhLur2aXEKRpkzI9OH27v3gm74ojHiSM=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB4152.namprd07.prod.outlook.com (2603:10b6:a02:c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 9 Dec
 2020 14:40:57 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:40:57 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Topic: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Index: AQHWzhEMZUxLeazvM0u6I0zkb58yz6nu1ETQ
Date:   Wed, 9 Dec 2020 14:40:57 +0000
Message-ID: <BYAPR07MB53812CE67AD0B44C4590EFBEDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <X9Cd6VGllTSlZtvV@mwanda>
In-Reply-To: <X9Cd6VGllTSlZtvV@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOGExNWZhODctM2EyYy0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDhhMTVmYTg5LTNhMmMtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iNDU3MyIgdD0iMTMyNTE5OTg0NTQ0NzM4MzM1IiBoPSJSNjQ1U0g5ZVk5dmlKZUtYeG4vSkhJYldHTnM9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aae9074-4529-4269-1400-08d89c5070e6
x-ms-traffictypediagnostic: BYAPR07MB4152:
x-microsoft-antispam-prvs: <BYAPR07MB4152764F97852DC78D7B092ADDCC0@BYAPR07MB4152.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 11DKtvJBlKcPAMtQLWz3sfPR2Cel8WOOtkcV81cw1cbBN2+GUgwcgxbMvDfOSM+c3bgf/IvP95rTeVeympBbDCmpatgR2oHOjhERKAx8aEhygAtRdtyJFoXFgNJuplars89zc1Z+n9R0/7uHu/wWyVq5bAeimasRD/RwNwMMgPLaBsc0DAeL0onJhlX1BYjp+u94b0x+Wqmc2Nl+tpmixew8pRdOI9+P5zxxhV/4S+N8mcZXUsOXhozdmhWNMTgD7XOVdrcT9EdohIXb+X7G/EymWURAvx9EqmnH+oKRAzCS86+v32wf9sZUJqlJD/Fy5mWdVT4K3xRl1tdSFv73ZI44aQMLoeZ4Kd1ZGMtGMJuTlRhBnnBxCpXws0VhjN+L
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(36092001)(71200400001)(508600001)(66446008)(66476007)(2906002)(76116006)(6506007)(8936002)(52536014)(186003)(8676002)(64756008)(9686003)(6916009)(5660300002)(4326008)(66946007)(26005)(86362001)(66556008)(83380400001)(7696005)(33656002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?QZgDWQDbH4kP96eV05x7XriD5m1pqusnvrsnaoGYei7V04t/ARTb0gxy3/cT?=
 =?us-ascii?Q?NfdP4h/BcvFldZXG7NJIQcV5gvEWXx7HxkCMx7KaZAAXfaYdc5aDT9+UtZLr?=
 =?us-ascii?Q?zLetLBmpuV8K9QVgOA0yGvzLiulg8cDUOp65zE92qUNfhOzcQyk+xb6tsB13?=
 =?us-ascii?Q?hq7Hh7Rbb/LkFh/BPFasHxD+OrVjMZp3A70LSMzsFp0ftJkVXFzp1rhIFYla?=
 =?us-ascii?Q?ftqtF/di0Y5yictyURsLhHP903TvMYEes+OiXrXOKyKFdBQK2NS4opwA9QQS?=
 =?us-ascii?Q?Mzqr4npEk/iJb1cKDiit/oqPksOTPSMXG7xhJK5wlUAkKMdMtYzsfwP6jE3G?=
 =?us-ascii?Q?GC4MsMTYFmNplmtdLmzQogpGChw886eizCxkW5dJSC3ZmVizXSRSUBb1RmU9?=
 =?us-ascii?Q?xYTltVii+dNW+XDknH6PB9R2OcZFI6BTbxeSm/WTj4ztbquT9ViAFUlCzFO4?=
 =?us-ascii?Q?S16xmrwq/9Z3/Mk6Gc8CUSmFI2z/vplhsQ+FXWNlnjcLKx46lpcKvvhoUMs1?=
 =?us-ascii?Q?ttpCUHMTe2wY0LQZAFrlDk3WYcV4btsxkYsBxMMKqjoVJCHmZuRx2VhcWkto?=
 =?us-ascii?Q?trwLl9sl3axXFV0uNU2cwRzZUbhQOvel9LAB7n8B5QFiD4xCYJAsciQMdE6N?=
 =?us-ascii?Q?WyK/YLBH+24fmXpbioMFZIvBqqPz1xFC53W/ABwZomWBYVhoo30aP/AnUaKR?=
 =?us-ascii?Q?tpemlKLU+mj/tFN8WRT+LhB28CLshkJQrG2Abz2MktqES0zR8nzDSWzzWSF+?=
 =?us-ascii?Q?dlsspOtNrRF6FxS/wFGS/UlnQHg2Q7D0fX1IK243OOh7TmxfiWlCQbuRHVXb?=
 =?us-ascii?Q?PHzp8uQLVQRp4tmiF6KHSouvzIpMBrJS/4xd5O/4YaNJRqK/vbJZsvNKEVcs?=
 =?us-ascii?Q?mt+nPFhHdPmBjdXKNR3KY2Y5erGVXpi5SvEEYRq2chKDg1fHaqBtJsLqOzYj?=
 =?us-ascii?Q?J30V4/BROVhwKRKi7/ldI1rh58JGjdHcTQJKT0OSPS0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aae9074-4529-4269-1400-08d89c5070e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 14:40:57.6639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQQBNJuCCvPfW08ZZlxP5OCX+n8zAFJDuItoMoGwujPZ6Y0Sc1WoCKZYtwDey0LPU7kh4CAgbcyccip4+C9y7iw3H/HKLxaOOX8Fw78rrf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4152
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_13:2020-12-09,2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012090104
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,
>
>This is just an RFC patch because I couldn't figure out why we were
>calling halt and reset so I just deleted that.
>
>	cdnsp_halt(pdev);
>	v(pdev);

At first glance it looks like cdnsp_halt  can be removed.
I little afraid about cdnsp_reset because it reset some internal
state that could be changed during initialization. =20

I think that you could move cdnsp_reset  just before return instruction.

I will make some test to confirm it.=20

Thanks,
Pawel

>
>This function uses "One Function Cleans up Everything" style and that's
>basically impossible to do correctly.  It's cleaner to write it with
>"clean up the most recent allocation".  It's simple to review because
>you only have to remember the most recent successful allocation and
>verify that the goto matches.  You never free anything that wasn't
>allocated so if avoids a lot of bugs.  Also you can copy and paste the
>error handling from here, remove the labels, and add a call to
>cdnsp_free_priv_device(pdev) and it auto generates the cdnsp_mem_cleanup()
>function.
>
>There are two problems that I see with the original code.  If
>pdev->dcbaa =3D dma_alloc_coherent() fails then that leads to a NULL
>dereference inside the cdnsp_free_priv_device() function.  And if
>cdnsp_alloc_priv_device() fails that leads to a double free because
>we free pdev->out_ctx.bytes in several places.
>
>---
> drivers/usb/cdns3/cdnsp-mem.c | 36 ++++++++++++++++++++++-------------
> 1 file changed, 23 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
>index 6a0a12e1f54c..6d3fe72e920e 100644
>--- a/drivers/usb/cdns3/cdnsp-mem.c
>+++ b/drivers/usb/cdns3/cdnsp-mem.c
>@@ -1229,7 +1229,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t =
flags)
> 	pdev->dcbaa =3D dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
> 					 &dma, GFP_KERNEL);
> 	if (!pdev->dcbaa)
>-		goto mem_init_fail;
>+		return -ENOMEM;
>
> 	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
> 	pdev->dcbaa->dma =3D dma;
>@@ -1247,17 +1247,19 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_=
t flags)
> 	pdev->segment_pool =3D dma_pool_create("CDNSP ring segments", dev,
> 					     TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
> 					     page_size);
>+	if (!pdev->segment_pool)
>+		goto release_dcbaa;
>
> 	pdev->device_pool =3D dma_pool_create("CDNSP input/output contexts", dev=
,
> 					    CDNSP_CTX_SIZE, 64, page_size);
>+	if (!pdev->device_pool)
>+		goto destroy_segment_pool;
>
>-	if (!pdev->segment_pool || !pdev->device_pool)
>-		goto mem_init_fail;
>
> 	/* Set up the command ring to have one segments for now. */
> 	pdev->cmd_ring =3D cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, flags);
> 	if (!pdev->cmd_ring)
>-		goto mem_init_fail;
>+		goto destroy_device_pool;
>
> 	/* Set the address in the Command Ring Control register */
> 	val_64 =3D cdnsp_read_64(&pdev->op_regs->cmd_ring);
>@@ -1280,11 +1282,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_=
t flags)
> 	pdev->event_ring =3D cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
> 					    0, flags);
> 	if (!pdev->event_ring)
>-		goto mem_init_fail;
>+		goto free_cmd_ring;
>
> 	ret =3D cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst, flags);
> 	if (ret)
>-		goto mem_init_fail;
>+		goto free_event_ring;
>
> 	/* Set ERST count with the number of entries in the segment table. */
> 	val =3D readl(&pdev->ir_set->erst_size);
>@@ -1303,22 +1305,30 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_=
t flags)
>
> 	ret =3D cdnsp_setup_port_arrays(pdev, flags);
> 	if (ret)
>-		goto mem_init_fail;
>+		goto free_erst;
>
> 	ret =3D cdnsp_alloc_priv_device(pdev, GFP_ATOMIC);
> 	if (ret) {
> 		dev_err(pdev->dev,
> 			"Could not allocate cdnsp_device data structures\n");
>-		goto mem_init_fail;
>+		goto free_erst;
> 	}
>
> 	return 0;
>
>-mem_init_fail:
>-	dev_err(pdev->dev, "Couldn't initialize memory\n");
>-	cdnsp_halt(pdev);
>-	cdnsp_reset(pdev);
>-	cdnsp_mem_cleanup(pdev);
>+free_erst:
>+	cdnsp_free_erst(pdev, &pdev->erst);
>+free_event_ring:
>+	cdnsp_ring_free(pdev, pdev->event_ring);
>+free_cmd_ring:
>+	cdnsp_ring_free(pdev, pdev->cmd_ring);
>+destroy_device_pool:
>+	dma_pool_destroy(pdev->device_pool);
>+destroy_segment_pool:
>+	dma_pool_destroy(pdev->segment_pool);
>+release_dcbaa:
>+	dma_free_coherent(dev, sizeof(*pdev->dcbaa), pdev->dcbaa,
>+			  pdev->dcbaa->dma);
>
> 	return ret;
> }
>--
>2.29.2

