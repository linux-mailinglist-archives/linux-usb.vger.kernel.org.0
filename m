Return-Path: <linux-usb+bounces-19430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA4A14567
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 00:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD503A830F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 23:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD4E22BAC1;
	Thu, 16 Jan 2025 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oc7SAdoL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c1BPG2lm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sGLLzLnQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61F22BADC;
	Thu, 16 Jan 2025 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737069555; cv=fail; b=cqtatH5KXyQlB0UB9YsHm/UAFEky7nJD0mztJV/7+ULEdUuPQEyTBl6k2ExbonURQhtauUtgi+iIzBTYqY3sNgcuRVy40QfhjevsVBkM0HYZhhbls3GGXTuiD8Ik6ZULjHLthc8mVoqGsEAulxhABoEYa7pVtHRfVxuA/4Umqpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737069555; c=relaxed/simple;
	bh=MGmgn9JpKNy6mX9HxlOnYrxxy37PQF/oY09WVmjezjA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XQNe+aBYuqp/fFMiRgKQH3FFSXOiZPg9zmDDdRHxDzjXe1iRO1jo+wTfXvR9eTP3cU7heVGm3tskvBLjYaPQxSQcQCLiD84dtgswVWf/cW4XICF0H3/NTbJQsBekqeXSmZ3qPpoUkd9yNFpTwSA326CrbVD9EBEXzdz5pNFVUts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oc7SAdoL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c1BPG2lm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sGLLzLnQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKCtXQ005259;
	Thu, 16 Jan 2025 15:18:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=MGmgn9JpKNy6mX9HxlOnYrxxy37PQF/oY09WVmjezjA=; b=
	Oc7SAdoLtP9xzl1ru55bdi4N8ZfHK60fgv2OmeXA1GW+rkXH579buuCxKN3aPY+h
	dIM634izAsDS98LFhoSX3zN+Gri8+80ku0X7D3fMdM+NdLBOx/OVCyzIOSLGidSR
	2bN29Up1f2bmHz1eqH0YGc3PdxC2cxR/EcKzZfuBalI9cOL9VTJUX7UfVtBae8pt
	EHixOgosLj/pp/nlvJfNTnuzTzniuRvaeH2R9FH94W+Tc2eeMqIgF2zytqmTIv/X
	I4qDH1M1fu7mgpZg5hMtQHSJyA1vqBAH+gqyco0EIYJ/2uKTD5qhRlpbudC+ddOE
	1R4JQi8V/14CAX7dnFFD0g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4478y00tx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737069530; bh=MGmgn9JpKNy6mX9HxlOnYrxxy37PQF/oY09WVmjezjA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=c1BPG2lmAmyoQ8otO0qsGtsfztJiV9WBI9XBouOlKmzbBxRMlJ3MfgDn0khzXGiRf
	 0A0dxPmW4uVDaJVjre5wErU9JZfSLnzosDMx9jJUSV8M4oGnVP5s3/zPd4M9/o8IOE
	 R1Xenb4QvQImkCR1a/SLtDRoFnD9kj5KlflJAj7wUeUre8LCAxpaVprMNoJFI8IYBT
	 JbkjxgMqk8bYRhmwFSgsY9SglXgp4Qp1Gyc7X0wmUDMKBsDlS7AxbAPEvHVy8DtKoF
	 EZM+ixjZA/VY5F9eAV1AQBUyfMXMDhnbg4ic9I+LdE1Na2da5gbbtVrEOfBnQPUcAm
	 tVRtq5PZxVnpw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B5E5640140;
	Thu, 16 Jan 2025 23:18:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4341AA007B;
	Thu, 16 Jan 2025 23:18:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=sGLLzLnQ;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AB2BC40467;
	Thu, 16 Jan 2025 23:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0sFcPk00JBt81mYrvUEjEMfgKREfxq1jwT+Pwd45N8AzCsTGiziUE89c27ixeSSrA67wwjPdZZV1M22VJBB/7nGhBRM9u2I8vR/oQ4lIGxlaFkyeHsN+dSv4DrGCAaoCtrRheKaAzKhIaz7R9T7eH6VqhiBeH3OEqdxophXUOXPrCxchtT8ZIDBbP+Rczhw0d10Id3F6xWo+jEhwtxYusAqpzHhIhURXKPXCJB7juD7AX2lw4TjFZ8lKmVXSBfivPmfhQ5rtcwskcJUjE5XJVuJOmr0e7UjlxVxNv8gdNdrs9nIzPKdWly3qcctDyxR0DtqdZYvgnR1YWRsALPufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGmgn9JpKNy6mX9HxlOnYrxxy37PQF/oY09WVmjezjA=;
 b=xbLNjWnLcgLLYLn0+0QNyw1FKpbP6/P5OZGyIDIzRyHjDZGLP58O9M7Ayv1Jccuk45rDqLVf/lc9/pAPYrdZwe8P//+Hr7EL1PsalqGJbUhiYu3IhHOb3YwoYwz5oQo06BLRflZ2/jQ1XmtwNKBOzcUOrLtmLg7R9rpkeOuJtdjHvP/Xi6pVEAskVqNoMHQ1OyU5xwoPkCoosEBGUQVDGtHVjA1iDYAcpsycizz8ciuKDtw+1gXR02kfhnbgjvVkWmbCuDEkGZG5c2Hc9FbLYv4niyNv6nO31VpIlqqhbSHezd9wMPBCaKnLM0tSDRsF6gtBqzdP+QamGmuggkbjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGmgn9JpKNy6mX9HxlOnYrxxy37PQF/oY09WVmjezjA=;
 b=sGLLzLnQHg2HGRyd6m2B9TSdv1XPFjwlinLqjWWEauLYBTJWFRYd7SnEz309f0Mtm8AlZy7G61NwBrzy+V1do6bedOtu//XdDo7mo81TzbM/lKDx1hDQRWZ7xrxtorxSJaEIEI6H4BXrCM3tP0eeFZ82PGeaFVhZbv1krXYcKLY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:18:46 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 23:18:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Topic: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Index: AQHbaC0eMwYEug38l0SxHHfTxkybwLMaCZSA
