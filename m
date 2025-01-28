Return-Path: <linux-usb+bounces-19800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CDA20329
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 03:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3ADB1884718
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22769154C05;
	Tue, 28 Jan 2025 02:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dRyr5d6D";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k91tdEbI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aqvXSZSr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C246BB5B;
	Tue, 28 Jan 2025 02:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738031143; cv=fail; b=XCSo0C79EFjefYbbPvPWxmOL3LuEoyO5/oQ3DH1N1UkulskOsx4mWRn1vZGA1wiAZBPc0bDeGEdUtaEdwl+ohEvtCg9Mc38mczKYtBKBYINvhlotSIavZm629lUvehQeexbqcKMrKBs3wSYeGMtxIRdxUxneb9HtTMlDj1ozxg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738031143; c=relaxed/simple;
	bh=bXluM+P+7i8HKu/DarxJkxB43Wafdf42FCWNGn6lPXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eMDlngXu7LF5BDZv26kqjrSJhJXZWg3Al5Tko+QhtmBH2VZ+8fkZI3Z5DstHHDUVzWaSm6Xs1S2su6Qzlz1HBLWurDhLYEs4c7k7lLH7ZooQuSijuVuCN6QvCwAjeNBjp18XHvfnfox86RCTErTcHbKYh5PNY4lczSUiIl+icUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dRyr5d6D; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k91tdEbI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aqvXSZSr reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S16Qdi012838;
	Mon, 27 Jan 2025 18:25:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=bXluM+P+7i8HKu/DarxJkxB43Wafdf42FCWNGn6lPXI=; b=
	dRyr5d6DqNa2IS8xmd2p9SKx6Wppj7N6QNCLNqltOa5jIgskw9FftwW4BPI2lV5+
	/Nq8/wSHACJU4T7Mj40Tka43jF0WlZCXZldVYY31ZnVjzdA3NVaIb0+2gz9Dk7Pw
	MVthEARF9fvY7Ei8OcIqR85aU5RTdlYDyTsMiflbuw1DsoYm0rWihaimMyv8vxvf
	9gdoVPbanqQ2i+GdvPpMrTq27mw7crAQznGozXkYK+mLqzw6xqOZoFGyvudRCXhn
	UC9jCJusunP1LJdsSSSU2OgZkj/u8DYIDUW0b4Ix9mu1H1jBf+gxzYd7uqXvpAlx
	S1GukK1+Go0YgNTF/G0Q8A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44efadsrgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 18:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738031127; bh=bXluM+P+7i8HKu/DarxJkxB43Wafdf42FCWNGn6lPXI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=k91tdEbIWp0UAYApCmSXP1yV6geWT2o+PlX18OPHDdKG/U4tChIYH+Q9bEkoy9LDx
	 2eSX+9U7FxvsmfvVy1MIBA93dS4xzeC9+9yXLCqD0auVAyIaU+YDK6pZFQ7vz0yEJq
	 dJFamyfELHXgO15pxCrFwvFvex2RX+0J9aoah1cY97Jp1YAGTYrM4LwAKw9T6tJoZ5
	 6y/2ucVYfVpbMOo1W/KQLKDGVHdcQckCy78Ap0lG3KQb19bGsxR0gPM795yD3O9eYf
	 3w+UG9rqAKqbLOz3AaWmSNaV2O1jFh8zeVazYgmJ5XYi55/RjmXHqeaRb0a+Oy2efu
	 R1//Tl67mRtqw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F14C940110;
	Tue, 28 Jan 2025 02:25:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 229B6A005F;
	Tue, 28 Jan 2025 02:25:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aqvXSZSr;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2D6F340112;
	Tue, 28 Jan 2025 02:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYbSpWhznwaNH3Lr5dF0z79QB2MoQWTq9U+6wcszRqOCpCEAK7hJTYRkpSCF1Cqohxr+hTPqW7El3UyFN9Uv1d0ymlbOmUS4lQ2Phk/YEMA/qLHWXU1rRRuWkqIhoOahJsOPHeZIPov11+7jPL2ZAzkB5S76qbcYejF5oYFT28YKRfC6iYXU5wk1uyKRP4kkhx545NdlzoveFEwuv4fGrytvgA5B/TCfss1cF8TaDg6Ct/7q3P/iGy9VQMezTJS+VaUSLuFGyxpkel9mYY2xchxDVn+dUugDkbgwPSIZeEXW5mZufE6To8K5agdM5YspXd95DVSw3yJ+0anKjg+GIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXluM+P+7i8HKu/DarxJkxB43Wafdf42FCWNGn6lPXI=;
 b=SOJQFsTHVaJcdBEPu4j5iymrT6b92pbMYeYNCNgFRxuNvkDOzuYO8bHbKLQFMzKKNwTRjFlPGU6YWgzy2EGyFqu+/vWr+Nu6d30xcxfYAdHHTCqc9xhWvyyt2Bm1Kub13PuwkxGEgT6dEF1ej3OEb64JOFNA9UQJ7Xk6RWWGQNCSDFc2MS5Y1adHPSHB30+pK+7+zf8cO8M3JtWYS2Pi12r3Vt6YFGaHQJpG9t4E2c/myZDjCy0vUmGHGY3oiiewdbfl1R9MGABtxv6/sHmrRrlVhvqNc7e6VeKtQVhZXZsN7wM65ASMiap2B8qdGxoco9RZuz0M5mw+TW1p4G06tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXluM+P+7i8HKu/DarxJkxB43Wafdf42FCWNGn6lPXI=;
 b=aqvXSZSrfTBI+v14XlPrMedxXqUaOurod6Bs+KoSN4vDJsStJR7gd+BFK5ITJvsgh3h8dA3AKEi9Blx6jxCZy+dd7fAQ5AhOTUcsFMjbpodqIm5rxbLVqRNU+biascWV6zzSOxV9Btb9JPhQCrAE8Bt07x120dI8CFt9PCI5xlg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 02:25:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 02:25:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Topic: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Index:
 AQHbaC0eMwYEug38l0SxHHfTxkybwLMaCZSAgADwVICABM5tgIACI8mAgAEYmACACIKwAA==
