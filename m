Return-Path: <linux-usb+bounces-31203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2FACA7113
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 11:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6F8634A9C2D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 08:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C4033970C;
	Fri,  5 Dec 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="QQLH4bNN";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="R3sUb0St"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EE338F38;
	Fri,  5 Dec 2025 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923303; cv=fail; b=F1VjNLJf3IwSXoNaZ0ScgHjtTa7eTDfMZEIED8kcJEe6sQXIolaUdWOyFtFS/tcgg6tQrk5kh7O8h0lZNsjBMh9PvKNcMwpsCqGg4Umf0UKrHNv/5wJJPYIdGtOPH7GffnJ4p7n3jH1dW3+PSVUq7rV4J4A5qY+kwvjWsQv6Y1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923303; c=relaxed/simple;
	bh=Fc7hJE48075QQQrhoox76K08qfmKrlAsNcPOFFxgNCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZKfw5wXjKDsJgKnJ4kpQ8vo/Wv1FzkVPdQxTc3GFa1iwg9cJgWDBan1qtRInvCnMa8yNs2juVtR+STYL74MpXjBhDJceE4DIpM4iXVJQEgr0CPjWbgcChTFDDFkTmekfuevYu5kDP1FPkysj8oo66+ILwdqmLrH+WvWaNDWnjys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=QQLH4bNN; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=R3sUb0St; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55xfid3901563;
	Fri, 5 Dec 2025 09:23:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	givrXWiZoYlJJfEYbelmDwtUnuLCyUnZldpqdig95U4=; b=QQLH4bNN+8joGZir
	r4tpGPyF49Ttk6KPul8ppRTJ7luzQt+oK5xHuGQ3MFDK2X8vAF+j1vD1WUW+ANSO
	fEq4TCcOKZ3fEcRtaE4Bbu3RMjytP6BFGffik6xbbdu1C+6qNeEVPBUPrjzsupbK
	q4w2lO3BM0eD6a/B46YE+ho2UrnJvBbXIZ9RkeviNj5CbsDcmn+3s2k7Sj1ixp7c
	YvgNFkWhQLWiIQOixHRf1qF6aVxliSJ0mNi1oBUtRNv+xPpHRvaOWeP7XOCACe9G
	0KCmOZjOerfw2kMTviBSTokUGkWIAwvMcZRSXKiIFQ6nzLW9oUjwKUyNszy9oaVC
	gwXxAw==
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11020091.outbound.protection.outlook.com [52.101.69.91])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4au55k12uj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 09:23:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llEcp8ATl4nMdzJMrwSqgzix6sm7rzkQrH29EtbIUZxZ8oPnf0LSnPnQp68HdOINXScYxEVCxfmuxrzjpGKrvRgCtUXuOiIXg58PGq/17D3qztgiyqH6KPe3uvxs2/RXq6HGY0RzhkQ2NwCU3W+PqaiCQN+VMnb7oetkGdI7B8Hq69Bzc9CQaBJuJt62a7YIsZ/11MsZFWWZ9TYC8XJyT9yG9eUXUKPd6mVpygdX5MUhO3IJkKiDXNnWcq2WWH8mxEWv3jQw0Xr0mq+R1YyOS43j8floM6gO7X+o/jZxgWfFAVrYyiZhEVYO0PGv1TrXYi04iOtyOaF5fmVv3pSzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=givrXWiZoYlJJfEYbelmDwtUnuLCyUnZldpqdig95U4=;
 b=tTmsj1w90p/Rq6P4momO0UYkPoIz7vlgnCvOv9rIR8JhzHdrJguQRhLC1Gdvxh2UoLTvzH+WLW/SI89geWVBX5Jwb4HZ86FQg/PKKtazCe/EdynXrz/U2Jm0lKrRRCIQVR7F1Qi6HRVLNHVPuaupwvrp8K9aosgDSpwh4wxlCgQ20E0lCS4d4wryquIIjjaLA2u1dqXRvG3Ix53D5eA6l1VrvnOHyP4XQYHP8UzZ6SXxCuQixQLXoakSNIx+zODFVIRwlZkGOppi9EFUpbz0o3uXGYOSLFijfGGTdCIE/hsZFKayKICgo8px0EkqrwCumYEsuQEv/5f8QTHluyY3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=givrXWiZoYlJJfEYbelmDwtUnuLCyUnZldpqdig95U4=;
 b=R3sUb0StS1usm1J8LgsHlS2p17mFP7kSctVbFjBnMlqlIlXRkJ/cnH5EWq4vfVurgX712jzLMGJb8iNAS7YVEUZ5cy8IneNh4xCi2ecvGaJ2wGrMQQbLzUkZ6sD5KtacTvu9AtYj9cThd3/DIMdmg1KT4990AWIZbmtpCLXMkm4=
Received: from BESP192MB2977.EURP192.PROD.OUTLOOK.COM (2603:10a6:b10:f1::14)
 by GV2P192MB2640.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 08:22:56 +0000
