Return-Path: <linux-usb+bounces-24012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB71AB92A5
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 00:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AECAA055B5
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 22:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33E528CF7E;
	Thu, 15 May 2025 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="deRNNMXe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R/JNz9rq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bAGByf3r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3952F88
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349930; cv=fail; b=T/rEHXac+j18iMdZQG7o9YFAePU9wN+TG9CExOK8bxH/vVd9JqDqvHBnnby3JOG1QYqxug8Ul9VZc/jmfL73zNnmvV3d+3fnTc262rMLZhtp3idXySPOHRP1eHhJPteZ5CIb/SgSVjDOqZ5mxXz6Un0+IQwyRVv231QHdV+00Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349930; c=relaxed/simple;
	bh=o2b1vlaLCJo0MIY2eB3PxhjuE6VgPbAMy+RnSG0jx9U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dLhy+XR0MBVY9bRhDVTG+L2pVmh8HlJVB+KuPZJyX4Vs6153qCK4v8Nzlx57lTgImZzG8QL4tbl/DN/NUfXxtWGqWTy5gcMSifOFgnTuCD4OM3jLcxo14vBxjdcofm5Ir2sdHDVJ2H27DntCHRKjSCYniZnyZr+eGuG22F5xPvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=deRNNMXe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=R/JNz9rq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bAGByf3r reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FHQTPI019029;
	Thu, 15 May 2025 15:58:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=o2b1vlaLCJo0MIY2eB3PxhjuE6VgPbAMy+RnSG0jx9U=; b=
	deRNNMXehpwlxnlMPwfKpCCreaOpJN7fv4e4kIT3AwLUPUtfcNNhmMUNvzoKYHRT
	v0wmVHWi/g+qjDNCh1oTlBrAab0UjWdEGZ7YuZN8Ce2WKdNZbUGaUHpZVyMNhpWl
	ffyX0jDVhancug+D1MLIlZXUkdE+eOLoCYeE9571rjH6lrKy5Flw17y91Z7PIUxd
	fTWBY1Z//VE0GoS4hWvFRtusHppRPbwi3wcpj7cb1rOd4R+l4UxEpTXBjgZP7oXE
	+LhlB7V+bAPTY+YIpppOcHz3a2lW+nHyzBh4iIhM9twxesLmzeALLjxaEqpO30Bs
	r5sEoeoHFZyL1SGDPIS2Mw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 46mbe58emd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747349909; bh=o2b1vlaLCJo0MIY2eB3PxhjuE6VgPbAMy+RnSG0jx9U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=R/JNz9rqKycQPooLcAOvFv+Cp+6hS64GkUew/cAH2LT1zeafus3l/Mqi7newE0W6E
	 27E+gA9U2MBW0oc4HiDqAKcQ1v+Buc+pisCWBs+3ThbGVUfRTm6myZUwT3hIOTWGx9
	 08B/a+6Fz+pljGjuEfpSMKyptynurPQ3hD0paASMi0Kgv8/9EaDgvoECOlhMNXMN8F
	 03mAsmy+fSbCEkq4eGSnaNE2oZD0eDpLvLF/0fTIB6cA6GKMX2oZdHh0bX0d0U6Rnj
	 p+d4whKYHXtHOXx0nQnJqlMcesSVJrwZKlguzwGSc1VqX9AahintiJzjaouEVv/j2s
	 MDUbZdYuzHkxA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A40CA40087;
	Thu, 15 May 2025 22:58:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 09C98A0073;
	Thu, 15 May 2025 22:58:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bAGByf3r;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69D43404CE;
	Thu, 15 May 2025 22:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkxdYJwwQFGETY/jQolmaR6/VUl0t/BNMW/mnwpZpFejFC4+szx3YSOhNqUTdrPvd7KifIfthdNQeFe/nfiADMwPJlroPXHArtdeMklzWDUjhd2At9Chy2m9cd6FwFK2Ucb86xupsRhMGsKmx1TDwwhYHzlKQYiHtvfatOvZolHeicwAaycO/n8YfYe5pN5E4oWoZtoiUURvhjtDXKieG1SkMAqRmWlnlUyEPb7qK8MPN+sOFI9o50AUs9buvW59h0SQdLzRCQkQlOcLFw9gVmmc1q4KeYwjz++RPHf2G/9s0BIBxta01cDRl4eCnbEvN517VYh0a/FLHED0BLy/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2b1vlaLCJo0MIY2eB3PxhjuE6VgPbAMy+RnSG0jx9U=;
 b=T5lmdlXcjYHYTAXVOT7nQql6x70nRqZEzG7DbJ3fE97scqTkgiObID8j3V26m4pEGyTx8G7OIUnSQ+fxp8dJzTD4L6b5csb347O1MMAKiE0eKehf3LzgusisBWbGN/73DSX/LXVlSv9EszUkLsXDeOyPAutWmnhVpSTIR0bci38z4gF1mCquCByeeTLFMvXMf4kJij0+8+d0qI8ZUF65a2WmEzoiOcDrFmZkGoWUkRGqrj2oe69h6LKHdnIhY/c+ac6vhFBldOFC3mFQNe5OgCrJNbrC/uDdYgVffimX+tlP6Uq0r3lZo2vFxZzywu8uw63Uxd753zkUTpYk/lv5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2b1vlaLCJo0MIY2eB3PxhjuE6VgPbAMy+RnSG0jx9U=;
 b=bAGByf3rd0aC4jn9UZmWRM1tgO1S9hUBOjFRWCtRqcqWMTgqpmY3z44CwI452ATammNe2BUQSBJA/cQN7OpdvamK8+Y0qeV1UpW87QkXHvfKZI0/+xeuwyALjtkMwcy96vtw5lmMVQyZqTw8oReSYZmGKGEwc5E+4rF7h+v2ygQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 22:58:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 22:58:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Thread-Topic: [PATCH v2 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Thread-Index: AQHbxYcCmO8k7mSY/Ee/ikvBLoRcL7PUTqCA
Date: Thu, 15 May 2025 22:58:25 +0000
Message-ID: <20250515225815.23sxkgior5wzsgsc@synopsys.com>
References: <20250515105850.2345351-1-pritam.sutar@samsung.com>
 <CGME20250515104905epcas5p44649c8dafd64870462fb09276f2927f7@epcas5p4.samsung.com>
 <20250515105850.2345351-3-pritam.sutar@samsung.com>
In-Reply-To: <20250515105850.2345351-3-pritam.sutar@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB8500:EE_
x-ms-office365-filtering-correlation-id: d9f2dec1-e3ef-40dc-6e9b-08dd9403ffc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0dYMEh6WUh2b01iNjBpSkpoSDdSWG1XOWx3TXhiUm5tUGNlVzVDUENVbmRF?=
 =?utf-8?B?b0M4bTlqcU1TbFRSM1E0RzBPVWxURzJNUTRDMi9vMlpzY2dHZlFrbG5kU0Z6?=
 =?utf-8?B?TFU0VSt0R05WQW9QbWhmNXdTUWoxcWE4elNEVVdJamZBMVVkR2d5VURETlZu?=
 =?utf-8?B?MGhsSFl1bW1pMUJ3eGlqdTVaUFRRdW13UVhEUCtLK21SMXAramdiMTlzN3Fh?=
 =?utf-8?B?b1lpM2NvUFhNRnUwaVJ2enpaSFFLU1NNNFk2c1Brdm9Xc2NZKzRUb0c2ZEtv?=
 =?utf-8?B?ZC9GSEMzOVQ2TUhnOVpmU3pyeGF0WHE3SFpnUktiM0N2WG16NVNCVEUzeXBr?=
 =?utf-8?B?dFY0azNsdXVISmx5SXNwcEhlclFrSVFQd3lGLys4QmQwbFBjdGdPNEltTUg3?=
 =?utf-8?B?Nm82Q3QrOTRmcUI2ZG4vbnlHVnFzbVMwWXJUUGZZS3BEcGRtZHpPSUpwaDB6?=
 =?utf-8?B?OEIwRExVdVNJdHAycVY4L2tROXBtNGtoQU5QdjV6UGpKZzJFNXlXMldHSmR2?=
 =?utf-8?B?U3JEYkUySmxWS1BxRDRUZXcyWHV4clpUaXluUG5GYXVJN0d2N1dxYmNkek1z?=
 =?utf-8?B?VFArWTJPdlFZWnRwUWtIUlNVdjdXTElnaWkzVDJDMzRQWkVUU29YeWdYcS9W?=
 =?utf-8?B?SHI5ZVc3RnBjaFVJQWUyQ0NPVGd5SHlJdHAycDd4MjdRU0dRZ2k3aEFDK1gx?=
 =?utf-8?B?b3VudWpjYnRPNVV3akdsa2dNT2Zaa0kyS0hSREZPREpwQlh3eU5JcXNEZG1r?=
 =?utf-8?B?V29tVk41SlVhaTZCUzVjdExGQ1V4bFIrSStpczhoVldFdFVkRldMbGI3ZytL?=
 =?utf-8?B?K3RSbVV5VG01VGp6LzVoN2gydnpUcEQ3aHBVUmdhSG9xNkttV1FQVlBFd1Zu?=
 =?utf-8?B?S0FsUGFybG9aUGVEWThpTFR3OTNsaTdVZDVUVFo0Y0Y2K1FQWklhYzZYM0lJ?=
 =?utf-8?B?YXEvSHZ2cnhPa3pCellkTGlPcG1GalJHcTBXdE84WFFnZGNjRlRZd0tmMTRC?=
 =?utf-8?B?Y0QyenVOTHBFU1pKMTJYYXUrenZ4UmhnbUp4VW1COE5tV2ZURG5ZdWR6cnBJ?=
 =?utf-8?B?UEtVYXpvQW15dGdrVmxuSGRjTEluZTQwSnJSQXBwQkszV2EvbzBuMU4wUlox?=
 =?utf-8?B?K3I1OUJPUDhlQURSNVFSM0xMT3Y0Z2dxMzJTTGFJT0ZPNWFzVndWUWJhNmlC?=
 =?utf-8?B?RE41cTNsTkpQOWhHRnJ3cEZFSjRjU3l4OUpIYmVtbmh4dXpkOXl1cFhXdUJS?=
 =?utf-8?B?S2JuU3ByeThvVUxCc3IzMEdVR0JEcEdraEdNWkVUZ3plS3dydkdZTHptUFpV?=
 =?utf-8?B?TXljN0dnOXM2NzRuZjROczhwUDBVQ09xK3h1T3h4YU5lM3Bualh0NVdCaUox?=
 =?utf-8?B?T2ppUnlHczJZOVdEUldKc204c0tWN1gwV200ZWtGT1M4bGo1U05BL3owaE1V?=
 =?utf-8?B?WFFsckFacFM0LzdQWEJGR05ySnBPempuTkRXYnU4VXVlVjJBUlZUOFl5VDZO?=
 =?utf-8?B?SjdGenBqMGhuTmVmS0wzM1FybjFlVDlWSE1ma0gvY1c4MUIzVFZocWpRYno1?=
 =?utf-8?B?VUl5ZEd6TDBjSEVPd1VvbTJJRmNmRi9sNEoxMTRCc1RwNDRXS3J2LzZaVEpp?=
 =?utf-8?B?WXBod3pETEdXSHRvQW9zcGRtbG9MMXBFTWFDNVhuSDJXQzNWeFc1dlRtZ0Er?=
 =?utf-8?B?RW5zaWJTbWdPbG5ndHFLMThPVnpraHo1UmxDZ2ZFOWVyNjNhVkVlaFQ0UTdy?=
 =?utf-8?B?dlB0SDBXQ0J2dWdQZWxsV2hhTXdrQzNySlRRQktKSThhL3paS0trbEpxcko2?=
 =?utf-8?B?RlZQNUZwcEs2bVlNVlpXMHlYdUR2Uld1U05jNEZnNjRsMmdPS1ZpTGJZTjZC?=
 =?utf-8?B?Wm9YS2w0S0VTNnJwUERxanlveVBkbFg5SEV2SGVHR3hHWlQrM2xWQm9MNUpO?=
 =?utf-8?B?U0RkaWVoK1FMZndrRG9yVWN3QmpDTkFDaC96MjlCQklQa2hhNjhPM1V5Y0hv?=
 =?utf-8?Q?irtTveW4UTJXL2+seBPAhFy1h10Zy8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjJLT2Z5eWFzZ3F4ejgzMmkrRzc5Skg5SWwyU3BXcnNMLzZRQzNHMEN6bEt5?=
 =?utf-8?B?QzdFcWczYnBEMDR2Q0hLQ2pDYkx2eEgzTU5JcldKZEdZOHh6UHJkYzkwYXhx?=
 =?utf-8?B?aXA2aWJUelRJVDRzandSNDB5ZzN3TFVhYlU4aG94S3NZbncvc011UDZ1bzZs?=
 =?utf-8?B?YWxjM1BNTHJiSmYweXNGTHAxSmVBaG1KbE5ZRmJDcUVUSUdKUkpKRXByTXlu?=
 =?utf-8?B?VmV6Q0h4b09FWHpPcm1SUVd2RzJ1eXlSUDRvTVhOUXU4RGIrNjI0Sk96Z3R3?=
 =?utf-8?B?Q2NQRzJCSG5pNW1UNE0zS0JCSkZ4c2huQ2podlJzZ3M1UTJNZzlIZFkvTVp4?=
 =?utf-8?B?dnhYbGhmVG9Ld095N1VxSDN0WlhUTWV6YUE4SGhLOXJjS3hYaGczb0VQZmRO?=
 =?utf-8?B?S2swd3hmV2dJN1RzdThBZmFUb05RUWU1NWx5RTZSYnJkRTBIOFZBWlVLT1NN?=
 =?utf-8?B?bnQxQzZBblQvL1hLeHFXZUU2VGlSK2RJUUJqcmdyeUlycHhoTW1VQ2U1RmI0?=
 =?utf-8?B?Z0dPNElpakJvTTcwdnJuZ05FcUw3aG5hUlhRcjdKUW1MeFd0Sk9ob3NJS2R4?=
 =?utf-8?B?bDdYREpPcHZLS1pCeHd3VU92WFZVU3hXRjVNN0h1aUJNZHV0UzhUODZBb0pi?=
 =?utf-8?B?NzM0aHJtdGpMSVNiOXZ2dG9XTmFEMlg4cW94L1NPR3ZrMEhKTnBPbnkvSi90?=
 =?utf-8?B?RG9pSW5WWVFFRWJ3Y2JiWmoyY2ZORVVUZGh4M2lqWDB4QTFNVStxZ2lQL0NB?=
 =?utf-8?B?K0FiZEtmSmI2eWgrMkJhRVc4OHFrZ2g3UFJFYVYvZG40Y1NQVldDN3hCYUIy?=
 =?utf-8?B?WFVVNDUrZGVFRTYvZ3hWOXBqemRKa0dqcHRiS1FZRlg2bUM2TnBYSEU4Q3pp?=
 =?utf-8?B?NndMcWIrRzZvWWc0WlF1VjdvR1VzN0o3V3RseVBoeXNuWWF1NVFhUjRKU0Nq?=
 =?utf-8?B?VklQRjE0UnhURVYyaVpFa0w1bnZWWWpVZUpnenIyeUhGUUJKMDhCWjBTZlpq?=
 =?utf-8?B?MU5PZkNsbFhzZDhnQ09LV3RwS1hYdk1Jck8vTVU2NktteU9pdDBYVGlobThp?=
 =?utf-8?B?NTQzbzdvWDMrTmlscjR3YWUvdjZFZXM5V0xzb2pPbXU2anNqLzR6eTlWeEQ3?=
 =?utf-8?B?eXpwRThaOHdhOG9zaDB6cjNUckVJN0pCZ3dLWURSdVhLSXBTZnV6Yi9qVXFo?=
 =?utf-8?B?T0QwZUxkZjlzYmpLYkFWL2ZybkJzQnVhRjZWT1hkdmN6QTNjTG5BeFdiNksx?=
 =?utf-8?B?UlVKNkF1b2hOajErTkY2OURpa0FCTCtUYUtpRVFQdWxiZHNBcUJmaHdIZEY4?=
 =?utf-8?B?RnAxQ1d2MGZvKzRqNW0zc1Zkelg4Zk1Nblk3Z1l4OGZnM2ZBVFlxVXJDRVpk?=
 =?utf-8?B?T1FQN2hPSkk3bzV2aTZ1YjZkOGMvc1ZzREhRYWFzY1YvcUxPaXA4cVUzTFM5?=
 =?utf-8?B?MlF0akhoaWJFZ3JlR3F3b0hmZGdlam95WmJ0SWY1K3ZtMTVSanRzT1pTb0Nt?=
 =?utf-8?B?Z2NJdnNrZ0VHRVJBREgvTHdFTytLM2ZqTE41UFpVSzJTaEg2WHozZ09lUWtL?=
 =?utf-8?B?Tmo0UkFXc0d3Q0ZCL3dJbEZWekVwSzBtR01TekVwZ095UExwWUVDdVhTdk5q?=
 =?utf-8?B?NXBOakV5SlFtanNaRDh4NjFQd3hhRlROeXlkZnIyNHRFOU9ZanBwOTZRaC9U?=
 =?utf-8?B?NmdJV0lTSGxwR2F5MzBZUXc5eHFHckNwVk91eUZZWUFpNE83NXk2RzREV3lv?=
 =?utf-8?B?Tks3ejMvQ1I1a3pja0tqSlgvNlhhZ01HZHpJZlc1bGhtVXZDRjF6UGFlczJS?=
 =?utf-8?B?cnNQWWJuWmxaUEl2OWJHYlJ1NGNlOVVMdWZUbUNyY2hLcEZHUVV0Wm4wQmhJ?=
 =?utf-8?B?SUdGM20rOXY0R1pBTktxS3EwRlYwZERUQkx6MmFxTzEzcGJqNlFpaU83MmlV?=
 =?utf-8?B?V2xlZXNPb01TNjAzeUhZWnJsS2VXbUxaZHhWNXJHNDR6VXBrb1lmUU5nTk9W?=
 =?utf-8?B?MFhPTUdSb0V5YzhuUGp6Z1dpaVFmcmU2ZndZZmVVMU41ZzBDaVU0Wmg5RWVZ?=
 =?utf-8?B?a0pTOHlFdnBqVUdPQ0xnMUpiWHFyWitRbHNCUEVSMERDSW5JZ1BPRW1ZTUtG?=
 =?utf-8?Q?QG07XCcISIVVkr8nN5qERhWtm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29D436F1D63FB949807EDEFD06090374@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KnhsN/eF4QTvBaM3yCEBmRsf4+UUmRclMHQzMU3onat/cqY3yr0r1+uz2litPcBPcyJgBqsIaZSRqWLBgLBsTeDHHFgn6LRdj5xrH/Teqxqu3uPnuzLxwPA81i59NFsjR4XhLIgLr/PiCK20ismYqH/l16Q6Z8NlCBtD8qpKpJ0GCsEuPNdfqIzt9noNS1L1LWlIRwrC523U6S8nMO9FZh58mX0fM2+3x3nQmwJFiROFfrFzdOZ+YeD6P+AdxB6suXNktfyHiF5S2u9coaRQrSnZ5rNMMJaUZjiFgB4RCROtU4B0guEdXksF8CKUdLS/HsRaHA8gaAKzwAWXGdKDzGJvDdGi7hJmri2l6WLVgBK1XxeB5rtZKQyGaOePBZhrg+AGLF8/wFNzErrLA7ZNetzcRnc2FeWXwaPe8A6SrswkdRoGohOjR8yoyl9hY3QnzyuZe9C+0xWpvPc5DDE2Tk+zhqC8ZxRRpdloTJDGLqdFeiHfv+VZiEJkpQC6l3cbZwQ05F/R/cDxs4AaSqYUH4tXXZ7EA8wZXo24I6Ltgct0DtbUk9LAkMWbY/JL+iv9NrXlTnSd+ESf/SkZ0owZIvrGppKgMwSnVCcRgn+cBRmJvZUa9unDZ1YQdLTGdIycjHMfLntkRGCgy8uLusiHTw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f2dec1-e3ef-40dc-6e9b-08dd9403ffc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 22:58:25.2840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+BAo7VzzLSPFQ8LSnnCkF4e0tCLPOOfiln/Xq/myLm/G+ivWIFvRDjapM7EtubFPapjRb8Gq76vUSqkoG8Glg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
X-Authority-Analysis: v=2.4 cv=GYEXnRXL c=1 sm=1 tr=0 ts=68267196 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8
 a=jEnRdJXVJo8a35IBN3UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDIyMyBTYWx0ZWRfX3KGPESAq0pgw
 R0iWRhGP7nQe+r2ixUWBZUthrJiu3Ry63R+RqPYuja9pd3IBDhJE6UBeBaddNhX74bpF+sfNjX1
 GzA1fKzv4FxspkOHVJ/ctdSxQAeeHJC16qA4+cV4lC9yRAsnfGAMd/PB7mNYpITIfMIym89dYsg
 9uiam40mYDGcC0LpG/jCjjazQBfhMwM4Ln38dTuT0i+rPmIZQMOJQiZa6dcMyoiCRzUuF6TVr9a
 tuDWsyUzNhrV6BC01zqRM+DxOoL97ld/s5Uzp1RlpICxRpC4V9VHgEEb1C8pF/ny/epUILSTgwd
 kNVNIziNgEegyfpCL5IDcyPKLRJKPjdO8oY80VPlgwVbDJly3VddUjNxJwkv929zfxh/jqb9xgP
 01qujTIdyLxgDqiy0YCDDCfAbOrZaUCtrgjEauEERiY4E6wjn6ELJwJFkRA42tljqoCyvuSS
X-Proofpoint-GUID: Yv5I63kYqmE_ECtvD4AlKmD4xS2vvaCn
X-Proofpoint-ORIG-GUID: Yv5I63kYqmE_ECtvD4AlKmD4xS2vvaCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_10,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=762 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150223

K2xpbnV4LXVzYg0KDQpPbiBUaHUsIE1heSAxNSwgMjAyNSwgUHJpdGFtIE1hbm9oYXIgU3V0YXIg
d3JvdGU6DQo+IFRoaXMgU29DIGhhcyBhIERXQzMgY29tcGF0aWJsZSBjb250cm9sbGVycy4gSXQg
bmVlZHMgInJlZiIgYW5kDQo+ICJzdXNwX2NsayIgZm9yIGl0J3Mgb3BlcmF0aW9uLg0KPiANCj4g
QWRkIHJlcXVpcmVkIGNoYW5nZXMgaW4gZXh5bm9zIGR3YzMgZ2x1ZSBsYXllciB0byBzdXBwb3J0
IHRoaXMgU29DLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUHJpdGFtIE1hbm9oYXIgU3V0YXIgPHBy
aXRhbS5zdXRhckBzYW1zdW5nLmNvbT4NCj4gQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFsaW0gQWtodGFyIDxhbGltLmFr
aHRhckBzYW1zdW5nLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9z
LmMgfCA5ICsrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1leHlub3MuYw0KPiBpbmRleCAyMGFiYzZhNGU4MjQuLmU5MzRmOTRlOGZk
OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYw0KDQpEaWQgeW91IHVzZSBnZXRfbWFpbnRh
aW5lci5wbD8gUGxlYXNlIGFkZCB0aGUgdXNiIG1haWxpbmcgbGlzdC4gU2VuZCB2Mw0KYW5kIG5v
dGUgYWxsIGNoYW5nZXMgb2YgZWFjaCB2ZXJzaW9uLg0KDQpCUiwNClRoaW5o

