Return-Path: <linux-usb+bounces-10990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6E8FF5CB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 22:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D230C1C26691
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 20:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E157173C;
	Thu,  6 Jun 2024 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i3qvdTXU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MJ+PPzc6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eZQSSF1k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90F1DFD1
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717705319; cv=fail; b=sJtCPOruv6qUfuKTzBSPyDRfilkxIZYG3395ydTlUEG18nhatD1tWKfJ6Aj/aPJQJvIrr23eX0uuv4ztQGAiPMXIZz6lER4kkUQMfinHsRTsGe8rL/A5fxcO0hDnKv53Ta1/2rsJ0kJz3N5miC9wPBjUwT+bxumNeWb3i4Ea+y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717705319; c=relaxed/simple;
	bh=3sDlWcV69ngriVJomD55UCGT1Cpw+gvTMgxysDz1430=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QdPor80DAGEII59Jr7A5sr4t5TOGj3/4Ijel1sM6lpDJGYWvVnZ+zyT9ag47Qe0oA4Vo3+u8pRTPi6bOzX9fd++zMIFxSTOl/axuR7CEcsk6jxIG4ACYq+S2sTEb/+9TU+NytxZlHzB5KbBvUsvNiaLktLZ33slvo2c/Pf5Xrn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=i3qvdTXU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MJ+PPzc6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eZQSSF1k reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456HDvkY006622;
	Thu, 6 Jun 2024 13:21:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=3sDlWcV69ngriVJomD55UCGT1Cpw+gvTMgxysDz1430=; b=
	i3qvdTXUES/lORj86/GwgS5L53tBDhjkCSohIYI1+KEyYoWRHfEnrrAiyb98d5Rl
	PCNhBiHtXj8S2aEjuJJGJ+qwUsMDux7uV+tcuk2ziw7SKVxd9C1yckRTSa3UExHr
	7xLMJRkIrkzcbdbqrpZGO8TrnVhLDIjZ7mNI5R6yZscH+wtiDcBIRkYRuzYAy3Ef
	iKFFRB/1eyk3y57cJefSCWowRaWxIprZZ7negIiTASgdLy07xN8eNISyEhSHOgbB
	tk6JZKCO63zRalSapM1m0rU2KrhqaE41K13T5daYA2gYJjAKHUxVF6KtSJOhL45i
	b3Rge9o5OFNOzfa+IT5ldA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yg2jsgdg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1717705311; bh=3sDlWcV69ngriVJomD55UCGT1Cpw+gvTMgxysDz1430=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MJ+PPzc6134MY1uSywevudnvViiAshbD0DIL5yevj7vGttLxFG2uvmAHt2pigBEFf
	 y9A7kwqRC/VZbZAcEMAbJkPsQAzok7c3Obumlx0QIkUfSXZhOsIeVFcgxA1vFarAxJ
	 pQDw+a6ObbALvCG/55dtMkmkQjX1gB+0sVCdZiOShCdQr1gL5+qgEU9nnGfBdCT/c9
	 C782B3jr5sUGkGMWkWTXTdDuPHv7soEn0mfaUTJ0WKl/nav/24JLR/+BWeqaxawcEH
	 ANcJigpLGChZidGMkb7Ugvokfbxm3V/ad7DTtj3XQOvD8to6oIc10ytujnCDEJuJqd
	 cdgiC6Br0Mk9w==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 64AEB40348;
	Thu,  6 Jun 2024 20:21:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A2EFDA00B8;
	Thu,  6 Jun 2024 20:21:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eZQSSF1k;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5F0AB40361;
	Thu,  6 Jun 2024 20:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcB86kK9RPwXfpSPnEnb5tr2Hr/r6965dSf1XyIooxtvnEG4t03SMJvtAByJyzGGYVD8iS0Gbhl9I/vAU0+zJUaleNnsDsJ3Xo62tDlUGltCfdaTNJaJJ3Tp3Rh7zTav/S4Nnw3n6TE5ynB8DY20YeyOFgw2EirOP1ik5EbnPEnqoznQyFLgMQ3nxX1aRbko9E2AoyKxHrhTSe0uEF94nUc9Hhji1Rb+2km1xxTYKhdz7w5LfCR0AZj0b5z1yO4NJa06cnUeVuHerhO2eWSWkQOBh8Uob1TSHUxnNuHbcurMYMzQlpvSMp8DixUiUPOsSwdfJVyOn/zeRr43e5I55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sDlWcV69ngriVJomD55UCGT1Cpw+gvTMgxysDz1430=;
 b=PzBIvWsJ8v2EFk/irHC/TTIBnJP+utvy2wwGrr8kVBlercZaJpcFa827RUjxBSq+DUocv7M2ThMAUe4jZvYpvj9dUw8//I2KHWwbzB8CxN5QVBMpXfOLOXzuWTGodsVP68T1W2d6f/TMGcWehomsx3qVqiTPZ9CBnf4caKYb19WNH7IknLXBn7QpuCiHgn2uhuXA1bBkivimTKY3XsAQuXVaE0PN3lALJYjCSVMssOnKRQ7BAaayVNxQCpKD705j07jh5zX4t2iYigI68epK+kzx4PllVRam+fP0q3umPDRq8wpR9Qnub79ox8DE7MmIoBhxxaG+fwDEyjeQkPhITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sDlWcV69ngriVJomD55UCGT1Cpw+gvTMgxysDz1430=;
 b=eZQSSF1kI+7uETKfKwmOX/KxhVZhNn0l9aB6/SDCWs36x1yksT3KJPIFgwB/rwhLX1Ul/GZUhY80m0mNC9ZsTyZDyHNWhNxbGze49EzOBfYQsQrzNgCZpLwRCp4L5NIXtFT16gBzVjmeZmrRaSvhXerckJxS1w1g/aE+iSIy0uY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Thu, 6 Jun
 2024 20:21:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 20:21:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: 
 AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4CAAPbwAIAAVn2A
