Return-Path: <linux-usb+bounces-10939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D08FDB74
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 02:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DF211F22AD9
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D026FD0;
	Thu,  6 Jun 2024 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RDlKIa8z";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X90Megaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bKBwSQG5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E4A139D
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717633716; cv=fail; b=qjl47RazBQHkk+tPl5l1nBGKANaQ1wktsVgzaRHVj5dSKbw4Zg42yaR+N+FxszSuF2A4l3Mk/U78k8qqGRrTwK3VxvPxQwW7ZV4TunVMDCAIj/oPe3A3/vuQJZZTf/H33hKKKLl5h31mbYkxX3L+Bb5YsOhB6RYOzsXZjqfeLwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717633716; c=relaxed/simple;
	bh=CuDlhORZP2BQYLUFDsCNxpQyZSpfINkz3fBHu7BqlWE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=teS657o6RrL14mSpJnu/mdV4J0Xl6FZ44ETTAV8IBJBv9Us4GV0Laa7sBmKw2WtwwxGc7vrJNcuGXJ99ZkQqL9LiKZgxqOF0hOtNXioSiOEbqGCBk07F2QflZoXZVf0uZuzVgeX2Pqrs5xAuwYrM8WDG+P2ZnKgMAO2hXxz5FNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RDlKIa8z; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X90Megaz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bKBwSQG5 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455M3os8000316;
	Wed, 5 Jun 2024 17:28:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CuDlhORZP2BQYLUFDsCNxpQyZSpfINkz3fBHu7BqlWE=; b=
	RDlKIa8zs69O1lkeS4XNTcbuCLDVFjwaIi3pMfM0P004GZMepwrnDkpSxK+yMaBV
	WK8NRzTFnw3Y5XcHG0QxQX9fa6iheMZs6I/qBoMHZaiixLK36lEjJwmkto1hCvzQ
	ip9sC8KwNxb37Sl8nAiqhZF5Z6hyrB0rpcesfozq3HFU9zd5zTua0ZDj9AQO3XQe
	EdZ7DWRYm5b82cVK6km2vFKzWA+MmegvMEhZ40DvgGB6i1MiUTtzbuWNXHvrkaEu
	t16UPMgr7x/rETQCosdxmJfQ8Meo/HS3uEotgF/MQ8Wj8gEEaSrmZELheatXZ1rt
	SE/oQm080a5n4eSjAOadUA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yg2w3buut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 17:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1717633703; bh=CuDlhORZP2BQYLUFDsCNxpQyZSpfINkz3fBHu7BqlWE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=X90MegazVeq8Ni0RGhwZ6jMeOLI7Et7IkEfDNLoJMiCcH+fJ62k2H4Ik0+Nze2/gQ
	 SZuioIOLqrATKMp+u3Cy2t3YkUnnPbUGNK/CQa/P48kx1AJoVbKJfjtAxrjHGRERgN
	 Jqkf3x9xi3xbyVarCszuH/bLaSm/PCN+XGD/ESt+yLXEiraHWknQHs/Mgsx7f2bjCB
	 Hwkhmmzbn8Z62KLB9Mm6H8GXlu0TO4jmfFRB0rPiaR8V9dKOG9yr1ttTneHS22TCZI
	 usPwjlo3TrXzr5TVxgEmzCTqNYVhmoig0h8WltQm6XuN8J0Q1w3iU6kPB/LsgHyhvd
	 skh/1rT8LxeqQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CDDE940147;
	Thu,  6 Jun 2024 00:28:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7B360A009A;
	Thu,  6 Jun 2024 00:28:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bKBwSQG5;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 73E454034F;
	Thu,  6 Jun 2024 00:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUsFz+7moZRiB5RIT7Za0Ixg9t0R/d41A329cynlaxJPubFdwZksrJdhFNM/XZJYdwgCbcZrQgZvK+qOOcKA/DHyDgld0qqgLq5CfTb/fsYFL9zsQtff7CxBts9YQep6Duo1bRYal7n+SSM7XnE4jE1SnJe7td75qFHBL9kg0z78V/IkHgLQHqD9J30GUj6CsO/mirgYURXet+w29pm49XYwBZoJHpx5cK61vIMsaYEFJaiH1KjIliDwBEA6sCqyiI1gku+0l+Tx799fYUICDdkTM1g5vliR2+ZbEsuTjj4e4Yzc7PQdqyv9lXbXVZNufprG3FUVtE1Jz43Y9dmXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuDlhORZP2BQYLUFDsCNxpQyZSpfINkz3fBHu7BqlWE=;
 b=gsQl55bAKheKwh9vy+j8J9Hm6GsmaJSypT+MOjBvCadGizjWmFbKrgrIsyfdoILKZyIxU/iZawr5HJKjlX25xvjlzJXpdBP7cx6BzoicqpCRgPpJzPDWAnyNQErGLPNaeRYb2HCljhJ5wVzsyhRVMDx+dP77NwkqpJt7X8UdyUToCEyiyhI8Qsw2yXtwXYCsbDVsaEoUmQ9aa7jCSAJW4U9MdoHdLYA0bkMrcE6aT8BjXRSCVja8xxcDWAKFisbopLjVzoQxEEe9FMugFBSbemyt5MTvQ97h2zCFeMYXQeiT3TtADuO1p7KaAejhwS+K6dcch2VhcyEg6MEGWztasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuDlhORZP2BQYLUFDsCNxpQyZSpfINkz3fBHu7BqlWE=;
 b=bKBwSQG5mC/Nlwob03U5EqX1s7i7mu9QdZOyj30KnZrsFleJ1Oi5kApoOXcwHAW8oj2agS8bngHlmPZ/mrr3SUjeN4qC7uoav+TTh1X7vPJfHC6qil4vshX284SZ11dxr1AHYcB64iBuT24WaBdw2n+vNXrRj01vSB/bBnTOZGw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 6 Jun
 2024 00:28:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 00:28:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4A=
