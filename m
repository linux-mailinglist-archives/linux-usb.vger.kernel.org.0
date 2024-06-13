Return-Path: <linux-usb+bounces-11243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123A905FDA
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 02:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55D9D1C20E05
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 00:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E25C8BFA;
	Thu, 13 Jun 2024 00:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hb+BZsH2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fa/FfZaR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZFPvseRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49388BEC
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718240057; cv=fail; b=jq+sNhqkYAZ8JO7nM+tM9UgJFM8vVKU0KFJ06dkdBqVxY3cGlXkSytnLC5obcjsIy20JB4LhTcrxKT7+mTjvfepYySnXZZBWiAJqdoSg42vAQWw/1A5BAsNNk0BNW3/j/BMrKp6fLHHZDuupaukTqru8/FlpaFC2LvS5PjDFtts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718240057; c=relaxed/simple;
	bh=FAk0pGqAak5lFMAf6ATtqkJKbN67yZJ3h4pJGFxpTC0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hLUJT4pCtd35TheaogarEMpDeWTsNxKf3+enWMIt0Khe3OqHY2bhqDLumwieWhogxygDqFjhMj+Ef2N/tHQIU+eAPTdkYv78dTM1nPLd68aUJklIhevwRtWJswkVqTSBi1XzuVhE3r4wXirEZ5M4dbbVhFD7Pg/0564nDfvg4wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hb+BZsH2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Fa/FfZaR; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZFPvseRg reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CLKf9Y010154;
	Wed, 12 Jun 2024 17:32:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FAk0pGqAak5lFMAf6ATtqkJKbN67yZJ3h4pJGFxpTC0=; b=
	Hb+BZsH2GGu9spBln8+HfGqHViLDf4Q++QWA5gKyXiX3twX6oujoemNnVL3PsCtk
	BlwTKCSkkjcoPYrksUhVfkp0vDvjKq68sedw/yGCPceZdfj6Q06lN1uSTlEfHI1P
	r2qRx8gzpF80VejlC6wWhMwRrSx4UFr1HLnc6mJ4HtMaxLx58n55GtlC249iKmw8
	yxjenjfvXwcBmX81OI0m55FJ8wYOQgdV9FWogTcQ5778MgyAYIAPMpt86bpg7k94
	geke39UUgEK/YLRrAByBNkScsoKk6F8foy38dO9/X69VrkysN1t0ito0gU6EOLjT
	Y2sUli7x2LNupEa1zYkPPQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yp3mj4ymn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1718238734; bh=FAk0pGqAak5lFMAf6ATtqkJKbN67yZJ3h4pJGFxpTC0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Fa/FfZaRfDLJmAvS4OHw3h3y5o0T/DBq/HjRst4Et53rfOide/Be1f0vcd/kX6y1M
	 5J2hE1AKpx37p7PiI4GydvrpHee4enLgYFHr8psbRr5U6Ph0uHBdPsSQ1SghF5pyRR
	 W6+KCO73JIRnBAs6ND8SspNmQ4HOrnB13iSwQieTdkDDLosXndL16RvZJPwkyMonqy
	 TYUfQnBawtItl3bUp6AnfuuQ1CGT+OUjzhoYQ1FgrRXhxgNB/Av+8vix5KcR9AZhyl
	 xBuq6nf9W5ciYpaSmR4xhuQS/epplGsyzPc236gkretWj6hl7Cai4ILUCkRYCy6E8p
	 M8guREOBPggmQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C66814058F;
	Thu, 13 Jun 2024 00:32:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4E01CA005F;
	Thu, 13 Jun 2024 00:32:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZFPvseRg;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 81A8140353;
	Thu, 13 Jun 2024 00:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+7WqqMsow9lO7EdMUfwWpqR+cMfigjQtJvJ5HSa7NgNWYXj0033VSc1EMZ/TTY2PYLpuEdpWGRJbvfCKv5Ia5vYofd7IOwxmUk3LvtUK5BgZrd6PaQbgH96DWmgs29puEnWKc58ieI2YFNsTwB+/TxbwLoj0B9i8AMMAkoWXRkEC32iA0vv+EqwaTKepXqzBq5LL8t3NTaDX4nwT/BoT8lePgaIx06BZWW+numCnp/uPi021iIk2rYW2awPCzbpl4WPLUWAIcb+v4v4nID69SciZgGlnz41kltGmYxTc6pINl9rbZxtdMR29OV3B/VbiZjcif8Q5ZcUoJVvKGtq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAk0pGqAak5lFMAf6ATtqkJKbN67yZJ3h4pJGFxpTC0=;
 b=QZ8VWOnt/VCS2L9eFDZ16j54sjePExcskFkPBdCywuS7hh5aCbRJ1HRshoO5gD2OraX4I3qE6VFGY3hex+2TogFlIajmrnuZF+Xny6eZ36+F0vyUHPAPyVgxKj3SE/T80F86+Xyjd6XEloxC8oN7b8Om4WFyOCYmwUX62VvKAx8JThpcwBYyclnhi2O3ufYhBH/Q9mgTn1V3a2rJ3OHAUln0S4xsALbvIYUPG+koc+Npcz3mDHLd4TDbog9I34cmk/C349aAfKD/qd/RKJgIeO4vkZcsh8ejrFGdFnqaU2WIWfdnG+yzSGp4qhxU4SuTiL1paW0CUmV5ZSmhkZgmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAk0pGqAak5lFMAf6ATtqkJKbN67yZJ3h4pJGFxpTC0=;
 b=ZFPvseRgg7xaZJDeX9BIHBfL57fJA7rkaEYGmM4sih27SC0CckCHi7jJ7e33aCG40E2Z5/wYD60rM6tqv/Z4gPNwOpt6NsvFT+JF4DG+gsQpBEb8r1NLKCmnOktL8Vqv9nf39hkxSnS5fwgOEDDUD5A+JWIKsyou0gMlaoa0spY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 00:32:09 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 00:32:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: 
 AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4CAAPbwAIAAVn2AgACkcgCAARl9gIAFTzcAgAKm3AA=
