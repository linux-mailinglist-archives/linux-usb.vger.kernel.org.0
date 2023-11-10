Return-Path: <linux-usb+bounces-2758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A17E774E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 03:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7040B210E1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 02:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BCA1104;
	Fri, 10 Nov 2023 02:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JoE3peQA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SkOotiTK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GkXuRgdN"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F010F1
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 02:17:15 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C29A4784
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 18:17:15 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A9Nnttc032138;
	Thu, 9 Nov 2023 18:17:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=dsCwLdm7FYtuZjIf8t8ZHZjc6j4PBwSCIhQoaDRI1hE=;
 b=JoE3peQAAuAMse20V1qSNdcUTLYpBgKpZo2OSh0sKoWiRyIxALwsogxWDRWObqwd5Chi
 9C2jPLN9vQ2Yq6PYmP7i8PMEjyNJPilNnvMRKe5WCQ9l1p7FchVTBW73tFLkdNd15Sk8
 TfNCM9n6+FxJhlQCuELbmcGoJdj8bcoasoSIWlqKupSBpERAQVSiA5ML7tJe1geudAvc
 KyeXJ+QkOkCFN4usLKfK6X68W9MZSc2QkiJzv4K0T4R0EZNJSmMXjdyOownQk8W0ajmq
 V6GtcjLqwBMlYm+cgKeZlnLEqFGvGhEW3teHargTy/9ZgMLQs0YaqZLpFLIwzh+CMuBU xg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3u7w2k5q3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 18:17:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1699582626; bh=dsCwLdm7FYtuZjIf8t8ZHZjc6j4PBwSCIhQoaDRI1hE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SkOotiTKK+ObzF+NVB3zgzt8Sawql/3POmTPYgW2GD4Ojft7kipRFjpq8icVTF6ll
	 R6v2W0yggzP9IcG/EtTeeLbTHKc/UVqH304dKUWZHmjxPCy+6FyrzDGPL7284XcrNv
	 lNF2/1MmJ7wpYiuZv4OqI4df3zhuG04fiE0KAMnVo1x2BPwvwezecvO6XHhOWoVb5K
	 OJoBsEEmdAgyyj9ivRT0LYat0EV5en/KEB/tSgcL/xsqblqE1XE9DIBh3BP8scVnDJ
	 b5+5FBoJVwa2i2BXuaglGZVvFqC7LObsJsr3P785Q9gallXWbI4K3azTpNkrhKbJfG
	 lnuMvwmLsYIfA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1AB6C400A2;
	Fri, 10 Nov 2023 02:17:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A4BBEA00AE;
	Fri, 10 Nov 2023 02:17:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GkXuRgdN;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C40F94011F;
	Fri, 10 Nov 2023 02:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+SbKUw83vqvOzOPPgzAbM8bs7IH2sKfZIriNMF63ubfiHd85CdE63TELP8Bs22t/GMJ2UUqY9I5GFbYgype2GayBvAsD3LOX/o5CiEjWvho9apryG4f+pBYrRTM/ggRSrai37nn1b8qeZuEDcMD4hoR5C1p0TogGrRLQCWmOm/ueTVcxwE4GVclxu8utx6gpTclenXxsVJiqheyzeretd5Slu/BIxBBofOSzSN9E+KEg/9w+EdJGtppLZutHMaCQ862Zt0eejdehk1y1TSVKBYX/V1Nfmy394gCU8SQO8dEwPsE6uH/uWhiS0hKWrDonBhzEDfGl/HnwYPjOxfPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsCwLdm7FYtuZjIf8t8ZHZjc6j4PBwSCIhQoaDRI1hE=;
 b=YwjWn/NJoaKmI++EI05iXjQlD7UjwicYz8MgXoWmei9XoQJ6ypODspQL3w8fY8cH7uOwxbYd0aSg66CW64HAJnduY/Th2MzNnXfilqMxCOclHQ3+a+FMw1tPVimUSMwdn1Onf9kb1NO96zjQHjpXIGTcBi+VT0888RFIt2duRgmtjKacBY1kVJQIH+wV9yZG6MXTP1u7L5f5+oRl4RezX84KrXIy998yZaLo4zxV5ez5xxucHxmm8GW19HrqhetXARnH0CYONNsJHIg2SNCMljy2OtHaQ2YaPjS13UJccQmpsbJajo40HeMOlRzmYcbNpephvES9hwqziUfl92hXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsCwLdm7FYtuZjIf8t8ZHZjc6j4PBwSCIhQoaDRI1hE=;
 b=GkXuRgdNY7xPhR/3Zo+sPdX1+3hPk04Zf8CGTUUwi/9+/TcJ19gPHu750K+pPZwWfwX1CfGIltZqDixyEw2UKHjQDn5lG+BXyti1xbgcPnkqBwXIj7DgMPKgCFIT2m61tczJYZMdzxsQHhLdgafITOEy3A6YedC75PKZ7j5lySE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 02:17:00 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e%4]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 02:16:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: uvc: reduce the request size to increase the
 throughput
