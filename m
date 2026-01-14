Return-Path: <linux-usb+bounces-32327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FFD1E08C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD253029D2E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF9E389E0C;
	Wed, 14 Jan 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="laxkH4wj"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013058.outbound.protection.outlook.com [40.107.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662E538A719;
	Wed, 14 Jan 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386484; cv=fail; b=H9RIK8L/Lp+XN6cxdVv3d3kEq+nXicTPhvy/g3VRbSGgQZWJQPrOLCOhi/8lu0sEEN+DzeK/R95aRKAyLzs4Acvebn0Qpb3FHx6BiQuA+RJhIqUeMN0l0SrPl7DfzdyRl7FVINHQJiu+mkwXrJ/r0QcxWZOKgilproDG1vxESU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386484; c=relaxed/simple;
	bh=X7MZoiFi6P/AIJpx1Xc+CZJ6ZPIhzzHNCblbQjNF+mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cGNi/g9UUVWKzBwvi4LWe1822dOuiTuQ5AjsinU/z/y2RxFsAT3yRN6xkwzuxabYSgmupBTRI5aNtS1GzpR2Y6ZnWgMt08VqHjX4eDfzBi1eQ9239CI8cDhxcoUoV1ryd5O0stzZsCnZdNB2SS2e2Nh4uVXgEwoNtTa2zFCulnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=laxkH4wj; arc=fail smtp.client-ip=40.107.44.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmOfu4BOqA8eK8SIrAwo47qUXfxGuKVp1HiNbkxCOJDPGrhLxGjOxg1SwlJEls/dwVYlPJWnYSEuL8EYSBXmCi+L6M4fHFUL2phtNrRL33w5u8heQ64z64J/IlKCVji3N0ll27zUxAmDLq0opNUCpc5+Kpr2cVDr31WNCtrPt6wom56ftlTzFnMGdk6Ymh/HKQtccBL3LYYRPlCjCK45sGvHzeBWHyaX5s5+laGf6XaH2ts6myTA8pa4aMnhm1lltEfPCEQX2tCxRvOF8TKPNNLKTi+SMfJKyTc9s0vHs+ZdcNsdbtWvo0f2r2R4IB84K8Jnu3OlHItoC3aNXQQ4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7MZoiFi6P/AIJpx1Xc+CZJ6ZPIhzzHNCblbQjNF+mw=;
 b=TPCk26hHWRV4viQMnSbcw0KfQt1NDq0/LFXW6VkdJSGxl+87BmIqE/phhCuOMfx+e1KLL4GLcPA0YzNoOQ6m8uQp9MMOLbrTTHAk8VbhbrxB7Apz7kxI6wbTpv/5OwHIkPnyLncjEaS0QmcRnaPeR114LRG6RHIwqiv3HDbXfRfCbOzMzcmZM96y81vMkxPxHTkqGY3FdjZeeSkKG9hD8mflSulb2Lu6F5eeGIVDeEpkBiyst0EUf8MG6+x3c5yuo6Y01RdgV1nZHhLrMGS4BU1Wjua59Y2Nlw4NOVjSujjG5QNRB72jYOBSky/vEEf2XE5HlVKFUtATEgFx4PGfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7MZoiFi6P/AIJpx1Xc+CZJ6ZPIhzzHNCblbQjNF+mw=;
 b=laxkH4wjYbWIYTucI/LkulJlITvcsrs9C/RowpxDSCqyp8E3bDsE1Rsu5nwbW2hmhdgaYBw2bkVStTrHHpggqS4KRs4CzCs6ljMAdoOIMROKbythpESmAdoUYxJOp4lXnjAf/su7udA+LZUtTEu7PHOI4109l8gdUk1+UO2jO9FAycoxS/g4LZx7tMs6k8ZyI7iQdCixsLW5eBKQ2rYsf+PUWCT5B06B+czO/FmE+/ZSmIIOVvzHsJeHrKLuIFMhXGgtyMK/z3e4OvqVZGunSFoh8dgQAudP7XXxwp/3iMwCn5BExS9e8mEpOO5ry/1+5V6sxEkbw9hc1QH34GXsLw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB5541.apcprd06.prod.outlook.com (2603:1096:101:cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:27:57 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 10:27:56 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogtPC4tDogQ29uc3VsdGF0aW9uIG9uIHRoZSBpc3N1ZSBvZiBkaWdp?=
 =?gb2312?Q?tal_headphones_freezing?=
Thread-Topic:
 =?gb2312?B?tPC4tDogQ29uc3VsdGF0aW9uIG9uIHRoZSBpc3N1ZSBvZiBkaWdpdGFsIGhl?=
 =?gb2312?Q?adphones_freezing?=
Thread-Index:
 Adx9d1oMYEJvjzUWS462ZgXY544fRQA0iX8AACkKKgAAM69rwAA6jX6AACrNInAA+05csA==
Date: Wed, 14 Jan 2026 10:27:56 +0000
Message-ID:
 <TYUPR06MB6217EA2FBB3CE957C0478C53D28FA@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
 <TYUPR06MB62174179E2B4210E229872A0D287A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217745344E7E2EF5DAC6746D284A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <b1e908f2-8dfa-4d1e-8059-5e421145d154@linux.intel.com>
 <TYUPR06MB62171A3584A2769CBC752322D282A@TYUPR06MB6217.apcprd06.prod.outlook.com>
In-Reply-To:
 <TYUPR06MB62171A3584A2769CBC752322D282A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB5541:EE_
x-ms-office365-filtering-correlation-id: 33e72328-b203-431f-b148-08de53579560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?VnVkK3M0YTlhYi96VWxzcXpHdEV4UkplV1FxM0ZjVVQxbitDZnhlUEZHN3ZC?=
 =?gb2312?B?QU8yb1BJZERtejMvQXg0ZnR6UUcxalBDY2J2OTF4ak9GUlZ3VW5hbk5FdTVq?=
 =?gb2312?B?aHdSNC85SC9zWEJSd0NpTjJ3M09yMndKcXVOak4xb3A2QjhxVmhDQUhXUkw5?=
 =?gb2312?B?NnU5YWhjV0Y2YjVqZmR0MXN3Y1dqUlQ0VFR3eUVoL1gwdDdIOHZ4RXZGaHFw?=
 =?gb2312?B?YzFqY0w5UkV1bHlmbVY2Z0o1RmhyUTNhSjV6TFlJN1hLUm9VUlRSdUNadkNS?=
 =?gb2312?B?SHBnS1hUYnJ0TkF1eUFSZjROQ0d4eFBVY2JNaFZ6a0lwdlJtc0FVTWZCSzdq?=
 =?gb2312?B?aWVoWkxTUG1EQSt3aFl1b3JaUnZycHkvaS9lSlZmZFNZVzFhamVUNUVBMDdw?=
 =?gb2312?B?QXQ0SXBNZ1NhR2ZNcGlsNStlT2cyeVpvWGtDMlk4RExTRDFoM1NZRG9vN2Vk?=
 =?gb2312?B?SlFHeDRZejJ1Yk5kNElhSmw5NzR2RFRHMmx0bUpCaGdjd3Z5dU94NWNDYlRC?=
 =?gb2312?B?VzBvQnpNbTVLY0NnRU1rR0RueW5yU1BnTzlMNWRRdFNJUVJFWlpkYnBoNVdM?=
 =?gb2312?B?aWlZeHlJSWdBcWovNXpaVVFHZmlLbDhYRjZmYVhVQmNzekJTU0QvUStuNkpN?=
 =?gb2312?B?aEg5NEJRMTVzd004TE1pZyt5L1d0S3k5UHl1eExHQzZjVkM4Zjd4R2tyZFNS?=
 =?gb2312?B?WXVnLzk2SmhNS1VDRlRSYzhMRGxJSlR3UHJUdHlFdUdoeHpKNUlDUUI0Vm9B?=
 =?gb2312?B?Nm12d2dBb25BeThaV1BRQ2J1QW9YZ3hiRWFzZTVSbTlHOW9zSkZoSkJabkdp?=
 =?gb2312?B?SkdCMWZNeTl3S2Y5eHVkQXVIcnZpRGZCMDRIcXJyYlJ3RFRBSFlDL1dLWDlv?=
 =?gb2312?B?cGJlWXpTUjZkbUVqV1VMaVM0SzRBUnRVTWRnNFVwNjNLK3FUazdLNmRyZ0lo?=
 =?gb2312?B?QW9jaHdsVk1NVnFScWh0U3VVekcwTGdMb1NVTmJFRkFkQldBU1E0QlQ5UlNC?=
 =?gb2312?B?NlFrLzNEdkFLalZ1cW9UWC9XVU1JbGxtUWo3QTFGMmUrdWxKQkJYc21TRnpj?=
 =?gb2312?B?RHBub2EzRllOa3N3dGJ0eTJRV2hid1NmVGo1WFlldGJKTUNjeUkvRFB0b2lq?=
 =?gb2312?B?KzRrbm5ESFdKSzR6VUk3M3N4WUtLaFlLOVR1QWpMbEl0K25kT3BJL0NYajkw?=
 =?gb2312?B?Yk4yY2kyRkdHNllvN0U1VFdjeFh2NktYZ3NPb0NiWFhqa3RsUUx3UjkxRFJZ?=
 =?gb2312?B?MGRTN0NXejNiUmR4Y2plVWxhMjZVei9vdmp3aVlScjVtbzFzTTc1RGN4UG0v?=
 =?gb2312?B?TFRNaG9DdVlGSk9nZ0RzVXdidUtFemNkYk9td3gxeU5HVW11T3piYWFzQTdQ?=
 =?gb2312?B?enZ1NHRtQ05QZTVRYlNnaFBmR0wzSWxPWHhlU2gvMW9PUWhubi9UOEFBVWRM?=
 =?gb2312?B?V2ZIcllwVEs0RmlKaExoNzFabVdiZDNYZlpGWlE3ZmovRHVtTlFES1FFdmoz?=
 =?gb2312?B?VG1odEJuUk16M3NDNTN3TFZTdHM3NWNSSGFWTjRNaGRQRWVPWDNLclBaRnd5?=
 =?gb2312?B?dEtUaE1zQmRsM25lbTVoQm9QekRxMktJU01OeEhHelUwYWU2WWhEZVljTmhu?=
 =?gb2312?B?VU1Lb1dwVkNRTFBBbjA5WkovQnl2RjBuNTRRMk5pOHZDR0J3NzBVYXlmUjR2?=
 =?gb2312?B?VXRQTDAzeWlXdm84aFhGbGtIZ1NxalI1eVRaSEZrYUltTEdRNEJ3V3gvVjl3?=
 =?gb2312?B?ZnhnYlRuTHhpWUV4a2Nad3ZPdWFURm40QU14Tis1bmJ0QjZoMHdjYTBQM3pF?=
 =?gb2312?B?VFhkTlM2TEpiTVJqeURnSGc2azBvWU1Ucm9DMWpCa2JRTDRpcXFwVklkaXNZ?=
 =?gb2312?B?anB0eVVZNjJKMjVwcy9GT2ZSKzRuWENvMzc0MWZQU0VIZ3l1QmJRc0wvempU?=
 =?gb2312?B?MldBdHMyeTNybUNHMzcyd3lBSXBTLzRqZ0ZLODhUdzBrdHg5eDAzTThMRExo?=
 =?gb2312?B?bFBua0ZOd2dFem1DREhwbEI2TFlmaElBZGhIaURMZDlHYUVac3RyZlRyMExN?=
 =?gb2312?Q?xHt1uX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?K2pFT2d5SlFOblVQVzJERmw4eGRTZGF6UmJGS3lqem5jZVB5aEdRMVFQYUdS?=
 =?gb2312?B?N3V1OTg2ODlOa2FFd3ZYSmt3MzBLbzZBdnlmaTk0OWNUS0FCMnhvZVVLQlF2?=
 =?gb2312?B?R1k3MFNlK2VyY1JSLzJSSFpNc2dJTzJWUTBOMVFUR0dKcTd2ZTZiMTRaaDly?=
 =?gb2312?B?QXRNeGFZYzBqTVcvelU2Mkw5M1JtYW9zL1ZZb1ZKYVo2SjlnL2lZbmkwTE5G?=
 =?gb2312?B?cWpQdTRxVDR1ekhkY2dWOHFQNVBiOEVnSkdMOXVieUJqZjhHMFFkajV2Y2Zw?=
 =?gb2312?B?OWlVM252VTk4WUI4TnZnaGhPc2s0NzZyaGFiTWdkRUVCcnRCWTB0ZmRXRTNj?=
 =?gb2312?B?YVR1dmlya1lKYVVTYzgvWk53WXA1NVUwS012MVhBRGFQdkh2eUErWUtGY1Ft?=
 =?gb2312?B?TEhWNUYwZ3JjZnJBZmpOVmF1VmYxdDRmOUdZQk9zYVVuQXB5cnZHcU5Dc1p3?=
 =?gb2312?B?Yk85UVVyTko3MHBid1plVGFxRHZySTJQUTZhOGpwdDRBQ2Z6cEpWYThtdDBW?=
 =?gb2312?B?c3g5R2x6L2dNQlZiNVB4U0RxbG1IRDMxWnUwZmRPcENnMlQrRlN1OXFHYkky?=
 =?gb2312?B?UEcvL1V4VnBzSDNEdWk1QVNDR1BJOVpZS0ZoNHVubTdhWnpTUjR4Q0w1OEVi?=
 =?gb2312?B?c2VkMG1SQmlUclF4dzArMThzN0E2THAxVHRmZjE5NXBYcG1IWEJFV0FkQzVQ?=
 =?gb2312?B?bTNSeW9ob2lKT0tpeUFnV0dOMzN0eDBtdis0bjhjY2FYMXhoRjZhaXdhbmgy?=
 =?gb2312?B?akdhSGdmSU1NVFZldlBySmFxUjVKd3p0eFpIZU5aMTBLcFcxcm5vN2R0MTBN?=
 =?gb2312?B?S3pYT09TckVHbVVoaEdTVXZvdnhNcldhbXdYMUFhR2xMUkRickRoRnIzN0hl?=
 =?gb2312?B?Z0hTaTdhYXN0QUxVSTRCT2htaWFpMWx3R1g2cklzNlAvSjdXYWphTmY2VjRv?=
 =?gb2312?B?c1hKWEdxSHZ6aWpoTmwxSkZ0WkRLNjNJTUVpVTVLT1RncnZkZCsxclUwRGMr?=
 =?gb2312?B?N1RURG52WXliODVvYTUwMXJ3NVo0cmYxOEFlOHl2SDNFNHppTzNVMjIyeUNq?=
 =?gb2312?B?b0dVZEh6Rm5JRTQrZVo2Q2wvTFZ3eTF5RjdtTUhQb3ZvVWxCa2NzbVpMNFJU?=
 =?gb2312?B?QS9vNUxkbWd1UlpIY2dYOURiWGk2WC9yMjlFNTNHUFl5NEV0NXdMRHFLeDdX?=
 =?gb2312?B?Ui9YSktVc2s0YkMyYWxEMWYvQ0FPdUdOUDlWN3UzSGRFS2QrMTZSdVkxL1M5?=
 =?gb2312?B?cjJma0NibS9YYzVpUWpJWjdsUFFJdFIyYmpSK0RhNCs0QVNBeFZkWE80aFh2?=
 =?gb2312?B?NytsNjlMU1QzK1JZNFh1YVRyOVN1TFhZVWZUQVdVV0k5b085UzdUcmlkR3Rn?=
 =?gb2312?B?cEoyUWFKelk2dlk4SWxtWndmVXBkdWZvU1UvbExKNzQyeUpkZXlhTzUxYzlR?=
 =?gb2312?B?TFg5M2laRW9wTnA3citGaTlzUmtOREx5MisxVElueUx6SENMUU0zRkJ5cEsv?=
 =?gb2312?B?VTBjakZ5ZFh2VHpGOE8xc1NSRHdIUHF1bUdZRWZJYXM2eDdoKzhKd01UbllY?=
 =?gb2312?B?ZGZSdVZzbjZNM2ZDcEtDdE9EK0NyNTNmQjJtcENBbEZiQTNiZFZuVkZ1MlpL?=
 =?gb2312?B?dTVTd2J4NGc5TXlLUXFUbThoQ1Q0ekk4d0Z4YnZmeGlyMXpCdk1LRXlSVDdw?=
 =?gb2312?B?YVFiNzR5bDFsU1BnTkhyZk5xUTF5Mk5EdGYvbjNGWG0rQnlpelpGL1pJS2hR?=
 =?gb2312?B?NEpnL0gxRTFUMFV4eHg1VkdUSWFYK1FhRkhZVHY3Q1ptZW5xM2VPRXFHeUpZ?=
 =?gb2312?B?SUEycU5UYnRTcmU1WXpDMCtZeWhLMnppUEV4K2Z3aVNGemtkZTE5bHZKZXA4?=
 =?gb2312?B?WEw0R0NVaGRSZ3QzbytJYm95S2laZllYZ2NBWW1PSEdsckhvYmRTV3JmTkw0?=
 =?gb2312?B?OGxGektaZVVVb3FSck5idXlNbE8ya0hlaWV5ZWFkcWswWmw4QUhtZXJldTNF?=
 =?gb2312?B?Zzd2RmlVcXVscEVaZmdmbzEzSHMwdlBxVE1Ha3FmdWVjRU5OOS9KK0JjemNs?=
 =?gb2312?B?eFRsOGV1VDl0MzJwUjVWSEJ4U1g5RllyYVRsaHBLeHY3Q1JFYlMwNGgxQjRY?=
 =?gb2312?B?NG9CVVBLVmQrdW02ZE5JQUtMOHNCRUtSYnkxdE0raUFWeWpqTEpLcHo5YkNm?=
 =?gb2312?B?NVh2aUQySGM4RWk1YXlWeUJFandNZEt2d0RuQnh6cDQ3aXkxUHIyY1R1RFJp?=
 =?gb2312?B?THFGSEJkZDduRHE4U3dRSjBEcnhsd05zVk0rNFMzRFl1OUFua1VqQlZVTmJq?=
 =?gb2312?Q?GILPRuIPBKBRWw4oIQ?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e72328-b203-431f-b148-08de53579560
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 10:27:56.5491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqYVLoyDhD1Y9vgS3riVg8eeODRgfgbksPDnIrba9eYFge0fsmoV3MLFxF4bOaT2UQyEYS0D/nTjjTFImPusDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5541

SGkgIE1hdGhpYXM6DQoNCj4gPiBPaywgbG9va3MgbGlrZSB3ZSBkb24ndCBjYWxsIHhoY2lfc2lk
ZWJhbmRfbm90aWZ5X2VwX3JpbmdfZnJlZSgpIGluIGFsbCBwbGFjZXMgd2Ugc2hvdWxkLg0KPiA+
DQo+ID4gVGhhdCBiZWluZyBzYWlkLCB0byBzb2x2ZSB0aGlzIGNyYXNoIHdlIG5lZWQgdG8gbWFr
ZSB4aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludCgpIHdvcmsNCj4gPiBpbiBjYXNlcyB3aGVy
ZSBkZXZpY2UgaXMgYmVpbmcgcmVzZXQgb3IgZGlzY29ubmVjdGVkLCBhbmQgZW5kcG9pbnQgaXMg
YmVpbmcgZHJvcHBlZC4NCj4gPg0KPiA+IExvb2tzIGxpa2UgeGhjaV9pbml0aWFsaXplX3Jpbmdf
aW5mbyhlcC0+cmluZykgd2FzIGFkZGVkIHRvIHhoY2lfc2lkZWJhbmRfcmVtb3ZlX2VuZHBvaW50
KCkNCj4gPiBpbiB2OCBvZiB0aGUgb3JpZ2luYWwgcGF0Y2ggc2VyaWVzIGR1ZSB0byBhIGNvbW1l
bnQgYWJvdXQgbGVhdmluZyB0aGUgZW5kcG9pbnQgaW4gYSBtZXNzeSBzdGF0ZS4NCj4gPg0KPiA+
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjMxMDExMDAyMTQ2LjE4MjEtMS1x
dWljX3djaGVuZ0BxdWljaW5jLmNvbS8+ID4NCj4gPiBDYWxsaW5nICB4aGNpX2luaXRpYWxpemVf
cmluZ19pbmZvKCkgZG9lcyBub3QgcmVhbGx5IGNsZWFuIHVwIGFueXRoaW5nLCBpdCBqdXN0IHNl
dHMgdGhlDQo+ID4gc29mdHdhcmUgZGVxdWV1ZSBhbmQgZW5xdWV1ZSBwb2ludGVycyB0byB0aGUg
YmVnaW5uaW5nIG9mIHRoZSByaW5nLiBUaGUgeEhDIGhhcmR3YXJlDQo+ID4gZGVxdWV1ZSBwb2lu
dGVyIGlzIHN0aWxsIHVudG91Y2hlZCwgYW5kIHRoZSB3aG9sZSByaW5nIGJ1ZmZlciBpcyBzdGls
bCB1bmNsZWFyZWQuDQo+ID4NCj4gPiBJIHRoaW5rIHdlIGNhbiBkcm9wIHhoY2lfaW5pdGlhbGl6
ZV9yaW5nX2luZm8oKSBjYWxsIGNvbXBsZXRlbHkgaGVyZS4NCj4gPiBUaGUgY2xhc3MgZHJpdmVy
IHN0aWxsIG5lZWRzIHRvIHNldCB1cCBhbmQgcmVpbml0IHRoZSBlbmRwb2ludCBwcm9wZXJseSBp
ZiBpdCB3YW50cyB0byBjb250aW51ZQ0KPiA+IHVzaW5nIGl0IGFmdGVyIGl0IGlzIHJlbW92ZWQg
ZnJvbSBzaWRlYmFuZCB1c2FnZS4NCj4gPg0KPiA+IFdlIGRvIHdhbnQgdG8gbWFrZSBzdXJlIGVu
ZHBvaW50IGlzIHN0b3BwZWQgd2hlbiByZW1vdmluZyBpdCwgYnV0IHRha2UgaW50byBhY2NvdW50
IHRoYXQgZW5kcG9pbnQNCj4gPiBtaWdodCBiZSBzdG9wcGVkLCBkaXNhYmxlZCBvciBhbHJlYWR5
IGRyb3BwZWQgYnkgdGhlbi4NCj4gPg0KPiA+IERvZXMgdGhlIGNvZGUgYmVsb3cgc29sdmUgeW91
ciBjcmFzaD8NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktc2lk
ZWJhbmQuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1zaWRlYmFuZC5jDQo+ID4gaW5kZXggYTg1
ZjYyYTczMzEzLi4yYmQ3NzI1NTAzMmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLXNpZGViYW5kLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktc2lkZWJh
bmQuYw0KPiA+IEBAIC0yMTAsNyArMjEwLDYgQEAgeGhjaV9zaWRlYmFuZF9yZW1vdmVfZW5kcG9p
bnQoc3RydWN0IHhoY2lfc2lkZWJhbmQgKnNiLA0KPiA+ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
Pg0KPiA+ICAgCV9feGhjaV9zaWRlYmFuZF9yZW1vdmVfZW5kcG9pbnQoc2IsIGVwKTsNCj4gPiAt
CXhoY2lfaW5pdGlhbGl6ZV9yaW5nX2luZm8oZXAtPnJpbmcpOw0KPiA+DQo+ID4gICAJcmV0dXJu
IDA7DQo+ID4gICB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4gPiBpbmRleCBhMTQ4YTEyODAxMjYuLjQxNjFjOGM3
NzIxZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+ID4gQEAgLTI4OTEsMTYgKzI4OTEsMjUgQEAgaW50
IHhoY2lfc3RvcF9lbmRwb2ludF9zeW5jKHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwgc3RydWN0IHho
Y2lfdmlydF9lcCAqZXAsIGludA0KPiA+ICAgCQkJICAgIGdmcF90IGdmcF9mbGFncykNCj4gPiAg
IHsNCj4gPiAgIAlzdHJ1Y3QgeGhjaV9jb21tYW5kICpjb21tYW5kOw0KPiA+ICsJc3RydWN0IHho
Y2lfZXBfY3R4ICplcF9jdHg7DQo+ID4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiAtCWlu
dCByZXQ7DQo+ID4gKwlpbnQgcmV0ID0gLUVOT0RFVjsNCj4gPg0KPiA+ICAgCWNvbW1hbmQgPSB4
aGNpX2FsbG9jX2NvbW1hbmQoeGhjaSwgdHJ1ZSwgZ2ZwX2ZsYWdzKTsNCj4gPiAgIAlpZiAoIWNv
bW1hbmQpDQo+ID4gICAJCXJldHVybiAtRU5PTUVNOw0KPiA+DQo+ID4gICAJc3Bpbl9sb2NrX2ly
cXNhdmUoJnhoY2ktPmxvY2ssIGZsYWdzKTsNCj4gPiAtCXJldCA9IHhoY2lfcXVldWVfc3RvcF9l
bmRwb2ludCh4aGNpLCBjb21tYW5kLCBlcC0+dmRldi0+c2xvdF9pZCwNCj4gPiAtCQkJCSAgICAg
ICBlcC0+ZXBfaW5kZXgsIHN1c3BlbmQpOw0KPiA+ICsNCj4gPiArCS8qIG1ha2Ugc3VyZSBlbmRw
b2ludCBleGlzdHMgYW5kIGlzIHJ1bm5pbmcgYmVmb3JlIHN0b3BwaW5nIGl0ICovDQo+ID4gKwlp
ZiAoZXAtPnJpbmcpIHsNCj4gPiArCQllcF9jdHggPSB4aGNpX2dldF9lcF9jdHgoeGhjaSwgZXAt
PnZkZXYtPm91dF9jdHgsIGVwLT5lcF9pbmRleCk7DQo+ID4gKwkJaWYgKEdFVF9FUF9DVFhfU1RB
VEUoZXBfY3R4KSA9PSBFUF9TVEFURV9SVU5OSU5HKQ0KPiA+ICsJCQlyZXQgPSB4aGNpX3F1ZXVl
X3N0b3BfZW5kcG9pbnQoeGhjaSwgY29tbWFuZCwNCj4gPiArCQkJCQkJICAgICAgIGVwLT52ZGV2
LT5zbG90X2lkLA0KPiA+ICsJCQkJCQkgICAgICAgZXAtPmVwX2luZGV4LCBzdXNwZW5kKTsNCj4g
PiArCX0NCj4gPiArDQo+ID4gICAJaWYgKHJldCA8IDApIHsNCj4gPiAgIAkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmeGhjaS0+bG9jaywgZmxhZ3MpOw0KPiA+ICAgCQlnb3RvIG91dA0KPiANCj4g
VGhpcyBwYXRjaCBsb29rcyBsaWtlIGdvb2QuDQo+IEkgYmVsaWV2ZSB0aGlzIGNhbiBzb2x2ZSB0
aGUgY3Jhc2ggcHJvYmxlbSBJJ20gY3VycmVudGx5IGV4cGVyaWVuY2luZy4NCj4gSSdsbCBkbyBh
IHN0cmVzcyB0ZXN0IGFuZCBzZWUuDQoNCkFmdGVyIG1lcmdpbmcgdGhlIGFib3ZlIHBhdGNoLCB0
aGUgbG9hZCB0ZXN0IHJlc3VsdHMgYXJlIGFzIGZvbGxvd3M6DQoxLiBUaGUgZGlnaXRhbCBoZWFk
c2V0IHdhcyBjb25uZWN0ZWQgdG8gYSAgcGhvbmUgLCBhbmQgYSB0b3RhbCBvZiB0aHJlZSByb3Vu
ZHMgb2Ygc2xlZXAgYW5kIHdha2UtdXAgc3RyZXNzIHRlc3RzIHdlcmUgY29uZHVjdGVkLCANCiAg
ICAgd2l0aCAzLDAwMCBzbGVlcCBhbmQgd2FrZS11cCBjeWNsZXMgaW4gZWFjaCByb3VuZC4NCjIu
IE5vIHN5c3RlbSBjcmFzaGVzIG9jY3VycmVkLg0KDQpUaGFua3MNCkxpYW5xaW4NCg0K