Date: Thu, 13 Jun 2024 00:32:09 +0000
Message-ID: <20240613003204.beip3nbdl7h6zvsq@synopsys.com>
References: <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
 <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
In-Reply-To: <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV8PR12MB9261:EE_
x-ms-office365-filtering-correlation-id: 727298d4-c911-4222-7992-08dc8b4042c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230034|376008|1800799018|366010|38070700012;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dXZtYVlxTHAydEJxNnVqc00rRXBtTmQvR3RrYTRtTEN5bWt6VzNIWW9Makx2?=
 =?utf-8?B?eU1SSUs3Y1Fwc3U2d1JRbS9XT2FVdjBkcUxudnU2THVRK2UzRUZmWE5DWDEx?=
 =?utf-8?B?VlQ5QjBqZTN4STJ3V0pqT3FXUERZd0lLRWovSjc4WlQxSUUyajZmc3Mranpq?=
 =?utf-8?B?MzBOL2VWYW1JVncxT3I2TGFGdEVTSEtGMTBjcDNZZWRQcm9KTklZL3BlUXBG?=
 =?utf-8?B?dUNhMnhKOThsUW1aRlNqN3lQUS9ZMkVRcnJ2MWZxZ0oxQkN3dVFtVUVSMW5C?=
 =?utf-8?B?dXBZK3pvMWFLR285cjc3RzBKL2tJbEpaVEJFZUZqQ0w5R2UxLzMycGtFSUJK?=
 =?utf-8?B?dkcydlY2d3hoWlc5MWRRS0h0dXp1M0FPeDhZMEhIcUNyaTZ5MTZsbTNlVEM5?=
 =?utf-8?B?Zzg5Mm5jTTdhQXRaQWU4UDFTdEE0YXdDcktmVjVVZnVPV0lIYVZVU3poMzB3?=
 =?utf-8?B?M2NYbkMvbDJxeHcwYWdNazZqaSt6L1B2eTl4MCtWemdQclIwQm5LMHVmZkhN?=
 =?utf-8?B?TDNGRFhSUmhlbFZYajM5VlBFMStialVyYVFSL0lZNmR0cm1KU3lyYmNab1dH?=
 =?utf-8?B?VndQOUdiWENNK0t2Smdlc2EzMlppU0RPSUZuVzc3RWwrMnczUmdvSUNXajBS?=
 =?utf-8?B?eUNHdytEelR1RXJjOFN6T3haaUhPRWU1Sm9aNGhHaW91ZHE2ZnN4VjZ0U2xG?=
 =?utf-8?B?WUMza29yK0JmdVkyc0dJN3pkTTB5QkNDR053VS9vWllXMFh0eHM4MU1kRkQy?=
 =?utf-8?B?c3h1ckJQeEY4YnFzMWExZzZKWm1HQTlicUpTNVR3bEpkaEpQYXBMYU5WZElI?=
 =?utf-8?B?TjM1dERKSnNkcVVVVVlqSlZUOVlzYWs3ajZRZTBiZFUyWlBXVTg4am1ocHIw?=
 =?utf-8?B?c3E0V2xIamRFQWlhY2JKTzZGZ0ZiMW9EK2JzTmVSeDJnL1VLNWhCalVnUHF5?=
 =?utf-8?B?bmdRNitvbVVUR0xKT01pMFgzM2orMHcza09Wam1PMnZnVDJxZE5jSk1zRVhj?=
 =?utf-8?B?MEhxOTBGV2hPbkNHajVKSkhNZkhObWo1Ni9kaGFTRkQ1M2Z4Q1BvQUNONW1J?=
 =?utf-8?B?UHRsMVl4Z25naVBUWEQzQ1N4MHBQYUVrZVdMNzNjUzlzVkJhVlVxOEhmRG0x?=
 =?utf-8?B?QkRuaEM5ZDVWM0ZTWDJIbmhzY1piL3grZlVqZ2xDTit2Q3h1S0F0bm15aGRi?=
 =?utf-8?B?S016dXkyNGZkZXY0dDNhUDVSRlBrTjBMRHhqTXhVWmRPeXhZc2VXbXpjVkFS?=
 =?utf-8?B?YklWeTZ6OHdhOGk4VDVMaG5ZN0M5aXpKMU5UWWRLT0UzckF5WG9scVdqZEJV?=
 =?utf-8?B?Smh6bkNOSzR6RE9VM2prMlhWaVVESU1uTG13RkM2UHJuT1gxQ2ZBMDAxV2ti?=
 =?utf-8?B?MjdzdFZXa3BrVFlxbGpqYmxHWHQrVUduaGp6czdyb1NvRU5Kb3BIakxWRUQ4?=
 =?utf-8?B?MWJQZ2pncDdEUlNRNnlacVgzUElFN2NFOEsvUzRYLzlSQjJ0QTROOGJRTkhY?=
 =?utf-8?B?OFJhczJFdldhNUwrc1JmRCtvNkhDYmFoMjc3VldqKzE4SlFwR08vSWJWdG1m?=
 =?utf-8?B?bHJRRU5PS3J1bWdxallHVnZRdDJ0cThYZ0NmMlJGMkQzUUVQd3hrQXJCVnF3?=
 =?utf-8?B?UER2TGQxdnQrdFd1RXZ5OWxYUTVYMWxYMGY0QnhMNnRsLzMzNTAzdHZTcjZ4?=
 =?utf-8?B?b0p6bk1jVVpzUmpmVzhUcG1IVXlDZnN5enpzYVRsckgwQnR4djlFWGxzdFBT?=
 =?utf-8?Q?PsOriV4wRqvI6lSmzG2uAmxBQ8JFWhgvQVvCcdn?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010)(38070700012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z0NvaiswY0pIdE5BckdRekg5Q3VLK0xuS2dZM1lDVERxSTBZR3BPdHlkTjht?=
 =?utf-8?B?UDhLcE1yekJmUFF0TnZkWkx1akh2KzhKWDhNRXlEM21rcDlGTFFZUlVLSWxo?=
 =?utf-8?B?aDBjTFNSRThmUi9PTk9kMm5iUjcwWmhuWEs1bE9VTVlCSGw4dkE5UFplNSs5?=
 =?utf-8?B?ZzVPZVEwUWJwbnZhczhGSGs0bDhVREJjdEpvQkMzVXFwaERpVmM0WUszWVZ1?=
 =?utf-8?B?RmxHcDRJQ2t4ZndiSWtmdm8vZDJVNDhyQXhmR0ZXUWpGMCtLZXh4QktYbGRj?=
 =?utf-8?B?UEZtSlZkN1JndUdZcHc1VjdXZHdNcElSeVRLVlhIYlQ0MnBXbmxJZjQ1bEYx?=
 =?utf-8?B?Y3BDeDNnOWtGOEZQbkJ0WlhUK2JiTFAwcXZ0ckJ4OXl0ZS9XUUZyOUhYV0Jy?=
 =?utf-8?B?ZTJPUWJnWnF0TXFabVFqNTBnQ2tHUWo2Z3J3UFUyVGtRd09Nc2UwTVlSN2tU?=
 =?utf-8?B?NnFmbkdMQk1FTUZNK1RNMGdhK0NoTVBNenlvbTY0WUlESElXUExOWGRWcVFl?=
 =?utf-8?B?QXJjNEo3dXc3cTE5aG9BSk1lZ2VuVmJIeEVheHA1QjF2bjJvZnN2Qk1jeHZL?=
 =?utf-8?B?Zlk3emVUZ3o3eHp1SnVBK2JmSU5qTlNNanRvOUJaRzY4cVFpVnEwMzJVYkxG?=
 =?utf-8?B?RHBteHMvUWRLcnhZM2x0Wk4rSjROVVNwcUFYcXZYVzk2aTFVUTRsRDdFT2cy?=
 =?utf-8?B?OXJIb1RXOUxaZUlrdFl6YW9ZaDFSUW03dmdxdE51OGtNdXFhd0VzcEl2elQv?=
 =?utf-8?B?ZDFYQnVUM2lQNE9wMUEvNCsxZ01RbTA5Um9URVord2kvdm5uYnU5SU5KYnFy?=
 =?utf-8?B?cWJlS3RPbmR1N0RVZzh4Ti9BS2p4WnYwSTA4Rnp6L2hweHlMMVNja0FIeTlQ?=
 =?utf-8?B?bmJ3T0NzdkR2YU1MdlVWclZJTWc3U0toeUFYSnBhbVJaekV5bEZnZW9iU0ZP?=
 =?utf-8?B?bjVJU2JzS29URSswc2RPQlRPZDF2UWVhank3VU9PRnpWY2JTaU9tbDZaendS?=
 =?utf-8?B?SWFVcDJGeFN6cXlwcU8xelNta2VoQjBNK3VZQk8xc3VIdjBZeXNnMFBZQ01F?=
 =?utf-8?B?cG0weHRtNEhEdzhocmx5azlnSUU2V3pVdXRVRlA2ZElLSk0vT2ZBK3UvdVhX?=
 =?utf-8?B?bzdBdTdJUDlPeTgrUXhWZGdtcysyU2ZzTWFnZ0hMR3hGaHJFQjZISExrUk5u?=
 =?utf-8?B?aDY0ODJpNTZ0ajdORHF2ZUtDUlh5bG5EWCtkNmlVanVSQ2Vmby9wUnl5eDZP?=
 =?utf-8?B?bWRweVJFWmNsZXhYaSszRUtkUWlzcVFSMG5rNVZrNjlUalFENUJPYTVTNGY1?=
 =?utf-8?B?amxnSVUrR0hFZDRGQzV4dlh2RnNkZWVUQlJTUzFIYkp2MUh2VkJPRlZydC84?=
 =?utf-8?B?T2NkUmJmU2puMHlSUG52b0pxVkVrbm1yN0FzQ3FCRzd6cTk3U3NyM3g0WUtk?=
 =?utf-8?B?bERuKzlLSVBpRnlMcFJiV3Fyb25qMWIzK09IUTBmd1d6eCtkYUYrOGJaUFAz?=
 =?utf-8?B?Nm5GeFVnVThxNTlEbjRabEtxYUhWVFczU2cvZnEvaGc5QytZekRVeUw4bVlJ?=
 =?utf-8?B?Z1VrQnBvZThPWEZ1Q2IvYyt4Sk5UNUFyaUsydE56YXVDU3FOdDRkdXNOcGVE?=
 =?utf-8?B?c3I2S3JUMm9rYklVZ3N4QnFwa1lwYUVnYWFNZHlIMHBrenBTNjFORjJsOXlz?=
 =?utf-8?B?MzVoV1htMzI4aHorYUdvNHQrNXNod1R3T0l2YkhHVU1sTGtEd2UrS1pDaExF?=
 =?utf-8?B?UHFBVHB1c3VOclBFMDIyNkJlNlZlMXRKK0xvemtsMkl3OHJ6bFlqTkN0WkVO?=
 =?utf-8?B?empDRXBQdjMrZ3lxNUpxRjl0bGdJams2N2QxcHo3Q2Qrcm52bXFaZ2wvV0hW?=
 =?utf-8?B?UXdFdkF3RTYzMUFkQWdKUklrSmxoN1JQSzZZdWd1UThMNldyVEdHTVhabWtY?=
 =?utf-8?B?aHQwWWcrTGdMdVJkYzg3M3UwNUZVeitpUWJlbXNwWGREVm5ISlZmQXpCQWV2?=
 =?utf-8?B?RmtmaHRueHNIVnE3SUg1d3llYlMydWdhbnZ5RWRQU3pFOWpwQS9SZWNwdWI1?=
 =?utf-8?B?Y0h1MkVjaGxlVVRqbStMZ09QVW9JZHFCK01XZG5kWC80RXJjWm03bW0xRG54?=
 =?utf-8?Q?pPUtmrsi+rA4ptG2cZKz8eIML?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C265B23717A66C4882D824EF32E43690@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UNxJb5xj59oIbSglqd/X03mYYWLTzEnFHl2AbvJjVBAvYPB4z+D0uapN3Z1c6+Ur6zddcqtb+ahpmM2KiiwW7BLy9HqQK22dwm1nYUUwtCfc93oqm2ZUBRtHe9yrtqJ61UhXMqNHNxSAkWhrnaTDgl/lvn62a1P1TvyaM85bCNhkMR+0OOWO1RusESIpeDtr18ZMMGZxwqQh2FYNsujsFQduTRgJlALOlbwGJfkFg0c2qYl2YOBes7rf/aLEcwAbd/kf2SxdNjq6wHi2nzqzC/FkDCwyLYuhUox9OSwVZ8MiBF/1jYFcNntf8RPpxW+1pWwGNFnUa6zxGeWlQXWUhm6m9Nm8eQuobBtlFvMeDQoNTgmtDBkqmBTjL/hHTHFidyPR/Qb43z763NSW6d1n0zYa3LbvJMWhA1sP1jp6hJVkQOVGo4We3tWDrxKy2RFRDvSta6sqyxUzTBeH/Dp//NfmRP1axycPRIMFPd9Df4aRNNCD4a8sMQzeQo89gT6+Xg6B+l8rcGeh7WFvICHG5hJ6JklKmURpQgSzAI+clLOJ4uOh4oEf1U2OACoNR2fKp33mkobPag5K0UutwjaSDQUX0BHtJKm29ljWu8booWGtRJJGzuxgfZc+LNier+k+UeH7RUP3EcFfI7gzwGl3NQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727298d4-c911-4222-7992-08dc8b4042c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 00:32:09.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/un+PiG8Tch+Pf9HpMJtt+n/YsCc7f71aG1YSWPKwHscZ8kOE8XR9LUBlaVrzF4L9ukiaZGoSBgWwyYvtp0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
X-Proofpoint-GUID: koMYZFXLDOBq2EM38OaiLRMANjUxotBv
X-Proofpoint-ORIG-GUID: koMYZFXLDOBq2EM38OaiLRMANjUxotBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=944 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406130002

T24gVHVlLCBKdW4gMTEsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiBPbiAwOC0wNi0y
MDI0IDAwOjU3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gRnJpLCBKdW4gMDcsIDIwMjQs
IE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gT24gMDYtMDYtMjAyNCAyMjoyMSwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBPbiBUaHUsIEp1biAwNiwgMjAyNCwgTWlrZSBMb29pam1h
bnMgd3JvdGU6DQo+ID4gPiA+ID4gT24gMDYtMDYtMjAyNCAwMjoyOCwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPiA+ID4gPiA+ID4gT24gV2VkLCBKdW4gMDUsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiBPbiAwNS0wNi0yMDI0IDAxOjA2LCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+ID4gPiA+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gT24gVHVlLCBKdW4gMDQsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gPiA+
ID4gPiA+ID4gT24gMDQtMDYtMjAyNCAwMzowMywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IE9uIE1vbiwgSnVuIDAzLCAyMDI0LCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBXaGVuIGRpc2Nvbm5lY3RpbmcgdGhlIFVTQiBjYWJsZSBvbiBhbiBMUzEw
MjggZGV2aWNlLCBub3RoaW5nIGhhcHBlbnMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBpbiB1c2Vy
c3BhY2UsIHdoaWNoIGtlZXBzIHRoaW5raW5nIGV2ZXJ5dGhpbmcgaXMgc3RpbGwgdXAgYW5kIHJ1
bm5pbmcuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gVHVybnMgb3V0IHRoYXQgdGhlIERXQzMgY29u
dHJvbGxlciBvbmx5IHNlbmRzIERXQzNfREVWSUNFX0VWRU5UX1NVU1BFTkQNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBpbiB0aGF0IGNhc2UsIGFuZCBub3QgYSBEV0MzX0RFVklDRV9FVkVOVF9ESVND
T05ORUNUIGFzIG9uZSB3b3VsZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGV4cGVjdC4gQXMgYSBy
ZXN1bHQsIHN5c2ZzIGF0dHJpYnV0ZSAic3RhdGUiIHJlbWFpbnMgImNvbmZpZ3VyZWQiDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gdW50aWwgc29tZXRoaW5nIHJlc2V0cyBpdC4NCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBGb3J3YXJkIHRoZSAic3VzcGVuZGVk
IiBzdGF0ZSB0byBzeXNmcywgc28gdGhhdCB0aGUgInN0YXRlIiBhdCBsZWFzdA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+IGNoYW5nZXMgaW50byAic3VzcGVuZGVkIiB3aGVuIG9uZSByZW1vdmVzIHRo
ZSBjYWJsZSwgYW5kIGhlbmNlIGFsc28NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBtYXRjaGVzIHRo
ZSBnYWRnZXQncyBzdGF0ZSB3aGVuIHJlYWxseSBzdXNwZW5kZWQuDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IE9uIGRpc2Nvbm5lY3Rpb24sIGRpZCB5b3Ugc2VlIGRpc2Nvbm5lY3QgaW50ZXJydXB0PyBJ
ZiBzbywgaXQgc2hvdWxkDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHRyYW5zaXRpb24gdG8gVVNCX1NU
QVRFX05PQVRUQUNIRUQuIFRoaXMgY2hhbmdlIGRvZXNuJ3Qgc2VlbSB0byBkaXJlY3RseQ0KPiA+
ID4gPiA+ID4gPiA+ID4gPiBhZGRyZXNzIHlvdXIgaXNzdWUuIENhbiB5b3UgcHJvdmlkZSB0aGUg
ZHJpdmVyIHRyYWNlcG9pbnRzPw0KPiA+ID4gPiA+ID4gPiA+ID4gVGhlIGRldmljZSBkb2Vzbid0
IGlzc3VlIGEgZGlzY29ubmVjdCBldmVudCwgSSBkaWRuJ3QgaGF2ZSB0cmFjaW5nIGVuYWJsZWQN
Cj4gPiA+ID4gPiA+ID4gPiA+IGluIHRoZSBrZXJuZWwgYnV0IGFkZGVkIHNvbWUgZGV2X2luZm8o
KSBjYWxscyB0byBkZXRlcm1pbmUgd2hhdCB3YXMgZ29pbmcNCj4gPiA+ID4gPiA+ID4gPiA+IG9u
LiBBZGRlZCB0aGlzIHRvIGR3YzNfcHJvY2Vzc19ldmVudF9lbnRyeSgpOg0KPiA+ID4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBkZXZfaW5mbyhkd2MtPmRldiwgImV2ZW50OiAweCV4
IHR5cGU9MHgleCIsIGV2ZW50LT5yYXcsIGV2ZW50LT50eXBlLnR5cGUpOw0KPiA+ID4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBXaGVuIGRpc2Nvbm5lY3RpbmcgdGhlIGNhYmxlIGZy
b20gdGhlIGhvc3QsIEkgc2VlIHRoaXM6DQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gPiA+IFvCoMKgIDUwLjg0MTQxMV0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NjA4NCB0
eXBlPTB4NDINCj4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgIDUwLjg0MTQ1N10gZHdjMyAzMTEwMDAw
LnVzYjogZXZlbnQ6IDB4NDA4NiB0eXBlPTB4NDMNCj4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgIDUw
Ljg0MTQ5NF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NjA4NCB0eXBlPTB4NDINCj4gPiA+
ID4gPiA+ID4gPiA+IFvCoMKgIDUwLjg0MTUzNF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4
NDA4NiB0eXBlPTB4NDMNCj4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgIDUwLjg0MTU3MV0gZHdjMyAz
MTEwMDAwLnVzYjogZXZlbnQ6IDB4NDA4NiB0eXBlPTB4NDMNCj4gPiA+ID4gPiA+ID4gPiA+IFvC
oMKgIDUyLjY1MDk5MF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4MzA2MDEgdHlwZT0weDAN
Cj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gVGhlICIweDQwODYiIGFuZCAi
MHg2MDg0IiBtZXNzYWdlcyBhcmUgZW5kcG9pbnQgZXZlbnRzIHRoYXQgb2NjdXIgYWxsIHRoZQ0K
PiA+ID4gPiA+ID4gPiA+ID4gdGltZSB3aGlsZSBjb25uZWN0ZWQuIFRoZSBsYXN0IGV2ZW50IGlz
IHRoZSAic3VzcGVuZCIgb25lLiBBZnRlciB0aGF0LCB0b3RhbA0KPiA+ID4gPiA+ID4gPiA+ID4g
c2lsZW5jZS4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gSWYgeW91IG5l
ZWQgdHJhY2VzLCBwbGVhc2UgcG9pbnQgbWUgdG8gYSBkZXNjcmlwdGlvbiBvbiBob3cgdG8gb2J0
YWluIHRoZW0uDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiA+IExldCBtZSBrbm93IGlmIHlvdSBydW4gaW50byBpc3N1ZXMgZm9sbG93aW5nIHRo
aXMgaW5zdHJ1Y3Rpb25zIHRvDQo+ID4gPiA+ID4gPiA+ID4gY2FwdHVyZSB0aGUgdHJhY2Vwb2lu
dHM6DQo+ID4gPiA+ID4gPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
ZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvdXNiL2R3YzMuaHRtbCpyZXF1aXJlZC1pbmZvcm1h
dGlvbl9fO0l3ISFBNEYyUjlHX3BnIWJhaGZqaWw1SEVVcS1mT0hBd0RmdXN1dExKQ0xvZ25meUxI
VEZMaVNsVnVab3Rwcjk5WEJHZzduQjB6UlJuTkZfTTFwcUVLY1ZhNEt4Tkp3aDNfRjJkWld3VktU
a1VZJA0KPiA+ID4gPiA+ID4gPiBJJ3ZlIGF0dGFjaGVkIHRoZSB0cmFjZXMgYXMgYSB0YXJiYWxs
LiBIb3BlIGl0IHN1cnZpdmVzLg0KPiA+ID4gPiA+ID4gR290IHRoZW0uIFRoYW5rcy4NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBBdCB0aGUgc3RhcnQsIHRoZSBVU0IgaXMgdXAgYW5kIHJ1
bm5pbmcgKGFuZCBkb2luZyBldGhlcm5ldCttYXNzIHN0b3JhZ2UpLiBJDQo+ID4gPiA+ID4gPiA+
IHNhdmVkIHRoZSB0cmFjZSBhZnRlciBwdWxsaW5nIHRoZSBVU0IgY2FibGUuDQo+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gICAgRnJvbSB0aGUgY2FwdHVyZSwgd2UgY2FuIHNlZSB0aGF0IHRo
ZXJlJ3Mgbm8gc3lzdGVtIHN1c3BlbmQsIHNvIHRoZXJlJ3MNCj4gPiA+ID4gPiA+IG5vIHNvZnQt
ZGlzY29ubmVjdC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQmFzZSBvbiB0aGUgc3VzcGVu
ZCBldmVudCwgeW91J3JlIHJ1bm5pbmcgaW4gdXNiMiBzcGVlZCAoaWdub3JlIHRoZQ0KPiA+ID4g
PiA+ID4gaW5jb3JyZWN0IFUzIHN0YXRlLCBzaG91bGQgYmUgTDIpOg0KPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiAJaXJxLzk0LWR3YzMtNjMxICAgICBbMDAwXSBELi4xLiAgIDE0OS4xMzkyOTA6
IGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAzMDYwMSk6IFN1c3BlbmQgW1UzXQ0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiBUaGUgRFNUUyBmcm9tIHRoZSByZWdkdW1wIGluZGljYXRlZCB0aGF0IHlv
dSdyZSBzdGlsbCBpbiBMMiBkZXNwaXRlDQo+ID4gPiA+ID4gPiBkaXNjb25uZWN0ZWQuIExvb2tz
IGxpa2UgdGhlIHBoeSB3YXMgdW5hYmxlIHRvIGRldGVjdCBhbmQgd2FrZXVwIGZyb20NCj4gPiA+
ID4gPiA+IHRoZSBkaXNjb25uZWN0aW9uIHRvIG5vdGlmeSB0aGUgY29udHJvbGxlci4NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gQ2FuIHlvdSBleHBlcmltZW50IHdpdGggc2V0dGluZyAic25w
cyxkaXNfdTJfc3VzcGh5X3F1aXJrIiB0byBkaXNhYmxlDQo+ID4gPiA+ID4gPiB1c2IyIHBoeSBz
dXNwZW5kLg0KPiA+ID4gPiA+IEFkZGluZyBzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsgZG9lc24n
dCBtYWtlIGEgZGlmZmVyZW5jZSwgYmVoYXZpb3IgaXMNCj4gPiA+ID4gPiBpZGVudGljYWwuDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBEb2VzIHlvdXIgZGV2aWNlIHN1cHBv
cnQgU3VwZXJTcGVlZD8gSWYgc28sIGRvIHlvdSBvYnNlcnZlIHRoZSBzYW1lDQo+ID4gPiA+ID4g
PiBiZWhhdmlvciB3aGlsZSBvcGVyYXRpbmcgaW4gU3VwZXJTcGVlZD8NCj4gPiA+ID4gPiBKdXN0
IGNoZWNrZWQsIHN0aWxsIGNvbm5lY3RzIHdpdGggc3VwZXJzcGVlZC4gV2hhdCBsZWQgeW91IHRv
IHRoaW5rIGl0IHdhcw0KPiA+ID4gPiA+IG9ubHkgaGlnaCBzcGVlZD8NCj4gPiA+ID4gPiANCj4g
PiA+ID4gQml0KDQpIG9mIGV2ZW50IGluZm8gKDAwMDMpIGZyb20gZGV2aWNlIGV2ZW50IHZhbHVl
ICgwMDAzMDYwMSkgaW5kaWNhdGVzDQo+ID4gPiA+IHVzYjIgc3BlZWQuDQo+ID4gPiA+IA0KPiA+
ID4gPiBSZWdpc3RlciBEU1RTIGZpZWxkIDI6MCBpbmRpY2F0ZXMgZnVsbHNwZWVkLiBFdmVuIHRo
b3VnaCB0aGlzIHdhcw0KPiA+ID4gPiBjYXB0dXJlZCBhZnRlciBkaXNjb25uZWN0aW9uLCB0aGUg
bGlua3N0YXRlIGRpZCBub3QgY2hhbmdlLCB3aGljaCBsZWQgbWUNCj4gPiA+ID4gdG8gdGhpbmsg
dGhhdCB0aGUgY29ubmVjdGVkIHNwZWVkIGRpZCBub3QgY2hhbmdlIHRvIEVzLkRpc2FibGUgZWl0
aGVyLg0KPiA+ID4gPiANCj4gPiA+ID4gPiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIG5ldyB0cmFj
ZXM/DQo+ID4gPiA+ID4gDQo+ID4gPiA+IENhbiB5b3UgYWxzbyB0cnkgdG8gZGlzYWJsZSB1c2Iz
IHBoeSBzdXNwZW5kIHdpdGgNCj4gPiA+ID4gInNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayIgaWYg
eW91IHRoaW5rIGl0J3MgY29ubmVjdGVkIGluIFN1cGVyU3BlZWQ/DQo+ID4gPiBBZGRlZCB0aGlz
IHRvIHRoZSBkZXZpY2V0cmVlLCBidXQgYWxzbyBubyBjaGFuZ2UgaW4gYmVoYXZpb3IuDQo+ID4g
PiANCj4gPiA+IA0KPiA+ID4gPiBQbGVhc2UgY2FwdHVyZSB0aGUgdHJhY2VzIGFnYWluIGlmIGl0
J3Mgb3BlcmF0aW5nIGluIFN1cGVyU3BlZWQuDQo+ID4gPiBJJ3ZlIGF0dGFjaGVkIG5ldyB0cmFj
ZXMuIENvbm5lY3RlZCBhdCBzdXBlcnNwZWVkIChob3N0IHJlcG9ydHMgInN1cGVyc3BlZWQiDQo+
ID4gPiBpbiBpdHMgZG1lc2cgbG9nLCBhbmQgdGhlIHJlYWwgZGF0YSB0cmFuc2ZlciBzcGVlZCBp
cyB3YXkgYWJvdmUgaGlnaHNwZWVkKQ0KPiA+ID4gDQo+ID4gPiBJIGFkZGVkIHJlZ2lzdGVyIGR1
bXBzIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIGRpc2Nvbm5lY3QuDQo+ID4gPiANCj4gPiBUaGFua3Mg
Zm9yIHRoZSB0cmFjZS4gSXQncyBpbmRlZWQgb3BlcmF0aW5nIGluIFN1cGVyU3BlZWQgaW4gdGhl
DQo+ID4gY29ubmVjdGVkIHJlZ2R1bXAuIEhvd2V2ZXIsIHRoZSBHVVNCM1BJUEVDVEwuU1VTUEVO
REVOQUJMRSBpcyBzdGlsbCBzZXQuDQo+ID4gQ2FuIHlvdSBkb3VibGUgY2hlY2sgaWYgeW91IHBy
b3Blcmx5IHNldCB0aGUgInNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayI/DQo+ID4gDQo+IEkndmUg
YXR0YWNoZWQgYSB0cmFjZSB3aXRoIGJvdGggInF1aXJrcyIgaW4gdGhlIGRldmljZXRyZWU6DQo+
IMKgwqDCoCBzbnBzLGRpc191Ml9zdXNwaHlfcXVpcms7DQo+IMKgwqAgwqBzbnBzLGRpc191M19z
dXNwaHlfcXVpcms7DQo+IA0KPiBJbnRlcmVzdGluZ2x5LCBpdCBzdGlsbCBnb2VzIGludG8gInN1
c3BlbmRlZCIgbW9kZSB3aGVuIEkgcmVtb3ZlIHRoZSBjYWJsZS4NCj4gDQoNCldhaXQsIEkgdGhv
dWdodCB0aGUgaG9zdCBpbml0aWF0ZWQgdGhlIHVzYiBzdXNwZW5kLiBEaWQgeW91IHRyaWdnZXIg
dXNiDQpzdXNwZW5kIGJ5IHB1dHRpbmcgdGhlIGhvc3QgaW4gc3VzcGVuZD8gT3IgZG9lcyB0aGUg
c3VzcGVuZCBldmVudCBvbmx5DQpjb21lIHdoZW4geW91IHBlcmZvcm0gYSBkaXNjb25uZWN0Pw0K
DQpDYW4geW91IGNvbmZpcm0gaWYgdGhlIHN1c3BlbmQgZXZlbnQgd2FzIHRoZXJlIGJlZm9yZSB5
b3UgZGlzY29ubmVjdCB0aGUNCmRldmljZT8NCg0KVGhhbmtzLA0KVGhpbmg=