Date: Thu, 6 Jun 2024 00:28:16 +0000
Message-ID: <20240606002805.bziyz3y4bcysdysv@synopsys.com>
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
In-Reply-To: <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB6320:EE_
x-ms-office365-filtering-correlation-id: d02106e7-6693-4e51-31c8-08dc85bf8ee1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NGJPRWdhUWgwZVZjOXVlOEdhNm40RElkUHBka1NRemR1YldTMW5VYjg5bnNB?=
 =?utf-8?B?WklYTUZzTEVOM3h3ODU5bWx5M3N1cGh0VkFNem40MTUwaUo4c0pRUXhkU0k5?=
 =?utf-8?B?QWtjeDBZd0JVVHhlZVkyekNZZlFHWG9KempYOVhiMWoreXJtNW1OYkpQYjVD?=
 =?utf-8?B?bVRUMTl5MUJHQjk1VC93V3hCVmltaktrMEJnV3pQSDVFTlliQU81S2ZDd1hO?=
 =?utf-8?B?M2dka2pxSHR2YktrMk50SHhIWXl6ZmpVZlYwdDlSUGFTSkZuYkgwUjRLTjdP?=
 =?utf-8?B?WitvbXUrTEc0MFNBaWZ4MzFtbVpLaUxqQWhzOUwyNitFNkN0RHIybmwwV3Fm?=
 =?utf-8?B?elNkbHhEUWxRekxKL09YN0YvN282NHRCNkNURE5DN0s4S1ROeWhOaks2WndZ?=
 =?utf-8?B?YzJuYlZ4WUtrSWtDQ1R4ckY2VXdoRzdacUsyMlRXU2xBSksyK1ZqcVRMYXk0?=
 =?utf-8?B?cWMya3JVRGxVektzWll4YlpaN3Q5OXNDd2U4TW5BZFg2dlU2U1VCU2l3eVp5?=
 =?utf-8?B?anhnakJXY2J0bHFxckJ3Si9mK3c1K1NvWGJqcURTR0FKWWFnbnhmb1BGdFRr?=
 =?utf-8?B?dENwekdBWVJld1lvMXZrZnpOVnVidzk2RTZoNlJsUWhFVzNvL3FDaDhkbzFH?=
 =?utf-8?B?T1g1RS9ZNkJVOHpQdjh1MWs3aUNGcVZuL2d6cjJlWThnb2E5MENROEE3VVFG?=
 =?utf-8?B?WUJJZytDZitaUFR4RkFvTmpLeWQweXJwcmpwN09HR3VNY1FWSnp5eFJCMnlq?=
 =?utf-8?B?ZVlvN3FnRnlyYWQ1LzhIbmVEVjExWXN5QjhEdEhqOHcwUW4wVndvYzlzc005?=
 =?utf-8?B?dVdYcU9CRllHMEZJcURxOVN6VnpuRm1maWdQYXNqTHpPTTdXbzJ2cEpjZk1W?=
 =?utf-8?B?YVRIV2pzdzE3bmdpcldQd0JIVkdNWDl1V3RqWlEvdmQvazRCQ1FkN3NNcm5B?=
 =?utf-8?B?WHJlZjVQcHZQTkREYTU2Ylh3YlBnMkl4cWhCZThlOXhPVU5RMmlEU0huT3U3?=
 =?utf-8?B?eEZqNjd2dmJqN2hzT0ZQaU0vdS84SVkwbzhaRFBaRXh0M0NoRUZtaG5mQ2JY?=
 =?utf-8?B?SVdmRVBEa1h1eGJRSnJkZU5uQlhWamVPSWFBTW9iV0tIVmZHdDlPRHkvWWFo?=
 =?utf-8?B?amRkRXNXWC9qdytyUTlLQ2UxYzFxdGtoT01GZnVsd1Z3Tno5Nm5PYVVwWnJT?=
 =?utf-8?B?YjdONzRINndpaVg4a3hKSkd0dys3KzFWRlY2QUYvSUxLQVFHMEVWQ2F1MFM4?=
 =?utf-8?B?NUFDdlVZUVJuOG02dGhqU1AyV2JnUTdjeHkzQlE4cFRVYm5hdkkweC8yQnM2?=
 =?utf-8?B?QXRhTFdiT2V4aGo0ZnQvdHAybnJOMWl1UXVvczJOamFPK3ZNdWJWWC9vK2RI?=
 =?utf-8?B?eUxJSS9wYjVoZ0RqVmZEMVQ4M1VuZFdHRVpuQUFabkVQa2k0OFZCVjdGSFFv?=
 =?utf-8?B?MHNpQy9Lc3FBN3AvcUFzcDRIaFZVOGQ3WnI4RU9vZnppZ1BLZUJHS3FRWG1Y?=
 =?utf-8?B?aXZEeWhUY2JiRmdVVGhBZ2VZeWZZTmRuNUtSaksrVytvYXZHZ2JQVWdUYVRy?=
 =?utf-8?B?RW91eDZPNlpBeFROQ3pIN2gyc0l3dXJkQzlnclpRM3pqaU1wZkFUQ1UrNHJ1?=
 =?utf-8?B?Ui8yT1lDKzR2V3pFb25JMEdWMVN2c3Nlb0NEcU5Va0t5TGcrdmxpUUs2dmZh?=
 =?utf-8?B?a1Nrem5zYTJJd3BnbDhLUlZYNUQ4YjBQcXNrTUxWb2dCUk01SGpDY1h2WGcr?=
 =?utf-8?Q?mWyP1UnIWsY7aAmJiQZDy6C2ZJW3savjHj9MLw+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UG5FMzMzT3UxdE5HRjV2Y0VMeU1jYVhhc2lid0hFaHcrOExaOW42a3dLMVJm?=
 =?utf-8?B?NklJK3NPRHBiMUVJM3pqY2NpNGhOMFdtUThJUkJyZldBR1hiWEErUDNJZktN?=
 =?utf-8?B?VG0vWEJPRnJPMGwwR1VqRk9kNGJLQndDTFk2RUFqWStvS3JIaTFJYVJZSkFv?=
 =?utf-8?B?UXN3aVRNNFdhblpWS3RjUW1vdlZQM0NRVGc4MUhjM1ZXTmliYXJGTnB4M0VV?=
 =?utf-8?B?N1Bmbml6VmlTZkhHSHYxd3VoZTJySitOeHZSV2JzL0d1NWtOckV4ak9ibDhw?=
 =?utf-8?B?L2NadGNxUU5NU1pqdnM2SUxucFJYcE52UlBIRUNsNTNqZHVTTWorUEl6YWgw?=
 =?utf-8?B?OEJuMjRzdUF1VmVCNDg5azFCODlNY3AxY2I4cWJwd0xuNXJGRUNFZS9IUFFB?=
 =?utf-8?B?dEdON244c1NzMlQvRWcrTWwyWWRNd3RqQnI2RlRvczVyMnhKdk1UbXBXZEFs?=
 =?utf-8?B?anJUamRBTmtDZGdXUCtrT1FDMXpGQkZ6d09RK09SMEZ3d0huKzNLanFtQk4r?=
 =?utf-8?B?UWJtSmJCcHQ5bHQ4Z1VGQ2xNMGpKSzlURHl4Rmtkc3IzdVFMVWdDUjZ2QmVQ?=
 =?utf-8?B?WGdtV0ZHOG9OQk1FN3hUVklRQ3RTNTNpcnRleHdjR1VRVEg5Lzl0bDVTOS9s?=
 =?utf-8?B?ZmR2RzIvaS94WWFhTnNUV0c4a25sdHNSWVR2WFNGWU4zaEpmaFJpSUM5SVpu?=
 =?utf-8?B?TTJET1ZlcHlwMkNxa2lWNCs1M0hINkxtb2lLZkVZVElkRUY0ZHdsRDBON3ND?=
 =?utf-8?B?c3h3S0lUcWI0NmZOQTliL1ZyS295UURHUENacGRqYU9MZ2ZsYVBlUTk1SFhq?=
 =?utf-8?B?bG93VVB5bHkrSUI2cWpFM0VlUFpGUTc3YVN2OTVtSzlNdkt3bVN5ck5LK3Zp?=
 =?utf-8?B?N2dlMmx1UlYrcWhhYUlzZ0xjcXRkTUtmQXM4Z0JzVTJDREdyN1F3UGFvTzlt?=
 =?utf-8?B?K0NIc1JxR0lVN3RienB4OUk5Uzg5UGtEZTRwVGhQZDl0d2VCdWo3N0lFZUw1?=
 =?utf-8?B?ZXBScnlPcHVseU9MMSsyU1FnL3ZUNDdleGxtaksxT0NqakpHbzBqK2dFWHZx?=
 =?utf-8?B?UnpTNnprWUFLNEFUdTRSeDdRTXJNWDN5dGUvNFN4U0dLOTBYOTVCaW5HeDc4?=
 =?utf-8?B?TWZUcjJHQ1UwZkRmd0lPRjlBWmRkZC84MmlQR2JQZkRadW5Wc0JIWVROazNp?=
 =?utf-8?B?TUxhSngyYWxmNVROZWU3SEVKc3BoL2E2R3F6eVQ5MVdQdVlwbnFJNkhweitY?=
 =?utf-8?B?UEQzU2FoR2h5cDhmVnh5aGxkRFZPc3o3VUpWYXJKN3dPU3U1ejVoYXBraHkz?=
 =?utf-8?B?QzZkRFNYcjNJQ1llV3cvVEFBcFh3YS8vVVpXTGg0YmYzYVkvaVBDdUJoaW95?=
 =?utf-8?B?UVNPYUt4SSs0U1RoTFRnak5sQnBJbm1YcGRQMkU5VklaRjhJQkRudk0wbmVz?=
 =?utf-8?B?ZGZ4M3dyZ0dUeC9BSUl2cW5ObFlvYnpTVWFEQy91TllRQ0JQdDlQZlY1SHNS?=
 =?utf-8?B?QVdvUU9Vano3N3BOY0E3NUtpUlpJR21YTnZoRlZmSTF5cFJiMlVraGZoNDdE?=
 =?utf-8?B?KzU2cW5yWUxnRUxvY3NrQXRZcEROZXkzeFpoL1VHUUpYemczOEhub0ZucDBL?=
 =?utf-8?B?R2duUzNQNG1FRkFZTC95RHJxUndVdWM3WW1QZ2RnUWEyMjFKcDFEZlRZajBO?=
 =?utf-8?B?M1lqNyswb0E5Tk1tOXVJb0R0UDNFVzBFUGlrSGwvcnBoWHYrckwvZlRMM1Jm?=
 =?utf-8?B?NEVBVGFhWjJjQzcxcFpHczJ2MXpGaFhkbWE1cEpIUGsrNCsrWjF1Wkh5bjkv?=
 =?utf-8?B?YW1DaTVQV1hoTWhhbkluMlJxVXlqWjd4aHJ4NGxMTldjRkV0RTh3cURrUzBl?=
 =?utf-8?B?UHhFalNJS2NoRXoyNXpIT2J4bURIR1gyNUxOdmxSbTByMWxFMjU2YXVYbnFQ?=
 =?utf-8?B?SjE2UmVMdDgzdC9OemYycGhsUHBuQU8xRkNXL21WNWZ2Ri9LRFlWd0tIR0JR?=
 =?utf-8?B?VkdnaUxOSSsyY1FaYk51dkpnd3pqN25QMHl1ZGtHQjRmVStSWlM2UzNyTE52?=
 =?utf-8?B?ZUFMOVNCa1ZGZHpuT2tKZnBpV09ybHg5bFg4RnBKYWxYWGZRSDhmUENNQnpZ?=
 =?utf-8?Q?31u9XtWWbLoBoVZfweNjJjQ1u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94C1599FFB44EA4DB63601CCBC6C8986@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	c80XkRNNvTT8i5yVOaqesy5KHml7atHGohEaIidogg6exiOQLNUIr0VuiQGqm/R19/tiNBsAT1XTMu4Jsaci3A/KyvBSGnwdTdJSIqznAuOIPsg8z6/QB6AAn+qMz33/y1n0wZZzGPtKajQ2P4DXEeiOyWjRghZOYb2o6t8aao6n06PC6NeyN4sih1rbUuTYiWC2IoA2p45LMGxGBXAbEovAzPLdNmDA+QMr1mjLZaRh3BswA8YEZu7CIfFunG/rTc9nJKWmh5M/MQ0ICEP4FaGe5ukIeld/90kfo8D0l3F/Skp8FA2e4fcABpteKhFdSpZDeADxhQ2UmBbB9PlFE6JjeVlSxrVg1ITdHHLzU5FV+2pEZzfuJ1CFQIup4XFVwt4RiHGUuHmvUCKKV3xTK/t3oXCe1qJm4Myh5tX/eDUfMfr62GycHN1yVT3Yz2M/UcN5knR+8ZYHji5XVCfDcQBnI4T0kUeqR1sz79sER8sfUUGy9wZDET6cVf6vMcq6ScsH5eqbmAxhFeFb9yno+qb+6MhToNt1OHAMZclPNpu+9uoo25jy+stXikZqKZOy42Bwkffc2gN4KA9E92MNf7630oC3W72N4ulMGpVWsrrewSrcdriYQlWAMRAnGMGsVO6aoadYqq9joY36TTAQSQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02106e7-6693-4e51-31c8-08dc85bf8ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 00:28:16.1729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++ves0clofmmlYjhSsQu/ITyGntJQKLDfe6tOyxIXPbtxR0qJmjDwwgKQjpmozlxfkZt8l7gkSvoL81tU2fyuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
