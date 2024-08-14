Return-Path: <linux-usb+bounces-13447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC699519D5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 13:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42E6A1C2125C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B961AE878;
	Wed, 14 Aug 2024 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="he8ZgWVd"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9A33D8
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634709; cv=fail; b=JNPh3tqnVttHePhNYnQOAFRtzbwa6GvfGn/gopM13SCo9zCrB1DTfmlISwRO/Nzt9jA97n5fYy8QU95QCfJ11zzAEH0eMKbgLQWEObZJO9LDugRs4T7fJHz4WTzWqmvS7GkJN8IuCLcpHhhGAAWv4xIC0Esb2PfdPmAGXwtcd0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634709; c=relaxed/simple;
	bh=SOoO+7X5m/QXTawtrUzRut/WY+LuA6cjN12J4r3C4ss=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=p9Ql9iRqLwdNX9tLw9s2zq3N5ZORM68eRQMLE7opdQalQQF+GhH9mPeZTFFyOqsFqf4vlC/gq2RhnicigQzDT0eCxIcJdYBgSOvif0TCUGSRhWvZumi+B49PHwMbJsMsD4PVKr2ocWqDAxO54jY95FNIuFRetMAUFGqKrG82gFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=he8ZgWVd; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhDjLNMAKPQm7JuGoQAqf27T5yw+BxTZ/uQobsMORkrhArPBGOP7/DjJyN6INBDpC1QzHUQwsG3swwei9mH/eDVzGbRSNc2J0y7mJhx9MewSvKA0KRHMZu7tBWYuvGBg823I8BX3aDX/vYTVrugwncfk03vXF7YJnZOPeqUgzcFLX/tfx2/1SfhX9qWhjOjHGDiyPAoEbYQAv924n64+1wiW4aoF8dtwSGV/7G5JPe75lRD/oLbv4PCArThvtHb2EGUY+N2mMdC391XfUHAzJVANZy8FMamY1c3enDEhzxeNE1vg2s3KS+7AU289GE7o4J94e4PdBF4JoqpQMahHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEWs4GX0bfY5H7USpplqUaN8rXVmhi54r+BJNdfdd7Q=;
 b=FFDuKWkRIZLmH02iGjdc2JsGvr6AruOhoNNiyB+LktpWsY5tVh5K/xG5pU9Zfz5EHP1NNcKgRk+VAj45QnVHMjuDY7XC8M0QGLtsvqrcT1pMw8GnWyY++QQROA29dzIc1+p7IZafEYECq6HWDFVwoj4YQr2y7Wp59OuOW66PIeIu/0M22y4H/CUG8+usooXOntMKIpYU+u9H6CeQUdLPJo+qDy0jvQ/fzOryzDh3QJ9Fcveg8RloosPJUwrCma8MBf4czvtsUkmwBEDQHv2E7pNKT5D6sdKS26lecy71WncFGJQ73thzhILaNqV92xfJDDpfiE1id+9+7DqUbkmdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEWs4GX0bfY5H7USpplqUaN8rXVmhi54r+BJNdfdd7Q=;
 b=he8ZgWVdO6ThO5Mmps+LBPr9f/K86Mvh+DDaunsW00h0N48RIaTc81lUo7VkAhm+uMnEg+Vh4VoII1/7bXph939VtS2otQWXP4lx+g4Q57nxR0G976eu3fLB1+hyco8fmgxOx+IKDIzxyI1AWP3OuNDNH9IBaTwtIa24wFuUnD9NoA4LdCNMRpUlQrc5JFqReK/0U2E7rPKFFxMZF8M1biHbebHY8SOsJooltJOnlNGC1JjO0OIduRk1RcZbOM5zx95vIwJ0AMNocvA3qD3rFPHZk9QsDIjKIcxXYMerYVy0Hu5CYfDPzJ3XcfGmEcJzXHAaYIWX514fCRPuK+9BZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 11:25:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 11:25:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de
Cc: jun.li@nxp.com,
	imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: [RESEND] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Date: Wed, 14 Aug 2024 19:25:37 +0800