Date: Thu, 6 Jun 2024 20:21:44 +0000
Message-ID: <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
In-Reply-To: <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB8145:EE_
x-ms-office365-filtering-correlation-id: 767bac44-dc82-47cf-a154-08dc866648ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?LzgzVEsydXpoVWJhSjc4bDRYNTFUY3VNVFoyWThwMzBsaGJxUFF6SVBWeUMx?=
 =?utf-8?B?RHkydU52QTIramhYWWpVVVBZbE4rdUJxclJIWm5RSE1kd3VteFRBZmphSVBu?=
 =?utf-8?B?MFNocEdIbFlva2UrQlpLU3lZV0tibENabWR1WHpoTjhJczFFeWsyZ0RkZHdq?=
 =?utf-8?B?Z2xjNzJqSS9uR0FHOU1OeTdyb1ZqNHM0QUk3ekRqNzYrVU14U0xnMS9PeGtQ?=
 =?utf-8?B?T1F6NVBtb3lXclQvZXpNcVNIckJxODRrQjdiam0xTlpUT0U3MHdodkNaRnhY?=
 =?utf-8?B?U1VDNEZqY2VyMXdOMkltUjBLYzlzd09XSU1aVkpaQVAzMmYvTGpGZnBkVE9Y?=
 =?utf-8?B?Q2ZKWUJmRWlUWngveDMyTE5ZckdGSjJtUlhpcEZJdUNHWS9waXphUUU5cWFv?=
 =?utf-8?B?bW4yeXh5VWlaVEV6V0VRNEl0b0k1NlhIMmpPWjBIcCs3bHBnZ1VXaXlUellW?=
 =?utf-8?B?Q1A1bWNtcXFvOTRSUkF0UFlEUTF4SGhlUEViZFhNZTE3aDJGdlkvNDdXVXow?=
 =?utf-8?B?Q2lrWndhazNPTTN2Wkk5RlJvMTVObllqTUk0Q3hpVHo4VnhCWjQ3TUJqa00x?=
 =?utf-8?B?M2hzWUFEWTBQeE1YZHI0L2V6dE5ITFdCK1BJYjRkbWNLT21LNkFSeTRoUE5i?=
 =?utf-8?B?emRXU3RQWHhMK0dFQXAxbWxzaVhYa1hPRThiOTRFZHZvZmJvVk9URWVaNDlo?=
 =?utf-8?B?TjRFT0FHV2pabTZZeTJpV29abHJNbGY3cjd6U05VcVVSajJQNzFkZjI3UmNC?=
 =?utf-8?B?WitzT3lOKzVvK2NKTS91bTdCcFJkaHpaREgxeW4rVURIbEpLNXpTSVZ2bFJU?=
 =?utf-8?B?YzBFdW84S2thQzVaZGd1OUZrTUhEZkxIc1dOcUJtNVV5TmtEaHBuSkZHRXpn?=
 =?utf-8?B?MWExaStzdDRxSWl4VTRMeGpSVUJ0b1pwaUtHSHFjaER0Z215NHVGY0oxSWts?=
 =?utf-8?B?OGxBbnMwVlpzU0E4VTJFYmhHL1EvUG5YMlh0RHZwS2hkM2hSNDlTMHpObUFq?=
 =?utf-8?B?TmFXT1hSRUp2Y3RWWm10S2tITkFVTEhyUFpBZDFYN25BY09oZ3pRcWJFYVNS?=
 =?utf-8?B?UGhPeVphSGUvSmc3eHppWDZyeUlrZzVzTWlUY3QzZlp3bXBSelBmK1oySEJV?=
 =?utf-8?B?YkVEUGwwYitlVTdJMVUwa093L09NSnhyUHVaeUZlRzVOZmNKbDZKS1pUS0pp?=
 =?utf-8?B?NG1nK1lldldIL3RwS0Z3OTlRbExMQnJsQVJYKzNDWFFsUVBBOWNKUzMzYjJD?=
 =?utf-8?B?MjNtOTVZeWVjRUVqcm4zVi9obm0rR2ppUE9FaFRZcmlILy85N2hxanFpdW53?=
 =?utf-8?B?aEROc2RncjQ2SnAxK01Zd0hUdnJxcGRadU92V1dwbUxXbmY4NnNhUVRXTGh4?=
 =?utf-8?B?UzN1dUF6cWFPRnZMLzJEZW15WjJxNnRYb2cyYVBYK0xSN1lBSWRkVmZiT2hT?=
 =?utf-8?B?UjJnZmloMGNFV1dOY0VLQUpjK0dMMXg1ZHVaRFc3b3F1WDhoMTJGbE5valBV?=
 =?utf-8?B?bEpub21ERyt1TjZqSUx3d0NlVVo3MGIxYVYzeEtYei9JcWp0YmxsNnpjQ2l0?=
 =?utf-8?B?dnFDN0REeHVuSEF1RUJreW1kQ3kxMENoeXJCQVBScUxTcDlHOTRKeVN6eHdk?=
 =?utf-8?B?NW5uelpBUVcwWFBuT01UVG5XWW50OWFrWGlUL2pIbFM2NzBMcVNMRkI2dnJQ?=
 =?utf-8?B?cUkwZkM2cUttUFVNTlowR0ZteHZqOUoyNEZGcUVsUDdtc3YzOVNFZTNuS0tv?=
 =?utf-8?Q?fU0KdTgiaDM4ik22UMieoz7y4zrKWK/E16xIZiv?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzNyVUl6eE5UU3ZIYVo5aDZoMDAzV0NmREFMMzZ1N2FsYlZxTEFyaTRJUks2?=
 =?utf-8?B?dFcrVlB6SDl4Ympka1JseW1nUzJzbGV5enhJbjJXUEl6S2ZQVGxJU1laSnhj?=
 =?utf-8?B?L0NrMCs2M244UERiWUxRcm1tWDNCU2hnT0swdEQvWEN6SHZnYTVQSDlOVjAx?=
 =?utf-8?B?Q0dwcGhJTEd0Vk9Zd08rb1dhbDhKM1NxYnZJRkVTQ0NNOXFqREhJR0NCQ000?=
 =?utf-8?B?WFNDUjJJMXVPNW9pZFVmUlZoV3h5aGFTVllyemF3elJ0c0JKcC94UWFseC9j?=
 =?utf-8?B?TUU2N3BpVXJDUGVrRW9WcE5wVXRHZ01yVHNUQ3pBdkVhQm5tbDF4MDB5Z1dk?=
 =?utf-8?B?NEU4L1UyN3hlMUdzUWVVRTJXTllja3k5N3VIMTlqQlVib1BGRThtUVM4amZa?=
 =?utf-8?B?U3B6U0h5UXR0ZHR2M3RoMGdCekFHalBqdDZSOWFPSjM2K2dmaG9ldC8zNC9I?=
 =?utf-8?B?S21LbmVQcnJLcEh2b1IwWTRUZzQ2KzQ0cDJhNlpPZk9mSlkyMmcvR0x4S0VS?=
 =?utf-8?B?bENCM1NTSVRNK01md2dvNENJR1FrVDlsVVM2VitmL0VRVjM5UmdtSkdtdVl5?=
 =?utf-8?B?N051VnBBZWthQWh2RVQ5SG1lYjBzSjI0czlFT2JuUXl1emFWYzdsQVNIT1kw?=
 =?utf-8?B?V1JwdjF3L3VJNjI3UGFLNGxOdGdFV29PN2VHVlpudlV5Y2R3VTFZZEoyOXZs?=
 =?utf-8?B?Vk01NGJwN0xSSlZjL3ljOWtMa2tDdWwvZHpQZk5oZzl5bXdCOTJnelJUcjNw?=
 =?utf-8?B?cDFwVFF6VHlMY1poRnJZb3pLQUlyUGdZTUEwS21tSkxFUEYxdmlhUVFUOXBX?=
 =?utf-8?B?N2VDWHpyeEdUeE9zTlRxd0ZoNVhQTFhobm55Vzl2RnJhRDJ6TkZqSlpGV1hm?=
 =?utf-8?B?ZDNWaTl0NVBQeWZSYUdUcEZSRHgwVWRMcXFsbFdpY2Q1ZytXSTVCd09PWUtU?=
 =?utf-8?B?dnpiUGV5WWVVOFRRUHBrS1BSa3BOS3V1dlI1NE8zVmU2elBkSWpzWjNlcy84?=
 =?utf-8?B?amN4WUhtalVPUXBIRXhteFlXSlo4ZlBwdy8wbS9ra0ZLemM4dEhEdEY0RU1W?=
 =?utf-8?B?Ym4ramR5R3gzbFlNbG5hUUYxS2wxSFdKVkRMTTRBSzRJN3UrQXJqVGZwN0xB?=
 =?utf-8?B?aGVRMVZLbXZOQXl3WXVMamVsQmZkbThsREdMekdRSkpvZ0l0eG9OaXd1L084?=
 =?utf-8?B?c1pmVllmZXpuUDlRQ2UyVHpYcGF2eDBnZ2ErUFV2UG8wSWpobWI2WkJIMmVK?=
 =?utf-8?B?WnM1SHFOdGVHR25mNFVvSzdLaWlxdEorRmF2RVExNEhVeTM3bzVBUmZGNUs4?=
 =?utf-8?B?YWFzbnFpdURRY2JxTmo2UklEZ09pUExxeHFJcWVrQUxVcHpnY0kzUEUwTkxq?=
 =?utf-8?B?NW83bVlWQTdHY3NYRkRJN29ZUlA4a0pXdDRrZy9LZlNtZTdBUm1FKzBaZ1V3?=
 =?utf-8?B?RVd2b3pGNjh0MTFsMktqQVREZDE3bFc5aElTaEI2bkw1RmVZYThjZjFrY0E4?=
 =?utf-8?B?TGJhRXB3cXZDUUNzSmxlQ0RxUUJpS2ZqODNJQi90WXlSOEwzcjFzMmRGMVMv?=
 =?utf-8?B?R3YxU01DMGFWeEN3RTJ6c0RDR1JTbzczRFd3TnNLVldDTEIwRUFiWWJXQWIx?=
 =?utf-8?B?ZStSRXpyMHVNbkVPUU5kVTZJakdNTUE1Tlc0U09JSmhwVERFRkJwSlZnWG0y?=
 =?utf-8?B?djJUdTVNNVAyL3FWNTRSZTl3S0xmUTBXZUxrUHU0VVpJcDJhNEd3ZjFKR3pM?=
 =?utf-8?B?RXphRUNRY3NMYi93V3ZsMllWWm1VYTVOc2JwYzQyd0t4MjEyNG1GTFg5UUVp?=
 =?utf-8?B?Nm1FT1hLNWVvcjVOMlVNZUF3MFV0V2FUTXNRbXYwS0J3b2llZTFVZUF6VytJ?=
 =?utf-8?B?YytrVHJ4TFB1ZHFpU1NPV0NZMXcvY1JwS29ERDVtbHY1RVhVRExibDE5Z0px?=
 =?utf-8?B?SUs5SFJFb1RidjVIa3hqTHl2c0p2Q01lUG84OFdHWVE2YmlTUlZkcEpucFM4?=
 =?utf-8?B?ZWJ3aDUzR1gwcTVjdGxQZlYxNlNMV0NqYTV6S05neHB3WG94YWE0QU9nMzJt?=
 =?utf-8?B?THEyWVB1Z3lBMzkzVHdwTG1kVHFXR2l2Tytpc3VobXhmd3hEYmxLdzRQeXRv?=
 =?utf-8?B?OUtnVVZNWnpUdUtNZ1Y1Ly9mdC9uVmluek5EdzloWTZwY0FhZDJtSzVjNkdz?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEA1B58C57E1324EBD2E8E991B679679@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2FS3J36jefkmWzrOQ3MILlJHql/kzT/OHG/WwRqxjtNVFlRqiECxnje2SytyoPxVSJdSs45sL1gsQs0QjhCYyNKKciOcXQi/zbGX56K6ufBYEQdKB0yzYlWD6JUA9l4ZRAjHp60TEpp7+KyLonihZ49w3qgzsc0cISX3Q5muc4reAmkkL56PCXC5sJfUpkjv9Nf91GWXzIIsZUbMSHYhVSTvA4+RnhgcbLhiduzD1XSSZbETyOVYhZSBPI05kQoyJ8U6Bi5NG45MUjkpOBhDQFGiSDcLX+I63Hb73C8oGecQiTMp+Wm1RGVTGDcf7NWtX5/9IIBZ1RSe9ocvgUa/xORK1JXr9xPpD6XZ8Z/9mZBb51ZRypMfLcZWk/LrUy2xCYvTiBXyH5RY4Esx1dxQ0Ux+2VPVGCm65M3PvMVUGqq/Q5TqU7Z9GFqi5h1kfDsWKMqOGc9NgGXYYrz7BzxoD9C2eGp0tT7KJt0PAoeD1ve6xJK6u6l1DwJKWQvKgSn/X6bMH9pAng6SjP1+GYg5HBSz1xdSE9KFbwRdzJjErvIqj107K7TY6lbUXoxLnGmhZvWlrpk6UIbiIBGjCG26R0F0I3o+Dp1G7RaM6MTC//HmQm8fQYGnbZZRkld5vUQpTit06TkARb8tm+y849jEQA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767bac44-dc82-47cf-a154-08dc866648ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 20:21:44.7681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9gvVRNNXT0d/CfgLvhH2Xg74L+8Zu4Dn8B0I0ErKnvbyvBa4QB/6rWtYQVwPs/4wxfsqFaVfuG+JMo1JD592g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145
