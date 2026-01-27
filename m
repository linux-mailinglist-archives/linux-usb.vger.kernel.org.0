Return-Path: <linux-usb+bounces-32763-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB63NAcleGl7oQEAu9opvQ
	(envelope-from <linux-usb+bounces-32763-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:37:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E58F11B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D2A13007489
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70942299928;
	Tue, 27 Jan 2026 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dBWq+esW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fU90hOZW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GwAF3Szu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6F78F39;
	Tue, 27 Jan 2026 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481474; cv=fail; b=VqVMQbUBS6JrX80Qa8cWv8S/I+pyq6VKmYa+SUG7FUJX7JfhD+s6RuIEd7i7R9gyI+5WZF+EhqEgECNTsf03o6UoCdL/SueIcD5cHDfyV07z0SQCVcsCXfl1UYn3ILpE0PS8OBlRcgQc2Y7ckX99C7UJMMG2o+a/ZMen9DaK8q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481474; c=relaxed/simple;
	bh=cZ0xy7AaR14OyHyilUQLtoZtcgb2Gy9xBx9Nf4BRtlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B2BwGhYrs+M0vmNjWMSoGoO3KZHcD5nay6halAvrbNbrCVkWWOjBRufWnsccYKabwHYwYG2BfU/X3cGWqUcYIjyD5nkunuhN5ps8iAIbs9wW8unUOT9gmeFRZkHZaBa/JJOwBmngrlgC+LT/MT3pEyU853fDCfjjLrAv3XVibcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dBWq+esW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fU90hOZW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GwAF3Szu reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QLsPHB1919720;
	Mon, 26 Jan 2026 18:37:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=cZ0xy7AaR14OyHyilUQLtoZtcgb2Gy9xBx9Nf4BRtlQ=; b=
	dBWq+esWrJNvQpm197rt4QVYDcnnP6gfGNAO84JN2PnetRlW8eZyvacZdXLJy06S
	Fk3h6mXFZRtBm8PIjBpiBM10EEbCmegyibvQ6MRB2MqzEYi0zriZfKEUus7WpEKO
	Fy7C11APGKhifktslpcsDN7i17amgx84QvFrLgrO8bscQ6wfR0+X6h6xcDkxFyoT
	0UQr/u8XmQRumizy/rwR9QGFD5p+q1thsI2/6ostl3xFs03VisSN81Fs4v9hNDhN
	lyQnqNMDNnkCNc2UEuzgYrLF88GgfyMaxYgkGzEfs+G7hXRcp0NB5KMz6CJfAeDK
	t7d16b04ntRKZvwf1X0RTg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bvwvx96j7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 18:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1769481461; bh=cZ0xy7AaR14OyHyilUQLtoZtcgb2Gy9xBx9Nf4BRtlQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fU90hOZW61NAYL6m01QyNwaRzD1gS/MupVuWyHgkckG0d9bEneafdJ3NA04jTsUkC
	 0lSBzl11XWH91wLEOEdph+OEKMpZDEFoHq6InBpEfQXWa5lT4/p27z4xmG9zPDZBya
	 xO3noarcByZM46hFhYsgDc0H6p4cChIKa3WkyFDpVKl5Mj7z2kUKZOuVUMCNtJRIxT
	 IXTG3NKlOrGRAeGl5goq0cPEggd4UBoIg3uIN77/RhtNzWoMvpSQdG0BPdYGAOGszO
	 8wXQEjpwpDIlJCgj1jOQ6aTyRxTSmH7qfSRyyfN0ww4qu0/ecL6xGNCrNcdTFYUMfy
	 LYo8wnuoeWNHg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8504740467;
	Tue, 27 Jan 2026 02:37:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EAA2EA006D;
	Tue, 27 Jan 2026 02:37:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GwAF3Szu;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 19CF140543;
	Tue, 27 Jan 2026 02:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeiV71BXUMJRC6k5eUnQ4eOjjZhIofyXoXvzyn5marqmBUFeKSSeP0J/eLQ+LaLdI7FqALRktvTwB7bq4vnBVFOGFvmHZFlhusel0jUJAG6LV5xDkobveypw7rALd/n9MCNiKLW0Ejt9VpZyXCZwAeCdO+i7kMhXk3OkIYb66339I2Rh1l86kZKsoD/FOzg+f2Lj+V9E+wx498RBXTNH2IpqkrrpeYfBz/yIqOq/e0IgdsupYk/5lWoO4+6sbNOccil01skf+aVFm6YcY8+Txwv+TapzF+zAN5HOUVcmmMRS9KSObIfccJtENCV5Jqi84DN8z/Tf92KzvR3Z6Whssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ0xy7AaR14OyHyilUQLtoZtcgb2Gy9xBx9Nf4BRtlQ=;
 b=qA8WMF7Qb5+rU61V8k+HDdkUxZ3u8GAKAu8MqhGKbdlWfZd4Tm1LuMrCfcKsDtk91ZRN/WYp3hx5CLfH70Ojqu+BEw09r+WXukV2oQVjT/hmwEfdgRVB3+sMz3eQrU91QYHwxWg1QJwyh5AIExbqAw6PloN5qyiARNZvMLjOKCk5ygNKhCctHeY3jQn7HrxmAvDOf22g0hLV3iTidydK5kv2ZwTpo7bsxBuml3hvB/4mAqMO47Hv9YmvpWdPLvx5YmJ9HcI63mtH5h4hTmCFJ2HoydDSsA0V1DH2xXwreOEjST8cQw3XX4MhjL+NDG+2SLSXj9CuO0CEQrYurSdxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ0xy7AaR14OyHyilUQLtoZtcgb2Gy9xBx9Nf4BRtlQ=;
 b=GwAF3SzuFQfDlwU5Lr6VgFNac3SMei0+3yLpcaW8h6gW11V9OKzYnhTtjd69qGjK7bTSbcwurisL7M9i6/wuYjsa+WpOXt1s40FzD5YxK/EG7hz0qMxuJMf+htErjB6bZjKYM9W8RaTVNE1Blaipt2bmIoM3HIQk2GCqlwP17CQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 02:37:30 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 02:37:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v6] usb: dwc3: Log dwc3 address in traces
