Return-Path: <linux-usb+bounces-11793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69491C7C8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 23:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B416A1C26ED9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 21:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDDD78C71;
	Fri, 28 Jun 2024 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n+oEolUZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F4ftShLP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="McCbgpd9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C207346A
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608790; cv=fail; b=YSQTuSy87aeDQMXWSQw+YVPngPa8hJGb/Cgfian+aUIk0+dU2KQG0f8bdWwSYN9Hmc4uN466GyfV5gcgk7vaCsMiHkY2UeJBKwSToSENO5sYo7epBOSiXEMbKrs46OH3+dVhDH2gEhCYmpdusZO6F3rBTR1dEApblbMQ2lINSNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608790; c=relaxed/simple;
	bh=IQxk8kCEk4+27aGIf5GfSFtWgIWh48yqPrz92TpqTUs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtfskS2weg28FBF6awWNpts6+U4GjEOez1fDYkx4cCPpmJUQpLTZE8en9kCSih49ZrMRXRNOo+WOWazgnYLEeqTljRV9VJpLlzfCWxFJtZ8IJY2v1MtEfKzUCoB3SqG6l+4cyIsN3uJeffy1yCtjpDkc0PnQWHfPdj5Y+Ty/z94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=n+oEolUZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F4ftShLP; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=McCbgpd9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SKRTv7016772;
	Fri, 28 Jun 2024 14:06:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=IQxk8kCEk4+27aGIf5GfSFtWgIWh48yqPrz92TpqTUs=; b=
	n+oEolUZ6SZorUeh4JKSr21QKa9TuevvfNCRUYRUGzSj6znMpdVgsG0d/nraypqS
	jAm1dLyRcMiFdax9UDTvwmrckdROi8xI78FNqpByztIglirxK7m5xMf1NVY14BDo
	fl2vTzwH5dmjJeHW+VJYNYG17B4zdSfqHhHG9A7JtEzLmFf4tCHIqz/NxRjogXiS
	Z+8JsJo4nkUdJpZ+mde75DbyFG+9wh+eL5zZuROXrgvxGLrdl//SnGPLwtbDXYRQ
	OGwiEsVYXvT5wtREvhIKpqomyXA6N3xYXAAuSqd6cwGCJf2SyFtxMnvkYsq9CUsQ
	dNrUAC4ZdOqq12rPmGyN8g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ywwmkcg75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1719608779; bh=IQxk8kCEk4+27aGIf5GfSFtWgIWh48yqPrz92TpqTUs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=F4ftShLPSw/XKJ2lVrTyco4U3Y1JDurxLuZ8VeRGjFUJPxmTwuyt2vUWaQ6qSBPnp
	 MqJXbbkxctYXSwipk1jkO35rfC97YjazHqavcNSLqgIE0kEVp0jIiUeUz1MrEbbH/3
	 vG3+lTYTA1ZEf6tYA3VLdh/4vHUCNRQxXj23qKeYG4Mrjo4kCTdfKYq8AqF18soRGX
	 b8is4D78gSl13yWKZP0ezBY9fg+oMI2Pdw1flfT83nUZUYMhEOXAu/z/WJtdQOGF/j
	 XNcEoIvbQiGD2G2vDMr9MDNzJVg76AEgSRic4SVSDfu97lhyFht4/HXg3NW8w7YVyy
	 uJIyByPot4SKQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E4EF40467;
	Fri, 28 Jun 2024 21:06:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A1B5BA006D;
	Fri, 28 Jun 2024 21:06:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=McCbgpd9;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C756F40493;
	Fri, 28 Jun 2024 21:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBOfrYVd+4IN1BxPeNE2hmPNsX/R9BK+SW9hw7FNsrHcr972sAqt42kwf7oRMERXDMzPIxCxn7PjFJAC92Gif3vLF4hoAyYOhO7HK0ycvAYxbNxVM15cYsMi+shNB1petnQJQkes8o+eLbo1OHsk2OZNWzpC/9hz7jf+q1lWp+tAUhWzRe3mGj3yLgegL9f9IrUrT9ESDpFafvIsbjZ9sxeBXu1znzPOKEGuZl190NrhLWGz2J4IfiCffhL3C9P4XKQzNkxdVFzzXEGB+URKZQXJN7DLImzYBk9AVjy22Q3oMGsYyr5/TOf9xX+luyYPznV0z6o4jUuS+cRB2lS/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQxk8kCEk4+27aGIf5GfSFtWgIWh48yqPrz92TpqTUs=;
 b=Pv2baXQzaaTNESISvEtYxgz603qXg+3rvfmK05KEAQSeWTp00XdAaTvswlcimHjU6KwQZZYoOimL+YL1QAM6a6D/lbGtGlsBecrQO7iySRKKHHDrDyzwiSJZfGFN8opaWI3oQcAlGdM6UIXMLSsAZk9amahQ53hzLJwsXrHYA2KHFAhQPY7AhjtS3ztYBSOeUaiHbAZAFIiARtKPbBUY07QG3R5CLyEZdfluqe/ejR0raydmQhxlXtAkMuixqRdRlLLEBd0E2bKm7RqiRiaRZ1HK03Ksq/9nGQnGH5aG1Rr8BNEau+oJmtnz1VAQSkgAC+QyBrGsYmfv1jiJZGqfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQxk8kCEk4+27aGIf5GfSFtWgIWh48yqPrz92TpqTUs=;
 b=McCbgpd9LnFb8wx0yerATmMVj/7ZFYe/wvwwJwyt2p4l3vpwPUytkuhdm8YsZPgqF82TtCtawX1Szl9oNB6AP7xxbnsq16IKR8s2NQsDbaydjxPiC7ClJMUk7VEUwalxUFg/IC5H8O6zw1GksnFtg/DFM8mAm1zTXM+8z+2jp9s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 21:06:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 21:06:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Panther Lake
