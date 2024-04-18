Return-Path: <linux-usb+bounces-9469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2178AA3FB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 22:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 623AC1C21254
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 20:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7461181BA1;
	Thu, 18 Apr 2024 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="ON7x8p+b";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="EKzLGT+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF4165FD6
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713471711; cv=fail; b=MmRQ2bmiXwfrDmoq9Sf6o8LV3eHJy3VOsIUgF1ifI85Av6mf1NOnImI98LjKlsnYf7mz2ccTpEIMYltQ11kNtxR4hQDWb6Yvth3OsSGsoNMoHIFibakZDOJkHm/pbrASRmN5sEuXyYu6YB+qc/aPSluUxs2BEyufaE1e1oWr9aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713471711; c=relaxed/simple;
	bh=ortH2VrcaSW4gUoU6aA6ZcSnPsAA1X/c+9UR/aPXwNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VvTSqiRRxU76tZXVKDdZswwEmXjGwvlEW3ECXUKEoQ3/0Bx90SBnAQmvXYXEpPk5p9owZUcZZNjwGh8kfPWn1PvH5SeBPVopCcOSIipe6nrq6st+47J0WZiraVZBxb3n2dMFEpNGle3zRubphVxMtRx8c/zLYBqpBE/hZL2559U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=ON7x8p+b; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=EKzLGT+Z; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43IHrsmH003347;
	Thu, 18 Apr 2024 13:21:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=ortH2VrcaSW4gUoU6aA6ZcSnPsAA1X/c+9UR/aPXwNg=; b=O
	N7x8p+bARIIJMShzsa6W38RRtxIwNbXy1WSRBg5NaNLYftBU3boIAjCTcwJMDu8Y
	jIram42GQmUdDmSLoSsa2KpTUbVQGm83/k8w6Y1zqoTzD4lOREDZO1JGbcmnxu6O
	RsDw6Kt/ABZjlKX3m172aMPLlRMYCs/ptow7u4Nbm4yygmOw39icMGqDQnbfJkNq
	Yx2PAYMXhrJcRG1Wt+bKnIWwBNAwIr/bbe/RlG7Kb30ehhVreawBPUh7P+4r/+tg
	lxjbNVsAK0X6dx+qdNpg9uWwAbZTsaS0EXNVr4uuZXG2HSNWtocZk9kiLgzvfiid
	gYaEyFogw5TrGXCmAOSig==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v3hx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 13:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5Cgz/ygx44fm695est8PTDJNzwlRRGeM6yGMirABgHt7aZCad0xIt9tSEDZVa8qCW5SxOUfWnrGzguvmhjR3njFqNu/nUyaq9HyALbC4ZnLF5dQeqhGcnKAGQKhWyqJ8Hbaq/C1HzBsG9sTGykrwYeGh1Q9cuq5RoM+43S+LD6u4Qm7eliz/RJeAJszOb6Dm8Cwqza5ogm5k50wzCTZqmCO8Arb5aPupYO7JDUTXEmGkcnxli2G86W5LDyc4PFGNhyRsbHTAZja9mS2XWEJDU+jtyM6HTPODf+WAl2sGetbOjgkDu32iddLXzx5llIYQUZUbqpLOJivAUe4jQoxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ortH2VrcaSW4gUoU6aA6ZcSnPsAA1X/c+9UR/aPXwNg=;
 b=N9S0Ghd8kg/87csamTO3xj77C8Se3kDY9xVSKlVZSbS09xzyOWEdctyvYdyrPkqGC3fuWfto0obCi3DFIXp1Lb5yVu5YA2DdmWTu5ETPpBJXpEYa9fR5/BrjL+jy+787yh+JkhsdrnhFOYaNP/Pa+1Vwy1W3mOEfMe01mGDWzndnGNsrdgIQB5bK1bLuyHORMF6beY7Ye8/Ea3v447UkZ6VR+oCM97q+Gr/ecmvIf75OFq024rbr1k2asytcPlqbSAAOcAiDAIdSYsLJ+cv9pg9CeTlHoFDedJ+9cDZHK9jhcuKSGtx6ycWFcvs3idGEmANbYU8jZxkvpCM3q0i2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ortH2VrcaSW4gUoU6aA6ZcSnPsAA1X/c+9UR/aPXwNg=;
 b=EKzLGT+ZSszQzhP31k4/QbQczPg88BYMaZe6/10lWb5gk9JjVZyfBANWEakebN5XLwBmY5AAa/2rF9S7EkWYG3jjXJCUhDVwbbmZM9Y5WC7ZsvXw4SwqyfG4UsJC7Q7sX0ZNCr6smQ96ossJcFGR8up+8QvXVXxqbCPTQZEUWsmdemasCKaU0BTB1rJULdLnp2bp1hOTWenbKRwucs8qG/Npvry4MO0AIcRKnY91idMMpL4mWsZ8vLHL0GpVsva7DbDzmEaIRj1DtE73AxUhOzPwgYxCoaL4oBl2u3GdI6NA8XwIzuJCri8eG+2sscxopwxOqhnfKVQjS4qopa/Mhw==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by DS0PR17MB6175.namprd17.prod.outlook.com (2603:10b6:8:c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.40; Thu, 18 Apr
 2024 20:21:44 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 20:21:44 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Topic: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Index: AQHakDpo6LKkehmJcE+I+KBBFalSurFuHK2AgAAIqgSAAFWxSw==
Date: Thu, 18 Apr 2024 20:21:44 +0000
Message-ID: 
 <CO1PR17MB54194DF99B71D28759E46B98E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
References: 
 <CO1PR17MB5419AC3907C74E28D80C5021E1082@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024041850-atom-spirited-3369@gregkh>
 <CO1PR17MB5419DFDED866D65B3715AC31E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
In-Reply-To: 
 <CO1PR17MB5419DFDED866D65B3715AC31E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|DS0PR17MB6175:EE_
x-ms-office365-filtering-correlation-id: b1a60004-c069-476c-63d1-08dc5fe52a57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DZ306pzhW4i+DxocmhHg1x6RDjisBSEa1eObzU3COAigmGLEtEO7EVjX79wVVm9CSVlLRZI9rPJp+wkrJMGlW0N9L0HEb3rK7FKuPVrzlEJoAkW/UGY2e4EIiGmwnoQWsxUn5+nb7/VX+rAYWvK/kKBBEiZsAuCV+HfATLiY4uru/DAw8fX/iquYAzzlvXYOoAZY3EYjVWD9bRGAWYhhsP76I2VHPMIV24fogE9bxj6Bco1/GUUmB7TIas0p7sACZfuj3qHksdcCsN9Wz4VU8C4GunxYnEWx0wq/9uJhzhJPbW58No2E4CUWp0gDW+FX82QDHNtXtxf+ZEwSoNAbx38S9zia4V74j2pBFYP2jLNUCUwG2n8eH1cxIfvugDeU/6gsXT9aClSpMsZ8kgRS76JKAOdtvvYkPFR+NNkRGmMtmXmZ3D1ha2kaVw5inqonuZXfBPAmwa5YDmTui5VRzMR7d/BvaQ+OB+S8hfwDhfnYd2mMEoroKHcQ6NooNEN9RfCnPIdI9CCn5iTiNwG8NLuYovnDa/KHXGinSDVvseWt/SsBtCCzX1900AV9k0QzNddSYGwV6BiRjMXa3ajAJ6ZeHgFe0oimAkJbQT5RWxxZ3vcXGQOZMXM1XGvLVQys/8pG33Nz3WUmYPtG+qkk0Mv71g54jVqXHkhby89hAYExssB5CX8wODCuEbeNg5LVLRf7dQ6cVbwEWv/Zo/OI92s0YvW8nFXJ5BseEw2YYAk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?seSPSR3rXUu02coNbJV9BFG8lWJYk0eUqdTIU16u4Ugn8jW1ztpa6Xt1xy?=
 =?iso-8859-1?Q?szL/hySbH/QoRXC+bYt9JSIArPqlxakFMxpTAn+aj17hFoWQFrUUsOtL03?=
 =?iso-8859-1?Q?If+rO2onEa4vsdJHFsPLm18pPKz/5LM7Y3u5uSBatTwb3ilbPTRixfQcx7?=
 =?iso-8859-1?Q?QZK5qvos2Bzfdb0hqoghmgPDxwGGKDwO6Zk6MqFUpyy5EwGQQC2MJscwLF?=
 =?iso-8859-1?Q?HigwtOtgmp7DvRH6WowK94QWYv3sqRXA7Mp33jX/5AmR3qxTGj+tx/b57z?=
 =?iso-8859-1?Q?gdfkvS6AOojYZfiFsWEwNZU/AxcSuOMdZTzo4zhJQiBg8fz6V/k9DzGKvZ?=
 =?iso-8859-1?Q?HW7RhGHcF3P/JGfWgRFM9hzAoojspwCIx1pvFRTw8IAkPIA8ormfWrT0/X?=
 =?iso-8859-1?Q?2JyLWaKrQQL40/tyyx3N3n7IqJdV1vgTQB17KK4Uv/qrqGmjbSZP+vfpl8?=
 =?iso-8859-1?Q?OzrOQ3dpV13WhZDzBYkeOhql/qnlDLX9ckXvA2p28aIOCt/42krYpcZSa8?=
 =?iso-8859-1?Q?RV3oUGDlmrzCeioshFB/5KdAPI3D71WBUkBt/wIjor2JpK+GgQY1oXyY9o?=
 =?iso-8859-1?Q?Xulf/l8kno7CF6iLZ+ltwpSQUF48W4pzviIE33KXRSYnGfHPWGVo4fDm1x?=
 =?iso-8859-1?Q?c3weKSTSprN41Y6bQPzNbLk6zPjPLx3uMcOv5hgMImTDv82a26m+0PD2if?=
 =?iso-8859-1?Q?kkHGB9C5mYu6nx4oEXo0QdSBBONwdkeHXT/ktb5YVU7VYbKHg+pQFpLx0R?=
 =?iso-8859-1?Q?vhBjuqzx6rF5MkdLc1HnAlYHcZOIVpmg8nb/v72s7VHLPJ/rwTGiBDTkTk?=
 =?iso-8859-1?Q?qgXQ4sVIgJ1FIphmXkHz/Qgo43GiI1cOeYYG/G5X0nl84QiEjD4rJSpdA5?=
 =?iso-8859-1?Q?EWe9jxPGSw5cGzz4fYiU0g8Ci5lDxcwj4tSOCclcR4ViyXpn9+IwWy4CNt?=
 =?iso-8859-1?Q?vOOPHU6Z5r/tfGIWenAOolWj5+h41G1D2ZWdIuuGMCyT2/a5lWGsztL3Uz?=
 =?iso-8859-1?Q?SAMwgnQuxqfq5+ieJYgU6EzIZpFgTsN4DrSV0lH5IQ4YP2OytgQ6MsdlCn?=
 =?iso-8859-1?Q?+q6MgdxILiCJAo8Dy8QcFNF43tV7Bq+Xoout5dMgx7aC7jNGyce9rvHEAQ?=
 =?iso-8859-1?Q?xLB1rmhCYN9V3FtFFHp8OCmAdpGF61fvKsYPq5U9PfGkTw4ONs89B7GBgS?=
 =?iso-8859-1?Q?CoV+w7+iTSv6d7tZKzRZYFKTCOJbW8i1TnwcPMyOzVXsCFFreVWXbQ6Nbo?=
 =?iso-8859-1?Q?Mr87jcQwraaUhdd61yf/QWM/Fy3UiK2Fb2DdffcQm3rEnW9ba1RJ6VsrTY?=
 =?iso-8859-1?Q?rhLAAhEuXtvhEzhtKQeihopWw1r9QkrbgHDAlHiZtgT2rbQdtHBqTECokp?=
 =?iso-8859-1?Q?50IZlPS8LSZpcIvkrFF+fq9qRdmn4wZwpB+Xd1pzlMMnKyNV8QbdG/B7DX?=
 =?iso-8859-1?Q?UUdxa5nhGiR52BNuWyEXXQM5UFfUfq4f000SAVtPMneukQdw9ESckCKIk+?=
 =?iso-8859-1?Q?qHt90DIYFS9dgTDvP2Lu8m46EEzcHpf/coAUD73VHD17VBHv+cBQ/xvxIY?=
 =?iso-8859-1?Q?7rDNfGnpI9ozPS66g57O9QJ9tVRPdeykTu/ax5gsnwzsSNkyqTjk8I28CW?=
 =?iso-8859-1?Q?SODZ6eTAzpcTbBnodxRnFMAVeCM33zY/2v?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a60004-c069-476c-63d1-08dc5fe52a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 20:21:44.1831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUlqBOshDspXBSPG9BOCUN2Oy85+oR8WVrvhBGQeRQ6oq7y3js7N1DqEJ+fhm6eviWKqvxWd31YiSUXOXmvzzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR17MB6175
X-Proofpoint-GUID: hIwmJ_jF5puwsgyxNkT0gMwgpmqkIwzJ
X-Proofpoint-ORIG-GUID: hIwmJ_jF5puwsgyxNkT0gMwgpmqkIwzJ

> I assume I should remove those old sign-offs as I can attest to the suita=
ble history?=0A=
=0A=
I answered my own question. I missed the section on co-developed in=0A=
https://www.kernel.org/doc/html/latest/process/submitting-patches.html=0A=
=0A=
I will submit a new patch with the attribution corrected.=0A=