Date: Thu, 16 Jan 2025 23:18:45 +0000
Message-ID: <20250116231835.isbwmq5yz5issy3w@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6579:EE_
x-ms-office365-filtering-correlation-id: 335607b9-d706-402d-24a7-08dd36842010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dm9EV01tUEYzQVZqMjRxMnhiQ0VEcWorL0tDUUZBZlJualZIYUFTOUhLWW4w?=
 =?utf-8?B?Sis3ektCYXJvVVEzeUNXZmxvOVBBQkswRGlZK0RoWUZzbjZlc0hNZkpQRlgw?=
 =?utf-8?B?WGw4Zm1Pd05WQ2p1Y1ZSY0pPenkyLzFnczZzeUNqQzRBQVRvYXBMdGZEMjlY?=
 =?utf-8?B?TUVRaWVhRWpIejN5V0k4dWFLK0ZuYWMrL0E3dmhJaGlxbnJvNkJZNnNRNUVF?=
 =?utf-8?B?VTRGVFZJSFRBSDc5cHc3TmlKamJXMkRYcnVMWDY2NkdodGhNY0VncmJJeEZE?=
 =?utf-8?B?WTJYWWFLeDFCSmNRUkFqcmNjbWpYZnNha2ttd0FhaTl0UjYvZllETCtLT2Zm?=
 =?utf-8?B?OXlRMjhpYW02dFJmaTc1VytBbXZJMlYyVHNMZXQyU1kvaHplZk43TXdURE1w?=
 =?utf-8?B?SzR4SzFkTUhNcngrQVRSNjc2K0h1WHNKblhOOEsxU3ZUWHFHRk1wUWVBZFRz?=
 =?utf-8?B?c3loeWc5MTZKSGFiUnRqaTFPTXRWY0lKbmoxa0RnY3M4YjhmNHIxL2NRMzU4?=
 =?utf-8?B?bkdVekJQUXhTU2EyTzhHcWlsOEsyQ3V3VGtPaUFaZ1RHZ3hleE11UzRiUldn?=
 =?utf-8?B?cTVoaGRhZ2VaOGg0NnhkUis3TW9LcklxVDU3MWlwQ1RwOGxHemhXK2dUMlQr?=
 =?utf-8?B?WWtsNHVXMVdZU1dOSVpMdUhVV0ExdVBEcUNLQkl6ei9uZ3RHNlFQVVQ5Y1N1?=
 =?utf-8?B?aG5rdkpvd2ZxanJ0VXhFNnFiWTdGMEdhSUdVeXQvZHlnQitZSkNOZ2lncnBR?=
 =?utf-8?B?K1JpbEN3YkdCRkwvekhHTlRzUkpCd3YwWnkwdkFvYkowUzMxZGZBT045cTRR?=
 =?utf-8?B?WGNiVUEzMlhKU3htZ3pMMkd5OFFZcmpneDMzSTQvMko5V3dCWTlvclBrYnlv?=
 =?utf-8?B?S1NTU2duYWFTSnNBMDhlV21CNmM0Wm9wa1J0a1dvOC9rNFJxbDdPeTVKM2Uy?=
 =?utf-8?B?dEpaMXduMWM1SFlRang5ZXFHbjhPK2EwMWdwRXA4NmEwK1dqazhNZVhHeXdj?=
 =?utf-8?B?VWc4SGhPTXZJdVA1R3VYMm9RZUxXSjU3MW1BUHk3Y0YxS2tmeG9CeW42NmVp?=
 =?utf-8?B?OU02aGVQKy9hdEZ0RXdzNHBFMnRneEVwZnBseFBtekpYSDU5cXA1WFdaSXNk?=
 =?utf-8?B?bXZQYW1SblpacDR1WGRwYzVPYnlXKzlubGhnSXBGazhWc3EzTDMwaU1zOHhB?=
 =?utf-8?B?MUNhVVVNNGRUMkhpbDhucVBTZ2ZoaXB6a0hHUzZyQ09WaHhCZjN6OS95U2lM?=
 =?utf-8?B?cjBVVWs5ZkZMRkdUWTdWMlNhS0VFNnVJSFRVSnFENjI0TndNS0RVNUdaWG9r?=
 =?utf-8?B?cS8yTWlpL1EwbmgxSm1IZVJ1bERCeGlaaFVMU0Rnc09EeVpHYkZMYm8yZDZR?=
 =?utf-8?B?NTI2T3Mvd1RITjQ1aVpyaGpUaXFrSkxPZGxqUzJ2elZKNmxiODRxUXRXMnVK?=
 =?utf-8?B?U2VjeDdSYUJ2UU9hVHRwOVBneVBxajBYTy9wVkRYUndEM3FtUlIzNmR1blAr?=
 =?utf-8?B?L25jWkFwb2V0U2I0TGJVR00xQlpkcjg4T0hzNVlaVkcrc2JqdnZmckVYOEFY?=
 =?utf-8?B?TTdQMm02WWZXK3l4R2NHdklhNEh5NktnSjhnSytIckF0T3NJRE1rd0g3MHB4?=
 =?utf-8?B?bHpBQlllZWlDRGNxYng1K3NCdXhCY2FSOTZIYzBhUmRLdzFhelExZ2F3aWdz?=
 =?utf-8?B?bXNtOWRXbUhHc0Q1NFZ0b0FCY2Q2SmhWNzhmNk8zTHFYNnoxZjJtOXQwbTAr?=
 =?utf-8?B?enNMNUhKVmNycHg4R1hENU9NdHhXNk9ZMXUwbU42Lzg0Zk5PTjNLVmdTL1dQ?=
 =?utf-8?B?dk90NkVndmJ3T29vUXBZbEI4YTc1L2piajlxejVoL2FxY2NnRUliSzlMQWNL?=
 =?utf-8?B?YTRNT2w2UmVGNkhRQ3RudEN2Q0lhM2o3VXJjcnVWMjZvR21jL2xaOUFVbTF5?=
 =?utf-8?Q?o2TO9Voa1bSwB28qopfRwaPTFpGp7+zQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1BtRzJhK3M4YmJrL3ZyczdMY0VmbnlJaXRFZlllWlg2SUo3R2xCYWowRkFo?=
 =?utf-8?B?MVlTK0tlOWtGM1Nib082cFRDaExTZGIzZi9ZL0hYSk1OdGVwYVhwcXB4VEdZ?=
 =?utf-8?B?dVhtc05uUkVZeWRZYzNROTlzaDVORm5heUMvVE5YT1ExTVhXK1lKQVpma1hO?=
 =?utf-8?B?c2paUFFqMkFYRHhxc2tVTTZWcmtodFVBL211Vzh0Y2FTbnRjMWNqTXpqMW5K?=
 =?utf-8?B?ZVFLa3VwZkVrSGdWMzlXTzBhTVN6MzIwQTFaOUpQMHZQM3dUZUZLYVZYRWk4?=
 =?utf-8?B?VExoei9pbHdpTHBjVisvakhwR0RoNE9vdGZMZWU0ZXFlQkxoRVFPNEE2cmpQ?=
 =?utf-8?B?QnlsdDEvbnBxQjdVcXlIaE1YaUUvL1lsZkRBcEk4UE5SU0FOVm1zYlBtdURC?=
 =?utf-8?B?Z29rNGNrSXZlOVArdCt5cDIycmU2QjZ4c3l3dW5uUmJjWE5TT21udlcyNmtF?=
 =?utf-8?B?b0VKZ2xsWmZZTEFNN045Y0h4Zmxzbk1sU2t6NDJsbjhFTHcwdlhxZDFKajNx?=
 =?utf-8?B?aEVPQlE2NmN5M0VGbTVWWHY2a3QwSjd6ai9ZUWJ6d2pUWHdERVJGWWJGNHAy?=
 =?utf-8?B?Yi9VeFRGK3pmM0dCaDBnQlpKUWcxRkx1Mk40VHhXWUhhbkgyN29MVlo2K2p4?=
 =?utf-8?B?RHhmTlkyNHNSY1NvVTU5WWRsVm9jbUFpeVUrNnpjWU9kY3U0Qi9KaUVSMXdM?=
 =?utf-8?B?SzY2SFlOY1hrei9SRWFnTHRZWDhqVzE4RStNQWVwRHlQaHlGQVdwSVZNZXNS?=
 =?utf-8?B?eGtVcG13QU56bkJ5Q21pNkF2Mkg5aGFCc3JRNStYdVcxU1BMT0I1UnJqSDVk?=
 =?utf-8?B?cVhPOVhHa0x4eldjZ0lYdWYxNk1aVUtwTFJHQVo5UHU0UWd4cHFSRGQ4UEFC?=
 =?utf-8?B?ZlM1VjU4ZEwvTUxldGNrbzJRVUNYZmxQMFh5YnJGMmFPQmdFQ0lqTStCVm9u?=
 =?utf-8?B?NHVidGRPVkdRK3BPQUFiU05FdHA1ZEs3a1IzZFBMR0V6SWxsZ2llQ0FwQkUx?=
 =?utf-8?B?OExmTDNFdW40eE85bTMyb0d6OW8wcW5Bd3RpVU9tcElWQU1SRjk1eUJvbU94?=
 =?utf-8?B?YWV1RTBVaHQzUUpTRDRNMDIreE9yZGJpVm9RSHZnU0ZmeHJGWWxMVC9NYktE?=
 =?utf-8?B?Nlh5S0ZBT09PcCs4T1JGUm1lUG9QMTFyTmFTejFEdEt6VlNkTjVxV3o4NU90?=
 =?utf-8?B?TW05U3UwODZ3WDMyZThndGd1bUpZTXJ2TVphaTNvVXE3NjhTV0g5aEFETDhB?=
 =?utf-8?B?eHNaR1BCdEc2cWU1dkljT0MrajlKSGRjTDFsZ05tdWsza0t5d0J0VTNvd1dF?=
 =?utf-8?B?bm05SDVpN2xhZERDdDVXcndmWTB6VmE3d0tTVTFGMmNpclF6WVNBTmQwN0VX?=
 =?utf-8?B?aDlDWTNTbjVoc2Z4K3FZTEZaMFVGMEFENG5PaE1YbVp3V0ZzWnErVXpqZ3Zy?=
 =?utf-8?B?MG01S0gyWlBISTl0MHNTdlFSY1ZJei9ubnEyZ2NoZWpmQVZhYkFlR2ZsNnBy?=
 =?utf-8?B?RUFkNDU4bnhHeVBQcldOaWZZYjFRSGU4VWdJWXk0eEVNbVVLeEZQcUdEa3py?=
 =?utf-8?B?bGxvUVh2dkZnUjhHOE5RcXY0TnNHK1U2RVJXMWE2MUxtaHMvMk5KbW00Zkxo?=
 =?utf-8?B?dyt4UjNRRFV5bHphN09GbE5xWEJueWVuTGxPZXdYeVp1bVRqS3laclBPVmRz?=
 =?utf-8?B?dVJpTVB6cll5R1Rlc25FZVplL0o4TU5CUHRjYy9XdFFOV2VQK2NEY0YzcER5?=
 =?utf-8?B?d1ZnVWNDcFFXM0ZSZzBLcnZ2eDZ0c3pST050aGRBdmk1RVQvTVJnNjgyOXpp?=
 =?utf-8?B?VERsOVdJc1lRMXJZL0xVN2IvK1lnUXQwc1VJbVNNdnNibWZVZTU4cTN3ZU5x?=
 =?utf-8?B?bnlGdFpvYm1yME5lbUNKY3ZYYm1wbythdVQwQ3lnNnhmS1BPdjkwM1JjQVRR?=
 =?utf-8?B?YWpVVHpnTVRTNVovVk1xVDR4NmhOWTBpVjZBVGF6cWU0M2V3NDZzSFdxTzk5?=
 =?utf-8?B?ZWo2VnYvNnM2ZmVhbTNadUp3clhPVnB5K1U5YVp5bzVrNEtkUGRRUGpOOTI1?=
 =?utf-8?B?Z0JjZHBNZE1jNlpnYkswa2YrV00xMGo5RXlkK05CcGFBV2tPZ3Z2OHQwRDNk?=
 =?utf-8?Q?fRQk+jFdIXxxhj4HAayX0A7jF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D63FB35EE0093543AD712F3C1CEC4410@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+nF26UBKjgj23qnMn25V/modd1dJ8s/FKKrZ88LPFDeYNt/tNaxhqQY7LDXSg93au/pjyYtO/BEVX0vA0uzkmtqZHwCbfgbLDCITVVyO81Dv3vMvtZ/YNB7K0WcBEYEOgi0AvhT2H/MIZFdd10lmN/3J/cHsRdTFiUA7JkfTYKXktIIupI30JmrUxmdeUVFXa8zChHVoJmQSH8NdBnV9uNok9Cw1TYsE9S/P1YA2YcTrbAL2Ea6zcS/C4zIl8oZn56ZYh7edKxeIdRR6uCWGteGjPFb9WV5y31x7UTIl2Pw7Pi7NrnNJvrA3J51rY92eE2dteEBY8bncoIx/3RSgY5GJGdRTiM/fg0ZfdKpj9RXYH+wFPA1TB802h/tgt5iqhCABvo7Vymr1Y/DUSZwIguOq9zIqNoqFS8YgyXK/P1f+pPJRsT8MlLljLBwOFgO43BClq1cD3lvVZLRI7/RTxV8Xlc4z511jRZsZQVkhpOoVKFjjROtb9G9WO9XkhGCPW1wuIMtMtPluePtJAe87qhsjgRHk6Y90OOb6NSywHc2PIAWmtJxDww8jAWSRXlSfntnsIqmqB7+XktGG4sNiWSdsQ1DwBCNCa+PnGUgWvqubI4FHFtxlDnjWahmz4j8JbCaPkWq9lTRKo+MATjOWtg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335607b9-d706-402d-24a7-08dd36842010
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 23:18:45.7871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8Q0oXoBxs7XCaBRWn+1s1p/9VBCXKXFLqRtCEekTxUJbsu15AwFJINsVf58VAjKGbwchdjbiC49Pl1iBjT6fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
X-Authority-Analysis: v=2.4 cv=Ub2rSLSN c=1 sm=1 tr=0 ts=678993db cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=146BTUl0iNqO0pW-8dIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VmxDIgjEmEVSwnDNV9-W4kJLEZDI3bOe
X-Proofpoint-ORIG-GUID: VmxDIgjEmEVSwnDNV9-W4kJLEZDI3bOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=632 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501160172

