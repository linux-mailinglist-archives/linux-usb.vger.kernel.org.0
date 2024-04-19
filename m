Return-Path: <linux-usb+bounces-9487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253FA8AB5F7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 22:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67AA2B22303
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 20:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9D013CAB1;
	Fri, 19 Apr 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="JS+QUEFq";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="iCroiDOs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C39130AC8
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713558209; cv=fail; b=FaFFMAVlxP9CKByfHTZPoHaD3jHHwX7NyvMqWB+12kyAHwpKaOT/CIwtkvt5rUfSKuwDqPimyL4Ps6bqjYHuKmYDLV7apOyZM+Q2pTczENjYs5c61CyhVEjRybmtzoAQKOdJ9rInDyYUEzLXrgEFXZS8vcejXFBrp8lsqg9FR0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713558209; c=relaxed/simple;
	bh=/xU0TNvtV1SsKXUu322XXCIRmMNmaUrCis1kbgdT9RQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=F3hYWP/vES+Go0rkHEs4ojxSTHbC9TsozRJ8GRwP20IKpoa4094HwguLXCVSerfV8R9yCUfG/QIlMuFlkVOMg1+i0lAhnT+o6ypOJUqvTfUB4h9soCVBwGfiWaTo59oRclJbWLOpQugwCtnu9pIX0twcDGDnv5f8pKN2xNa5HKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=JS+QUEFq; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=iCroiDOs; arc=fail smtp.client-ip=205.220.168.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43J6o2Dp032608
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 13:23:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=2kU2MM
	0IOnn9vwsxCdQxTfiwRZ57uprOF5SCi0W55G4=; b=JS+QUEFqB9Izeic+eNsJpR
	+SNZ7KFNaXZqqOwI562LfoV7oaMHa+K1+ZpmCqhKjJl2p6Z+cDHTP+MPqayt7DQa
	tt4akMQMsYfOdk3SNeSN3wrg4/bHm8OObAxEqRsXelv8Xj1k1Q1lEqaElmzhEvug
	uo4LGVk/fYC4L69rNZrSNrAi0w+sEt6vJMDo+j1slFQJUUyYPdspxlfm1lu5wyo+
	MlHBCpqdUVzAbqFZJeBU4oNilca5oHkP8UoPdhuP1WYB+PbJpK1QyM5njle5LA+r
	hrn31PfqfgnsOM0CivMs78aytwW0zqSk8N3WkOznkiu9rVDEQc1EmdlubAxuyusg
	==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg09r4bdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 13:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWrEyXTEbPcvy0CIvJRwcpkNCA+UfwBefX7Y2N3aJGY+V9BXhC22IkTzMa82GoYMzG4X0c9XhvkBKzsCpfw+R6FZz2PINJKGt34jQPTDejEfVqR1Xwk3LTWS+AIvUQEjNEoQE3lv10h22z2AckncUwlMqH73aWtSfdPORYPHGNyR5/ojRH2YTYOCBwqyfupkWxFKMVTlufH2wOLKQ3v2x5sJHW/1tuDPV4mWZNTU6gkxO1tFUA6/IKsRLbgmG2wSZNCT5arLIawemeykeZZ/OJ7pxL469hiNphcywlMjaVRXzoTC6KYJ3euT4ufR1UUwddsoaYcSxmWy7PLeOqlrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kU2MM0IOnn9vwsxCdQxTfiwRZ57uprOF5SCi0W55G4=;
 b=Z/QEaCl/BrgehjecmNkQMHOQGh8lNs5fDAH6kxc5XPdz0KEvINntbI7DefNCY3nw5pgBFOF93fj9ao7KqwPlQwx8E03SpB/tjNkc4jVP1OKdmik7vgzDZd042TrrEYO+qqRmEcBeyNmkf85prVa+YtU08UkqnIdvrMhtzDDDpmbwXB4ekjlD1nZerCs/ZWa/A7R1LnhOXbtUjB5rqBgt2qII23Sl0BF147CXIwXDT0MjfmCBDsBFsrPuG69vyleen9lyVkT7/GhOHLBcPqmHbaP2+XRFFYcTCZIdjlp7G8lgTWMI4iK6BI0Q2Igj2pP3raNCl/p+ag5tdvcpQdhNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kU2MM0IOnn9vwsxCdQxTfiwRZ57uprOF5SCi0W55G4=;
 b=iCroiDOs+TQwCbKFMB7AzyCiCfHud32imIbmCD8ki1jyv5kvoj8AngMCgEBnousoV69Vq5KY9ElZyI8K1HyOW0PqfCbBQyyXTmJMkK+G9UIuZmFiCQahu4h7k3GwKcrFOr970qV51i9YHoM7bvscCMUDI+uoOSnqb83sV2biC4bf5kwys4JCknfOy8AHy8tb+F7uP3euHKdkOxhj48W3drlWMUVaLitzi6u34JsdYaI33YwadXR1+CCCGRFgoakQgGKPSYRuzzyBq2lsdTEfAb/UD9E/xOExkq0AELZZ5LeRjYHnI6YZurhV4l+1dLRqir715o/CmNcSeeVPr+7nOA==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by BL3PR17MB6091.namprd17.prod.outlook.com (2603:10b6:208:3ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 20:23:21 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 20:23:21 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_uac1: Expose all string descriptors through
 configfs.
Thread-Topic: [PATCH] usb: gadget: f_uac1: Expose all string descriptors
 through configfs.
Thread-Index: AQHakpdDOzPwEwW1akqDe4n7OahRWA==
Date: Fri, 19 Apr 2024 20:23:21 +0000
Message-ID: 
 <CO1PR17MB54198F836C3ED1B4FA5F14A9E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|BL3PR17MB6091:EE_
x-ms-office365-filtering-correlation-id: fbb9b38c-5e3b-4c89-bea9-08dc60ae8ea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?qsycplSHP6blXIlOIDuu1lp+EI/3D0R967U9/+36pC1apb4aRrtdxmps6H?=
 =?iso-8859-1?Q?Uxccf3FBefdernYiFqzTugXjnKi2kFKVPxqN9Gtn2MCRh1E1wOWjZgtYRJ?=
 =?iso-8859-1?Q?DVCSz31T+zC/Ej/Q0IoChVsaeAkQW56I9Wq4A0c9dAPVjXlfUbcs/CHyuY?=
 =?iso-8859-1?Q?ew/lbmbYrmDZE/grGTz57E2WV7+cqChXL044YaKUgNGQSNwDdAp79Okkfs?=
 =?iso-8859-1?Q?7aed4+u7LH8JIFBWinmP6tIBYYpxkix6mKxjH/b8Xkrx46VgG1fuHhBwrw?=
 =?iso-8859-1?Q?wsljfsrnbVbOadHd/uVxS0DdxN+di81i6acbRLzVs6jaiL5LKtuSgYhYt/?=
 =?iso-8859-1?Q?KfSSGYedtIN31pDDke5se3kzZs89DiSt3CA+UDenH865fIgpa2UyQ95LJV?=
 =?iso-8859-1?Q?lleu+gQIHn+xh828QgOML2gBTl2KGbcsSGhjDqpAEhWzOgZaXc55DZOWIz?=
 =?iso-8859-1?Q?kiA4/L9N9lQjiFKohItU4luTn62ld8HCSYE9mmS3zZLc8r+nLzJFyraTN5?=
 =?iso-8859-1?Q?KwphHgbRrTvBqrcgquP47rns4HPVpnqScgJRaPa5m86C9t6PiIrgwYIpiu?=
 =?iso-8859-1?Q?UgwS+NaCAdAX9ikZ6+YunBOwrlipJsOUIkUthVnmxRdw8v5hEdAB8DsWdp?=
 =?iso-8859-1?Q?f7yousnemk4x34JV8bQRP6tf9ivXrv1V+iOFzPhpFM9XWFco0VI/VWuboZ?=
 =?iso-8859-1?Q?OktD2bHcs2H338ihgKZhD8xUTGlTBS3vJXH+GeyO5GHG+1yKW82RtPyWnb?=
 =?iso-8859-1?Q?Lr+h4Oi3NtDa6mfFNlzOqQi54+X7d4Cg4xNmLPJO6MEmQQ+8uc6bKNf0KJ?=
 =?iso-8859-1?Q?ci/1h8lyigsMrzEb+QQCcjAhA8otXNzwU7xaCYggS3/TYojFMQjI3+Qdqn?=
 =?iso-8859-1?Q?oImrM3o9JvOeqRwfmEeGi+Z7nAXZnhVUS+p0URdWhY8wfa1lTBvHm6SffD?=
 =?iso-8859-1?Q?poG88I8vBQsLSK3iQUlIrHtv1CCzbnZAf0UJPWndVvZaREwmUg2agelEO9?=
 =?iso-8859-1?Q?dSM4ZOsrARNRsz4FoGipxAAEe7h7YwWtStoy21R1zUw7o3f+N2aq/HyV2e?=
 =?iso-8859-1?Q?QbsI5sTdpFyGmJBDN/DyJygE1dJ4ZLU7N+rZEIqf0bwxdrx3IVK7djhKfl?=
 =?iso-8859-1?Q?hGaBjUtd7EokHKhsW6nvdffO0CvmUSlHTt3MGSB7djsRRriUwKB1e6woBv?=
 =?iso-8859-1?Q?gphHzuqFGf2uc/lVOa67MA6BEoMHzWNBqOtA2XJ3iQY6Osu5VTuHW8sLMh?=
 =?iso-8859-1?Q?Rx74ySiUvaO4s3bHBM3izgtOxfsCfWpuv51xkcuh8OlCQMhVxV8RVuqxNl?=
 =?iso-8859-1?Q?Mzui/QQ4gAhq9Thjcp2E5HTmANQI1s9w82yuN+V/Sah/mlcTfNr4J+cBqy?=
 =?iso-8859-1?Q?/KEKt2J2vPabN2gftDmWVZlX00gNva5g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?jnFMxb7LsTceo67b7ZLFRIXkj4tDZty+4Y/uGuLBXKx/ODh3QPSXo9k/3C?=
 =?iso-8859-1?Q?19hx+FgAtltT38yXrT6qkhxRm6ZN+NwNGgjZuJ3eB4bD+C7Y+4OMQuw+dP?=
 =?iso-8859-1?Q?sWtLIGtwkTi/6intGheqb2NBY2yRU4STgunkGLoEIZvpf3+TA6DW60URr+?=
 =?iso-8859-1?Q?GV/S8ZhBBGOEroAQV06yPdL53b2+1EWib565SRFUXdMzQ4eyYmK5ChFXgV?=
 =?iso-8859-1?Q?QBuzzvLnidb4UqJw9zc3MneFRuYUGeGGlZxWcy6cBrnDIFyXizWJhShhqi?=
 =?iso-8859-1?Q?j5Jd04A4K8Mb4ptwRmH1hkjfwPFwQO0fvZfkEWoY9CC029WTN6rUN5s7Za?=
 =?iso-8859-1?Q?3174shkkVyZTBtK+KrX6Kuv85v9QsO3vQlZnPqFWN/mxlGFPLy5AhgwkSq?=
 =?iso-8859-1?Q?/lAgLYTlJzqyZOttUzkPCH3mFsexspd4SfoDF7HZIZEg0nz7C6Z1kBO1Oq?=
 =?iso-8859-1?Q?PLfQsc+lwzYcr80/xGhfqjXuiYPW4OgQmPN+mFKjv3D3nO80DhGtK9A89E?=
 =?iso-8859-1?Q?NhQBFWya1mOMIwz0OJMyo2OF1nxgND+pdhK2r/rzegyzggEvroA/sCMmR+?=
 =?iso-8859-1?Q?Nlk9OSwVGYJ0z2x8c3dCfx9XRox9ehazOQ0/be+CRRlO+eIjUFVqe73cnG?=
 =?iso-8859-1?Q?f/m1S5LPpeWS2G3jQdL50qdWvSAA7t5HV9fZitRGHJbjMefJZwhxohdr/q?=
 =?iso-8859-1?Q?Ghsvimb1NVQ7dLyw5bnnFN9W2gJXEX+IIFf2Tqbr9wycDGUYoItCs1D4R2?=
 =?iso-8859-1?Q?nc7tcCP2/lcq16zcO3jTAq98HnCIDRhdsnZn+7Fu2Wxz/A5PCATXjQkzmo?=
 =?iso-8859-1?Q?2Klb4YctRLOyFxVqFvJbCEZKTt9XRF48iQfGPyVVStjUBRg1VHpr9mE2SI?=
 =?iso-8859-1?Q?FzPTr6aoFyjKFqaqytadNmfC8MdaPv0sv7yX2Kmq7EEG0HLBuUE4CZgWnV?=
 =?iso-8859-1?Q?gaSn92J9kisYmqMpRqnQiBQeljJsA304CicYjpTN3etzm+8xhrlfgxsZDl?=
 =?iso-8859-1?Q?0fywoI3MmfzL7PFRxWBmYpXmmggKWgi2xJJmeuM9QA6t0la1UVyr2UD1Bl?=
 =?iso-8859-1?Q?k1BB8wqA1/wGlhzDHJmqDeZS1ULgiy4olAYmfGgbzylHbp70lzLEa2QLw6?=
 =?iso-8859-1?Q?DoKNlE2LhsBXH/8ZoWZZRP8IxaqDdxIK6kIhitC1q8NW000ugk+2Zm5ypV?=
 =?iso-8859-1?Q?AYpVmESSDh92qBYKUhiJYkStlaPGc823PFEUln9U4MUw78SieYKLy0eEiG?=
 =?iso-8859-1?Q?UmKB/KyGG+qJBuncPbfZEZ0s1yGqHtrS9YvXE2+CEZ0CZs4y9h47SGQGEE?=
 =?iso-8859-1?Q?cnJ3HAHfL1ziUNgmdHF3A7FT7+9RhhzHqV3byjtGA4xAGCDDKv5kzyngPo?=
 =?iso-8859-1?Q?b6RDpDrD9hOWRbS0du5Vm7QaX7u9AxCVu1mz0mjl4oyKei3LXTlVKhPN9m?=
 =?iso-8859-1?Q?mMj4+1CWzmLtmmjLU0XFF6qgbinYxR1OhD8BMTO+cWLlF5Su8ldvq3o2eJ?=
 =?iso-8859-1?Q?b5ggW7ht8HeFfKjm61LKLVv1aV+K3oMFsuksC92Q6MJElzL5fAMON/rROn?=
 =?iso-8859-1?Q?jAfAS3Bu/Ut3sKsbflVhcNOQdKwpJ9PMSSSJ2crvKxzb6xfIcIwNxYpVDV?=
 =?iso-8859-1?Q?w4uxy5PT1iCebYYelGZQYYYafkFzQqbctq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb9b38c-5e3b-4c89-bea9-08dc60ae8ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 20:23:21.3593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJkM8a8POOr+EjhZHDEmaNoeIeuR+yvESzkToCfOGN3+xar5zrpIBOpiqazq6CV9ZOUBBJHQsCMHrH4c7CLvAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR17MB6091
X-Proofpoint-ORIG-GUID: umVW82qDjwhTqmjs7xC6Rm06Odf9SK2d
X-Proofpoint-GUID: umVW82qDjwhTqmjs7xC6Rm06Odf9SK2d

=0A=
This makes all string descriptors configurable for the UAC1 gadget=0A=
so the user can configure names of terminals/controls/alt modes.=0A=
=0A=
Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
---=0A=
 drivers/usb/gadget/function/f_uac1.c | 66 +++++++++++++++++++++-------=0A=
 drivers/usb/gadget/function/u_uac1.h | 14 +++++-=0A=
 2 files changed, 63 insertions(+), 17 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/func=
tion/f_uac1.c=0A=
index 7de74a3dd392..100169d6dca7 100644=0A=
--- a/drivers/usb/gadget/function/f_uac1.c=0A=
+++ b/drivers/usb/gadget/function/f_uac1.c=0A=
@@ -377,24 +377,10 @@ enum {=0A=
 	STR_AS_OUT_IF_ALT1,=0A=
 	STR_AS_IN_IF_ALT0,=0A=
 	STR_AS_IN_IF_ALT1,=0A=
+	NUM_STR_DESCRIPTORS,=0A=
 };=0A=
 =0A=
-static struct usb_string strings_uac1[] =3D {=0A=
-	/* [STR_AC_IF].s =3D DYNAMIC, */=0A=
-	[STR_USB_OUT_IT].s =3D "Playback Input terminal",=0A=
-	[STR_USB_OUT_IT_CH_NAMES].s =3D "Playback Channels",=0A=
-	[STR_IO_OUT_OT].s =3D "Playback Output terminal",=0A=
-	[STR_IO_IN_IT].s =3D "Capture Input terminal",=0A=
-	[STR_IO_IN_IT_CH_NAMES].s =3D "Capture Channels",=0A=
-	[STR_USB_IN_OT].s =3D "Capture Output terminal",=0A=
-	[STR_FU_IN].s =3D "Capture Volume",=0A=
-	[STR_FU_OUT].s =3D "Playback Volume",=0A=
-	[STR_AS_OUT_IF_ALT0].s =3D "Playback Inactive",=0A=
-	[STR_AS_OUT_IF_ALT1].s =3D "Playback Active",=0A=
-	[STR_AS_IN_IF_ALT0].s =3D "Capture Inactive",=0A=
-	[STR_AS_IN_IF_ALT1].s =3D "Capture Active",=0A=
-	{ },=0A=
-};=0A=
+static struct usb_string strings_uac1[NUM_STR_DESCRIPTORS + 1] =3D {};=0A=
 =0A=
 static struct usb_gadget_strings str_uac1 =3D {=0A=
 	.language =3D 0x0409,	/* en-us */=0A=
@@ -1264,6 +1250,18 @@ static int f_audio_bind(struct usb_configuration *c,=
 struct usb_function *f)=0A=
 	audio_opts =3D container_of(f->fi, struct f_uac1_opts, func_inst);=0A=
 =0A=
 	strings_uac1[STR_AC_IF].s =3D audio_opts->function_name;=0A=
+	strings_uac1[STR_USB_OUT_IT].s =3D audio_opts->usb_out_it_string;=0A=
+	strings_uac1[STR_USB_OUT_IT_CH_NAMES].s =3D audio_opts->usb_out_it_ch_nam=
e_string;=0A=
+	strings_uac1[STR_IO_OUT_OT].s =3D audio_opts->io_out_ot_string;=0A=
+	strings_uac1[STR_IO_IN_IT].s =3D audio_opts->io_in_it_string;=0A=
+	strings_uac1[STR_IO_IN_IT_CH_NAMES].s =3D audio_opts->io_in_it_ch_name_st=
ring;=0A=
+	strings_uac1[STR_USB_IN_OT].s =3D audio_opts->usb_in_ot_string;=0A=
+	strings_uac1[STR_FU_IN].s =3D audio_opts->fu_in_string;=0A=
+	strings_uac1[STR_FU_OUT].s =3D audio_opts->fu_out_string;=0A=
+	strings_uac1[STR_AS_OUT_IF_ALT0].s =3D audio_opts->as_out_if_alt0_string;=
=0A=
+	strings_uac1[STR_AS_OUT_IF_ALT1].s =3D audio_opts->as_out_if_alt1_string;=
=0A=
+	strings_uac1[STR_AS_IN_IF_ALT0].s =3D audio_opts->as_in_if_alt0_string;=
=0A=
+	strings_uac1[STR_AS_IN_IF_ALT1].s =3D audio_opts->as_in_if_alt1_string;=
=0A=
 =0A=
 	us =3D usb_gstrings_attach(cdev, uac1_strings, ARRAY_SIZE(strings_uac1));=
=0A=
 	if (IS_ERR(us))=0A=
@@ -1682,6 +1680,18 @@ UAC1_ATTRIBUTE(s16, c_volume_min);=0A=
 UAC1_ATTRIBUTE(s16, c_volume_max);=0A=
 UAC1_ATTRIBUTE(s16, c_volume_res);=0A=
 UAC1_ATTRIBUTE_STRING(function_name);=0A=
+UAC1_ATTRIBUTE_STRING(usb_out_it_string);=0A=
+UAC1_ATTRIBUTE_STRING(usb_out_it_ch_name_string);=0A=
+UAC1_ATTRIBUTE_STRING(io_out_ot_string);=0A=
+UAC1_ATTRIBUTE_STRING(io_in_it_string);=0A=
+UAC1_ATTRIBUTE_STRING(io_in_it_ch_name_string);=0A=
+UAC1_ATTRIBUTE_STRING(usb_in_ot_string);=0A=
+UAC1_ATTRIBUTE_STRING(fu_in_string);=0A=
+UAC1_ATTRIBUTE_STRING(fu_out_string);=0A=
+UAC1_ATTRIBUTE_STRING(as_out_if_alt0_string);=0A=
+UAC1_ATTRIBUTE_STRING(as_out_if_alt1_string);=0A=
+UAC1_ATTRIBUTE_STRING(as_in_if_alt0_string);=0A=
+UAC1_ATTRIBUTE_STRING(as_in_if_alt1_string);=0A=
 =0A=
 static struct configfs_attribute *f_uac1_attrs[] =3D {=0A=
 	&f_uac1_opts_attr_c_chmask,=0A=
@@ -1705,6 +1715,18 @@ static struct configfs_attribute *f_uac1_attrs[] =3D=
 {=0A=
 	&f_uac1_opts_attr_c_volume_res,=0A=
 =0A=
 	&f_uac1_opts_attr_function_name,=0A=
+	&f_uac1_opts_attr_usb_out_it_string,=0A=
+	&f_uac1_opts_attr_usb_out_it_ch_name_string,=0A=
+	&f_uac1_opts_attr_io_out_ot_string,=0A=
+	&f_uac1_opts_attr_io_in_it_string,=0A=
+	&f_uac1_opts_attr_io_in_it_ch_name_string,=0A=
+	&f_uac1_opts_attr_usb_in_ot_string,=0A=
+	&f_uac1_opts_attr_fu_in_string,=0A=
+	&f_uac1_opts_attr_fu_out_string,=0A=
+	&f_uac1_opts_attr_as_out_if_alt0_string,=0A=
+	&f_uac1_opts_attr_as_out_if_alt1_string,=0A=
+	&f_uac1_opts_attr_as_in_if_alt0_string,=0A=
+	&f_uac1_opts_attr_as_in_if_alt1_string,=0A=
 =0A=
 	NULL,=0A=
 };=0A=
@@ -1759,6 +1781,18 @@ static struct usb_function_instance *f_audio_alloc_i=
nst(void)=0A=
 	opts->req_number =3D UAC1_DEF_REQ_NUM;=0A=
 =0A=
 	scnprintf(opts->function_name, sizeof(opts->function_name), "AC Interface=
");=0A=
+	scnprintf(opts->usb_out_it_string, sizeof(opts->usb_out_it_string), "Play=
back Input terminal");=0A=
+	scnprintf(opts->usb_out_it_ch_name_string, sizeof(opts->usb_out_it_ch_nam=
e_string), "Playback Channels");=0A=
+	scnprintf(opts->io_out_ot_string, sizeof(opts->io_out_ot_string), "Playba=
ck Output terminal");=0A=
+	scnprintf(opts->io_in_it_string, sizeof(opts->io_in_it_string), "Capture =
Input terminal");=0A=
+	scnprintf(opts->io_in_it_ch_name_string, sizeof(opts->io_in_it_ch_name_st=
ring), "Capture Channels");=0A=
+	scnprintf(opts->usb_in_ot_string, sizeof(opts->usb_in_ot_string), "Captur=
e Output terminal");=0A=
+	scnprintf(opts->fu_in_string, sizeof(opts->fu_in_string), "Capture Volume=
");=0A=
+	scnprintf(opts->fu_out_string, sizeof(opts->fu_out_string), "Playback Vol=
ume");=0A=
+	scnprintf(opts->as_out_if_alt0_string, sizeof(opts->as_out_if_alt0_string=
), "Playback Inactive");=0A=
+	scnprintf(opts->as_out_if_alt1_string, sizeof(opts->as_out_if_alt1_string=
), "Playback Active");=0A=
+	scnprintf(opts->as_in_if_alt0_string, sizeof(opts->as_in_if_alt0_string),=
 "Capture Inactive");=0A=
+	scnprintf(opts->as_in_if_alt1_string, sizeof(opts->as_in_if_alt1_string),=
 "Capture Active");=0A=
 =0A=
 	return &opts->func_inst;=0A=
 }=0A=
diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/func=
tion/u_uac1.h=0A=
index f7a616760e31..818a335a309a 100644=0A=
--- a/drivers/usb/gadget/function/u_uac1.h=0A=
+++ b/drivers/usb/gadget/function/u_uac1.h=0A=
@@ -52,7 +52,19 @@ struct f_uac1_opts {=0A=
 	int				req_number;=0A=
 	unsigned			bound:1;=0A=
 =0A=
-	char			function_name[32];=0A=
+	char			function_name[USB_MAX_STRING_LEN];=0A=
+	char			usb_out_it_string[USB_MAX_STRING_LEN];=0A=
+	char			usb_out_it_ch_name_string[USB_MAX_STRING_LEN];=0A=
+	char			io_out_ot_string[USB_MAX_STRING_LEN];=0A=
+	char			io_in_it_string[USB_MAX_STRING_LEN];=0A=
+	char			io_in_it_ch_name_string[USB_MAX_STRING_LEN];=0A=
+	char			usb_in_ot_string[USB_MAX_STRING_LEN];=0A=
+	char			fu_in_string[USB_MAX_STRING_LEN];=0A=
+	char			fu_out_string[USB_MAX_STRING_LEN];=0A=
+	char			as_out_if_alt0_string[USB_MAX_STRING_LEN];=0A=
+	char			as_out_if_alt1_string[USB_MAX_STRING_LEN];=0A=
+	char			as_in_if_alt0_string[USB_MAX_STRING_LEN];=0A=
+	char			as_in_if_alt1_string[USB_MAX_STRING_LEN];=0A=
 =0A=
 	struct mutex			lock;=0A=
 	int				refcnt;=0A=
-- =0A=
2.34.1=0A=
=0A=