X-Proofpoint-GUID: O6MBqf1qLuDgcLQyiAY5iBD1DMRvzNQY
X-Proofpoint-ORIG-GUID: O6MBqf1qLuDgcLQyiAY5iBD1DMRvzNQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=900 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406060002

T24gV2VkLCBKdW4gMDUsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiBPbiAwNS0wNi0y
MDI0IDAxOjA2LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gT24gVHVl
LCBKdW4gMDQsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gT24gMDQtMDYtMjAy
NCAwMzowMywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4g
PiA+IE9uIE1vbiwgSnVuIDAzLCAyMDI0LCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+ID4g
PiBXaGVuIGRpc2Nvbm5lY3RpbmcgdGhlIFVTQiBjYWJsZSBvbiBhbiBMUzEwMjggZGV2aWNlLCBu
b3RoaW5nIGhhcHBlbnMNCj4gPiA+ID4gPiBpbiB1c2Vyc3BhY2UsIHdoaWNoIGtlZXBzIHRoaW5r
aW5nIGV2ZXJ5dGhpbmcgaXMgc3RpbGwgdXAgYW5kIHJ1bm5pbmcuDQo+ID4gPiA+ID4gVHVybnMg
b3V0IHRoYXQgdGhlIERXQzMgY29udHJvbGxlciBvbmx5IHNlbmRzIERXQzNfREVWSUNFX0VWRU5U
X1NVU1BFTkQNCj4gPiA+ID4gPiBpbiB0aGF0IGNhc2UsIGFuZCBub3QgYSBEV0MzX0RFVklDRV9F
VkVOVF9ESVNDT05ORUNUIGFzIG9uZSB3b3VsZA0KPiA+ID4gPiA+IGV4cGVjdC4gQXMgYSByZXN1
bHQsIHN5c2ZzIGF0dHJpYnV0ZSAic3RhdGUiIHJlbWFpbnMgImNvbmZpZ3VyZWQiDQo+ID4gPiA+
ID4gdW50aWwgc29tZXRoaW5nIHJlc2V0cyBpdC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBGb3J3
YXJkIHRoZSAic3VzcGVuZGVkIiBzdGF0ZSB0byBzeXNmcywgc28gdGhhdCB0aGUgInN0YXRlIiBh
dCBsZWFzdA0KPiA+ID4gPiA+IGNoYW5nZXMgaW50byAic3VzcGVuZGVkIiB3aGVuIG9uZSByZW1v
dmVzIHRoZSBjYWJsZSwgYW5kIGhlbmNlIGFsc28NCj4gPiA+ID4gPiBtYXRjaGVzIHRoZSBnYWRn
ZXQncyBzdGF0ZSB3aGVuIHJlYWxseSBzdXNwZW5kZWQuDQo+ID4gPiA+IE9uIGRpc2Nvbm5lY3Rp
b24sIGRpZCB5b3Ugc2VlIGRpc2Nvbm5lY3QgaW50ZXJydXB0PyBJZiBzbywgaXQgc2hvdWxkDQo+
ID4gPiA+IHRyYW5zaXRpb24gdG8gVVNCX1NUQVRFX05PQVRUQUNIRUQuIFRoaXMgY2hhbmdlIGRv
ZXNuJ3Qgc2VlbSB0byBkaXJlY3RseQ0KPiA+ID4gPiBhZGRyZXNzIHlvdXIgaXNzdWUuIENhbiB5
b3UgcHJvdmlkZSB0aGUgZHJpdmVyIHRyYWNlcG9pbnRzPw0KPiA+ID4gVGhlIGRldmljZSBkb2Vz
bid0IGlzc3VlIGEgZGlzY29ubmVjdCBldmVudCwgSSBkaWRuJ3QgaGF2ZSB0cmFjaW5nIGVuYWJs
ZWQNCj4gPiA+IGluIHRoZSBrZXJuZWwgYnV0IGFkZGVkIHNvbWUgZGV2X2luZm8oKSBjYWxscyB0
byBkZXRlcm1pbmUgd2hhdCB3YXMgZ29pbmcNCj4gPiA+IG9uLiBBZGRlZCB0aGlzIHRvIGR3YzNf
cHJvY2Vzc19ldmVudF9lbnRyeSgpOg0KPiA+ID4gDQo+ID4gPiBkZXZfaW5mbyhkd2MtPmRldiwg
ImV2ZW50OiAweCV4IHR5cGU9MHgleCIsIGV2ZW50LT5yYXcsIGV2ZW50LT50eXBlLnR5cGUpOw0K
PiA+ID4gDQo+ID4gPiBXaGVuIGRpc2Nvbm5lY3RpbmcgdGhlIGNhYmxlIGZyb20gdGhlIGhvc3Qs
IEkgc2VlIHRoaXM6DQo+ID4gPiANCj4gPiA+IFvCoMKgIDUwLjg0MTQxMV0gZHdjMyAzMTEwMDAw
LnVzYjogZXZlbnQ6IDB4NjA4NCB0eXBlPTB4NDINCj4gPiA+IFvCoMKgIDUwLjg0MTQ1N10gZHdj
MyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NDA4NiB0eXBlPTB4NDMNCj4gPiA+IFvCoMKgIDUwLjg0
MTQ5NF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NjA4NCB0eXBlPTB4NDINCj4gPiA+IFvC
oMKgIDUwLjg0MTUzNF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NDA4NiB0eXBlPTB4NDMN
Cj4gPiA+IFvCoMKgIDUwLjg0MTU3MV0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NDA4NiB0
eXBlPTB4NDMNCj4gPiA+IFvCoMKgIDUyLjY1MDk5MF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6
IDB4MzA2MDEgdHlwZT0weDANCj4gPiA+IA0KPiA+ID4gVGhlICIweDQwODYiIGFuZCAiMHg2MDg0
IiBtZXNzYWdlcyBhcmUgZW5kcG9pbnQgZXZlbnRzIHRoYXQgb2NjdXIgYWxsIHRoZQ0KPiA+ID4g
dGltZSB3aGlsZSBjb25uZWN0ZWQuIFRoZSBsYXN0IGV2ZW50IGlzIHRoZSAic3VzcGVuZCIgb25l
LiBBZnRlciB0aGF0LCB0b3RhbA0KPiA+ID4gc2lsZW5jZS4NCj4gPiA+IA0KPiA+ID4gSWYgeW91
IG5lZWQgdHJhY2VzLCBwbGVhc2UgcG9pbnQgbWUgdG8gYSBkZXNjcmlwdGlvbiBvbiBob3cgdG8g
b2J0YWluIHRoZW0uDQo+ID4gPiANCj4gPiA+IA0KPiA+IExldCBtZSBrbm93IGlmIHlvdSBydW4g
aW50byBpc3N1ZXMgZm9sbG93aW5nIHRoaXMgaW5zdHJ1Y3Rpb25zIHRvDQo+ID4gY2FwdHVyZSB0
aGUgdHJhY2Vwb2ludHM6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
ZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvdXNiL2R3YzMuaHRtbCpyZXF1aXJlZC1pbmZvcm1h
dGlvbl9fO0l3ISFBNEYyUjlHX3BnIWJhaGZqaWw1SEVVcS1mT0hBd0RmdXN1dExKQ0xvZ25meUxI
VEZMaVNsVnVab3Rwcjk5WEJHZzduQjB6UlJuTkZfTTFwcUVLY1ZhNEt4Tkp3aDNfRjJkWld3VktU
a1VZJA0KPiBJJ3ZlIGF0dGFjaGVkIHRoZSB0cmFjZXMgYXMgYSB0YXJiYWxsLiBIb3BlIGl0IHN1
cnZpdmVzLg0KDQpHb3QgdGhlbS4gVGhhbmtzLg0KDQo+IA0KPiBBdCB0aGUgc3RhcnQsIHRoZSBV
U0IgaXMgdXAgYW5kIHJ1bm5pbmcgKGFuZCBkb2luZyBldGhlcm5ldCttYXNzIHN0b3JhZ2UpLiBJ
DQo+IHNhdmVkIHRoZSB0cmFjZSBhZnRlciBwdWxsaW5nIHRoZSBVU0IgY2FibGUuDQo+IA0KDQpG
cm9tIHRoZSBjYXB0dXJlLCB3ZSBjYW4gc2VlIHRoYXQgdGhlcmUncyBubyBzeXN0ZW0gc3VzcGVu
ZCwgc28gdGhlcmUncw0Kbm8gc29mdC1kaXNjb25uZWN0Lg0KDQpCYXNlIG9uIHRoZSBzdXNwZW5k
IGV2ZW50LCB5b3UncmUgcnVubmluZyBpbiB1c2IyIHNwZWVkIChpZ25vcmUgdGhlDQppbmNvcnJl
Y3QgVTMgc3RhdGUsIHNob3VsZCBiZSBMMik6DQoNCglpcnEvOTQtZHdjMy02MzEgICAgIFswMDBd
IEQuLjEuICAgMTQ5LjEzOTI5MDogZHdjM19ldmVudDogZXZlbnQgKDAwMDMwNjAxKTogU3VzcGVu
ZCBbVTNdDQoNClRoZSBEU1RTIGZyb20gdGhlIHJlZ2R1bXAgaW5kaWNhdGVkIHRoYXQgeW91J3Jl
IHN0aWxsIGluIEwyIGRlc3BpdGUNCmRpc2Nvbm5lY3RlZC4gTG9va3MgbGlrZSB0aGUgcGh5IHdh
cyB1bmFibGUgdG8gZGV0ZWN0IGFuZCB3YWtldXAgZnJvbQ0KdGhlIGRpc2Nvbm5lY3Rpb24gdG8g
bm90aWZ5IHRoZSBjb250cm9sbGVyLg0KDQpDYW4geW91IGV4cGVyaW1lbnQgd2l0aCBzZXR0aW5n
ICJzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsiIHRvIGRpc2FibGUNCnVzYjIgcGh5IHN1c3BlbmQu
DQoNCkRvZXMgeW91ciBkZXZpY2Ugc3VwcG9ydCBTdXBlclNwZWVkPyBJZiBzbywgZG8geW91IG9i
c2VydmUgdGhlIHNhbWUNCmJlaGF2aW9yIHdoaWxlIG9wZXJhdGluZyBpbiBTdXBlclNwZWVkPw0K
DQpUaGFua3MsDQpUaGluaA==

