Return-Path: <linux-usb+bounces-23776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996BAAD661
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 08:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B861BA8731
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 06:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4282116FB;
	Wed,  7 May 2025 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exodigo.ai header.i=@exodigo.ai header.b="sb++4diI"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7911A841B
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600536; cv=fail; b=mbRsqlbsKi7oDpg0/N0Svf8bdjydWEi1eMJ1gm0v+EqCl3wXyWw0qdSQBDa13q5tUJTmDtJEHWgz6bot9ecLorF6S2et4+ozCvLO96r2UP0EFBd6h8jzuqvuNoSSSvhZ/VVzk647AghzExWtOChBuVlcUMRNaT/Vq5ERy4wx/WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600536; c=relaxed/simple;
	bh=o9A/3yyh2TbbXvGRrcegYbrd9SQpMik73JgDs3klBpQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fl5x+YUpAGgrOGDh0p4P8JMNZgi1gT/yEdrfPv5FPjSHcu8tq/LK+baADZKWjUPOgBGm89qjlRG85eV1FaSqX7c8Tj/WbaU3N7IpK9UT/+eyntU1CtJMXr2+8CBq+0VkJQEVncb+lOkOX/5ny7iYOZcn+IOeCn7ESxCNR00ZohM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exodigo.ai; spf=pass smtp.mailfrom=exodigo.ai; dkim=pass (2048-bit key) header.d=exodigo.ai header.i=@exodigo.ai header.b=sb++4diI; arc=fail smtp.client-ip=40.107.21.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exodigo.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exodigo.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRXDlwkgJA/AYWRlm50WSKYMDHk3YgA3n0QBJTgdQ6LSiOxsxXfvNe6RK9kZvRNaVXkIeOX1rnNrBwhCNpa6rsgW3NQ2/nPksu+RPr2wPRnNUhLte3A8ZzOXIpHFQfSiaycD+8GY/jnY6qtzFSZ9+JCr0ekAW3OYXtnnxTVxJdQShMLAmEWIOg3Am8HZl81fIiVSTGAwM45x7TUY3RFRlLdtJtBGwMmIW+9UCQNzvtjoS9JovskfgCVsylGpJvV3qhvvJ1pjvV9zq/Jc499WdCs8pvK+HV0tk4vXfsnIGNTKY7dE/jT7XIpfDafu7AIlBuIXqwJSHNsEdiJQ6hLwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9A/3yyh2TbbXvGRrcegYbrd9SQpMik73JgDs3klBpQ=;
 b=qtEYyb0BAD3AGacE+Sc/djwtiffysBzTY+ihVGhumLKthEvj8yL0Y/YgVFsN3eQ40DCmoWpJR/4xQGcz5GxqN3VkHQD+qlao0ga1DC8lBnzEfu52AvGzvTGZjbM0TEXHfCygTCjCdNkAUBbFhT0Oo1gWBGrsWvTMp0EqxroP4aky786UjiV6D+hikoyOsBxhbZ9yBj3Maek4KeSR0XE02ZUQicpVZPqjhKrCzTJn4RjiFJaFOY2zg8SDTNWl81ZKoZZiQ4+CpHxm2bS8JVbYmOAyjsYCF42SPJ5hQ//FzF4gyIgtLVwDYzMcIANpETSz2z2C4iTJuH+uCr4K1BF1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exodigo.ai; dmarc=pass action=none header.from=exodigo.ai;
 dkim=pass header.d=exodigo.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=exodigo.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9A/3yyh2TbbXvGRrcegYbrd9SQpMik73JgDs3klBpQ=;
 b=sb++4diIWGvTHcMOkOLAMdwTmliFdO+tjxVKdfLhTEDWPkgdbgtxVThxHSREySlkzqKF6ozxRy0V+wFu+EnvUrAnRShU4dX3ymJrTYoG36pazMgJc2LEW9gzkOVoq8yjlyrmXqMFAJLrrp1R4GlfLd2b7ppNEpr3NPWfGtNUzeVSp5+B6q580IFcB/QhxyrkD8ZJvY32YEkxVxoNY7sAObGjlf975ID0U9ZrnRiIqGA4Bh2c0zmKr9OyYaz+dVVBSjiW+tQklO0EPkIzSUOHS2OQbJf24jWGIicGASeU6C3U4tTruiuY0zdKPgVXxS8ftAmR1oQVeyscJmVxg1yeOg==