Date: Tue, 28 Jan 2025 02:25:21 +0000
Message-ID: <20250128022520.6w2dovsb4rjh3qwh@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
 <Z4pdZZhR6m1LB3yk@smile.fi.intel.com> <Z45lja5InqAXs3CQ@smile.fi.intel.com>
 <20250121234313.2xiixrqru5m35dyp@synopsys.com>
 <Z5EccvQh3IsOSDSa@smile.fi.intel.com>
In-Reply-To: <Z5EccvQh3IsOSDSa@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB8070:EE_
x-ms-office365-filtering-correlation-id: a954a30a-eb5e-43e9-0787-08dd3f4303fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmtYQWFYcitvTXV1aWdCcXJUVWtHZGw4MjZkcW1SdGcxWnBiemdoNGRwL0Q1?=
 =?utf-8?B?cmNDQTBFK2NwTjFOUm5FaE9LRU1MSFFsWXVSMmw1V1JDZHVhbXlnS3NtNXcr?=
 =?utf-8?B?MWwwQ0owOEp0WVZpU1dRNkNGMTRNTERNQjNMcmxnM29oN0EzQmc0dkkvWUcw?=
 =?utf-8?B?V2EvY3poUXZxRU5SSUdxV3pqV1Q2c1UyVkZkTHlrOU1zN0lYa21DMXQ3YmNR?=
 =?utf-8?B?NTBUamFPOTVzb3EyNDNEWEp1ZEt3eG1LOWlJaHZoTmxXZ3JDa3ZGWm4zVTFL?=
 =?utf-8?B?MGpTQkJBcFgvTjh4dHdDUmxmc2pvSy9XVWFEdVpkRFk5c2RoQ3dDSXJIaDhK?=
 =?utf-8?B?OVhJN0xkVXVYMldhMVJ1YnNIRm9CMmdyeVgxM002eDU1VVJ0SERpK2d4MVRJ?=
 =?utf-8?B?Z3c5dEZ2SE5lZHNocDgwVWlOSTQ4N2lJZGVuM2F4R3pnenVhaEllNEZqOGZP?=
 =?utf-8?B?UkpXNDUzN2VKTWZEY0lSRmF6SFQwQ3JGQXVhSVBGSitiR0poclkrU0MzZlp1?=
 =?utf-8?B?VmRRVUEzcG0vR3VpMXZGUC8vaEgvd0h3aFdsS0tDMk0waVl0VWhVOGFjU3JU?=
 =?utf-8?B?V1pnU29ScWl1NW1qZFRoRXNtdjFhZ2Vuc1NBK0dsbjZ2SVltekZ2SUR1RzVx?=
 =?utf-8?B?RVZvUVlhWEhORlhpRDdsVlYzbzF5ckJ5NWN0Y0NXeitGajlZQ1dIOFNFYTgy?=
 =?utf-8?B?OE5yQmwyenZxZVRld29kdXFqUndOcytQWjhvTUF5cVdPSHh6MVVXc3VILy8r?=
 =?utf-8?B?RC8rY3cybnBubnkwRzFpdnovelFtZjdXemtMYzlTZlM5N0cvUlk1ZjdmVlJT?=
 =?utf-8?B?MjVxSDA3Z2pGVVN3WGtXMjRqS041dUNGRGhZZEhnZ2dYbzJld2dKQzNNRGE2?=
 =?utf-8?B?K29NSTR3WksrcUk0SjNkdWdjb2NySktkaE9kOGVocytxS1dPTzB4bFVkM1o1?=
 =?utf-8?B?V0hnTVdwQzBVR1dUaFROeWU4WFhNR2VtZUlDS1FoT3AwTFBZUEg3R0xPRnAv?=
 =?utf-8?B?SEhPb3FMWUpDSStjTGlNQ25MOE1lZ2lyWnd6Vm1LNWFMZFpTbzFEL09tTVd3?=
 =?utf-8?B?L1R4UkdOdC9UQTRRbGRHYzVTaC9YQXlnbGhMRFowU0FReEh4a1VoaGhBVC9a?=
 =?utf-8?B?ZXp0NzFrT0F0dC8wb2NtTVFQaEN2dDZCZVlQT3lpOC9DdnNla1M5Uk5WZ1Ba?=
 =?utf-8?B?VVNYSWJMTGVoZWtFNE5mdmExenhCNStDQ2Y3K2FKUXJIVzB4MG1XU2pqdEJJ?=
 =?utf-8?B?WkIvMnpDSm5uM1lDUVQxdHVGNFBvOHMrR3BBamcvOGlMS0R0NUYrdEhidDN3?=
 =?utf-8?B?SUVkTnFLVTBXTVVtSUorS3lmdlpCb0NPVkhPRmYzd3NmVFdLUlBaMDdsaGp6?=
 =?utf-8?B?TkkyeEp6Tk1RUnczR0FHNjFUZUNveWdGUThzRkVYZ2NnMXhoVk14YkVGRWhl?=
 =?utf-8?B?L1dyQzhPcTJlaTV6OEU1OWxrYU1QcEpURnIrVUxabTJLUTlWejZDbW1QUkJw?=
 =?utf-8?B?cGtHcEdRS0VHbDFvR1dLY25KMk5OR3Mxbks2TFliUFNmSXBqbGJhQ3dkV2VY?=
 =?utf-8?B?OTAwVnU4YjRNTWJFODd2QmJiL25QeDh6eHFtMDd2SEFEcW1WUFdkNWR4Mmpo?=
 =?utf-8?B?aFllalhjeEZQUkx5ZUpiMFUralg3ckpVeEttUXIzUFVLU0QxRDNzZzBPVkxC?=
 =?utf-8?B?STBOZE80QnNQR09zNVdqR2VWK0JuMWxiTzAvUEtYMllmdzhPTHNmVmM3S0d1?=
 =?utf-8?B?alA4OHE4R3NyR0ZjQmxzaXo2clRockRhYnUyWFJyd1RuMC9HMlByL0lZWE9V?=
 =?utf-8?B?Q3hkK2VMeEdDNVl0UDhMZkdScXhkZ2R1aEIwNmJvbVNUcVhGdGRLajNVSkJS?=
 =?utf-8?B?VndUOVdvZFVITXBxazZONzB1ZG1qRUpiUmpGcmt2RG9obFRvUFBNMzYwUDNr?=
 =?utf-8?Q?4YGYwmBbcuFEJ+M76u8FvkTghsEzgWK1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Umc1ZWE2NWp2MGZTYWF6alE3Y3ZVdjBPaGRpbUNYVkMwVGo1QWdSdS9mWXpK?=
 =?utf-8?B?UG8rcGxuaE5mTmcwc3NNdTluVHN2OC9YUUVrdDVGOSsxaW9CTGNwTXZTTWdL?=
 =?utf-8?B?R0dxNGFxUDNmeWlWVnJMemVTbHFXMm9iNW8rckxZeUFBWFNYZmQvcDVEYVJm?=
 =?utf-8?B?ck40Q2tqNDVkWHBzWmRzRC80Z21IQ0lSWlRoKzhQVnRMbUM4NE9FcUNsZ241?=
 =?utf-8?B?ZDM5ci8xVjhZT1lFc2xpaVRxZGorVTZ5b2NOaEF1MCthMEVpam8yNXpJZ20v?=
 =?utf-8?B?QkpNNHc4SWhrOHl2cytvbytWN1JmcjRrMWdnWVF1VGJlaVZGRnExUDJ3U1dp?=
 =?utf-8?B?UHVrcDI1V3J6YWo4VWo5Z2Z3N3ViaXcrb0hzOFZuVnkrUTJ2T3lsWmJaaWxP?=
 =?utf-8?B?aGhCMHJWdENYTE04KzNFVzkxdUM2NjdaSHp4TnRUbjFmMGxKT2pwQ3ZnVWEw?=
 =?utf-8?B?V3VZemt4WnZlVjBFdUMxTnJrT1pDVHdYb2o1ZlJhb3JJZWNqOXZlR256RW51?=
 =?utf-8?B?OHRQZHNwTzdhYkF3NE4yL3lodjcwWXcvdkhaVUFIQStIS01ZOWl2RW9wUlJE?=
 =?utf-8?B?U1U3UWsvTjVqcWlXbHZuOVZGVTBVM0p1elBDRjIva3h4NHlwSkhxSE4waUNr?=
 =?utf-8?B?VXVraWx3bDdjdVp4SDAxVkwvd3JtZVNlakxOL3JhMXA4NjEvVDl1YXd2WmJy?=
 =?utf-8?B?UXlKYmJLSXRMZTZhRlBucUdTQm5wRGJVTVQ3bFhKbVlGWCthdVVZQndjYjhP?=
 =?utf-8?B?bVhmb2FMeWhMZGc4NkxZL2p0UXJISjBHb00wZUlmRlRpanZOamRwck1qSStu?=
 =?utf-8?B?OEtHMEF3aEM1WTBoeFNLaXN0RjYwcDdTUEs4VWErVjRxZXB5bDM4UVhOaTFs?=
 =?utf-8?B?UllNb3ZKeTQyaUovZ1lCUDF3dkI3em9nb2FGV2VDS1NLbE5FNC81azZZaUNZ?=
 =?utf-8?B?RC9GUW5rVFphNS9SdUk2Z3NvbzcrdjdBcytnUFZGTVVtL0ZGYkovQ1RVK1Na?=
 =?utf-8?B?QlcwVzlwbkFBS2lNR29RVGdoZXVrQ3pmbnhIT3psRmdhV1ZoNTR4KzYvVUJ1?=
 =?utf-8?B?bVhRamJHN2tRdTNWQ3JaRldTMUpPbUI4dTNvNm15ZmVHajBxMjBFM1FidEhv?=
 =?utf-8?B?ekNIUXB5dGwwczZEcU1wVGwweTV5V1Y1MkpXOEhYN0JhNForWmZFWUdMeFBa?=
 =?utf-8?B?Z21kTGxOMmR5N0xxRWdMcHdISWJnaGFsUWd3WGVxbVhoT01pYXhXNGEraGpS?=
 =?utf-8?B?c3NaTk1kbk9kWlRyUXdIZDFmUW5wSzExSVpkVFljYmZEU1RveFpITmZhelA3?=
 =?utf-8?B?SFEwOGZ4dmZJMFpiMG1kem5sc1FoYUcreEJRQjE5OThhYkVaaWZKTWdLTjVN?=
 =?utf-8?B?eWZDT3NBem92aU5CSHNFQXVQaC82a1R2S1A1WUh6SzNFWWg1QWFwSVNJMzc2?=
 =?utf-8?B?M1hFcnRKanU2RUdBbFF6WEU5c1dGMmpQYmdjLytHc1U3aHp2RHN1VSsyVkQ4?=
 =?utf-8?B?UmcvdWZLQnc1Nng5RFJuV01RRytYUzVlVkE3NTdSUFJOeVBzQ0dZVlBEMXBm?=
 =?utf-8?B?V1dKTGZtYU5ueGp0bFZ6Ukt0NmlkVm04N2g2ZGozK2UrZFVKcmtrcU5MTUVE?=
 =?utf-8?B?T29PSEIwcXFHTGpIbTVYcW9MWXA0Q0xTZUNFRzltSyt2emgzT3FrdmlJUzNQ?=
 =?utf-8?B?N0VUcEJ0YUw3VG5EVHphNWNoZXVJWTh4amtNUmNJT0tCV1RTalN1Yk93ZTNY?=
 =?utf-8?B?Nkt6YlVUTTd5Mm1SN0c5emh3ZkdERStoQTlVZ2FuMk9QaG9hWXhEYTZ3S0hI?=
 =?utf-8?B?dStPOE1ETmRwUXJjcjRkTW1MY2JuQ0lFcXFnTWpvMnpMQ29TVFpnMUNFS0k4?=
 =?utf-8?B?Wjg5WUkzY1RMQ0RFZ3RFR3pXaFVOSkFqblI2Rkk2M3QwcGh1K0hvaHJwRS9s?=
 =?utf-8?B?Z0JVeVVYbzN4RDRnSjFqSUNVZEZ6UHVlakxXd0RRQjhoUW5DTEIxMUFYNHFh?=
 =?utf-8?B?aU9KU1ZsblNnNjQ0d0l1QUVDRzRPZFBNdFgvNTMyVW5BbGF6eHJkTGptbEFv?=
 =?utf-8?B?aUhyQSs5WnMrQzl5NldONHpzbExlU3piTUFBWjZEdGJaYXVoMDFLVHRSRmx0?=
 =?utf-8?Q?YrZcBvd6f9dZucygvvnOrkFjO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2163F077D6EC6F4FA3D2FF9CC7EE327F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zvnfKJxKABxotUCfv3kp6Z1i1zSx1+QjznUXzpkppueWA84AZQA/kbTFUamNj09t9F8GMqPgweP5iLddHO0nKhXNA8ju0MVbC1G8ivKZ6O5WWyRFgS8MzKRnKkP+7rhajDNrQg2WQQEFFzDfHIY9khUBX13xNrEqRxtXYHMaUImCCPbag/SXrCb5FZ7AAQ97ftKXCktITwiNaq3G3fS+VZZ1/z8FI0KAzRIOJJufMt8D4ADepxpDWr3e+tTzYq11WlYGIn/2nadqpDzGwxdp5jqz6L9lFwrWbWPGP1fCbSCaF4e9tehba9X7f9UTvsiSDDh/YlL/xgQ8Sl/N5uzjkGLu0IeAR+c+lINxlNsxiqeN4xZEXklbuFs6tfccwFKhsjI/jfexlpj174jeJNACJ/COU+g9mJZih80VBemgHFvs3fmGGJdvG2Bq6VWcSL3DDsgmZ3rPnjLL+wHUZA0XVctaBjV0OENujykTngV1KBMfZvqDfYAbMA6I0hZS0MYbHNqXHAsPn+CznDXS9GKv890xACaoH6T07xo5mdyquv6mowGG9TyA9GVxe21Nf7xncL0946+67lo8N3LLYPjNfoAQw+bOR/NhkL4D485sgdjSpydZH2V7RyX+9m/+hie7R9iIuwF+/Q4M0V1v3yu5Yw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a954a30a-eb5e-43e9-0787-08dd3f4303fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 02:25:21.8318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtOesoYLatkHhcx4HmIpkNZfOyOBYDODnMmPaaxkslG9JofB9ZOdtB/J8YZovFtZRaFi6AhY8U7x9JSfdkTDtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070