Received: from BESP192MB2977.EURP192.PROD.OUTLOOK.COM
 ([fe80::35d9:9fe3:96b3:88b5]) by BESP192MB2977.EURP192.PROD.OUTLOOK.COM
 ([fe80::35d9:9fe3:96b3:88b5%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 08:22:56 +0000
Date: Fri, 5 Dec 2025 09:22:50 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usb: Error while assigning device slot ID
Message-ID: <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
 <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVYP280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::27) To BESP192MB2977.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:b10:f1::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP192MB2977:EE_|GV2P192MB2640:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6761c9-c3a2-4bb3-3a22-08de33d77e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE11OTdYMHpzdGh5WmY1ZlUxUk56VnEybEpHWndkR3F6S1ZNdHdpcVFoWGJO?=
 =?utf-8?B?WkxsNjRzY3NQNmE1VzY2MHlBZU94WVpTdVJJUGhTUGRIWFdONmQyL1Boem42?=
 =?utf-8?B?SG42L0piRzlrUW5WZDdVMTY2aXRGc0RleUhlQ0dKak9YT2E1SkR6MEZGTDVW?=
 =?utf-8?B?TnFjUlJhUUw3aFZLaldYYm9kL0pLZzRWUzdlYVhNVWgrdW41MjlrcHRVVXpa?=
 =?utf-8?B?Wko0cGVpZUtUQWtYSWdNVjFtaURpWU5tVno2Ry9QOGNwSTZ1UXVVNGQyc1FT?=
 =?utf-8?B?TWJWVFo3cFNCYThzUkUrWXlsQnBLdlFMcE50MU5yTjk1M2k2N29Uek9pT0Q3?=
 =?utf-8?B?YXFneW8veFN4bXJXSUQwa3MyQWVCQlI3VWZORWZkOU1Gb3BnSGxYUmljdG5K?=
 =?utf-8?B?UVA1NHVSazBOWFFOcnQ0MkhXR2p2Vi95a1haSDFVZWUwRVkvcnQvdHpqeGtw?=
 =?utf-8?B?eXFsUG1VWXVqc29ZSlJ4YTNCZmIza1docTBIL3pPQmV2dmlMVy9aYlFnV2xJ?=
 =?utf-8?B?QUpxSktvNkZjOUJYeVk1NHc2bjFiNk1aZ3VuUFRuRklaTjB2Q0duVTh6VXdk?=
 =?utf-8?B?U0dhUVBZUllhTTNKWkRnVk0xdEFValB1YTk3SXdQSzRKUGtCTkFUN3RjdFhi?=
 =?utf-8?B?QXdndzBwRkZvNnBnMmxvYWFmT0RYZ0R4V1NqN21kWlh2cWtUY2d3b1dUejFt?=
 =?utf-8?B?VUxIWUlWMjYyalhBTnRQMGVpUFpLcVV3clFpamQxcGQ3aUdMa2tnaDJsRmd2?=
 =?utf-8?B?bVlYQU5KbWErL1FrNFhUNzMrMXp3eERzUHBHS2NSRTFhUlZSLyt3UXhTd2RM?=
 =?utf-8?B?QWx2eGlud0c3K0t5K0lacHhCakhXZ0hWYTNnVzdFeWN1WkRJNlhpcEs4VkRS?=
 =?utf-8?B?czhHdmQyYXdtalJucnpVa1BaTEZGcVhCN0dUaFNmY05rdTFXZFVpSkZxMnlD?=
 =?utf-8?B?MHM2RGpVY3ovM21kS3NHUTNrcHhQd1RIbnFKQjRsK1AyR3JSZXN1amg0L0xi?=
 =?utf-8?B?cFBuOVc3MnRrS2lmWXQ1Mk5tZFM3SFk2MGcvTEpHMHBuaHVTM3NIemlWQi85?=
 =?utf-8?B?dmc5bytoVEZzWnp0eDZOd2ZwaGJHSFlrVEdrN1QvOVJGSkNsTllqNHhzTnhl?=
 =?utf-8?B?QWRVd1pISnRSOFR1UmhGa056Z0tUY2h4T1hJeGtEQ25tYTVCenVDNGxuRWFW?=
 =?utf-8?B?M3VFa0hQdXlaT3gva3IvQjZkNHM3eFBNT1B3bDRkcmRNK0R4R0J6WEd0eHNo?=
 =?utf-8?B?YUNsSTFJcmxsY2FnM2NwdElvR3QxMUx3TDFaZDlSckhRcmxKKys4d3Z1ZGdJ?=
 =?utf-8?B?R2xmMDNWeU5HWGVGNE5kc1JPeU1RM2NzQzFYeEJqRnRmYWk3dHpKWHJCNkhq?=
 =?utf-8?B?M0tWeE40d0hDQ21JRDlzRFVjUW1yVUpqQnMwNGE5TkVCc1FlYzFNM0FCY1BM?=
 =?utf-8?B?ajArdU1pSzlkL3FTUEFmS3I3NmVqcllaZnR5YUZSYVJxd2xDbjcwU2RGRHdK?=
 =?utf-8?B?dktrTEQyK1pzTHM4aWdDd2hHSTZyWENuaE9qc2RqMlRDV2xFV1hQTm9HeXYy?=
 =?utf-8?B?R0prYytHSDR3OWsrZll2cXpmbWhSdnZIaThycFY0UFR5LzZqbHVjT0pMbXRQ?=
 =?utf-8?B?VCtmbVhURHFCSHhuQ21Jay9iUUNqb1JMV0JIcmpFb2F3cnZ5OTg5ck1LS0Y5?=
 =?utf-8?B?Um5IRVJlNXUyNVhxcEF5ZENndlB4eWJva2w1bTV1T0FYWVVaajJEUGd5MFlt?=
 =?utf-8?B?dTJobXdUSjJHY25iSXZiNHJXOVBqMkpIRGwwOXBCUnJoSjlxRXZ3SGd2UUFS?=
 =?utf-8?B?SHpqdTEyQmVMQ05CN0RSbEFiSW1LVEV3ZmhGVWlKRnllQVc2bzRsS3F1eU10?=
 =?utf-8?B?endRNk9QbTVSbkQ4N0Q4ZUVwV21EdkV3MytTU3V5RjhsSUZOS3IzQW5YcGRD?=
 =?utf-8?Q?UX2ID6sldnZxXq/PUHjw23XxMl8w+1kf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP192MB2977.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1oblJXTi9QUC9xaUZEdEdSK1QxUzhoU2N6bTJrcyt1M0lFL3VvUDFtV1lK?=
 =?utf-8?B?LzE2TjNIR3N2VDJHd2JMdUJNMFlsK1ZWVEU5R2QvTFI0K3d6NGIzOE1sbVRi?=
 =?utf-8?B?NFlJMVVjcURtSURkRFhOWEFxVy9iUGh4bjdJZk5ubmVFQ0haV0dXQVZSQTZN?=
 =?utf-8?B?Z2tIMXEwOXMvNHNxSlNTTkJOdUZmRjUwc1pnVmtFeGJvV3NMWE5rU2R1azhW?=
 =?utf-8?B?bXVnd3htMFMwM0c4N0Y4a1BjWTI4TGJmMVZYc2xJZngrOVpPVG1XbVYvbC9n?=
 =?utf-8?B?ZnRpQjd0eGtJTDh4MGxnQ2hVdFRjbEFYSU5ROFdkcXZoSUcrYWRaMVRUTVlx?=
 =?utf-8?B?aEFvQU5ueU40QUVmSmllNGhxcGZJaEQ2UXE4WUhkNk9hcGZNeWg0TlFhOGtW?=
 =?utf-8?B?SG81Q25nR2VpYlgwbkZlZ2JlVkJzRTAzOVgwd1dqNUpXQU50UU4rai9BT2hJ?=
 =?utf-8?B?ZzJuSkJDT0QvM2ZEeUFCSEwrRzZmM1p2dUltc3BmZkJoZG1VMExXbC9RcFJP?=
 =?utf-8?B?RkM1L0xIenRTMDBxUjNSc292ZWJhaGhRenZnWFlibzczV29NTENXZytMbDFW?=
 =?utf-8?B?M3BRTkw1aUp6WUZibmZjcExKU04xN3YrR0RMMTJhaGNqTmtTaGpWQzI4TSsy?=
 =?utf-8?B?WTRqbDJaMFVPMElLOG9ocU1BdmVTK1FTaFgvTDFZWnlJMUs0VTA0cEcyNFJS?=
 =?utf-8?B?OWpjMVpVdnBXa2d3c04wa0RHYzA4aEpjZi9WSitmcHhHaFV6S2VIbloyWGEy?=
 =?utf-8?B?OXdZdXpObnBDTzJSbFdwei9valloenRzaEFRQnhsMytMYTFYWkREWmVncC9n?=
 =?utf-8?B?R0Rac2x1VWM0VGhXNFVSYnpWRjNFSHZVTTRKN0RJU1JxekNrc3BOYWErL1Nv?=
 =?utf-8?B?TEh2aGFrZmlsc1hsSlFyalNlWDFvSlJPZXJybXdaeC8vdW9nWFR5NHo1cmt4?=
 =?utf-8?B?YytobEdrbVBoQ1ZPalMvMFJBOHpCTFRjcWM4cnl4VE9zQjZyaEZSZEVhUzg0?=
 =?utf-8?B?S1VZbVF4ajVIQ3pra0NtSzRwYjQyQnRYYkRxazRzb3F0Si9vS1g2dnpLRE1Z?=
 =?utf-8?B?b3lkTnY1SmR6cnJ5bHB2RXplOW52cWhSdm8ybjQ2bitQMm5yU1VzRk1yS2Jj?=
 =?utf-8?B?Q3M1ZStOV2NKaGovZjN5VS9mOE9xWVBZUlhYNEFTVzN4WndXeFhPTUJsYXhv?=
 =?utf-8?B?ZWpiT1cwWDFyTGtjSnp6UGhuT1IxZmJmbXpqWm5HU0hzTTlVQ0xIbTBJWkJ5?=
 =?utf-8?B?YnRLTVhuLzlaMnZWdWZrZTB2SmhSRzdkL3lQdXpwYTR0R1o0ckxWbVNhSHZF?=
 =?utf-8?B?R1J4bENldTh0dW5laW1Vb3VnQVZGQ3VlME5GZk1vL1Q2WDNKOXFMWDBHUzFI?=
 =?utf-8?B?d3hqUjlOZUdFbysvVEM0Y1NERGRCMGkrL3NIcHhkcGJPb3VkRjNNZ2tabDZL?=
 =?utf-8?B?RUd4MHVFTWVFVDVTekdoNGtkYkZKdmczTjFVNGYwUVVmb1dLUVV6QXp3UmtD?=
 =?utf-8?B?emx3L3FjWWR1SEVVT2pIWkZkQ0x4ZTJ6TzJJNUUrdDkvbmpLelVMbGpLMTV5?=
 =?utf-8?B?UXpkSW85YUkweThXdlBpbHQ4ZUtIRXMzR1lYbE5ta2NrYmY2SkRkYkc1NVNJ?=
 =?utf-8?B?RmljYm5mSkswR2VqRnltdUFBOUhQKzNPeXhQOTRhNFpYWkV6dXRrcmNyMmxl?=
 =?utf-8?B?WEhqVDg1RUk5N05CbU5OaS9kekZqOGw3Q2h0TTRZY29xUFkzRFM0bTI4Tnhw?=
 =?utf-8?B?VUQwTTJxWEdDMFpxS2FmTkwyeW1YbzdNak5jc21DQ1EyVVEvb3ZoOWxDT05R?=
 =?utf-8?B?bGxrZlB6MUpBbE82Vzd4TE1uOVNpTVJkVkVqNVBBS3hXclpzMnJBZGJYTTBP?=
 =?utf-8?B?NjI5Q09QaVhFWXBUNm1FcXphRnExcHgzZnJWUzl0STkwbjhiT0laUVpZMDUz?=
 =?utf-8?B?UXBOUmtxSDJyVjRrMDdOaDBEcVpVeGNJb1JsSVhZaDdkRUlWVEd0YjAvbnZu?=
 =?utf-8?B?OTVMby9rMHpTNWRDQkRlQVl2ZFVESWliQy9IUEZYQVFkb04yemFoVWticDVv?=
 =?utf-8?B?dlc1YkdZZ2tOVXpuL0d1RGllZ2I2M0tOdStLTmYrakpTRWpnalpQQnd2clRH?=
 =?utf-8?Q?xJXmGIhV+BUGeVEe9MepCZMDP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l4ZZe1qlQaY/Fc1zNQzMiyd/gldq1U1a2STOVN3XLIICmq/shwOF0k56t2GWU8cvJ9lk3VpcBewj6zZXnNnLAgOeYYfMwk468BLkaTG7pDLs4wGuWxgbJGTrSch1qezw9vZQBROeOtr2IwmisUDWm3qjlfRkoN5+cd45E1go04ZuB+nwW+zrD4XlcCmKTTj79p0gqxNG1gDz4nIOdcEFMNo9GHJP2OFeiHaPXUJory0FYpbzGaB3aHSnZadztR7BxIO7yccELePKWpxJz8/b0FBFWCMFlB8FR3J2sLFbp9wpcAA5q/grwnHCSL5ao1cRut81rDFFM2gJ+913xulD91VPwQ5nS1xfae5dmqW/P0zaKoUTNSvKhCwWL7JwJe2M26KdnyQg5rHbUW1NYziXOvclz28NqontLj2Ssc1kqavZTleCc7IQE+wMyvwENEktfA2sNPnQNAasqcz8y0gQGICO8U5FcX2PukUFrW9AfrKeoQ0YPLlVU921wsUMJMdfEKx0Tr7xAZHyb3uDbLMkj3WynF9FLRsyR0HsQUVlt/dKc94QVJzQhVISjB11U8RbWzoigC5h2AX2Qa+QSsJ28vNaXDptTZmMrRaypLizb2ZQRxEUTarOlpjVMxPb4rYG
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6761c9-c3a2-4bb3-3a22-08de33d77e1b
X-MS-Exchange-CrossTenant-AuthSource: BESP192MB2977.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:22:56.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqTpw2zHlgsqUoKP3aAL76BhLnkEkMHg1O5XXxei5+KN0+hFvxk/v3cRPKWVGhqRD5LfIv/wqOy8dZU7LHW00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB2640
X-MS-Exchange-CrossPremises-AuthSource: BESP192MB2977.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV2P192MB2640.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=N7Qk1m9B c=1 sm=1 tr=0 ts=69329665 cx=c_pps
 a=aCSaCga/D6ZaJx/7+0lQYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cZNsyZPweTezUDwC_a8A:9 a=I2BCduDH4JNDCL9X:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GUTsmoq0DeVK6XMtPerj_L8nC1HXYurK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA1NyBTYWx0ZWRfX2KKjEpwWb/DA
 56oFBef+aU3jb9KPJT7qKiBa5GR6Genc+Z/YBBr9fxLEkhEUAXiP9v25mPXpeZ5Rt1f400iETXC
 rGfqa3qv8epkkDwZueL/zIGFCZh9AazOsQmAouQ59PMvjHAvFF3CUH86qZd3nkDUu7vFVGIMOdc
 JYAUKF/x83oj6EORocL2mEvmhIabBTVAWtj5hIuSsNg+W1JcfyU7bhaDBG3btcUwSu8xBxwSgFL
 Zg1BT141eSe55Ey9aekOYZGYQlgryCLpVQopu8vS05cLLWyXJaNSGgZTvrQ+asKCrHrkr2RAEsO
 V9lDUbw4fDUmmTa3ONfTC6KWCNRE02ZsG3ieAruwHOIBSUZhu5lptwG38KEeDQpv5epog/pRteb
 piFnIv/FORAjrF8YsAC9eXWpPj7v+Q==
X-Proofpoint-GUID: GUTsmoq0DeVK6XMtPerj_L8nC1HXYurK

On Thu, Dec 04, 2025 at 05:35:14PM +0200, Mathias Nyman wrote:
> Hi
> 
> On 12/4/25 13:09, Alexander Wilhelm wrote:
> > Hello USB developers,
> > 
> > I’m using an NXP LS1046A SoC with the integrated DWC3 USB controller in
> > host mode. On Linux v5.5.167 my USB flash drive was detected and mountable.
> > After upgrading to Linux v6.6.110 the USB flash drive is no longer
> > recognized. If it is already plugged in during boot phase I get the
> > following errors:
> > 
> >      xhci-hcd xhci-hcd.2.auto: Error while assigning device slot ID: Command Aborted
> >      xhci-hcd xhci-hcd.2.auto: Max number of devices this xHCI host supports is 127
> > 
> > And here is the kernel debug output:
> > 
> >      user@host:~# cat /sys/kernel/debug/usb/xhci/xhci-hcd.3.auto/ports/port01/portsc
> >      Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake: WDE WOE
> > 
> > I’ve also found that the function `xhci_alloc_dev` shows the error message.
> > I printed the `command` member variables and see that the `status` is
> > `COMP_COMMAND_ABORTED` and `slot_id` remains `0`. I have already seen
> > similar error patterns in some forums, but the suggested solutions didn’t
> > help me. Between these releases Kconfig has changed significantly; I may be
> > missing a config option, but I haven’t found one. Does anyone else see this
> > error pattern? Or maybe someone has a hint for me on how to proceed?
> 
> Looks like "enable slot" commands times out,
> This is a simple internal xHCI command which shouldn't timeout
> 
> Could you enable xhci and usb core dynamic debug and share full dmesg after issue is seen.
> 
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> < Reproduce issue >
> Send output of dmesg

Hi Mathias,

Sure, here are the commands input and dmesg output:

    user@host:~# mount -t debugfs none /sys/kernel/debug
    user@host:~# echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
    user@host:~# echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
    user@host:~# modprobe xhci_plat_hcd

    xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
    xhci-hcd xhci-hcd.1.auto: // Halt the HC
    xhci-hcd xhci-hcd.1.auto: Resetting HCD
    xhci-hcd xhci-hcd.1.auto: // Reset the HC
    xhci-hcd xhci-hcd.1.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.1.auto: Reset complete
    xhci-hcd xhci-hcd.1.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.1.auto: Calling HCD init
    xhci-hcd xhci-hcd.1.auto: xhci_init
    xhci-hcd xhci-hcd.1.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.1.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.1.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.1.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.1.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.1.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.1.auto: // Device context base array address = 0x0x0000000089350000 (DMA), 00000000e2e8db2a (virt)
    xhci-hcd xhci-hcd.1.auto: Allocated command ring at 00000000fdbb10ea
    xhci-hcd xhci-hcd.1.auto: First segment DMA is 0x0x0000000089543000
    xhci-hcd xhci-hcd.1.auto: // Setting command ring address to 0x0000000089543001
    xhci-hcd xhci-hcd.1.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.1.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.1.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.1.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.1.auto: Ext Cap 000000008b11e6f3, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.1.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.1.auto: Ext Cap 000000005ba0d7f9, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.1.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.1.auto: Finished xhci_init
    xhci-hcd xhci-hcd.1.auto: Called HCD init
    xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.1.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.1.auto: irq 65, io mem 0x02f00000
    xhci-hcd xhci-hcd.1.auto: xhci_run
    xhci-hcd xhci-hcd.1.auto: ERST deq = 64'h910e6000
    xhci-hcd xhci-hcd.1.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
    xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.1.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.1.auto: Enable interrupts
    xhci-hcd xhci-hcd.1.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.1.auto: // Turn on HC, cmd = 0x5.
    usb usb1: default language 0x0409
    usb usb1: udev 1, busnum 1, minor = 0
    usb usb1: usb_probe_device
    usb usb1: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb1: adding 1-0:1.0 (config #1, interface 0)
    hub 1-0:1.0: usb_probe_interface
    hub 1-0:1.0: usb_probe_interface - got id
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    hub 1-0:1.0: standalone hub
    hub 1-0:1.0: individual port power switching
    hub 1-0:1.0: individual port over-current protection
    hub 1-0:1.0: Single TT
    hub 1-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 1-0:1.0: power on to power good time: 20ms
    hub 1-0:1.0: local power source is good
    hub 1-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.1.auto: set port power 1-1 ON, portsc: 0x2a0
    usb usb2: skipped 1 descriptor after endpoint
    usb usb2: default language 0x0409
    usb usb2: udev 1, busnum 2, minor = 128
    usb usb2: usb_probe_device
    usb usb2: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb2: adding 2-0:1.0 (config #1, interface 0)
    hub 2-0:1.0: usb_probe_interface
    hub 2-0:1.0: usb_probe_interface - got id
    hub 2-0:1.0: USB hub found
    hub 2-0:1.0: 1 port detected
    hub 2-0:1.0: standalone hub
    hub 2-0:1.0: individual port power switching
    hub 2-0:1.0: individual port over-current protection
    hub 2-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 2-0:1.0: power on to power good time: 100ms
    hub 2-0:1.0: local power source is good
    usb usb2-port1: peered to usb1-port1
    hub 2-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.1.auto: set port power 2-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 3
    xhci-hcd xhci-hcd.2.auto: // Halt the HC
    xhci-hcd xhci-hcd.2.auto: Resetting HCD
    xhci-hcd xhci-hcd.2.auto: // Reset the HC
    xhci-hcd xhci-hcd.2.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.2.auto: Reset complete
    xhci-hcd xhci-hcd.2.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.2.auto: Calling HCD init
    xhci-hcd xhci-hcd.2.auto: xhci_init
    xhci-hcd xhci-hcd.2.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.2.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.2.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.2.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.2.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.2.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.2.auto: // Device context base array address = 0x0x0000000092ff9000 (DMA), 00000000945ba908 (virt)
    xhci-hcd xhci-hcd.2.auto: Allocated command ring at 0000000078de58c1
    xhci-hcd xhci-hcd.2.auto: First segment DMA is 0x0x0000000091395000
    xhci-hcd xhci-hcd.2.auto: // Setting command ring address to 0x0000000091395001
    xhci-hcd xhci-hcd.2.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.2.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.2.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.2.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.2.auto: Ext Cap 00000000417a378f, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.2.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.2.auto: Ext Cap 0000000011643eb3, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.2.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.2.auto: Finished xhci_init
    xhci-hcd xhci-hcd.2.auto: Called HCD init
    xhci-hcd xhci-hcd.2.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.2.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.2.auto: irq 66, io mem 0x03000000
    xhci-hcd xhci-hcd.2.auto: xhci_run
    xhci-hcd xhci-hcd.2.auto: ERST deq = 64'h92f3b000
    xhci-hcd xhci-hcd.2.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 4
    xhci-hcd xhci-hcd.2.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.2.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.2.auto: Enable interrupts
    xhci-hcd xhci-hcd.2.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.2.auto: // Turn on HC, cmd = 0x5.
    usb usb3: default language 0x0409
    usb usb3: udev 1, busnum 3, minor = 256
    usb usb3: usb_probe_device
    usb usb3: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb3: adding 3-0:1.0 (config #1, interface 0)
    hub 3-0:1.0: usb_probe_interface
    hub 3-0:1.0: usb_probe_interface - got id
    hub 3-0:1.0: USB hub found
    hub 3-0:1.0: 1 port detected
    hub 3-0:1.0: standalone hub
    hub 3-0:1.0: individual port power switching
    hub 3-0:1.0: individual port over-current protection
    hub 3-0:1.0: Single TT
    hub 3-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 3-0:1.0: power on to power good time: 20ms
    hub 3-0:1.0: local power source is good
    hub 3-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.2.auto: set port power 3-1 ON, portsc: 0x2a0
    usb usb4: skipped 1 descriptor after endpoint
    usb usb4: default language 0x0409
    usb usb4: udev 1, busnum 4, minor = 384
    usb usb4: usb_probe_device
    usb usb4: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb4: adding 4-0:1.0 (config #1, interface 0)
    hub 4-0:1.0: usb_probe_interface
    hub 4-0:1.0: usb_probe_interface - got id
    hub 4-0:1.0: USB hub found
    hub 4-0:1.0: 1 port detected
    hub 4-0:1.0: standalone hub
    hub 4-0:1.0: individual port power switching
    hub 4-0:1.0: individual port over-current protection
    hub 4-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 4-0:1.0: power on to power good time: 100ms
    hub 4-0:1.0: local power source is good
    usb usb4-port1: peered to usb3-port1
    hub 4-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.2.auto: set port power 4-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.3.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.3.auto: new USB bus registered, assigned bus number 5
    xhci-hcd xhci-hcd.3.auto: // Halt the HC
    xhci-hcd xhci-hcd.3.auto: Resetting HCD
    xhci-hcd xhci-hcd.3.auto: // Reset the HC
    xhci-hcd xhci-hcd.3.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.3.auto: Reset complete
    xhci-hcd xhci-hcd.3.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.3.auto: Calling HCD init
    xhci-hcd xhci-hcd.3.auto: xhci_init
    xhci-hcd xhci-hcd.3.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.3.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.3.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.3.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.3.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.3.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.3.auto: // Device context base array address = 0x0x00000000896c1000 (DMA), 0000000054e1c87e (virt)
    xhci-hcd xhci-hcd.3.auto: Allocated command ring at 0000000019de94d9
    xhci-hcd xhci-hcd.3.auto: First segment DMA is 0x0x000000008933c000
    xhci-hcd xhci-hcd.3.auto: // Setting command ring address to 0x000000008933c001
    xhci-hcd xhci-hcd.3.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.3.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.3.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.3.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.3.auto: Ext Cap 0000000028e6630e, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.3.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.3.auto: Ext Cap 0000000038375136, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.3.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.3.auto: Finished xhci_init
    xhci-hcd xhci-hcd.3.auto: Called HCD init
    xhci-hcd xhci-hcd.3.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.3.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.3.auto: irq 67, io mem 0x03100000
    xhci-hcd xhci-hcd.3.auto: xhci_run
    xhci-hcd xhci-hcd.3.auto: ERST deq = 64'h931a6000
    xhci-hcd xhci-hcd.3.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.3.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.3.auto: new USB bus registered, assigned bus number 6
    xhci-hcd xhci-hcd.3.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.3.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.3.auto: Enable interrupts
    xhci-hcd xhci-hcd.3.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.3.auto: // Turn on HC, cmd = 0x5.
    usb usb5: default language 0x0409
    usb usb5: udev 1, busnum 5, minor = 512
    usb usb5: usb_probe_device
    usb usb5: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb5: adding 5-0:1.0 (config #1, interface 0)
    hub 5-0:1.0: usb_probe_interface
    hub 5-0:1.0: usb_probe_interface - got id
    hub 5-0:1.0: USB hub found
    hub 5-0:1.0: 1 port detected
    hub 5-0:1.0: standalone hub
    hub 5-0:1.0: individual port power switching
    hub 5-0:1.0: individual port over-current protection
    hub 5-0:1.0: Single TT
    hub 5-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 5-0:1.0: power on to power good time: 20ms
    hub 5-0:1.0: local power source is good
    hub 5-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.3.auto: set port power 5-1 ON, portsc: 0x206e1
    usb usb6: skipped 1 descriptor after endpoint
    usb usb6: default language 0x0409
    usb usb6: udev 1, busnum 6, minor = 640
    usb usb6: usb_probe_device
    usb usb6: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb6: adding 6-0:1.0 (config #1, interface 0)
    hub 6-0:1.0: usb_probe_interface
    hub 6-0:1.0: usb_probe_interface - got id
    hub 6-0:1.0: USB hub found
    hub 6-0:1.0: 1 port detected
    hub 6-0:1.0: standalone hub
    hub 6-0:1.0: individual port power switching
    hub 6-0:1.0: individual port over-current protection
    hub 6-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 6-0:1.0: power on to power good time: 100ms
    hub 6-0:1.0: local power source is good
    usb usb6-port1: peered to usb5-port1
    hub 6-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.3.auto: set port power 6-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x206e1, return 0x10101
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    usb usb5-port1: status 0101 change 0001
    xhci-hcd xhci-hcd.3.auto: clear port1 connect change, portsc: 0x6e1
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.1.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    xhci-hcd xhci-hcd.1.auto: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
    hub 2-0:1.0: hub_suspend
    usb usb2: bus auto-suspend, wakeup 1
    usb usb2: suspend raced with wakeup event
    usb usb2: usb auto-resume
    xhci-hcd xhci-hcd.2.auto: Get port status 4-1 read: 0x2a0, return 0x2a0
    hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.2.auto: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
    hub 4-0:1.0: hub_suspend
    usb usb4: bus auto-suspend, wakeup 1
    usb usb4: suspend raced with wakeup event
    usb usb4: usb auto-resume
    xhci-hcd xhci-hcd.3.auto: Get port status 6-1 read: 0x2a0, return 0x2a0
    hub 6-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.3.auto: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
    hub 6-0:1.0: hub_suspend
    usb usb6: bus auto-suspend, wakeup 1
    usb usb6: suspend raced with wakeup event
    usb usb6: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb1: usb auto-resume
    usb usb3: usb auto-resume
    hub 2-0:1.0: hub_resume
    hub 4-0:1.0: hub_resume
    hub 6-0:1.0: hub_resume
    hub 5-0:1.0: state 7 ports 1 chg 0002 evt 0000
    xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x6e1, return 0x101
    usb usb5-port1: status 0101, change 0000, 12 Mb/s
    xhci-hcd xhci-hcd.3.auto: // Ding dong!
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.3.auto: Get port status 6-1 read: 0x2a0, return 0x2a0
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 4-1 read: 0x2a0, return 0x2a0
    hub 6-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.1.auto: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
    hub 2-0:1.0: hub_suspend
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb2: bus auto-suspend, wakeup 1
    usb usb2: suspend raced with wakeup event
    usb usb2: usb auto-resume
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    xhci-hcd xhci-hcd.2.auto: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
    hub 4-0:1.0: hub_suspend
    usb usb4: bus auto-suspend, wakeup 1
    usb usb4: suspend raced with wakeup event
    usb usb4: usb auto-resume
    xhci-hcd xhci-hcd.3.auto: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
    hub 6-0:1.0: hub_suspend
    usb usb6: bus auto-suspend, wakeup 1
    usb usb6: suspend raced with wakeup event
    usb usb6: usb auto-resume
    hub 2-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 4-0:1.0: hub_resume
    hub 6-0:1.0: hub_resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    xhci-hcd xhci-hcd.1.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
    hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.2.auto: Get port status 4-1 read: 0x2a0, return 0x2a0
    xhci-hcd xhci-hcd.3.auto: Get port status 6-1 read: 0x2a0, return 0x2a0
    hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 6-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: usb auto-resume
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: usb auto-resume
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb1: usb auto-resume
    usb usb3: bus auto-suspend, wakeup 1
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: hub_suspend
    hub 1-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    usb usb1: usb auto-resume
    hub 3-0:1.0: hub_resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    usb usb1: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    usb usb1: suspend raced with wakeup event
    usb usb3: bus auto-suspend, wakeup 1
    usb usb1: usb auto-resume
    usb usb3: suspend raced with wakeup event
    usb usb3: usb auto-resume
    hub 1-0:1.0: hub_resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 1-0:1.0: hub_suspend
    hub 3-0:1.0: hub_suspend
    usb usb1: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.1.auto: xhci_hub_status_data: stopping usb1 port polling
    usb usb3: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.2.auto: xhci_hub_status_data: stopping usb3 port polling
    xhci-hcd xhci-hcd.1.auto: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
    hub 2-0:1.0: hub_suspend
    usb usb2: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.1.auto: xhci_hub_status_data: stopping usb2 port polling
    xhci-hcd xhci-hcd.2.auto: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
    xhci-hcd xhci-hcd.3.auto: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
    hub 6-0:1.0: hub_suspend
    usb usb6: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.3.auto: xhci_hub_status_data: stopping usb6 port polling
    hub 4-0:1.0: hub_suspend
    usb usb4: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.2.auto: xhci_hub_status_data: stopping usb4 port polling
    xhci-hcd xhci-hcd.3.auto: Command timeout, USBSTS: 0x00000000
    xhci-hcd xhci-hcd.3.auto: Command timeout
    xhci-hcd xhci-hcd.3.auto: Abort command ring
    xhci-hcd xhci-hcd.3.auto: No stop event for abort, ring start fail?
    xhci-hcd xhci-hcd.3.auto: Error while assigning device slot ID: Command Aborted
    xhci-hcd xhci-hcd.3.auto: Max number of devices this xHCI host supports is 127.
    usb usb5-port1: couldn't allocate usb_device
    xhci-hcd xhci-hcd.3.auto: Broken Port Enabled/Disabled, ignoring port disable request.
    hub 5-0:1.0: hub_suspend
    usb usb5: bus auto-suspend, wakeup 1
    xhci-hcd xhci-hcd.3.auto: xhci_hub_status_data: stopping usb5 port polling

> Reasons for command not completing could be xHC being stopped, not processing commands due
> to being suspended, or something preventing xchi interrupt, and driver misses the
> command completion event
> 
> Is runtime PM enabled fo xHCI in your DWC3 setup?
> It was enabled by default in 6.1 kernels for PCI based xhci 1.2 controllers.

I'm not sure. I found that PM Kconfig is enabled, but the errors also occur
if it's disabled, too. I didn't find any PM runtime configuration.

> Does your flash drive enumerate if you first force roothubs on, disabling runtime pm?
> echo on > /sys/bus/usb/devices/usb*/power/control

Here I tried the current kernel configuration with enabled PM:

    user@host:~# for i in $(seq 1 6); do echo on > /sys/bus/usb/devices/usb${i}/power/control; done

    usb usb1: usb auto-resume
    hub 1-0:1.0: hub_resume
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    usb usb2: usb auto-resume
    hub 2-0:1.0: hub_resume
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.1.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
    usb usb3: usb auto-resume
    hub 3-0:1.0: hub_resume
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
    usb usb4: usb auto-resume
    hub 4-0:1.0: hub_resume
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.2.auto: Get port status 4-1 read: 0x2a0, return 0x2a0
    hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0000
    usb usb5: usb auto-resume
    hub 5-0:1.0: hub_resume
    xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x2a0, return 0x100
    usb usb6: usb auto-resume
    hub 6-0:1.0: hub_resume
    hub 5-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.3.auto: Get port status 6-1 read: 0x2a0, return 0x2a0
    hub 6-0:1.0: state 7 ports 1 chg 0000 evt 0000

After inserting the USB flash drive, nothing happened. I'll try to disable
the PM completely and repeat the experiment. Until then I hope the logs
above can help to analyze the problem.


Best regards
Alexander Wilhelm

