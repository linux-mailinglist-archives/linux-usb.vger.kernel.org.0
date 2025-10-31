Return-Path: <linux-usb+bounces-29969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B808EC27232
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 23:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813DE3A1B05
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 22:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279AE2F83DF;
	Fri, 31 Oct 2025 22:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DgAHVNWD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j0iyp8rA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dIV5amZH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861FC24169A
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761950510; cv=fail; b=acM8rR1beyBul2+kDWW0ePVkVzYf8Fgju3BEClgE4FwwmSdlvY1dRIFI6FsL0NN4f3uYPnsh0SszOW/F8BhMez6U7iUsShlcKckmVeshhg+iWPsO52+Uc36AO1w13O8RGJPKQunnFdbsZnz0eSCU7VVE/iScM0CeIBuiQTGy9nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761950510; c=relaxed/simple;
	bh=t/9ssT42CfpPEsyf2oKX8dCH8Oq+Vggs+HPeznCJSus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dc/shITOOJQkf8o1OP7vntn1SlbwV2eVktq7Vt8dIut02Uw8yiTLbbUXYYyLAJ3ip3pNqNgmfuSdYnto5nOMXw1goCKbMvwY0HADiBHZAcgecs3ZDWjfyWpzUJiz5rXwlZ2/OAV7C1aJvipKCxhuROvBzJncmjwmtouhpWG0l/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DgAHVNWD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j0iyp8rA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dIV5amZH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VLcSqb1464631;
	Fri, 31 Oct 2025 15:41:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=t/9ssT42CfpPEsyf2oKX8dCH8Oq+Vggs+HPeznCJSus=; b=
	DgAHVNWDCCVoVBHNExddcM7IUstU/4acMJ4wQpSI52kcpD16hkwOprgY8PwsRxVn
	NIVET/U44ivDhvDerDGfy0BqWdQQheDrEmTPRT1mktxXKlDpz3uUJ2iEzSa1rNH7
	+LgL0dVcrdU0A9D5ECsWZorTG07thw2eEZAJBqJCy2vbdd6vz5JE6JRqu9tVHYRv
	+hZDfnIWwafo4EXP3uRO1MgW119SxOf8xmARtOBhGaeIAXF3mb5wzLaPiClOHW11
	q1HiqQRGLnSS1dcFUo3LAgLq5WwHjX8F6D1M1IYPYSLghJZzXUWSpjN/+SiynRnr
	Hoz+/ybxDp6BdHPBg9gWsw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a46apgchc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1761950485; bh=t/9ssT42CfpPEsyf2oKX8dCH8Oq+Vggs+HPeznCJSus=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j0iyp8rA0iy9C/lsNvV1HKDQ/+8W7JpE3ZY0OLl5UAaooo4eS1aRYMj6Rdb57MqoZ
	 2Zw6gLRlaAZFdkcNl6NdqorZzIAYAZJ+AnBdeSo3P2WjE1PWghxviW2+TbmXs38B9B
	 bPuXj35cpdTw2kM7Tj94UnT72Q7r+WpDMK3hDwAWGCNdIzWT6MEJOi1s6/nIAIuHz4
	 it84/ox2jCEhjQC3delKmnKVQpbURlNW/MSeWz4nWm66nmURHh0KU1TJmpGISEHdrZ
	 VN1d9eYZ0tN6iGtE8kzW4D3wttHN6KNc1r1mVmpY4Lt6ipGK1p/18FSUl1H0iM8TaA
	 kelA6y+XI4E4g==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1DBA409C4;
	Fri, 31 Oct 2025 22:41:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 560EAA00D5;
	Fri, 31 Oct 2025 22:41:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dIV5amZH;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CBDD722016E;
	Fri, 31 Oct 2025 22:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrukJPcAImneCxp8nVwpA3wLEWSK4j7RLwgAgYVoIQb4x3YesuCDruGQ4jpmsMBoUdl2NiZPolarsyrpvdNM2EeA5VFY2WVgK1EuZ6B2Ee0ZxoAXabPAjwxnMmyKabIUSE++cFM/1XxSUGtqc0Y/WyxaImylePkpT43wTAZOwXP//TowljqvPdzmhxPhtUlrmJY34tqaL+upwfUNlnYKcQn/WcqCvl4rXn99jj17tPD3ZxKyfLZYXJF6O9Ga75Dv12TYDdoHCB36M78k8nQX8Xszmz2+qKKSrOdCI8xvbdA3GGmz//U10RJLjGXronj/qv8sFKGij6ZlJr5sUnsKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/9ssT42CfpPEsyf2oKX8dCH8Oq+Vggs+HPeznCJSus=;
 b=xN4ywImHZw4F3AKQevYlF1WTeSDq3NAaT2Gz+cYBZXszZmgwNn81iXh9MOLbgC6pgWYglUPiWto/G+LmKTbYFm0FroExZIS0TnluDXjogoqrkRsjUGUPYTDtWutRGA+ixseTsWf6f/LuHy7JoHp6PPrWl4nKj0hP93rHMB9PeidJ1+ufQ16PdJnW1e/2zRUi/xwDmIlXA3esH+bJuJMQaaRmsWZlsgwzdIZ5I/IVsxEPLB8eUJ8eaVjS4SFQ6XXiWpXIwMZhKzmGsq35+Dbz37BILJPgVXHvXyy8ZYdQAyzzmWernFPH8exqjaNY9PQ5V4M+QruOAyImyUt+B7wbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/9ssT42CfpPEsyf2oKX8dCH8Oq+Vggs+HPeznCJSus=;
 b=dIV5amZHWnvjhi3ymSi6XgT1W95tprTdCDkQqGKvDWdlAiVe6GeR1OOHeLg95KgU0UiZQblX2bA7GsCzmzTWWyEsERw7bP7at8Ea65fPUNC3DgFhpgzQEZbEaOwU9jEl79kHef62alcQJMmG1Fz/XhzcCSckEdZVrvidK14avFo=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 22:41:20 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 22:41:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Li Haifeng <omycle@gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>,
        "Felipe.Balbi@microsoft.com"
	<Felipe.Balbi@microsoft.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Topic: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Index: AQHcSXrPEz2q12AfYEm0nk8jz4+djrTab0eAgAA0aICAAjhGgA==