T24gVGh1LCBKYW4gMTYsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gc29tZSBw
bGF0Zm9ybXMgKEludGVsLWJhc2VkIGFuZCBBRkFJSyBBUk0tYmFzZWQpIHRoZSBFUHMgaW4gdGhl
IGdhZGdldA0KPiAoVVNCIERldmljZSBDb250cm9sbGVyIG1vZGUpIG1heSBiZSByZXNlcnZlZCBm
b3Igc29tZSBzcGVjaWFsIG1lYW5zLCBzdWNoIGFzDQo+IHRyYWNpbmcuIFRoaXMgc2VyaWVzIGV4
dGVuZHMgRFQgc2NoZW1hIGFuZCBkcml2ZXIgdG8gYXZvaWQgdXNpbmcgdGhvc2UuDQo+IFdpdGhv
dXQgdGhpcyB0aGUgVVNCIGdhZGdldCBtb2RlIHdvbid0IHdvcmsgcHJvcGVybHkgKHRob3NlIGRl
dmljZXMgdGhhdA0KPiAibHVja2lseSIgYWxsb2NhdGVkIHRoZSByZXNlcnZlZCBFUHMpLg0KPiAN
Cj4gRmVycnkgYWxyZWFkeSB0ZXN0ZWQgdGhlIHByaXZhdGVseSBzZW50IFBvQyBvZiB0aGlzLCBi
dXQgSSBhc2sgaGltIGFnYWluIHRvDQo+IHJlLXRlc3QgdGhpcyB2ZXJzaW9uIHdoaWNoIGlzIHNs
aWdodGx5IGRpZmZlcmVudC4NCj4gDQo+IEFuZHkgU2hldmNoZW5rbyAoMyk6DQo+ICAgZHQtYmlu
ZGluZ3M6IHVzYjogZHdjMzogQWRkIGEgcHJvcGVydHkgdG8gcmVzZXJ2ZSBlbmRwb2ludHMNCj4g
ICB1c2I6IGR3YzM6IGdhZGdldDogQWRkIHN1cHBvcnQgZm9yIHNucHMscmVzZXJ2ZWQtZW5kcG9p
bnRzIHByb3BlcnR5DQo+ICAgdXNiOiBkd2MzOiBnYWRnZXQ6IFNraXAgZW5kcG9pbnRzIGVwWzE4
XXtpbixvdXR9IG9uIEludGVsIE1lcnJpZmllbGQNCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2Ivc25wcyxkd2MzLnlhbWwgICAgfCAxMCArKysrKw0KPiAgZHJpdmVycy91c2IvZHdj
My9kd2MzLXBjaS5jICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysNCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMgICAgICAgICAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysr
Ky0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gLS0gDQo+IDIuNDMuMC5yYzEuMTMzNi5nMzZiNTI1NWEwM2FjDQo+IA0KDQpJJ20gbm90
IGVudGlyZWx5IGNsZWFyIG9uIHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdlIHlldC4NCg0KSG93
IHdvdWxkIHRoaXMgZXZlbiB3b3JrIHdpdGhvdXQgZHdjMyBtYW5hZ2luZyB0aGVzZSBlbmRwb2lu
dHMgKGFsbCB0aGUNCmluaXQvdGVhcmRvd24vZmlmbyBhbGxvY2F0aW9uL3N0YXJ0L3N0b3AgZmxv
dykuIENhbiB5b3UgcHJvdmlkZSBtb3JlDQppbmZvIG9uIHRoaXMgaGFyZHdhcmU/DQoNClRoYW5r
cywNClRoaW5o

