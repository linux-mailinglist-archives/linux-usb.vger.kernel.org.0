Return-Path: <linux-usb+bounces-31941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B4CF5A54
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 22:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D6B33130F0A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 21:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05BA2DBF75;
	Mon,  5 Jan 2026 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="s0hklrhl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lSXQtUUr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aq7W16O4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50071285CA7;
	Mon,  5 Jan 2026 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767647804; cv=fail; b=LELqG9m8bFZjTza2SrpjPQGRGzrdLUhmSbbWvXlt2TmtMnXmpZoCdpXWO+SgBgTEt8KEe79jS42Mn62vkfmXXX5Z5Ev6jZpF7vSWF8jBmxY5ro8X5uUowLng3TRd70KQ+fkOR9fLj95PbdovmpvHNIaps+VIlotGma72Z6++e7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767647804; c=relaxed/simple;
	bh=KlCEJmAcKASOXhuLyoncD4UzC86ZUvwAhqGFWk4ayAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5AZnbxSgmT882QQzfuX7FmOq2vAV5zWkCsMnzxmMCMbYwVmsxYyXlcQiN+BOe6YZKmorOiBW6h46o9zl+w8yole8BzVVFAwAGq1yddEV5aqy9gyYxz16XVYG431Tb0RTc422fgfx5wDA8mU7Rfms1ZKPkvngXgXjq6KBE2Od0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=unknown smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=s0hklrhl; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lSXQtUUr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aq7W16O4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605JWP3o2490057;
	Mon, 5 Jan 2026 13:16:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=KlCEJmAcKASOXhuLyoncD4UzC86ZUvwAhqGFWk4ayAM=; b=
	s0hklrhlMKQLWNpRptKVzbY3c9dT+ExDHOzPxKFHCKNXXJG0+DqAwNlI25r35vGu
	xKa+ADHD6pe1gzHje1QZP2IE4v9MT9P2U4UXpyx2Iyj7mr7wza47bWzlrhBq1ad+
	v2nf9Ie/NBrIJiJwiRzwXQKtw11aIkq5QaQVhIEwhS59nI4YSbtizjyCo9+Dj7l0
	UI+dXfQ+0ApHoZTrL/AT42caX+THxgYTXh64lwouDta2t9OrPssIXMSHK22NCCVS
	H27aa+3KjnxIsAdWCxhc56csQAjGxM1MeJLJkeETMI/U9Hd1xkqZlTZf3u8v9Zuu
	ztsqiAzxorMQF0S+qHvLzg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bf387xx1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 13:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767647784; bh=KlCEJmAcKASOXhuLyoncD4UzC86ZUvwAhqGFWk4ayAM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lSXQtUUrs40rbprPHuhtJJz6p6pih+YU5JBn6+puWYn+4RCQqK/jDoH0uFE43iX2F
	 aHwlxtlp2ut7BjResbr0gsLTY2XpKmG90nwifD9Et2DRIM5ecLCJyjOHW7BrEzjnY5
	 NYviy5zRrriClNGXLIy98TXb4lVviiEuPcMg+Qx+8tsm1UId2+PbphuU74hRQ9tcE2
	 KwwgIDrqdJ/ooEL718xP/CFtVUlK/iQ0UOB5PvUiphCpqAeE0BCy7ctRH7PLCAgng8
	 bqDthHDyTLeG34j48cMbz/Txw9x44dQEai6FV6C+w2qSQDiYppTNMPSZB4YANxn90a
	 +9G9++kfEd6qA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12CD440726;
	Mon,  5 Jan 2026 21:16:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A2E76A005A;
	Mon,  5 Jan 2026 21:16:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aq7W16O4;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 19FF540528;
	Mon,  5 Jan 2026 21:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7HCjtpx7VHf9r1KeZ0QUwSPCroyb0XLsLqSdZ0DskbiB3rTmKBTeMNr2NbbTqEHhUSM2V7aVVmfr0NbXHsEMjoRlHS4IIBFXoeF5ys2Pb/rF++yBs//ERHvjqh4Pc+ieMynluae73uKv35Bqhmj/Mmjwva1CnEUqZD1aRX0X+s5sWs3r7clkhGopcLmBDy+z0tqsGuFiw6WOkiKAHiiml6KNGzjtTyC5EYnrNhRSXoyxbb3r6jnoaoyQvhreBVvu6UuFqBwpkmDGB6oPSZMlW2ney2yBTQnjy2evHQlT3OfrCelm9uHZOGPqRwIpKHcpeyQwclLBjCuKfQ7XzaWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlCEJmAcKASOXhuLyoncD4UzC86ZUvwAhqGFWk4ayAM=;
 b=FXZqFmBXrnihf8tzzapqChw7bAqU7oLPj21n5oCVjAh+wVKR6CJ96uvNnwtShSYjMgCj3YOyh4//ueo5TBEUUTqPQQIjRidAyRiJZixa1nU2x0fnHdNwrmisS4qSFoYZgIE9Xzo0UaF/c6+Ttd7jgBPRmOAB4sk6haBgcSEcQq5ve8q7sr4tcyPhacoLbOwTsyggSRQScsiDjadoS+afaCKDnli7ZWWxWQGy314k2YIZxTBXn9NsdIJa42jMSk8E5Yw98HLY4Qk7oxMtym9FPuB1PS7K34joMBYl8v6P4gUAvsMdcBNubQSqLzS/B/xCzShWcBATpQRj1kD73dG+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlCEJmAcKASOXhuLyoncD4UzC86ZUvwAhqGFWk4ayAM=;
 b=aq7W16O4tye+FwFC5L+n+naVrrNNabSJ3i0CH3P9W7/e29r1p/5qxgFFgzcjXgGFrVvXMVcgUModj+8GcYDE/ZqYuiyOpz0hM5axnTeNdd6rr2HZTbMkuP4tIxDGexQTt3Y96ukS2ITlrR+7PeqBjg0XxGF5qFlTpd+SDGBpuY4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 21:16:12 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 21:16:12 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Topic: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Index:
 AQHcfjoBtXqdJ9szpEOmIm3MfZ3JrrVDhZyAgAA56YCAAAR8AIAACTMAgAAx1ACAABWIAA==
