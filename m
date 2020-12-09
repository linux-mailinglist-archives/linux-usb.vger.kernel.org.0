Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC02D4726
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 17:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731076AbgLIQuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 11:50:54 -0500
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:46446 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730859AbgLIQuy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 11:50:54 -0500
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B9GlJHZ007948;
        Wed, 9 Dec 2020 08:50:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Ir4hXgYP3ZScWQcBxzrZaFr+QijSnJQI8Vec/sGl4sg=;
 b=lDwnDBDK+CHR9ABXcYbMDhZBI19zJ7qQb6w80OVC8KMAM13TKn2fd3yA+J8dj/LMN+gE
 OodDFQUTESddv3rpTg0drQC/047pGswKV6PoJkuMPl20mp5AUBp7pkE2RURjjtxcSjBo
 qLAGuil5uAe2Gl0okVpXE7JXiMG/B1tmEkaSUNeP+QEiE8xMq17QJS3b4/SJRzXz/VdN
 WkmW1aC7ww3rAKSdeLj/BlQFIJKtdO76nAH0Sa49RDur+C3AONImemHht+GGJ0tyw5x8
 TbBjR0/V8vCgNNGNVXwN/iD8NTwMJ287bltPYymCt/68T1gxKsQI7ZM95tNqLBjg+5C1 /w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3587n2wnmd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 08:50:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgb3MazyP8YubapfGg2HiKXd8HPZUtw+Qu/qyPBgmUCX4vxjlLn5ejh3qdJvZQg8qqz+HigV5FDkXbvxTvgOvpKt0YQ/6jEdZgmkwZy0oVrHaTwiYfVa5SMmVdIiqzUhFXsh3CRTXI32PY+j8CDJGGu1vx24mIgwQz8Qd01Qk9JyTYqq9XOc29xz/wWYbMFqYX2vNqiiBqJUmPmYosGAFfkz0Xi8iPg7GNRDIfZWms87Hl2unY8YTL5aq/H0rDrszxq0t2o10eOWx+46q8WOuxBZhPTx631vrKWo9W2yCqvvkSMOZvdr27gDp4jOx+GbJXh2Msg2Rsn0cwDwsTCdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir4hXgYP3ZScWQcBxzrZaFr+QijSnJQI8Vec/sGl4sg=;
 b=S5Pw9CT/CtG22Se1/J+GZAw/JXmODOYbnknDSR455rd3DojBi4xkHcZtPuy9K6bB7NnJZOaO7wS7RadVpCfRCR1a+xPQ5fNdBoXYaFdbtU8mfw0ibneUfs2++bGH/2+n9Lh2q2Rlv72HXN16oJl75Pl9tDIQutWT7zV/ErUIqe+0UwQVGY9H0zghXJyIuZfbkzCxrdLsA8FULIbbJR4BdsJ8vR/kzymvnufIBYtVsWLpxhZigyhJ/z1g+PGuRb3DcR6Io1GlSM6m8BokZWpcXEjtap5W0UhXdzCsKSaN9BdaMSgIS/16CzLBgIjYYUd+7g0vfFz6ll4+eebM76pLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir4hXgYP3ZScWQcBxzrZaFr+QijSnJQI8Vec/sGl4sg=;
 b=yQUnY5b8Zt3+5+IU7DnM4ldhqwfmr2zfWDkstksKqUJIHXsg2wyoqrJGYjc7AIseigUh7FmBe0YHltT9RvLZgnvVjzIm2DMb6WHzreZXw7/lKEbDM21vI9llhN07MmX5f9QYNd9yLG0cN7Ehckg3r2cqSXVT0on4ryxYNoQ+uik=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB5255.namprd07.prod.outlook.com (2603:10b6:a03:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 16:50:05 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 16:50:05 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Topic: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Thread-Index: AQHWzhEMZUxLeazvM0u6I0zkb58yz6nu1ETQgAAkL7A=
Date:   Wed, 9 Dec 2020 16:50:04 +0000
Message-ID: <BYAPR07MB5381A17EC88340BB4E01349CDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <X9Cd6VGllTSlZtvV@mwanda>
 <BYAPR07MB53812CE67AD0B44C4590EFBEDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB53812CE67AD0B44C4590EFBEDDCC0@BYAPR07MB5381.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTNhNzNkNGMtM2EzZS0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDkzYTczZDRkLTNhM2UtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iNDkzOSIgdD0iMTMyNTIwMDYyMDE1Njg4ODcxIiBoPSJOL1VCcE5BQk1PS3EwaXhod0Y2SUF3dEVtWlk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f794935-cdae-49ea-efc7-08d89c627aa9
x-ms-traffictypediagnostic: BYAPR07MB5255:
x-microsoft-antispam-prvs: <BYAPR07MB525551FF561F18DBC2CCCCE1DDCC0@BYAPR07MB5255.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 89Sz1VdJgaG0Tn85iHnA3HoFnaqrcPv+ho/E0Ozqh28Kp1VkeAtDp/yeLbGOGGY+B9H1Y7mTpeXUsQ3eGLRES7j+/Wv4XkW/BjweLwd+EX/bY47x/XraW8YQMRM5hKsWdpnw7RtsDcKagWCTO4SPTOzIOESACwHXS2Qw3FI8Ltf0F1snPIgYKiAcxKxv7aHn6HM0KDxsS66vOwTv+2+Cw4XxVmlaAcGzgySWP7824gzUGV78dk5Fm8FgO8Mlpe6zGQCtT3uv5Qr3JTbdQLSP2h3ucTz5uKIHSYgevRviKxQg7nbywIGPPwf/PXstmb/2NRbLIrmlpNs4Olh0iEF3B53q107B9iA8mi56/lOjg7btLyBRuhtsgSU0bdLsJlFS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(36092001)(5660300002)(8676002)(186003)(55016002)(7696005)(66946007)(9686003)(76116006)(2940100002)(2906002)(66446008)(26005)(8936002)(66476007)(64756008)(86362001)(4326008)(33656002)(71200400001)(6916009)(66556008)(6506007)(508600001)(83380400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?QznyLFq7hAl0ImOc/f+T6/k3qlSTNtlbzD/sFsmo4q6wIRm1rjopi14d+T2p?=
 =?us-ascii?Q?91GHVUdXSBb61LsN0XSMq7S3Ux8XYXWy+jFcDKpWQGhEVXQjHbTL0Hn9+e9C?=
 =?us-ascii?Q?fg6TkT3lXn9B8Igxc6wqNyKIx3aNlMNz73nsbaJhIM0XZC/1dsTayHFiFOCe?=
 =?us-ascii?Q?WGLcnerz/VlQgtgnHYz6gJXqzXaGYNP2d6rdrYlm1MIX35p4nUGo599CItPT?=
 =?us-ascii?Q?Xcp2j2iPRJl3PiEBYkSO6VDLWYoYtsplqhFr+HeQHpb4IYRjf1GI9eCj7wM2?=
 =?us-ascii?Q?KPbYLV3P/hWlGs+mQTUj31EyXKsmovc2Ue4kpM/CN/Jb1k1G0UQ0Z8p6lzVs?=
 =?us-ascii?Q?IGG0O0F0p98brKCwGHRaPaRMJHu1UmmKVMupJKAg4VnrftMKR3F5LA8KlkRP?=
 =?us-ascii?Q?nJuAcQ49Dc28hqS6gY2uduf/oB2jXfjlBO9UwkAqDPJRbqAXg6whBW9CL9Ay?=
 =?us-ascii?Q?xhk5zOlDyPSIGmx/sAXFhojluCNDqVCRs5DCzphfz1qDA4koNKn4D8AHH8Jw?=
 =?us-ascii?Q?Wvsmap34IXhs/0dfpsWnFBBt5FgzM1oL7yemhUiyTNyXJDwBPST4walDxiNp?=
 =?us-ascii?Q?tvXMmncq4m4H2KkvI11AnyD+/NmwlyPqq1f43hKpXTj193TppGMdhpDcTG2U?=
 =?us-ascii?Q?uRD36ZZNUNlyww7THZwcdDpibsiAQS5YDZR3Scc8ARxZTrHCqa2UL2cuDbNz?=
 =?us-ascii?Q?dZU5rsVyr870LXcOKsbcCa37eMS33YFbOkVFZpy307t9I81tL79KztlT9NZd?=
 =?us-ascii?Q?+D+QEl71fFgnGfOsKhz7Y63dThBeMkYpDf15UieWIMTF2zNTwhIZWbxFPn7W?=
 =?us-ascii?Q?Ks29BW758uquKhjOx4KInZkUM6ynZZPSxRg6IWWu6MU4c3W2LFbLlsmIv5C/?=
 =?us-ascii?Q?v71jrLRVWGiQ60j9PtmlhFYOuWrjpqvZ77aP4RMW+vft8g2MW1ZdpXZDaoNJ?=
 =?us-ascii?Q?pGzxJ+XRHnyekzMpP9y2e09tS5n1K+3hZXwIerwjXv4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f794935-cdae-49ea-efc7-08d89c627aa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 16:50:04.9931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mo9Iz1ui5QGck5ngV+DdQ4IcsfGJoQY46RTaWU3YwSKTQOHuVZWGs8iMP7IxDdO6e3i5nj/Cih4yKaBcxug6WzjSjllX1yw25RqFKR1OWFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5255
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_14:2020-12-09,2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012090118
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>Hi Dan,
>>
>>This is just an RFC patch because I couldn't figure out why we were
>>calling halt and reset so I just deleted that.
>>
>>	cdnsp_halt(pdev);
>>	v(pdev);
>
>At first glance it looks like cdnsp_halt  can be removed.
>I little afraid about cdnsp_reset because it reset some internal
>state that could be changed during initialization.
>
>I think that you could move cdnsp_reset  just before return instruction.
>
>I will make some test to confirm it.

It works correct, you can remove cdnsp_halt and move cndsp_reset=20
as the last instruction before return.
Probably cdnsp_reset also is not required but it's good to restore=20
the controller to the default state after error. Just in case.

Thanks,
Pawel
>
>>
>>This function uses "One Function Cleans up Everything" style and that's
>>basically impossible to do correctly.  It's cleaner to write it with
>>"clean up the most recent allocation".  It's simple to review because
>>you only have to remember the most recent successful allocation and
>>verify that the goto matches.  You never free anything that wasn't
>>allocated so if avoids a lot of bugs.  Also you can copy and paste the
>>error handling from here, remove the labels, and add a call to
>>cdnsp_free_priv_device(pdev) and it auto generates the cdnsp_mem_cleanup(=
)
>>function.
>>
>>There are two problems that I see with the original code.  If
>>pdev->dcbaa =3D dma_alloc_coherent() fails then that leads to a NULL
>>dereference inside the cdnsp_free_priv_device() function.  And if
>>cdnsp_alloc_priv_device() fails that leads to a double free because
>>we free pdev->out_ctx.bytes in several places.
>>
>>---
>> drivers/usb/cdns3/cdnsp-mem.c | 36 ++++++++++++++++++++++-------------
>> 1 file changed, 23 insertions(+), 13 deletions(-)
>>
>>diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.=
c
>>index 6a0a12e1f54c..6d3fe72e920e 100644
>>--- a/drivers/usb/cdns3/cdnsp-mem.c
>>+++ b/drivers/usb/cdns3/cdnsp-mem.c
>>@@ -1229,7 +1229,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t=
 flags)
>> 	pdev->dcbaa =3D dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
>> 					 &dma, GFP_KERNEL);
>> 	if (!pdev->dcbaa)
>>-		goto mem_init_fail;
>>+		return -ENOMEM;
>>
>> 	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
>> 	pdev->dcbaa->dma =3D dma;
>>@@ -1247,17 +1247,19 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp=
_t flags)
>> 	pdev->segment_pool =3D dma_pool_create("CDNSP ring segments", dev,
>> 					     TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
>> 					     page_size);
>>+	if (!pdev->segment_pool)
>>+		goto release_dcbaa;
>>
>> 	pdev->device_pool =3D dma_pool_create("CDNSP input/output contexts", de=
v,
>> 					    CDNSP_CTX_SIZE, 64, page_size);
>>+	if (!pdev->device_pool)
>>+		goto destroy_segment_pool;
>>
>>-	if (!pdev->segment_pool || !pdev->device_pool)
>>-		goto mem_init_fail;
>>
>> 	/* Set up the command ring to have one segments for now. */
>> 	pdev->cmd_ring =3D cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, flags);
>> 	if (!pdev->cmd_ring)
>>-		goto mem_init_fail;
>>+		goto destroy_device_pool;
>>
>> 	/* Set the address in the Command Ring Control register */
>> 	val_64 =3D cdnsp_read_64(&pdev->op_regs->cmd_ring);
>>@@ -1280,11 +1282,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp=
_t flags)
>> 	pdev->event_ring =3D cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
>> 					    0, flags);
>> 	if (!pdev->event_ring)
>>-		goto mem_init_fail;
>>+		goto free_cmd_ring;
>>
>> 	ret =3D cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst, flags);
>> 	if (ret)
>>-		goto mem_init_fail;
>>+		goto free_event_ring;
>>
>> 	/* Set ERST count with the number of entries in the segment table. */
>> 	val =3D readl(&pdev->ir_set->erst_size);
>>@@ -1303,22 +1305,30 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp=
_t flags)
>>
>> 	ret =3D cdnsp_setup_port_arrays(pdev, flags);
>> 	if (ret)
>>-		goto mem_init_fail;
>>+		goto free_erst;
>>
>> 	ret =3D cdnsp_alloc_priv_device(pdev, GFP_ATOMIC);
>> 	if (ret) {
>> 		dev_err(pdev->dev,
>> 			"Could not allocate cdnsp_device data structures\n");
>>-		goto mem_init_fail;
>>+		goto free_erst;
>> 	}
>>
>> 	return 0;
>>
>>-mem_init_fail:
>>-	dev_err(pdev->dev, "Couldn't initialize memory\n");
>>-	cdnsp_halt(pdev);
>>-	cdnsp_reset(pdev);
>>-	cdnsp_mem_cleanup(pdev);
>>+free_erst:
>>+	cdnsp_free_erst(pdev, &pdev->erst);
>>+free_event_ring:
>>+	cdnsp_ring_free(pdev, pdev->event_ring);
>>+free_cmd_ring:
>>+	cdnsp_ring_free(pdev, pdev->cmd_ring);
>>+destroy_device_pool:
>>+	dma_pool_destroy(pdev->device_pool);
>>+destroy_segment_pool:
>>+	dma_pool_destroy(pdev->segment_pool);
>>+release_dcbaa:
>>+	dma_free_coherent(dev, sizeof(*pdev->dcbaa), pdev->dcbaa,
>>+			  pdev->dcbaa->dma);
>>
>> 	return ret;
>> }
>>--
>>2.29.2