Date: Fri, 31 Oct 2025 22:41:20 +0000
Message-ID: <20251031224113.4ml474v6fuiytkcf@synopsys.com>
References:
 <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
 <2025103049-suing-renewably-fd67@gregkh>
 <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
In-Reply-To:
 <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|CY5PR12MB6345:EE_
x-ms-office365-filtering-correlation-id: ff6869e8-c880-4316-d676-08de18ce9c80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjZDTVFHQ0llV2JhaTBuam9mSjFXRGRMZk4wKzFRN2lTaWVQMWJGcEl3Mm11?=
 =?utf-8?B?NkJwVVJ6bW45c3c4bVUrT01veitkelZKYnJ4ZGh0aXpBcVRmZkRUNFZGeDYw?=
 =?utf-8?B?Qm5LWHMxcElLUzNwMHVnSGxxT0ROdmRYZVdlUkhHTk0xZ3VlLzFxTitoTmtY?=
 =?utf-8?B?RXk3bWhFOW02MEJYQktHSmpBN1RRTGxXK2VjdUlCckh6UTJ2bVVVVlltMWFH?=
 =?utf-8?B?aks4Q2JZV2ttenRvRjBBR2c0Nnc1anBwOHNINENNaW9PaURCQktVWXlscTFl?=
 =?utf-8?B?SWxsWVc4SWpEVFJkUE1wTXFQNmNad0M1bExLcXl4VjNGcW9WU1NNTjNZT3Bu?=
 =?utf-8?B?Mi90YTVZUzJGSHA2SFZKWERKTk5WZjh0UVM1YVNia0V4cnN2dWwyczlHVlVm?=
 =?utf-8?B?NDVsOGo1VXZtVnZQSW94VzRoRjBiV1ltUkwza0RsTE9SVDhUVGRuVWhnajg4?=
 =?utf-8?B?ajJQb0lSYmRnRElkeG9kWUhmUERWYlhNSURyMWZrT0E2WjlQVklwYlE1M29W?=
 =?utf-8?B?enBaaWlFS0Nuc2IrZndlbld4eUJObVpvZUZoTFBuNE1JZzlQM1h3VjJhWEVt?=
 =?utf-8?B?RFQ3TEtsRmJiazdpand4OUxzNXc2Z1VyNWEvSHlkQlI1eGp1VWYzOXlDUWZS?=
 =?utf-8?B?OHBrMWkyVmFtRGhOYWF2Tk83eHl5SzNlM20vTVd3M3plaDR1WHlONERDdFBs?=
 =?utf-8?B?QkpzcGlJT2R3bDNBc1M4bSswSVFSdXZFN2N5WGRYSW5MR0tna2trWEZMR016?=
 =?utf-8?B?U3BzNDV4eWFmNU9GNmZHb0lvc0dHbkpEUElpeHVVU2dYTmo4Z0pzU3lmcUc5?=
 =?utf-8?B?RSs1SGVaK3BsdnJXQmpvWm9JUGpJeXJrcWQwVzFtR216NlltK2RDRzF0U3Vn?=
 =?utf-8?B?ZmQzOHVtT2d0SVZlRDI1RXVJejNCazBTZ2hjUG9rcitsSTlqdlhnSDhXMFZV?=
 =?utf-8?B?bG0wQ3liWWdCOFNGUVBrT2Z2Tk9EQXNGbnU4aVRtRUlMa1pnSUpIMEY2ZVBy?=
 =?utf-8?B?VlpabGp0NU1ZN2xGK21OQ1VTakM5aS83SENicUtpMWJsMVQ4RHRiZzVqUU5m?=
 =?utf-8?B?QmNYa0J2bzlBelhzellPbGpDMitUZEVSVzMyZ05JUFZZNFpqbEI2TWhTKzln?=
 =?utf-8?B?L0x0cVdyY1pGTHRrU1ljQitaVHZ1dDcxQnNmTWovWGxLcWxJSmJJNXkrN25h?=
 =?utf-8?B?azJ0K1VGM2h3TUdzS0xIZ0lxdWtTc3dkSWpYTFJVb3VqRTJsWjY3Mk9wVGY3?=
 =?utf-8?B?WXhNWjd1TEt6ekVVWVQvL2F2WG5VWnh6dkFEQnZsNXAzeDQ2OXUwNmY0b09a?=
 =?utf-8?B?NmxrQXhmWUc0Nnljd0ZJSEdhT1BDOElVU0VKVnZrM1NOVVpiNXZFc1JQK1Ji?=
 =?utf-8?B?V3RRcXRPcFJ6TXpYWExUNnYrU0Q5emlIVEJuaWsxY0Nkc2cwZTFDQ3hveVFY?=
 =?utf-8?B?YytFTE5vLytqb3NqWGRNVGZ5bExKVURuVlJFQ0tORGUwekIzaDNDZ3RWWTVK?=
 =?utf-8?B?clRRSCtWZG5JeHdlemZJalhsNEtGWmpTdFJLRFJWSEJTMWtoMDE4ZnA2bUZp?=
 =?utf-8?B?cCtHZTcrQlhwZlF3SGRZTWMxcGVvckhISGIvdGc1OXlVajNhMFVudHgxcFMv?=
 =?utf-8?B?RUQzdThVZmdHZ1pNdXdwMzlVQ0RmUnRWbUkyb244WTM1OC9uZEY0eFlVY1ZO?=
 =?utf-8?B?RDJpMG5JRjR4cEV5cjBiOGxnMnplTm5SaXNlamtYVDAvM0oxdXlSZ2s3aFVx?=
 =?utf-8?B?YVdvc09TUDJ5NUZsWVY4UHRCbG1DaUFlaml1YzVLYTAydjhyZzQyeHJaQ1N3?=
 =?utf-8?B?NXVRWnBtWEFZN2srUTVmWXV0WVBLcjY0Zm5JL2ZIU2VXRTVKMXVjMWNuNHUw?=
 =?utf-8?B?V094OXczK2VhUy8wcVg3VUtaYXVWZVA5alBLUXphNzF4dmJkUVZjTHZyaVRa?=
 =?utf-8?B?b1F6dnAvdURuK1IyYk90ZlRCbjFEZ1J0TmowaHB5MVE3THM3RHZTbHdsazVv?=
 =?utf-8?B?dEdzcXJFYkgxRDRQTHZYSUh1bVpZdHFWeVRVQnNkb042RGNmTWNWNGQxY3E0?=
 =?utf-8?Q?x7dxHu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y292eTEyNnpoVXlKMFhkdk9iQ2hhRWVHVUgvNnJoeWNpM2JzRm44WnVOSDRq?=
 =?utf-8?B?UWY1OE1uZ3BLSjVIenpnVmNPblV5cVdCUTJJdFdnNHFWbjZjSG5TZk9QaFpJ?=
 =?utf-8?B?S1FpZkYxbUViMlRsYUthY1FKZ1Q0RWlhaDUzeUxiZHQ0VWRSWnpBTUtFS1lH?=
 =?utf-8?B?aTd1OEc1Tm4xeHY1Z1RqbGFqU1l5d0xmRE5CS1AzWFNod0tIc2Vnak0wditS?=
 =?utf-8?B?STYrV2M4T2JDbFBlaWtSK2o4VUhlU1FpTWVKZ0pheHUzQ0V4b0wySHlsM3Nq?=
 =?utf-8?B?M2pDblhxSndTMXZJZWx5SVF6SWlFVnZKNzF6ZjZzbHY4WjViaFdmcjVhTDhU?=
 =?utf-8?B?cmhldkxzQm1MRlpHM2VFd0JNYXJIaVFTenhkWmRSaGtkaWdnQUpYT3Q4d2wv?=
 =?utf-8?B?SHlkUHBBZ3hEOEdzUnMwcFkyR0IyNml1N0plYVA1MFBySkp1Y3V4UmcxUjJr?=
 =?utf-8?B?VjBremREVS8rSHRtZ2lTWXlobDcvOU1YV1JyTkVZZ3Jpcnk3SDdLY0UxNlA0?=
 =?utf-8?B?WHZPTmRZbC9PUnA0UjhocWE3VW5wdU9Va0dqZlI3UkpIcDZpZWlpcUNpeGdi?=
 =?utf-8?B?UkErdXJ6L0J4aDFwTSt5N3pnUjRyKys4dkV4M2pwaGg3QkY4N1BacUZZamQ5?=
 =?utf-8?B?WUw3bHJoOStmMUpzamx6WjJJRWZJNFYvc095NDdCRURZV1dieWhNQ3FpbGNM?=
 =?utf-8?B?dnppdzRueFJSTUI3WnVtUW5leUFSVEpZbWNYcTZaVklpOFlIZk1sdFh5cXVE?=
 =?utf-8?B?YTBIZURyMXh2QXVUTnFIektWYXEvQUNhbUpMeEE0WVlJcm44cEQ5cTFkU21F?=
 =?utf-8?B?NVFydTJyRzFuUmVUTEZZUS9sSmxrQ1RaNXpFaXpQZjMzRS9DQ3QyNGdnVWpa?=
 =?utf-8?B?RHVxeTBRYmRROFl6QzRVR0JnMVlvU3RobVVRZ1pFQUM0ME05b2ZFaDJOSGEv?=
 =?utf-8?B?Q3dCNy91Mis2ZTEyUTNVczNBSjdxZHlGWGd3Z0Q0U0c3MGVhZHc3THkyZ3d3?=
 =?utf-8?B?Z1JFblhES21MaC8xNzlGempscXlnWjQ3ZHpaSnJJS29YWmYrc1ExT2xhZXpS?=
 =?utf-8?B?c1hMa2ZBbUtXYm5TMVVWVG1WN1RidmRIUGl3MGlrN2t6ZENKWGJyZ1h4TVd4?=
 =?utf-8?B?ZnZZcGxzMmZaNHZjenZzMnNrQmUxT0sveE1EUEFGb2tWVitneFJjZStGL0E2?=
 =?utf-8?B?dng2UWRWZTVVY2EzTGlCWGF3SllTQUhvQ0Q0UU9saUdrVmEybjdEYkN6ZVpl?=
 =?utf-8?B?Z1FTNjVscWZjSE1KTzhaLzRvcUQ5NmhvVDdCZGV2dGp6ZkdCVWpMMXh3NDdl?=
 =?utf-8?B?WGkwWFp3MFg1OHNXbE5rVk5MMzlMbUowc2kzSkt5TlhLTkxtaGZiWHZ1Z0FC?=
 =?utf-8?B?a20wbTdiZkZDZmUrdDBZVlROOURyZy9yR2F2SDNzS2xWSSs1bjF3eWI1Vk5V?=
 =?utf-8?B?ODBzdmNtUGRyVEhwV3RFdmRBQU42QUVROWxLZkJ0WkN5TzhtUjU4dDk3eHI3?=
 =?utf-8?B?Z3hnUVJrbFFhRWFsR2g3bUxEVldzVzRoMUZjY0hLSERZYXNTMDduajNZVTBp?=
 =?utf-8?B?RldFNmc5UkZEOVZueXRXdm03R3N3Q1FnelgrYVZldllzd28xNms5SkNzN0lC?=
 =?utf-8?B?c045dmtPT1N0aDZDOEM5UXI3V2RZSU5YOHJzN0dpQmhRR2hGbkFFOStiZm9K?=
 =?utf-8?B?SmdKLzFIOE14dUllQ0YxUC9QL2pLemQ1QXpIREVQVEU5UGxISXprMFlVUjQx?=
 =?utf-8?B?M1QvVzV0QWVlMVJ5U2x1dG43VWxOQWhLMk5TcnhraTM1Wi80anNWZmpIYlNN?=
 =?utf-8?B?eHRmNWJhTWFlejNUT3VNN3ViYjlRb2Z4T0l6aklmMXZRa1dqU0htRGppT25E?=
 =?utf-8?B?WWZ4aFpYc1MrTFJzQU5iaVlwVU1TS2JaSXdyMGlmMS9nczJZTmRKL1k4VEJG?=
 =?utf-8?B?ZnRmNnJDKzR1Um5VUTdZM0VHLzllSnJGay8rYVlaaHMybmoxOHdxUEZ6WGxI?=
 =?utf-8?B?SnpQUFlEY093eVdxS0ZJK3RDZnJNK1JPRGc4dEpwTU9DdG5xWWRXV2MrZkUy?=
 =?utf-8?B?NVV3RzZpM1o5N1phR2xpUDFvUTA0MWFyWGtGOWkzQnBBc0dpL0tsdzB2cm5y?=
 =?utf-8?Q?ow5nHkQqRlPBCobuQ4Aq4GJnx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70F2393ABE860B448FEF9452BA368E52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UP+MZbgmwHLPg052xESElBMquYO/+yKZYM8v7OQi+A+gVCHiG9hdl+ShIEVYZ5drKXwPTmqdxUXMilBKcsgc8laIsQpkR4Prr9+DWo8pKoSQMU5xso5DgZwY/6ykghpHn6fmyvJT5gDpAisH2G4jiSHcCBWJHueUyU6/C4cNk9tqRw0HDrpZiaybceSnije1pV7USdfX0MjZ1T4TCk5FiLrIdibc8he6xOzEiQHKH7gdNsctVSjLqdP74nVCNlisFFtkbmJ7gbjTZoejH3wVBEa+uNsXGx1p0IVDKskvG/7+B1E4LPI3pTqExRplq+XUA/eydvUijKsA3hrO5gIfBmkUgYPaXaesTgj1DkrdwWblALeK32PKAPN3bEVvzRLBkcuJ+Q+cbAHE+qcqo1dD4KuRjKQTbm13fZr/b5DMMvR0lclyh3C/bMJsfpNuk6HmAycEfDuFvwsPQnINbHsb3W1D9vAq7P1xU7OBPVBjejfWB3wnKu3ftXTPxHtWnad32PyvLsS6sfUBGxbdG28li2MRI6NWeKawmS5mk607lEOynyZtR0Pmmnzyt0QK9IFglzJvBtamDBf4emsxg+MAJqajPPFjNwMo3VF2PY4NJCgjLCjInJ2Jv00RnC6jYQ8XUjtJbrvz+wcAecEjJO/oOQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6869e8-c880-4316-d676-08de18ce9c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 22:41:20.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9zGO13CqGGwKIBbnfcckYztjOpI9x+A48aYAk+3i8LsX2DzN9rRhFXX6CtRHUzOuHvhcKzYSzWs/RiOpj5XSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345
