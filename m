Return-Path: <linux-usb+bounces-18028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5E9E1372
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 07:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6331604C0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 06:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EBC187325;
	Tue,  3 Dec 2024 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gnFNZVcZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013008.outbound.protection.outlook.com [40.107.44.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169E3398B;
	Tue,  3 Dec 2024 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733207977; cv=fail; b=X/QT2PKbwp/n7ATnIBEvja6e7ukSEYVFWvpo4HpY0bGpX9/OsqGYZOH+Q8hlsUdZaWwdEP8QI37UJnMxI9vuPOJyoq/ViFbWklR8gshiTb7bB3jibThRqWbei4mNQFPhKUWg0Dd7FIkvtgG5FoYJVv8e2vSlLgzSlyQ3fPlmZ3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733207977; c=relaxed/simple;
	bh=iOdWeudlvr89EjP5t4LTAcGRTk5Bx72zoAjj8G8znsQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=em2O5hXZcNcedrehMrW2PAYE5J+okE87KNfSGCIFkg8MAfS38hl0R5JpFO+tbM0BHOE3EBBOOSTmTrqfkjC8w3ZhWBbJItvLAeoRO/GTMiiFXT9BTE6IzpNPrAOkYcEzcBh74c4zxgOQ/SMqgtwpNE3eCH8eYtAcipiBm7Q+KyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gnFNZVcZ; arc=fail smtp.client-ip=40.107.44.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpqhTqfBJSivLXezl2v3nEF1w3ErPWsdK41trsSFs/x9XR/A7gZHmuBSOU44+mBKa35MwofJvA37G2UN1Y07EduM91Q18uaqbJKtbh0fI+5dKYrBnrr5YvaFFv3Y7vxZL1BRnaRRgblgz6LNfM2GuEZUOwwxiiAbZGwffnG10nTZE+nF1BlSV1j5vySNsjouAlIAfToZW9fEB45vrG6vWGd/91xHs7jnk3rincFCWtwTW43I6+9m5r+tmtdtWyvw055aNOwtR2mwqwlAm5fVZ4n+lfvzD8Gctux5cag69aRgrpnzzUi9a2Eh1Grt+vHuxrPA4bA+9HbvGCrT6xTqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOdWeudlvr89EjP5t4LTAcGRTk5Bx72zoAjj8G8znsQ=;
 b=Hy0b22dowb/3ty4gUFFplWqdx8fMtRpgHH5S+BscQhCYiwRkPQPRJRibNpwAlfov/RLUCi3PruBASh2GYdTHr2co6uf+ZNL04i6mRwjG0l5IBZj17ktmVMheMQXHx8xe7loDFuR6aLN2F3ESv0j7CNcSZUq/ktlnGUMH3Mc+q6yUv6TV5bP5IqRMWPF11GVZS6ANptmkPwdnPBWTWt6ne9Ux7xtzwTfowZricH4HR27r9YL8sW7x/71tpoWw0nXVc80YHX3HhY4lmOtwLo5leRQJJb5nLIqET7lOA56w+/7BcI6T/axo51HzNbgp+BNS0Ow9FnuWWeUn56nSdGKJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOdWeudlvr89EjP5t4LTAcGRTk5Bx72zoAjj8G8znsQ=;
 b=gnFNZVcZ7i7irIgAPeybhKuVtGen3+D7BQWT3PCpT7KmU6ZeGOQaWLyGyW1X1s3Gaa66FqcvCmBOFupNiu7o4Zu2kTCI1nF9RVqHmLwoxhhv4pbqnJRHzITpCIwHMzBRot9FVVyrMG96DCpNR3y0m/MB1cCNnPDfSLRWIMfMwIn0K4rIWvLlwf4dRtEMuLeEuCK1qNEm1a+BVT5STpEDTgMxYpbHcBs5jVp4f0UHDpRSOy16159DxTX2nGNd0nX6wDrtqfb4qSprrfjwvuOuVvjl7gMo9BezIrAUjxizHV2VD+ozqR+31Vl9P8SPz3O/yniOydBB/99tC0WQeHz8ow==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYZPR06MB5395.apcprd06.prod.outlook.com (2603:1096:400:201::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.9; Tue, 3 Dec
 2024 06:39:30 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%6]) with mapi id 15.20.8230.008; Tue, 3 Dec 2024
 06:39:29 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Prashanth K <quic_prashk@quicinc.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "quic_jjohnson@quicinc.com"
	<quic_jjohnson@quicinc.com>, "mwalle@kernel.org" <mwalle@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJpYWw6IEZpeCB0?=
 =?gb2312?B?aGUgaXNzdWUgdGhhdCBnc19zdGFydF9pbyBjcmFzaGVkIGR1ZSB0byBhY2Nl?=
 =?gb2312?Q?ssing_null_pointer?=
