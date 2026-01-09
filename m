Return-Path: <linux-usb+bounces-32110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F3D092E1
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 13:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5E6307CEFF
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 11:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A92233C53C;
	Fri,  9 Jan 2026 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="M8xbt1vp"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF14335561
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767959843; cv=fail; b=dMpFCEh2nEWJLSCRqhlG5IxjzG5gymjCMqgTB2gTriXSv8f8dK8nQHIJnwSXapfORqxd6OSNC3exRUaDxaIBkOlJJX2z/FgbZaEmNmGrSyylI6Rd3W9Xr0wBpy2N/QnaDew93GzFDqzK87DxH9DOmwr3CEfihXCZ0MfaRWKiUYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767959843; c=relaxed/simple;
	bh=rzpZXZR2TEzdNdpmd/kgyzuTXYwkBqLtjtEo8wRSpEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M6FDdHdJk6nhT2F+/+kzSXhapmz5FxtFG9s92xpbKhihNd6poc1WJ+UhonZZNN7bp6Vb1yN9Kd4aiheIY0cBxGdOXuWmkLrObNwSYw7EkIzsWNSGeo8lo1OE7hRCBya/zpi4iBbWiwxPM5s0mSaPtjQQPffck113Amk4eIcnCwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=M8xbt1vp; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQX+eFQkS0DzrLZ+e73EsIHlBJXnD6wp+nMzz+ynxozgN+9FVtyCQZz7O7OX605rw3jsRm9PIUwTMgNfalNzBsfVCQ2oxTz//TqwMQtcKx5H2q9A75p9q3VGE7JZ15N9UtQA5JquMMLTh2rqgUw/ya3D7vh+fNkHFt5d1Bs2bNu/I3avqeLiSpcDcu0eS/qHqut8fqdfN4cy7QDzdrUnMlei5J7vlUeXdlwQPn7nNT2WASEgBK7ToXayI/6I8JnDeccFRdnfhZ+WSFLUzGOcqLc3m3C4ouOPczqTo/6b0T03PxJJIPWPv1mCLkNQW8RvSvVcYjYl3p0Zg+ERuz6F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzpZXZR2TEzdNdpmd/kgyzuTXYwkBqLtjtEo8wRSpEs=;
 b=PUD9jmDiExvPk2YJjNRFoqgzICezeEy2vPIySO89j+OFTE6JYmU2EvPma9ioFK1Op8+VdeXRd9bSnqpRUl8pPeJleeCd19gxW3Tn7Qr4EdFoYIVdVgtd/1ifmgKfRbnWcwKtItwWzWVjtQmEaphBqa04sy/zzudkhTwicUPBXmxAaFKgqaueeVjJ39cHKDcEOKow1PVFOExvH7L8wUDDNavAcknXYz1fcEURoesQTQJ6scUs6OXgzFqsyytc4eikkF+H+uFdoduyVlKm55z+KB4+AJbOje3hA+uoPpzvF2LVO4y36LqqqqVZZOGZIgniPA+x+3ouT8F8yUmfp02LTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzpZXZR2TEzdNdpmd/kgyzuTXYwkBqLtjtEo8wRSpEs=;
 b=M8xbt1vpwzqbjbeT35m2N2QMTnOHLlYS5cAjCASz8Of0K2eBLEppo8EwOnBETwJEH1x7V6fofFxlsyyAa/y0O26IhqNySsRW7CRtkOK9w1LZdDDlOiaMisN/lyfsl6aL2zzfHU2sMH+ghOTeV2kA+4LpG8Qrr/hyCGs7e2oiU6U=
