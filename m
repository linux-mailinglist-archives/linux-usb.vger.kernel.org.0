Return-Path: <linux-usb+bounces-28642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A4B9D04D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70CF5383260
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F17B2DE71D;
	Thu, 25 Sep 2025 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="WnnwFHAP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BF4437A
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763813; cv=fail; b=oyVdKIcpV7iVvNxYon2azoJeh7bNoLyebS2WlhwqN9KLQLlHmvROSz6HEUvRCPDUi5JeWwOmMZgw57UsM22HKg4A0a12YNups3OVI4UacepD4M0GlwpkWk0gXLXmipo0SGNecgPA+xiVBHdpoYQzqkF9AFhYQMvrZ/+nyEspqFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763813; c=relaxed/simple;
	bh=SvyzWFvhBRejZNHaw7Acc8j5TXY50i6KwQ2Wej8TFtY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XqduPXpUBoHZqN9UFCOUVBmmgH0vcYDZMgRN4ZngfjXb9uDWZ+CNrk/vHVgNC1RgACkv9Ua0XDaGEVvVVROoXgW+Ep2SjqR90iADqYF2nmrwihqwSyl/ZQBsOXaBhWHvQouAAsqT9rzaBoEsrYhZdWEMB94DCzxYSbXbGHwZtAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=WnnwFHAP; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OErDDR021097;
	Thu, 25 Sep 2025 01:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Sv
	yzWFvhBRejZNHaw7Acc8j5TXY50i6KwQ2Wej8TFtY=; b=WnnwFHAP07iaksXsZN
	bah+HaZnTEY2juXfwDxkxDytU59MBWW81EM1Tx7281DNcKQNjLKiLxp3ZUef9Ezx
	86hD2x1H4IPsX9dcu/FuU7cJFek2M6payU9/ns63ILvobyhgMS6S4rwAO9ynbLHK
	eSQam57DTwEVaSsSLRqOsqVfDyQwS//6xKriSh7aPVQdvZDZzg9LSnnPYFty2E/P
	uzip27t3nJ5LW8FpO84hsH0gXRUcg58jFVpiSaRw4JQADW2tAIgdwuU8tzEI5kvT
	jlRbeCjrsm/BTLLN33MJFIyecm5tFWp1dTZw/DbSx3KQ9xYZdbmQcPl6u0pKrGmF
	Q+Gg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 49cjsumkaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 01:30:00 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id D3DC9800358;
	Thu, 25 Sep 2025 01:29:59 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:29:59 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 24 Sep 2025 13:29:59 -1200
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:29:59 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZrlOlkcaVBvjNbP4bqpfdTNoJ7KUQ/v/pE25bBNn7hFw/VOP/BehAHryMpCuCki9125/Uku/MABqEBohn1gR1WswYcPhJ4Zuc0/y9YepHJc6dopcGuKTOdz1EEJsChLBpAexhQabEgpyyXfZXW9l24FaxXIIWIro5clkSXNc4GDpsGfy4+lybYxOk3HjmTC8MGYOdiR8am5xCHBS6zOlwytFmNBpSMC38GkWc/GsdCYH19vaN+XptIqD9xSL+4QLEa3bxCkLTrH1hP0EegM7IpsqqQ5ufUtON/iuzhP+SSP1YhtXoIlZ32AVi01zQxedbSTU+x74331aBMnaszBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvyzWFvhBRejZNHaw7Acc8j5TXY50i6KwQ2Wej8TFtY=;
 b=eBxMtXFByZtN2VIWAaxJdZSfLJff06uJjdhYLguuOgnhoJtXZjY8b+R6bWvg8Gwso0labWGG6rQuYPgT+h8mCfSRHKsAsGPdOTUE3XY1wQnIV3AQaVqdve2+KFVXpRUO3BXD/x5/NBe0rTfvnto0QZnypUov8FNTCD3Rs4tAmg1JOEObWJGK+ZeOpQN/mOiKeY8Nu//DJHsCilfFjdG6U3Cj4yd0VDNRcD03qWmn86OkvnZGKFOCuNWtYQxRnfOumtuqlh8+AmfdzSAIPamvvLL1YhJtd7q/+4Hkkxm00ZOFFwreoCIpns8zf+e1SN6NALkB4D8Uo8tNVL7H5W5cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c5::19)
 by SJ0PR84MB2087.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 01:29:57 +0000