Thread-Topic: [PATCH] usb: gadget: uvc: reduce the request size to increase
 the throughput
Thread-Index: AQHaE2U8RRnQzJTjj0ugR2ED8ucRQbBy0SiA
Date: Fri, 10 Nov 2023 02:16:59 +0000
Message-ID: <20231110021655.cgj2lk62p4ez7zhp@synopsys.com>
References: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
 <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20231109233341.2461129-1-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB7660:EE_
x-ms-office365-filtering-correlation-id: f2d9706d-148d-430c-a137-08dbe1931eaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2TADg0ZfJSxOE9EzyKDogiKldBbmUq+asjkYOz9d4g9PPB9cn+WdUdQ51SQEoL87J5bjrGMyZAuE30I6NBtA9kXIE8eQ/o24iHCzz+x/Zm1Nfg7LDOp9RyYnYLC0Xr9ATzx5p9u+MhR2aeb6zOx/YpSJYFIvF5QdnCBol3CGh8B4d20VtgfHuV9gZqVozQ6MdbgHGllIUOZktC+keAU0tpiNCU1yGcihsjkh6FgQqKqStT4lyICLOpVkN92XegWgakn5JKkknX4M06XEOMYETWdIo4EuPrFOa004YSjcd88+I1cWraLjXgEjp6HqF96AlCl3U0QgROWOzdJ8tsvL5jpO9RGmdjswaE9BwA+uwtaqdbii3ZF75JAvqBMMK9bx4Peflm8xyWndSWqjZHDq7iF1kFAn2XKKBZjIGCa5Jb4rD0eQbfDae+v1prJuvsJik8rxLBf7YflKTA7F6jtmLA6Bf6oeBxvPum/n3lOwVWrCUvK5R6Sk+HLzmpoCUVd4fF7cbcw25uQz2wnRtZnAcNDZWXYYJ6/i7Jt3hf05lJuyYwbEvZi8JQeQTc0R+X/M0EhPZZkzeHnUd0Vqw66C1QsmurASNgLnCKdE6LX9YDQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(76116006)(66446008)(316002)(6916009)(64756008)(66476007)(66556008)(54906003)(66946007)(1076003)(478600001)(2616005)(26005)(6506007)(6512007)(36756003)(966005)(71200400001)(6486002)(38070700009)(83380400001)(38100700002)(5660300002)(122000001)(41300700001)(2906002)(86362001)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWREMWRvdlo4NzAwajlYa0ptaGxVMHE5N1Y1SlMva0JIOHdLWFk4MFhxMGlW?=
 =?utf-8?B?MlNzMVc0aGJRbjhxYXlhSkFRNFdyUkNFcldwdVlXeFZNQXhXb1FXcVozRHcw?=
 =?utf-8?B?MUZHNnNDcjJsQUZGZ2FsQ2dYVUxPNzlmV29jZnFONkNFOUF1c0RhR3hXMVNw?=
 =?utf-8?B?NkJNY3YvYXlYckI4VG4wdU5DOFpPQTRaUm9NMmV0MDN2b3pPNlRkQ2lwYVk0?=
 =?utf-8?B?NUJaaUZiYTBINmJXZUtlUjcyZExsejBXc2tNd3RSa3JQVElSeFdDenRacmEv?=
 =?utf-8?B?d1BFVGROcHZ4QWtrOGpvS09jZVMzRkpDY0JGWStTUlluYk9LQWU0eDlzdVk5?=
 =?utf-8?B?R1JjNnpsVkExb1ZzdHpZVXlaRXV3RTBIcGhWV0p4eGo5TXFXdXl4cjhRcVpq?=
 =?utf-8?B?R3JvRTJvTjhlZDFtdThrbTJaQnduaWRKejg5eGdXc0pNVlE0cWdDMFd5aXoy?=
 =?utf-8?B?cDJQemNpWEZWUjFSbDU4SFltQVBJZXVGSWJNL3QzN2FQNGk3TEF6TzFEOGVs?=
 =?utf-8?B?Szg4ZUFvbEtmTWtOUjNQNWNIbjlLZ2R0eXJkU21xY28waWZsdGdSYlA3NTEr?=
 =?utf-8?B?K3E5SW94djFoOU9JMEcySVdGUmQ5R2wzSGlhMzJwY0NvNEd3Y2RGN0pySlMz?=
 =?utf-8?B?TklXYkhVQlgxN1JjTUVzVkRnM2toeW56eGxXRzVUcGdTSzNKNER2OXN6RWZ3?=
 =?utf-8?B?bDl0ajJidkJVdDR5NnIzNFF3Zm8xM0dHYXlYYjlqaUgwc3VxOTZYaU02OFE3?=
 =?utf-8?B?eHpKTXpkN1laWGFLTHg3ZG1US2U2bUVPdzZOd2MzWlllbDQ5ZUM1NEFQdHZo?=
 =?utf-8?B?cXBuc2M3Tkg2cGVrMDJnOWxyelhpQzlGWnlyZkpGQ0I0TG9lN01VZWVza1cx?=
 =?utf-8?B?YnNvZHdNUEducXZORmM5Si8rUTR5Y1NDRVVpWjViM2REYitWTU1ZcDJsWDcz?=
 =?utf-8?B?ZDBJUEdWVUQvTWlwRG5idk1ZRnhoNlNsc0VhUkdIc3BOS1ByQU8yOUlLT3A1?=
 =?utf-8?B?MGVuMTl2LzAwTUNjcnJuU0tsYW9qTDZ6L3I4eHZ3cFZDekJTcVd3TDhOaURP?=
 =?utf-8?B?YmF2SGl0R2pNcE1yeDhnOHZHVU1FNU95TXlWR095WGczRy92TmpvZ24rN0d5?=
 =?utf-8?B?Zmd5N0FNanhiS1paNklwK0hsN1NZRTdDNkE4TCtWTlpxei9LWjU2OFdFbllH?=
 =?utf-8?B?T0Z4MC9CdzlKK0crZEJ6WGRKZC9BWkYwTGs0dUFyZzhKWUZoeE16S0pFQW8v?=
 =?utf-8?B?K0REUFIzRDY2cm96RHhYVm8weFlyWDcybzEyT2RRb013VHBDNmxqNHJERGp5?=
 =?utf-8?B?WkVpN0lFS2FsYW1pQWcvMzhKSm80anRBaXhxVTdSVWVWUXZVOTJHb3lHNENU?=
 =?utf-8?B?OC9kenR3LzJtejgwdm56aE5iY0FTcWVMak15cDhVQ2V3M2ZaaTR2T2taQ002?=
 =?utf-8?B?RVZZVHduRHVFSnpabXNkSW5XRS9HWlZEYmZKVi9WQ2cwY3JGWEtyVUMwdG5k?=
 =?utf-8?B?NUQvK0g0Nk96SnFrQWhoQm9yMDVYUmFRaDJNUWJHSjN4d2g1TncydFpyeWpV?=
 =?utf-8?B?dStndWp6dmlXN3lwd0VMQXVZM1NsK0RNVUN1RjRra0gwM0orM2lkV2Z1Tmhh?=
 =?utf-8?B?SEZUZFkzRlN1c2YzMGM1dWFSUkRiY1RZRytjSitlWm8vb3ExbWwyM29EdHcr?=
 =?utf-8?B?QnpEUzRWcWFpZHBtdDBtWVF5K0NZK0k0a09PN01qTGJFaUh6SnRYWHhwSFJX?=
 =?utf-8?B?OFFhVm5zckg5a1F6U2ZjRHFyRlEycWZyL2FKZU9vN2pnOTJQb1loWndOYlJ1?=
 =?utf-8?B?U1kxUzJobU42c0pBRGVRb3ZYSmVpMjNjSDg2WE1hSGszQVo5RkEzVEdWWkI2?=
 =?utf-8?B?WlF2UXFhQXJGSU93SG9jTWwyQ0RGQStxVDJmK0VpaWoyWE9wd0dqdG9xMmpZ?=
 =?utf-8?B?d1F0UGdjcHVmN3MxbWVtOUgwSEZkZlAwbWVVRWFuTEU1S1JOYko4S05ibWIy?=
 =?utf-8?B?NC9yVlZZMENPUU5Nd0pmblJkWUJjN2d0VHpZVTV6dWZMUEJRUXJadlIxcUl6?=
 =?utf-8?B?U2UyTGViL1plMFRPMk81ZGRKcTB4dVFXNFVybTd5QmtmeWpDN1RhN3V1TFNs?=
 =?utf-8?Q?RpzzdPVBCxM0F22lM/5RUHbND?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E539EC8C2DC234189842A60C9E503E5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?VmU5SmYzbEV1dE5CbVlhN2MxU1g0R3F4OVh3VnBDRXJ4OTYxM0MybVZtWFNF?=
 =?utf-8?B?YmJzVUUrWlMyTjYxUVRHYVQyYkx2cTFzYVFtSGJoeFZTbW41N2VJUW5JbzZS?=
 =?utf-8?B?cHdYRVBxVWhCaUE1c1JRRW9vNGh0aGFOb2lob3p0MTZDeFltQUlnd1Buckt0?=
 =?utf-8?B?R2VjWlFscTZYdGppL2p6d0hMRks5eE91bXVJbWZuSTM2NjJneXpLdVk5d09q?=
 =?utf-8?B?MlBZK29kUldpcEZCcnZ4WlRhcWVuaUtVK1d4TUUvWWphbUJYOTE2VC9oeHJT?=
 =?utf-8?B?RFhCNGNWRWhmR2RxcmhaUTNLYVhFNW9mU2pPaDZHY296dzRsSUFOWUpPVTlK?=
 =?utf-8?B?emhuN1VvUjJLTmZUT2ZMVzRRSTlBclRZUWZJcUNWTmhOL0JBa01uVjQvTEFF?=
 =?utf-8?B?UVNiQWExQi9kZU8xbHJzc0lpdHovS2hNcmVIQjJkeXhxWHpPcEJpNFk0Z0dY?=
 =?utf-8?B?NXNIbjd5WFdMRXBUVGV5UVZKSmJqNVBMMW1ZbW5MYXU2TkdXQ3FueEZ3b1J1?=
 =?utf-8?B?Y3A0UTVnSU93cWhidFFVcS9BbUVuYmRJUkZCUWJqRG5qN1o3K1E5TXhZRU85?=
 =?utf-8?B?eDYrcGltbDgvTTRBem1RbGc5RVFITXMyWFkvS1RuT0hKWStYdW00My90N29k?=
 =?utf-8?B?UFVMNnlNZTFnU0N6N2s5Rk1vWGVqU1JSZDJ0REJmM2toR2VtREhRYzBZUTNv?=
 =?utf-8?B?bU9NK1lXNXdHYXA4enQ3VXFGNkpIOHNmSTFQQ1o5S3pQaDhqZTdnazVqSkwz?=
 =?utf-8?B?YnJYODZXT08zL3ZhMUl4VEg5dUxIOUY5cnhyK09vM2hQaXFyeWVrT1cxbmZI?=
 =?utf-8?B?KzlxOEdBeFl0clJKeUlmNm53STNoK2FXMmVMM0hKeUkxc25ZS2h4UjgwT1ZF?=
 =?utf-8?B?eVk4eFNEWlkrdVpZSEdJc1lpd0ZuZ2ZGUE5NbzEvQ0ZKUW1tZnJrY0dSQ25R?=
 =?utf-8?B?NlFKZFl3YXJOS3JyUG5Db0JleTBFZHBtOEdzVXFacVpFV3EzZG5EdXNZdFA0?=
 =?utf-8?B?MEZPZ3VSUWd2ckM3ZmI0YlFXWUN0TWI1YWY1SHcrN0dnSFRJTEZnNjZKaWZm?=
 =?utf-8?B?SVFuRXZtSGR4MGlndUQyU21vbUFJSjJkQVRzaDlvOFgvSm0wZ3hWOUY2SElu?=
 =?utf-8?B?R2d2QWxzY085K0l6WEhKd3NaS3hkaE1yaVk3SkVYY3RNbi9YWUN4OVFsN0RQ?=
 =?utf-8?B?ajRBQUJsRFh1NVRaeEtNdmxCRG0zTVUvRWRXMXkvR0ROZTZveXhhdUxDVk56?=
 =?utf-8?Q?FxjKXNO6mYWcdiA?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d9706d-148d-430c-a137-08dbe1931eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 02:16:59.3945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJlNz+lLvBVXAHgYhqjvNbBvInXs6aZnW5VRc3oKehKNHJNWee55aA96LX0iA0UnpBGP2tcjPrROIbGvmruwTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