Thread-Topic: [PATCH] usb: dwc3: pci: add support for the Intel Panther Lake
Thread-Index: AQHayUz34W8R2hJZ00yN0SyjhqprcLHdq2YA
Date: Fri, 28 Jun 2024 21:06:10 +0000
Message-ID: <20240628210610.ecbrqu6tgywpsrut@synopsys.com>
References: <20240628111834.1498461-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240628111834.1498461-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8257:EE_
x-ms-office365-filtering-correlation-id: 32bdcbab-21a1-4633-24e4-08dc97b622c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N2VqTExoRkZldmtEYks2aWVaRllCTyt4OWVIRDV5Qmx6azl1eUdSUDY0ZEQv?=
 =?utf-8?B?OVpic3h2Q0V0VW11WThsVTlhR1lDakQ5L21jRkxwSlNLU0d0cUJZY0RxdFlo?=
 =?utf-8?B?eXRHNlovN0hZQlFuckdNMzJkNlJocTI1QnBSSCtRaGZFQzJhRE5EUjFib012?=
 =?utf-8?B?TTdFaFR4OERGandCbFJnOVBMcE1RUEIwb2o3TE5PYlVwR1dzbzloWkhqYlVS?=
 =?utf-8?B?VSttdEhrRXBsQkFLZFl6MnMweUFqVWNQOGs3VHNQMGIvSjNSZG8yWUI1N0JM?=
 =?utf-8?B?R2JROElqa1plS2FCeGx4eHFiWnRTWWkzTGRMZk5iemkweURhL2p1UkNnL1hB?=
 =?utf-8?B?ZG1LYVFEL2FVamlVKzU1ZGcwSEc0SEtvMlYzUGViTy9xTm1uMzB2SWZjWlB5?=
 =?utf-8?B?WGR6c0ZOYlhyVzh2ekFBMG15WTFqYTB2ZzlYbGhxekdQd29ULy9ad29VeUJ2?=
 =?utf-8?B?Njk2L1dUVGx3WDdvMkZ0SUNGNzhFNXFiWUQyNG5HRW41aTBBdkJHbXY3U1hk?=
 =?utf-8?B?aGZMSlZDaXU4clVXVnRQWXYzUldSNmlRdEQyRVRGQkVXMldLWXducUhPSUcy?=
 =?utf-8?B?S2dUSnRpU2N6cWlSZnZPRG9GTXRGUWhkY1pyZUNDR2pBVmRmaW9Ca2FYSXcx?=
 =?utf-8?B?S2ZEenZHZy9PcTdmeGRIK0t5U3phM3FhVTFCanVmZUhXa1VlWHJvdnJ4MU1K?=
 =?utf-8?B?L2RwNEhhZVc1Mld1aVZobUdDM1NPMW9qUm5Qc2pUeU5tU2RUbFpSaWo5L0lN?=
 =?utf-8?B?ZWY3RHd0Qk4ycFNUQ2g4MnVxcGRGdVpiaUhmVTFFNTRnbk1aQkF2RytwUXpo?=
 =?utf-8?B?OTVUUy9COXlGK3VSaWlmcWdUWW1weHlvMUpKaklWM0ZQYWxHRjV3RXZRYkNH?=
 =?utf-8?B?S29MTW40SzJYbUdLQjFlSkJFSmFpa29Qb29SM2k2bGc0dmZMQWJHR0FmQ1gv?=
 =?utf-8?B?OGowR1RpcGJlUC9BcGViT0hBa2wvRkgrNjBjK1dRVVhmQ05wMEozbC9leGhT?=
 =?utf-8?B?N2VOU0hvbWVSZXdiSTYzT25FL0lFREE0aWIrcklXTlZaaDE4N1ZOWHdaNXVB?=
 =?utf-8?B?VUxQcUJickRSOXc2SHMzOTZ5WDFFV0RONURFbFQ5QStGTzR5ZFk3NFdJd1Vn?=
 =?utf-8?B?SXVYODI1bm9vOHNONXlKSzdNRGxuRFVXcU1CaHQrMm10Ni9tV2hDYzBXUjEz?=
 =?utf-8?B?QjBndTdyWkZkV0VFYkpSNUVDTmVqMi9xelNVMnhvdEtWdFJVMCtnK2dSOWZr?=
 =?utf-8?B?RkFtNCtWODJ2LzM5WjBVeWg2UEJJRC9iL1puZkQ5cFRrN0dCTGVDSStURG9I?=
 =?utf-8?B?ajRPWnZ6cCtOWGJhbXFJeURvVStjVWZWc0FpS24rMXQ0aXh0VXJRMFRLd2xn?=
 =?utf-8?B?anBuYmsyZldOWXpQT3M0T2xybnlUZDc4c3lUaU5qT1Y5KzNKaVN0RTJBLzIv?=
 =?utf-8?B?dVp4WWJsZkpzS2V3a2tEOEpJbkhKTXV1amgrZXdCbk0wemNZSWdoSnVNbGpR?=
 =?utf-8?B?ZysyZ3ROTzFkWFh5b3BRS0xWRFIvNXZRN0RmVlgyWDlWV3p0QnhuWWtkVGE3?=
 =?utf-8?B?VmM4czFIVEozZm8wMWJ0d0tSQTlKa2xaUU1nZTAzSkh2aUx0RVRVSlNNMm1D?=
 =?utf-8?B?NVBpbUZXdFFiVGMzejFGQm1OQ29Rbk9GM0lXTTVibVFDMU9hZGpVTWJnSmVx?=
 =?utf-8?B?NnRObGtoYk81NTgzdzZmRXRXUUxSWlJXOXhSUjk5eUpMZ1FuOC9kNFRkalRG?=
 =?utf-8?B?OTVzZ3ZxVGRucURBQ0ZVOFhQMHk5TWQrcXFHWTVYVmdHelJRR1JYNzV6N0t2?=
 =?utf-8?B?b0pYK2U2emVkbXlEWlU0MHkyUkJDYklMOG1vRzNtS1hMbjhsVGIrUURiNDRz?=
 =?utf-8?B?alN0Vys2b1haK2pXNjA5L1BWTHlqNzdXWmZ6QUJuc1NRQnc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?am9ERG8relMzd3NWWEpMb240UGE4ZUoycThaTmw4WXBhdVZ2MW5NNjkrQWVo?=
 =?utf-8?B?SzhLR2d4YUJqeUF6cEFlSkVEUkdVSk83R2JOSFB3dkNHMjYyT3hiVUJUL05k?=
 =?utf-8?B?aHE0ZEdaczdFYWVXMWpDTEkwcnRPcEF2L0N0bmxXQzhHUTFCVDV6OEJ2T1ZE?=
 =?utf-8?B?M0k3MW5vOGdVa0pkM21qeW0rS2VrOVl2a0FLWkxvRlNFdTBJSzdGNDE5cTRh?=
 =?utf-8?B?eGxKQVZPVFVUclEyUTl4TmY5TjB4aFJ3VWVjQ2dYSXNWOUNjWEJkQ01XU1U4?=
 =?utf-8?B?R1hrb0JGamFpbzR6WTVSY0ZkRithclhGd1dzcmJ3LzlpQ1N6aTg4Z3NSbWEw?=
 =?utf-8?B?ODZONjBuN1pxK0wxbkdLa0V5RlVTWDhGS0JWMUdpNkpNZnpCSXFQbmlOdDlZ?=
 =?utf-8?B?VXZDRW1LcDZmSzZBd1J4aGRYdUxTMTl1NFpJaDVwNTZGZlY2aGsrY29BZXp4?=
 =?utf-8?B?dHlsZFYyVDRTWE51cXNKWERPQjYwUC9kTVNJbFpOQ0FqUkxDSHdSTnZCY0p3?=
 =?utf-8?B?ckFXTW8xeXoyd3VjVzRmWEhPVzQ5MUJUcThIR1pRYk1ZTFpBK3V0N1d4a3ZE?=
 =?utf-8?B?ei81VDBOZk1XN3FwK0JNYzI0VlZaZ0ZZWi9VV1NLL1kxSkQ4TzdtY2kvMG9O?=
 =?utf-8?B?ZXhoZ1ZlVVNoR0RidmRPMHVJYkhNS1RydTIvQUl4UERXYk1aV2t2Tmw3cEd3?=
 =?utf-8?B?ZFlhYzdKMVRwWnZUWmJwYVBBV0wyeHU1aWgvcksyRGZYbmdIUkp2MzVjU3hi?=
 =?utf-8?B?Z25aRVVhcWh6eWxEREJTSmp2b2tiMkRmYjJTRGxrMitDODdGMXVrUEM4bUdW?=
 =?utf-8?B?TS83aE1CaXZraFpSZUtwUlVocXRLdkY4bENkOXRxck4rbmY3K2poOVRFYVlQ?=
 =?utf-8?B?bmVDQmd6UXZZZUVuZmVpaldCZ2ppblBZNkZETkw5RnM0azQxTDVrU2ljejZ3?=
 =?utf-8?B?eHcvc2Q1eEZyTlJzVEdUWmFTNEd3TktaUkp1WVJMMTIrczR2dEVEMFdTVnJn?=
 =?utf-8?B?VTVxUFpFYTU3b3ppN1pkRlhHTzd3c2NFS3VOVlFEYnNBRTZCWlp3Q0VPRFpq?=
 =?utf-8?B?UFZkbnc3ZGZzSk43U3dUUmxlS1IwcVFJaXNUQmh4SWs4b0lJMkhDYXRWU0Mw?=
 =?utf-8?B?aDVaTjhJc0RMS3czZStxNG1XK2ZJNjFiT1Z0Wm1Fd3g4NG9QY3hhd05PT0JB?=
 =?utf-8?B?Uk5rQThrNGlWaWhMd2JTM0M5d2J6YTk3VG9CeTZVRHE0YnJCd2ovNWJyUE1L?=
 =?utf-8?B?bnNmNThXYTVDK2ZsdVZweDl2T0hxaFhEZ2I1cHR0bDhBY1VaWWhpaTRtb1NT?=
 =?utf-8?B?b29oU0p5RXVFQ2J0amh2UnNwSnZVcnVrYXRuUW85NG1wVGc5U1pQUVBQWTFs?=
 =?utf-8?B?ZUYwT1NUdlJKaHVOMFhyMFBVU2d6OG00VGRxN1E1cTcyZ3MxdCsyTHU3bzY4?=
 =?utf-8?B?OUZ2U0RrYnFUb0IveGVPZUphK0FVaU9uUHczU2RpU2FHYWNpUW9LZHZGWGVC?=
 =?utf-8?B?TFcrSXNmQ2VvQTJrczdhQnRTc0QzbHFtRzRLTEl2dk1LZkZOTmk2dFhJU2o4?=
 =?utf-8?B?NzJVdWtnT2x5dmlkUFVtTFVtL3FNQ1oycGo3c2ZGZHdKT3lyaytwZUZadHVC?=
 =?utf-8?B?clE2K3M4V1J2Uk5EczZ5aGdPZURRcEZ5Q1pPeUE3R21XL09kTE0yQm1VbkxT?=
 =?utf-8?B?NnJxRlNQN01kMGZkMlZtNFVzQ2VYTHVHeGpYOUI2OFBrOUM4aEpkM1NRVG4w?=
 =?utf-8?B?K2VWUjRzTFVMdWR2d0t0Sk8rUjBvSUR0ZjFCM1RLU0VCODJKUVY5MjIzT0VK?=
 =?utf-8?B?elpEODZZelkyb2hGMUtPSVNiVVdwSVFrR2FQL3J3c3hVT2lCUGEvMm1pbnhw?=
 =?utf-8?B?NWhxWlBkdG1ZTk1lS3JuYzdIWXY3c0NDSjZOZDRhTFNlUXNNeDBvdms2dlNr?=
 =?utf-8?B?N3hJTFc2MkJULzdCMExrSzlDeHpGck54d1hXanhoa1pqaTEvWjFZdlFZTVpt?=
 =?utf-8?B?UHpvbjYxS3l0eUtKbE9RMWdjVmwvS1BRaW9MRXRvd21ZUUdDa2xIb3EwWXpq?=
 =?utf-8?B?YllFTVVJRVB4VWhGSnNkM0FKMXkrMGJkcVBYbzNWUVNtd01KcFdMS0xUbDlo?=
 =?utf-8?Q?5Wdh//PhL0BHXY7MLETDtLDfo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5AF53E2FCE03F4F866AD01580F02526@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bcFzXvVYqg+NfMuzI3MYZLC1ENhoosdPM0KFJsYbznQPw1g/5TlKOWyjZIvfO0z/BaddPAirPJBX79Ru1hTky2A/89RTbvqN+wBzItRnAL4U2mHgZ0/PLQlUO0oVMe5Hr1ima3DaqC/8UFsRuDieVjd0mW9a+q2AcpYY2arsHKcJLr0WAXQ8rppPxRvmSTyFGx4u2S6Ri7DhwQECRBuWBkKDFZ1b2wGlQdFhqDIuiMW+PKZel0vSMh0F1SjritlVN8LLRu84m7oAJVCtWQDAwnvYQqqz8pqV17gFjqSUYnXBPk3bS9SbTckb2PPtaXyqR2Ezu4ahtmaeUHZ1Ee8fv6KMEC9mQlkyXKe5mQhD5S6fl4FuTJwMWmQu3dtkfmhC9PW2oD+ZB1C+In1emGFq5IHhnpdXaeNg7HzBjcT1rzTCXkfN16Ok/LKCvJEzU8C1Y8kUOeilh9Junq+hzHjvL25lo5Lj7u05HVLsAUORxpMLmACSXdAy8hykuCpmrHVULW+wbOVidEj2N4oEHZnUxY56oBXnUPIaytxMWx8f9GEy0Iy1oBOQWg+zKoYAdcotISlr2yY1+t/ilSU+ce6UKeoihLy+8Y1TGousbyIHT6GjBN3iAtTpbeOMcf5bduYPrmreZuS6M2f3TPTZ7YZsWg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bdcbab-21a1-4633-24e4-08dc97b622c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 21:06:10.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bwb1QKhPIMCbKoO2R074gyr/6owGaROe2xMeGinILNemiCLBKkYIJDUfBL1TSTv7bjvKufw4upMc6frgquFHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
