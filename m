Return-Path: <linux-usb+bounces-17706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF609D1DF7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 03:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C11282A0C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 02:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725A9136345;
	Tue, 19 Nov 2024 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DfXUP6Yq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kWP8QQNM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MICzZbjs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB0E56A
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 02:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731982122; cv=fail; b=M7dz0ZygPYhkFpnwCG7TPqvZ1QmFu/QwP9z+478hobHLBJQG1bkUlBkwK0VPj7uzOHeisNCfwvxcejhzIim6fc4bpIlSLvfPUQEIEP9W9TcTMhPTrK8fUM6DCKvdx5VyLVTMtw6D1lyFsQ2Du5XZr/KgnnIh2shOqHVZIEqjoMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731982122; c=relaxed/simple;
	bh=ArCkV1t7BWIxpVQO8cwxGyeGV1I5iYVTwU7GlMMKXjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wkn+6xAiKGtpKGaM8BoO0bbpIKBYPfu7sMWa12pe9Vx2nFABZyWgUvwUVx3xZfnMsOfON3FQNSxqaPzW4fmO6Cp4uL19Xlf7gZljksMaceqJSyIQpRa0kPL2nNrWVmr0lxKUctDlAahjHv5yr80ViEVF1/OXFfOIs1D46xMDNho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DfXUP6Yq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kWP8QQNM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MICzZbjs reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIMlJUt031942;
	Mon, 18 Nov 2024 18:08:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ArCkV1t7BWIxpVQO8cwxGyeGV1I5iYVTwU7GlMMKXjQ=; b=
	DfXUP6YqYfItSTLC41VJqNgDlpNw1HT4DHuadf+aol9OCi2DL/4dZrtK2Zm1SDD5
	xaETmhqP6Pyz/xghPb8KIhoEElyToJXBWbYJ0ddm/jiucyviXB+3rblVd8q2uULC
	QxZ7fXVZs0ZjyOqDpz4IWRFfh189ckKxxA+LK2+6e04rTWXzWMCAKZjMKOHbaNlj
	TMpNaxFSsy7V0qUBVYiwNW/3ItMaRog3ak6Z4bKcEsh7ewrjV4kSy6OmIrO5cKbO
	YGYntAN6u4tHqz0Wcny2lcf2wAcgA7uzf2qlIjbVwJTOpS1s1xOe+EOGe/R2XkdD
	NyEbXunyEk1BtOL7xPyavg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 430ep90p40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1731982100; bh=ArCkV1t7BWIxpVQO8cwxGyeGV1I5iYVTwU7GlMMKXjQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kWP8QQNMix8vLj4YaN2YYT/AvUeIFL7R2G3EHk3JDzSEnnc1qjDQCI+GjyaqpAunc
	 TQA79p67iPelNLcm54DDukk72Sh4jO1VvyDnry7nAsVnxrD7xsu5Nk8VcInISb31vs
	 CR1ECr9aMZj6EeKQYlnEPhKt1zSITeSZ7qjoPldB1R/QCJhwHAVxDadnTGHLHtueq8
	 OwPFI3VdgySwdXJxfXAcvkprBHSBhNcY7zOS62OLOIEVOe1nky6sx4pjMidYkuaoHm
	 yquTLMwfermMGbX2TgJ49v9Jh7xxw6F1hn/NCD3bKO/ergznLjfZfI9Zk3Apjh5Glu
	 pxV1imBKsB0tg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 054D8403B9;
	Tue, 19 Nov 2024 02:08:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6CBD3A005C;
	Tue, 19 Nov 2024 02:08:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MICzZbjs;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2912B40453;
	Tue, 19 Nov 2024 02:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUTNazMseQc0N/sQvoJTEhHsogAxsCiFj7Mv3OvtutnPhqEf0AGPnsJJYCMek4KUHjAX27/3xrBJhlQ+g9GNXasPXpeb7PgZjsyppoMxLSPdMAaYZfXA6gC/uTQoyHRtkU0IZbW/jdSU3oY6kDcRgRguXwuPlq9cPltWHiDW2dn+dgeoemk2WgHh+esDth0V0aW4yuypSbbcuZBkiiZVAs/ePOCXAYI7v5k8NYlIlsrDrxPBLtyHstvhSMQ/xwCdXZYBcvQ2JcOb5sqYXC2ODuTBohq9W7vnhhvV55UF/0kKCxFAl1UszUICKONbmgc913w8JjBzGxO5UcnAa6CfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArCkV1t7BWIxpVQO8cwxGyeGV1I5iYVTwU7GlMMKXjQ=;
 b=oEPDpz8ZK64l5F6+sVY+9nz5X73QSpuvQDA4ZCSDovFEP4rJrMBx+OlcaMYw+QSUfl3kMy/nvvHyywENCpNT10501FNmfuDvhkUbakGwMgc2PWp9z9hthaf4LZ75tJWaDd8uDplX72KbEVlxiTRB1RSKTlLXsinrYTqb9guk3VS7D5ygPJ3Ty1XT0IF9pqwY+lnuPIvOpYDXfAn+dxWi577V1RZl63MAJpWdI2VwHNW4DNkoSpLCVPw5KRnspW6cP7UneUqxEQh/V8IeC2YDXSpPWmmriW+tF9NRERc++CcrHdKES+hgLM2stxE+7+PZCa4DVp+2hiUxcqqxxGwQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArCkV1t7BWIxpVQO8cwxGyeGV1I5iYVTwU7GlMMKXjQ=;
 b=MICzZbjsjVfcxa/YRCGqfmvNmLJps3Tcx4u0yV9ThSDjbciCJZIkYMzBVpO5ID4A+d66r59UBuZhtg7LMIQVe6+MFgirD8vSQuNFFwDHaen+wzaaRqwG+TzmjLezKkwHmlbOnstXKxqCwd+9sUGtnlnp1xm+NQvLC/r0RMlW2fI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 02:08:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 02:08:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "ricardo@marliere.net" <ricardo@marliere.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Documentation: usb: dwc3: add missing doc for sg