X-Proofpoint-GUID: Iz1mYuMj6Yo894i4HJUEh90I5oauNZin
X-Proofpoint-ORIG-GUID: Iz1mYuMj6Yo894i4HJUEh90I5oauNZin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=847 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406060140

T24gVGh1LCBKdW4gMDYsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiBPbiAwNi0wNi0y
MDI0IDAyOjI4LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gV2VkLCBKdW4gMDUsIDIwMjQs
IE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gT24gMDUtMDYtMjAyNCAwMTowNiwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFR1ZSwgSnVu
IDA0LCAyMDI0LCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4gPiA+ID4gPiBPbiAwNC0wNi0yMDI0
IDAzOjAzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gT24gTW9uLCBKdW4gMDMsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3Rl
Og0KPiA+ID4gPiA+ID4gPiBXaGVuIGRpc2Nvbm5lY3RpbmcgdGhlIFVTQiBjYWJsZSBvbiBhbiBM
UzEwMjggZGV2aWNlLCBub3RoaW5nIGhhcHBlbnMNCj4gPiA+ID4gPiA+ID4gaW4gdXNlcnNwYWNl
LCB3aGljaCBrZWVwcyB0aGlua2luZyBldmVyeXRoaW5nIGlzIHN0aWxsIHVwIGFuZCBydW5uaW5n
Lg0KPiA+ID4gPiA+ID4gPiBUdXJucyBvdXQgdGhhdCB0aGUgRFdDMyBjb250cm9sbGVyIG9ubHkg
c2VuZHMgRFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORA0KPiA+ID4gPiA+ID4gPiBpbiB0aGF0IGNh
c2UsIGFuZCBub3QgYSBEV0MzX0RFVklDRV9FVkVOVF9ESVNDT05ORUNUIGFzIG9uZSB3b3VsZA0K
PiA+ID4gPiA+ID4gPiBleHBlY3QuIEFzIGEgcmVzdWx0LCBzeXNmcyBhdHRyaWJ1dGUgInN0YXRl
IiByZW1haW5zICJjb25maWd1cmVkIg0KPiA+ID4gPiA+ID4gPiB1bnRpbCBzb21ldGhpbmcgcmVz
ZXRzIGl0Lg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gRm9yd2FyZCB0aGUgInN1c3Bl
bmRlZCIgc3RhdGUgdG8gc3lzZnMsIHNvIHRoYXQgdGhlICJzdGF0ZSIgYXQgbGVhc3QNCj4gPiA+
ID4gPiA+ID4gY2hhbmdlcyBpbnRvICJzdXNwZW5kZWQiIHdoZW4gb25lIHJlbW92ZXMgdGhlIGNh
YmxlLCBhbmQgaGVuY2UgYWxzbw0KPiA+ID4gPiA+ID4gPiBtYXRjaGVzIHRoZSBnYWRnZXQncyBz
dGF0ZSB3aGVuIHJlYWxseSBzdXNwZW5kZWQuDQo+ID4gPiA+ID4gPiBPbiBkaXNjb25uZWN0aW9u
LCBkaWQgeW91IHNlZSBkaXNjb25uZWN0IGludGVycnVwdD8gSWYgc28sIGl0IHNob3VsZA0KPiA+
ID4gPiA+ID4gdHJhbnNpdGlvbiB0byBVU0JfU1RBVEVfTk9BVFRBQ0hFRC4gVGhpcyBjaGFuZ2Ug
ZG9lc24ndCBzZWVtIHRvIGRpcmVjdGx5DQo+ID4gPiA+ID4gPiBhZGRyZXNzIHlvdXIgaXNzdWUu
IENhbiB5b3UgcHJvdmlkZSB0aGUgZHJpdmVyIHRyYWNlcG9pbnRzPw0KPiA+ID4gPiA+IFRoZSBk
ZXZpY2UgZG9lc24ndCBpc3N1ZSBhIGRpc2Nvbm5lY3QgZXZlbnQsIEkgZGlkbid0IGhhdmUgdHJh
Y2luZyBlbmFibGVkDQo+ID4gPiA+ID4gaW4gdGhlIGtlcm5lbCBidXQgYWRkZWQgc29tZSBkZXZf
aW5mbygpIGNhbGxzIHRvIGRldGVybWluZSB3aGF0IHdhcyBnb2luZw0KPiA+ID4gPiA+IG9uLiBB
ZGRlZCB0aGlzIHRvIGR3YzNfcHJvY2Vzc19ldmVudF9lbnRyeSgpOg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IGRldl9pbmZvKGR3Yy0+ZGV2LCAiZXZlbnQ6IDB4JXggdHlwZT0weCV4IiwgZXZlbnQt
PnJhdywgZXZlbnQtPnR5cGUudHlwZSk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gV2hlbiBkaXNj
b25uZWN0aW5nIHRoZSBjYWJsZSBmcm9tIHRoZSBob3N0LCBJIHNlZSB0aGlzOg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IFvCoMKgIDUwLjg0MTQxMV0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4
NjA4NCB0eXBlPTB4NDINCj4gPiA+ID4gPiBbwqDCoCA1MC44NDE0NTddIGR3YzMgMzExMDAwMC51
c2I6IGV2ZW50OiAweDQwODYgdHlwZT0weDQzDQo+ID4gPiA+ID4gW8KgwqAgNTAuODQxNDk0XSBk
d2MzIDMxMTAwMDAudXNiOiBldmVudDogMHg2MDg0IHR5cGU9MHg0Mg0KPiA+ID4gPiA+IFvCoMKg
IDUwLjg0MTUzNF0gZHdjMyAzMTEwMDAwLnVzYjogZXZlbnQ6IDB4NDA4NiB0eXBlPTB4NDMNCj4g
PiA+ID4gPiBbwqDCoCA1MC44NDE1NzFdIGR3YzMgMzExMDAwMC51c2I6IGV2ZW50OiAweDQwODYg
dHlwZT0weDQzDQo+ID4gPiA+ID4gW8KgwqAgNTIuNjUwOTkwXSBkd2MzIDMxMTAwMDAudXNiOiBl
dmVudDogMHgzMDYwMSB0eXBlPTB4MA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSAiMHg0MDg2
IiBhbmQgIjB4NjA4NCIgbWVzc2FnZXMgYXJlIGVuZHBvaW50IGV2ZW50cyB0aGF0IG9jY3VyIGFs
bCB0aGUNCj4gPiA+ID4gPiB0aW1lIHdoaWxlIGNvbm5lY3RlZC4gVGhlIGxhc3QgZXZlbnQgaXMg
dGhlICJzdXNwZW5kIiBvbmUuIEFmdGVyIHRoYXQsIHRvdGFsDQo+ID4gPiA+ID4gc2lsZW5jZS4N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiB5b3UgbmVlZCB0cmFjZXMsIHBsZWFzZSBwb2ludCBt
ZSB0byBhIGRlc2NyaXB0aW9uIG9uIGhvdyB0byBvYnRhaW4gdGhlbS4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gTGV0IG1lIGtub3cgaWYgeW91IHJ1biBpbnRvIGlzc3VlcyBmb2xs
b3dpbmcgdGhpcyBpbnN0cnVjdGlvbnMgdG8NCj4gPiA+ID4gY2FwdHVyZSB0aGUgdHJhY2Vwb2lu
dHM6DQo+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2RvY3Mua2Vy
bmVsLm9yZy9kcml2ZXItYXBpL3VzYi9kd2MzLmh0bWwqcmVxdWlyZWQtaW5mb3JtYXRpb25fXztJ
dyEhQTRGMlI5R19wZyFiYWhmamlsNUhFVXEtZk9IQXdEZnVzdXRMSkNMb2duZnlMSFRGTGlTbFZ1
Wm90cHI5OVhCR2c3bkIwelJSbk5GX00xcHFFS2NWYTRLeE5Kd2gzX0YyZFpXd1ZLVGtVWSQNCj4g
PiA+IEkndmUgYXR0YWNoZWQgdGhlIHRyYWNlcyBhcyBhIHRhcmJhbGwuIEhvcGUgaXQgc3Vydml2
ZXMuDQo+ID4gR290IHRoZW0uIFRoYW5rcy4NCj4gPiANCj4gPiA+IEF0IHRoZSBzdGFydCwgdGhl
IFVTQiBpcyB1cCBhbmQgcnVubmluZyAoYW5kIGRvaW5nIGV0aGVybmV0K21hc3Mgc3RvcmFnZSku
IEkNCj4gPiA+IHNhdmVkIHRoZSB0cmFjZSBhZnRlciBwdWxsaW5nIHRoZSBVU0IgY2FibGUuDQo+
ID4gPiANCj4gPiAgRnJvbSB0aGUgY2FwdHVyZSwgd2UgY2FuIHNlZSB0aGF0IHRoZXJlJ3Mgbm8g
c3lzdGVtIHN1c3BlbmQsIHNvIHRoZXJlJ3MNCj4gPiBubyBzb2Z0LWRpc2Nvbm5lY3QuDQo+ID4g
DQo+ID4gQmFzZSBvbiB0aGUgc3VzcGVuZCBldmVudCwgeW91J3JlIHJ1bm5pbmcgaW4gdXNiMiBz
cGVlZCAoaWdub3JlIHRoZQ0KPiA+IGluY29ycmVjdCBVMyBzdGF0ZSwgc2hvdWxkIGJlIEwyKToN
Cj4gPiANCj4gPiAJaXJxLzk0LWR3YzMtNjMxICAgICBbMDAwXSBELi4xLiAgIDE0OS4xMzkyOTA6
IGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAzMDYwMSk6IFN1c3BlbmQgW1UzXQ0KPiA+IA0KPiA+IFRo
ZSBEU1RTIGZyb20gdGhlIHJlZ2R1bXAgaW5kaWNhdGVkIHRoYXQgeW91J3JlIHN0aWxsIGluIEwy
IGRlc3BpdGUNCj4gPiBkaXNjb25uZWN0ZWQuIExvb2tzIGxpa2UgdGhlIHBoeSB3YXMgdW5hYmxl
IHRvIGRldGVjdCBhbmQgd2FrZXVwIGZyb20NCj4gPiB0aGUgZGlzY29ubmVjdGlvbiB0byBub3Rp
ZnkgdGhlIGNvbnRyb2xsZXIuDQo+ID4gDQo+ID4gQ2FuIHlvdSBleHBlcmltZW50IHdpdGggc2V0
dGluZyAic25wcyxkaXNfdTJfc3VzcGh5X3F1aXJrIiB0byBkaXNhYmxlDQo+ID4gdXNiMiBwaHkg
c3VzcGVuZC4NCj4gDQo+IEFkZGluZyBzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsgZG9lc24ndCBt
YWtlIGEgZGlmZmVyZW5jZSwgYmVoYXZpb3IgaXMNCj4gaWRlbnRpY2FsLg0KPiANCj4gDQo+ID4g
DQo+ID4gRG9lcyB5b3VyIGRldmljZSBzdXBwb3J0IFN1cGVyU3BlZWQ/IElmIHNvLCBkbyB5b3Ug
b2JzZXJ2ZSB0aGUgc2FtZQ0KPiA+IGJlaGF2aW9yIHdoaWxlIG9wZXJhdGluZyBpbiBTdXBlclNw
ZWVkPw0KPiANCj4gSnVzdCBjaGVja2VkLCBzdGlsbCBjb25uZWN0cyB3aXRoIHN1cGVyc3BlZWQu
IFdoYXQgbGVkIHlvdSB0byB0aGluayBpdCB3YXMNCj4gb25seSBoaWdoIHNwZWVkPw0KPiANCg0K
Qml0KDQpIG9mIGV2ZW50IGluZm8gKDAwMDMpIGZyb20gZGV2aWNlIGV2ZW50IHZhbHVlICgwMDAz
MDYwMSkgaW5kaWNhdGVzDQp1c2IyIHNwZWVkLg0KDQpSZWdpc3RlciBEU1RTIGZpZWxkIDI6MCBp
bmRpY2F0ZXMgZnVsbHNwZWVkLiBFdmVuIHRob3VnaCB0aGlzIHdhcw0KY2FwdHVyZWQgYWZ0ZXIg
ZGlzY29ubmVjdGlvbiwgdGhlIGxpbmtzdGF0ZSBkaWQgbm90IGNoYW5nZSwgd2hpY2ggbGVkIG1l
DQp0byB0aGluayB0aGF0IHRoZSBjb25uZWN0ZWQgc3BlZWQgZGlkIG5vdCBjaGFuZ2UgdG8gRXMu
RGlzYWJsZSBlaXRoZXIuDQoNCj4gRG8geW91IHdhbnQgbWUgdG8gc2VuZCBuZXcgdHJhY2VzPw0K
PiANCg0KQ2FuIHlvdSBhbHNvIHRyeSB0byBkaXNhYmxlIHVzYjMgcGh5IHN1c3BlbmQgd2l0aA0K
InNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayIgaWYgeW91IHRoaW5rIGl0J3MgY29ubmVjdGVkIGlu
IFN1cGVyU3BlZWQ/DQoNClBsZWFzZSBjYXB0dXJlIHRoZSB0cmFjZXMgYWdhaW4gaWYgaXQncyBv
cGVyYXRpbmcgaW4gU3VwZXJTcGVlZC4NCg0KVGhhbmtzLA0KVGhpbmg=