X-Proofpoint-GUID: poUjBtWFuNfWMlI8lCqBntKagNa6DhWZ
X-Authority-Analysis: v=2.4 cv=TvXrRTXh c=1 sm=1 tr=0 ts=69053b15 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6PREwkXszEuvT8z6n00A:9 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: poUjBtWFuNfWMlI8lCqBntKagNa6DhWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDIwMiBTYWx0ZWRfX4XaGYPtz3ySJ
 KbFZz5O5dqDqITPtaUlDC26XqxbcDQvBdyGPqdXInHQGRJnPk25zxtym+itSz+Mxy8nFrU9ddhc
 j94AHZAfn8au4pHEU2ou+hx9TPPeQpxLwfY85imEZ94fk5Vic+IpbH/g0rRuUPS9uRY8mQThhO0
 qzm8o0TwdvUt00d7fAm+iksERQphYCN6dpG5yJDm7OkDMhDG+uKJ8uVc9ByALTFlAMUEaFcG9Xj
 EOrdHDtth8UNLqy3txubIEX2fWZgdRTtnQ5P0ZyGt9jUIt/AMhALQyZTUKtnqSx/7MIrk8QqX4L
 Iqu2v8P2Z5eahpZnsAbPLBbWNsGCDG6HMvPP2fNLof6qWsOul8ncYKZH31V6hrpaX6Av2c4pVym
 qxgnSJLwiD/+67g+s5I8Pk6ghfnksw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2510310202