Thread-Topic: [PATCH] Documentation: usb: dwc3: add missing doc for sg
Thread-Index: AQHbOidM81KZZ2Uk/USh1nt2OI4MtLK923CA
Date: Tue, 19 Nov 2024 02:08:15 +0000
Message-ID: <20241119020807.cn7ugxnhbkqwrr2b@synopsys.com>
References: <20241119020345.30663-1-luis.hernandez093@gmail.com>
In-Reply-To: <20241119020345.30663-1-luis.hernandez093@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB9527:EE_
x-ms-office365-filtering-correlation-id: adcab1ff-6438-46ab-98d2-08dd083f0736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXc2V09QelJCOTUvS0NCMS9GeUUrTzBKZno2Q1lOUHZVdnhJZE9DSnd2eTA2?=
 =?utf-8?B?Uk5vN2QyYUpxaVRob0EzOTR6eE5zWEdIdjFQZlBLSFBsY1hiRHN2U1d0L200?=
 =?utf-8?B?WHoyT0kzQW5CckFBTnVPZjRYK0xxU2t1N2kyYmdTYnlRdG1wdG1vazFobXpF?=
 =?utf-8?B?VGpqeHlYUmVsSzVUbGJBSjV6S25SdXJ3ZGNJY0NTWWNmQkxWZE0wbHduK2FR?=
 =?utf-8?B?emVLMnBLbGF6OEZqWmxiYWFSbHlRTFA1THB1emt6MWtUMDFMV1hkZnhzeldI?=
 =?utf-8?B?ejZGclBTNDhMdkdQV0JPWElDL2ZKN2IxVVY0OEQ3a3pHczhNZlUrYnR0TW45?=
 =?utf-8?B?Um1OM0lnTUUyL2RvVjhmMXhTLzNCSjJjQXZMMHg4Y3IwcjRRVnVVdjZjeElu?=
 =?utf-8?B?bjBNQU1IUWVkNzEzdVZEMTJQNkZFVDFPWnFqSFNhT0dpWVBMeGx4RnpESGc3?=
 =?utf-8?B?TjdFakNTU0t0RlowRXZqMERsbENaelZoZUJ2Qk1nNStMd0RXT2NCcmxDZmdv?=
 =?utf-8?B?c0l4ZGFqR2ZzNlRBaFRTTVltcDhKQXZjTTR6UUo1b2tZcThCWXZyeEMvZ3Mx?=
 =?utf-8?B?NHZ2RDN1YXZ2b0o3SUZZRU0xTCtpL3BJZ1pnWmFlNXROUVZxRWs0bUI5cGNP?=
 =?utf-8?B?V2hrTGRyaXVSUXhaN0E0dVpwZVJIMTNnNE5jSWV4RE1kR0F2YVliTHU5QTA0?=
 =?utf-8?B?OCtheE1jRGtvOWdHZFF2cDA2a1dhUDhRYmJZdmsrdU9ESXFzTlNNSEovaHZX?=
 =?utf-8?B?cEpyL2pxRVM5SUkycEVmd1M4WlpCME04b1JjV1JqSkdTZFU3bFMwdlArOFZJ?=
 =?utf-8?B?Uk9NQWQva0VuR3JEejBRTzYzRllieGFic3lrZzVuZ250YnVhcmdSMm1YQnIw?=
 =?utf-8?B?THNyeHpQWlJDSCtWY3hCNWdmV2hyU1dYcUNhcVBaWDFEUFZxWWRvTlhTR0xv?=
 =?utf-8?B?OWlteko0TWlnaE1QWHY2N21BdlZLalN2a3NrZ0pzQS82Y00zODF4ZzZwMzFr?=
 =?utf-8?B?bG9VYUpISW0vUTE5RjBUV08vekh3VkNUSnNENUVsTFBsRjFqZW9IQ3FIVmwv?=
 =?utf-8?B?OGV3R0cyZDIzazVKNkRsaUVmb3JoWnJkcW1IellBZ0txRW9aVFZvY3U0NWRq?=
 =?utf-8?B?ak5oWXRFOWtNaGs1Z1J6MzFBYkd5VktaclE4aHhNWHAzejl2dnYxM3RxK0ZD?=
 =?utf-8?B?d25FY0NUVTJSRnY2dVIyZEtwdkRjUzByRGxGT2xxMFhtQjBoQmhXellhQWRk?=
 =?utf-8?B?UVlrOUhlRmVoU3dvTTUzMDRpWTd6WVFtbjB3TWpibVJQUlVjSFNhNnJzSnI5?=
 =?utf-8?B?djJHWGg5eHg5TEEwWElENGN4VHZidjFUUU1jNXNpNlFqTjhrRlRlV3QzYmgy?=
 =?utf-8?B?c1k3VUJJbURVaS8wdjV5Y2RWRlozQ0lFS1k3b3pKMm1LcUNuTW9GaDQvbXcz?=
 =?utf-8?B?ZmRzZWRCb05jMHc0bmtGamM5ZjN2bzZPbXBNalhiNERNMHlpMVRVK3RLQ3lj?=
 =?utf-8?B?SnBMTXdnZjBIQStjYklmWmljZzhwRU5IZTJJVEpsQ2RHeEpPZnR0S0FZZlBn?=
 =?utf-8?B?OFNVUmVuemVCd3kybWFXdVc2eGFLOXZhaHg2aVk1d2RTZXd0dlhXbkFEeU4r?=
 =?utf-8?B?aUpMWXQ0d0FwRWhSZXYrd3J6QXNoU2lOU1VVTUpqWlhHckJWa1JsZUJFZVBx?=
 =?utf-8?B?blRUdzZKS1k1UGxFT0pwUFBNclJhSnJLeVcwczd5WkMrWC9YYVpLTkp0VnpC?=
 =?utf-8?B?QW9nTnJzNVRUZDdFblg3QmhBMVVCd0VsdGxITjBiMjQzWU8xMndiRXpzckNU?=
 =?utf-8?Q?lHOa9lzDKmjNRDXrx6AsCkCJwNlZ3AnQNzCNc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXBuUGZTSlFOS2lxOGJ6S3ZSU1NNMmhUaWM2YjFPdE5UNmhMVlhrZ1prTzNa?=
 =?utf-8?B?TjFvdm56Tk40S1ZzYmt5aE9QU245ZER4Rk50R2I1Um1zQmt0a0lkYlNLQ3JR?=
 =?utf-8?B?SXFMaHc3RituZS9NaUU0amFaQXNlTGgvTlo2N1FzNjA1aDFSWUhMZkY3Y3o2?=
 =?utf-8?B?d01wY21nMzAvUUFOTFRUUkQ2bzF0bjA4aDBvcTN6VlF0WUVJaHZkNDFkTUVz?=
 =?utf-8?B?OFI4dlFBSGJaM1VVYy9VWTdTMTVaZlprSDZacmQ4RFVkUUhmTlNQaHNJeEdZ?=
 =?utf-8?B?a21kaWFPRXB0dVhnVGp4ZGJTWlJBMEhVVDBHUDlOSW9BRlFsTmphdWUralJq?=
 =?utf-8?B?ZWR3ZjY5dTQ5SGZoREJidW1DMXY2bDV3TlFPbGsxdWE1cjNyUUlTMmI3QlRR?=
 =?utf-8?B?TmF6R0w1YndHbktVSGRJVndRTDZrTlY2ZzBoek41V1JlY3lHcnlmOW9CQkU3?=
 =?utf-8?B?S3pQcVhidDhmUWkrR3J1MzdIWXgzTlE1SlJHSUdLM1lRcHpaNHNiTW1JRGMx?=
 =?utf-8?B?V3FOSWY4YW1ERVd5KzRLQ3FsWXNJRDVDSUl0NlNuWnM3azlnZ3g4ZDJzZmtw?=
 =?utf-8?B?dWo2dFIrN0pYMlpMRm1wWEhIREpNRGFTUUFlNWE2NUdjN0IzM2FFSHVwOWZH?=
 =?utf-8?B?LzlMSGtNVjd1enBuMExzZjZERjFmNVBWK09lVDJMYnpHOVNNUks3M1NFV3Q4?=
 =?utf-8?B?by94YWhQN2U4bTNVbzV0TFJhN0I4MTl3czNnZU91d3Q2WGhCeDRVK3NuZ2ZT?=
 =?utf-8?B?MDJiamF5MlFhUndDN1d1d0xXUE9BZDlWUE5Hd0lNYnZyWUtqWDhDUExpTG8y?=
 =?utf-8?B?S0hqaHo5MmpmV3oyN3JaYTVMZnFnYThyUzNma0VLSnJjeXU0SXBPTFdETldN?=
 =?utf-8?B?TDdhVExMTGw2VVBteFFyRnpjejh2dmlPamNnV1FFZllNTEJzU2RKbWFLYmZn?=
 =?utf-8?B?VUQzRGxtZndJWEpUUzErRXpBWHJPSWd4UUtlVFVxTHI5WDltRTB4dHhDWk5r?=
 =?utf-8?B?a0k2Nm5wQ2ptc3ZPRDBlU09aTEk0b2sxS0xVdlp4K0lWUjl2aW1rUWJYcWR2?=
 =?utf-8?B?WVRmZUlFTzFVRlo1eUs1ZnVKNXNuYWRPTmNoNFlCU2ZFZXlQdHNPY0pZSzRm?=
 =?utf-8?B?MmM3MzFJVmRnYjBMdWJPa2lqTEwwZTBpQ25UTUVGY3dLN1c0aWVFc2c3QU5u?=
 =?utf-8?B?aGY2bVlxYlhBMHVxeHBqdGZzTVQ1eGxhUENUaXBQcklHbVZGbldKL0dQSk1U?=
 =?utf-8?B?ckZycWtweUpyOVJyTFBydU45a05kNjJZTjB6dE5qL2dKR2F5cmpNNkxoaFBU?=
 =?utf-8?B?TG02K3RRM2h1TWtxTVRhYkpIR3JpNUNRMHh2ZnN4a1BiUUdxMENDVWYxVmND?=
 =?utf-8?B?MEVscW5EQXVZT0RLb3R1VW9veklrQVJ0RjNEVjFWdFI3QUp4c1N2eUs5S08v?=
 =?utf-8?B?ZXROcXI3MmV1bGg0VkFlVXEzbjA4b2JSSzE0SC9KSUZqOXUrb2RsdUdtMFZL?=
 =?utf-8?B?cElGaFJUamV3aGZTS2xnSm5SUU5NNVpLbHdtUkhDZm9rZlZsSURFREtPcHFO?=
 =?utf-8?B?eXhVSlp4YzBSUGFLazdYbG00cHpldjkySnZkNmk3UmRIYUdEQkQwUDhhQXZW?=
 =?utf-8?B?NU5UZkxXOHYyRjM1ajltV0ltUlcrM2lxV0pFR2pWU2pjR2dPVHJ2RC9jdWJC?=
 =?utf-8?B?ajVBck56SjNyMjVsR0xTZnVQUnNiYjRIMm5jR21VVFppRlVrQnZYWENOWnd6?=
 =?utf-8?B?b3QzeXBKKzVZcmV2Q3hpOXN5bGw0WEZXckx0N3BwNWJqb0lRMXd6WmhDdDNP?=
 =?utf-8?B?ZWhMQzhFVHJjc285RXdEb1dGb01laGZPdjJrK1YwQWQ4V0x3NHl2K3M2ODdJ?=
 =?utf-8?B?MW0rYW9Cc0N2WlNEK0Q1M1JHVFN3blVobVd5TTBHUGFhZmtvbU5vaWxaMjhk?=
 =?utf-8?B?ZGZtOGZzWGJjV1dHU2pRenVBSlpzWnJ5cWZFTmlwdVFoSkJMbWY5WWJ0TUJw?=
 =?utf-8?B?L1NOQVdMTUxOUUZWYmd0QTRVOW1EZE5Xa3dpMzBmSjhzU1RzWkcwUU5VQ09J?=
 =?utf-8?B?Unpjdjl0b2hXbWcxTzErLzh5bnlWS3JxSXM5NmFFRmVzUmMwU3RKYXZBWHd0?=
 =?utf-8?Q?DSB4u9LutHwwl4wNcvgo8iIQj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DA82C4DBD5BF8408EC35A4A745A2828@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YgWjgw5PqNgkSgAohqVxxDbgtz86GwstFutt9AH6hDWqi+RLQVxhslll2vwy5a5EXBN4e9Iig4VBx9rljvKuqLWZe9e34cWk1GrD+IH29MHRyc7FnP7YKIV9Ac3BCT37IqY409PXRHwsQGry2Y6cacFyz78AiN0jRvde9Ul0aKjsbrD+VF5PPXYECjx3aSfD51OKWWS5611/GyS/jxQJ/y2tGCyFzMM11BNMF75Q/zBYjM6WbSkBuOGdUAzrmEC22qdzABDrNd1uYDNpbFpWs8x/GvseNXsRtMFNYgfb7xDRq5baX2uWUgwu+N56pC3Ox60TEIN1uAeVtylr17xrZy6q1ChGkO0qV+sPx+KPuzKi/QehaZwVvneyLG6/RlniY8udxxdTQDRQlgM6mw5SUzilvzmz94EC3271h41bVRefTFPJuZwERkhLd6keRHImdOTDKpHgq0iJ2VcwrDlgddwmI9sm8pZAgGMI6ma0YN62fL2oebNab1e2mHQ1fqM56MH+06FpMEDKVMcqg2nCVM7cfOU7tOHLVc+nYwFI66zsH+vy8DdceVHXSLCTj3mJtrJhWgvfVZH6utHv2pg0NxIyjg4q9mT1vTyTTc4RHJ4A1IR0qmZ0d8jBf8MZ6xoGsnIUYOWmk1/Ge/LR5FzxvQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcab1ff-6438-46ab-98d2-08dd083f0736
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 02:08:15.2896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0c7EKCigAydHo55tviFZcjeMH/A+UKKFnQUBD8eufbFIi7/AInugTGfwVwa+HuuxKR1+wnn479e6F9B0+lxTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
X-Proofpoint-GUID: nCn2NgdxhOAN8EMLYfFqRs6Ec8iJ9NhD
X-Proofpoint-ORIG-GUID: nCn2NgdxhOAN8EMLYfFqRs6Ec8iJ9NhD
X-Authority-Analysis: v=2.4 cv=X/0AK3Te c=1 sm=1 tr=0 ts=673bf314 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=pGLkceISAAAA:8 a=3ojCTgfptZTvhyt9rNMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411190017