Date: Mon, 5 Jan 2026 21:16:12 +0000
Message-ID: <20260105211608.eoiet7ccyg5oztbc@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
 <20260105161145.podzns57ekzjg3pj@synopsys.com>
 <2026010528-animal-avenging-dad2@gregkh>
 <20260105170044.vuuoyiszyptokmfp@synopsys.com>
 <2026010513-kinsman-moody-6d63@gregkh>
In-Reply-To: <2026010513-kinsman-moody-6d63@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8996:EE_
x-ms-office365-filtering-correlation-id: db069550-d415-40ef-5928-08de4c9fa722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHRQUHdLRUduMGhONXNia1EwVHZXbm54cVFzTEN2ZEZEck5EYzdsQ3FxMHVx?=
 =?utf-8?B?eGwxYlkyL0N3MFNMVlRocXdPQkxJOStHckZ5SS83azVacU9GZmxIZmNrbmFh?=
 =?utf-8?B?eXRYQXc0RDlFSVpFUThweFAzbHIzanZWOFVhdWtLc1BqaFJIcDNGQzlnUXNQ?=
 =?utf-8?B?ejJGc1Mrd3luTG9UZVVkLy9ZQWJKMVJrTHRPRjZMYlJxK0cxa0syTkZ5dzV1?=
 =?utf-8?B?ME5zbUt0VC96eHJFUU9nK1l6d3lyTlpkdnVNSjB0UHp3ODJaZ3pmSSswZUJl?=
 =?utf-8?B?RGhlRGFJc2VsSzEyWWlPMmdLc3pVcUF3aXQrZUlUalp0RHNWNlRvSFJVN1BM?=
 =?utf-8?B?RHFnQ2ZXTFRRQUpHMGVrMG43YUxHUTVWMTg3M2hMWXJHRWFPenNSNSt6ZW1t?=
 =?utf-8?B?ZkFuZGZrRVgvdXNKZFordDREQmNuVHY4NFpySDZMR0E3bU54NDJ2dWRSVktr?=
 =?utf-8?B?QWkwZjlkYnNxZGRvTkg0QmdGaSttdG1HYWRXLzJpNS9OYitYYUF0WjdaNm0w?=
 =?utf-8?B?T0lta3I0V044QlkxU1ROTWR1K2QvYWNGc21PbFllejNzZEhzbWhPREtEc3hj?=
 =?utf-8?B?YUQzdHdkLzJHeFZZR3ZoL0RXVTFrU2dHc1RnbzFWVUEzNlNsZkNhWmNGdlp0?=
 =?utf-8?B?YWkwWCtJa3N1Vzg3dzNrWU1DZ0loY1U1a3dVVjlqVW45dmNiTXRzbmlLcnFj?=
 =?utf-8?B?OWQzSkthZ0MzSHNxWTgycEI1VU0wclRBVVpsU21vM3Jlc2hDU1d5aHlnVkx2?=
 =?utf-8?B?bW9IWkhiQXFIaXF0Um9wYUJlYU9oR1hTU0N1M09DTVJxbnR5SFlFelVJK2xu?=
 =?utf-8?B?MzFtT01NOWI0WktMS2RFZEszNDZFNjBvVnczdi96a1F6M2VxZVFhSGhGcDhJ?=
 =?utf-8?B?TTNZQXRML0ttZmtGQ25rbDBtZW05ei9OalRKdmFrMERFa1BSdVphekY5YlFn?=
 =?utf-8?B?TXNYbVBCRG9MMU8zMkRJUG9qanNLNy9LamdnNjRDM0pwc3p5MHNqVDFLbytK?=
 =?utf-8?B?bG5rWk9ucTRVOEF2YXRyTW9XSk40L2U1dmdOdlI2TDluSWR3L0ZvQkI3bUto?=
 =?utf-8?B?bDYrTkk2UHFKV3dwOWsyOEIycmthNUt2c1QyRUJ0M2dRQlNGSDVoMmZnSmlW?=
 =?utf-8?B?aHE3T3BKR3NPSVhIMW9USVJ1Uzh3aWRvVEd0U3pvN3NaUlV2L29waDZ0d3cy?=
 =?utf-8?B?QjZyR2ZIbnc2WGZ1NXRvd2xUVlJBRTdwWXdHYVNUNmFXV25FQytjR2tpM1Rn?=
 =?utf-8?B?cVpnd1hLWXYzRHpyUEpBWXBTSzJlS1FPMTFGeXlaMDJWd2ZwYWVzSENQQzYy?=
 =?utf-8?B?RE1zN3JSQUVjek43NVNNa1ZlbmxNekxSd0V4OWJlZysvU2JNcitrVGpwWVQ5?=
 =?utf-8?B?dnptSnQzWEZpNUVsdzQyTWE2Q0ZtaXEzNGJnZ2V2Q2NXUUVWK1o4YTZ3aVBN?=
 =?utf-8?B?K2RzaENjQ2s1T1Q1Y2NURlNFYXgzaGZuZHRlalNKaGY5UmJvTDhtOWVUTFlj?=
 =?utf-8?B?UmtGMFlDOFBpZUI5THlhRHFHdXFUQXRhMUM0dldpeTNybmtCV3gyQ29YcVp0?=
 =?utf-8?B?NUNYSGhocnVaYlJqcjNNUWRwQTRLeDMzeFdhaFdvY1d5SityUXFLdmkyVG5W?=
 =?utf-8?B?TGtGc3V0ejlwOEhnVDF0cThicnNORUZ1M2NMZVpaaXBpN2tmUXFpallZT3Fu?=
 =?utf-8?B?WHhnaDRpK0RKVFh4TzRtOUFxRlpxQ3NxZm1QQURqMHEyQ0IyRXZWcU5pYkhJ?=
 =?utf-8?B?ak0wTVlMcnkzdVFhSkMxclZDTzJoajd5MjZCWFMyZDg1UHZMYVA2VkZpZzBC?=
 =?utf-8?B?WUQzakpSM3hmdnFvdjc0aEJVT0grSEJqMkN0d0Q1dUN4UUhCdUxZRzFlVGFp?=
 =?utf-8?B?c1lFQzVydmlYbG02LzdMZ3JIaEhGSndXWGZvSTIydm9zUnVtREhTVFJ5WnAx?=
 =?utf-8?B?dnAvZDlwVnJSOVdGY2hOek4vSStWcmpVQnBoVTlJYlNEQjZ1NVZzQ3ZFMkQx?=
 =?utf-8?B?aVF4eWFPZFVKQ3hHTEVZZC9ldHVoa0hialpTTmxwUnF2TUQ3bEhqNWlNVFdW?=
 =?utf-8?Q?P6TgKZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0RoNUxoSk5BNHkzYk0yNWFIQUZIendMVEZndUY1MnBUTW5LZWxhNWpTcHYw?=
 =?utf-8?B?Nm1jSnZFdzUyakhGVUFkTEEyWlYxcTM2dTU5UnFKYUkyOTZXMDQvVnVJZDR6?=
 =?utf-8?B?amovNlJ4ZmV6Sm1pVmNiUHd1cWdRRE9WdVpodTY0cDJCcU42OHVMRGFab2tj?=
 =?utf-8?B?dXg2MWc0WFhKZ0VYclRIU2tUaGtWQ3o5TUc4bTRvSDZ4S0V5aVp2R1VMRU1L?=
 =?utf-8?B?bzBKb25SczhzeWIycEo4YUJXRVBFb0FyNk1yazJ2V3czRXF2WE5Va0E3OE1K?=
 =?utf-8?B?elM1QTJmTWVEeVduZTZQU3NEZVBVaDNiT0Q0SlkwTE1COGYxT1MxdVRkeTNH?=
 =?utf-8?B?YzNldDBzNWJibUJta0VORFU0ek5abnVPdUlrQXVlb05nc2RvaDcxMTVUTU44?=
 =?utf-8?B?M2xiZ0lUNkRlQWxQb1I4TFA0OUMrL3Vac3BoSmlrd016UXF6ZWZML1lqd1VO?=
 =?utf-8?B?L3ZnS0tvLy9McVJia1NCSGtTWElETzZaaHZ6OTZzaDZsZEtKdWJmbXhDQjA0?=
 =?utf-8?B?RDV1R2hMQXhEVHVsUi9EM3VKYWpEdkRTZW12OWFQV0Q5emJVU2VKNHdWYUZC?=
 =?utf-8?B?SGFhSGw5SERIQ2R5eHNaTkFJZE5VUGdOV3d1ZlR6WmVoTWpJaWE4bWh6b1pl?=
 =?utf-8?B?VXhhS05iZUZJV3A4QkxnbE5QaU9QOVZ2VVd3d1ptaWNudTdNa3I3ampQUEli?=
 =?utf-8?B?Zi80N2pwTVdadEIyRnhjelEzellHUmo1SFoyN1hNWWpIendxS1VFWnNRYkU4?=
 =?utf-8?B?aGZTQlhSMlBoR2dQUU90ejE2VHVoZXR4TGIydjVpSExXdmdQdFdtNGtjNXF1?=
 =?utf-8?B?RW1kV2hyWXlxQUl6OE92dTcvdFk0RW15bm5iNEM5MVo3b3ZZdWU0ditZL29U?=
 =?utf-8?B?UFVtNFZiS2lUVWY1SW1uVWdMSGRtVXN0YVN6NVU2ckhEWXpIZFFiWGwyVHow?=
 =?utf-8?B?WHpmU2IveVIrSncyN0VKMjRMTExJckVjMEhSUzYzelZHRmVJcTN5SXZrd0RS?=
 =?utf-8?B?bExHOGk3N25zL0NROUh1NTF4NjJzZVlKb1ZiV1NvVjhmM1NrVEdlM0VFNFB5?=
 =?utf-8?B?SEh3T0pUdWpmQVFjSnV6cWtFbHJ5aHZ6Zk5zWFdlSEs4d2YzSFE5aTlKY2hM?=
 =?utf-8?B?OUh4ODdwdWhockl0cHE4Yis5Rm1URkNOb3FUeUF4VXowUXhaMjFhTEhVeC90?=
 =?utf-8?B?L1RXSWl6dG92Z2tmRFNqVkpxTEk3NERiQXpuVCtramZTaGpndlNCYlVTd3pi?=
 =?utf-8?B?Yktqblk2QnNDSFZqUno0UWJlVU4rSHZ1S2E0UFljOFdCYjRZYklONi94YUdP?=
 =?utf-8?B?TG5pRCtaWWV2STNncDdQVjZrMmd1aXNSNXJma0NuUEhaYnV4WEFVb1pMTStk?=
 =?utf-8?B?T1VDS2IxY08wSWQ2N3dGcWFoNDdKZVNkaTgxaFIrZHJ6YTQ0QzJxNFNjUU90?=
 =?utf-8?B?V0JoZnlxbVlJekZVYU0rQy8xMCtCajlaM3d6QUdUTlJKUHcwMjdoQ1gvcmVw?=
 =?utf-8?B?cTVUMlNJd0FQb28vQ05SRmIxWmpmRk9mYXJ5MHZCa0hCUmRMY0RLWUJLUWRn?=
 =?utf-8?B?S0dYVmtKLzNWTE00K3B3SUYyQUVpWmVjaFVRdFRoY01MeXAxNU14VnEvdWVH?=
 =?utf-8?B?ZEIva3drWnFQQ04xRTdLdE9XYVJvN3RPUGVkaEI4VWphWmJJWmszcUxuOXY5?=
 =?utf-8?B?WUgzVUhLUzl5QTBIU1liU3RhaHp5OXoxM0tJWDJNNjZEdEZJUXh4Wk9HbFBi?=
 =?utf-8?B?YXN2c0Y5T3gvUWd2b25VeG8zdy80bkxURjBtZjlQYjdrVG9BOFFIWGtyVkVH?=
 =?utf-8?B?aWlqeFR0dnpSbE9NeCs2Nk9IbUI1UnlEZG1oWG5LT3M5bEZKQXNkbjdpallh?=
 =?utf-8?B?NXRaREpNZG85Q29iRFk3amg0Y0dQT1J1NmZZdzR6M1NNSys4Y09WK1lPbEpk?=
 =?utf-8?B?Y0ZoYWJ0TlZpajg3RW1YdXo3QWkxZVhMQi81K0k2RXJPSGMzZGs4ZTQyRVJW?=
 =?utf-8?B?dzVVUU5rL2s3dWFzVzBVYVZQdkNRR3A5bStRaERpUnY5RHR1NFV1Y242RVVH?=
 =?utf-8?B?OXNsMnVjVVZWRGxucXA1SHBveEhaRldURVl5L29iZ0w2TDE2cXB1ck1uQVlS?=
 =?utf-8?B?VW5hblNCWnhYaDk1WXZCbDIyQXprTCtkaGpOcUl5clV0Qnl1anM1WWkzOU80?=
 =?utf-8?B?Sys2U00zY1IvakxUYzFaNFYrUkhoZXU0SnhkY1BqdCtZSlhQVTNlWUtMei9E?=
 =?utf-8?B?MXRnUDdjc2IxTWhWcExWdzJsRjIvckt1bmhxYktrY2l5QU5Za2NabEhGeGFR?=
 =?utf-8?B?cmQxcFJuc3lBRncxc0N3UVBPM04wK0w2NHQ3SXp3dzJIdzMwb21RZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <071FDF424200B640AA58094112D7850A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xVluM5N6zzhK9Vra+gKyy4oLzHQRMOLEssguH1pmfaksyByi2zs6SbY7fDgrmfcsw4QJZK5O+t4CiKwiwpclkZNrrhGHfAlCWi+ibk+zufQTWr2a2twT5w7YiN9ZNaQiKfR3MZAdMX1Vd76EBW5pGLJeCt4EaA786VpxURwTExYDCM93yhcT2ZLRm5FNleN1RSIoQ+nHkyovwLf8fDURyIqRPaa0N96SpD3WgzCWPvNtV7nbbT85gbTq8JngEECMpS30S0TQOOLxRNgHZ7ehca+4VyNazh3Y6LF5tjc0+T30PLA6FUmVUEBc570t+gCL3/cVVZzP8FEOh7dvtSzdauU3bGes4wAvtm49xkaa0bHWtK9lFzmVhDHqmXQMwJiUO62MFh/EMPfs6rFxTjDxPM1DG2Z1zycFXWXJmGXivzDxcquyPRcglxfeUc+t55z6Hmh+APEJbWbzUAZfQdqj2RrmIrmCK1eVj4PE6Hauy1iWWTyzpMMnK9HBFq0iHbrkT36bRcYljS8AhjRcoItQY3DnvLqEJsXa2fAt2IF9AhhYEY6AkWXdo0MeS+lXARtUzeavKbt3wGZYJnmI9pczHpQWUAQ7ffwnjVy6U1Kw7vTOdxUyxdIcoA//5W83cAe/o8gt9f5LT6kU5PZF3de/Sg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db069550-d415-40ef-5928-08de4c9fa722
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 21:16:12.0251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwCgAF39DcHUR7999/jwFZ2Zn2kX1ErQy9y1Ygxawbwe4zqTaTDg8Gktta54eNg2XPAJEEANP6rGZ3Ul0RCoRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE4NSBTYWx0ZWRfXy/9tbjpRGrUw
 EYMy4piEBK00CcxG/xtuBjecgOarPtRrAIVzqCycZfZ8SgTW3cp9qKSRjqMDBgFlPNTRBWDmGzV
 7DEG7vd2dThxUxK6k2xzW/DVQcGNQgn5dTrCOoueY54LEwKU5r5OQSsJdbzRjGTKPuX/sN/zkJB
 cEVy66LnZtaDoL7wRW/xS5kPzBAD/sAeumDR6VN9yeGKouOGIJ/TN0ZKNPqbgS8WyK42jlfLAPQ
 z07oa+2w7QtoUVrTGoayjZWPXUjZIdKXVG2dZDIxAGAr37v+xVeyVYUfxbadhg/rj6SpDbHEZBq
 SIbt68EmUShopxQ0mskfmjvBdfRPgrgiaefbwhoJrhk4mU+qqolmq1+Dd90kokdfHe7xEfljAaj
 7uW3XFFrA0wvps0/yvuZsdVSBfGWR5l06w302irVrsYDPyRXYKM6eLQQelhJIeCHjZW+0veZ9TH
 qBZBjABTyXYvRXcTpQw==
