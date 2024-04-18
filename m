Return-Path: <linux-usb+bounces-9470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6768AA42C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 22:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083201F21E5B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 20:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ADD194C7F;
	Thu, 18 Apr 2024 20:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="EE/cQs39";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="eBvyCjAv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8F190663
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472759; cv=fail; b=rdMHiXCtH0QpWuP7EaerGsu26PFwopKA/j0rNXeanIj7x/YFWKzl0PD32TYg2fct1yRbigMZ1dCe2Tz0YkZVigTd5sxqRHzozWF7XEPJilbgl6+sBm7+fE4O809SbeYa3ZQn4hozuhbA8Y/btQK9WsEZv3pRnkAHu2DhRgiexDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472759; c=relaxed/simple;
	bh=ntt66NR2HOKW7rNojVbNmO1T673wVasmn3NukVR3JSc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gi1R4c5aW0Zhepf8k5Y7raVm1PGl+15ai3b4ozQdHxzTE+XAaO7uZY4L5G9mvAlkh2XT/3bsnaUKtJ3CvCUgQWDQ8hhL6BEReFBfdEivIKDJDILTPlh+UB1JgbWDGwLXRrvqm0xEK4yHpV/cveNFqoKdPZsxnnL9GOyPTo+YmSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=EE/cQs39; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=eBvyCjAv; arc=fail smtp.client-ip=205.220.168.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I8T72V007712
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 13:39:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=ZBWTfp
	aqiBeZLGHK7AkRl5q5dEJQihA9xXlyt91MzEg=; b=EE/cQs39SBbcFpV+211U+W
	IqHpAe32JJV50QjPE32uu8oL337MWKjqaIEtJL85O3HKRhTA9h+N5yFtvxfWpoZr
	sh1YRkgaagm2LyfNC8UYALAF2tBOVectRkgrtaPvntnr57KvIYTkkeA3ei8b6zh/
	ycAeMPGS38MG4aT4LJOZz6A2gtwrF80ufElluqime8jlIVmvX0sZrokuYWJS+Odj
	pjPea3xSRsWAx4FleRXFWhlK9RAyJSUevqZXrwvDeqosIRJmfj48iMhydmnfZj+J
	fdxi7IG7lk7qzkE8geJd0C4viv/P/J8w2uqDb3rPNjEumxOLYDxn7Q/eZqj/Xmdw
	==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg09r3kp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 13:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTiRCEdgWVoLXGMSNc18P9JLvJDLgqF4TAvpTIHfNXMt+H4QEMcvHtOyfUXnZfDlzrC/UNUkPYs6ZfMoRK4Pr/xHIj/4dT40LpT5h1wcJ0aiPhlLQBV5xEJa4hdyKsyUPKRHNudI0SZm4LMrLWs0WO7MB5F5VHQdUyyZwJObombE/RUeHEpEg5KoR8STBX1tkDOt5FCHwlvRVDvnmM31Q+Lzyyu6ltw/JOvTNaVl2tbOnJgJ5h7vtsL/SdAc3ksr/BWKya/03fGRXcrtJD+CJnzuhB/gkX0yv/+nUmCc/oBeqlg8GNgnQi8RiSyiX5yKDVaZzI6WQCCmId/0qgBbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBWTfpaqiBeZLGHK7AkRl5q5dEJQihA9xXlyt91MzEg=;
 b=brTGEqTRdb7OkfFfhJ6JXAwxo17pWY5Vgy86M6LsjzwKXflUjk8IVrXRAcNR6A8cWcZU7cwTalxD39L/n6JMa/dAB70ghAxagajmuVHgENJonp4wPZQs8QJhYeNsvJrnDLhWdyezIpjeCzHh3y5e7TrlLOJ0mFshnkWCLo44L/RzpTNl7307VYC3d3vq/XRduYxEYkDMo8iNbj7VcVBcIwMBmhGXL4O9K1hwm1O6zAVcQUPwxyN77vkqrr+tp1w6xT0Cj+H33K9C+N1yw8ijWQowoh/1D6PTmbfDuSuKlCN0760kdjUDJOz7Gew7n/jNSi7CfaRO8UkdJIWJWtqr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBWTfpaqiBeZLGHK7AkRl5q5dEJQihA9xXlyt91MzEg=;
 b=eBvyCjAviUPKroN1s6OimT2KF9gqITBbyooHiXqpp0Yt7QueoZBvWvyNv3+MLHDTwdFCTLspjJ3mipn8xLAc16GuYYgLtDGvc1KoCts2FGK5e+KDWVwlIAYDKB4A2PprE5QtfC+DwU69/aL6lc5Q96LkdLxotq/OfchaWGVYdYqmZe9sEkPR6iHYDLHCdTAYNgeeo+LP8B9K6S0OTPJIZB5kDALT9prLuyNAdvOgxBiNmZSSL09GmhsPm/m+O5or4j9QQwENCFfbczdGYCt4dX9rgDqwoE4DkDFtclu7N9qMHodhM61gvm1vhuv5MichfW3nR8d6ELfES6R1KqIm8w==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by CH2PR17MB3847.namprd17.prod.outlook.com (2603:10b6:610:5c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 20:39:05 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 20:39:04 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Topic: [PATCH v2] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Index: AQHakdAF2mrm4jxc0ECnggSkCs40SQ==
Date: Thu, 18 Apr 2024 20:39:03 +0000
Message-ID: 
 <CO1PR17MB54198D086B61F7392FA9075FE10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|CH2PR17MB3847:EE_
x-ms-office365-filtering-correlation-id: 34f354b1-a5d8-4f79-b90f-08dc5fe79615
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?e715eTR49lbCr2ZJWKUehUT8PYxa22LT1Dg4LjQBjJdu8VXubgMFs93ljP?=
 =?iso-8859-1?Q?ESFJjwOEAV6IY3cpuv+sMHlcJFMezy1jNEveIxD6Tb5eLGEepqbzl08zgi?=
 =?iso-8859-1?Q?yB7h4cs0RL8d47lr8Vr01uISs6YBjd3smh+LE25dV/L9+HojbJ/xZf2fZ1?=
 =?iso-8859-1?Q?oL771TBI3rpR50zQ57cC3yITl5SLcKp7myTcDdPuMA+KNh8l1d164znBQX?=
 =?iso-8859-1?Q?d8RyzAnzwnuh8CIMKvgDCCNii2PxisFqADutNDOtnwJ2nrCntHFXRZeEha?=
 =?iso-8859-1?Q?9VhTpaYYxebQkZE/Too4GQJhxSzo2nXV9gzNnePZ95sQ6O64ZtjD/MQgFj?=
 =?iso-8859-1?Q?RdV3pau6a6p12NQsdirN8FQO5BjCYP45cPZoJ0SMSTi7+FteDiJxSpKjP9?=
 =?iso-8859-1?Q?A7hosvgOPacZhfnz0EXYmNlDHAuenzabmxlbZdM6Prtd/2+BKOEfGoNCj9?=
 =?iso-8859-1?Q?eB6BvbZcKGd711hKDtNEXBTcJIzyoxR8tOSSlSpbQCpQjvDUIg7HDa/pJ8?=
 =?iso-8859-1?Q?rjYBKA1R2DtJ0n9fLahz+bCY8bA8SbaHYe+EXkngDanyiZFfQI1JCKl3hr?=
 =?iso-8859-1?Q?7a25dfaPYrUb0leOKpmGVbYJqhCiUR+TK6B7nQBzaD+UAfCr6ovACbO90p?=
 =?iso-8859-1?Q?xXM0wzG/Qb8SooFN2u77imtvybbeedpvVCc855J/nUZk3meD/Z7Od4IxCt?=
 =?iso-8859-1?Q?LLroexsPIrXbD4Q55e16asqiLPIILGSjZDGSFa89Qt0I1frbBkX366bt2E?=
 =?iso-8859-1?Q?rIWQfcWs5YXpjX8NrdpETRXkKE77rKkxmBzfFpugmlTQ3MduYTFOJeut7F?=
 =?iso-8859-1?Q?E7l7gyGBWtC2JoDmSrXlG3euTCnyYrnaDs5m4LLoCNGcd82mv5rIf1YiF9?=
 =?iso-8859-1?Q?VQHX0RazDIDhGLbZFeouXbVO0qicXA0WxLeZS/mDbhLK3nRolnykLoxc1M?=
 =?iso-8859-1?Q?v2m40q93yEaKY1Khi1h+dOlpFN1pQPrXT5sXTOChnOOVimGzVUDONfyLNE?=
 =?iso-8859-1?Q?577t3UmBvGcQiq1W2m7IPoiJDfahhIUY//WOjnytWIKDy+RSbBgLCDPIvf?=
 =?iso-8859-1?Q?8/9USebQEockoETgdCOW+bvlB7z0muKiGt9YCsnTTrzuyyINhiI65+rRUo?=
 =?iso-8859-1?Q?OiyIjIuOkUi0gaHzpYXis3jUC9vyVIVW42mY5hfpkjt5TNgCC13A4wsqVD?=
 =?iso-8859-1?Q?I5uF3HbSMR5yHqF9ddIpn5MRhWrLmKxTlVwOVoHYnxyI//Wr6377vmMWAF?=
 =?iso-8859-1?Q?VqTuZJ8YYAWg18yu7ZNMS1+XKLuJeKedGYbrJ9a4HoYfouYSJJS9whPmGJ?=
 =?iso-8859-1?Q?5771UXgQYdOeqB8dujOJIU6e7nWPsAp7Ow4JaFrDqybKPEFHeU+1Sz/ppS?=
 =?iso-8859-1?Q?hme4TZjhqFTw9BoOkVuYNSXBDvud4yBw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7cDj6JDyvdK/jlJLAfA/fEW+ACZwuvNHINT5a+Nbvr9bKQshEXjCC2IgDX?=
 =?iso-8859-1?Q?/iiLTnlneOLRAT7SqFpaM5bZT8GsF5DOGk5LTaqBZgjAyzga2oqG+0GyAV?=
 =?iso-8859-1?Q?bV9D+iiyXSzOT4o83I/+XhTcVv5otetoRBbVOhy5/BkSujB3COZrzusl08?=
 =?iso-8859-1?Q?+PHQV87a4TWss/Ode7giLVIs4lPe8QTCc8qKq4TJgSGSWhenB6cTVUtyZy?=
 =?iso-8859-1?Q?9KoolWkBD2PCZUlA3KsyfDU2vTOX3Fy9wiVmjBnAUQWXLx9RtJSHVJzkmH?=
 =?iso-8859-1?Q?A0Dh+KLAM5GGxO0yzWrzQXnNUOvNDmU8CWH7Z2u9xSizbqtS/Xh6hSd70J?=
 =?iso-8859-1?Q?2X2T2ZeUMGzMxjm61AFtmZ0K80HnZxmLy3+Ck/ltFrRmpGUxhItnGFuDUj?=
 =?iso-8859-1?Q?N9yAeWo5DIygShScE2B+ifG089onwvbt3jAa6KsTsEapi+2oIYZKXbXjtp?=
 =?iso-8859-1?Q?srxYbBGn/FJLfVnVIHyJYLy7OyhRxEH3WKDVJQj+d/Dcd3ZrQfpws60nAn?=
 =?iso-8859-1?Q?lfELNh7py52Su+BZ9VM3SKAh/lLPxCs5jbFuJXriPXdjlgl33HQnMAV47J?=
 =?iso-8859-1?Q?VPsZ+AScRrMHqlJgiwYkVgYorHjHVEcpyXwBP9IJoiqFXRL6JwhD5yeP6f?=
 =?iso-8859-1?Q?HnIwxHtSjMo75wVUgEKuGZWT2qQww6eGlawnKGNICHWoEBm4kuBQ6gsTHt?=
 =?iso-8859-1?Q?EcMlqQL9+bjBuM13bkiyMkYQPqNS3hzph0up9eW5W53+0FanAyNORuUgj9?=
 =?iso-8859-1?Q?EJuXf2GujaLqXoh7Pq34PH2hiXZnOZeuL1sK6M5VuAtFiviWPZP69XM7b+?=
 =?iso-8859-1?Q?cyo9yBdEioYCvvY5uHRpt9ll3KNwk/BLvdZqfmot74dzHdgGKmk2To1TiD?=
 =?iso-8859-1?Q?Rl6gWB6v2TvmwVZH7fA1XbWI9bSYbuFyLcvfMNX3V85dt4IxKpsYRoK7cg?=
 =?iso-8859-1?Q?rNiiUNXmMd0lfcbzoG2pzrgKupHH+cEOCmyID1Mb5pVrcKbZDo7OKCB9nH?=
 =?iso-8859-1?Q?KR0tr57aNuQzbb1sRCzWt51W0fB2N2LNswXzwobQvas3LelEvL9taZvTdf?=
 =?iso-8859-1?Q?J38+o4V9trkZauQsSU3q7hDq1K3ZWNJId6qrRlOcSuw8p2beDAgUuaAa0+?=
 =?iso-8859-1?Q?rscMH6gfd2UlQxaYsiuNUv9IE/MiR+uCpligv5xHmlqOz0gdm7qD2KVjH1?=
 =?iso-8859-1?Q?F+kyl1eAIoVOUVluCsWVofuQg8fqmwsxq1se5jHniOTWB3Q48cBggQyfMI?=
 =?iso-8859-1?Q?bNRzR4IBNGGvkdEX2cbKkdf1zczj71AD0DPi1rnOG1yoxmJGbQohnKc8px?=
 =?iso-8859-1?Q?G9RTMesgZIXvliHIF0GCPoCHJZ1LMPyTaeD0EisyTMn2MgL9PeYZzaf/m1?=
 =?iso-8859-1?Q?oNdu9o+sJAH+q49tTfr3WxR3jpGz7nziy5lGo/P9u1Kg8Gb58twUmGuPwg?=
 =?iso-8859-1?Q?fG/9lQ897ovP8pvDlItjapdDKmsPhWSjdg4mBo5f1OMEBBWPBwwBegcTKx?=
 =?iso-8859-1?Q?qhOR2H2Y6CP578HWw/9g8LAA129hWZj39oGZsTTWEGc2qYyUsEMfUaofLO?=
 =?iso-8859-1?Q?U8gn8rtEiNKD32WF+Gsg9UdFDoLMD+py3N9MKMkt9dl91L68ci/LT1Rods?=
 =?iso-8859-1?Q?bfe0QBwNAhkiQHWFWbYDbJvHEraJtE4qfa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f354b1-a5d8-4f79-b90f-08dc5fe79615
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 20:39:03.9281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuoLS7HDbYJg1SIZSZny10Pzk3bDKp3HeGS7ACG7cXaYaOnQYDRMPG/qw4putFsbnOE38dmH7OZkMxxx70OJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR17MB3847
X-Proofpoint-ORIG-GUID: fbIOBwhwJP7azLHOaaO172FPdftlI7sy
X-Proofpoint-GUID: fbIOBwhwJP7azLHOaaO172FPdftlI7sy

From: David Sands <david.sands@biamp.com>=0A=
=0A=
Add the ability for FunctionFS driver to be able to create DFU Run-Time=0A=
descriptors.=0A=
=0A=
Signed-off-by: David Sands <david.sands@biamp.com>=0A=
Co-developed-by: Chris Wulff <chris.wulff@biamp.com>=0A=
Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
=0A=
---=0A=
v2: Fixed attribution and signoff=0A=
=0A=
 drivers/usb/gadget/function/f_fs.c  | 11 +++++++++--=0A=
 include/uapi/linux/usb/ch9.h        |  4 ++++=0A=
 include/uapi/linux/usb/functionfs.h | 10 ++++++++++=0A=
 3 files changed, 23 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c=0A=
index bffbc1dc651f..4d39e5e30b73 100644=0A=
--- a/drivers/usb/gadget/function/f_fs.c=0A=
+++ b/drivers/usb/gadget/function/f_fs.c=0A=
@@ -2467,7 +2467,7 @@ typedef int (*ffs_os_desc_callback)(enum ffs_os_desc_=
type entity,=0A=
 =0A=
 static int __must_check ffs_do_single_desc(char *data, unsigned len,=0A=
 					   ffs_entity_callback entity,=0A=
-					   void *priv, int *current_class)=0A=
+					   void *priv, int *current_class, int *current_subclass)=0A=
 {=0A=
 	struct usb_descriptor_header *_ds =3D (void *)data;=0A=
 	u8 length;=0A=
@@ -2524,6 +2524,7 @@ static int __must_check ffs_do_single_desc(char *data=
, unsigned len,=0A=
 		if (ds->iInterface)=0A=
 			__entity(STRING, ds->iInterface);=0A=
 		*current_class =3D ds->bInterfaceClass;=0A=
+		*current_subclass =3D ds->bInterfaceSubClass;=0A=
 	}=0A=
 		break;=0A=
 =0A=
@@ -2548,6 +2549,11 @@ static int __must_check ffs_do_single_desc(char *dat=
a, unsigned len,=0A=
 			if (length !=3D sizeof(struct ccid_descriptor))=0A=
 				goto inv_length;=0A=
 			break;=0A=
+		} else if (*current_class =3D=3D USB_CLASS_APP_SPEC && *current_subclass=
 =3D=3D USB_SUBCLASS_DFU) {=0A=
+			pr_vdebug("dfu functional descriptor\n");=0A=
+			if (length !=3D sizeof(struct usb_dfu_functional_descriptor))=0A=
+				goto inv_length;=0A=
+			break;=0A=
 		} else {=0A=
 			pr_vdebug("unknown descriptor: %d for class %d\n",=0A=
 			      _ds->bDescriptorType, *current_class);=0A=
@@ -2610,6 +2616,7 @@ static int __must_check ffs_do_descs(unsigned count, =
char *data, unsigned len,=0A=
 	const unsigned _len =3D len;=0A=
 	unsigned long num =3D 0;=0A=
 	int current_class =3D -1;=0A=
+	int current_subclass =3D -1;=0A=
 =0A=
 	for (;;) {=0A=
 		int ret;=0A=
@@ -2629,7 +2636,7 @@ static int __must_check ffs_do_descs(unsigned count, =
char *data, unsigned len,=0A=
 			return _len - len;=0A=
 =0A=
 		ret =3D ffs_do_single_desc(data, len, entity, priv,=0A=
-			&current_class);=0A=
+			&current_class, &current_subclass);=0A=
 		if (ret < 0) {=0A=
 			pr_debug("%s returns %d\n", __func__, ret);=0A=
 			return ret;=0A=
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h=0A=
index 44d73ba8788d..dcd962d1a75a 100644=0A=
--- a/include/uapi/linux/usb/ch9.h=0A=
+++ b/include/uapi/linux/usb/ch9.h=0A=
@@ -263,6 +263,9 @@ struct usb_ctrlrequest {=0A=
 /* From the USB 3.1 spec */=0A=
 #define	USB_DT_SSP_ISOC_ENDPOINT_COMP	0x31=0A=
 =0A=
+/* From USB Device Firmware Upgrade Specification, Revision 1.1 */=0A=
+#define USB_DT_DFU_FUNCTIONAL		0x21=0A=
+=0A=
 /* Conventional codes for class-specific descriptors.  The convention is=
=0A=
  * defined in the USB "Common Class" Spec (3.11).  Individual class specs=
=0A=
  * are authoritative for their usage, not the "common class" writeup.=0A=
@@ -332,6 +335,7 @@ struct usb_device_descriptor {=0A=
 #define USB_CLASS_VENDOR_SPEC		0xff=0A=
 =0A=
 #define USB_SUBCLASS_VENDOR_SPEC	0xff=0A=
+#define USB_SUBCLASS_DFU		0x01=0A=
 =0A=
 /*------------------------------------------------------------------------=
-*/=0A=
 =0A=
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/f=
unctionfs.h=0A=
index 9f88de9c3d66..cf3f55234a5e 100644=0A=
--- a/include/uapi/linux/usb/functionfs.h=0A=
+++ b/include/uapi/linux/usb/functionfs.h=0A=
@@ -37,6 +37,16 @@ struct usb_endpoint_descriptor_no_audio {=0A=
 	__u8  bInterval;=0A=
 } __attribute__((packed));=0A=
 =0A=
+/* DFU Functional descriptor */=0A=
+struct usb_dfu_functional_descriptor {=0A=
+	__u8  bLength;=0A=
+	__u8  bDescriptorType;=0A=
+	__u8  bmAttributes;=0A=
+	__le16 wDetachTimeOut;=0A=
+	__le16 wTransferSize;=0A=
+	__le16 bcdDFUVersion;=0A=
+} __attribute__ ((packed));=0A=
+=0A=
 struct usb_functionfs_descs_head_v2 {=0A=
 	__le32 magic;=0A=
 	__le32 length;=0A=
-- =0A=
2.34.1=0A=
=0A=