Received: from MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::23e6:7d13:8aaf:96d1]) by MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::23e6:7d13:8aaf:96d1%7]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:29:57 +0000
From: "Ko, Kang Jun" <kang-jun.ko@hpe.com>
To: Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Thread-Topic: USB: urb error log during reboot on devices with multiple serial
 consoles (Linux Kernel version 5.15.71)
Thread-Index: AQHcKHen6J7H/BFX0keotto+hLxEybSYpuYAgAp9k3c=
Date: Thu, 25 Sep 2025 01:29:57 +0000
Message-ID: <MW5PR84MB2083421899199020C49FB35ABD1FA@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
References: <MW5PR84MB20830480C70129C188178130BD16A@MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM>
 <2025091842-parkway-implode-0c85@gregkh>
In-Reply-To: <2025091842-parkway-implode-0c85@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB2083:EE_|SJ0PR84MB2087:EE_
x-ms-office365-filtering-correlation-id: 86a8ab60-7ee8-45c2-fede-08ddfbd30984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KFWf0TEC2GU8X4jNlligXjRNz8nsZazWrp13KIp2wyx/UsWH2pMGqubkA/?=
 =?iso-8859-1?Q?DiFruMPBCx3f3oENHHHcjGjRWpIyNTCRx4T8q0MJM1S+w0H5iCsqt8YYxD?=
 =?iso-8859-1?Q?7JNm19KZ+B/tx/Qnz6DI0W3sZ2MIAXPoXTY8MZ9QUWBHckR3lVyK0Nx8sr?=
 =?iso-8859-1?Q?5WBkS6NjqqdOU4iSgTFdmdVIrVfi2Z5ansmycnEkVrsfs2F72Eskc6Yzzs?=
 =?iso-8859-1?Q?dvBfswduuoCh1wppLGKgaSaAa+4SzJKUz0/mQYHTY5Tx8bN2j8nrXxHzSa?=
 =?iso-8859-1?Q?dOOibsC5Vzedd6l2ZC21P66VrdeZVUCaMXqSd4d07Yp0EE7xTEpyrcy4WZ?=
 =?iso-8859-1?Q?p/c52xkgvmm7J0oGyGQTdjua38liQHD4qxkp+wuBgQPBqDwWLYsCf7s0bI?=
 =?iso-8859-1?Q?mOJtncS2w9o8xthK/dblfT0KeHpdOCMFP3GgetLeh8MUtAN7beMsLS8gqc?=
 =?iso-8859-1?Q?Bsa5xFf2BQYOdfbha3/spjp/UcFGuu0kBpt0AnTl2LXzlOs5JetXAfuXZY?=
 =?iso-8859-1?Q?nCgi7c/HM+MTwlZziUt4ur7KugPZQdraPjtS5tQnaFy1vZeeDDdIVw1Ojy?=
 =?iso-8859-1?Q?fORDn4htN59+87ri29FtCyh7FdhCZbm5AP8pTT9vLlggG/D1uV4JZzou9u?=
 =?iso-8859-1?Q?spGgifO+zzmXPIMAccGp5YGKmiexV15nb7nKcjcmN8qGuUSNbD3CqLA93g?=
 =?iso-8859-1?Q?cqyGnbbsaL6QvPZMVJMiHxvFUsHP1Hcx6rfBUDXIUHUaTtdA8MtEEBfu/T?=
 =?iso-8859-1?Q?C0AewvoLXxsR8Ivnwdhd+60SF1G24DhWIepsUscYte0ma8UGl26JwnpAFQ?=
 =?iso-8859-1?Q?3/hVUIHy69NmLn+kN6WbaFf0rmseuNmXvc936Xi03HlsVmxmo7xUq0ptuX?=
 =?iso-8859-1?Q?jwddNMyPROPiNT4TO9TDDFdqeJxRhfbKXtIXKjca8TEUMdCdtJ9G8zGcgT?=
 =?iso-8859-1?Q?m9SjRfqlkgGO/4NXxHe7B4O5QpH7dSZ2wkyHipHmkK7M8emTsQkOswyQOt?=
 =?iso-8859-1?Q?YDKcdlR/IKd2FH5uFP7HSm1yEQNZkZA0PvrdcguYxrrgpzUeyatp2T5O7l?=
 =?iso-8859-1?Q?7C6v6XoKAoraErftfOJGEPGPwqGhmUUuYycyGA0oBqVpcUM+vP7tZIBjq0?=
 =?iso-8859-1?Q?y8v98wzgVNIQyYzLiNl4/cD06EqaRFpjBxAVzSxGdcLEq7hN5aIUXagnGe?=
 =?iso-8859-1?Q?hzntX3kIacRq84FRy+nnjklo5lz0KnGfEpYo+dZUt/fsiiS5MOWXOIGP/I?=
 =?iso-8859-1?Q?1s3Les8lf6vulY5mUeSgFfppkJFBCDVutKAVdJ2EvHww4szCZvuXXEgXTu?=
 =?iso-8859-1?Q?/lTJuejkHaLqk4m2+puTntMRdr9oxQbOQBHCLZDsxbtKgmdIBVG+J6O3rW?=
 =?iso-8859-1?Q?152JL46CgGlR5Av67xCVF8hUTAvwvtOqv+IKxj3hMLUA+HOvHfZTs3Sffz?=
 =?iso-8859-1?Q?yIyu7eXqXiV6DlOXunZAXco++Uk9vCw2gwva4Ty4lmTLap/lHIfV0G4Ij0?=
 =?iso-8859-1?Q?xukXlXhy5wsisZvuxjYjjpjtRWabsvS57sIf/kRDfgo/60oJRzf0aVOVog?=
 =?iso-8859-1?Q?1CLDZNU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?d8qTEAT0r6cfB9f9XdlB2KjWMVh18ZUtz8VWT4zzqvIRHxlnJtghDBEnCh?=
 =?iso-8859-1?Q?Oe+6fUvQmeZSPhHGwtohp3/Fyan8PchcjEE+fVt7hUJMB+dIqEDYihQIZG?=
 =?iso-8859-1?Q?nwUsBhzTLZvXWBlUllcBhHt6VUA7yDZFqZzjiURubn3hWtijx3a9KxlYh4?=
 =?iso-8859-1?Q?uN2Iv8L0xkZgtPFjr6gWjs+0qcaLXb0ZcBLVJqGzV/IcmKp1Nn4cPUebMz?=
 =?iso-8859-1?Q?H14CPKYeiDTfTZZ90kZJaVjoL7yXLntizvuK+I2ldIw9IkO4M6o4idXanb?=
 =?iso-8859-1?Q?qlnY5PncjJuXe3SDS06gdGQaMXkqaOsr5bqYwg9P6LVPwX/xi6Js99+mJL?=
 =?iso-8859-1?Q?FdgELfjRolLq7pOzcl0QxNKFGjIzSwU86j2absyOFUuiWder60Rbvm/6vL?=
 =?iso-8859-1?Q?XPtYgmcBJjmCAMN5VwgYeBScl0MeY5oC3QAFbguOxdQxYpaVhPbYY2OL3U?=
 =?iso-8859-1?Q?asg23k75b6Mbmdbylibx0Zkuz+YviHQrGbiaYijktNtPg+IFckn75tEqAT?=
 =?iso-8859-1?Q?koVejYqUbeTfznO3R90Nl7IzSz6ap3MzqOZC3jTAIzwTkJ7oYUDcyOsqLb?=
 =?iso-8859-1?Q?pOl4nEp+Hc5qus+fq+ISbGVdP2heRtEhtyteL6iXWpprGSfcctwMiouOmW?=
 =?iso-8859-1?Q?j53YI7uRNRs0c7F7T4w2cb9XpJD4UHrHg82Zb8NrVbXH5cTa5Vbx7eI3YF?=
 =?iso-8859-1?Q?uYzImGwgAEtvjp5YwWxXzRTGJr+Ot6OAc4zPUmbSUCshrxiGvM1duozStH?=
 =?iso-8859-1?Q?NH1wPWHhIsuiOGSH/WMTWnOGz3VfcqAM04f8ZIu+b/GiU/Vm1Tdn82ywa8?=
 =?iso-8859-1?Q?1q9jLuiSJMdoBigBhl7cpRRa0Jro2OPCJSVPe6+R7amdXw1jbPuZxzyFDV?=
 =?iso-8859-1?Q?V/u+XkxKv8f76wh2ZoQZz9Wc+l00kL+WhsbrVBWuud2fKS+A/6yEUx6zLR?=
 =?iso-8859-1?Q?8EdeyryALut9/aqRsjDqbaE0OfwCsrBBwBsHzHQG62IaCBR/NcIUjej3hl?=
 =?iso-8859-1?Q?7zX2e4AiKIFJM164tuR0bN8DJqXyyqVZ+xlpU7N7UkFMaSFQkAXs/mM1wm?=
 =?iso-8859-1?Q?4/H3H/lHmH1w91ytzwUeZSRTuJpflKLx6h1MZWBVnM9R8Ce4KYx6saDP0J?=
 =?iso-8859-1?Q?3grKe0JZKEAaiZHv+bpuDru1ml/ubUiJINeOma07ixaXdm39AgUohiEkmI?=
 =?iso-8859-1?Q?DcdTdW8cGpMW0YN/SG/s2oTc83w3WyxKvqTFPB4TBEfnye4EBODmH8lDxl?=
 =?iso-8859-1?Q?b+vBN4vH++rTk509wU3VUG5U8iX/ZYKJtpKd4W+T+EjC7KBAxplD0+s3z0?=
 =?iso-8859-1?Q?OSWnNu+47YfiP3x3EepvsWCkB8osFWuE2TbsuVaOqjQ62+zj0UjOdALemx?=
 =?iso-8859-1?Q?XAxvihJYn7GIuGKNpIILG/ra4gSPpTSudf2dDrRlvvVv2SStzOfzOD5AvG?=
 =?iso-8859-1?Q?wABBesIjfcGZTYfmiRPYguRsLL4KWQc6hjPMQKDfcvNUO7Fe8a0bPwPOCO?=
 =?iso-8859-1?Q?TmVKXuFU/EFHThDEP0TpUJx0i193tBcbWdEou7ysX0geTV5jB/PLCV+A8X?=
 =?iso-8859-1?Q?uIykgYalO5a1QMPMv1k7XAX3/nEGg7LZRw4OMdO87D1ijpFrf3qBvZoRWX?=
 =?iso-8859-1?Q?KeX2sAz1mBtsc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB2083.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a8ab60-7ee8-45c2-fede-08ddfbd30984
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 01:29:57.2385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fsqcPwwRhAM/mnEZ4htpF9Ws+uVNdKB01FlUsykfincD4/0wwsXhKR4Z4cpU9deoljanugWgY4k/4wIFhgi5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB2087
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: JlnZea_7d0vMLXqjaMsO7iZG8TSnHV0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDEyNyBTYWx0ZWRfXwdEedpPrIKz6
 xsNdsqxUGUssjBiout8V2uLStY1J5dOMEhr1VdIMV0E0h15GhiIO4hwZQKhL9JaZ/N2aXTWmIt6
 Mrxy49aX5xFSzOjp5yp9hqbTEkxB/U16vUiuGqARpjAFTIu/kGXooxPsD46Pru41QWGHwgOpu5M
 E9KE8siJb8X1bhWo7CM+u62WYvnGZxtVWZcY2BrIF+DZ1HGNwbNvgGz74s0qOS9GyeXLxVNucwW
 n3pOxAxu5zolBH1H6rMUIfbwlkTA1JmqeSDuiYcXzUPgxcJItv4xcCiZUgjEgVGyytRp0UqAUxX
 yEN1jlQ0dPQyGNYrVOHxNrusuol5qBzmKSHLjszItCd2lVgchWKm2eOdpigr4zYjudf1DLbeSqc
 DSYDtua8
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68d49b18 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10 a=ag1SF4gXAAAA:8
 a=MvuuwTCpAAAA:8 a=VwQbUJbxAAAA:8 a=KKSc8-nA35z9a21OzkgA:9 a=wPNLvfGTeEIA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: JlnZea_7d0vMLXqjaMsO7iZG8TSnHV0x
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509240127