Thread-Index: AQHci4zmvleWp2FuLUGhyuiAjF8287VlVIyA
Date: Tue, 27 Jan 2026 02:37:30 +0000
Message-ID: <20260127023705.socfec5rijvqh7qh@synopsys.com>
References: <20260122105000.4126769-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260122105000.4126769-1-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW6PR12MB9017:EE_
x-ms-office365-filtering-correlation-id: 24394971-9cce-4d26-25ba-08de5d4d0474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjBkNEhYdkdteWJib0Z1UVNaQnhLUEZTeUdHTE5vVUZ5VFE3cGtuYkVUaHFU?=
 =?utf-8?B?NTQ1eFFiam1YWndwZzZZUGRGajkvMVJUZm80b016TFp3VEUwamUzTjA2Tmk2?=
 =?utf-8?B?eUtaSHhQdUZtS2lVRVYzV3FOVW1pamNzM2RNbEdpTkN0aWhmVjVuSDRMMjAv?=
 =?utf-8?B?OWR0aXJnblNJU3EwOVE1UndSYm5GUmk2cW5sWGhvcFRUdTZYbUhCdDMvWDli?=
 =?utf-8?B?U3pMeTF1cXhIc29qSzVJSS9tUE1WL0dCNFlYYWJMVlJweEhYZFZZZ09nTnFJ?=
 =?utf-8?B?Vk9ma3pGMkFaT3FCSy9idFRVWDVld2V0aDBYczRuSmV1alQ3eFg5N3RqNkpI?=
 =?utf-8?B?TU5ER2RXL0Q3Z3ZRMDNnWWtpa0srVll2b0ttRUR0V0RrMEowVHU1WUFodXA3?=
 =?utf-8?B?bTY0MFdrd01YR0pOUkJFclFXV2hKUDQ5eG9peHorRUtjSCtjOUxGV3pvaGo0?=
 =?utf-8?B?SFhmemx3bjdZdExTSUtBK1ZNektpc01Xa3U3K1ZmNnBRR21PTVpIOFcwWHhW?=
 =?utf-8?B?S1N2RG1ZWlI3MHdxbnN2VlRVVzc4ekI4YVcxM256dGl3MExkMDBlTWYwcUVI?=
 =?utf-8?B?eUI3NXdTNXRuWmIrd1BsQjU3UDUydUdFOW5FV29yNmNRZnIza2pvemR4d0hu?=
 =?utf-8?B?UTlEZzV3MGhUWWxTdjM3NWVIUll3ZGdvQkoxWE5vWENkY05sbWYrYXFaai9O?=
 =?utf-8?B?UlNvaVBwU25nTXRUN3JFQ2pFMzl1YmNrREtieThYOW9JMCs2RUh3ZUpUcVlJ?=
 =?utf-8?B?emdkRE5CQ293V3hmVFV0QU9zL1BCWFZFWEwwSko3ODVkdStHYXcrZzBPSkpy?=
 =?utf-8?B?czFpdGFiZnpLUUhUeWhteWlibTk1aDNJV0NEVGhmTUJKNC9rYkRRRWovM1hQ?=
 =?utf-8?B?dEhtWGd4RVBtYS9aU203WjlXbVdCZVhmZFdWMWpxWU5EZzVtcUxDZUZ2VVM2?=
 =?utf-8?B?TVlhOUxVWHV0R1YvV3dKa3dtRDI0TjE0NDRZZ09WVmg3aVpEUTAvM0ZuS2x6?=
 =?utf-8?B?UjdFdFhwdEdlSmFrNzhHUTlKMHlubUxSSWZ6dnc0U1EyUFdaK1U1elNXQTNT?=
 =?utf-8?B?VjY5NC9VbzhEWjQ5OG5rRkk1d1lVY3VQYTUrK0EwQk5DZFI0b0JqK3d1akNr?=
 =?utf-8?B?NFg4NTdOaEdYMnIrYkM1Z1kxWkpUY0tXRVM5TmdwaEV1TXJ3ZGRzMzZ0aXJl?=
 =?utf-8?B?RFB0aU5TNWE4R1lNa2VWVFpIZDF4WHpzZVRCM0lMYTFRV2lCZ1pTbWFuM01M?=
 =?utf-8?B?TnpPMU1TZW9xaENsWjA3UzdpUUUwbThqMUJjcUR5K25ERWJkcFQ2TkxDMllP?=
 =?utf-8?B?SDViV0MwMVJBSUZHMVFhblFiKzdORHhiVllCN2xpYlBJbVIzc044K0Y5V0FP?=
 =?utf-8?B?NFhpZ3FDdExEdEZyZHhoNmNEaUNXZGJUbDBHUWtWVE9KSFVkd3ozSDB3anE1?=
 =?utf-8?B?UHg1bVpDdm9vb05Vb1J5am54enVFYWt5WVlOL3NNcksxMUtHMDhRd09UdTVO?=
 =?utf-8?B?VHg1NnN4WHVMV0xSTnQ5cHBscUo1T0NnMkRjZVlLT0diV1ppbzN4VDdFVDk4?=
 =?utf-8?B?aHk5bHQxM21NaGs1VFdLWFpuU0VnM2prWEhwMFNBTjF3SUN0UWZlUHZUdW93?=
 =?utf-8?B?YmJEUFRJTk1zSllFeS9GeUpWbm1XdzQ2Y0NCVmdXenBNaCtmalBHQ3ZEM1pW?=
 =?utf-8?B?cGl1eXlLNDdaU0UwaWtxUXNML2piK2tQZmRRZlF3Qk8ra2dLWHc5TVBoUTEx?=
 =?utf-8?B?elo1R2FYSnh4OUNwMVRNQjgwWTdDRVhuZklJd3JZWWljZHRiNmdtSHhVcDdJ?=
 =?utf-8?B?ckNydldJMjRUNG1oeTBvODhYVzU0dmRxckR3bEc2S3pVTG1sM3pHQTRKNlc3?=
 =?utf-8?B?ZzVvbDBnY1NKbFZaYTl5WWxTOXViVlpOTVZLZ1lZaCtHSXNNK3BqeEZaRTdF?=
 =?utf-8?B?MTl4eTU2RlRHMm1DdUhtYnFDZGlvc2o0L3c3ak1qWUJYT2N4eTViM1E5RW5p?=
 =?utf-8?B?VVJjNk5TMlZTNllBTXJwV3RVRGxNSHZuamJSVTlWV1ZuSFdFdkFNUVFBcFpZ?=
 =?utf-8?B?WTh3YWVSbmJ2aUg3YmF0eDBaS3p6enQwcHdOVU5OYjRHbEFFeGJCbHJVTldl?=
 =?utf-8?B?dGQ1V3FoUlZEV3grbEFzanMvVUFidDUzYU0rYlFtaUdvcjZNSXlXaDVYN3ZK?=
 =?utf-8?Q?wr8Uj9aPIryEDz7exaDwb+w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzBVdUlnYk91ZG1Pb0c1eHhUNEJUT1lpd1hzcU1OeVVmRVMvelpINU44SW5r?=
 =?utf-8?B?N09NN0RHY3BZLzlvSkI1QkwvaVVPTTNvNkw0bHFqUXJEeU54ODcrVWtPMUdP?=
 =?utf-8?B?NEtuNVFPcjN3eHQ4UEtFRkZqQUxQSTUySVQ5eU0wcHhYMGxiaEpQd1BEOCt6?=
 =?utf-8?B?U2Vnd2laaEdGaE1ZdWJhRlMvcDYzTzh2L1MrWTVpZDMySkRHV3d1SDNSN21H?=
 =?utf-8?B?d0lBbitPT3NYSUNoMlpxNUFGSWYyYnNUQVZYTFBha0c3RHRtK2pQVUpQdHB4?=
 =?utf-8?B?QnJFQ2lMWTlDOWRwaERUZ1pFZi9nanQ2ekJoZDcyYmc4Q1d6V0FJdS96Nk9T?=
 =?utf-8?B?cDBDQlZ3Q3lTTi9HcWNrVlVEblJYTkZjOXhSLzROdHQyMGZXRHVXUW9ZWUtm?=
 =?utf-8?B?bmM5Si96RE0wLzZoTktGRWVZOVVwRE1LeTVseXVHZ1d1YjJ6MXR2NkRSQURy?=
 =?utf-8?B?YlBHckQ5eG5iMC95R20zbklUSGZHZlVnQ0FkUFB4MFdpQ2IzYUg3U1l5d3Jl?=
 =?utf-8?B?Z2NrK21wdEorWVpTcWNMVTVLNXltZkU3S3B3bjFTU3k4R2xobmZ4S1hPRmdV?=
 =?utf-8?B?V29OL21VeUgzYXd0VC9OTTJoQzB1NUF6NHVUeUZoQlBWTVNUdlZIUlBIWlE0?=
 =?utf-8?B?N1NWMHdWcjViYWtjZkY0SjlNNlQ0bXZDd2hJd0FpT1Q0TVdMbGdycDFrYTNH?=
 =?utf-8?B?Zm1WYUkyZ1kzcWNSeWJpVWYxTURnT0M0TXM0SG5zVjFqalRJY0hBZDFYMk9u?=
 =?utf-8?B?WFBPMVJ4dFdZb0I5RWY2NUZCYmltVmlJTkM4bC9JZ2p4NGRlTmM3Qm9MQ09O?=
 =?utf-8?B?L3R4bWJwVWVETkExMmJXMlBYZDZZV1VHQWRrSU03S241eU1BQ3pQa0xTYUJs?=
 =?utf-8?B?ZER4TmFrOFV3SnlGWE8wRGVwekVteUpTaXg1MTluMlYra0tJUlNBengvay9j?=
 =?utf-8?B?bzZSd1VzU2lNZ1h2L1ZscXgrMnd1Sy9hc0NuSk9WNlYyYTV6WkQyaGorSm4v?=
 =?utf-8?B?My90eHFwZUVZVUluUVY5U2MyTmRIMk1JN3Iya1IweUlueXRHTzBYYzhhaFVM?=
 =?utf-8?B?d3JKbDkxU0duZHpJaG5NVWpIRW9NOEUrZm1vYlp3WUFYOS9XTFJ2YmpXekpC?=
 =?utf-8?B?SlZSWkR1L2hVaUNtU2ZIVzUyWFhwOGlkQThqaSs2WWVhamJLcXlXVWgxRTR3?=
 =?utf-8?B?aWMxMGRVd2xLTk4zMzhVVnM4VWdNd2l6NmVxclpIQ1IrdDhjeGVON2NKWVBm?=
 =?utf-8?B?eUdYRXFrc2lGSGh4Mi9PQkxWdDlPNXF5eVdxVlRtYmVrUnFPNGpQUmRnL3Zk?=
 =?utf-8?B?ekcwWDFYUWZvalhlRTg3TnpCaXNUdjlpTWZkK1dIV2U3Qnc1cGRqQTlXZ3BK?=
 =?utf-8?B?elZkYWMvTDIyaE1pNGJnK3c5VGF2dmFwa2EvekZpaldoc2pVSU8ydkhLZEw1?=
 =?utf-8?B?d1gyZUtIemVZTW5CWDBBYk5KOUU3SXdDRkRMbnQ2eXg2QjhyZW1NaVRHUWti?=
 =?utf-8?B?Z0w3MW1Va3MwK1VHaEFpSXdJR2RBVWJZQm1Cd1c5U3BlVk1KWE9IaitvTUJX?=
 =?utf-8?B?TGtISVNQanVxaGdRSkVRcUw2NVFNbk9MbnkzRkhFOWtVQXlJN0FqTXlsZ0ZF?=
 =?utf-8?B?bXFvWG8vZmZwSVBQYThDd0wvT1JSbG51NytGZTYzcnB5MHFUUUppVjBrNkth?=
 =?utf-8?B?Sldnelg0OTRHSmxNWWFOcG9sQ2dzSnRaRytkYzlTNHA0S2M3Ky9kU3BWMWdy?=
 =?utf-8?B?RWRZUG5LZ1dtc0U2MEM4ZEU0RE1QbWtPZXROUU1qeG8xeEg2Y1JpN2UrN1RO?=
 =?utf-8?B?dGJCa1l5VVJWUjRFVWlyNVpvMDNRTjRkY3dtTndiSnJibUhuYXNsQjAyT2V0?=
 =?utf-8?B?aEhqZUxhaytGYTV4R1VCSXRmS1phR2lWZWtzQ2s3eXNjZzNiR2FoZzJnY3ph?=
 =?utf-8?B?NW1wNXJEaVhMVTE4T0JGY2o4T2JsREVpbzlDVHVZQi9wUkZRRk9Fd05SaTlM?=
 =?utf-8?B?TTRhdDhlSjdhWTNveHdzd2ZidmN6SklHRjNXV0RGa1FSeGd4UHhGVDVCbWtt?=
 =?utf-8?B?VjhNYlRRZDU1RjVqOXBiMGRURFllRnVvTllqWEQrV1ZQU21pSlZ3eEVhMVRE?=
 =?utf-8?B?V05MN3VFaGhnSGxmU2MxVm5SdUJ0UGh0TUZHcUpxM0tBeXBXNHpDSFVuRlB1?=
 =?utf-8?B?Um5JaU5kSFpvV0ZZa0VTNmtIY0s4TWpSaDNXYmtSTWxhWUIycllOTFAxQm92?=
 =?utf-8?B?ZzJ1ZnZUSHVKV1ZZSDdsUzBjd0QzcFNNRW9vTFFoU1c0T08xUURFL3lEdGNy?=
 =?utf-8?B?amt1L0c1dUt2MkFDY21MakxWenFublFJOGRBWDNoSXJ4OTU2UGt2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A44147563609234FA4DA1784F184D3A6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fs/nTkjMYIuGxqVrJrpBFzMzdz8HXcHMg3d1Sfuzyiuf0mTmOYaMfnRCRWyNeaeUfGBgpMiSYToyU66pl/OrPI0+rppRoUdL/1KtTiXeC5+/jd1J99JDHlHnVll6yEJbXtGOCoOgo94CctiwK+6SCL3JCdx9iV9Qklbi9Ma6WPD6+wJIz+Bd+vH5W2A5aHmYAgQ79T1vR9RIYjmFFoCdttqDeEkZDjvHDGjl0K1PPcX34JY2Z9JQerrhYpSFjBzIAC6t0VHpjgg3j4cNte8RXg6mAve7XeCzO6t4oYBrrWcOLPcecIsiQMLh8ppZmSy9p4xTi1LyF4q0DyIaPeNHQtdWd3n4BABKn9Zamx3ecqPWp6FVhXcOkX1nk9z1TrwUlG40JAt1v13gbdOvsT1u+omWdA3ikeMsLl9e6cC1kVSa5o/GaXgy6B8Fi2RrvmreYSwVnglsvpuwMyfr5vy2Kh1Hg2T56IBm8oO6r1mB6BzmI4jwSgG5+12DftdwUhIW6/eodbss+hHEIhJ1br3H0Nib9WGuFnnB72zlJdYS8GiPloY1vC8TG6PFIvCinRHYGXQNoGI/uM1Bf6HU9P2jGCdaEGNiceECv4j3wIhhHtEGQlI10cQYWypePjshorU0JlglaJdyzRwmuzsK3e9L2g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24394971-9cce-4d26-25ba-08de5d4d0474
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 02:37:30.1626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4I4/rDxmmASUh99S404jicwn/NlWqBLq9oRRbAoxMUs/0i+gNNFjirC11fTIGr7TecsbnF2I3cekhawCi8Zwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017
X-Proofpoint-ORIG-GUID: N54GSYRlarj5eJ79BxgpoVD-O0IzcPZm
X-Proofpoint-GUID: N54GSYRlarj5eJ79BxgpoVD-O0IzcPZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMCBTYWx0ZWRfX/h9pAVuyPoGZ
 cbs7W1Wq5xNMX+MFSkymeoWcb7yYfHHuDONR9uoGh3lsqXPSgaMrM4BIZxZGLHCnxlu31GxpDok
 aVyDn9qaeek/t3/fhyj+R3ZC9CPsXgXI5sn4nTi0NwC9PUnpNRki6RkSYSeLmsePAOFGyCrmlD9
 00Zha6JFvVp9dLy9D6NjSwFkPjOsjIHPXe/D8IWdlRCEBCy7rCbScFzBlgb/vxi/77cFY6Ddb4E
 vzFIbmsyr8bsPxzU69jdsWImDW03zyDN9wbmWvNPeLnq+nF1vIveyd+sswQDkREPJ20OD2TPFZD
 h+2TOMsqwLY0B11BU5Oa+3+CIelI8eY58apbXKo577zMrP6vhOcFhKRdRGGp+D5KKLxQU+INovg
 Jk0/sIOKgXeYXnTH2/7CBHdQFy3eIunJk+Yfy55RHBoYTApSk0k/XPSk+igQVoLkT4ibUNUN8Xg
 ecVwIdMN+D8LV1vSXww==
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=697824f6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=RMvJF7KAuX-NanE-UOQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2601270020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32763-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:email,synopsys.com:dkim,synopsys.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7A5E58F11B
X-Rspamd-Action: no action