X-Proofpoint-ORIG-GUID: mkIWgPzrxWNLAkoXOT5kaFL4eSfX7Q1Z
X-Proofpoint-GUID: mkIWgPzrxWNLAkoXOT5kaFL4eSfX7Q1Z
X-Authority-Analysis: v=2.4 cv=VtfZA/2n c=1 sm=1 tr=0 ts=67984018 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=of9g7Hp7QYO0IfWquccA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280016

T24gV2VkLCBKYW4gMjIsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMjEsIDIwMjUgYXQgMTE6NDM6MjFQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIE1vbiwgSmFuIDIwLCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBG
cmksIEphbiAxNywgMjAyNSBhdCAwMzozODo0NlBNICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3Jv
dGU6DQo+ID4gPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1IGF0IDExOjE4OjQ1UE0gKzAwMDAsIFRo
aW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gPiBPbiBUaHUsIEphbiAxNiwgMjAyNSwgQW5keSBT
aGV2Y2hlbmtvIHdyb3RlOg0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiA+IEknbSBub3QgZW50aXJl
bHkgY2xlYXIgb24gdGhlIHJlYXNvbiBmb3IgdGhpcyBjaGFuZ2UgeWV0Lg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IEhvdyB3b3VsZCB0aGlzIGV2ZW4gd29yayB3aXRob3V0IGR3YzMgbWFuYWdpbmcg
dGhlc2UgZW5kcG9pbnRzIChhbGwgdGhlDQo+ID4gPiA+ID4gaW5pdC90ZWFyZG93bi9maWZvIGFs
bG9jYXRpb24vc3RhcnQvc3RvcCBmbG93KS4NCj4gPiA+ID4gDQo+ID4gPiA+IFlvdSBwZXJoYXBz
IGtub3cgbXVjaCBiZXR0ZXIgaG93IGl0IGNhbiBiZSBkb25lLCBJIGhhdmUgYWNjZXNzIHRvIGEg
bGltaXRlZA0KPiA+ID4gPiBkb2N1bWVudGF0aW9uIGFuZCBpbiBwcmFjdGljZSBpZiB0aG9zZSBl
bmRwb2ludHMgYXJlIG5vdCBza2lwcGVkIGFueSBnYWRnZXQNCj4gPiA+ID4gdGhhdCBhbGxvY2F0
ZXMgdGhlbSBzaW1wbHkgd29uJ3Qgd29yaywgYW5kIElJUkMgdGhlIGVudGlyZSBVU0IgdHJhbnNm
ZXJzIGFyZQ0KPiA+ID4gPiBzdHVjay4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gQ2FuIHlvdSBwcm92
aWRlIG1vcmUgaW5mbyBvbiB0aGlzIGhhcmR3YXJlPw0KPiA+ID4gPiANCj4gPiA+ID4gSSBhbSBh
ZnJhaWQgSSBjYW4ndCBwcm92aWRlIG1vcmUsIHNvcnJ5LiBJIGNhbiBsb29rIGZvciBzb21lIHNw
ZWNpZmljcywNCj4gPiA+ID4gYnV0IEknbSBub3QgdGhhdCBndXkgd2hvIGtub3cgYW55dGhpbmcg
YWJvdXQgaW4tU29DIHRyYWNpbmcuDQo+ID4gPiANCj4gPiA+IFNvLCBoZXJlIGlzIHdoYXQgSSBm
b3VuZDoNCj4gPiA+IA0KPiA+ID4gLS0tODwtLS0NCj4gPiA+IA0KPiA+ID4gSG93ZXZlciB0aGUg
ZW5kcG9pbnRzIGFsbG9jYXRlZCBmb3IgU1RNIGFuZCBFWEkgZGVidWcgdHJhZmZpYyBjYW5ub3Qg
YmUgcmUtYWxsb2NhdGVkDQo+ID4gPiBpZiBiZWluZyB1c2VkIGJlY2F1c2UgdGhlIHNpZGViYW5k
IGZsb3cgY29udHJvbCBzaWduYWxzIGFyZSBoYXJkIHdpcmVkIHRvIGNlcnRhaW4NCj4gPiA+IGVu
ZHBvaW50czoNCj4gPiA+IOKAoiAxIEhpZ2ggQlcgQnVsayBJTiAoSU4jMSkgKFJUSVQpDQo+ID4g
PiDigKIgMSAxS0IgQlcgQnVsayBJTiAoSU4jOCkgKyAxIDFLQiBCVyBCdWxrIE9VVCAoUnVuIENv
bnRyb2wpIChPVVQjOCkNCj4gPiA+IA0KPiA+ID4gSW4gZGV2aWNlIG1vZGUsIHNpbmNlIFJUSVQg
KEVQIzEpIGFuZCBFWEkvUnVuQ29udHJvbCAoRVAjOCkgdXNlcyBFeHRlcm5hbCBCdWZmZXINCj4g
PiA+IENvbnRyb2wgKEVCQykgbW9kZSwgdGhlc2UgZW5kcG9pbnRzIGFyZSB0byBiZSBtYXBwZWQg
dG8gRUJDIG1vZGUgKHRvIGJlIGRvbmUgYnkNCj4gPiA+IEVYSSB0YXJnZXQgZHJpdmVyKS4gQWRk
aXRpb25hbGx5IFRSQiBmb3IgUlRJVCBhbmQgRVhJIGFyZSBtYWludGFpbmVkIGluIFNUTSAoU3lz
dGVtDQo+ID4gPiBUcmFjZSBNb2R1bGUpIHVuaXQgYW5kIHRoZSBFWEkgdGFyZ2V0IGRyaXZlciB3
aWxsIGFzIHdlbGwgY29uZmlndXJlIHRoZSBUUkIgbG9jYXRpb24gZm9yDQo+ID4gPiBFUCAjMSBJ
TiBhbmQgRVAjOCAoSU4gYW5kIE9VVCkuIFNpbmNlIFNUTS9QVEkgYW5kIEVYSSBoYXJkd2FyZSBi
bG9ja3MgbWFuYWdlDQo+ID4gPiB0aGVzZSBlbmRwb2ludHMgYW5kIGludGVyZmFjZSB0byBPVEcz
IGNvbnRyb2xsZXIgdGhyb3VnaCBFQkMgaW50ZXJmYWNlLCB0aGVyZSBpcyBubw0KPiA+ID4gbmVl
ZCB0byBlbmFibGUgYW55IGV2ZW50cyAoc3VjaCBhcyBYZmVyQ29tcGxldGUgZXRjKSBmb3IgdGhl
c2UgZW5kIHBvaW50cy4NCj4gPiA+IA0KPiA+ID4gLS0tODwtLS0NCj4gPiA+IA0KPiA+ID4gRG9l
cyBpdCBoZWxwIHlvdSB0byB1bmRlcnN0YW5kIHRoZSByZXF1aXJlZCBxdWlyayBiZXR0ZXI/DQo+
ID4gDQo+ID4gVGhhbmtzIGZvciBsb29raW5nIHVwIHRoZSBpbmZvLiBUaGlzIG1ha2VzIG1vcmUg
c2Vuc2Ugbm93LiBTbyB0aGVzZQ0KPiA+IGVuZHBvaW50cyB1c2UgRUJDLiBDYW4geW91IGFsc28g
cHJvdmlkZSB0aGlzIGluZm8gdG8gdGhlIGNvbW1pdD8NCj4gDQo+IFN1cmUsIHNpbmNlIEkgcHVi
bGlzaGVkIGl0IGFscmVhZHkgaXQgbWFrZXMgbm8gZGlmZmVyZW5jZSBpZiBpdCBhcHBlYXJzIGlu
IHRoZQ0KPiBHaXQgbG9nIChmcm9tIHRoZSBwdWJsaWNpdHkgcG9pbnQgb2YgdmlldykuDQo+IA0K
DQpJdCdzIG1vcmUgZGlmZmljdWx0IHRvIGZpbmQgdGhpcyBvdXRzaWRlIG9mIGdpdCBsb2csIGVz
cGVjaWFsbHkgdG8gYQ0KbGluayB2ZXJzaW9uIG9mIGEgZ2l0IGNoYW5nZSB0aGF0J3Mgbm90IGFw
cGxpZWQuDQoNCkJSLA0KVGhpbmg=