Hello,=0A=
=0A=
Thank you for the kind response. I've tried updating the kernel version to =
6.12.3=0A=
and the same error message still exists during shutdown.=0A=
=0A=
I understand this is not a bug or a functional issue and the kernel is corr=
ectly noting that the hardware is no longer reachable.=0A=
 =0A=
However, I would like to know if canceling the USB messages when the hardwa=
re has gone away so that the error message doesn't happen is something that=
 is considered for future kernel versions.=0A=
=0A=
Thank you,=0A=
Jun Ko=0A=
=0A=
=0A=
________________________________________=0A=
From: Greg KH <gregkh@linuxfoundation.org>=0A=
Sent: Thursday, September 18, 2025 5:09 PM=0A=
To: Ko, Kang Jun <kang-jun.ko@hpe.com>=0A=
Cc: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>=0A=
Subject: Re: USB: urb error log during reboot on devices with multiple seri=
al consoles (Linux Kernel version 5.15.71)=0A=
=0A=
=0A=
On Thu, Sep 18, 2025 at 08:39:11AM +0000, Ko, Kang Jun wrote:=0A=
> Hello,=0A=
> =0A=
> I am reporting an USB related issue on the Linux Kernel version 5.15.71=
=0A=
=0A=
Please note that that kernel is _VERY_ old and out of date and not=0A=
supported by anyone as it was released over 3 years ago.=A0 There have=0A=
been over 19000 changes made to the 5.15.y branch since then.=0A=
=0A=
Please try updating and see if the issue persists with the latest 5.15.y=0A=
release.=0A=
=0A=
But, as you write:=0A=
=0A=
> Below is an error message that is seen in my dmesg log when my network sw=
itch goes into reboot. =0A=
> =0A=
> /****** Reboot log ******/=0A=
> ...=0A=
> Reboot reason: Reboot requested by user=0A=
> reboot: Restarting system=0A=
> ftdi_sio ttyUSB0: usb_serial_generic_write_start - error submitting urb: =
-19=0A=
> ...=0A=
> /****** Reboot log ******/=0A=
> =0A=
> Summary:=0A=
> Our network switch has two serial consoles attached to the system (one co=
nnected to the processor, one connected to FTDI chip).=0A=
> When the switch goes into reboot, I can see (from the console connected t=
o the processor) the above error message.=0A=
> There is no functional problem in rebooting the switch but I would like t=
o know if the error message is something intended by the Linux Kernel.=0A=
> =0A=
> Reproduction steps:=0A=
> Attach two serial consoles to the system and reboot.=0A=
> =0A=
> Additional notes:=0A=
> The serial drivers do not have a designated "shutdown" method so the driv=
er is still present when the kernel goes through the device_shutdown method=
 within the kernel_restart_prepare() function. The ftdi_sio serial driver c=
ontinues to submit URB messages to the console when the console is already =
removed from the system, which results in the error message.=0A=
> =0A=
> Conclusion:=0A=
> Although this is not a functional issue and is not observed on systems wi=
th one serial console attached, this error message can be seen 100% on rebo=
ot on devices with multiple consoles. I would like to know if this error lo=
g is intended by design or if it is something that was not considered becau=
se there is no functional issue.=0A=
=0A=
This really isn't a bug, and you should be able to just ignore it, the=0A=
kernel is correctly noting that it could not submit the USB message=0A=
because the hardware has gone away and you did not close the console=0A=
before that happened.=0A=
=0A=
But again, PLEASE update your kernel, it is very old and full of known=0A=
security issues that have been resolved already.=0A=
=0A=
thanks,=0A=
=0A=
greg k-h=0A=
=0A=
=0A=