Received: from GV4PR06MB10308.eurprd06.prod.outlook.com
 (2603:10a6:150:2dc::14) by VE1PR06MB7023.eurprd06.prod.outlook.com
 (2603:10a6:800:1ac::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 11:57:18 +0000
Received: from GV4PR06MB10308.eurprd06.prod.outlook.com
 ([fe80::930b:b831:99ee:f1e]) by GV4PR06MB10308.eurprd06.prod.outlook.com
 ([fe80::930b:b831:99ee:f1e%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:57:17 +0000
From: PETER Mario <mario.peter@leica-geosystems.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "peter.chen@kernel.org" <peter.chen@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Thread-Topic: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Thread-Index: AQHcgLRaV9i/bFlrrE2rqWd5DVIPjbVIcdAAgAFK+4A=
Date: Fri, 9 Jan 2026 11:57:17 +0000
Message-ID: <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>
References: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
 <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
In-Reply-To: <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV4PR06MB10308:EE_|VE1PR06MB7023:EE_
x-ms-office365-filtering-correlation-id: 7d548f34-d4dc-4683-b10a-08de4f763c9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnBBOEYrWG1WVDFRN0RtOHFoZ2RxVmYxS1JsWWtNaDVJb0pET3EvVENhSnpz?=
 =?utf-8?B?SjJ3NGZXY0FkTjZDMXdkWVVrU2QxelFRVDIyVTBPcDUxTVpRL2FFU01Nb015?=
 =?utf-8?B?THByMHNiOUVET214MkJZL1Zmd1JqVkVuMjZmRFRMRk4xN1dqdE1aU0hMWWt3?=
 =?utf-8?B?c1dxWXpmWHdJYmx3VTZoNC95NG9way9neU1jZ3o0ai9IbFkyelZoRVNnT24v?=
 =?utf-8?B?RW5xS2Vnems1eFNHajk0OHEvTkh0Ym43STE4bEcrZVN3dXprb2ltQmRjUE53?=
 =?utf-8?B?aGczMlY4aGJGa0puT2lROTdSTGtaMjgreExGTUZGNzVCOGVPd2lTNFVRWEQ5?=
 =?utf-8?B?WVFqWk5WdEpZcU9STStjUWl5aWpicGpVOE5pTHE4UURkWXROdFdOcmZlcjRS?=
 =?utf-8?B?YWxpY05jQjlGUkJKeTk4YlY4azk0SERUSEZLQmxyMnJMNXNCV1NUOEw0UDJY?=
 =?utf-8?B?T210RE1uZ1ltYTFwenFwMXdMYlF2UGs4WlU4cFVuTWNLSUF4aDA5OWk4YzNY?=
 =?utf-8?B?Qkt0UXMwOGZXWFdsMHNDN2Vsb1krbGI5T2tRWjExQVhyOVJtYlNjdTNNeU9o?=
 =?utf-8?B?dlBqbjZLRUZuYUJpZ3ozN0RJU3lCYnpVajE2dXFZb2YwVHVobHZ5ZEVOSUpU?=
 =?utf-8?B?N1V6TUtZV29lWGJnYmhXL2k2K3VROStVVzFYSE9kd0NRZThCRVBLKzl1SXQ3?=
 =?utf-8?B?N2dYV0E3MGJnT3MrakVESEJxcWJzTTdlZFJjRTdUYUxEVEgySDg2ek5oMlNv?=
 =?utf-8?B?SXRqdGJudTNwT3hSTmRhbTVvRjFWU00wc2E0NXNGTGlIQ0NmVnRhbFNTZkth?=
 =?utf-8?B?RzAveXlnLyt5ck02a2xMZlVxVms5RC9DWnZKcnZHaG9nSmxzYWQ5RHprT3Zr?=
 =?utf-8?B?OUpRYjdjcVNSOUgvVFNtRWFUTlYzKzAycE5qdFM1WGsvU1FSc1NUcWY4Wld3?=
 =?utf-8?B?Y3lycTljZ2FoOXMvMy9kcmZhOFFjeEQ4ZThrY2g0WlN6QnFuWGk2c1hCRG9C?=
 =?utf-8?B?RDJ4SXFkMjdMZy85QVhxZ0NCSVVqT3RCSzhCTXdsZWtFRit5dWFQRC9uZ0Ry?=
 =?utf-8?B?RTErYjlFOS92VTFtVU5VK0l4dWJQMFZoL2lLekE3ZXUyTjM4aXUzL2REL0RL?=
 =?utf-8?B?d3g5TmM4MmhWNXJ0N09naFgzSGJVZEp4UzNqaGMwaTByUVhDaG9LUzdGVnpm?=
 =?utf-8?B?R09DU01sUGJWUVVsSmFLa1MvVlNSTEw5M2VERzFRZDNYQUNuMWpWc3F0eERV?=
 =?utf-8?B?VEFxNEVNY0JrMVNhWWw4RmR4bE5lMGZkbkZ3YzFVcW9FVUt2Vi9TUFlSZUpx?=
 =?utf-8?B?bFE3ZFU2RHhTaDBpaVB0N0dhQzM0RUU1OXJzWmxWRHppRnhWYkNNaXF1WnVw?=
 =?utf-8?B?ei9aak9CbUFaNzlUWDZwMm9LOENidjVUaGR3b0RWWkNNMHd1Z1A0MkVHaHR1?=
 =?utf-8?B?WEhWN3Uzcm81V0Yxb0ZZV045Z1IwUmQ3RnNqNXJCOXgwRy9MZFZydng2UGFo?=
 =?utf-8?B?MXhlS2MwRkliVGd5cjd1R3AvUEtlRTRQUEZoRmtFTzBIMkFoeW9WeFZBR2dE?=
 =?utf-8?B?YzRTMEFmNVFqZ2xBVXgwVFFuSHdmcjVXTDZUUkNWRGFyeUxldXg1cG9HdzlI?=
 =?utf-8?B?YnI4WkJFRXd6ZmE4ZU5xUmFZU0lqS0pCTFZuUFhXYkRiVElmcEFXVnp1dGU4?=
 =?utf-8?B?dWNkdmYxOGl6ZEVHVW8zSjJEVDNoVG8raStESEdTajRrdlA3ZDFqR3ZnZVBw?=
 =?utf-8?B?QmRSWGhLTTUzM0tGRTV3S0s3TVJnSEFOS0wxcnZOeVVBT0orWHpBWEFFOHpS?=
 =?utf-8?B?U0NWMDlpZ0l6RG9tSUdTSjQyczE2NCt2Y1Joay93WEJRRUpRYkEreGVzelh5?=
 =?utf-8?B?Z3p3OWtXdDE0cUx4Zkx0aEJJellYN3Y5dnN5T0dYWTQvTTNVUGdMTjlVR0VO?=
 =?utf-8?B?dG9aSSthZlNSTVNYVzZEdUFNUEtTWHFGSlA5U0xHUFBjN0g0RUhYc2lLQzFP?=
 =?utf-8?B?QUhkL3g4ak90S3Y5MXp3aWcyR0dHdXJlTk5hWUhVT1dZVHVvRXRDNUdaV3Vh?=
 =?utf-8?Q?YiTaiH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR06MB10308.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW5ZSlJRY2xmVjBEMlpvbjR3YVRKS2o4aWF2ckFnOWd5L1VYbnNVcFVMUEZu?=
 =?utf-8?B?NS8veFZnSGk0TStUN0FjNE04Z0Z5TWNFWWRxditOZ2xoU0ZmWDZ6UGFoT204?=
 =?utf-8?B?dVNIL1Z3cXQ0bGJiajUxaUtmVEo5NDNPbUxsYXlCSkROR2lLMjl4dkZhRTZE?=
 =?utf-8?B?cWd2TzZNMDArcHlLR3F1TmJoeEZRSEMwaS9FRWNJNGRQbTZ5TVBTQWlWZ0hw?=
 =?utf-8?B?a01WaVh1QW9rWDB5ekFoSi9Zejgvb0VQL1lTa2RCYnBFem42MjY2WXRKTUJy?=
 =?utf-8?B?dGlEMmgzdXVhakhjL2o3YlVSMWFmNUM1VzkvRWd5NTdieUQ0ZlJGeWVmcGlC?=
 =?utf-8?B?SGgrdGFQVDVFWG9JSjVxQm1oQWRONHAzZ3Z0WVZiaHNOTDBxVnNacXZDSFVS?=
 =?utf-8?B?MUN5emk4MFVveFJDdVlsZE9JSU9mWTlBSzJLaFh4a0YveTA1Ui8xU3FpcnFl?=
 =?utf-8?B?RkhkZmVtRlBQN3MwbVZpUkh5L3dkV1ZVeEFQNHpHOEF2ME1YWnkxTWFPOHM5?=
 =?utf-8?B?cE5seUkvRjllUlpWY1R4am9IcEo0UmlmeEVGZTRwYzlhektxVzVjYk81N1Iv?=
 =?utf-8?B?dDlVcEZwamlaSUJFblNiMHp3K2swWEozYnFrTFJzMXJjakxnYkNCWjI2a01B?=
 =?utf-8?B?NGZaU3lXdDA5VGpMMlBkMlRmR010RlZqWXIranhucHdqZ1pNb3BOSDdEREdt?=
 =?utf-8?B?VEt2Qm9HNXBqVGZIcVN6MWZIeUJnVFZ5NlZiV3FGSXBHNzNSMHpjNkpzTU1q?=
 =?utf-8?B?MW9TUHF6OGQwaGkzbnhVYmZkallpSWVRUDZDbVNZL0FHV21ncWI4Q1dCalo4?=
 =?utf-8?B?Rzg0cEpuODE4RjdvdHJ1YXJvby9WcG0veXIza1JPS0s4c1ZyS09QOHo1STdU?=
 =?utf-8?B?bmgvVFBsTGZzbEZFZDROaHdUTXJxSW5sN2ZGWVZ0UjVsYmphMS9wbTJXdWlw?=
 =?utf-8?B?WXBEYlZuRTZOT3MzKy9TSDZMSjZwcXRzcytlNnFnWXJ3K1hrcitFaEFJZThW?=
 =?utf-8?B?S1RySU8rR2szR2NDRWNZa1dRVlQ5SE9yeU1mNmFQZEhWUGIwSklEbzF1RlNK?=
 =?utf-8?B?R0dDOEF5ZnVtQXFNcW15TldxQjRtWGJONzRqUFNGOHBYYWVkdWRQeHU4WGFu?=
 =?utf-8?B?WWh5MnlLeXMxZkJzcmkrVDNWeWErUi9WV3BDa0tjMEVQbDlXVmd0RjRMWjV0?=
 =?utf-8?B?dU04YXg5RUhPQy9WUFhhcGRNNGJZZ2pxWlBKQkgzVWVFQUErcFB3VEp4K0Fz?=
 =?utf-8?B?TWR3ZnVEZ1BlS3YwTjBtTVNESEZQVkJLREVXSzV2RTQ2MkhONER0RkhyMU02?=
 =?utf-8?B?RWdqNjl2cm9YRnFQbUN4NkRZdG1FbFdveFJWODFRTmRoQXpac1ZETWYxeHBl?=
 =?utf-8?B?SFY3R2g1UisxYlBqMWs0K1N0UEFEZ0JCYW5KdVZZSXMwOS9jY3pWY2hHeHRI?=
 =?utf-8?B?ZVBSQXRiRTVUVlYvdVMwYTNndFVzVURtL1ZUeDhTazRNWHQwYllLZm1JU0xm?=
 =?utf-8?B?YUF4MFNmRmRybThnMHBha1hxazVPWjRCb2p4T0lJYUlMTGYyZTVqcVBVUzhi?=
 =?utf-8?B?TTlNRk1zTnlRYmY2U0x2eXZiV0NWT1YvOTVVekl2NmZBNjhUcnlzT3FxU3JF?=
 =?utf-8?B?WnZyUWhmKzBpQjVOV29NcXFjZS9JZFhpYmM4cDl0bzJaK2o4QjVKNkNtQ1V0?=
 =?utf-8?B?eEVjVlZERHBjaDE5YStMN3JKaTBoTU9oNW1XK0hnOXBrbnBXL2hHWFFXL01y?=
 =?utf-8?B?OEs1cHdleDB5dDNoSUVwdjJtb2lLaCtGNjZ4WWZ5SG5aa0gvRW1LQWlhRGFP?=
 =?utf-8?B?U0FudmY4T1pnZE9IVHhSamFDVWc1ZWxISTRvOHdlOWsxVlMvVTNZaDc5RUxY?=
 =?utf-8?B?Z1l4NXlvdTBCY3dkMW9qNFVmM2VxcXk2Wlk3dGd4V3o4UENPYXZXemxLODlC?=
 =?utf-8?B?emZETERWN2ZmRVVGQ0lGeHFMWlpISks0ZlJvWjZpR2RoSUZabENGVGQrMmdr?=
 =?utf-8?B?K1N5Q3crMXBCZFRWTWZNNlI4UEpLQkpSYmRmdXFGMDU0MjVJTUY5S05xUXJh?=
 =?utf-8?B?dEttREJvSXNUV1pnSno5c1ZBWDZ5Z2hHSzFKN09sOElSVm1vWG1yOHQrUTZ3?=
 =?utf-8?B?Nzh4S2VXV0J2VGFsSmdyd3hrTEQ2bkl6Uys5dUdvbEZEQUZGR2RvN3UrV3Ji?=
 =?utf-8?B?VGNBTllkNEFyL0J4U003elNacHNTMEpzN3lSSGVyWkRTZXpnd0tHYzdxNWZ6?=
 =?utf-8?B?VFpKbnJlRFF3N1BTMFg3VzdXSUo0MU04S1MwWFB2VWxxRjlPakU0L2FkMTFD?=
 =?utf-8?B?NUpLMWh3VmhpRGVTN2ZEVi9WT3FKSUdBQk93OWNCMy9zZlNsZUVZdmlMMFRV?=
 =?utf-8?Q?p17RDpQxCdtRirjtuRkXp7LawRnLPy6lgNKrhQSLtFy34?=
x-ms-exchange-antispam-messagedata-1: Oc8Ia6Agqm3byfjG+E/yETRI67LHJMukuSg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6381A4E95A6FD147A997D980B8DFB459@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV4PR06MB10308.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d548f34-d4dc-4683-b10a-08de4f763c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 11:57:17.4425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YWY9DM3pdtGAF52t0plrUl/EvQ/k0SF4+jXCN7yb9TvJnzlo0XB1gnH+VXjm/G2ZaWevFsVWP7tOwJ5nTeAbCZvhOV0TwH/K5rTLu/zw9jHBWyVrvvwTalBzMrssY+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7023

T24gMS84LzI2IDE3OjEyLCBBbGFuIFN0ZXJuIHdyb3RlOg0KDQo+IE9uIFRodSwgSmFuIDA4LCAy
MDI2IGF0IDAzOjM0OjU4UE0gKzAwMDAsIE1hcmlvIFBldGVyIHdyb3RlOg0KPj4gU3dpdGNoIHRv
IGF1dG9zdXNwZW5kIG1lY2hhbmlzbSBpbiBjaV9vdGdfd29yaygpIHRvIHByZXZlbnQgcmFjZQ0K
Pj4gY29uZGl0aW9ucyBkdXJpbmcgcmFwaWQgZGV2aWNlIHBsdWcvdW5wbHVnIGN5Y2xlcy4NCj4+
DQo+PiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiB1c2VzIHBtX3J1bnRpbWVfcHV0X3N5bmMo
KSB3aGljaCB0cmlnZ2Vycw0KPj4gaW1tZWRpYXRlIHJ1bnRpbWUgc3VzcGVuZC4gVGhpcyBjcmVh
dGVzIGEgcmFjZSBjb25kaXRpb24gd2hlbiBhIFVTQg0KPj4gZGV2aWNlIGlzIHVucGx1Z2dlZCBh
bmQgcXVpY2tseSByZXBsdWdnZWQuIFRoZSBjb250cm9sbGVyIG1heSBzdXNwZW5kDQo+PiBiZWZv
cmUgdGhlIG5ldyBkZXZpY2UgZGV0ZWN0aW9uIGNvbXBsZXRlcywgY2F1c2luZyBkZXRlY3Rpb24g
dG8gZmFpbC4NCj4gWW91IHNob3VsZCBiZSBhd2FyZSB0aGF0IHRoaXMgY2hhbmdlIGFsb25lIHdv
bid0IHByZXZlbnQgcmFjZQ0KPiBjb25kaXRpb25zLiAgVGhleSBtaWdodCBub3Qgb2NjdXIgZHVy
aW5nIHJhcGlkIHBsdWcvdW5wbHVnIGN5Y2xlcywgYnV0DQo+IHRoZXkgY2FuIHN0aWxsIG9jY3Vy
Lg0KPg0KPiBDb25zaWRlciB3aGF0IHdvdWxkIGhhcHBlbiBpZiB0aGUgZGV2aWNlIGlzIHVucGx1
Z2dlZCBhbmQgdGhlbiBwbHVnZ2VkDQo+IGJhY2sgaW4gYSBmZXcgc2Vjb25kcyBsYXRlciwgZXhh
Y3RseSB3aGVuIHRoZSBhdXRvc3VzcGVuZCBtZWNoYW5pc20NCj4ga2lja3MgaW4gYW5kIHN0YXJ0
cyBzdXNwZW5kaW5nIHRoZSBjb250cm9sbGVyLg0KDQpJIHRlc3RlZCB0aGlzIHNjZW5hcmlvIHNw
ZWNpZmljYWxseSB3aXRoIG15IGF1dG9tYXRlZCB0ZXN0IHNldHVwLA0KaW5jbHVkaW5nIHBsdWcv
dW5wbHVnIGN5Y2xlcyB0aW1lZCBhcm91bmQgdGhlIGF1dG9zdXNwZW5kIGRlbGF5IG9mIDINCnNl
Y29uZHMgdG8gcHJvdm9rZSBleGFjdGx5IHRoZSBpc3N1ZSB5b3UgZGVzY3JpYmUuIEkgd2FzIG5v
dCBhYmxlIHRvDQpyZXByb2R1Y2UgdGhlIGRldGVjdGlvbiBmYWlsdXJlLCB3aGljaCBkb2VzIG5v
dCBtZWFuIHRoZSByYWNlIGNvbmRpdGlvbg0KZG9lc24ndCBleGlzdCAtIG9ubHkgdGhhdCBpdCBt
YXkgYmUgaGFyZGVyIHRvIHRyaWdnZXIgb3IgZGVwZW5kZW50IG9uDQpvdGhlciB0aW1pbmcgZmFj
dG9ycy4NCg0KPiBUaGUgcmVhbCB3YXkgdG8gZml4IHRoaXMgcmFjZSBpcyBieSBlbnN1cmluZyB0
aGF0IGRldmljZSBkZXRlY3Rpb24gd2lsbA0KPiBvY2N1ciBpbiBhbGwgY2FzZXMsIHdoZXRoZXIg
dGhlIGNvbnRyb2xsZXIgaXMgYXQgZnVsbCBwb3dlciwgc3VzcGVuZGVkLA0KPiBvciBpbiB0aGUg
cHJvY2VzcyBvZiBzd2l0Y2hpbmcgYmV0d2VlbiB0aGUgdHdvLg0KDQpJIGFncmVlIHRoaXMgd291
bGQgYmUgdGhlIHByb3BlciBmaXguIERvIHlvdSBoYXZlIGFueSBwcm9wb3NhbHMgb3IgaWRlYXMN
Cm9uIGhvdyB0aGlzIHBvdGVudGlhbCByYWNlIGNvdWxkIGJlIGFkZHJlc3NlZD8NCg0KVGhhbmtz
LA0KTWFyaW8NCg0KPiBBbGFuIFN0ZXJuDQo+DQo+PiBSZXBsYWNlIHBtX3J1bnRpbWVfcHV0X3N5
bmMoKSB3aXRoIHBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoKQ0KPj4gYXMgcmVjb21t
ZW5kZWQgYnkgU2VjdGlvbiA5IG9mIERvY3VtZW50YXRpb24vcG93ZXIvcnVudGltZV9wbS5yc3Qu
DQo+PiBUaGlzIHVwZGF0ZXMgdGhlIGRldmljZSdzIGxhc3RfYnVzeSB0aW1lc3RhbXAgYW5kIGRl
bGF5cyB0aGUgc3VzcGVuZA0KPj4gdW50aWwgYWZ0ZXIgdGhlIGF1dG9zdXNwZW5kX2RlbGF5IHBl
cmlvZCwgYWxsb3dpbmcgcGVuZGluZyBkZXZpY2UNCj4+IGRldGVjdGlvbiB0byBjb21wbGV0ZS4g
QXMgZG9jdW1lbnRlZCwgdGhpcyBhcHByb2FjaCBwcmV2ZW50cw0KPj4gImJvdW5jaW5nIHRvbyBy
YXBpZGx5IGJldHdlZW4gbG93LXBvd2VyIGFuZCBmdWxsLXBvd2VyIHN0YXRlcyIuDQo+Pg0KPj4g
VGhlIHN5bmNocm9ub3VzIHZhcmlhbnQgcG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZCgp
IGlzIHVzZWQNCj4+IChyYXRoZXIgdGhhbiB0aGUgYXN5bmNocm9ub3VzIF9fcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKSkgdG8gbWF0Y2gNCj4+IHRoZSBzZW1hbnRpY3Mgb2YgdGhlIG9yaWdp
bmFsIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSBjYWxsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1h
cmlvIFBldGVyIDxtYXJpby5wZXRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4+IC0tLQ0KPj4N
Cj4+IFRlc3Rpbmcgd2FzIHBlcmZvcm1lZCB1c2luZyBhIHNjcmlwdGVkIHNlcXVlbmNlIHdpdGgg
YSByZWxheSB0byBzaW11bGF0ZQ0KPj4gVVNCIHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMgYXQgdmFy
aW91cyB0aW1pbmcgaW50ZXJ2YWxzLCB2ZXJpZnlpbmcgdGhhdA0KPj4gZGV2aWNlcyBhcmUgY29u
c2lzdGVudGx5IGRldGVjdGVkIGFmdGVyIHJlcGx1Z2dpbmcuDQo+Pg0KPj4gdjE6IHN1Ym1pdHRl
ZCAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL3p1enNqcjZpc3E2aTVpenczcmt5
bzQ1b3B5aWtpcWpteTV4azdmbHBtbGdtcWI2bWdoQHJwYmR2aTNzNHU1NC8pDQo+PiB2MjogZHJv
cHBlZCByZWR1bmRhbnQgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIGNhbGwNCj4+DQo+PiAg
IGRyaXZlcnMvdXNiL2NoaXBpZGVhL290Zy5jIHwgMyArLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jaGlwaWRlYS9vdGcuYyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL290Zy5jDQo+PiBp
bmRleCA2NDdlOThmNGUzNTEuLmQxOWMyN2Y0NDQyNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
dXNiL2NoaXBpZGVhL290Zy5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcuYw0K
Pj4gQEAgLTIzMCw3ICsyMzAsNyBAQCBzdGF0aWMgdm9pZCBjaV9vdGdfd29yayhzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspDQo+PiAgICAgICAgICAgICAgICBjaV9oYW5kbGVfdmJ1c19jaGFuZ2Uo
Y2kpOw0KPj4gICAgICAgIH0NCj4+DQo+PiAtICAgICBwbV9ydW50aW1lX3B1dF9zeW5jKGNpLT5k
ZXYpOw0KPj4gKyAgICAgcG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZChjaS0+ZGV2KTsN
Cj4+DQo+PiAgICAgICAgZW5hYmxlX2lycShjaS0+aXJxKTsNCj4+ICAgfQ0KPj4NCj4+IGJhc2Ut
Y29tbWl0OiBmMGI5ZDhlYjk4ZGZlZThkMDA0MTlhYTA3NTQzYmRjMmMxYTQ0ZmIxDQo+PiAtLQ0K
Pj4gMi40My4wDQoNCg0K