X-Proofpoint-GUID: HB4SKd8EjzPK_OJV3rNXsgMqNwwret59
X-Proofpoint-ORIG-GUID: HB4SKd8EjzPK_OJV3rNXsgMqNwwret59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406280158

T24gRnJpLCBKdW4gMjgsIDIwMjQsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBuZWNlc3NhcnkgUENJIElEcyBmb3IgSW50ZWwgUGFudGhlciBMYWtlDQo+IGRl
dmljZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5rcm9n
ZXJ1c0BsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXBj
aS5jIHwgOCArKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1wY2kuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1wY2kuYw0KPiBpbmRleCA5ZWY4MjFjYTJmYzcuLjA1Mjg1MmY4MDE0NiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1wY2kuYw0KPiBAQCAtNTQsNiArNTQsMTAgQEANCj4gICNkZWZpbmUgUENJ
X0RFVklDRV9JRF9JTlRFTF9NVEwJCQkweDdlN2UNCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9J
TlRFTF9BUkxIX1BDSAkJMHg3NzdlDQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfVEdM
CQkJMHg5YTE1DQo+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfUFRMSAkJMHhlMzMyDQo+
ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfUFRMSF9QQ0gJCTB4ZTM3ZQ0KPiArI2RlZmlu
ZSBQQ0lfREVWSUNFX0lEX0lOVEVMX1BUTFUJCTB4ZTQzMg0KPiArI2RlZmluZSBQQ0lfREVWSUNF
X0lEX0lOVEVMX1BUTFVfUENICQkweGU0N2UNCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9BTURf
TVIJCQkweDE2M2ENCj4gIA0KPiAgI2RlZmluZSBQQ0lfSU5URUxfQlhUX0RTTV9HVUlECQkiNzMy
Yjg1ZDUtYjdhNy00YTFiLTliYTAtNGJiZDAwZmZkNTExIg0KPiBAQCAtNDMwLDYgKzQzNCwxMCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgZHdjM19wY2lfaWRfdGFibGVbXSA9
IHsNCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTVRMUywgJmR3YzNfcGNpX2ludGVsX3N3
bm9kZSkgfSwNCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgQVJMSF9QQ0gsICZkd2MzX3Bj
aV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIFRHTCwgJmR3
YzNfcGNpX2ludGVsX3N3bm9kZSkgfSwNCj4gKwl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgUFRM
SCwgJmR3YzNfcGNpX2ludGVsX3N3bm9kZSkgfSwNCj4gKwl7IFBDSV9ERVZJQ0VfREFUQShJTlRF
TCwgUFRMSF9QQ0gsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICsJeyBQQ0lfREVWSUNF
X0RBVEEoSU5URUwsIFBUTFUsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICsJeyBQQ0lf
REVWSUNFX0RBVEEoSU5URUwsIFBUTFVfUENILCAmZHdjM19wY2lfaW50ZWxfc3dub2RlKSB9LA0K
PiAgDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoQU1ELCBOTF9VU0IsICZkd2MzX3BjaV9hbWRfc3du
b2RlKSB9LA0KPiAgCXsgUENJX0RFVklDRV9EQVRBKEFNRCwgTVIsICZkd2MzX3BjaV9hbWRfbXJf
c3dub2RlKSB9LA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVu
IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