Received: from DU0P190MB1980.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3b7::8) by
 DU4P190MB2222.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:575::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Wed, 7 May 2025 06:48:49 +0000
Received: from DU0P190MB1980.EURP190.PROD.OUTLOOK.COM
 ([fe80::d1cd:3574:18b9:afd2]) by DU0P190MB1980.EURP190.PROD.OUTLOOK.COM
 ([fe80::d1cd:3574:18b9:afd2%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 06:48:49 +0000
From: Asaf Kampf <asaf.kampf@exodigo.ai>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, Yoav
 Derman <yoav.derman@exodigo.ai>, "Alon Bar-Lev [Exodigo External]"
	<alon.barlev@gmail.com>
Subject: RE: ucsi_acpi: crash ucsi_reset_ppm [typec_ucsi]
Thread-Topic: ucsi_acpi: crash ucsi_reset_ppm [typec_ucsi]
Thread-Index: Adu+irykuMtvv9GQSv2mI3up+p4gJgABq46AAADzNiAAAYvAgAAdJB5Q
Date: Wed, 7 May 2025 06:48:49 +0000
Message-ID:
 <DU0P190MB1980057D6ADAB7239A9E4839E188A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
References:
 <DU0P190MB1980848113ED5AD6E39C0A15E189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
 <2025050621-embody-wobble-3610@gregkh>
 <DU0P190MB1980AA5ADE81657C64E4830AE189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
 <2025050618-amid-ferry-5b38@gregkh>
In-Reply-To: <2025050618-amid-ferry-5b38@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exodigo.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P190MB1980:EE_|DU4P190MB2222:EE_
x-ms-office365-filtering-correlation-id: 4d243e77-db2c-4631-cb56-08dd8d3338e4
x-ld-processed: da061ec7-6389-4987-be6b-51c45283828e,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?UjMxWmlhY0JYcHdVUi9wSVQ0dEVXaEpSclZlbjdLcDRNbXI1TllOR3RmZEx0?=
 =?utf-8?B?YSs4N0ZzTWphYlh5enArWXk3NGhlbVl2KytXSUpkQzhaTnk3c2tUNjMvNDRp?=
 =?utf-8?B?ekZXV2h2NVVMVGR3b0pNRlBKbkk5UzZ0MmtzMjMweGFjaDVYdVFIUEdnS0hN?=
 =?utf-8?B?bEtiRVBxcDNwei9iYlA5SW1iQVBDRmFCWG1Wc2lxWUdOd1MrUGlvUXpQc3FE?=
 =?utf-8?B?VW9rTVo3eTVMRUNkRnBKdFNJYVNUK2NURGNCcTlteUcwdm9FVWV6MGRIZDlO?=
 =?utf-8?B?eXRSRFg4YUt6U0FWeWhJakRibjFxTnlSQ1YvNUJrVFhUeWVXN0Y4TE1keXdw?=
 =?utf-8?B?NDZkTndsbTdTbXU5dG12bUxhZEV6UXNPU1hKS0ZySldwY3NLUlhOaHV1VmJE?=
 =?utf-8?B?NzhaU1pjajlEUE1QMGRUQ2xyTTYzWjJWVXBvY0lpM2d6dzlmekZJZXY3aVZm?=
 =?utf-8?B?ekRrRlRtYncyczhCOXhZbEFFMzl4K2J5cDRyNVVFZGU2WXhsSVNaU1ZmRlZU?=
 =?utf-8?B?d2ZtMEd4OWFPTHBxU2dBK2t2TEpHMTFVVFJOUjN3RVZwZm1ROXJ2Q0VvMzlJ?=
 =?utf-8?B?cGMxTy96UmFWalRHZTBQdGQ1eHRURnkzVmo0UkVwMS9oVmg4MDZPcjdVTTRG?=
 =?utf-8?B?SThpb0RXQ0JFMXV6aWZWU3JiSjEvNXdwYjhuNGtqMHpVZmdXME5ZSHJ4SmRO?=
 =?utf-8?B?UWtPNjFiczZibUdBT2hsNlBNNGZvR2tIUDBnTE1nQnhkYmVJbjJZaHlPbW9M?=
 =?utf-8?B?d1haNitPM2dqTVQycWdIQW5hdFQ2SHN0YmlkdW56Z283Skt1anhObEU2UTFB?=
 =?utf-8?B?UnpWd2g3bGliUUpFVDJvRTB3alo2Q1doeHlXZExUNW1zM2V1VWhMdUI3SnNv?=
 =?utf-8?B?ekhmV240TlZESUIzUTVJRktDZkJKVERoZU9FQVJpemRmWEwwVzd6a0ZQekVQ?=
 =?utf-8?B?SXNwRjNLUFdEWFNhNzgxYkc2RDBVM2ZDYmFQcGFPVTZUREZ2UzZuSWlON3Uy?=
 =?utf-8?B?M2dDYjB3aFhwd0NlZ3EvRkRHUGJPS0RnNGljYk8vTXNpazBUNFRiT1JZeHI2?=
 =?utf-8?B?dkF6NGwySnlyNGdMSGNlTlJydmVCQWpVbGREYzEyZWVtbDZIc0c4N3hKRUpU?=
 =?utf-8?B?MFJIRzJrWWZCQmtyNmxEZEwxQlJkQ3NTUnFWOTFlV1NIZWxhRzVSQU0vTnBB?=
 =?utf-8?B?TENuVEhtcllKTUpkMzE2dEI4dTRoQktsK0N0U1N1NHdycGlTb3BJRXB6K2ZX?=
 =?utf-8?B?bWVmSDQxdmM2T21aNWJEMkdCS2pVV1Q4M2dUclhlVnJWc1JKUE8zSlVDa0ZJ?=
 =?utf-8?B?bEIrYms0R2hzV0ZMQlU2Y2Z3WDVjWXNJWTFyV0c3WnB5cDREam0vOUxmaTJ1?=
 =?utf-8?B?anRhTHo3cGQveGxxTDJmWEMxUk4rQW42SU9xUEZEbjQrbURTWndmQkNKYkMw?=
 =?utf-8?B?dXU0TUFTdjR2V3pVT1RsRG9LaWtNSkRTZ3R0VVVJdXdEMzhCR3dyNmErRWdi?=
 =?utf-8?B?M2JIZnh4UUlmckxFRDlPSmNHOHNYQ0pMNGJ5a3dqaElCQnhnU2FuUGlOUU11?=
 =?utf-8?B?dzFXWnhzdXNOVUZLTHk0K3lxRUJ4aE9FZ1ZOQUdQeFA0aUNEcFZBZCtYNHRX?=
 =?utf-8?B?RWFTNzI2dnZXWitSdHpuNkJlNWNvMzNpUXdtaERtV1h2L0R4ME9ueUR1dFFX?=
 =?utf-8?B?OS96akZObkR5RkhsOW9zRC9ub1dyWXRtK2hvNEwrS1JLZzFETlpybzhrYkVx?=
 =?utf-8?B?STZxU0VBdCtHQ0l6UUluekZnbEs3amd6aXdMVTBxTjdTNGZJN2wxK1dYSXRh?=
 =?utf-8?B?NzVuam16RWxFbVFCOVhqQWs4bWdRaEpSOXdkQ1ZrTmtObGptYTRtREg3cFVu?=
 =?utf-8?B?U3NoUVhwNjhhUElSNjJLWHhuaVdyUG1ML2Y4Mm5COWJVL2l3Y3l3eDlyYzJY?=
 =?utf-8?B?eWY4VUtGdzRuV2plaE01SUhTQzZOTTQraTBIaEY5cW1ZMXRKa1FySHlMMWx6?=
 =?utf-8?B?cXg4SzFRMWp3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P190MB1980.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHB4SFJ4TmR5Mi9BWCs0OTNXbUhzSWpMV2grd0hNMnh0ak0vQTNkUTJpdWph?=
 =?utf-8?B?RWsvT1BVMmN2NzQvRVUvVGcvcHR4bzFRSzcrenMyRm4zWllrVGExYmZ2WWtj?=
 =?utf-8?B?dDNUa1FhS1JHZEMwK1laYVRnN2VvZGFGUjg1NjM3OVp2MXhEYXhoU0k3dHdN?=
 =?utf-8?B?NXoxVDFGcUtNLzNoZ0UvYXdiODdSZDA2OENlRFRndnpuYXgybGRMazJoSUlJ?=
 =?utf-8?B?YlQ4eXMrRlEvbFpTVFkvdi9rUzF4WGRLUVpGS3A1YmtTVE85QWdyNUlwSjVM?=
 =?utf-8?B?aERDSjhXam04UTNROE15cmcxd3VQa0VzWkJKcy90RFV1V1NjdW9NUFlpMGhK?=
 =?utf-8?B?VTBrZHUzRmRrY3dzV2pQVXJJMUEzNElGUkJxaFR6d1BQblNmZmxrUzczZ1Jo?=
 =?utf-8?B?YzJiRjl6TWl2ZU5weVg2d3NjNFRZTzFyb0xEay82SUZxT0VjZmxvc2NYTDJn?=
 =?utf-8?B?aXRqSzV5QVlyUTFyL2JiNXFlOGFzajA2cHJPQ0tJVFpDUmwxRGdiRDN1WXgw?=
 =?utf-8?B?dVhCRnluOVlIVlRvVzJJME50dERUODZKUkxXYmlNRkZlUXRmeUl2d0pCNkZR?=
 =?utf-8?B?SGNtRmFJWmJrT1FwQ1c4MURFZkFuSUtmeHJsTXFXYlM5V1NKYlVFTno0S0VI?=
 =?utf-8?B?aTkrWFN5RkdEbFlCdjA2VlRFV3I4L1V5UjR1Y29sWGJEZmxWQi9PcTlla3dR?=
 =?utf-8?B?VWNaTmJCV1UxYlA4Mkk1d0hpR1dkekFMK0FVWDNvTTBPdVJ5Umk3eWkvb3Nk?=
 =?utf-8?B?WEFyeW1TdGlZcXZWcTdkMElDTkI3dU9EdW5aS3FibTVWU2VheURGRS8vVGJo?=
 =?utf-8?B?N2pZd1pUNzAycGpMdFV2d29BSjZGdktmTjBpUEw1Q1lrcTlBQWdRMU1Ub01Y?=
 =?utf-8?B?MzN2eE84NWgzL2wyQ3pUMC84aDBLSnp4ZTIwYUIwNlpza0Y1WHhGeG9RakpM?=
 =?utf-8?B?T0lpN1haeHRSNWZ0MG55NmtBcGhPTTRUVmZUMjVxMGhaUWVuOUJLRWhpZTRy?=
 =?utf-8?B?UEI3alIydkpDSmtIK05LOXZGazZCNDNmTGRweXl0Rllycm9EemNLQS92UHdG?=
 =?utf-8?B?c1RuSzZxajUrTjVoNk1IQzM5bzc1eEIvOHhxb2gvaTQzREtKOSs4ZmFpVDN2?=
 =?utf-8?B?SWVJRFUvYTNadXBqQjRXVi9ZZE9Jc285UjJqZFJ6MlRCMlMrM28yenAxaFJz?=
 =?utf-8?B?REdvK0xDQThBY3JKUWlORHpsWjlGTCttMUlSRVo0aEtYZHFNTjJTdWQ4UmJx?=
 =?utf-8?B?L3IzYTJObHdHZGp1WUNSK0VENVIwcTJOTEZwSEtuVEJOdStONHpzS0k0T25X?=
 =?utf-8?B?Wk9vMWlFYUh1bHJBL0dhd3llS2ZWajJvYThhSVJzbzhPRW9JU3ZQQnA4REk0?=
 =?utf-8?B?NWpWR1lpeFpzZ0l1TDB2emVkTjFoblJ2R2dMSG1TRDlYcFlLR1hrWkQxV2Rl?=
 =?utf-8?B?OGNpSk90OEYrQU1PTkdPcUFuZkdmTE1aWGczcktnSzl6V2VJd2l3eDVETThZ?=
 =?utf-8?B?ZE8xNzgyMjNNenJJemlqTS9NbGpCK3huT1pHRkVjeGhOaGxMd0hPR0VrcUts?=
 =?utf-8?B?UW9sZytta1p0VWZLODBWdlB4cWVibWI5eDZvMTlzSEZLODVFRW5ibk5NYnUr?=
 =?utf-8?B?dEtMVEJXeDFubkVlYkhsOHN5Y0xFcEg4QnJNZ1RMMzQ5U29ucldRaG5mK1JW?=
 =?utf-8?B?cnF2WU5UOXk2VE9VdHFkMVFVb3cySnZrUnlYN1ZyR0xkRG5mSnBJb2Fsb2o3?=
 =?utf-8?B?em1ZcEQ5R3ZqMnRwSWdsd3BsRk5rc3FDOC9mWFgyYkJHT0FIQTRIUHoxY2x5?=
 =?utf-8?B?SEZRYkhNamZKVDdYT1pLUkx0NllaSm40Wm5HODRwMmZhUTdaV0VQbS9VdXI5?=
 =?utf-8?B?TkF5QXhKSVNXUlV1WXRYNG5QNW5BM01pQnFQKzQvMFgxeHZNNW9kY1R5eHdJ?=
 =?utf-8?B?T0hzWEE5YjBTN1ZOT1VVNlU3TW5oSTM1WDRBbHpCcm8zOCtocVZySm1UVVpW?=
 =?utf-8?B?ZVNOd2x4Q09XNTVIM0IvSVlYZnlUblUyR2cyaDBBRW9rWUJ1ZmZMTlpCVWJx?=
 =?utf-8?B?Qnp2dWhrWUk4SXhmcmhZUTJGV0hIOERSaGl0UkgrQmozbUJnOThuZzFnZHkz?=
 =?utf-8?Q?M0cehxpVvaJWdhchWvy3i+5EB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: exodigo.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB1980.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d243e77-db2c-4631-cb56-08dd8d3338e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 06:48:49.3510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da061ec7-6389-4987-be6b-51c45283828e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8o4G+2tim8Miib0xx/td1Z0/ykcHBAjQ5zF2NXlYf2uVy/md6ltxMzgjTbQPoXbZfGT4U1bnEnVK0G6FbVYh3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P190MB2222

SGkNCnNvcnJ5IGZvciBib3RoIHRoZSBjb25mdXNpb24gYW5kIHRoZSBsYXRlIHJlc3BvbnNlLiBJ
dCBzZWVtcyB0aGF0IHRoZSBjcmFzaCByZWFsbHkgZ29uZS4NCkkgc3RpbGwgc2VlIHNvbWUgbG9n
cyByZWxhdGVkIHRvIEFDUEkgZXJyb3JzLCBidXQgdGhlIGNyYXNoIGRvZXNuJ3Qgc2VlbSB0byBi
ZSBhbiBpc3N1ZSBhbnltb3JlLg0KKGV4YW1wbGU6IFsgICAgMC4yOTg3MTJdIEFDUEkgQklPUyBF
cnJvciAoYnVnKTogQ291bGQgbm90IHJlc29sdmUgc3ltYm9sIFtcX1NCLkJJTkQuX1NUQS5JVUJF
XSwgQUVfTk9UX0ZPVU5EICgyMDI0MDgyNy9wc2FyZ3MtMzMyKSkNCg0KTWFueSB0aGFua3MgZm9y
IHlvdXIgaGVscCENCkFzYWYuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFR1ZXNkYXksIDYg
TWF5IDIwMjUgMTg6MjgNClRvOiBBc2FmIEthbXBmIDxhc2FmLmthbXBmQGV4b2RpZ28uYWk+DQpD
YzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgaGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVs
LmNvbTsgYWxvbi5iYXJsZXZAZ2FtaWwuY29tOyBZb2F2IERlcm1hbiA8eW9hdi5kZXJtYW5AZXhv
ZGlnby5haT4NClN1YmplY3Q6IFJlOiB1Y3NpX2FjcGk6IGNyYXNoIHVjc2lfcmVzZXRfcHBtIFt0
eXBlY191Y3NpXQ0KDQpbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KT24gVHVlLCBNYXkgMDYs
IDIwMjUgYXQgMDI6NDQ6MDhQTSArMDAwMCwgQXNhZiBLYW1wZiB3cm90ZToNCj4gVXBkYXRlZCB0
aGUga2VybmVsIHRvIExpbnV4IHZlcnNpb24gNi4xNC40LTA2MTQwNC1nZW5lcmljICAtIHRoZSBp
c3N1ZSBwZXJzaXN0Lg0KDQpJIGRvIG5vdCBzZWUgYSBjcmFzaCBpbiB5b3VyIG91dHB1dCBvbiB0
aGlzIGtlcm5lbCwgc28gYXJlIHlvdSBzdXJlIGl0J3Mgbm90IHdvcmtpbmcgcHJvcGVybHkgbm93
Pw0KDQpjb25mdXNlZCwNCg0KZ3JlZyBrLWgNCg==

