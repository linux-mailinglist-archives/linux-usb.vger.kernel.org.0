Return-Path: <linux-usb+bounces-32359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF801D21AA9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 23:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D74BF300A7BC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF522F546D;
	Wed, 14 Jan 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X/2r0U5G";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gLRmev07";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wndyaHfO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D1355024;
	Wed, 14 Jan 2026 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431308; cv=fail; b=Rla6zTac7eNo1ivTSM8Q2tUMSnGvQ5oxxg16q4IeYtKz7d0NsXB/kZQHn8SR95yK6QlR+v9FUG/SfHJI3ifKOXLXPknWzmFsIjwcAWHLfvF2D4Q3eNy6enT2vDMNUPYcrDJG0HlBa2Xs/pTv+BpEo9+bRI+80yhOyiAlkqkujQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431308; c=relaxed/simple;
	bh=8O25GVxZOu1lXGMpUEGoJbTXuWkXZ08inft1DbGZODQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eLXpAmx9XncrHRqNmBVpDaxT0HKv3O2/pOUog8jVa609J19g5qYpLZB+tAj1v+7O3sEAQD0dFw36UnUe1GrBun/M9fYoM30REx9xY+gCmhJFGZbjarhP9vJtPKS+8NkCj0VhV7UdQkhBRofTQYY3sDd6p+ahu7ujsU2AxfDKdkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X/2r0U5G; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gLRmev07; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wndyaHfO reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHOhgx3373272;
	Wed, 14 Jan 2026 14:54:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8O25GVxZOu1lXGMpUEGoJbTXuWkXZ08inft1DbGZODQ=; b=
	X/2r0U5GpyuvXhhrrbz4uSgdpjw4v22QycUwm3/rwmU1eK1coa/NqPDNmQFH8uV9
	Wkkizgca5Vntt9RnWfTLd6LvCDSEHAbGpnvEXFkWAW5/uuPh6u7zCBUqPx0aWgqQ
	pX2Jt01Es/ETRRtVNf8RUPTej3U4iF4SY3Gim/hAG4TAV463/Ibf9+S/R1nIVCCQ
	7mv4SnMymKKIVO2GqUGcdKBnYNrZJIgZcZRbxG4cEKYXj9xY7XjNCkrDQdf9vXbV
	LCtRvEr+gwCIt20f95cZuoB6Q1Q7foprlQ1Ud3L5YPeCPkfBdgQa7N9lvRybxIJ3
	RNAuAySIWrua2phUdG+unA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bnwwmequa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 14:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768431294; bh=8O25GVxZOu1lXGMpUEGoJbTXuWkXZ08inft1DbGZODQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gLRmev07ElB6vb1wkQewGW4ot8Gg17yfe6yRG21y3iVBeJkd4YQZ+DS8th4WtEj8/
	 3mAXoFjYemiI2+sKOgbkVw8jjFcuxPurJ7qBRA0C1uyzPwT/ClEkJgu+Js+dU7h0MJ
	 zrf92QhzWxvArYelUBWGnWlQYhdEb3Pl4nawyvivEjJqoiDq1HvDUZuIwQa0MSRAR2
	 OwrLkSOXM3QAHf5PNV3ARP6903YmILHahzWdCJT7j42GKbYjYHtsVPdpkDxBhcUFZN
	 41HiobLmokcOHwrfWAig1sFl4xVpL0XyuEZwXnl4CMPOi+qVL9IR65H+8/i3W1qDpi
	 yOtVoDMFkjPJw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 462004045D;
	Wed, 14 Jan 2026 22:54:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7F7FCA0070;
	Wed, 14 Jan 2026 22:54:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wndyaHfO;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00302.outbound.protection.outlook.com [40.93.12.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DEFD740543;
	Wed, 14 Jan 2026 22:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skb+IIm908Cp+khje6pF2gzADYKVzpeMM/kEuLOAbkwyeGJ4whtNPXgOT9eRyFGn+DqltkLGzeQ/vxAGrY5Y1k0sA/xxAUM9SGtn1Jjvkb+JZMktAOqcovUw5FdEIBxcuUuBIDX8tJgJawhLEhh2iwVCYHdjen1ez/13Ma1O2w3lAfNs0K/PKxv8uCIo3Es+an7DlRc2MtqUSdPYKKplCYELIKUjPavk6jXzOzoVgpsnff49qrXVgnMt3UWN14PXqeWKWDuwrUg2xW7DIcofncPDvD5PG/7wSmkbrpmH+RiVVK5HS2ol5zlSK4DHcjDtcXtaerJacAdl+Cc4iE1a7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O25GVxZOu1lXGMpUEGoJbTXuWkXZ08inft1DbGZODQ=;
 b=V/FYjl97tOjOWGNrMYqoFU92xW5zExIuWhDqdv/AFAAMswAoBPxTgqSnWMV46X/CCG3kn4RU8vYTFtJrEg7ujAi1WoV+km/EgrpD9TBq25JuzsmJrYiAiogbyTr8t2Ju07lThldYyfGnMUzrtFmXlCEo8LI3i/mccY+UN86bJdSPhQFlWC9NAWn0hyigRfWPSMyJHCYbMnW3x1RSj1QdAzM1hnnW7SJPAvnhEp+T7YWSXKqLc6ad8DA7xlV2/xvptPC79UdBervDYAqrryYjyQYuCbEfo2MT2pfAgrCh9EXlEDbkPyLFqHvpUOHhlkIHm88FCEig6AZEsCUuLMgG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O25GVxZOu1lXGMpUEGoJbTXuWkXZ08inft1DbGZODQ=;
 b=wndyaHfO6bicXwovU1V3WUwOQhvydKZR4CYGcd15xgS7AYvS5KeCUcsymnjbLDqwryv/0Vcabk6a6Hum+CxcWmL5SQoEvoiDVODIHz1GfWggclO7zDFb9FiG0wjIMv4vqj7PHklH2WLv2rxG2QCqFMgYyf05DfVx5G+GoH21MUE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 14 Jan
 2026 22:54:49 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 22:54:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index: AQHchT2wbJQWlMamnk2JtLup9X7IcrVRio4AgAC8f4A=
Date: Wed, 14 Jan 2026 22:54:48 +0000
Message-ID: <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
In-Reply-To: <2026011400-monthly-commend-f89b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6648:EE_
x-ms-office365-filtering-correlation-id: 9cc51759-a334-47a0-3071-08de53bfeb9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MU1INDZ1aDBoSGJ1VkRFYVRveDVSSWhTTzlUOUdoS1JxUWlVSloyNkpDMEc4?=
 =?utf-8?B?MmxVMmNrR3NxNlFhV0oveVNSRjBMZmtOdXpGdTNTN0dIU3MrR2dKT1FLS29C?=
 =?utf-8?B?cC9NMDZKcEZtZ2ZXWWRvczVTN3Foc0ovQytkSjFnTzZOOFJIZWJ0QjRqWVdk?=
 =?utf-8?B?V0ppZnZPR2VQRE9EbXp6azhVdFVrMzE4VkJhSE5HNVBmT2NVclc4THhWc01T?=
 =?utf-8?B?L0UrT2hYZTZhN0JmNzZHRnowQXFXR25hVEIvWTZPY2ZwLzdkU29tNjNabXhY?=
 =?utf-8?B?RDB2THh0eTJaS0tQUXB5akdaVitBUE52L28yOWd5VElrN1BrS3RyZTZJWUZL?=
 =?utf-8?B?V3c3ZnpiYWdmQ01rMVJEbzgxSTNUcTZOcVpTU2tPUzFCOUkxU1dqUHZ6Rnph?=
 =?utf-8?B?ck1uTXAwYjdDVWg0Yi9sYkZtVENkQzJwdWJHTFhRekZJaVpDS3VScEx5WG4x?=
 =?utf-8?B?TWdHcW83RjZOTEZJYnF1UUc3L2RicWZ1dFU1eWpCS3E4dk50ZzgrZ2J5YWo1?=
 =?utf-8?B?cloxcjYxL3pwUXBGVXJTUVJPNUZsNWdHTGlUV0NjODhWbG5LOGRoYzRtQzBR?=
 =?utf-8?B?QXJrRXhpTHhBdkYwSW9keW5ES0hjS0I4ZVFBcUp3cjdRbldDWndaVWZ5OW0z?=
 =?utf-8?B?VXE0Z1l1d3Y2Y3VpaXZEZUFieUpsS0YxelRPcjhEcHVoNHJiTzlDQXVKS3Yr?=
 =?utf-8?B?K2FMdm9UUWlSbzRLMWpPbTB6N3NXZWZCM1pmdU5ML29TTGhQeFh0R0NVQmp1?=
 =?utf-8?B?ZStIZHhXbDQ1VUc0K2NZdDY5SUNiVWM0R2VwcDA0N3hqNjVYbTZZR0JidXM4?=
 =?utf-8?B?dkxNQ2YyNDBObE9SZFZ4bEtDaHVJeDE3MDV2cUdNb1EvaWZRd0tlc2NZTmt6?=
 =?utf-8?B?NG85RjBOMEU5MXNTUk40SGgvSHFNK3E1N1dud2FUdVNPaWdLN2NTZElra0V6?=
 =?utf-8?B?cjNuNytNeFRhQ1pyemtvQVFQMVVTMDRBUlljZTRjWmNlV0tQWm9tWVhSNGdh?=
 =?utf-8?B?elJPUVgrd2tkQzdnY1IwMERhRldCRVN6TVRYY2xxd0RxcDhGL2dITVZHTWVp?=
 =?utf-8?B?MVFBVmpQaXNMbWl2ZC80anpYdUpNL2NLb2lOSHNNL1JveWtQWVJBb0Yrd0ky?=
 =?utf-8?B?dHNuWW15S3pRT3dwbUV0SmcxSjhRbGJPMkNCdmhYQzAzVk9Rem83enJrMWw1?=
 =?utf-8?B?eWhKZ2NJQWVaMjdweFpXaGhFamI1bEJoMTBOb3JXSURJM2ZibzNyRmtSZjEx?=
 =?utf-8?B?S0pmTHNybUhYbE5wcXYveVZjUDNsL0l3Q1pkUk9Ic2hZR1dIM3ZLN20yMlRp?=
 =?utf-8?B?YXhVcTQ5U1hFVDBHOEozSVVCUGFkRkFjNWd1WmN4Yk5vTFJDRURQa3RwSi9l?=
 =?utf-8?B?b3IrYWJtQVVKL3NpYnJHYkszUzA1SndJOURFeVY1NnRpMjErY1NSbmZpTklJ?=
 =?utf-8?B?bTQraDlRZWNSSkN3REJ0TlozcHdRWWVpUWdOeVNyR21NQ2pEanlXUDVmYnBo?=
 =?utf-8?B?Ty92OEVjMXRrWE0yNHZJbTgxYTFIUWU3OVExZUIwaTQ5RFVVd0N2bFh1c2pX?=
 =?utf-8?B?Y3FzQTJKOVhQd0pXUWZZenlEZmNpUFYyRC9HOVp4T3BOd0R4UGRTVVRacWR0?=
 =?utf-8?B?cFc1cWJBaXMvQkJBakY5a25ENkdPaGQzeUgrSEhMVWU5cHRUVnh2MGFQRmdx?=
 =?utf-8?B?c2ZvTVdXZkIwaktxQ042bmRieE12WlNramUydEZKcUo0VFdnUzN5QWFjLzJJ?=
 =?utf-8?B?Slg0eFZIOGlXYlUwb0xWQXV6L3ZPMWNCQVMvOGRocEtCNFB4MjBUMWt5TlUr?=
 =?utf-8?B?UGRXYnh2MG41QThsbzRFc05jK2tWd2pJaktBbmxpWXFHY0NJaGdtWDlJT2Qr?=
 =?utf-8?B?QkpCbkxpdm9IYlF6bUNPY3dEN1RYVHpXdXJEUlJqRXFyY0lNdmxhSDREeFZu?=
 =?utf-8?B?dHMyK2lvM01YNFpjQlVRYUxOVE9CcUdQVXFmM1BORlNWY3dhNzM3eERJcVlK?=
 =?utf-8?B?SWVIWC9jUXV2NFVrbklBeVlEZHNlMVh1R1Qwcys3M1loSmNtODZVa21zejJW?=
 =?utf-8?B?ckdyTzhJdTBrMFNCK0NkNUFCbjJkYmxzM0FqSFpZa1FYa0wwamdPVzJRQjFw?=
 =?utf-8?B?WTBUK2RiYWY2WnUySG9sNTRDWU5HSkV6RERuMGtFUWlkM1B4RjNJdDlGQ0kz?=
 =?utf-8?Q?IUXbDJfqEWekptmMpU0cXCk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUM5akh0VTFDVVFNVXd2cmhVMFVXU0JHVXBQZWZGazgyVFFjUWpmZXZtYU94?=
 =?utf-8?B?NHlSYTNLdkl2eTlsWVd1Q0c4d2plSEhqSlpXelBRcllBUkNkQ2w4OUtuSDIx?=
 =?utf-8?B?N0dMWmpsbHFaVWo1bThzQ0hXSGp3VEhObFZsZ0hCZXEvcGJUZWQvM2U0dnN6?=
 =?utf-8?B?Q2huSUl0T1pPTUN6SzBJNXVHOVV5WXVpQTMxQzkxL0I5azBrWnEzdzVORVpj?=
 =?utf-8?B?ekVxOTg3bjFBU2tCNTlmb0V5aG50Myt5STNic2xMSmE3ZXBwRVNrTkphT0V5?=
 =?utf-8?B?WmYzcjF4M2tORThETUZScVRYNXJINVJ1cndxV2ZNd3Y2VXNlRms2RlZLbWYx?=
 =?utf-8?B?blRlbUcxTXdWOXd4alBTM0F3dndGYkwvdUJRSHEzVmwyNnpMNXQvL2dvcDJU?=
 =?utf-8?B?dlY4NlVoNjJFcG0wbHlaMzFmWE9MckhiL3dwa2ovUXk5OTZoZGtaOE80NWd4?=
 =?utf-8?B?YnBpc1pORGxPdThMR20vemw1MXFpOTNrK0pVRGtkNlFHQUtVbTlTU3g4MGpR?=
 =?utf-8?B?T1E4MFhiYTlVTVIrS1NEVjEzYWIyNEhManpWQ1B2Q3JJNCtVbHFYUzVzNlc5?=
 =?utf-8?B?Sk9xd1diUko1VWhmSkhWR2g2S1RLRTE4VXJvNHZJaWhLOFNaM1VXdlVheU01?=
 =?utf-8?B?SzRFWHJ5TjJlVVV4RmtqeW4xMElmTUF0NTdhQmZmQXQ1WXlPOGM4cUZpSEdQ?=
 =?utf-8?B?VHhWellKZE9jaVJqdlB6eTM5QndlemZCa2h0VXBLc0xLdEFRK3hxWDVmZTg1?=
 =?utf-8?B?RzZndVVIWmdhM3JoME5QS3k0RjhzcEQ2UGMxbjVhdUR3WUk2aTJPYTBRQmw0?=
 =?utf-8?B?SWZ4TXg4S2hXQ2NiTDU4WTQzYWNFZ29CTWZsZHJCTDlvV0tLWDFHNG81UjVm?=
 =?utf-8?B?TFNtSk4ycEUya0ljaWdEekxtZGE2QW1DckRHYVp4VXBneXF6ZmxxeG53eTBW?=
 =?utf-8?B?N2VGZHRSNkpZQjU0amJjeTVlSC95Zk1DeUNPN2R1UXd3K3ZYSXZUbG5ySDNu?=
 =?utf-8?B?NmhYYU9oY2lIbmJHRnFmMWd4ejZIQW1oMDVkWVFTekJaeXJVMVAvWVNrR2hm?=
 =?utf-8?B?eHJlL1RUVjl1dWZ5YVlwbXp4ZlZqRkxuZXlLeDExb2dhTm85Y3VKdGo1clFu?=
 =?utf-8?B?K2ZySjFCcUZTUmgxVTg4aklvZ0hWUHZuM0ZlV0dKeTlnQkxEaW4yLytoTUEv?=
 =?utf-8?B?UVdtNnoxV296UXJkZHVmQkpwUUVHdFpydDV2Z05VUjF6S0JVa0FTN0UxM1dV?=
 =?utf-8?B?eFhDWm5sYVZtNEFSZCtmSkxmK2lZT0IyU1NlcFpMSWxnY1pMYmlLTWY1VWVm?=
 =?utf-8?B?L2lnRGxBSEl6cnBvV24xbEVCUXNlM2pqck4rV0VKUW1iZXU2S0ZwaDlBUDUy?=
 =?utf-8?B?bmtmalBYQ1RMdmZjN3pjWVZtT1FybThQa1RucmVpYlBaRUo1OGwvbXM3SmRZ?=
 =?utf-8?B?OFl4WFlIZzlxSGRhU05Sc2pWNE04TGdHbGpJRGJXcTN3NTNMUTNTYjdPL1kw?=
 =?utf-8?B?WHl2bXc0M1B3Z21LOU5JNUJOa0Qrem42dlQ5LytjYUxsZVhqbS9MZHVOMnZO?=
 =?utf-8?B?RUgyTDloTjhkVi9NaXZjVWNQVjJuOWtwZFYwTWNucnBrWkkydWh6amJoaWdS?=
 =?utf-8?B?TkRieHJwU1ZMNHNYNUxWNTBTWGY5bmxxNEIxYjlyQWYzVkExKzBJVGtnNHVM?=
 =?utf-8?B?ejNFdUpVelhJVUNMMDJ4MGtiSVBwSUhOeDEvMVl2TklNZ3hKNis0eVJPVlVu?=
 =?utf-8?B?d29NOHVKZW1mTDNsUEtZamtUbGhxTEJkNUVpMythcG11a1pTM1E1VVBjZWFW?=
 =?utf-8?B?NVdYUEx0ZVcrSFVmK1UxZVZWRktCMW12SEMweCtsUE11Z3FULzlsaWRzbEdY?=
 =?utf-8?B?OGdHcDNNY0xScnl2SGFRdDBkVnZQU3IySnFhS1drS0srekczYS8xOGFjSzZU?=
 =?utf-8?B?MTBRU1U1MnJMdmdIVVpMTTkrdng2MGRRUDJlRWVwZTNHb0NXVmE0ZklzUkNa?=
 =?utf-8?B?cFQ4aVBSbndLRTNxNjNkaU5wenpBSnd6bHNPcFliYXJWVVdNdnRRMFYydWJW?=
 =?utf-8?B?MTJpWjcxN0NkQ3JiMnQ3Y1FNNTVzVTUzWHQySU16ZGZWUmdDelZ0V2Q2dlJG?=
 =?utf-8?B?bVV5R1Q2SlRMbEJ0MnA1NmcwU3J5a1paK08rZDErRHV5WTFyQzRtbVJCaHdt?=
 =?utf-8?B?eUVGclJCV2JnOTYwTWNtU3BPWG1Ub3VudGxIL2hQSkE3YlZYL2xmTGNrTlYz?=
 =?utf-8?B?WUM5SGpQT2pxNndTcy9MakRaVjlFL1ZBVVRGZUVnY1ZwV0tURjlzZFYxR3pM?=
 =?utf-8?B?azUzYU1KKzlUd3J4TWkvVVFTOWR6cjBXMEpGM1hiZkdPak9DZndYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <331BEC154A558B4EB70BE8CF1C7BD9BB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NHg1+seOoSy2uUgwgxnmWQEtMXVBz5xExbHGKZDpHWe0tu2ythtkY/V9GfWvx9nWxWJERDy1l2ggrCvP+bJnxrngWCQfNjrOi5MclM1bchvgOzxs03wyE0x1HJ1niiM/OuEzBs1uN18eiBhgqVmx9LJNI85a+X8NUfZEg3WdTcWgnvVWlsBzgWakI9WeEtJJAiCA6S6alVUmPVOKHLJRG493pzfPk/yg4AWvDh4F9kADz9FO6O3xN43bYFga4gG/zP1ZDGNzJypzQdU0T37Usvx9QaWYeDHHXvTctnzdOv3y47vv4X2IpqHrEXdtG3mePidQQyOZH/glf4CiFVDA6wRBbfk3Ef8PFtEnpu+M6EyE7WDVr44VHWocWqcA8bz9SLfwFMJTQoX0aKDsAcYH0IaF8iWoO9YI6xWKnSFS+ZUVFwt2Ai3DECGrC7l7WoBrU8TQqozAmo7419W6IwZ6Ey9/khPGdF66VHHmLgJT6H1WM+Kbsg5ZQGPQwbZhQJFeYnv7/MGxKTwFrKcHVEY1nrIX/OKZpNzxyBPCFCeXvCeOPEzyvJ431JuE2gv+064V2wnhla7gp7PQ1MfJzc38GyR5aHbB9tcBHYOsPFc4KlnAHuoSjSF+0L5bK0qmftx1lSgtaLsLlvjOWlZ3cCcaNg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc51759-a334-47a0-3071-08de53bfeb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 22:54:48.9458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +PTur1754wNuMa50sqg6xRX82a1g1+i8Nm+qzj6ljnFbM2cCpzHrShFsyVQmW0Pv7NIxZQDRSFUtJ7ahdb/bug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE4OCBTYWx0ZWRfX3T5pnNx76LgS
 It1uoukZC3EfuTlYjJKnOOl0KJZMKzO45z7TbMQRYheLJl3T2JvOePnlYBolqYASMhbN+Q9t9OA
 VMbVczW9j6GlXK2ROy9/uLSrkCMlf/7962JuIbIlHkdMfnOwMH0Yo52MAWmwRURP42ComqGxwil
 xYdRzua4e8QUth5dVVwWFJmcJJGhyh1Ef0T7QPvc3TVkqXskTX4uzuLjHcYD24U6M4p7mJLwi1t
 e/jFpzPIzKrNVtv79jhWrgww2R0B1OWXzaJsTNxZitC6OYtrwowOWjOgCs0hIJkxwX0qf+7TGbP
 7RXvWLhVqG5LjP1F0Y6e0XmedyTDPb1mrAiDlpvSptFkU+MGYljRcFI6Rne1z6ZzOwI4XyV3Isa
 bKhNUwnT8wYXedv82RSGu8oUUq5B1kaWLVM9fV1Tw754kE877Lhq+iOO8FDasHdLaNZOX04/zOc
 RICt+O6d99QiFAgcjdA==
X-Authority-Analysis: v=2.4 cv=Qt5THFyd c=1 sm=1 tr=0 ts=69681ebf cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GlxLtLbQx24THTgHCTIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: YMDf1M8hEcw8fLp50aYqMwvxgj9y8rfz
X-Proofpoint-GUID: YMDf1M8hEcw8fLp50aYqMwvxgj9y8rfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_07,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140188

T24gV2VkLCBKYW4gMTQsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gV2Vk
LCBKYW4gMTQsIDIwMjYgYXQgMDM6Mzc6NDhQTSArMDUzMCwgUHJhc2hhbnRoIEsgd3JvdGU6DQo+
ID4gKyAqIEBhZGRyZXNzOiBDYWNoZWQgbG93ZXIgMzItYml0IGJhc2UgYWRkcmVzcyB0byBiZSB1
c2VkIGZvciBsb2dnaW5nLg0KPiANCj4gV2h5IGFyZSAzMmJpdHMgZW5vdWdoIC8gb2s/ICBXaHkg
bm90IHVzZSB0aGUgZnVsbCA2NCB0aGF0IHlvdSByZWFsbHkNCj4gaGF2ZT8gIFdoYXQgaGFwcGVu
cyBpZiB5b3UgaGF2ZSAyIGRldmljZXMgd2l0aCBqdXN0IHRoZSB1cHBlciAzMiBiaXRzDQo+IGRp
ZmZlcmVudD8NCj4gDQo+IFRoaXMgaXMgYSByZXNvdXJjZSB2YWx1ZSwgc28gd2h5IG5vdCB1c2Ug
dGhlIHByb3BlciB0eXBlIGZvciBpdD8NCj4gDQoNClRoaXMgaXMgb25seSBpbnRlbnRlZCB0byBi
ZSB1c2VkIGZvciBsb2dnaW5nLCBzbyBJIHN1Z2dlc3RlZCB0byB1c2UgdTMyLg0KSSB3YW50IHRv
IGF2b2lkIHRyZWF0aW5nIHRoaXMgc3RydWN0IG1lbWJlciBhcyBhIHBoeXNfYWRkcl90IHdoZXJl
IGl0DQptYXkgYmUgbWlzdXNlZC4NCg0KQXMgZm9yIHRoZSByZWFzb24gdG8gY2FwdHVyZSBvbmx5
IHRoZSBsb3dlciAzMi1iaXQsIGl0J3MganVzdCBiYXNlIG9uDQp3aGF0IEkndmUgc2VlbiBzbyBm
YXIuIFRoYXQgSSBoYXZlIG5vdCBzZWVuIGRlc2lnbnMgd2hlcmUgdGhlIDIgb3IgbW9yZQ0KaW5z
dGFuY2VzIGFyZSBwbGFjZWQgdGhhdCBmYXIgYXBhcnQgYW5kIHNoYXJlIHRoZSBzYW1lIGxvd2Vy
IDMyLWJpdC4NCkl0J3MgYSBiaXQgbmljZXIgdG8gc2hvcnRlbiB0aGUgYWRkcmVzcyBwcmludCBh
dCB0aGUgc3RhcnQgb2YgYQ0KdHJhY2Vwb2ludC4gQnV0IGlmIGl0J3MgaW5zdWZmaWNpZW50LCB0
aGVyZSdzIG5vIHByb2JsZW0gd2l0aCB1c2luZw0KNjQtYml0Lg0KDQpCUiwNClRoaW5o