Thread-Topic: [PATCH v3] usb: gadget: u_serial: Fix the issue that gs_start_io
 crashed due to accessing null pointer
Thread-Index: Ads/0KOYIMV5fb0KR0SoXAeOq8TMMgFdKruAAAHSM/A=
Date: Tue, 3 Dec 2024 06:39:29 +0000
Message-ID:
 <TYUPR06MB62179A94EB3FF2AD10AA9712D2362@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB62170A30651D64EB59F94B88D22F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <59bc14c1-502e-4931-bbce-e1b01ebd53b6@quicinc.com>
In-Reply-To: <59bc14c1-502e-4931-bbce-e1b01ebd53b6@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYZPR06MB5395:EE_
x-ms-office365-filtering-correlation-id: 64b8ff46-ebaa-4a8e-c422-08dd13653d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?MjhVUGZULzV6d01VTWFGMU1Fd3Y1QlhaUmFqSVNvc1czWWRpQUdrTHFrVktz?=
 =?gb2312?B?NUZONlZJbklIenN2MEFPVGx2WXovVGNzK0tYbFgvQ0lMbEozTkJ6YXdCNEZO?=
 =?gb2312?B?WXlOYlRWWmpJTHIxVXlhNS94Wm1sd0NRV21FTk1QSkZ2SlA0QW1VYmFKMTZF?=
 =?gb2312?B?VHhrVGV2TS9lbkVDTzdDaVNNZDk1RkFFQzZyK2J2eGJmWnNxSzRseThtMDlH?=
 =?gb2312?B?K0F3VVpXRXUwby9SUjhuRkFsOEVUcmI5RU5oYmVNZkkyWCswQi9KbmxOem1r?=
 =?gb2312?B?SnpmWjJHN2ltR3ZxbnZjRERIYzV4RVlWQnJTejY1a2RubnJZOG4zMmpkZUpw?=
 =?gb2312?B?SmRWTHZtNEZ1Qk1UeXZCb250YjJUWjZBQWQ2K1VkKzVwQ1hHWm5HY0E2cmFx?=
 =?gb2312?B?N3ZUN2hQSDJMcDRqMWNuKy9nK3g1aGlsdExQT0JGZ3paalpNaEM5R2F6V3Vk?=
 =?gb2312?B?ajFzQ043RFpYdjRMekg4REZ2ZnUyQkc4MWRKV2hibzJLZDAySHBlTmJ3MU9y?=
 =?gb2312?B?YUhPczBYU0dZYVE0dVZuZ0tlVUN6QW0wTkZvaVM0dTZ5UEJVUVNWMUM0aFBW?=
 =?gb2312?B?MnZSd05HeVRDSVFjcWNodTlxaytmUDhrakNhQ2lrcVRrbWkyMTVMenl2Y0JE?=
 =?gb2312?B?cHRwZlhmTE5SWDkzbGY0MkZzMmVrL1RLdndkNkUzbUF4SzgvN01RRE1UdHNK?=
 =?gb2312?B?NG9aK0ROQkFnOEtNMEo5ViszQVU1dmRra2c4U01QZ0NjejN2d3hZZy9RcUR6?=
 =?gb2312?B?UWNvTXBncFFBeWY5a1NyNmtQdk8ycUl2WjBmUHp0eHpUdkFKWEUyQ2Q1K1lO?=
 =?gb2312?B?M2szZ1E4V3FzY3RnNlNlb3BMUVpLTjhXYkg5clA4Nm9RY1ZPZTd3aVI0QkZy?=
 =?gb2312?B?MEg0aGtheVRlSm16c0JzQ1UveEpXQmFpUGw4b0tUVFVDSndLSXlVOVVLOWFN?=
 =?gb2312?B?VEZ1THVPazBUNDdQMHpiWHpsTHA3K3JkNjRBdTkzUU0xTFJnYk1Ed2F4UVhQ?=
 =?gb2312?B?VnRocVpUVlZRa013OWdzVm1VUVI2Y0ZZSXczVXhuZVFNVUlBMS8yZUZFNlN6?=
 =?gb2312?B?Q09vSGY5YUdnTi9MMVdrL0tnejFWdXRRNEV0NCtyenljdlFXS0Irb3Yvbnk5?=
 =?gb2312?B?OUNJMG5FRjQ0d3gzaFhkSkZkR1JQbWUxaTE1czFJUEw0TWRUQzBWZTZsZzdX?=
 =?gb2312?B?em5aMWdhRlZNV2MvbHZJNFNSTW1tVUZlRC9MNlFqVk13U2I3cE1PenhzQ1Bn?=
 =?gb2312?B?aWlSQVZ0R21ad01YRlRiQklxY1BhbzQ5Q0xKbndhWkxjQnl4dzZKcFJvSnhN?=
 =?gb2312?B?cVMrbUtRSzIvN3NQWVhLd3NrSDA3clZQb2NrbHNkZUw1OGs5TTk3QW5pc1h4?=
 =?gb2312?B?c1pINDFIZDRNTXZLazNEdEEvbW41L2dDVWRQT0hwMm56V1VISXptV2xBcnRv?=
 =?gb2312?B?aHdqL3pvaEVvTFlHS0JPbWlwa3AxZ0RJbGNSWjRNcHJONEdIQ0VCREVBQ1pG?=
 =?gb2312?B?QkNsVDlaS2oxcWZqZGRWcnhqeWZlL3RLQVgycVg1WUl0Q3lSMTMwZ0tXOXJn?=
 =?gb2312?B?NUh1UEs0SzlDeVdaeUpLQnVRcWlxYlBqRU5Dak1mT1VwUzhoQ0JlcHJrZzVI?=
 =?gb2312?B?Z0x2Mk5XZ0FmUFMrQnFncGFBSzNhbEU3VzhqUnF4TFNteXZBcFZBakdDNFEy?=
 =?gb2312?B?bDdwZzM4MmliT2Foc0tCSjFtYUhuWjdJQXd6aDBuL1dCSTJBc0srR1BEVEFw?=
 =?gb2312?B?MUpSSS9zS2pLQVY1SnFSZTNtT1dlZTdmZTkzWndaWkZsR0UrSkVSMStNck43?=
 =?gb2312?Q?tP9AAzkGZN+pwpHAc8j4TFio9lEL+TXVFahpE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?OE5VakR4NkgweUFycDQrblp4akdFcHVZT1dnVVhiMTZLZkNaWFJpQ3VwZ25z?=
 =?gb2312?B?SFFwZXJsSStQRW56TEVWMThhOUYxN1dIUDVVQVdXNHdBYklIamlIYkdMRmN4?=
 =?gb2312?B?Nnh2T2lZVUdQd0praklIa3RacUFWYWlqclB4YmdvWEpoOW94VEJOaWZNd2k3?=
 =?gb2312?B?VVhwWVJoU0RqNWRzZFdSdUgrWW1waG9TVFFUOWt6L3I4U2tNb3ZnbEJrOHMw?=
 =?gb2312?B?SXdMOWlIekl2Y2QyN1lKTnk0OENHSWRENUxjZ3Jqc1ZlZGtPTG1qem9tRkFJ?=
 =?gb2312?B?Ym8zRUkzMS9URnVtQ1p3VStjZUZnNURSejNobjIzUzJ5VDI4bVM5Z3Ntenc1?=
 =?gb2312?B?WUVDUUFoWFB5YTBnNkM1Q2JGaTlrdTZTUmVtZThFQjBHWVNVN2xxWlJ2Y0c2?=
 =?gb2312?B?TVk4RVNFeEpmc0xjcndOWVFEbG1ObmR3K1BzbEltUlVMODJibHdaM01HTDdn?=
 =?gb2312?B?UnN0bFpPNC9YdUQ0b3hjWlp3RjJ5NTZ3REFqUHgrelpSYXFhY2NCVnArQzkw?=
 =?gb2312?B?UEVrUk90c1hBNFRjTXFOdUt4cmR4MEF0dzZCeHFyZlFYdzhvanZmUHlSK0VM?=
 =?gb2312?B?NVV3V2x3dlNWaWhBMW5nY1luLzBwVmxqOVlCQVErZ1kvaVZGMVdkV1R3Tytw?=
 =?gb2312?B?UGxnMmx1eGhNZnA3QlRuSStLdzZDbjdRNmFTcDRaci9XSXRsUWlaamxYSjU3?=
 =?gb2312?B?bGNXUVk0bzdHejMzWnJzeEJGR1A2dHlMeFpESHl5ZE9iZlA4T2YxaDJRZzgv?=
 =?gb2312?B?aGttbFBFcDd4dTdwV2NQdWNmT0dOSWczOTk4QkM3V200S0cxMzRvQnJqVjJa?=
 =?gb2312?B?Nll2RFNjZ0hhbW1xMlpUTVQrZXVCSXVvMzJGN0xWbHl0T3Byd093WWkraE5N?=
 =?gb2312?B?c0FQV1hFZk5IYUJYODhsMHlMZ2pCbytyQUROVnFqbk8wVVVUdTVTL1ZpNVpG?=
 =?gb2312?B?UHdLMUlVSndHcEs4U1lmUXlFUlJMZ2xMWUxsVllWTFhKZTEyUWlqa2xLTVha?=
 =?gb2312?B?ZEJmNjBGTWZIM2h4RytLQllqL0UrRmlBOWZjbWhZTk9CaDBEZTlnNjljQXRV?=
 =?gb2312?B?bHI1NEpVOVJ5S0tVQVpvcnczRlVMSWE3eHV1SzhSbFVVUHRWUzd2cUxRZ3RS?=
 =?gb2312?B?a3k4ZHJDdUx3Ly9aRzFVdkFPbjRzUFhyOUlCTGJjRmpkaEVZRkVrT2t4cm5y?=
 =?gb2312?B?N3ZEZjV3RjhjeDk3T3E0dmdXcmNIWEtwUUZtdEFiNE8vUkxOVEFGRmRWQ0JN?=
 =?gb2312?B?d0hkQ0ZDVUxydXh1SG8xR2NWSkhxcFAxU241eHF6UTZoOTFjbC9sQTM5c0pt?=
 =?gb2312?B?UWl6ODhHTmNnRTUrSTlweWtWMEhaUjdoeWFQZml2S2dPMmh1L1dnZlhBM3k4?=
 =?gb2312?B?Wkx2ZnNGR3Y4T1ZPVXR0Y29oSUp0MWZLcmt1N3Y0K1dSMkRHQzBYVThoVERw?=
 =?gb2312?B?WCsrTlVSbWxmdmJES2c2ZkZGcHpydThYSUN1UlJ0dlViUEhHbVlCTlJUUzRv?=
 =?gb2312?B?OHpmZEl6ditTU3AwSlhEdVZ2K2FsRlJpY2hJRHV4M0tjWS96ckhSc3ZrNzU2?=
 =?gb2312?B?Z1hOV1g2OVVWWkVXZURzOW53dDlNcjEzRXNpdlN6NEI0YU5XUkl1bVN4VVp3?=
 =?gb2312?B?c2NpVnptdnNhUmZGWFhsazdoZXlibjNKMTdYUzVZSGYrbW5wdnlYako4cDF5?=
 =?gb2312?B?TmlYZnZXUjlNQzhLb2kwU3NTS2kwcFltQU5FUnJMOFlpaVBJRHdFSi9VQjkr?=
 =?gb2312?B?Z0Rjb013WUhibmFIZTkzak5GYW1ManFkNTZLSHlja3R3VWdDT1YxOVRuQi9P?=
 =?gb2312?B?WEFSYUJKQUxVSE9NU1lmWkhJSnI1ei9xSC9IeDFHejhOMTlLSEV2VDdOVkZ2?=
 =?gb2312?B?czhDNU1QWml0YTRPSUcwUmJKWlBmWndEdTcwdThuRzJUSWZEbGdLR0QxRFRk?=
 =?gb2312?B?d3IyTlQ3SUt5MlMvOHBkenZ4aG5DR3Zzek5TVldmbzdhenpRWGRFZ3VrZkVt?=
 =?gb2312?B?SThWS2RyaVRrNzc1KzRhbkU3Q3hhNGQ0WW5Bd1NqREk0aEJaVTFZT2liTFNP?=
 =?gb2312?B?SllManY3M05RZE40Szl1d2FYSXIwbjh6V1N5RUFLemtRYWMyeFlBUE4wNUlT?=
 =?gb2312?Q?zZrE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b8ff46-ebaa-4a8e-c422-08dd13653d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 06:39:29.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJYDHNrpDm0G6kdTiqnUtE8+WeEkRVczYaR0trdQV35vsBS4+/WdcrXfADfZorTgxIK+Vhk7Il21gkireJVySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5395

