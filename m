Return-Path: <linux-usb+bounces-31521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B22CC57B1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB1DE30819E5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 23:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4415933FE1F;
	Tue, 16 Dec 2025 23:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="agK/Ksu0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AHbN54Xu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JhYDDjGS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA333FE18;
	Tue, 16 Dec 2025 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927656; cv=fail; b=iGY9sff7siPTgHwqoeb9i9aqTjobvLqEQlpKcBsVAJhK192WvchBat4AEE+75i4q+0Erhi6lX2XcqtGsZgrjgmEZiOjwbwFVVVjuBqZ1ciz7fGCEiyilvwtm+7ieYB9MzvsQwfK5E82rPLgB+Gl4/ddlcvFWvjDlGpk2EEzzdwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927656; c=relaxed/simple;
	bh=8oYpSfWkFvnY9V7zRGtaM65dxLY23MuxVkrn4Grw40k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m9wBy1rxV3aXPX/CSdca03cam7Vl668evXccQnDaPBv/g4o0u8vLssTxWkU21f/7qgOEv25wIQat9xFgtVrGQBdM5P1RunTt9C+ptOiSF/cVO6fgjtwXAMkIo6wA6zpEqyDgLE6C4xbtQL19su6Si3TtSLOBmTBPg2lwHAtHnhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=agK/Ksu0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AHbN54Xu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JhYDDjGS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGLj8Qb2216854;
	Tue, 16 Dec 2025 15:26:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8oYpSfWkFvnY9V7zRGtaM65dxLY23MuxVkrn4Grw40k=; b=
	agK/Ksu06uCygc6XcbK/VdKDdk2XCzZFVfp2PAGq/uwqx9+v3M/D/FR0pN4yLyIS
	H/6EeOa2L2nKnsy/06dnnI1n+NudXp8CUoO5rFiPRd12zbNvis5NVs0up3x05f0U
	AcwZ4vMSQx+6fS0C7ovUh3TUfqjiqKUd85LSFoGFcJLI3tflnbGG15Z2nWSCXlTI
	OdEm2AntBJn+lQWP1+8M4ekN+V34jYp4iE1JNkusFb5ce2JMcHeP2oNUU0YkDrfK
	L8lQl1xaCVK6vco2P3YXWEkIZizgHv4PG60WN6s97WANh+gNTIAmUfr5vgZsNUkr
	c9EowNeFO5g0Wl1P5saP1Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4b2vjudejx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1765927607; bh=8oYpSfWkFvnY9V7zRGtaM65dxLY23MuxVkrn4Grw40k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AHbN54XuGvPsjbqjUv5N4HGHIb3g/OUTsnGEgMfLqCvG76rLg9WuOOF+C/MOMr7wC
	 Z/FjNyOVT2A+brLBQKyr1mAJUD9qITms/LdHJmV+ANvj62mpLYSb+OxA8sEpEhJ55X
	 jE8CLyV+9V7bHYguoj0wMyk4wYQvW11kpRQu5Lw25a9jS206IZfqfmK2FxVdtZT9LY
	 uBnlchhEpqPW+at23MWfwodNa8qyevxZqfYA8K3MmQuQK3MOOnW18CBYylpyNRBkAC
	 OFoXcmwozFkIeozuHr6od/e5xzGJOVc3Gst75wo5v26wVQlNBSPRpfP77XcbO/O5Fp
	 ndHsOKHGMEygQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2A482401F5;
	Tue, 16 Dec 2025 23:26:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EE34BA005D;
	Tue, 16 Dec 2025 23:26:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JhYDDjGS;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00100.outbound.protection.outlook.com [40.93.10.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2F75A22025B;
	Tue, 16 Dec 2025 23:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMDfUk/r2CUEPX8FTKvxK4ilqJg0Fgj7+deasXpx2Wt998mV/N3iR5nMa4IML9MtF25AmDo4+ic4gIW5UsfXOOME3yCnrTe/S1Bvn+G4M+wID+pi0+WyeQMn1nH4zczvHiDNtRKuXZKbllbjf0axohj7Say+7YjLJ8+gLLKDr9EsPNcwZC7iQ1u63+LFtAEOFxJlipOQcrsb+ZZkwE7mlDagTwHK7qWOrt4bEVrnxa28eNrNzFQxcVFMMIoiHz/ylEp5/DG9wCprercqkUpBvUqUHbPwKH0FyVxHFG4/fG9Ab+fbadohG4JGdz4qLy63LiXfC8KZgd8xePnTNgTAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oYpSfWkFvnY9V7zRGtaM65dxLY23MuxVkrn4Grw40k=;
 b=gJDZD+Id6XxPg4zecnGkJdbjtierVYTp3smbgmI8Fj8Fr3JFErIuTp53RQ+G7Q+NaGyOVzoCWMxCxOH1JOMRmK++MXfYXtRBUJekX4BVLv3FhulC5URpkebWnKkYNAELo35B7zj7qjvLVw9G3cTOd6uW9dZpWqmYBDgqfyMzEYZmY9HHksqBBiwPw8KLrkVD74kbAsmbEnr7xo7N3yxVJUiJq6sXW+IDphXV/6vJz7ulyI1YHNmRv8vLx7rKexqaIUwpb3EjRHhMvS9h6N78LZG/ofm6AzGqbpNvRtsKzhsxr7op/Tt8Jnn041LzkN7HcahEvXbvSIDFx3M0i/tLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oYpSfWkFvnY9V7zRGtaM65dxLY23MuxVkrn4Grw40k=;
 b=JhYDDjGSN8LOxboYWZ1BTc/Jgv1tBWjKsoEkc/MQ4mU3TZWQ1MnNjJ6iX+KEdSNM+IwNSp1alQO7HpPYUi1PaPZwpCLMO1ryZzu8DD/i6dP8GeIRlkU3fNbk671QRYSTvUf0Q81LSiXnkEMF4ZnnKpmQLV9luDwu/SnY1BeKLSg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:26:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:26:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Topic: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Index: AQHcZZdMlQ8G7roFm0ec5/UZ4PaAXbUk+6sA
Date: Tue, 16 Dec 2025 23:26:40 +0000
Message-ID: <20251216232638.rglecm3op6qit5a5@synopsys.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
 <20251205032942.2259671-3-xu.yang_2@nxp.com>
In-Reply-To: <20251205032942.2259671-3-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6531:EE_
x-ms-office365-filtering-correlation-id: 581d9568-3a0e-49c3-fb47-08de3cfa90cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXB2RWM5OWsrbWtaeit2MlR1Y0pvOXIyNXQwRHJVZzF4MkpXNU9CaCtLOGNu?=
 =?utf-8?B?eGErRTMyeCtsNGtuOG9pVW1ac01yTWFvcWR6S2ZOYnlhNXRFcTkwRy92amo5?=
 =?utf-8?B?d0dxVHk5ZUFKbGFDbUNnSFF1UlpSaUhqWTlWL01Td1lkbVhXbFJVVldwQWVa?=
 =?utf-8?B?WUtBNldkeHduUndXVHh3TGZ0ZVdqSW9GeDVveUFBSXZNVUJWcXVEbHdmVEsw?=
 =?utf-8?B?K3JYZi9rR1YyclBlMTh4ZnMwZDdNMTg4cnVZS2J5UjZWamdRKytBYnI5V2ZJ?=
 =?utf-8?B?NkRHNXlieVdjR1pxWExIZ090UjhTZ0Y0R0ZQUWZocTlDM1ZMV2RLZlhCNGVJ?=
 =?utf-8?B?RVNJQ0p1VjlLOTY5cXJKTklZWldlSHV4NE42NzI1U29VcW5UZjMzZEltK2Q1?=
 =?utf-8?B?aW03SEo0VFdhWjhkUWxvKzR2bjZqeWpDSEVPZHZ2WnZDZFVnQ0xBOThVeVZi?=
 =?utf-8?B?NEtFaW91TGh2clFkQ3NYditnNGVvSUc3aHpBVVlENnpJQzVUdVQ0a3BjTGV2?=
 =?utf-8?B?TmhGdFJhMGxrVVdkUnlWbE5haW9FWGVDOU16YXZTTGJCYUtvMkxyRUxGblJx?=
 =?utf-8?B?ZHZQK1FyWGlkQVVZc0g0bU9STjhrU0FoenViRFdmTng2VXpqVlVHUWRJRzlH?=
 =?utf-8?B?NWcrUW0zdlozUUJ5cTJTRzdxZmFxUzFmOGNIejB1dmhUams3N0xUSDUvcEdw?=
 =?utf-8?B?MFRNOVlVUXF1cXF3YWhRbXVMV29lVzA0aWhWdHdkeTJoWXN6Z0QrQkNxRXlS?=
 =?utf-8?B?clBVcHVud044R3BaWEd3ZFJjZllDbndWb2VFRTdmUXBXV3VxVUxLWC82Zmsx?=
 =?utf-8?B?aVBMd2FvL1hUenRCMTYzYm9ld2krYUxWaGNVN0l2WTduNFF5Tys0MFBGZUl1?=
 =?utf-8?B?cjBGVGtNV1VGVUp0YXpkVXhmT1FRc2VyY0lPcThiYTJDMERWRlQ1R3BzV1hK?=
 =?utf-8?B?VVc4bVZBcDlObEtmYXJkQVNnYnl0SU13SllkeWdRZ2VmM09xcm45MjVkVms2?=
 =?utf-8?B?bCtMZjJkZWtWVmNQZE52RTVyaERkNGx2MTQvQ0tOMysxakxhb3JBQ1dLRXlJ?=
 =?utf-8?B?T2hhRGJGQ3BoSi9ES0ttRWZURXdDWW16MkI4RFFBcUx4ZjB1SEE4djV2WFFE?=
 =?utf-8?B?dFVEL2VaWjBtSDh2Q3RQZ3dLVmY0M0FYeHZCeUVmM1l2cUY5bTdTdlZEWDdu?=
 =?utf-8?B?T2JUMW1talZtRFZFUkJEcnI4TzhXMVhDQjRTZ0dvZnNDR1pxbDdMTHZ2NFBm?=
 =?utf-8?B?d00wMzNBdnorNXpVZUxYTGo3akkzSXc5MStMdXFsM1NoczlTVUZPRGYyME11?=
 =?utf-8?B?OVh2b1ZqcGY4cUVMYkdpRzhJSlpqVTExWXY3Y1c3RVBVekxYT1FOaERmTEk5?=
 =?utf-8?B?a2RHN2dTUUNyamdETXo5RGJpYU9ib2N4N1pUcU9hcERjeHlHVml1d3ljTGx3?=
 =?utf-8?B?ZjJhNi9wcUJLaTVGamIyOE9ScW01SkJyS0x1eGZ0WU9ucUIvaW9Bbm10c0h1?=
 =?utf-8?B?MTUvKzFzUUp2SFU3UUcrZmFjTXVUTndoMnZPZ1QvTzlFWm5FbHJFR1czb0pP?=
 =?utf-8?B?MFlLeXpkYTYvZkNxd0NpR1lyUlF6WkFZdTZqZjRycHFQYlBYbXlVaU9kUllr?=
 =?utf-8?B?MU8vUDNjT3Q2S25vOXJCQ3p4Nlp6RXd3bklDc3NncUVMd1NNa3pUb3JKWkg0?=
 =?utf-8?B?anZlZnBpUEpSNWd4SnFGdFYwTm1aMmxpMm1rVVBmajRWUVZUNHc2UE1GRnRw?=
 =?utf-8?B?QnJNVDJTT0tyMkNqSjgrc25LZ3UwY2VWSFBaZU9lODY5eWxtbWVmcnpvZmlD?=
 =?utf-8?B?ZVZLV2NScVZ3KzVxeWJYWEdXUlVCRG9OY2h1S2VYOXlkelpnQ25OZnJyMGhq?=
 =?utf-8?B?TjNHQXhla0UyS1FGVnJCL0JpejRqU2dRNlFIVzRFZlRnNmd5VytWRVhxejdB?=
 =?utf-8?B?dno5TmJkdDI3TU96NmQzLzZBVXJ4cVdVUjUzZEhQZ3NaMFJLcEp3Z2NPYmNV?=
 =?utf-8?B?amVLSlVIOXBjaHNhejMzalhzWkl3ZHNTRGZpSUxrOGdIWG5JbXJLZ1FjMG5L?=
 =?utf-8?Q?c4JV9V?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUhlQW9vbFMzUTM0WGZYQW1IaHhjNCtlU0xNakN4U1NrQWxxOFZPMmszUnF3?=
 =?utf-8?B?c3JqaVRpaWxxRmkzdGRIOEtPL3pGTlllWHJuNzEyYlpCbGdkT0owR3ZndC85?=
 =?utf-8?B?bFYzR21KdUNQWURXMzJWTWJXVGlnN1orVW44L2FyTVFYanp5dVJzMEhsU3ZP?=
 =?utf-8?B?TnhkdHBjMUJnYTR5alZHcno3Wk12S0FzNk8vd3BTekhRbzZ4ZHQ5Z0JVc3M4?=
 =?utf-8?B?OEFCSmxLN0prL3E4SDNRMVVBeWxXV3ZaNkpMeWRUcmpiTFJVS3BPV2VqQWVi?=
 =?utf-8?B?aTYwR2N3ZmtuRjFoMXVELzRybVJ6MHpzUUVXZlg2MENXdmQzbGRZRjI4R0ZQ?=
 =?utf-8?B?MTMyTy83Q0ZXemllbFdCVDJyUDM3SHg4KzBhWU03WXAyOTE2bEhMMk85amMx?=
 =?utf-8?B?RTRCSERXRkJGaE14YUtxVFg3aVVMQXA0UmJoRy91bks0cnB2aGswdkF5NWhx?=
 =?utf-8?B?Q1lFU0c3NERBWUh6WmYrL2w1NFFiZGxleHMwYXVESHd4UHRkUkQvR05HemF3?=
 =?utf-8?B?V3NCRlZWZWZnUTJuNE5WaVhsZ29aK1VRY2Z3eFFTblpLVkRnNTNhSjRkZ3p6?=
 =?utf-8?B?bVp3ekROK1FLeE9NbXFLWFhrelpZUmJnaG1RUWovb3doZGNnZnlEQ1NJUk55?=
 =?utf-8?B?cm5HVGh6MEFpbHVjejkxZnluTnlRc0psWmI1dFRITE1ZRlZBdVVlTVBhRDFq?=
 =?utf-8?B?SjlPSjErM24zeXhXcHA1VWpJSm9QZEhuUUUrVnZLSHJ1VTA1OEJ4OUd0Vks4?=
 =?utf-8?B?OUdSSHNmRDhFU1J2VHEybXR6ZWxiWmdaY1RadmorRXgxaDdXM2hpaEdsM3JH?=
 =?utf-8?B?NzdHbDNKM3o3K2JkcElHQTRjYmN6S0R5RUs1NlpXNWpzUXRaTXptTnUwS1Q2?=
 =?utf-8?B?S3FaTXhPYjBoMEFDVWJnaUhIbFdqU3R0eFFlZkJ3YloySUh0OFFqWGlnYy9C?=
 =?utf-8?B?bWhZbFVDaFduR0dZOUtoWnhtL0FzTFlhUFhOdkEyUG5vTmlOdnlvYUNnNUZY?=
 =?utf-8?B?T3ZRMXFKM2ZGSkc2bnRzeEgwNzArcis4TXVOVzBERjJHN1Q0Z2hIYVlQa2po?=
 =?utf-8?B?ajhnRnNGalROQWozTVNBaHVCUllHc0FxZE5iRnZVbHNzV1FDMzhGYllzNVdD?=
 =?utf-8?B?cWxkR2tJWVdjaFZ6cDFFWlBOdUhSUlNXTmp6M1piV2t2blRLNU9OUEVUd0N6?=
 =?utf-8?B?WXh5NE5VeUVSdzlNUkVwVUtTanp0STlyazFtN3V0VytHRFRUQm1sQ2k0OHhp?=
 =?utf-8?B?eHNGL1RuU0NWeGpmL3ZaL0RpQkxVSVUrNXdaT1l1MEd6d3dKRGZGK0ZPTE4w?=
 =?utf-8?B?cWtTdVFMeXBWQThpWEd6d3NOblRzZ0xDMzBCNXJWa2RLc1Z1TVR5SGNLWnA1?=
 =?utf-8?B?SFlqU3BXd1dERkdTeU84RDVCVHdQN1V0WGo3MjloOWd5ZmNkekt6d3JnUHBx?=
 =?utf-8?B?ZTBtV3VSSDIyT0JtOXBwemNGR1J4UG5MU3R1NjhWS2NmNk1oNDJKbHI3QmZv?=
 =?utf-8?B?UGRtbEJtOU1leGc4ditteDNZdW9tNW00VWtOM3Rta1lUQjVjRFZMamk5V0E3?=
 =?utf-8?B?YlRiMGMzbXh1bUU4YzBFSllFbldtMEhKdlJ3TE5EdHdWNVJTeTk1MGdjeWZF?=
 =?utf-8?B?RFNocW5XV29MTmVlM0o4RUdaQTZQdHZycmVaTmR5WUFhRmtIOFJEZ1cvVUVH?=
 =?utf-8?B?K0VsVzR2Q3drUTMxalBxSDBIRkZtNE02MUVIRVIyUmRaVVNpUHhMYWx2Mklk?=
 =?utf-8?B?b3g4c2l4TVF4OUM0TXFReGkydFdCTFZvNGNzWHk5RW9vLzAyS2hsMEZMcmcr?=
 =?utf-8?B?TzJjV24vSWJlbTVQVElRNHZNTFFOMjhCa2JNdWs5Y3B3L1owUlBZd0tUM3pt?=
 =?utf-8?B?VDVWWlFROWpSTStrZmtLYngxaXFPOU9KUTd2cnRSNjdUL3p4Uko0cXZDNzRn?=
 =?utf-8?B?NmhhNmtGaWg4QjNNWWE4NG8xMHZ1MFgvSXdkMlYzTmlRRjdmKzNSMlBQc0s5?=
 =?utf-8?B?VG9xQVFkeEczdXJib0dpYnRRVm1Sc1ZoN0dMbkZLMENOQnN3b1BrOWpJaWJr?=
 =?utf-8?B?Y1RwTUxRaDZtSlpFVWdqUkwyMDVoS1UyTXpJdDRlVDJ4V0lqODZ5blYxekkz?=
 =?utf-8?B?c2orNnhKdjFhRXUrNjZBTC9hK0FzMGNlOWw3NEdEZFdsNDRuVzF6SnUvNHBQ?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4B0F0841F15BE48BE1E01F4EF667DA9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AI+H+TDX1tR2s5b3UhSUOWouLDQQJN2smnImWxH6z+JyrXQ44sSWhF8r2skOmShH+Vcxgh24BmVlp79it20FgMFpUC4mF8yJHi40eWQJPJcvGWRku+6h0tFIPMQoxdkY1bxjHv8ad2GuxD0w50VC4SFeZP/b0ANH5rzERW725BK9/7thZPxlPnrnxj9+6HZNHN3DsBnwhWZiPu5H+Xi6WYNt6RiQAu5px+sz5kUrigBi3f1tAJ5egIWcNxmS2VYRo+Js5lPcwpExYHcWljP7OLBIfMkywgbB9E7GzscPDQSCoxoi3Lp7w8JlnZl9qN0oDxsjEPV7NXRTzuHfggjtLygiW4zq07Aturj7dqD6s93eEItMd59kKknl+mLg6g7aLbi5MsCzVqn0iu08k5drQpsnKnx8dI2iOuAYAjrGmiUAfzN9JJL6LK48mPwzF0bHWTAB5BFnCL4RbZcsQs4hX2MPGBdwAaR4xpIS625px3DQyKLhg0qysWwp7Gw8G9iCu9GYxcaVQO+mpDrClSblIPoL4g2fvWtXkMO/BOclDh1CyP37T4ehynaemTok+WwfPZU+RYJ6vnk/WO532mpm5ERXzd8EQhi3dqlt8JdqpgSzuUc2+LZC+s7C6muVRWLxdwTVLM4VSJ3xLxu42ifrnQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581d9568-3a0e-49c3-fb47-08de3cfa90cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:26:40.1987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HraXrkUt2nDSdlXhWmVE6xrF+8VKzu5f5aSN7ZL1tvcdylm6kISyOQ76JjxTk0B3UzaflrwSPy5gkhU+YAndFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
X-Proofpoint-GUID: fZzkBRb2G5dnTBxHLjy-c1WkE_Z-4b4x
X-Authority-Analysis: v=2.4 cv=Ka7fcAYD c=1 sm=1 tr=0 ts=6941eab8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8
 a=sZdw91-ZnYqtZg0vZakA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE5OCBTYWx0ZWRfX4O9gIrx2tL0p
 OWGmBEPj6z0Zy12g6+cqDOPy2a5F24B1xWJM4sBatep9lP/J1gQ9wf1lpx90SuGm3MiUAiFjHqR
 E3I6OMFXGbkC/KG2HVtnOA8zn0xN6uUM1z8Bb10OI5HyyftSYah98U3+w9QqWdZwjFCtnmU8CD/
 cpZKT/o3azjCYLrOo1bGOqv6iPQcAz64f2zY+QEs1fWOy2VmeFjSNAnhc4vvf0thGzNzG03+sdL
 KWMOdVt+wS6+rrKTTlL1lX8NfoCEYfrIs5haeo5r+zqByUrtD9FTZaEcvPFV7Xu2Bl22vkjigGu
 Llona5mjTer1gfuHbVOcGHmqoRXoZMIbL+X04wdla0lLlfKpaLQpVQJbqfxW3BjmoJd3FJAVVXJ
 3UrQo7wfIaOxHzceHjvO8bkBU2b39A==
X-Proofpoint-ORIG-GUID: fZzkBRb2G5dnTBxHLjy-c1WkE_Z-4b4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512160198

T24gRnJpLCBEZWMgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IERvIGR3YzMgY29yZSBhdXRv
IHN1c3BlbmQgZW5hYmxlIGZvciBkZXZpY2UgYW5kIGRpc2FibGUgZm9yIGhvc3QNCj4gLCB0aGlz
IGNhbiBtYWtlIHN1cmUgZHdjMyBjb3JlIGRldmljZSBhdXRvIHN1c3BlbmQgc2V0dGluZyBpcw0K
PiBjb3JyZWN0IGFsbCB0aGUgdGltZSwgdGhlIGJhY2tncm91bmQgb2YgZGlzYWJsZSBkd2MzIGNv
cmUgZGV2aWNlDQo+IGF1dG8gc3VzcGVuZCBpcyB0byBtYWtlIGl0cyBwYXJlbnQgZGV2aWNlIHN1
c3BlbmQgaW1tZWRpYXRlbHkNCj4gKHNvIHdha2V1cCBlbmFibGUgY2FuIGJlIGVuYWJsZWQpIGFm
dGVyIHhoY2ktcGxhdCBkZXZpY2Ugc3VzcGVuZGVkLA0KPiBmb3IgZGV2aWNlIG1vZGUsIHdlIGtl
ZXAgdGhlIGR3YzMgY29yZSBkZXZpY2UgYXV0byBzdXNwZW5kIGlzIHRvDQo+IGdpdmUgc29tZSB3
YWl0IGZvciBnYWRnZXQgdG8gYmUgZW51bWVyYXRlZC4NCj4gDQo+IE5vdGU6IEl0J3MgYSB0ZW1w
b3Jhcnkgc29sdXRpb24gdW50aWwgd2Ugc3dpdGNoIHRvIHVzaW5nIHRoZSBuZXcNCj4gICAgICAg
ZmxhdHRlbiBtb2RlbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBu
eHAuY29tPg0KPiANCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAtIGFkZCBhIG5vdGUgc3Vn
Z2VzdGVkIGJ5IFRoaW5oDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5j
IHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtaW14OG1wLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gaW5kZXggOGJl
Y2U0YmFlY2JmLi4yZTEzY2E1ODhmNDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4g
QEAgLTE1OCwxMSArMTU4LDMxIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX2lteDhtcF9pbnRl
cnJ1cHQoaW50IGlycSwgdm9pZCAqX2R3YzNfaW14KQ0KPiAgCXJldHVybiBJUlFfSEFORExFRDsN
Cj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZHdjM19pbXhfcHJlX3NldF9yb2xlKHN0cnVjdCBk
d2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSkNCj4gK3sNCj4gKwlpZiAocm9sZSA9PSBVU0Jf
Uk9MRV9IT1NUKQ0KPiArCQkvKg0KPiArCQkgKiBGb3IgeGhjaSBob3N0LCB3ZSBuZWVkIGRpc2Fi
bGUgZHdjIGNvcmUgYXV0bw0KPiArCQkgKiBzdXNwZW5kLCBiZWNhdXNlIGR1cmluZyB0aGlzIGF1
dG8gc3VzcGVuZCBkZWxheSg1cyksDQo+ICsJCSAqIHhoY2kgaG9zdCBSVU5fU1RPUCBpcyBjbGVh
cmVkIGFuZCB3YWtldXAgaXMgbm90DQo+ICsJCSAqIGVuYWJsZWQsIGlmIGRldmljZSBpcyBpbnNl
cnRlZCwgeGhjaSBob3N0IGNhbid0DQo+ICsJCSAqIHJlc3BvbnNlIHRoZSBjb25uZWN0aW9uLg0K
PiArCQkgKi8NCj4gKwkJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZChkd2MtPmRldik7
DQoNCkFzIG5vdGVkIHByZXZpb3VzbHksIGRvbid0IHdlIG5lZWQgdG8gdW53aW5kIHRoaXMgaW4g
ZHdjM19pbXg4bXBfcmVtb3ZlDQppZiB0aGUgY3VycmVudCBtb2RlIGRldmljZT8NCg0KPiArCWVs
c2UNCj4gKwkJcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoZHdjLT5kZXYpOw0KPiArfQ0KPiAr
DQo+ICtzdHJ1Y3QgZHdjM19nbHVlX29wcyBkd2MzX2lteF9nbHVlX29wcyA9IHsNCj4gKwkucHJl
X3NldF9yb2xlICAgPSBkd2MzX2lteF9wcmVfc2V0X3JvbGUsDQo+ICt9Ow0KPiArDQo+ICBzdGF0
aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICB7DQo+ICAJc3RydWN0IGRldmljZQkJKmRldiA9ICZwZGV2LT5kZXY7DQo+ICAJc3RydWN0IGRl
dmljZV9ub2RlCSpub2RlID0gZGV2LT5vZl9ub2RlOw0KPiAgCXN0cnVjdCBkd2MzX2lteDhtcAkq
ZHdjM19pbXg7DQo+ICsJc3RydWN0IGR3YzMJCSpkd2MzOw0KPiAgCXN0cnVjdCByZXNvdXJjZQkJ
KnJlczsNCj4gIAlpbnQJCQllcnIsIGlycTsNCj4gIA0KPiBAQCAtMjQwLDYgKzI2MCwxNyBAQCBz
dGF0aWMgaW50IGR3YzNfaW14OG1wX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICAJCWdvdG8gZGVwb3B1bGF0ZTsNCj4gIAl9DQo+ICANCj4gKwlkd2MzID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEoZHdjM19pbXgtPmR3YzNfcGRldik7DQo+ICsJaWYgKCFkd2MzKSB7DQo+ICsJ
CWVyciA9IGRldl9lcnJfcHJvYmUoZGV2LCAtRVBST0JFX0RFRkVSLCAiZmFpbGVkIHRvIGdldCBk
d2MzIHBsYXRmb3JtIGRhdGFcbiIpOw0KPiArCQlnb3RvIGRlcG9wdWxhdGU7DQo+ICsJfQ0KPiAr
DQo+ICsJZHdjMy0+Z2x1ZV9vcHMgPSAmZHdjM19pbXhfZ2x1ZV9vcHM7DQo+ICsNCj4gKwlpZiAo
ZHdjMy0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9IT1NUKQ0KPiArCQlwbV9ydW50aW1lX2RvbnRf
dXNlX2F1dG9zdXNwZW5kKGR3YzMtPmRldik7DQo+ICsNCj4gIAllcnIgPSBkZXZtX3JlcXVlc3Rf
dGhyZWFkZWRfaXJxKGRldiwgaXJxLCBOVUxMLCBkd2MzX2lteDhtcF9pbnRlcnJ1cHQsDQo+ICAJ
CQkJCUlSUUZfT05FU0hPVCwgZGV2X25hbWUoZGV2KSwgZHdjM19pbXgpOw0KPiAgCWlmIChlcnIp
IHsNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KVGhlIHF1ZXN0aW9uIGFib3ZlIGlzIHRyaXZpYWwu
IFlvdSBjYW4gYWRkIHRoaXMgaW4gdjM6DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

