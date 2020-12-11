Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5156C2D6F8E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 06:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgLKFUe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 00:20:34 -0500
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:14952 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726464AbgLKFUP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 00:20:15 -0500
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BB5Hfm2020220;
        Thu, 10 Dec 2020 21:19:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=OMr8kjlMpG/elWoTi5PWQwiiHg79BtOrQDs2LH83YwU=;
 b=GqdX7xyeaCGJhY5jFf2k4G2GBbn+izHWWpUn5U6YzIPZkKEO5Nm/Rt8StY9WS6W6iHG/
 hADBABNtcvrJsseZTssDvMbaJrjqw60azKkifE4CLjOQeM7kWZP6TDJeoIGQ5oNjU6tn
 IyF0/MY629HxWRpO+qhex1qspOzinGlOgxGltipkzmsUIoTtb4Z4tIMfT+brYwPXG+we
 9r7e272BYWZJRkL4zsPLmeDTTf9BPQ9RR7DUXxsNn8Q2uWgZMRo1ENlMys8nXUFm3zyV
 3Bnt/wfHO/2NEzMHQm2A+pmiO7CzlOy8W0tsjj6b6SMcmYor1tK2EslG5q0O35ouXAeX PQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3587n347u6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 21:19:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewkX2nFEMZT1KW5i7R56MdHQaQwgKatdF8LQpSg565Tmqs/D5LMebis2J6tOuHr88JGN8kS/neojRIx+GpG/6POy9HvuWmHgyzJTLyAI0Zq4MKZSIGe0n7w9UtHEfmP7R3UJSoOSH0yOwFtprEAP7aEdVFnMa1nNyysdQPSBbIUkFlNhOvuEKJbXribxb1wsGDn8PFTkiXOXAOuRjMEtYH2+IMFSaMYy4+OzUUjg7vuGfdVnKF/XT7Fh/7wpTG/FrflOGqjIOYQ3VyyrG6fGW4ZlqZ9JKETjqX49Qb/jJEOXWdCP8UV1pj0OJrEKFanTBubMGlH8KmiTruJc7qBOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMr8kjlMpG/elWoTi5PWQwiiHg79BtOrQDs2LH83YwU=;
 b=DNRyzNvPuNfku95OTKlX1jWO70LVJ+d/PVmY6QFdHVVzfR5Y9EzScGjqgdzMKlQr9SxjlSTDdROXdaV9EtrFAyKizklnv5zwUOK2adXHUD+iZexV6PCU10+oqR8MpEuJQ7jh1ivg74fIguyzRc24c7jeNi7ySx+VpEfPcfQVadC0jew1+cGBSD7exDRZo2t32pbS7zaE3oolZizYr4gx7o6EBqkQj4vR0fdAwS0/Hzs4SfWGTXgmSV0B7wC8b69yE1HHH2c9vLfeCN1fVzjV7iqkH33pBOycigTam2dmWYDdL0UZSD+yL7CF8/sFJBI4nXU7KddpNOwoqs1PHrMV/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMr8kjlMpG/elWoTi5PWQwiiHg79BtOrQDs2LH83YwU=;
 b=wn3YX+qGMUe6jiPyTSYZd/bysnnwpbxf/K2D3LI38OCigqigZD0V1Eftb7+JExwbEOXo3A62r7DlUHOH0EoRbKnauX/TTGMOQWaNMjhc5gT1ve/CF1y2SSPwGNPfHSG8G8BPfI0LY1sxhf4u3XsDJVKZFd+rJ1I8jVDoCtv2N/U=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BY5PR07MB7201.namprd07.prod.outlook.com (2603:10b6:a03:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 05:19:23 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 05:19:23 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Topic: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Index: AQHWzhEMZUxLeazvM0u6I0zkb58yz6nu1ETQgAAkL7CAAmPmcA==
Date:   Fri, 11 Dec 2020 05:19:22 +0000
Message-ID: <BYAPR07MB53816A90A4ABB753CAD4ED4FDDCA0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <X9Cd6VGllTSlZtvV@mwanda>
 <BYAPR07MB53812CE67AD0B44C4590EFBEDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
 <BYAPR07MB5381A17EC88340BB4E01349CDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB5381A17EC88340BB4E01349CDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNmIyZTNjMDItM2I3MC0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDZiMmUzYzAzLTNiNzAtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iNTI1MCIgdD0iMTMyNTIxMzc1NTk2MTU4MzczIiBoPSJkRDBGWWRyTFo0ZEJBZ0x4OHB3bjloNkpiVnc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 062e3fad-e2b7-49c8-7081-08d89d945224
x-ms-traffictypediagnostic: BY5PR07MB7201:
x-microsoft-antispam-prvs: <BY5PR07MB720179EEC79A780FA07E3AB2DDCA0@BY5PR07MB7201.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pXun3/Vwi8l/POzqpLFN4ZkJQI9YR+B13Z9bp3VRdI+ZJKmLAy2hAg/hg1fQNWP3OidSPghUVJf8PEyrI+i1vISFY9+GnwSN3kgzIl+ViaO/sG8CmRE2dAZNo6KHkE+NR/3OLmssZX8jrLiWMjKJF8Zm3WPLxC1MDXb+ZNsEvFniiJEyvHSDfzDcCSEEMnXvw93QNiM32j96MiCfL9daSJDQrT235YzCS160aHXdtDUbdWbhGCBw+Apbaa4mr+ctRDg8XFFmmO0rNpr6CjRRkrXaRuPeMQfjJhxoirt9Rs7iHc258GIjdfpXdy8CCtLnh8qt9IF/0d8EDxPqAQSG5V/njuIZqpge4PoW9e0m79Q9O4gWwwLdZkeHnqq8mM/q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(36092001)(83380400001)(186003)(66476007)(6506007)(7696005)(26005)(66946007)(71200400001)(2906002)(55016002)(8936002)(8676002)(66446008)(86362001)(5660300002)(64756008)(508600001)(9686003)(66556008)(6916009)(52536014)(4326008)(33656002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DyotIbf+uK7ox1AZQXq+kjnNP2Ic6ja6O78pO3D6KTMe5ju1V8HwOIMzh0+o?=
 =?us-ascii?Q?wmkJOI2WO41hPuvXuZiRNRLVTLzLpz0JJqPCpl8AoLUKdBT1gAX/B9YKTZK8?=
 =?us-ascii?Q?r8P3+zKtEwpKlUSBRkVLUyEYI+DJDh1e9LQ6j1AdNv4ZmUs5eRJJuqrdRDz4?=
 =?us-ascii?Q?Rp4VINHF71VpTVTZmPejYTdbZZvJykhF7DlQxbslxP0a51i8ZuFpJTNViMWe?=
 =?us-ascii?Q?GXKbdhd5z0X1yexaywFCyEHCX6f0jhweqdRp0qaD8uD2AgUZA1oY4RleLkux?=
 =?us-ascii?Q?f7zs++Zhp5vLVmSjsIwBnmJWBM8pnh+YMX6GfAmdafYAt+aWVzdBuSHLNgPx?=
 =?us-ascii?Q?8R4YZ7R2igeYeAl40Mli/jxX5vcY4H5sd2sXAJcPEsMj+Uo5xU3HV3y5GCMe?=
 =?us-ascii?Q?qxemxG0TirGDiZbdVybyIADskeBbXDtpkdk+ghCCRj+AbTUHKiT7spqgVDpB?=
 =?us-ascii?Q?47jZNsoMWCIV+vZQ7BfWfH4HJa2/G+as0b3s1DhUdDGPGOnaG0612DOxGcCR?=
 =?us-ascii?Q?9udifNFsMCJhCNq4WR9xxvWCJpP2x/IzZVYlamU+B/fqH4aGzNNABWmhwf75?=
 =?us-ascii?Q?pZ2n22dH/NaZtt7X5xEFigO8PxRZiKdw1NXwFFoVwYlFOqA04CrClOz44nz8?=
 =?us-ascii?Q?wogDLSBQcbGWD8CrkGPN2MMre2T59e6PnK5UHzYkhCwzXUOnmtinjplwhbiO?=
 =?us-ascii?Q?dvMIUWzpbuNsc+pa86rbaWUydpTZtCtxGRR6MhzHTb57uEDnDdN2i3bCWUI5?=
 =?us-ascii?Q?hydroCa2/UDlBkDj7Io/lRo7X8VmD+JzlFiyd7AcxDro90KJzDo/ZWQxJYgu?=
 =?us-ascii?Q?Y7r405yH0s+bZfR++rCcIVQe6p9FpyPiLqygLpebSQckmd7rks8LjMKrcSCt?=
 =?us-ascii?Q?MnuMWNNUO9KOxwxZ6friBJeYPAhQ8HJqANYvJz9WTK5TC9q3P/jdfU7ENeEK?=
 =?us-ascii?Q?X9ft2ardTflWF7YAuvi2YfyLxuh5YaIMMN3VGJgP6HA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062e3fad-e2b7-49c8-7081-08d89d945224
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 05:19:23.0216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cd2CS5aeSuXSM60XSaMWn7aC4f3RiiGdEvqZk+ciSwwEBO46H3xDbu2xjNAOWu4E1nOviSfQnEoiJa2EMDS0nKdfVdncm7gKwAxwTdp+Rng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7201
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-11_01:2020-12-09,2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012110030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Can you send  this patch or can I do it for you.
It has to be generated one again on top of Peter Chen for-usb-next branch.

Regards,
Pawel Laszczak=20

>>Hi Dan,
>>>
>>>This is just an RFC patch because I couldn't figure out why we were
>>>calling halt and reset so I just deleted that.
>>>
>>>	cdnsp_halt(pdev);
>>>	cdnsp_reset(pdev);
>>
>>At first glance it looks like cdnsp_halt  can be removed.
>>I little afraid about cdnsp_reset because it reset some internal
>>state that could be changed during initialization.
>>
>>I think that you could move cdnsp_reset  just before return instruction.
>>
>>I will make some test to confirm it.
>
>It works correct, you can remove cdnsp_halt and move cndsp_reset
>as the last instruction before return.
>Probably cdnsp_reset also is not required but it's good to restore
>the controller to the default state after error. Just in case.
>
>Thanks,
>Pawel
>>
>>>
>>>This function uses "One Function Cleans up Everything" style and that's
>>>basically impossible to do correctly.  It's cleaner to write it with
>>>"clean up the most recent allocation".  It's simple to review because
>>>you only have to remember the most recent successful allocation and
>>>verify that the goto matches.  You never free anything that wasn't
>>>allocated so if avoids a lot of bugs.  Also you can copy and paste the
>>>error handling from here, remove the labels, and add a call to
>>>cdnsp_free_priv_device(pdev) and it auto generates the cdnsp_mem_cleanup=
()
>>>function.
>>>
>>>There are two problems that I see with the original code.  If
>>>pdev->dcbaa =3D dma_alloc_coherent() fails then that leads to a NULL
>>>dereference inside the cdnsp_free_priv_device() function.  And if
>>>cdnsp_alloc_priv_device() fails that leads to a double free because
>>>we free pdev->out_ctx.bytes in several places.
>>>
>>>---
>>> drivers/usb/cdns3/cdnsp-mem.c | 36 ++++++++++++++++++++++-------------
>>> 1 file changed, 23 insertions(+), 13 deletions(-)
>>>
>>>diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem=
.c
>>>index 6a0a12e1f54c..6d3fe72e920e 100644
>>>--- a/drivers/usb/cdns3/cdnsp-mem.c
>>>+++ b/drivers/usb/cdns3/cdnsp-mem.c
>>>@@ -1229,7 +1229,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_=
t flags)
>>> 	pdev->dcbaa =3D dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
>>> 					 &dma, GFP_KERNEL);
>>> 	if (!pdev->dcbaa)
>>>-		goto mem_init_fail;
>>>+		return -ENOMEM;
>>>
>>> 	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
>>> 	pdev->dcbaa->dma =3D dma;
>>>@@ -1247,17 +1247,19 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gf=
p_t flags)
>>> 	pdev->segment_pool =3D dma_pool_create("CDNSP ring segments", dev,
>>> 					     TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
>>> 					     page_size);
>>>+	if (!pdev->segment_pool)
>>>+		goto release_dcbaa;
>>>
>>> 	pdev->device_pool =3D dma_pool_create("CDNSP input/output contexts", d=
ev,
>>> 					    CDNSP_CTX_SIZE, 64, page_size);
>>>+	if (!pdev->device_pool)
>>>+		goto destroy_segment_pool;
>>>
>>>-	if (!pdev->segment_pool || !pdev->device_pool)
>>>-		goto mem_init_fail;
>>>
>>> 	/* Set up the command ring to have one segments for now. */
>>> 	pdev->cmd_ring =3D cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, flags);
>>> 	if (!pdev->cmd_ring)
>>>-		goto mem_init_fail;
>>>+		goto destroy_device_pool;
>>>
>>> 	/* Set the address in the Command Ring Control register */
>>> 	val_64 =3D cdnsp_read_64(&pdev->op_regs->cmd_ring);
>>>@@ -1280,11 +1282,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gf=
p_t flags)
>>> 	pdev->event_ring =3D cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
>>> 					    0, flags);
>>> 	if (!pdev->event_ring)
>>>-		goto mem_init_fail;
>>>+		goto free_cmd_ring;
>>>
>>> 	ret =3D cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst, flags);
>>> 	if (ret)
>>>-		goto mem_init_fail;
>>>+		goto free_event_ring;
>>>
>>> 	/* Set ERST count with the number of entries in the segment table. */
>>> 	val =3D readl(&pdev->ir_set->erst_size);
>>>@@ -1303,22 +1305,30 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gf=
p_t flags)
>>>
>>> 	ret =3D cdnsp_setup_port_arrays(pdev, flags);
>>> 	if (ret)
>>>-		goto mem_init_fail;
>>>+		goto free_erst;
>>>
>>> 	ret =3D cdnsp_alloc_priv_device(pdev, GFP_ATOMIC);
>>> 	if (ret) {
>>> 		dev_err(pdev->dev,
>>> 			"Could not allocate cdnsp_device data structures\n");
>>>-		goto mem_init_fail;
>>>+		goto free_erst;
>>> 	}
>>>
>>> 	return 0;
>>>
>>>-mem_init_fail:
>>>-	dev_err(pdev->dev, "Couldn't initialize memory\n");
>>>-	cdnsp_halt(pdev);
>>>-	cdnsp_reset(pdev);
>>>-	cdnsp_mem_cleanup(pdev);
>>>+free_erst:
>>>+	cdnsp_free_erst(pdev, &pdev->erst);
>>>+free_event_ring:
>>>+	cdnsp_ring_free(pdev, pdev->event_ring);
>>>+free_cmd_ring:
>>>+	cdnsp_ring_free(pdev, pdev->cmd_ring);
>>>+destroy_device_pool:
>>>+	dma_pool_destroy(pdev->device_pool);
>>>+destroy_segment_pool:
>>>+	dma_pool_destroy(pdev->segment_pool);
>>>+release_dcbaa:
>>>+	dma_free_coherent(dev, sizeof(*pdev->dcbaa), pdev->dcbaa,
>>>+			  pdev->dcbaa->dma);
>>>
>>> 	return ret;
>>> }
>>>--
>>>2.29.2