Message-Id: <20240814112537.2608949-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b3a33b-d603-40f8-115b-08dcbc53be10
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?diwEVjxvgSklZAxXkce0bsrXSJRy45SnyQ1fqeyHnCURGU4ddb8p8UKrk0wq?=
 =?us-ascii?Q?k0OhBhZ1PCGzm2WcNQudeIwC6p1rBZh7E0wXrpNsX2zxziRYaKR6HFYZeDLY?=
 =?us-ascii?Q?KoEcB4txVm/x1CAXgOsrnDJ3//1711Ck8NFehYgdmc1OXprCVn2d6URtUeJ3?=
 =?us-ascii?Q?qFQyHDd5W/CPWy/xfOZLq7aeqwIvPmQHaakBQV5Bkke8nq9cnTpK2UVtfYr5?=
 =?us-ascii?Q?awIPiRxkc4artpK8jUSNjq4EK+dgWnWEY4BHzBlRlEgXg4P0FWyad8Ec3PVf?=
 =?us-ascii?Q?5uAuVuTr5Hl1jtcYakrKCFHUQI6Fy/vVEK7chFjaOsLdyUSC1kJFHZbvAyLQ?=
 =?us-ascii?Q?FeKgj/xvHLRAUGTDs+B2uGDPaXUhIlXrjJHPE+V0zI9pfRtJ2eg5YEqDNdMJ?=
 =?us-ascii?Q?7/cZDgdbVt+RKQcz4j5HGuOE4qhYr2RYPtTIRMO5rU+oaVZsBwaJClInmOmX?=
 =?us-ascii?Q?5iuV13n4keES0ck+Mw/rk8ZQcWk4bAN7DK6eJ0ZBo3kU81iHEqDzo+X16ecX?=
 =?us-ascii?Q?/uoSSw0dKao/seq0+Z9x+JgNdMoQKTqeo/12QGNrjCj+ptFhDB+Ivfp51NRp?=
 =?us-ascii?Q?BAkChEclRgoVn8RzATgMWne4OUkh5j5EdLTZWUpxsuWq+GW06uUVkejYVDep?=
 =?us-ascii?Q?yoYyfqNWJwdOiLTxKgQFmUeZgM6mk6Kqq+AGDjzu95WY7BdjTyWqBQDaSA5H?=
 =?us-ascii?Q?YFXCgJiX6TW9yBoscwXLOv7BVXfno6eG14hCgEbGgt7kp4GNq27DlhBKCgwO?=
 =?us-ascii?Q?WmPlNE4nUrofYmhqRmrCQu8XXofoY9VBlcRTk2MdkGOys/NGDPiF/RP/Ji4z?=
 =?us-ascii?Q?0NhosANZ42neqtC0/9qMQyobWA2oi8YfVHI4Fy6bKlr2WLDhSol3NC9OBz4a?=
 =?us-ascii?Q?cgOV2Vs6DmZjQSQk+2jtt78EpGIyvwmpBTbmPl/DeBhhzr6UGD/dlVzAT3/9?=
 =?us-ascii?Q?0ucy2Sx3qzLdM8BEND/MVPS+TytTZXK4YffGR9odPrWQazNytR543fxjTTtJ?=
 =?us-ascii?Q?3Veo0j3TAVUMXpIxyjtNzd8f1biKAusWBVIOJ9xxhHr6R8KpbguB3U8cS1Vf?=
 =?us-ascii?Q?YZUMIVhCpv6X1SDft65wn8tzXlvP1K3fb7oi+FlQz6hv4Cv3eYSFfU5JqAQR?=
 =?us-ascii?Q?AYEMV5CC5sglMz+nq6WxRQcqPvYTh24gWiMOwJrfmA2U6nPopt4I+A1HkPcn?=
 =?us-ascii?Q?pZF3Evbl8TdND0X4ht+O1Z0kRcqaZsASQg0pFrXD+fZqIgGVMhvKYGLj8jyS?=
 =?us-ascii?Q?02MHBMva/pwLmwBGN+7FcGtpsAERuEtJ/J/UWgZJt9TyoHJt2w4DJrUf4Z3H?=
 =?us-ascii?Q?z+WOSP7lEX5E8zuyz/Ja4buiyhJXh/V0/sCxWX5lkE9upIy5pcVPaCaijG0r?=
 =?us-ascii?Q?iKwvRsyhFjNYcwJ+OV/f/mqT+8cyATexXsqDXBl3TqTy2iDPMQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FdHFYWLjFkkfiGC1NFNGhCL4LS8WPZKVdPbUoowhkof+0VT4vk2iW2QRAoXd?=
 =?us-ascii?Q?tlbZ8cmTo0Q1Rnu7FYid/42fY/Yd8stDBpFhJ04msc69d2JCjsh+QP3m841K?=
 =?us-ascii?Q?wp3nonDXAm//nbeASfuY3AFM7YLpAQwpSOMUpaAHUw5G6XoiVJIfsffhaWZ3?=
 =?us-ascii?Q?7eXMnMKeBJmFFGPZcc1sZKVGMiNB0D6McWKIb7F6Sm9HOBm9+l4FEIE8CbuR?=
 =?us-ascii?Q?BupJKuuoP/Vjy45BwsFmhJRxGDSBahjjJGerSxKPUzs3gdimc+iBxaxl6Aa9?=
 =?us-ascii?Q?FjAIpyzjkkYOaFNZNqeeW1IZNClcfNYHQditfj2uw5d4ng+IlABIZcVowa2O?=
 =?us-ascii?Q?idhf/x2DiK945dpcMkuX6x3sYw/r/tV/eA4xitVDWRVuJNORhQ2EmcRxPsK6?=
 =?us-ascii?Q?du5Cgf06jWROnH1QuH0FUnP7fuF+Jz8mb7g9E9ypn2JkCuFUKqwYFi5hx6Bd?=
 =?us-ascii?Q?jYaOdDWey6X2ITjYi3QyxC32xxijEJPajr1jshBxmdgFLMx0rcvjHVk1E25f?=
 =?us-ascii?Q?6oI4rqfRG9/QnmmwMEQdRsFC1kYO8ddTMhKxbUBGoIN7AeJAecDTk2ADNFZ6?=
 =?us-ascii?Q?owII+JBQy/Y7T7RxHNgqGCUgJCf+mqzmGm4MktUcfaVX9SAmoMMxcwtgayEp?=
 =?us-ascii?Q?wQkgs33j/MCdLlUd+bT/PTwTcgOfUGAClTeCO7ucdBqrKmwR+hMT+lro2HPo?=
 =?us-ascii?Q?Ywmy0By1N0cgQiq+dE25JnZvKBb3o3Objkilkn8Bivj0UhrUAGka7mpClPiW?=
 =?us-ascii?Q?6IVGFGYtwgOPU1dbo3BgUMA7DDXwxul/Ghufb/gBqUkkhdthZ2q37bFrayzn?=
 =?us-ascii?Q?44q7XQj0k8Upt3ovglQ7myXjCI4psav+BEAKgWB3w/CPNau6TfF4lfyR2+Ie?=
 =?us-ascii?Q?nX0cMKgoh7mqcDA+TknnSeNCqj08F5YM19Of8eyGIRaXQAzFoH0e3HHI6wk7?=
 =?us-ascii?Q?43BsLYG0wpixA7BAVzLsvzN6pXJ0nP8qxd/keNvjP0xAZLQpVKsVXpzhy/oR?=
 =?us-ascii?Q?vb0mEz6eabh4Vg2WOI7BhpeP9J7ZlNUml8ilqP4JEY8zkSAs7yXzTJVgCwix?=
 =?us-ascii?Q?iuRsQ1QGpKwYlE6j9pT9fgEI4RGNfMg+m4EqsUBG6Q6FVTfQvcB9mpq+8OYJ?=
 =?us-ascii?Q?aF4sNicGpWehVATx03DwFt3AgTDMX9DgLdK+xTkeTnBpMAfQQJrbHKlOAeRg?=
 =?us-ascii?Q?dJ0yL00BTMMOeRhWoZss3w9IaswGopNj6fx0T5Olby4P5US6TezWq3UNcmtJ?=
 =?us-ascii?Q?uDtIr2e9ouWYzT3CReaLzUC93orQfq/3a8eBoEOInrQOyHM57pMQeHxDAO8C?=
 =?us-ascii?Q?Q4Qtvsmn7i5/K1Vh4+eRmu1txJoCQmiAr2qoM2OWUVFa4TxA4NdqAN17dnp+?=
 =?us-ascii?Q?/n8stu39RH9lMLhhfSSegIBkpPE7TCkhC6xBgHZAY4dRYHcKuo1x6AeXC7S3?=
 =?us-ascii?Q?oOKf2PdfirXBHdCc/77EZm3km/ALvtbGouLDyFr/k9HI2ONTxzenFHGsViFG?=
 =?us-ascii?Q?g5B2fx1YceblV1TP/w6gzwf6B+IjAdq3xg49Y2h7QAxzEB0tT3EN8TIfOxQ/?=
 =?us-ascii?Q?kUlYsGmAVALq3MiDArK3ujiMWeBQXbgoCoyzainM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b3a33b-d603-40f8-115b-08dcbc53be10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 11:25:03.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaUxmXOeolo2zOW7O++26KWQEYqgd702GhVQj7D77PqEbHxcw85M9UEYYifXlbwNIelGtat375WFAcDoTYDtiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052

Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
isoc usb requests", pump work could only be queued in uvc_video_complete()
and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
we can only depend on uvc_video_complete() to queue pump work. However,
this requires some free requests in req_ready list. If req_ready list is
empty all the time, pump work will never be queued and video datas will
never be pumped to usb controller. Actually, this situation could happen
when run uvc-gadget with static image:

$ ./uvc-gadget -i 1080p.jpg uvc.0

When capture image from this device, the user app will always block there.

The issue is uvc driver has queued video buffer before streamon, but the
req_ready list is empty all the time after streamon. This will queue pump
work in uvcg_video_enable() to fill some request to req_ready list so the
uvc device could work properly.

Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/uvc_video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index d41f5f31dadd..a9edd60fbbf7 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -753,6 +753,7 @@ int uvcg_video_enable(struct uvc_video *video)
 	video->req_int_count = 0;
 
 	uvc_video_ep_queue_initial_requests(video);
+	queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
-- 
2.34.1


