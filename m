Return-Path: <linux-usb+bounces-33679-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDPyJmk9nmkrUQQAu9opvQ
	(envelope-from <linux-usb+bounces-33679-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:08:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85B18E4CB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11A82305849A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 00:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C40F17BED0;
	Wed, 25 Feb 2026 00:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CwlNq7Ps";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C7mpKsd+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FBqxOpZT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9217A2F6;
	Wed, 25 Feb 2026 00:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771978022; cv=fail; b=scAaQ0xZcpWVvYTHm+AjpWCXMEeVKqck8fGhLdL+lNuSxDADMvxEKFcCpJeZ9VMN2BEd1fx6CChMMKbSx2k8ygRY7f7xjC94w8KfY8bFSI+9GTOaVhAhCKtwz1oa5uOX4zKGncosqGlFW3PErfjlE6ADu17KcDfTpzVILGX9cs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771978022; c=relaxed/simple;
	bh=AEFCrc0sfVIAR7GnD1fl9MS5FIXBQtnForOoEqVaiao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qgCTm3h16GjPsidywRTFEdw9yq0TOr36Ud9Z3u0PKFeDdPsmffM7/jHSG+8EMosSFLooMevLWnvUELutz3TIh7joOY2QTt/kcQQOv6Cdr9Zym502pMIpS3lIqZNEVZKOKH9EzzgB0P8F0qOq4iDZMspvDg6zf9Apq1eaf/QbbNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CwlNq7Ps; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C7mpKsd+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FBqxOpZT reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLBXWs1196916;
	Tue, 24 Feb 2026 16:06:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=AEFCrc0sfVIAR7GnD1fl9MS5FIXBQtnForOoEqVaiao=; b=
	CwlNq7PsjpTuyiA+VCYqiihNgc2lKyMLIXCDpsbQR8/dA9FJTi8E2JOZenP10b+o
	zyGqqTrh9edZuznOGus+2uWqRXSNjfbn1w+CcmAVZ7AA9FOgW4doypHy01oTHV16
	ebnHpu4qV17coXhyk6+c7r2FEZdeL5REjQ9ejmTAwxtRjNvu0Yv2o0hWvADIprdR
	TAzTZwsT3PAb9YkNwcPMSpEbdzPMSXfhjK6Tx/9APddK9PxsH2UIYvKRkH7YL/L0
	GvZERZnCNST3Pu8WQm8cAfhtIoCYXGoZigBQLtohc5PJdMqi19yV0sqL12JR5pDA
	9QARpxouXSTdJjSWc0QsYg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4chk930tnm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771978015; bh=AEFCrc0sfVIAR7GnD1fl9MS5FIXBQtnForOoEqVaiao=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=C7mpKsd+3oQSW4iaKlgRy6sPwUJPS2imfO+0QHHwxs3KBDYjTTj4WwA04FsHhYqV0
	 I0ve78h1p1V/IEFcj+zDvnc3wtE4TY/Kbpip5yykOQ+Ti1aR7OTYtDcqbp0k3bgXsx
	 sQxRVAP0YQdyNAqMabVd+zeSO+ucXvy3gMty+AaKJTu+pKFqHR70yvgpafo43X5I7o
	 xDqnnaaI64KrgvY6141Y/pR+UgVjdcEK8eZiFCnYCcYaNP8YNw7Z15rmpCVfeJnkp9
	 RgDGi/+ogoKtGwE/qavw0GUVUY+0J/32eqqOGHmwuyNhAv15pql7B4psD2rXGrA6A6
	 0H/pIRLPhjmLA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 89F0840343;
	Wed, 25 Feb 2026 00:06:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4B77DA007A;
	Wed, 25 Feb 2026 00:06:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=FBqxOpZT;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 39F8840607;
	Wed, 25 Feb 2026 00:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKvTkKrvQQxAc9j49jX3ESR7hGoKvhVMDG51HyXNMT+Ib2/7pUTTJIDPfRExjml1sMTdNR5oSQ2JzN5oO8XGyp9W9tVxX2CjggdpX1dBo5ip2Fbli1AqpTjuB722PX4tofICx++ZVHYatv/YrrUpoC/6KmyIWIaOFH4rgd0lzlRqGxriMTByNtcI+PIYy8B+VyxKcKQLOtpx9VJS/RycN1254PfRWD5PeglFDUU4rr3mHBuIun8LFZ4sOUW/X25smRQIQhiOFgBth+Itp89skJZCZ5KkAL/y0+/o98/Z8rG3fZKMkFrr/E2WUt5PtLbT6vBZpIsHqdBlMyp1wEO9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEFCrc0sfVIAR7GnD1fl9MS5FIXBQtnForOoEqVaiao=;
 b=o+qGBxiDwlIJNUtw3qCX2qnZM/2I5XqcQcL1Sd0I5YMd4m7Yh8ERLPSLLk0BB4rm59qH+TWNCxAZKN/PVA2y2V4nj8LlYvIUVURmPNJn8BadlIyoZq1erpKTJKYUlwdlMFO2yAmI+E5NMjrp2R7wRqAu0jz6AWBXqsP2rQcuwtpSRpVKrvYtODrzAL4gCmnyYnSyc8NxkrvCcUnRcwln1m+08LUURdI8okX12L2aDxxzUO0uZaMkl/r3K5aaWuE42LH4+N4jxqYQOa3mqpDSrsRA8Hd6YkIzsP/0Es3/S9cYWxSyQuEmjTOoatkMA/VIPZ2FoLWDAZT4BBrvpxIsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEFCrc0sfVIAR7GnD1fl9MS5FIXBQtnForOoEqVaiao=;
 b=FBqxOpZTYrBh38dVinVCq+4dEXc/jEJclZNK6QI2r6EdcNotVGm4efJWJlvWaZqBhxsN7mPcZHf6TlD7IjhqeI3SQJXIsnl9cxj4eVpA/wehME4fch+SRstvi5a2gycnx5XSIVgaBmSlAVMErOXVa00yMw8qav1SrS3Y15UwkWw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 00:06:49 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 00:06:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Topic: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Index: AQHcpV/T9oHLCnlbhEWUjnwF1fhomLWSioOA
Date: Wed, 25 Feb 2026 00:06:49 +0000
Message-ID: <20260225000647.rqmzcz62aqkfh7sg@synopsys.com>
References: <20260224073243.9053-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260224073243.9053-1-zeeshanahmad022019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6035:EE_
x-ms-office365-filtering-correlation-id: 1410a945-da9a-412d-a837-08de7401c5bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGxNQXJEYi93cnZEVWV5aE9LM0kwWGdsa1hkUitSS1NCWmVtbnI2bjRraEdP?=
 =?utf-8?B?SDFXUU9YenB0aHV3QUtKV2ZuV05HTGNXa2F1OVJraFFsaFJDOXhpUWpyL3NE?=
 =?utf-8?B?SVVabFlSbXplZE1HVlltVGtkdUdkT09pekp5eFhuK3lXcGVwRVRuQ0tDOGlU?=
 =?utf-8?B?VUV4UEMra2lvUmJmb1FzNVdoc3J6bmNQVXRUb0RlYisxTnRBV0hLOEg3Mjk3?=
 =?utf-8?B?eVQ4ajA4SUs5MVhtYWNQRDI3ejM3WlgrTEpKdFFTV0JQSnlUaHdoMkNUZlRy?=
 =?utf-8?B?bEhsZGFOOEdwSFluVVBwU0daZHpUK05tWUIzT0Y5WU15ODdlcENUVkEwQVBE?=
 =?utf-8?B?cmdFSE9aWlF5TWdscHlDZklNNVJONHpoNmJoVmZBTXdaYURZdjhGZnQ5U3RX?=
 =?utf-8?B?enlKNW5vSXVaeHRqMTRnc2NTZmFuRXBrRTlZR3BXYzVLd2x2ZGQ4Y3kyaWpx?=
 =?utf-8?B?TlNrbjRYclFQNmV3L1FiQkVTRW1NV1IyRUErQy94cVVGQTlEdHE3N1JJZ0tl?=
 =?utf-8?B?UU9jczR6bHNxdGUxc0FHc1JPUFdhUCszSkl2L1hsZWhwRjQ1NlZmZjlUTkhR?=
 =?utf-8?B?UyttZDV2VThYcXJEUEg5a3loRk5RWE9PZFZzR0xTRFN3TUxnS0tJUWZmV3hQ?=
 =?utf-8?B?UXlRbldhVFYvMTFqVWEwYmdFTlQ2TzB6YTBiN1BqdU0zRk5lWVpnM3orcXpj?=
 =?utf-8?B?UDhUSEUxWllKL0FsQ01JYm1TUGlVMEFnbEltU0p2dk40Y1ZMRThOSUdRaXVt?=
 =?utf-8?B?NWNyb3J0c1U2UXA1S1hYMjVHMjBwWTNoMjhTbjlRdmxDaWZmNzUvdytKN0U2?=
 =?utf-8?B?U0xQTmsvUXRxUXRycS9obVYwNHBpaXdyVmNLajhCYUdabHBPSWx5RExpVVB2?=
 =?utf-8?B?cEo1RXg0WXlpZjdlTDhJVVpLcU5ySU55WFJ2NWk2OGMyZjlwM2NBVVNXOHhL?=
 =?utf-8?B?a2M2RXBFMHpFMkgwRmkwNllCQ0JmcmE3QTZLRDVUOExuYm9jYzl3MktWZDd4?=
 =?utf-8?B?LzYvWGdTK2dmbUluTHhmbjNiMkxxRHNCd1JXZVZFTDJjTnY4VlVtWDlyMERy?=
 =?utf-8?B?ejhDME5vOGMzaitjZFI5NVkyUjBuUU5KcWdhQXFGTVZjRDk5TXlPeWdNZHp5?=
 =?utf-8?B?Ukpzek8wcXZUaWV6ZHlpMVlDUW91TVhIcENBZTA4WDZEcEJGNkhCWWZFanRv?=
 =?utf-8?B?NCtLdWFVaFltdGxXUDF6KzNRMVEzMmxIdW1MajZGWmZGY0NVQis4RlpCL1BI?=
 =?utf-8?B?WEVNdHpRMmt0RVhIWjhVUHNTMzNjT0EzZTNLaktnc2sxaXpWclRYVEhqSFpS?=
 =?utf-8?B?dkxuWGd5Ym9DSzk0eHc5NDRaUEJPWUZybS8xVnRCMXZhMTlQSjNhVHFZbjl6?=
 =?utf-8?B?d0hjYUlydG0wN01BWWxzZS8yWDNrVFF5UjloOXdRSUIxbGlIbG1zNUlPTE55?=
 =?utf-8?B?RDBGOHJkNlZDV3hSSng5UjcrUGJqSkVwRjRjWDkrVCtTeE53QUU1V2NpOTIw?=
 =?utf-8?B?aExzSFllRlUvZUFaSEl3WEw2NWFWdGVpSEt0R0Nma3FlV2Y5cWpDT0laKzRo?=
 =?utf-8?B?VlEyWTk3ZzRFNllsTVlFNDRSd09hUTMrRk1Ob1cyL2trckloZ0pDcDQxN1Ir?=
 =?utf-8?B?OGdRY2tsblJGdXU3Q0tYdzBMcVFSNU9UT2RmZlZSdDRDM1EvNkNxeHA3anJs?=
 =?utf-8?B?WldHV2ErMW55UUlmbFV1NEI3Tm9aWUlIZjJJLzZvSHdHbUttVXY3WmdFb1pU?=
 =?utf-8?B?Y29Za29GQVJJYkF6aHVxeDc0QXpLSE9aRGgxa29uenFQRVVNaFZSamVvYW1x?=
 =?utf-8?B?MmVBTFU3a0diaEs4TWNDb0tTa3VQZmMxNndEQmRhQkRjb0VCbDdMWG1VTEE0?=
 =?utf-8?B?Ym1va0kyN3BkYUZocFdUMGhNUkVHZk9XcDdKMVJDcUZFMjF0TlE5SHZGaHp5?=
 =?utf-8?B?ZHNyamRZLzRRU2o5QWgwSjgzUmNsaDl4N0MzRFNCNWo5MVd6Rkx6YnBVSWg1?=
 =?utf-8?B?Y2xyelhNdzFzeFRHNHRHNEVjRnZDYUVObVVOUm9oRTZSOEVqRVQ2Sm5sSVo4?=
 =?utf-8?B?L01BSjh1WG9zeTZsdGgxZ3RRZWppN2ZXSTBPNDlMMk1aR0hmVWg1cGlIa3RI?=
 =?utf-8?B?b0R6Z0d0NWpjTzFtdm9Nc2lKeG42SFNMZGNFSWdEMmt0Q0kvbWJXY2FQSHBQ?=
 =?utf-8?Q?Z/oIQV+GY9pMfAgUox8ltzQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnROZ3pDeEI1UXhvVWhCOW5GUUNzaFFhSGIraU42U25EVUU2amp3eSsveTM0?=
 =?utf-8?B?VUlKdXZzZnJLbzVPYkV3Q1k2Q05mQ25xNDV0NzBmTEJJTDJud1R5ZGxWaFg4?=
 =?utf-8?B?Rm1zVVB0UEI2RCs3WGpnYzVMNzUvQi82dmM1WDdLa05kY0w4Y2t1U0lGM2xE?=
 =?utf-8?B?VW9qUU5OdDZXN0x5RVRCSTl6Qzlab0JsVnprQXNRaFJ5VVhMa3ovb2hwaEE5?=
 =?utf-8?B?T2dTOVZBUWpPY2Y2QUFQZkRmY2xNbkV4a3V6UkJvR2FXVUVLeG0zK0R1V2Ro?=
 =?utf-8?B?REdBVkpPNklKUFd2azJOUHUzWUd0aC9zZGRZOFFtSUpXeGZhUUdobVduK2Jx?=
 =?utf-8?B?NlZwRGk1cnJVUDlkTDUyVU1QNWhEUFRGeXRvVEd3V2JvSE80N3UvTUZyYW1n?=
 =?utf-8?B?ZG8wRjlQWEZuaHlJajV2ZCs3WXY5OFYxdzBEVXB2TnZMSGh5cGdBRGJPN1dU?=
 =?utf-8?B?REw1K3pQUWxDTWl5YVVIWnBKZDlOR1RpTll5MFllTHhGRXVtVnAvZ0E4VC9S?=
 =?utf-8?B?TEV2elRibXJNQVdTQldWTWk3R3pYMGdDZ0o0NFRGTWpXOEV3K1d2OW5UUUdX?=
 =?utf-8?B?R2RCVTI2dkxicVFzbGdGQ0R2UGd3ODBiemxNd1FLQTNmN1dQd3c0dnhoc2VJ?=
 =?utf-8?B?OHhtZCtUMFZ0Z3ZWRDh3Y1dmc1FReGNEYTVTVFNnbzQ0enZRWENRaVZuRGwr?=
 =?utf-8?B?UU9PT2dSaElpdmdpYWR1bk1PZHA5bHR5SjhpMnRweVQ4QU42dW91cGpyUEJF?=
 =?utf-8?B?R0NuODFhbnFOOHZFditaT1Jnekg1Y2JRM1R2bUhnZEJJbTBxVVhSUk02RW41?=
 =?utf-8?B?enZWeTRHZXl0T0YrVGpSeG5qOXhkRnpJSk1oQTVQNUVrOW9rcDl2UkdpM3I1?=
 =?utf-8?B?WW1lNHN5TWlWWHBMTytNT242eFR5NUNmOFVuR3VsekN3enFjSG03cWVLemNJ?=
 =?utf-8?B?WHhIMUN1TDlCTzQ4V0NIbi83bXpNZ3g0Mi9IMko1UHRldW1oQTRrdjVSSGRL?=
 =?utf-8?B?Tmw5VWR3aXM1bGFKUUp4Y09XS2ZrYmpaeUpOQ2tnYjNqMFRrbHhVRXlFdWpi?=
 =?utf-8?B?clJSZU9EOElpMS9QR1dqK2l2KzV6RGFNRUFYT2h3RUt6UlRLejJlV1k2WlAr?=
 =?utf-8?B?MTlHR3h3eGFPN3RkRUlBSmZDdFBwY1RTd2VET3NQb0x1NGwwNWRTbXVYTERK?=
 =?utf-8?B?MGw2M1p1SkpQRG5OZWU2dHdDSXFxckdFMGZGUk9MemRtQ29RcGN4VVVrOHNL?=
 =?utf-8?B?YTNpcE42VThrV01EYlhiWDRKa0JBaGk5d0xsajFES0FOLzhRMmxnclRvRGxH?=
 =?utf-8?B?emtTYnhtT3RkV1ptSjV1Z0Z4ZFcyWVFnNEt1S1ZqY1I2SFg2NFo4Um1WcTFV?=
 =?utf-8?B?OUdIbjJFTU1zNWdmMXpyU3JSejQzbmw0amk2VEJFT0tnMVozaE5uNDVvQkkx?=
 =?utf-8?B?ZHpiTzIwdVVxaGhXZ05YYjNUNm5tejVQaU1XbmIvYkVPUldsTWY2VkFCSkMy?=
 =?utf-8?B?V2hMazQ1bXZjWHdEZS9NZEZQUkh4SVB0dzJ1MDQwb2lvbGxmNGRnOWJ4UjJK?=
 =?utf-8?B?OXp1K2ZaTU5ubGFTZTdxQ2xhcmJoY3BScllpU3AyMjZtakppWStDZFZab2I0?=
 =?utf-8?B?VVErTHQrSHNZSjFFK2h6SFZpbnhjSVBXN2l2NTAxbkpNejlXU0xhWmR3eDF3?=
 =?utf-8?B?YTEvM2VPRTVtbjdQbGhVNDlIT1QzZXVlcnRFZG9Ec3JFWHpaNWlmSmRtallu?=
 =?utf-8?B?NDNQQ01OYVFONndBdzZzbk5sYW5Rd1dCTEVROGxMTXJTZmcvTUxtYnpaUjFi?=
 =?utf-8?B?SkZ4azl0TXdVWmVkRENmMExFYVhtZURFWXFGWFRnY0JmOGtQVEtqM1JNb0tW?=
 =?utf-8?B?akpnRzlsb0JlUlY2M0xQUGwrRjF4dG1HYjNCKzF2NWl4KzJPNDc3YW9PZUl1?=
 =?utf-8?B?cC9Tc0toRnh5N0doaGZBRGMzN2lUVkhOd0phZGkrczlrbGVleWUvWW8rSGll?=
 =?utf-8?B?c3BFd2VjK0w2N0ZNYmk4OHBITUFxV0VlQkdNM2c1NUJGMFA5R2NBeXRoaitK?=
 =?utf-8?B?STI2RFk2MFhqMUdRLzBmNURVMU5vTGdVTytBTTFGNGF4UTVPcFpBR2FQQ2Fp?=
 =?utf-8?B?TWEwMHpGYXhLMGdodWxOYnNSOFFRSmFCbkg3OWI5MUtoTFloRHV4bWR2LzhV?=
 =?utf-8?B?ZWszeFZWQzRsVTZTWXJqVWI1ek5ZTE9qLzJ3Y3VUT213RXUyYThVWTJHT2Er?=
 =?utf-8?B?UWxWZFJGR040RVJRWUVRK2pZMTYzdGxrTStWQnd1ekRXR1ZiOFFSczJIemZj?=
 =?utf-8?B?NFhWRDZWSkpHL3VBVnRlTll2Njg0Z1BxODAxT25UTHkzazJjVTZjdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F01524755AFB1042B656129BFE60E3A9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JxTOb0dBrRbN13E1cwE2YNbgi2FhCEipfIoYxQLCkgxqPtSg6E1MYKzYzs56oBliC8/FnbhDWYZtlDBpDEd9QFqijigpsfUHMvYvHgNHaXgaCcGdsWGDdVdp7zIQBDcKEc1oei7es496GFUNucCfi1udZKDP9avAUBbw1gib8dF5N6C+eK8BF8Y6ABaLCzGlnTCOwe0BUmk2crbokw6Q6PDHez4nQdXicd05AJDuwnkTWAFwwWROlcMcxLJ5nRWk3VSblLinE6hAK1fkNrkaIlXSdeDOBY2zxyC/d361v+HTeBsBvQHouc29Yq26EDy5yRPwkMBHMDDwZMiPDAU/bPrqR7o9BcqLUCL9RNz67+pGd3HPm1mBQvCMBvIiHXwNHwTMbd8Swwt0ONdtr0ZrSM+7jkoA+s5bgI0Ut1zoe21F3HvYX+rHnse6ByvOrprDBmGFWq8rYQT1Mv+xtwhm4EZZD99u6NB5GC31JDLx8RcS84LU2uEJwfkzMTb/l/Umu3x+VPrAlfHRS9/g/h9X9gOaZPSa6qkZiJblfVqiCOMqm14cqMS8BR7Ou4Y9X3mdEx6AgUC5281WfLS2tA34n0CduSpGQcnOT36VRIz9B4r4OMsTTWEVaBx3NL5oNXye3LkqmPNtUg7PHgGZpWIK/A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1410a945-da9a-412d-a837-08de7401c5bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 00:06:49.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oa+QEge01SPmdVfXFLsUr+OmJXLS3nAYVqKCbjpVMjDa+4oQEBJJKGJMgEKyWqloGycSp8RqnojaMssOHhqk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Proofpoint-ORIG-GUID: OzUnPa7mI-thcEdsGZpVybwgwQEMnSwI
X-Proofpoint-GUID: OzUnPa7mI-thcEdsGZpVybwgwQEMnSwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIxMyBTYWx0ZWRfXz8avQJ81Z7ip
 +ptCciFfqvy4HlV29/UiVzGif3vJIl76duUKr3/Ygdckfc9ei7DxAtcHYvLFv6Y2ghMsdCSpR+i
 xlcVvEXMDCgFMq+nMZWRjwRqjJt21PQT30sTIhyxMLW5Y4OXn4VNw+1/TB5mCwzPyzfHW4ty5EC
 aM8kiVYVXPBD+YvdEyu3wnsb+Pe9SFAyW8CO39KhqUD6Qe1VIWcxFRHOlHrdb8l7Wb5UgfHFX+U
 1H9fevVZzMVAMJrBbSF9KJAUVKOH8X/u/Nrj8lXrAj6XwDzwL7kUIfYmpO4qzghJdSmj3CUNnbC
 /CaaWeJpB024ZfZGl3DaOojKs/iIC8KdmGaCtPZ5JXucLAtKuxqGgbBbvIkVm7/HL6wSEhkIrjx
 n84tIAYD7XbaR9VhFYRvZOLUkwWYTm4FbFWpm0xlyQnf4IM7AiKQ/X8dV/9xGfpW937NIn/ujPp
 wavM61RugBK1mIwrqWQ==
X-Authority-Analysis: v=2.4 cv=DqdbOW/+ c=1 sm=1 tr=0 ts=699e3d20 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=bFIVNIMtsXGMemHQ2KsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602240213
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33679-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A85B18E4CB
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMjQsIDIwMjYsIFplZXNoYW4gQWhtYWQgd3JvdGU6DQo+IFRoZSBwbGF0Zm9y
bV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbCgpIGZ1bmN0aW9uIHJldHVybnMgYSBub24temVybw0K
PiBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWls
dXJlLiBJdA0KPiBuZXZlciByZXR1cm5zIHplcm8uDQo+IA0KPiBUaGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiBpbiB0aGUgbW9kZXJuIGR3YzMtcWNvbSBkcml2ZXIgY2hlY2tzIGZvcg0KPiBhIHJl
dHVybiB2YWx1ZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gemVyby4gU2luY2UgemVybyBpcyBub3Qg
YQ0KPiB2YWxpZCByZXR1cm4gdmFsdWUsIHNpbXBsaWZ5IHRoZSBjaGVjayB0byBvbmx5IGxvb2sg
Zm9yIG5lZ2F0aXZlDQo+IGVycm9yIGNvZGVzLiBUaGlzIGFsaWducyB0aGUgbG9naWMgd2l0aCB0
aGUgc3RhbmRhcmQgcmV0dXJuIGNvbnRyYWN0DQo+IG9mIHRoZSBwbGF0Zm9ybSBJUlEgQVBJcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFplZXNoYW4gQWhtYWQgPHplZXNoYW5haG1hZDAyMjAxOUBn
bWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDQgKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBpbmRleCA5YWM3NTU0NzgyMGQuLmY0M2Y3M2FjMzZmZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IEBAIC01MjYsMTQgKzUyNiwxNCBAQCBzdGF0aWMg
aW50IGR3YzNfcWNvbV9maW5kX251bV9wb3J0cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiAgCWludCBpcnE7DQo+ICANCj4gIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9v
cHRpb25hbChwZGV2LCAiZHBfaHNfcGh5XzEiKTsNCj4gLQlpZiAoaXJxIDw9IDApDQo+ICsJaWYg
KGlycSA8IDApDQo+ICAJCXJldHVybiAxOw0KPiAgDQo+ICAJZm9yIChwb3J0X251bSA9IDI7IHBv
cnRfbnVtIDw9IERXQzNfUUNPTV9NQVhfUE9SVFM7IHBvcnRfbnVtKyspIHsNCj4gIAkJc3ByaW50
ZihpcnFfbmFtZSwgImRwX2hzX3BoeV8lZCIsIHBvcnRfbnVtKTsNCj4gIA0KPiAgCQlpcnEgPSBw
bGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbChwZGV2LCBpcnFfbmFtZSk7DQo+IC0JCWlm
IChpcnEgPD0gMCkNCj4gKwkJaWYgKGlycSA8IDApDQo+ICAJCQlyZXR1cm4gcG9ydF9udW0gLSAx
Ow0KPiAgCX0NCj4gIA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpZb3UncmUgdXNpbmcgdGhlIHNh
bWUgJHN1YmplY3QgYXMgeW91ciBwcmV2aW91cyBwYXRjaC4gVGhpcyBtYXkgY2F1c2UNCnNvbWUg
Y29uZnVzaW9uLiBDYW4geW91IHNlbmQgVjIgd2l0aCBhIGNvbW1lbnQgb24gd2hhdCdzIHVwZGF0
ZWQ/DQoNClRoYW5rcywNClRoaW5o