X-Proofpoint-GUID: UBIlReQ95zKtfpDByHmKarkYZuCE1iUJ
X-Proofpoint-ORIG-GUID: UBIlReQ95zKtfpDByHmKarkYZuCE1iUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100018

SGksDQoNCk9uIEZyaSwgTm92IDEwLCAyMDIzLCBNaWNoYWVsIEdyemVzY2hpayB3cm90ZToNCj4g
T25lIG1pc2NvbmNlcHRpb24gb2YgcXVldWVpbmcgcmVxdWVzdCB0byB0aGUgdXNiIGdhZGdldCBj
b250cm9sbGVyIGlzLA0KPiB0aGF0IHRoZSBhbW91bnQgb2YgZGF0YSB0aGF0IG9uZSB1c2JfcmVx
dWVzdCBpcyByZXByZXNlbnRpbmcgaXMgdGhlIHNhbWUNCj4gYXMgdGhlIGhhcmR3YXJlIGlzIGFi
bGUgdG8gdHJhbnNmZXIgaW4gb25lIGludGVydmFsLg0KPiANCj4gVGhpcyBleGFjdCBpZGVhIGFw
cGxpZXMgdG8gdGhlIHV2Y192aWRlbyBnYWRnZXQgdGhhdCBhc3N1bWVzIHRoYXQgdGhlDQo+IHJl
cXVlc3QgbmVlZHMgdG8gaGF2ZSB0aGUgc2l6ZSBhcyB0aGUgZ2FkZ2V0cyBiYW5kd2lkdGggcGFy
YW1ldGVycyBhcmUNCj4gY29uZmlndXJlZCB3aXRoLiAobWF4cGFja2V0LCBtdWx0aXBsaWVyIGFu
ZCBidXJzdCkNCj4gDQo+IEFsdGhvdWdoIGl0IGlzIGFjdHVhbGx5IG5vIHByb2JsZW0gZm9yIHRo
ZSBoYXJkd2FyZSB0byBxdWV1ZSBhIGJpZw0KPiByZXF1ZXN0LCBpbiB0aGUgY2FzZSBvZiBpc29j
aHJvbm91cyB0cmFuc2ZlcnMgaXQgaXMgaW1wcmFjdGljYWwgdG8gcXVldWUNCj4gYmlnIGFtb3Vu
dCBvZiBkYXRhIHBlciByZXF1ZXN0IHRvIHRoZSBoYXJkd2FyZS4gRXNwZWNpYWxseSBpZiB0aGUN
Cj4gbmVjZXNzYXJ5IGJhbmR3aWR0aCB3YXMgaW5jcmVhc2VkIG9uIHB1cnBvc2UgdG8gbWFpbnRh
aW4gaGlnaCBhbW91bnRzIG9mDQo+IGRhdGEuDQo+IA0KPiBFLmcuIGluIHRoZSBkd2MzLWNvbnRy
b2xsZXIgaXQgaGFzIHRoZSBuZWdhdGl2ZSBpbXBhY3QgdGhhdCB0aGUgZW5kcG9pbnQNCj4gRklG
TyB3aWxsIG5vdCBiZSBmaWxsZWQgZmFzdCBlbm91Z2ggYnkgdGhlIGludGVybmFsIGhhcmR3YXJl
IGVuZ2luZS4NCj4gU2luY2UgZWFjaCB0cmFuc2ZlciBidWZmZXIgKFRSQikgcmVwcmVzZW50cyBv
bmUgYmlnIHJlcXVlc3QsIHRoZQ0KPiBoYXJkd2FyZSB3aWxsIG5lZWQgYSBsb25nIHRpbWUgdG8g
cHJlZmlsbCB0aGUgaGFyZHdhcmUgRklGTy4gVGhpcyBjYW4gYmUNCj4gYXZvaWRlZCBieSBxdWV1
ZWluZyBtb3JlIHNtYWxsZXIgcmVxdWVzdHMgd2hpY2ggd2lsbCB0aGVuIGxlYWQgdG8NCj4gc21h
bGxlciBUUkJzIHdoaWNoIHRoZSBoYXJkd2FyZSBlbmdpbmUgY2FuIGtlZXAgdXAgd2l0aC4NCg0K
SnVzdCB3YW50IHRvIGNsYXJpZnkgaGVyZSB0byBhdm9pZCBhbnkgY29uZnVzaW9uLCB0aGUgaGFy
ZHdhcmUgVFggRklGTw0Kc2l6ZSBpcyByZWxhdGl2ZWx5IHNtYWxsLCB1c3VhbGx5IGNhbiBiZSBz
bWFsbGVyIHRoYW4gdGhlIFRSQi4gSXQgc2hvdWxkDQpiZSBmaW5lIHdoZXRoZXIgdGhlIFRSQiBp
cyBsYXJnZXIgb3Igc21hbGxlciB0aGFuIHRoZSBGSUZPIHNpemUuIFRoZQ0KaGFyZHdhcmUgZG9l
cyBub3QgInByZWZpbGwiIHRoZSBGSUZPLiBJdCBqdXN0IGZpbGxzIHdoaWNoZXZlciBUUkIgaXQn
cw0KY3VycmVudGx5IHByb2Nlc3NpbmcgKEkgdGhpbmsgeW91IG1heSBiZSBtaXhpbmcgdXAgd2l0
aCBUUkIgY2FjaGUpLg0KDQpUaGUgcGVyZm9ybWFuY2UgaW1wYWN0IGZyb20gdGhpcyBjaGFuZ2Ug
aXMgdG8gcmVkdWNlIHRoZSBVU0IgYmFuZHdpZHRoDQp1c2FnZS4gVGhlIGN1cnJlbnQgY2FsY3Vs
YXRpb24gaW4gdXZjIGZ1bmN0aW9uIGNhbiB1c2UgNDhLQi91ZnJhbWUgZm9yDQplYWNoIHJlcXVl
c3QgaW4gU3VwZXJTcGVlZCwgdGhlIG1heCBzaXplIGZvciBpc29jIGluIFN1cGVyU3BlZWQuIEkg
a25vdw0KbWFueSBob3N0cyBjYW4ndCBoYW5kbGUgdGhpcyBraW5kIG9mIHRyYW5zZmVyIHJhdGUg
ZnJvbSB0aGVpciBoYXJkd2FyZS4NCihlLmcuIEl0IGdldHMgd29yc2Ugd2hlbiBzY2hlZHVsaW5n
IHRyYW5zZmVycyBmb3IgbXVsdGlwbGUgZW5kcG9pbnRzIGFuZA0KdW5kZXIgbXVsdGlwbGUgdGll
ciBodWJzKS4NCg0KVGhlIGJhbmR3aWR0aCBjYW4gYmUgaW1wYWN0ZWQgYnkgbXVsdGlwbGUgZmFj
dG9ycyBhbmQgbm90IGp1c3QgZnJvbSB0aGUNCmdhZGdldCBzaWRlIGFzIG5vdGVkIGluIHRoZSBk
aXNjdXNzaW9uIGJlZm9yZS4NCg0KPiANCj4gVGhpcyBwYXRjaCBpcyBzaW1wbHkgZHJvcHBpbmcg
dGhlIG1heGJ1cnN0IGFzIGFuIG11bHRpcGxpZXIgZm9yIHRoZSBzaXplDQo+IGNhbGN1bGF0aW9u
IGFuZCB0aGVyZWZvciBkZWNyZWFzZXMgdGhlIG92ZXJhbGwgbWF4aW11bSByZXF1ZXN0IHNpemUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8bS5ncnplc2NoaWtAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiBUaGlzIHBhdGNoIGlzIGNyZWF0ZWQgYXMgYW4gcmVzdWx0
IGZyb20gdGhlIGRpc2N1c3Npb24gaW4gdGhlIGZvbGxvd2luZyB0aHJlYWQ6DQo+IA0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNi
LzIwMjMxMDMxMjMxODQxLmRiaHRyZ3FvdW51MnJ2Z25Ac3lub3BzeXMuY29tL19fOyEhQTRGMlI5
R19wZyFmVGFJbzR0RGxqU2JFdlVZNVNaTGtOdktXY3owWWVOMEVrenMwQ1BXeUQ3M1JHUm1FclJD
MmZyT0RGZ25NQjFNNE5zZTBvS0tnd3hDNjVnZVBoR0F0YXVLSnExVm56bGokIA0KPiANCj4gIGRy
aXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91dmNfcXVldWUuYyB8IDEgLQ0KPiAgZHJpdmVycy91
c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y192aWRlby5jIHwgMSAtDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1
bmN0aW9uL3V2Y19xdWV1ZS5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y19xdWV1
ZS5jDQo+IGluZGV4IDBhYTNkN2UxZjNjYzMyLi4xZDNjM2MwOWZmOTdjYiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3V2Y19xdWV1ZS5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2dhZGdldC9mdW5jdGlvbi91dmNfcXVldWUuYw0KPiBAQCAtNTUsNyArNTUsNiBAQCBz
dGF0aWMgaW50IHV2Y19xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwNCj4gIAlzaXpl
c1swXSA9IHZpZGVvLT5pbWFnZXNpemU7DQo+ICANCj4gIAlyZXFfc2l6ZSA9IHZpZGVvLT5lcC0+
bWF4cGFja2V0DQo+IC0JCSAqIG1heF90KHVuc2lnbmVkIGludCwgdmlkZW8tPmVwLT5tYXhidXJz
dCwgMSkNCg0KSSB0aGluayB5b3UncmUgcmVkdWNpbmcgYSBiaXQgdG9vIG11Y2ggaGVyZT8gQWxz
bywgdGFrZSBhZHZhbnRhZ2Ugb2YNCmJ1cnN0LiBTbywgcGVyaGFwcyBrZWVwIHJlcXVlc3Qgc2l6
ZSB0byBtYXgoMTZLLCBNUFMgKiBtYXhidXJzdCk/DQoNCkNhbiBiZSBtb3JlIG9yIGxlc3MgZGVw
ZW5kaW5nIG9uIGhvdyBtdWNoIHZpZGVvIGRhdGEgaXMgbmVlZGVkIHRvDQp0cmFuc2ZlciBvdmVy
IGEgdmlkZW8gZnJhbWUuDQoNCkJSLA0KVGhpbmgNCg0KPiAgCQkgKiAodmlkZW8tPmVwLT5tdWx0
KTsNCj4gIA0KPiAgCS8qIFdlIGRpdmlkZSBieSB0d28sIHRvIGluY3JlYXNlIHRoZSBjaGFuY2Ug
dG8gcnVuDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdXZjX3Zp
ZGVvLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdXZjX3ZpZGVvLmMNCj4gaW5kZXgg
OTFhZjNiMWVmMGQ0MTIuLmM2YjYxODQzYmFkM2Q3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvZnVuY3Rpb24vdXZjX3ZpZGVvLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0
L2Z1bmN0aW9uL3V2Y192aWRlby5jDQo+IEBAIC0zMjksNyArMzI5LDYgQEAgdXZjX3ZpZGVvX2Fs
bG9jX3JlcXVlc3RzKHN0cnVjdCB1dmNfdmlkZW8gKnZpZGVvKQ0KPiAgCUJVR19PTih2aWRlby0+
cmVxX3NpemUpOw0KPiAgDQo+ICAJcmVxX3NpemUgPSB2aWRlby0+ZXAtPm1heHBhY2tldA0KPiAt
CQkgKiBtYXhfdCh1bnNpZ25lZCBpbnQsIHZpZGVvLT5lcC0+bWF4YnVyc3QsIDEpDQo+ICAJCSAq
ICh2aWRlby0+ZXAtPm11bHQpOw0KPiAgDQo+ICAJdmlkZW8tPnVyZXEgPSBrY2FsbG9jKHZpZGVv
LT51dmNfbnVtX3JlcXVlc3RzLCBzaXplb2Yoc3RydWN0IHV2Y19yZXF1ZXN0KSwgR0ZQX0tFUk5F
TCk7DQo+IC0tIA0KPiAyLjM5LjINCj4gDQo+IA==