SGVsbG8gIFByYXNoYW50aCBLOg0KDQo+ID4gRnJvbTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZp
dm8uY29tPg0KPiA+DQo+ID4gQ29uc2lkZXJpbmcgdGhhdCBpbiBzb21lIGV4dHJlbWUgY2FzZXMs
IHdoZW4gdV9zZXJpYWwgZHJpdmVyIGlzDQo+ID4gYWNjZXNzZWQgYnkgbXVsdGlwbGUgdGhyZWFk
cywgVGhyZWFkIEEgaXMgZXhlY3V0aW5nIHRoZSBvcGVuIG9wZXJhdGlvbg0KPiA+IGFuZCBjYWxs
aW5nIHRoZSBnc19vcGVuLCBUaHJlYWQgQiBpcyBleGVjdXRpbmcgdGhlIGRpc2Nvbm5lY3QNCj4g
PiBvcGVyYXRpb24gYW5kIGNhbGxpbmcgdGhlIGdzZXJpYWxfZGlzY29ubmVjdCBmdW5jdGlvbixU
aGUNCj4gPiBwb3J0LT5wb3J0X3VzYiBwb2ludGVyIHdpbGwgYmUgc2V0IHRvIE5VTEwuDQo+ID4N
Cj4gPiBFLmcuDQo+ID4gICAgIFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgVGhyZWFkIEINCj4gPg0KPiA+ICAgICBnc19vcGVuKCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdhZGdldF91bmJpbmRfZHJpdmVyKCkNCj4gPg0KPiA+ICAgICBnc19zdGFydF9p
bygpICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvc2l0ZV9kaXNjb25uZWN0KCkNCj4g
Pg0KPiA+ICAgICBnc19zdGFydF9yeCgpICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdzZXJp
YWxfZGlzY29ubmVjdCgpDQo+ID4gICAgIC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLi4uDQo+ID4gICAgIHNwaW5fdW5sb2NrKCZwb3J0LT5wb3J0X2xvY2spDQo+ID4g
ICAgIHN0YXR1cyA9IHVzYl9lcF9xdWV1ZSgpICAgICAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZw
b3J0LT5wb3J0X2xvY2spDQo+ID4gICAgIHNwaW5fbG9jaygmcG9ydC0+cG9ydF9sb2NrKSAgICAg
ICAgICAgICAgcG9ydC0+cG9ydF91c2IgPSBOVUxMDQo+ID4gICAgIGdzX2ZyZWVfcmVxdWVzdHMo
cG9ydC0+cG9ydF91c2ItPmluKSAgICAgc3Bpbl91bmxvY2soJnBvcnQtPnBvcnRfbG9jaykNCj4g
PiAgICAgQ3Jhc2gNCj4gPg0KPiA+IFRoaXMgY2F1c2VzIHRocmVhZCBBIHRvIGFjY2VzcyBhIG51
bGwgcG9pbnRlciAocG9ydC0+cG9ydF91c2IgaXMgbnVsbCkNCj4gPiB3aGVuIGNhbGxpbmcgdGhl
IGdzX2ZyZWVfcmVxdWVzdHMgZnVuY3Rpb24sIGNhdXNpbmcgYSBjcmFzaC4NCj4gPg0KPiA+IElm
IHBvcnRfdXNiIGlzIE5VTEwsIHRoZSByZWxlYXNlIHJlcXVlc3Qgd2lsbCBiZSBza2lwcGVkIGFz
IGl0IHdpbGwgYmUNCj4gPiBkb25lIGJ5IGdzZXJpYWxfZGlzY29ubmVjdC4NCj4gPg0KPiA+IFNv
IGFkZCBhIG51bGwgcG9pbnRlciBjaGVjayB0byBnc19zdGFydF9pbyBiZWZvcmUgYXR0ZW1wdGlu
ZyB0byBhY2Nlc3MNCj4gPiB0aGUgdmFsdWUgb2YgdGhlIHBvaW50ZXIgcG9ydC0+cG9ydF91c2Iu
DQo+ID4NCj4gPiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgYXQgdmlydHVhbCBhZGRyZXNzDQo+ID4gMDAwMDAwMDAwMDAwMDBlOCBwYyA6IGdzX3N0YXJ0
X2lvKzB4MTY0LzB4MjVjIGxyIDoNCj4gPiBnc19zdGFydF9pbysweDIzOC8weDI1YyBzcCA6IGZm
ZmZmZmMwOGI3NWJhMDANCj4gPiB4Mjk6IGZmZmZmZmMwOGI3NWJhMDAgeDI4OiBmZmZmZmZlZDhi
YTAxMDAwIHgyNzogMDAwMDAwMDAwMDAyMDkwMg0KPiA+IHgyNjogZGVhZDAwMDAwMDAwMDEwMCB4
MjU6IGZmZmZmZjg5OWY0M2E0MDAgeDI0OiBmZmZmZmY4ODYyMzI1NDAwDQo+ID4geDIzOiBmZmZm
ZmY4ODYyMzI1NmE0IHgyMjogZmZmZmZmODg2MjMyNTY5MCB4MjE6IGZmZmZmZjg4NjIzMjU1ZWMN
Cj4gPiB4MjA6IGZmZmZmZjg4NjIzMjU1ZDggeDE5OiBmZmZmZmY4ODVlMTlkNzAwIHgxODogZmZm
ZmZmZWQ4YzQ1YWU0MA0KPiA+IHgxNzogMDAwMDAwMDBkNDhkMzBhZCB4MTY6IDAwMDAwMDAwZDQ4
ZDMwYWQgeDE1OiAwMDEwMDAwMDAwMDAwMDAxDQo+ID4geDE0OiBmZmZmZmZlZDhjNTBmY2MwIHgx
MzogMDAwMDAwMDA0MDAwMDAwMCB4MTI6IDAwMDAwMDAwMDAwMDAwMDENCj4gPiB4MTE6IDAwMDAw
MDAwODAyMDAwMTIgeDEwOiAwMDAwMDAwMDgwMjAwMDEyIHg5IDogZmZmZmZmODg2MjMyNTVkOA0K
PiA+IHg4IDogMDAwMDAwMDAwMDAwMDAwMCB4NyA6IDAwMDAwMDAwMDAwMDAwMDAgeDYgOiAwMDAw
MDAwMDAwMDAwMDNmDQo+ID4geDUgOiBmZmZmZmZlZDhhZTBiOWE0IHg0IDogZmZmZmZmZmUyNjdk
MGVhMCB4MyA6IDAwMDAwMDAwODAyMDAwMTINCj4gPiB4MiA6IGZmZmZmZjg5OWY0M2E0MDAgeDEg
OiAwMDAwMDAwMDgwMjAwMDEzIHgwIDogZmZmZmZmODk5ZjQzYjEwMCBDYWxsDQo+ID4gdHJhY2U6
DQo+ID4gIGdzX3N0YXJ0X2lvKzB4MTY0LzB4MjVjDQo+ID4gIGdzX29wZW4rMHgxMDgvMHgxM2MN
Cj4gPiAgdHR5X29wZW4rMHgzMTQvMHg2MzgNCj4gPiAgY2hyZGV2X29wZW4rMHgxYjgvMHgyNTgN
Cj4gPiAgZG9fZGVudHJ5X29wZW4rMHgyYzQvMHg3MDANCj4gPiAgdmZzX29wZW4rMHgyYy8weDNj
DQo+ID4gIHBhdGhfb3BlbmF0KzB4YTY0LzB4YzYwDQo+ID4gIGRvX2ZpbHBfb3BlbisweGI4LzB4
MTY0DQo+ID4gIGRvX3N5c19vcGVuYXQyKzB4ODQvMHhmMA0KPiA+ICBfX2FybTY0X3N5c19vcGVu
YXQrMHg3MC8weDljDQo+ID4gIGludm9rZV9zeXNjYWxsKzB4NTgvMHgxMTQNCj4gPiAgZWwwX3N2
Y19jb21tb24rMHg4MC8weGUwDQo+ID4gIGRvX2VsMF9zdmMrMHgxYy8weDI4DQo+ID4gIGVsMF9z
dmMrMHgzOC8weDY4DQo+ID4gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4NjgvMHhiYw0KPiA+ICBl
bDB0XzY0X3N5bmMrMHgxYTgvMHgxYWMNCj4gPiBDb2RlOiBmMmZiZDViYSBlYjE0MDEzZiA1NDAw
MDRhMSBmOTQwZTcwOCAoZjk0MDc1MTMpIC0tLVsgZW5kIHRyYWNlDQo+ID4gMDAwMDAwMDAwMDAw
MDAwMCBdLS0tDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IFByYXNoYW50aCBLIDxxdWljX3ByYXNo
a0BxdWljaW5jLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5A
dml2by5jb20+DQo+ID4NCj4gPiB2MzoNCj4gPiAgLSBVcGRhdGUgcGF0Y2ggc3VibWlzc2lvbiBk
ZXNjcmlwdGlvbg0KPiA+ICAtIExpbmsgdG8gdjI6DQo+ID4gaHR0cHM6Ly9sb3JlLw0KPiA+IC5r
ZXJuZWwub3JnJTJGYWxsJTJGVFlVUFIwNk1CNjIxNzhEMDBEQzk2Q0MyNzAyMTE0Q0Y1RDIyMjIl
NDBUWQ0KPiBVUFIwNk1CDQo+ID4NCj4gNjIxNy5hcGNwcmQwNi5wcm9kLm91dGxvb2suY29tJTJG
JmRhdGE9MDUlN0MwMiU3Q2h1bGlhbnFpbiU0MHZpdm8uYw0KPiBvbSUNCj4gPg0KPiA3QzJjMjdk
ODg3NWM5OTQwZjUwMTA2MDhkZDEzNWM3YTNlJTdDOTIzZTQyZGM0OGQ1NGNiZWI1ODIxYTc5N2E2
NA0KPiAxMmVkJQ0KPiA+DQo+IDdDMCU3QzAlN0M2Mzg2ODgwMTAxODQzNjUzMjQlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQg0KPiAwZVUxaGNHa2lPDQo+ID4NCj4gblJ5ZFdVc0lsWWlP
aUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWYN
Cj4gUSUNCj4gPg0KPiAzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9Nzg4RTdUaHRRRnUzVm9rZHpG
TnVsUWdSejhLZ3NNQUx5NDANCj4gZ3BIZHN0MFElMw0KPiA+IEQmcmVzZXJ2ZWQ9MA0KPiA+DQo+
ID4gdjI6DQo+ID4gIC0gTW9kaWZ5IHBhdGNoIGNvbnRlbnQgYW5kIGRlc2NyaXB0aW9uIGFjY29y
ZGluZyB0byAidjEgc3VnZ2VzdGlvbiINCj4gPiAgLSBMaW5rIHRvIHYxOg0KPiA+IGh0dHBzOi8v
bG9yZS8NCj4gPiAua2VybmVsLm9yZyUyRmFsbCUyRlRZVVBSMDZNQjYyMTczN0QxNkY2OEI1QUJE
NkNGNTc3MkQyMjcyJTQwVFkNCj4gVVBSMDZNQg0KPiA+DQo+IDYyMTcuYXBjcHJkMDYucHJvZC5v
dXRsb29rLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NodWxpYW5xaW4lNDB2aXZvLmMNCj4gb20lDQo+
ID4NCj4gN0MyYzI3ZDg4NzVjOTk0MGY1MDEwNjA4ZGQxMzVjN2EzZSU3QzkyM2U0MmRjNDhkNTRj
YmViNTgyMWE3OTdhNjQNCj4gMTJlZCUNCj4gPg0KPiA3QzAlN0MwJTdDNjM4Njg4MDEwMTg0Mzgz
MjE0JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEINCj4gMGVVMWhjR2tpTw0KPiA+DQo+
IG5SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBi
Q0lzSWxkVUlqb3lmDQo+IFElDQo+ID4NCj4gM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPWxET2Z3
NW10TjJBV0ZSYVRpbm9KaElFakl6cGolMkZZZm1qVw0KPiBZZkVSYW10cUENCj4gPiAlM0QmcmVz
ZXJ2ZWQ9MA0KPiA+DQo+ID4gIGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X3NlcmlhbC5j
IHwgOSArKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVu
Y3Rpb24vdV9zZXJpYWwuYw0KPiA+IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3Vfc2Vy
aWFsLmMNCj4gPiBpbmRleCAwYThjMDViMjc0NmIuLjUzZDlmYzQxYWNjNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9zZXJpYWwuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X3NlcmlhbC5jDQo+ID4gQEAgLTU3OSw5ICs1Nzks
MTIgQEAgc3RhdGljIGludCBnc19zdGFydF9pbyhzdHJ1Y3QgZ3NfcG9ydCAqcG9ydCkNCj4gPiAg
ICAgICAgICAgICAgKiB3ZSBkaWRuJ3QgaW4gZ3Nfc3RhcnRfdHgoKSAqLw0KPiA+ICAgICAgICAg
ICAgIHR0eV93YWtldXAocG9ydC0+cG9ydC50dHkpOw0KPiA+ICAgICB9IGVsc2Ugew0KPiA+IC0g
ICAgICAgICAgIGdzX2ZyZWVfcmVxdWVzdHMoZXAsIGhlYWQsICZwb3J0LT5yZWFkX2FsbG9jYXRl
ZCk7DQo+ID4gLSAgICAgICAgICAgZ3NfZnJlZV9yZXF1ZXN0cyhwb3J0LT5wb3J0X3VzYi0+aW4s
ICZwb3J0LT53cml0ZV9wb29sLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgJnBvcnQtPndyaXRl
X2FsbG9jYXRlZCk7DQo+ID4gKyAgICAgICAgICAgLyogRnJlZSByZXFzIG9ubHkgaWYgd2UgYXJl
IHN0aWxsIGNvbm5lY3RlZCAqLw0KPiA+ICsgICAgICAgICAgIGlmIChwb3J0LT5wb3J0X3VzYikg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgZ3NfZnJlZV9yZXF1ZXN0cyhlcCwgaGVhZCwgJnBv
cnQtPnJlYWRfYWxsb2NhdGVkKTsNCj4gPiArICAgICAgICAgICAgICAgICAgIGdzX2ZyZWVfcmVx
dWVzdHMocG9ydC0+cG9ydF91c2ItPmluLCAmcG9ydC0NCj4gPndyaXRlX3Bvb2wsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZwb3J0LT53cml0ZV9hbGxvY2F0ZWQpOw0KPiA+ICsg
ICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgICBzdGF0dXMgPSAtRUlPOw0KPiA+ICAgICB9DQo+
ID4NCj4gSGFkIGFza2VkIHRvIHJlbW92ZSBzb21lIGVtcHR5IG5ld2xpbmVzIGFuZCBhZGRyZXNz
IGxpc3QgZnJvbSBkdW1wc3RhY2sNCj4gZnJvbSBjb21taXQgdGV4dCAtDQo+IGh0dHBzOi8vbG9y
ZS5rLw0KPiBlcm5lbC5vcmclMkZhbGwlMkZiMGM3ODdhZC01NWExLTRmYjEtYjljZC0NCj4gMWY2
ODhlYTY1MzE2JTQwcXVpY2luYy5jb20lMkYmZGF0YT0wNSU3QzAyJTdDaHVsaWFucWluJTQwdml2
by5jb20NCj4gJTdDMmMyN2Q4ODc1Yzk5NDBmNTAxMDYwOGRkMTM1YzdhM2UlN0M5MjNlNDJkYzQ4
ZDU0Y2JlYjU4MjFhNzk3YTYNCj4gNDEyZWQlN0MwJTdDMCU3QzYzODY4ODAxMDE4NDM5MTUyNiU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDgNCj4gZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9p
SXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0kNCj4gam9pVFdGcGJDSXNJbGRVSWpv
eWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT1LTnNiNzlsWmV1VHhHYUUNCj4gUUFkODlHQVE5
MVhKOG5tbU9KMVpiWk5GaUpnVSUzRCZyZXNlcnZlZD0wDQo+DQo+IEFuZCB0aGUgcmVzdCBzZWVt
cyBmaW5lIHRvIG1lLg0KPg0KPiBBY2tlZC1ieTogUHJhc2hhbnRoIEsgPHF1aWNfcHJhc2hrQHF1
aWNpbmMuY29tPg0KDQpJJ20gdmVyeSBzb3JyeSB0aGF0IEkgZGlkbid0IG5vdGljZSBzb21lIG9m
IHRoZSBwcmV2aW91cyByZXF1aXJlbWVudHMgZHVlIHRvIG5lZ2xpZ2VuY2UgaW4gcmVhZGluZy4N
Ckkgd2lsbCBtb2RpZnkgYW5kIHJlLXJlbGVhc2UgdGhlIHZlcnNpb24gYXMgcmVxdWVzdGVkIGJl
Zm9yZS4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9iMGM3ODdhZC01NWExLTRmYjEtYjlj
ZC0xZjY4OGVhNjUzMTZAcXVpY2luYy5jb20vDQoNClRoYW5rcw0K

