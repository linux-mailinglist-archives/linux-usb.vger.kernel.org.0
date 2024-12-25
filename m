Return-Path: <linux-usb+bounces-18808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A29FC3E4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Dec 2024 08:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC3B8164A10
	for <lists+linux-usb@lfdr.de>; Wed, 25 Dec 2024 07:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A9814831F;
	Wed, 25 Dec 2024 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="E2+BobQn"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2055.outbound.protection.outlook.com [40.107.117.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED285A7B8;
	Wed, 25 Dec 2024 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735110216; cv=fail; b=HennQxKpud+dpJ3LkGjv8xmw1/qBtNlnhaoBB0m+Rrm9pjfoXKdq2PIpz6z4JEuVCWMEoMHjm1uUGEsd2wC4ocZLzQi64jdAtcv3DDcR/bEmEN0qU0Rlj2osa8Xv/kDbB6z5+tt9LsBfnuQAMc/9oKada2NoxAL5hJxgi47NSKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735110216; c=relaxed/simple;
	bh=hMcelrkrzq2BEsjKJ7sT9YUkAifdQjxWsKknVduIDpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iO3YRm3Pfhf3CtaHE6NBHjmEVpFGN6VDVuhpywdmhaFx82ZXBNX3/BcHLPr///tL9nZXE2csUvLjtKcWQKhEk6w2bNZvdTGaXEEu6I3lxOr37axQchqydaBlLokIcey4J3LzwqeeDDDLH353oRSd06t7FxqDG7vbeqS6i543sdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=E2+BobQn; arc=fail smtp.client-ip=40.107.117.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2JaT7zFhxiE3HoaJPAerk3vVIJmskmEbCL0brh5pxLIDfwKHNDVzaHEa/s2fhWVlvxkcxP9OFtdZt0ysn6Zq/p3qMH9XBZNwfAMtQ1JcwE58JDRb/eAMeaUZKgqLN8s0SOR2dfucNb0iHObIcnyqlZPVjTGALgFz50xhy6QAIlyrWaOARL71RFr2SCvofb6DagHYKVnlIHv5wVpTXp/EMwCw1f5NDMR1wzPGSYv3ee68OP7DhtrVRSFzq9iNqQcCD1XFfTkWpwmU0iHpoLI/h4J37UhhdPFAID6e+cFSlnsk/InmSCLbifWH919rSQGVao50AEfAgRvahzTnhNLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMcelrkrzq2BEsjKJ7sT9YUkAifdQjxWsKknVduIDpg=;
 b=xCpkzyDp5ypuXTdURBgIXgodEDXIS+o9egrS9ljoZoVJCsVHDBW2TeGChLT3nEAfeLciugk9LtQ9eg1C7lt33yD+VVyvkDIlGawoblHT9Jbwd7k61BKPxCk7aeBKje9WaKJYQ1msdAfMJtEcv9aZ0s62v6Vgj5lOqjeD6pyQBDkNYXlnH3cCiByHkIA5UlkW0OzEsaaqSuM1l1Mq3dhMROODc4+4Cgif0wTCIvG0N8SHFgcR6iZbyCQln8k4COtcxW5/UKRtbpd7AYzsZim21mxS2MrRDQ5IjNR2e4r6KTB+yXxzMWyjq3kyiHLMsXKejm5JnR7vZAs2KvZ3YEZE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMcelrkrzq2BEsjKJ7sT9YUkAifdQjxWsKknVduIDpg=;
 b=E2+BobQnSldMBHyddrVFJ9Fx5TMD0+DjtZ0FIysO/Jn4rxsfbFKyGjsBWHXJr4tQM3CnChsQ+RxwFAdjj7QYo7zuLpnknF/x8lL1wlutvJZTmV+2j4ogfZmD0X1JaxxpTUFijwcZy2xucqER2jntKadmLwS5OuOd3P1OguUishHLIfeeqOBucP0rRq3/K4YZLezaB4oeenRVT0ECbUDoRFy+/95SLVclyDBQc4Y9M/KfB05jwhsqasCtPO6pG2cXlHOlP/DLwEfSu52zOsBUF7qqjc9CFXUMKJfKHRHuzwfxc/t70XEVE8betHr1NmlcUlfTKxuDq/pj8LuCe3Esew==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR0601MB5773.apcprd06.prod.outlook.com (2603:1096:820:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.13; Wed, 25 Dec
 2024 07:03:23 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%6]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 07:03:22 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Prashanth K <quic_prashk@quicinc.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "mwalle@kernel.org" <mwalle@kernel.org>,
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>, David Brownell
	<dbrownell@users.sourceforge.net>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjNdIHVzYjogZ2FkZ2V0OiB1X3NlcmlhbDogRGlz?=
 =?utf-8?B?YWJsZSBlcCBiZWZvcmUgc2V0dGluZyBwb3J0IHRvIG51bGwgdG8gZml4IHRo?=
 =?utf-8?Q?e_crash_caused_by_port_being_null?=
Thread-Topic: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
Thread-Index: AdtQVu3p636G49OMSa2yDMmE+bdUDgFaMxeAADaXS/A=
Date: Wed, 25 Dec 2024 07:03:22 +0000
Message-ID:
 <TYUPR06MB6217705570D07BCEE6D7F771D20C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <b511a84b-62d9-43cf-9a16-f365832873cb@quicinc.com>
In-Reply-To: <b511a84b-62d9-43cf-9a16-f365832873cb@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR0601MB5773:EE_
x-ms-office365-filtering-correlation-id: 3334792d-2ca1-419b-a8d3-08dd24b23891
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1FRM09WYVo4T0FYa2tyNGlMTWZ2dk5nNW9mQUFKSEVQUVVzMFlEdDltb0dZ?=
 =?utf-8?B?Z0RESkc1UXdwamFsNlEyVEVYYWFnQUlYekVxSlRRWnoweWEwQ1BJVCtVcGVw?=
 =?utf-8?B?dzJHTWdOODBTdnZ3L1kzeFdpTFF4MXRWLzhsNGdDWHBBS3IvWUFrN0t4bDJ1?=
 =?utf-8?B?b0xsczc1b29UUm9tbHE5WngzZ0o1UHFWdjNvb2pFbVY4dU1FK25tNVZqRWtQ?=
 =?utf-8?B?dTlSS08yZEIxOEFvYkV4K3U2VlU1eDdtY0pWN0pNZCtWVGE5T1YweFgxdElK?=
 =?utf-8?B?WEJmWDh4RGx5OE9UVTAvNlIxMWVCYXZEMkR5L2hXQ1Q4VTB5anNQMlUwT1By?=
 =?utf-8?B?YlhMcjRybk14bFRoa3UrRjJ6Y0hvZGFYNjhDd0pTZkdhRFZZbGdvMm5pc0Y5?=
 =?utf-8?B?Y1g3d0Q2Qm9pODlWcm1yRWRiTE5weXB0emc2VFFjYWF1U0RTYk42VDZoTG92?=
 =?utf-8?B?TTVFeGlLQUFXRTc2THExZ1pvYjltSFNVQUY2NUo1MHQvcXZVZnBySnBBYTdH?=
 =?utf-8?B?VFkxTTJrMkQ1cXRtc0NiOUhESTRHTHo1bTBmcmtzWHkrd29tdlNSYkFYdGZH?=
 =?utf-8?B?SFFFOG5uaENWTDhDaVZncGN4cENWNVBra0lOZHI2K3JPNW00bW5qN2RlSzY4?=
 =?utf-8?B?a0wweW91clBFbHAwbkcvYXdoQmFYZGI5bnVBWnhBTzJIdElnNUdJUHpDUS9u?=
 =?utf-8?B?c3UzZjN1bkJyNVBhVThnV0dVZG5pWXpYMGJ2ZmUrMDh5Y0ttMHhDOHYvZ3FF?=
 =?utf-8?B?bSsxM2wzQmFJY0NMbTRnUHk5SlhkWmtLUFFDUkZld0VzZEZtQjJIY1lXZkQx?=
 =?utf-8?B?bGZZbHRsRTJYejVVWW9ORk1kaXE3eHprQlg1UU1UZ1pZMUx0SGdhTEQ4VGk3?=
 =?utf-8?B?cnhhL3VOZVA3Zytudmg4ZU9Jb0pMSXlobisyakIzb1R2VjhzT0hmaUpZUmtS?=
 =?utf-8?B?amh6c3RlblhMc1BCM2E5ZWZ3cUY2Q3psMVBueFdXTE5BN0MzMC9LOFBGekR6?=
 =?utf-8?B?ajE1aW1jZDhJTU9aN2VLRmtpTEJ0K1RtcXIrQ1NmSFZ5MVhFZjlkZEdWQi9B?=
 =?utf-8?B?U0xIMG8xTXVEWkM3NVFYQVJyOVhjcnhqd0xTMVczQnp2WnQxb2s0eUlod3NJ?=
 =?utf-8?B?dEtYejBzZHlhR1ZtSVFRNVB3andSMCtibk1FNEV0d3VDQmZhelllei9tZVoz?=
 =?utf-8?B?Q0xNcUp2RXpiSWxQR2ZXUnFvVU5jQkM0T0UxaCtUeTRnYzhrbmg5MkRtQkNB?=
 =?utf-8?B?YWo2OXhaako2WnJ5bU5meW5kemdGSnpyWERrMUpqdGVaVmdhRjNxSlNKNkhq?=
 =?utf-8?B?RFp4czUyczN3UTdnVUhLOE03TDZkR2pxRzcvdzg0R3lXTEFSZ2ZCVUk1L1M4?=
 =?utf-8?B?cllpcyt3dXZubU1XeE12NzJNWUw3THJrTXdqalluRjlTcTgyUWJmcVJIMklo?=
 =?utf-8?B?RVpnbXFPQUdQQngwVjdkcWFRSkkwUzN5U0gvNGxnc2ErWUZzNmR4TjlldU9L?=
 =?utf-8?B?NEgzVHZNVXh2a1ZlekVrVnJTMWlxTVIxbzBDcHVxbGlJU0tBNlpibUJ1eTlE?=
 =?utf-8?B?NnYvL3llUDh0Z2xHaGQ3bmRqM3RiMERKQWljeTNSMFh2dHIrWGpsb2pFcEc2?=
 =?utf-8?B?NnE0bW10Q2pUck9NWWRSSUw2VUN5dGlQSVJCbkNHeHRxZlBKRkhSbTdqT2hQ?=
 =?utf-8?B?MXR4TFRUQzA1ME1vRFJzSE5JZ0hYRXRQWk1OWjQxcUx5cVpJSU5jRHBNMHZz?=
 =?utf-8?B?Sk9NRDdoT2s1eDhVUlNsUE1ubjJ4dkxIZHlHNGhTUkwrckYyL0dnRk9VUEFQ?=
 =?utf-8?B?cnZtLytwTVN5cEUrNjZ0YUxwd0hKVWZQYmtjZi9rMU90OTUvbnBjZWdObzFu?=
 =?utf-8?B?MXI4b2pzdVBwcmRWa0VvNnhuekVqeVNCYmlHTVlSQWZQbXdFUFQ3SGYzblV2?=
 =?utf-8?Q?Jc35pRGdUn2UuFQObaFhaAuCKNkM7OyG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDlMakgzQWRNcmNyWmJQZXVRYnRTcmROOXJLT2JvTk5VQ0tzeG5rdHoxN3BB?=
 =?utf-8?B?bnVrMU5oSVB5a3RBL0puOHZCSk9LWUl3STkzbWtmR2xSbjJ1ZitsRUZ6MUZ5?=
 =?utf-8?B?cHk3TlhlVVJwQk8vOVhEdExBWDFQNHlHb256MHZ3Y0JBNWtEb01wUVp1QVhK?=
 =?utf-8?B?QUwwcklCQUlKc3hQS3NBZmVTSEFpcUNuR1R1S0tROHp3OHFYVEtqbENic0lz?=
 =?utf-8?B?bVMxcDVDbjZwN2hKdUswbUlyeExYTGVJazJDWVBsUldpU1B4OWtKaW9Kd1Vw?=
 =?utf-8?B?U3hETGhvZHdlU3MvY3h6NmF0TFNOK0lGZERNaGNpOTBBM2JsNWxNZnZYVnV5?=
 =?utf-8?B?TEJFYTdsUXdtMTMzcUdjOXFybTlpTFRqNVRSL2d5OGt2S0RQS2pQYjAvL1ZV?=
 =?utf-8?B?TTcyNHdBcUJlVlBIb3JjQm5SUDZTVi9CZFpCQlpob1FNaXZkclFLeVBPWUVZ?=
 =?utf-8?B?QnpyOTllZm5ZYUJvT3FNVXRoallaV3UwZVhiYm5RS0U3RFNwZHZGMURKUDJp?=
 =?utf-8?B?akFaK1ljU1B4Nmh2SDRZR04xMWJLVVh6Q1V4YUdCblNteUZTZW90TWxrUEo5?=
 =?utf-8?B?N1MrWHVzZFZ6QTUvdVIyclBFdHFhMFJlakdIMFRzYjhlY0JPRVpoOWQydThs?=
 =?utf-8?B?R29MYkdscjh1d05GQ0pNMVZ3N2tUcEEwVTk2K1FsenJITmNBb2F2UFJTOW83?=
 =?utf-8?B?M3dWcmlSa3JJNlViOFZMb3V5bENvYXVjZUtGYXVrbitJNldycWl1Vks1Wk9t?=
 =?utf-8?B?YXVGbEh6Z1JjbFBFNGgxQWJxUzlIR0FvaGE4UW5wbmlTc1htaXF2M08xZXRk?=
 =?utf-8?B?WUxSRVhtd0Uyc2VRUGU1TWxnNU9PNFNBU2JqUFl4L2YzVzlhTjhvRlRSNGpn?=
 =?utf-8?B?ZVdMWDZwc0h1bEc5MjJGNGh1WDlVUVZtcWp0aEliT1BmSUZibjVYNHdBWWY5?=
 =?utf-8?B?OENSKzc4VFl4QjVTQ0h4YzlhNEU1cHBPajZ5OUJkNEVhY2NjRzlYc01XbVdR?=
 =?utf-8?B?b2tGdzZIcXFLVHlXMVF0a3hCb2hjNUFNQTRIYnFwalBRZXA5S3g2V2VncFJO?=
 =?utf-8?B?RXFLRHU0Z0dUVnpSeExZbDI1VEtSb2FxbmhETk9LbHJ0bWRxWXBjL1ZGeGVE?=
 =?utf-8?B?dVdpaVBKWGlBTmRBZ3lFRVBIRE4reThaTTl2OEd1Nmx5SjZIdDlVT2ZzQnZl?=
 =?utf-8?B?dllPYmd1c3ZEM1VvaXlFdHNReERVSE9ma1pRREQrMGRTbVhzaUFOaDN2M1hv?=
 =?utf-8?B?NklwQTBKVENOdFg2UStQZmdmMkZPN3pTSngvcXpOZ0Q4Y3lzTGx0MGtGcWY3?=
 =?utf-8?B?OFYyYUhkZnVGelJseEZjdDQxKzdCLzhqNDFSL21IckQ4YXVGOGJneHpjeFE4?=
 =?utf-8?B?d0lkcHR1YjM1U21zUm1rZXVMQm5PSG1oTWh1aUNzTHhVMzAxOHZmODRGMUpY?=
 =?utf-8?B?TTFlQ05ZZTZjR3ZEZ3RlR0NWR1ZXejBCbCtKMnBBT1RNTU1pNXNyMG0vdmVV?=
 =?utf-8?B?SnJQZnR4RExtNWtmWTQ3MVoyZGxwL0tDcXpUTmV6YnRHZFBnYUZXVStEVGVY?=
 =?utf-8?B?SW5HQVhoT0t2NXVjOHdwRmRuNE1QN3pWRkNSTGZWOHN6djlLalFzNXlwc0x6?=
 =?utf-8?B?VmZIOVZDckk1MWdURVZqbzZSL1FoaS82UVpHWm8yVk9pWVh3TWs1UFdpV0F1?=
 =?utf-8?B?UzJsb08xemowSllwaVhaNTFIZFA2aldpVGFaalRLRFdoemhaQldRT3RjanVN?=
 =?utf-8?B?L2dHUFhjMDdRdStEcGJqWWg2MkR0SGUvWVFzNkFHbnVpSU1mN09Vcm5LUnZy?=
 =?utf-8?B?UFVYUm50V05oVmJWUHp1N2V4bzhSRFBxUEsvQm52d0UzaWowN3VRUVFKV2Nu?=
 =?utf-8?B?Sjd1eVdBRmZ4NUZ2Z3pPZjJrU2w0QTJjcm45cEh1cVNTQk12M1hjZEppNlNM?=
 =?utf-8?B?bXQzOVJUWjA4Qk1uVWpPVS83a3Q4UloxQ08vM1JScGhqZTVJN09zaE1UNU1j?=
 =?utf-8?B?NnlBQVN2M1NMdXF1WVFGQitBUXJGVFByam9QQnJjdDlGVEREMEVoL21zQXlT?=
 =?utf-8?B?dXo0eVhDaWc1VEsrWDVseHRlZlBsVlAvQXppM2Q1V2huMTRydCtyNVN6Q1M2?=
 =?utf-8?Q?FPSk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3334792d-2ca1-419b-a8d3-08dd24b23891
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 07:03:22.8274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6YCqg4lvL6j6kRiWqdT81C2qavUdmEkYlNg/8DbHktbnDHdVD7ZX6xNRMb+IQAsR1hClZqwxlf3O0P/WCU20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5773

SGVsbG8gIFByYXNoYW50aCBLOg0KDQo+ID4gQ29uc2lkZXJpbmcgdGhhdCBpbiBzb21lIGV4dHJl
bWUgY2FzZXMsIHdoZW4gcGVyZm9ybWluZyB0aGUgdW5iaW5kaW5nDQo+ID4gb3BlcmF0aW9uLCBn
c2VyaWFsX2Rpc2Nvbm5lY3QgaGFzIGNsZWFyZWQgZ3Nlci0+aW9wb3J0LCB3aGljaCB0cmlnZ2Vy
cw0KPiA+IGdhZGdldCByZWNvbmZpZ3VyYXRpb24sIGFuZCB0aGVuIGNhbGxzIGdzX3JlYWRfY29t
cGxldGUsIHJlc3VsdGluZyBpbg0KPiA+IGFjY2VzcyB0byBhIG51bGwgcG9pbnRlci4gVGhlcmVm
b3JlLCBlcCBpcyBkaXNhYmxlZCBiZWZvcmUNCj4gPiBnc2VyaWFsX2Rpc2Nvbm5lY3Qgc2V0cyBw
b3J0IHRvIG51bGwgdG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVuaW5nLg0KPiANCj4gZ3NfcmVh
ZF9jb21wbGV0ZSgpIGdldHMgcG9ydCBmcm9tIGVwLT5kcml2ZXJfZGF0YSwgYW5kIGl0IHNob3Vs
ZG4ndCBnZXQNCj4gYWZmZWN0ZWQgaWYgZ3Nlci0+aW9wb3J0IGlzIG51bGwgYXMgbG9uZyBhcyBw
b3J0W3BvcnRfbnVtXS5wb3J0IGlzIHZhbGlkLiBBbSBJDQo+IG1pc3Npbmcgc29tZXRoaW5nIGhl
cmU/DQoNClRoaXMgZGVzY3JpcHRpb24gaXMgbm90IHZlcnkgYXBwcm9wcmlhdGUsIHRoYW5rIHlv
dSB2ZXJ5IG11Y2ggZm9yIHlvdXIgc3VnZ2VzdGlvbiwgSSB3aWxsIG1vZGlmeSBpdC4NCg0KPiA+
DQo+ID4gQ2FsbCB0cmFjZToNCj4gPiAgZ3NfcmVhZF9jb21wbGV0ZSsweDU4LzB4MjQwDQo+ID4g
IHVzYl9nYWRnZXRfZ2l2ZWJhY2tfcmVxdWVzdCsweDQwLzB4MTYwDQo+ID4gIGR3YzNfcmVtb3Zl
X3JlcXVlc3RzKzB4MTcwLzB4NDg0DQo+ID4gIGR3YzNfZXAwX291dF9zdGFydCsweGIwLzB4MWQ0
DQo+ID4gIF9fZHdjM19nYWRnZXRfc3RhcnQrMHgyNWMvMHg3MjANCj4gPiAga3JldHByb2JlX3Ry
YW1wb2xpbmUuY2ZpX2p0KzB4MC8weDgNCj4gPiAga3JldHByb2JlX3RyYW1wb2xpbmUuY2ZpX2p0
KzB4MC8weDgNCj4gPiAgdWRjX2JpbmRfdG9fZHJpdmVyKzB4MWQ4LzB4MzAwDQo+ID4gIHVzYl9n
YWRnZXRfcHJvYmVfZHJpdmVyKzB4YTgvMHgxZGMNCj4gPiAgZ2FkZ2V0X2Rldl9kZXNjX1VEQ19z
dG9yZSsweDEzYy8weDE4OA0KPiA+ICBjb25maWdmc193cml0ZV9pdGVyKzB4MTYwLzB4MWY0DQo+
ID4gIHZmc193cml0ZSsweDJkMC8weDQwYw0KPiA+ICBrc3lzX3dyaXRlKzB4N2MvMHhmMA0KPiA+
ICBfX2FybTY0X3N5c193cml0ZSsweDIwLzB4MzANCj4gPiAgaW52b2tlX3N5c2NhbGwrMHg2MC8w
eDE1MA0KPiA+ICBlbDBfc3ZjX2NvbW1vbisweDhjLzB4ZjgNCj4gPiAgZG9fZWwwX3N2YysweDI4
LzB4YTANCj4gPiAgZWwwX3N2YysweDI0LzB4ODQNCj4gPg0KDQpUaGFua3MNCg==