SGksDQoNCk9uIFRodSwgT2N0IDMwLCAyMDI1LCBMaSBIYWlmZW5nIHdyb3RlOg0KPiBEZWFyIEdy
ZWcsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcHJvbXB0IHJlc3BvbnNlIGFuZCBhZHZpY2Uu
DQo+IA0KPiBJIGp1c3QgdGVzdGVkIHRoZSBpc3N1ZSBvbiBrZXJuZWwgdmVyc2lvbiA2LjEuMTcs
IGFuZCB0aGUgcHJvYmxlbQ0KPiBwZXJzaXN0cy4gSSB3aWxsIHByb2NlZWQgdG8gdHJ5IHRoZSBs
YXRlc3Qga2VybmVsIHJlbGVhc2UgNi4xNywgYW5kDQo+IHJlcG9ydCBiYWNrIHdpdGggdGhlIHJl
c3VsdHMgYXMgc29vbiBhcyBwb3NzaWJsZS4NCj4gDQo+IEFwcHJlY2lhdGUgeW91ciBndWlkYW5j
ZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gSGFpZmVuZw0KPiANCg0KQXZvaWQgdG9wLXBvc3Qg
aWYgeW91IGNhbi4NCg0KQXMgR3JlZyBub3RlZCwgcGxlYXNlIHRyeSB0aGUgcmVjZW50IGtlcm5l
bCByZWxlYXNlLiBGb3Igbm93LCBsZXQncyB0YWtlDQphIGxvb2sgYXQgd2hhdCB5b3UgYWxyZWFk
eSBoYXZlLg0KDQpUaGlzIGlzIGZyb20geW91ciBwcmV2aW91cyBlbWFpbDoNCg0KCS0gVGhlIGRl
dmljZSBzaWRlIG9ubHkgdHJhbnNtaXRzIHRoZSBmaXJzdCAyS0Igb2YgZGF0YS4NCgktIFRoZSBo
b3N0IGFja25vd2xlZGdlcyB0aGlzIHBhcnRpYWwgdHJhbnNmZXIgKEFDSyByZWNlaXZlZCkuDQoJ
LSBBZnRlciB0aGUgQUNLLCB0aGUgZGV2aWNlIGRvZXMgbm90IHJlc3BvbmQgb3IgY29udGludWUg
dGhlDQoJdHJhbnNmZXLigJRubyBmdXJ0aGVyIGRhdGEgaXMgc2VudCwgYW5kIHRoZSBlbmRwb2lu
dCBhcHBlYXJzIHRvIHN0YWxsDQoJd2l0aG91dCB0cmlnZ2VyaW5nIGFueSBjb21wbGV0aW9uIGNh
bGxiYWNrIG9yIGVycm9yLg0KDQpZb3UgbWVudGlvbmVkIGhvc3QgQUNLJ2VkIElOIGRhdGEsIHNv
IEkgYXNzdW1lIHlvdSBydW4gaW4gU3VwZXJTcGVlZCBhbmQNCmhhdmUgYSB1c2IgdHJhZmZpYyBh
bmFseXplciBhbmQgYWJsZSB0byBzZWUgdGhlc2UgcGFja2V0cy4gRGlkIHlvdSBzZWUNCnRoZSBo
b3N0IHJlcXVlc3RpbmcgZm9yIHRoZSBuZXh0IHNldCBvZiBkYXRhPyBNeSBzdXNwaWN0aW9uIGlz
IGl0IGRpZA0Kbm90LiBUaGVyZSdzIG5vIG1lbnRpb24gb2YgTlJEWSBvciBmbG93IGNvbnRyb2wg
aGVyZS4gSWYgdGhlIGRldmljZSBkaWQNCm5vdCBwcmVwYXJlIGVub3VnaCBUUkJzLCB5b3UnZCBz
ZWUgZmxvdyBjb250cm9sLg0KDQpDaGVjayB5b3VyIGhvc3QuDQoNCkJSLA0KVGhpbmg=