T24gTW9uLCBOb3YgMTgsIDIwMjQsIEx1aXMgRmVsaXBlIEhlcm5hbmRleiB3cm90ZToNCj4gVGhp
cyBwYXRjaCB1cGRhdGVzIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgZHdjM19yZXF1ZXN0IHN0
cnVjdCB0bw0KPiBkZXNjcmliZSB0aGUgcHVycG9zZSBvZiB0aGUgc2cgZmllbGQuIFRoaXMgZmll
bGQgaXMgYSBwb2ludGVyIHRvIGENCj4gc2NhdHRlci1nYXRoZXIgbGlzdCB1c2VkIGZvciBtYW5h
Z2luZyBtZW1vcnkgYnVmZmVycyBpbiBETUENCj4gb3BlcmF0aW9ucyBkdXJpbmcgVVNCIHRyYW5z
ZmVycy4NCj4gDQo+IC0gQWRkIGRlc2NyaXB0aW9uIGZvciAnc2cnIGluIHRoZSBkb2MgYmxvY2sg
Zm9yIGR3YzNfcmVxdWVzdA0KPiANCj4gVGhpcyBjaGFuZ2UgcmVzb2x2ZXMgYSBkb2N1bWVudGF0
aW9uIHdhcm5pbmcgcmVsYXRlZCB0byB0aGUgbWlzc2luZw0KPiBkZXNjcmlwdGlvbiBmb3IgdGhp
cyBmaWVsZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1aXMgRmVsaXBlIEhlcm5hbmRleiA8bHVp
cy5oZXJuYW5kZXowOTNAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
DQo+IGluZGV4IGVlNzM3ODkzMjZiYy4uYTUzZTZlMTRmMjdkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBA
QCAtOTQxLDYgKzk0MSw3IEBAIHN0cnVjdCBkd2MzX2h3cGFyYW1zIHsNCj4gICAqIEByZXF1ZXN0
OiBzdHJ1Y3QgdXNiX3JlcXVlc3QgdG8gYmUgdHJhbnNmZXJyZWQNCj4gICAqIEBsaXN0OiBhIGxp
c3RfaGVhZCB1c2VkIGZvciByZXF1ZXN0IHF1ZXVlaW5nDQo+ICAgKiBAZGVwOiBzdHJ1Y3QgZHdj
M19lcCBvd25pbmcgdGhpcyByZXF1ZXN0DQo+ICsgKiBAc2c6IHBvaW50ZXIgdG8gdGhlIHNnIGZv
ciB0aGlzIHJlcXVlc3QNCj4gICAqIEBzdGFydF9zZzogcG9pbnRlciB0byB0aGUgc2cgd2hpY2gg
c2hvdWxkIGJlIHF1ZXVlZCBuZXh0DQo+ICAgKiBAbnVtX3BlbmRpbmdfc2dzOiBjb3VudGVyIHRv
IHBlbmRpbmcgc2dzDQo+ICAgKiBAcmVtYWluaW5nOiBhbW91bnQgb2YgZGF0YSByZW1haW5pbmcN
Cj4gLS0gDQo+IDIuNDcuMA0KPiANCg0KTm8sIHlvdSBzaG91bGQgcmVtb3ZlIHRoZSBzZyBtZW1i
ZXIsIGFuZCBub3QgcHV0dGluZyBiYWNrIHRoZQ0KZGVzY3JpcHRpb24uIEl0J3Mgbm8gbG9uZ2Vy
IGluIHVzZS4gSSBmb3Jnb3QgdG8gcmVtb3ZlIGl0IGluIG15IHBhdGNoDQpmb3Igc29tZSByZWFz
b24uDQoNCkJSLA0KVGhpbmg=