T24gVGh1LCBKYW4gMjIsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBXaGVuIG11bHRpcGxl
IERXQzMgY29udHJvbGxlcnMgYXJlIGJlaW5nIHVzZWQsIHRyYWNlIGV2ZW50cyBmcm9tDQo+IGRp
ZmZlcmVudCBpbnN0YW5jZXMgZ2V0IG1peGVkIHVwIG1ha2luZyBkZWJ1Z2dpbmcgZGlmZmljdWx0
IGFzDQo+IHRoZXJlJ3Mgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIHdoaWNoIGluc3RhbmNlIGdlbmVy
YXRlZCB0aGUgdHJhY2UuDQo+IA0KPiBVc2UgdGhlIHJlZ2lzdGVyIGJhc2UgYWRkcmVzcyBvZiBk
d2MzIGNvbnRyb2xsZXIgYW5kIGFwcGVuZCBpdCB0bw0KPiB0cmFjZSBldmVudHMsIHNvIHRoYXQg
dGhlIHNvdXJjZSBpbnN0YW5jZSBpcyBjbGVhcmx5IGlkZW50aWZpYWJsZS4NCj4gDQo+IEV4YW1w
bGUgdHJhY2Ugb3V0cHV0LA0KPiBiZWZvcmUgLT4gIGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAwMDEw
MSk6IFJlc2V0IFtVMF0NCj4gYWZ0ZXIgIC0+ICBkd2MzX2V2ZW50OiAweDAwMDAwMDAwMGE2MDAw
MDA6IGV2ZW50ICgwMDAwMDEwMSk6IFJlc2V0IFtVMF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBy
YXNoYW50aCBLIDxwcmFzaGFudGgua0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gQ2hhbmdl
cyBpbiB2NjoNCj4gLSBGaXhlZCB3YXJuaW5nIGZyb20ga2VybmVsIHRlc3Qgcm9ib3Q6IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQt
YWxsLzIwMjYwMTIyMDAwMi5jSktRT1kyaC1sa3BAaW50ZWwuY29tL19fOyEhQTRGMlI5R19wZyFZ
Q1J5Yno0LThlSDBnYWFKWXQtUnpxWTc3bnZJU21ZRnYtT2F0TXZianFKbURnVVRtaE5YZUR3VjRM
M0xCRC04R3hmejJ5Nkd6YzhJZFMzQWVrQTRfZDBLd2tOZUNqayQgDQo+IC0gTGluayB0byB2NTog
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDEyMTA4NDU1MC4zMTEyMTYyLTEtcHJhc2hhbnRoLmtAb3NzLnF1YWxjb21tLmNvbS9fXzsh
IUE0RjJSOUdfcGchWUNSeWJ6NC04ZUgwZ2FhSll0LVJ6cVk3N252SVNtWUZ2LU9hdE12YmpxSm1E
Z1VUbWhOWGVEd1Y0TDNMQkQtOEd4ZnoyeTZHemM4SWRTM0Fla0E0X2QwSzVOUERqeVUkIA0KPiAN
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgfCAgMiArLQ0KPiAgZHJpdmVycy91c2IvZHdj
My9lcDAuYyAgICB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgIDIgKy0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvaW8uaCAgICAgfCAgNCArLQ0KPiAgZHJpdmVycy91c2IvZHdj
My90cmFjZS5oICB8IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0K
PiAgNSBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCj4g
DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoN
ClRoYW5rcywNClRoaW5o