X-Proofpoint-GUID: xQ1EGarBF_JpLHAE273Nck9vZ3lKWnAd
X-Proofpoint-ORIG-GUID: xQ1EGarBF_JpLHAE273Nck9vZ3lKWnAd
X-Authority-Analysis: v=2.4 cv=BZHVE7t2 c=1 sm=1 tr=0 ts=695c2a28 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tVrThONDHyLGNYNxKUAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601050185

T24gTW9uLCBKYW4gMDUsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gTW9u
LCBKYW4gMDUsIDIwMjYgYXQgMDU6MDE6MDBQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiA+IE9uIE1vbiwgSmFuIDA1LCAyMDI2LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+ID4g
PiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNDoxMTo1MFBNICswMDAwLCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+ID4gPiA+IEhpIEdyZWcsDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBNb24sIEphbiAw
NSwgMjAyNiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgSmFu
IDA1LCAyMDI2IGF0IDA1OjIzOjIyUE0gKzA1MzAsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+ID4g
PiA+ID4gV2hlbiBtdWx0aXBsZSBEV0MzIGNvbnRyb2xsZXJzIGFyZSBiZWluZyB1c2VkLCB0cmFj
ZSBldmVudHMgZnJvbQ0KPiA+ID4gPiA+ID4gZGlmZmVyZW50IGluc3RhbmNlcyBnZXQgbWl4ZWQg
dXAgbWFraW5nIGRlYnVnZ2luZyBkaWZmaWN1bHQgYXMNCj4gPiA+ID4gPiA+IHRoZXJlJ3Mgbm8g
d2F5IHRvIGRpc3Rpbmd1aXNoIHdoaWNoIGluc3RhbmNlIGdlbmVyYXRlZCB0aGUgdHJhY2UuDQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEhlbmNlIGFwcGVuZCB0aGUgY29udHJvbGxlciBiYXNl
IGFkZHJlc3MgaW50byBmdHJhY2UuIFRoaXMgbmVlZHMNCj4gPiA+ID4gPiA+IHRoZSBmb2xsb3dp
bmcgcmV3b3JrcyB3aGljaCBpcyBhZGRyZXNzZWQgdXNpbmcgdGhpcyBwYXRjaCBzZXJpZXMuDQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICAgMS4gUmVtb3ZhbCBvZiBkZXAtPnJlZ3MgYW5kIHVz
ZSBkd2MtPnJlZ3MgZXZlcnl3aGVyZQ0KPiA+ID4gPiA+ID4gICAyLiBVc2UgZHdjIHBvaW50ZXIg
aW4gYWxsIGR3YzNfcmVhZGwvd3JpdGVsKCkNCj4gPiA+ID4gPiA+ICAgMy4gQWRkaW5nIHRoZSBi
YXNlIGFkZHIgaW4gdHJhY2VzLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBDaGFuZ2VzIGlu
IHYyOg0KPiA+ID4gPiA+ID4gLSBBdm9pZCB1c2luZyBtYWNyb3MgZm9yIGR3YzNfcmVhZGwvd3Jp
dGVsKCkNCj4gPiA+ID4gPiA+IC0gVXNlIGJhc2UgYWRkcmVzcyBpbnRyYWNlcyBpbnN0ZWFkIG9m
IGRldiBuYW1lLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdhaXQsIHdoeSBjaGFuZ2UgdGhpcz8g
IFRoZSBkZXYgbmFtZSBpcyB3aGF0IHlvdSBzaG91bGQgY2FyZSBhYm91dC4NCj4gPiA+ID4gPiAi
YmFzZSBhZGRyZXNzIiBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSBhcyB0aGlzIGlzIG9uIGEgbG90
IG9mIGRpZmZlcmVudA0KPiA+ID4gPiA+IGJ1c3NlcywgcmlnaHQ/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+IA0KPiA+ID4gPiBJIGFza2VkIFByYXNoYW50aCB0byBkbyBzby4gVGhlIHJlYXNvbiBpcyBi
ZWNhdXNlIHRoZSBkZXZpY2UgbmFtZSBpcyBub3QNCj4gPiA+ID4gY29uc2lzdGVudCBhbmQgbm90
IG9idmlvdXMgZm9yIGRpZmZlcmVudCBidXNzZXMuIEZvciBleGFtcGxlLCBmb3IgUENJDQo+ID4g
PiA+IGRldmljZXMsIHRoZSBkZXZpY2UgbmFtZSBtYXkgYmUgaW4gYSBmb3JtIG9mICJkd2MzLk4u
YXV0byIuIElmIHdlIG9ubHkNCj4gPiA+ID4gaGF2ZSBhY2Nlc3MgdG8gdGhlIHRyYWNlcyBhbmQg
bm90IHRoZSB0ZXN0aW5nIHNldHVwICh3aGljaCBvZnRlbiBpcyB0aGUNCj4gPiA+ID4gY2FzZSks
IGl0J3MgZGlmZmljdWx0IHRvIHRlbGwgd2hpY2ggaXMgd2hpY2guIEFsc28sIHZlcnkgb2Z0ZW4g
dGhlDQo+ID4gPiA+IGNvbnN1bWVyIG9mIHRoZSB0cmFjZXMgaXMgYWxzbyB0aGUgaGFyZHdhcmUg
dmFsaWRhdGlvbiBlbmdpbmVlciwgYW5kDQo+ID4gPiA+IElNTywgaXQncyBtb3JlIHVuZGVyc3Rh
bmRhYmxlIHJlYWRpbmcgYmFzZSBhZGRyZXNzIHRoYW4gZGV2aWNlIG5hbWUuDQo+ID4gPiANCj4g
PiA+IEJ1dCBhbGwgeW91IG5lZWQgdG8ga25vdyBpcyAidGhpcyBpcyBkaWZmZXJlbnQgdGhhbiB0
aGUgb3RoZXIgb25lIiwgeW91DQo+ID4gPiBkb24ndCAibmVlZCIgdGhlIGlvIGFkZHJlc3MsIHJp
Z2h0PyAgQW5kIGlmIHlvdSByZWFsbHkgZGlkLCBqdXN0IGFkZA0KPiA+ID4gdGhhdCB0byB0aGUg
dHJhY2UgYXMgd2VsbCBfd2hlbl8geW91IGFjdHVhbGx5IG5lZWQgaXQuDQo+ID4gDQo+ID4gVGhl
IGJhc2UgYWRkcmVzcyBwcmVzZXJ2ZXMgdGhhdCBjb250ZXh0IHRvIGtub3cgd2hpY2ggaW5zdGFu
Y2UgaXMgd2hpY2guDQo+ID4gSWYgd2UgaGF2ZSB0aGUgYmFzZSBhZGRyZXNzLCBkbyB3ZSBzdGls
bCBuZWVkIHRoZSBkZXZpY2UgbmFtZT8NCj4gDQo+IElmIHlvdSBoYXZlIG9ubHkgdGhlICJiYXNl
IGFkZHJlc3MiLCBob3cgZG8geW91IGtub3cgd2hpY2ggZGV2aWNlIGlzIHdoaWNoPw0KPiANCg0K
QnkgYXNzb2NpYXRpb24gd2l0aCB0aGUgZGVzaWduIGxheW91dCwgcGNpIGNvbmZpZ3VyYXRpb24g
c3BhY2UsIGRldmljZQ0KdHJlZSwgZXRjLg0KDQpUaGUgaW5jbHVzaW9uIG9mIGJhc2UgYWRkcmVz
cyBpcyBoZWxwZnVsIHdoZW4gbWF0Y2hpbmcgYWxvbmcgd2l0aCBvdGhlcg0KdHJhY2VzIHN1Y2gg
YXMgaW50ZXJuYWwgc2lnbmFscyBvciByZWFkaW5nIHBjaWUgdHJhZmZpYyB0cmFjZXMuIFRoZXkN
CmNhcHR1cmUgSU8gYWNjZXNzIHdoaWNoIGluY2x1ZGVzIHRoZSBiYXNlIGFkZHJlc3MuDQoNCk9m
IGNvdXJzZSwgd2UgY2FuIGFsc28gcmVxdWVzdCB3aG9ldmVyIHByb3ZpZGVzIHRoZSB0cmFjZXBv
aW50cyB0byBub3RlDQp0aGUgZGV2aWNlIG5hbWUgYW5kIGJhc2UgYWRkcmVzcyBhc3NvY2lhdGVz
IHdpdGggaXQsIHRoZW4gcGFyc2Ugb2YgdGhlDQp0cmFjZXBvaW50cyBhZnRlcndhcmQuLi4gYW4g
ZXh0cmEgc3RlcCBJIGNhbiBwb3RlbmlhbGx5IHNraXAgaWYgdGhlDQp0cmFjZXBvaW50cyBhcmUg
c2ltcGxlIGVub3VnaC4NCg0KQlIsDQpUaGluaA==

