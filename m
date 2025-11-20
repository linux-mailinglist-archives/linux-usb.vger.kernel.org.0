Return-Path: <linux-usb+bounces-30753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CCC71B06
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C41C34F140
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 01:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB622571BD;
	Thu, 20 Nov 2025 01:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rqe24vNN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BF0aHuhd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XcvS24K/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FB257448;
	Thu, 20 Nov 2025 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763602508; cv=fail; b=tKqOULzuxQvYCqpe+MiONeolpO64drZGUtz+YY+ol4mRmjAa3BysDsqDyF/BZecvjl7qkEZcCp8eupKt1DFDCTohc3Jv98tpdkNpnWq+9Wy67++E6ZaY1eSYLVEEO5/Z0IP6Y7jtgfoLH+PK9lnlOKlCn14AUzqvTpDR2m3spyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763602508; c=relaxed/simple;
	bh=efAqeen8MiIpaxn8D6ti0VSITm5dHvHxQZ9396TTYxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QvtceAHZrkYFtO1hIbkKiNZ5RD6Dm07dGsllF7v6GqW5zZeSoeM+EG9S0pf2pguLuXiTziNNUW2AsRmwwywPijP7sRRJSEIhyD1jEN8AMEzjEyQax0G4OlP4Ye1+4Tsv/zY6fdsnazde26zLcF5tb3DVlHdcMBjfsA0GocEL1ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rqe24vNN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BF0aHuhd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XcvS24K/ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJNcA2j550255;
	Wed, 19 Nov 2025 17:34:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=efAqeen8MiIpaxn8D6ti0VSITm5dHvHxQZ9396TTYxM=; b=
	rqe24vNNXstUCPHTzPSFeygNfuftM9oyeXqpmpm+Bf7GKwp41wJfBwlTiOsH1W1y
	0zBucymxfjeg6xB/FUKpg9xx38sWIP0oLV9ONmHh7GMnegnQAsHwljhtumsh14S0
	6sRvAQtQELFTckoVxnZOkjuOm+7jGsKxuk3+lyzwqpXKvDw6N2MG8poM1onhZXci
	3IdXb+zHlM5R1RP4JsBiiZ3iqb7AzKMU2e22v4IGG+QNvACiTDAWErPSR5yehHd5
	VL1mQGmlgVg8UIfS4eTl7OQ4PIy94rQBJ0Qhhf8OaCxsassmhgkdcVwEoK65VMM3
	bSwXm9s3k/iW4umyeBeTpA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ahjb1a2dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 17:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763602496; bh=efAqeen8MiIpaxn8D6ti0VSITm5dHvHxQZ9396TTYxM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BF0aHuhd21C4VnEMvae8QgTobS4w9a6i0RX7TfpBQxbrSJObUjIDjKnm72ACBe/dG
	 n4UOruljCUeXDQ1llBsnc6QsJjaNMpQ3ZMG4Yg6WZmaVlOL2jeLlyY8/luqqsoljkf
	 CYwxj7eCa+9uulbTcUkEF2/y+lUqamjFgyxvsGxh2GW9P513cWiDOK7gx1w003wIGX
	 MYA2+AUfb+50u8XQoU7ScJ1Yc/6hSbqqn95S/WLud/yaqhYlKbjrqjkYl88oP4vJRO
	 D1Ba3dewbru8wjwfAUDq+BY9958kl8ntUN7ATNIVcEzXMMIlwYZxyPfhSqcce9Jsef
	 E9X8p1GiAz0Kg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4EACD40226;
	Thu, 20 Nov 2025 01:34:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E52F9A00E0;
	Thu, 20 Nov 2025 01:34:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XcvS24K/;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00101.outbound.protection.outlook.com [40.93.13.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 21E2740619;
	Thu, 20 Nov 2025 01:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRfiNtQ5Q0SaBwyYpZIxlp1Xu5pa8dt18i00t+am1pbLt2ODmI9c8dl5ghysEh4joeShhUEeE59o87/p4EC33lXz7BV6Xi/p6GlP9OXG9rIHrfHL3fYR07BmgjQCAyReeu1NWESTwnRu5N6fdt39i+QwycopTzgmgFpTvtrpefyKQ/mBFAm+0GTZY51z1DNN+N/gKIkhFSqHTf2uAM7zIRDKjpXScL4nrqbg+bKUVM6LPTnh/WvQlqN8Uo6GNCQrHDmqkQu8w27kAUifSYvia41tcURlURo4fKZnikmiu96nLZjOck7FStBivAxGX55Gy1N1ujPf9KbFemq/w0xBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efAqeen8MiIpaxn8D6ti0VSITm5dHvHxQZ9396TTYxM=;
 b=vIK/NdfBodjw7HP0RJMFX/r3Gq5VO9H+XbCM+4xNGNXn4do7vz+bxNQVL4xJHKKy9O7hpT1qEoVDJO8y3Z5wcSX932nRF1rKEt+six/8nju/oU6hePOphSGVzASD6xrnSkks+GBAHW6deNWHY6upycFfrDl++qcJ85VunriWDYGBAh9VOqGIY350bMX8jdolFghTi3QeAhnZy5X4mSRzSzJztQzLS/ZEGdrQN2LgQqyuiZnaQkm1YWazTQykGQsjtTc8OAUxcOe51kZ1O4nsFxqxt2epfD/g8zun9k8pDXUTvUnj5qfPSeX5E+9pmJH2ACTmjngF5i/NhzZNBiPhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAqeen8MiIpaxn8D6ti0VSITm5dHvHxQZ9396TTYxM=;
 b=XcvS24K/EAl5DOU8/CF68+SlAKIC3twsFPPas+RbbzBfKYfZyepyKrylZezL1ShZ4M4qrdqhy7QxZwB4Kyu8MODFelQS9144RgF/9m55DI2hBZE7TzOBPLoYIp7L5N7a7synVeHs0tHIlZeOT3vvD6NAGi68PpoWludDrl2uy2E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 20 Nov
 2025 01:34:52 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 01:34:52 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Manish Nagar <manish.nagar@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: Fix race condition between concurrent
 dwc3_remove_requests() call paths
Thread-Topic: [PATCH v2] usb: dwc3: Fix race condition between concurrent
 dwc3_remove_requests() call paths
Thread-Index: AQHcWXiyy4bnm3m67UaTuP7fbWmt8bT6yMMA
Date: Thu, 20 Nov 2025 01:34:52 +0000
Message-ID: <20251120013446.n5ibpgxghmvhfo2c@synopsys.com>
References: <20251119171926.1622603-1-manish.nagar@oss.qualcomm.com>
In-Reply-To: <20251119171926.1622603-1-manish.nagar@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6437:EE_
x-ms-office365-filtering-correlation-id: 5e06cf18-0a72-4f02-cd5a-08de27d50084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MW1qNHdCODZPbHU0bnlEMXNTSkhPSlRqeDcweVdnV2Q2WWJGQXhIRzVST29M?=
 =?utf-8?B?cVBtMHp4YnRjU2ZuVTR3SnBTdEVqM0lMdUJMblFvc09Pc0lWWTdCV3B2Tm1k?=
 =?utf-8?B?SGphanNnV1FMemMwTEpGWHczWHRmU0tNL1RmaGRkSlJqZXZ3MW15QzJ0Tmx1?=
 =?utf-8?B?Vk5iOGk2dmFIaEg5SjVSSHhpUGVGem5jVk5mMzk1d0VqVXNoeG9KK2xNZzdL?=
 =?utf-8?B?cGhLa3lmYTdybWtJNWNzTlc3MDg1R0l3Ni9kWGl6ZGtNWnVUMGovN3hYWHNT?=
 =?utf-8?B?Z0psKzB3aVFZazFROFp5R3Q1N0o5ellaeUlNdXdSSHViSll3RnE2MzJFWkcr?=
 =?utf-8?B?ODBYTFpxejNMT1Zvc0RDcG5BSFRMNnV0SUl2V2pCclBiMGhZS2NYMXNmdElN?=
 =?utf-8?B?NGxwT053ak91NlRNbnBrOGVKOUNNbk0yN1FFd3RwcXZqZmlQOVhYcHNzZjR3?=
 =?utf-8?B?akZ4OHNxbHgySWpPT3BPMWZ1a2pUMUJ5alNWSE9BbXhqa3JtVzVqNy9lTUFS?=
 =?utf-8?B?b1RmNmpaS05JcWFlU2Rqc1NrQXRFZUJ2VkpqT1kxVmZMUWMwejlUR3pueVF4?=
 =?utf-8?B?bHlmTVE4a1hXN3RwTmRFSllGU0tPalN4WGdGRlR0Rno1cC84M25RL0E3N1Nn?=
 =?utf-8?B?bXlORTdNZW5nRVd1dlFjQnZiZTVSRE9WSHVKb0ZocTFCaFZadDlrVXFuY2dY?=
 =?utf-8?B?eFhQbXRpVENybzlDZFpzZHVYWFFwZ0F4RDZTTExjWmd0aEFRcWdPb09PREdX?=
 =?utf-8?B?cDhiN0JudGZjeHYrYVF5VHNBc2RWbzV2aUJKTjY4c3dhYVBqSWNaWTl2SUov?=
 =?utf-8?B?SUtrVUpDZmV3dDZ4TzhhelQ2R0dFcUpJdGFqcGxBZDBnMTlQc2lNeUE5b1Jy?=
 =?utf-8?B?SW5McStBVDRyNnVNWkx2WWdpazc5SThsRFhWUTdlaG52ay9scmFXdXZ3U0t1?=
 =?utf-8?B?RXQ2MEZaTjBnVE85UnRQK3UzUVdCN0tHZ3A3YUpxV2h6QlNNMVpMWU1DZkg0?=
 =?utf-8?B?K2VaT1daZXhwSWZTdU9uMnJtNnBpRksrNmNkOG42UVdPTys3bUREU1pPdmph?=
 =?utf-8?B?eWpLc2p5N0hJUnpXV0ZGMFBuV3RtMkFYUTZVWnhQLzI0bzRVS3ZqL1h1emtO?=
 =?utf-8?B?aU9VRGRpczVEZWl3UUJWcnFwU3RHaXQ2MTVLSERlNTdzS01lZGNVck52L3ZL?=
 =?utf-8?B?SGZhd0dQaThPbUR1TDdsU0oxL1dCcGhTaE8vVlB0WlVzYkFMRUlRVHpXVUxH?=
 =?utf-8?B?bHNIZlBxR2tYQ2JkNWZIWjVmVXhSY2VYR3dja2NHZVZNNGFjbWFzVGhsVTJK?=
 =?utf-8?B?YmJ5aElmelZFTmxsdFB4SVIrbjI3NmZZbW80aURFVzZ6UjIzUHRRTm03c3F2?=
 =?utf-8?B?anRVQlpOVVd3NUhKVTArSjlhZHNRK1JxZnRtWDNjcEc2SE9XNzFnK1hBQk9B?=
 =?utf-8?B?K2tLUWZPb09kbWZBVy9WTGFkNFlsSmxtY0UvUmJpTlY5KzhHMmgzUlFiS2NJ?=
 =?utf-8?B?d3BRQ0pib1JTRnJvWXgvTHRwcjF1bUJiWk1UVkx2MGdFUlV1QldsZHNoWVFk?=
 =?utf-8?B?cUMwTkZHLys0RCtGejcxb1hKU2orcWJjK1B4K2Q0RjJycnRCTzk3QWxhMnBH?=
 =?utf-8?B?eVczQzFscTVZdldiQmJwSDFyZ0Y2U3hTWHp0dW1YSUZGUlRaMVB0MDR5QTAr?=
 =?utf-8?B?eUJSVmp0bVArVFp5VkFPWS9aTjgvUUZTem56bnB1NFFRYnovUTJpSDVocjhr?=
 =?utf-8?B?WW1hODI5N0ZpMURtMCtVL2pUK09DL092VGFVWEdDNjN1d1V2T0czTmo0U2dH?=
 =?utf-8?B?S2xxMGs0aUxEcENtMGc5MURiMmV4azZ5VWkvRUNQSWtJeWJleTdWK0tKQXRi?=
 =?utf-8?B?bGVDbC93SjljVkd3UWFYS0toVDZKb3kwZDJoVHNoTzdxcUpVUllCSzJHeGJF?=
 =?utf-8?B?Yk9QRXA0YnkxNXFBSE5WL0R4NUFwb3A1WW5wWEVMNTNVTHVlK211TDNSdy9i?=
 =?utf-8?B?aER3ZHFhakk4KzFPSnFuaVI4Z3VhWi9iUXhodkJ0TWVmVXRKMm12bkp2U1lG?=
 =?utf-8?Q?Y2hmug?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEFkOVBpU3FrN1g3YXljV01SbDhYc3hoY3prYnBhVUNJaGd3QXJJL3lERVFK?=
 =?utf-8?B?WDhKMkpURkdnd2gxSS9Qd1RVZkZFcGxPNnVKUzQzdmhOL0pHQmxneWdaRWxP?=
 =?utf-8?B?ZkFhU3hIcTBRZ1hvdkpPdzljdFRxQ0M3WG03S01saDVtV1BoUnR4aU9ZTVlt?=
 =?utf-8?B?dk1PckRyckxzK2NaN01LMDdLTElOeWVhdCtCQ1VPak45b3NOTHg2dVBzdHFE?=
 =?utf-8?B?RkdTWlV5a00xaEtXZFFIOEpUcmdYUVcwL0E2QlpmMWs1UEpNK2JUUDR3bmxI?=
 =?utf-8?B?WW1XeGVlcFlXbUdiQmlyRHJqUFBJNEJzNHQxMFl1L2Z0OGZiaGtsUUJMTEds?=
 =?utf-8?B?K0hOYkdqRkxTTVh4ZzV0cGJNbEdqa1FmWSszZERzUTJ5cUs2TW4xNG5vNnlm?=
 =?utf-8?B?V015ODdNdVNDL3hvNVVsUmhFUWg4T1h6T24rNWlIU3VLV1lmUHZGK0hXbUZM?=
 =?utf-8?B?OWErbDA0eVpjK1g3bnJHTGVNNk1tNkFzUjRUdHpkT0hqelVRK0JXYXBtUE9E?=
 =?utf-8?B?TlA2anJUbTdIKzgxMUI4NGVBT1U3RmttS1VwdlNuS3ljVWk0R3E4RnBUNVFr?=
 =?utf-8?B?dnVzckovQi9mV2F2THliWFBPRklEOUR6cmp0Y3ZTRlVvQmFyUDZSeTltVWt3?=
 =?utf-8?B?SDZpcGxEV2J5YWs1WmZzTGErbmp5UnplWjVKVS96TDhaaXBDd2hySFRzcWVT?=
 =?utf-8?B?ZnN6K3J3NmhhUVFRcWRwVHBXS1JDR0lnVmprUFRVYTFhSWxjbVB1b3huekRx?=
 =?utf-8?B?UURpbC9yYW5Ybzd0VlFWcTAzdlFNei9zNVp2VThOWTZiT1A1UEE5Qzc0WXhu?=
 =?utf-8?B?VzJVSHUyYk94cDNuNVBBdnFYLzNUZmRicU5qNHc2VEU0cWpsN0lEelpEeGJG?=
 =?utf-8?B?VlB4aUFJRkdJOUFwN25rN2xyY1dUbWtNVWppYjZXR0Z4eFg5UTN3NFpkcGw0?=
 =?utf-8?B?cG5nbUFmVzI4WjNQckRXdjVBVkNVZFE2ZWY4azBKYkM5U0dSdSszWGVOTlVo?=
 =?utf-8?B?eHRCV3pUVnlEcXBwaCsvZG9abFRBRlhiYzNqOUFzeXpTalNMaDVnZndtMFRX?=
 =?utf-8?B?NFhlU3IvTHV3R3ZWTkVRaW1hT1VDQ05aLzd5cjFWTHNjSk9VZlJGM2dwZXJE?=
 =?utf-8?B?ajFvVVlHUHg4OVJXWHdKY2hLbllJOGhLOUNZYi8xbEVWbjE5VFFNeSthRml4?=
 =?utf-8?B?RGpGTTgzY1JSNGRuMlJaYjk3bHljdnBpMVhZRDhFMll0ZUxSd1lKMGZZcDJK?=
 =?utf-8?B?dWZYTDNNbHM0QWhUNG1JdWpQVzdhdmhUaXU2cmZ4RURhNUU5SjRzK3hrT1Rk?=
 =?utf-8?B?R0p1L05FTGZBU0pnaW8rRkJLYmxHTDkvNnUxd3YyalEzejNNckEwVjVOU1Nv?=
 =?utf-8?B?WU1ET2d1dHQxYlhvSGJ2b3RjU1FTaXloT1pVdnhBQ3Vtb1hWWE5vVjFBU0lG?=
 =?utf-8?B?c05LZjZVKzdhdUNTVlJmb3ZFMUN0dGUraklSa3FXNnZ4SDBFdTJYcW9tQkVT?=
 =?utf-8?B?S1ljOTNNc3BSaVdjdC9nTWR2cTFLRzdCV3RmcFpXay9XYnlwSlhBWVJBaklq?=
 =?utf-8?B?M0hxZ25kMWRRVVFONC83aUo3QVpWcUxPWDc2ejlnK2o1Nk1LS2szTmRxZisx?=
 =?utf-8?B?SUR2b0Nodm5ESlhXcGpLTlhzeXk3TE81U3dFTmtKRnlGWXU5MWVyWGRtMDB6?=
 =?utf-8?B?NHpxQ3JjdWhtcEpUemNKQWQ0aVlLZmFZVjBuSXBsdkE2cldWcWtpQkxtT1Fa?=
 =?utf-8?B?eTRBWitlWDZQYVIzeWVyQnJPM3NLQUdMRTdjb2gwWGM3M0hYS2ZwajJOUS93?=
 =?utf-8?B?RG43TXd6VG4wQ1owTm0yS21hTHQxcGMzb2ZlYWh5OUhpTkdwVXN6SGlDUmhl?=
 =?utf-8?B?UWlWeVFXN05zdU5xQzF6a25TNUJiSVhDTWtrc2NQaUVjWUpWMUVuTW5DYUpL?=
 =?utf-8?B?bTZmc1JsR01JVnZJV1p4d3JSYnIySTNDMmpSNFdKM2hoTkY0U2ZRSkRkQnBn?=
 =?utf-8?B?OVVEdGpsdjRoM1dyMm8zVXNNekx2aGJvKzFRcWVQNEZIdGl6TFQ5djJ4RnpY?=
 =?utf-8?B?ZXVFc1FTam9pT0ZXZzBGUHFoUHpyK2hvOEgzSkFSUjlKQ2JObS96dFoyZ0Y1?=
 =?utf-8?B?YUJPelVOSlVLdzFFcmZRRW1VNFJZbENsanB0OWVtSUxsMGRaRGNmTWZIbU9p?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <470A3C013242764AB639CB48A497FC97@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O0Yj8Unbd4V1q1aEFqaHIrpF8rUIREoV0NqkWEZ4PutCJF779todlEVU245cmNM/u7JoXBN6Vq3yHVMuj9hjuticXsZgl2MzlBNY64iAAb+PbtG5XWHTqLNrR8EWlxHjJd5Ki/ma7v/Exi/oLKMy1upEV9L6sZpq5+SX7DNF1lYFZVqziNglpgnRCFocbXg0D2ASpQwiu+iSE5yCmYEzdeIEXfjv3EDo6cq9SeJd38cuRlAg8/+lumE962x6rIq/OrY2gYi2bJCEG32rgFc7O8Oj6GR0uO18YrZzCXINKhm0ed6yAn8WdS/c2Pejfb4k7xtgYMIoaCTmZ7VlZFcdhr8ZYi2JUIBnXO/tCb2v1Otpw0caELZK2gFGJJlD/IbrWwDYzM+Qn4Sr6sOOGxn3ag2W4JU8ouryQ1cMbKUDKpL9p6YzE7fj0fs0M7aJoGkeeHaNJVnvJSVcKE47LBew/wbskwpD0LD0aDvmZYz2IKE3wimLY9riJ7mDPaVy+Fu+Gdx3BbXSN3dChIoi/OBDuRLu/U8/6NhquViDNf7R8S6vlX0zp7SvlKDbq3He4xJaZWFORL+eHoh0zMUgioyof0UINJLROfpRo365ctScxlEr/26IzxidbSJM26up134pPY/ZNIZPcmk8mpRTutPjdA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e06cf18-0a72-4f02-cd5a-08de27d50084
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 01:34:52.2939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6oREbwu+vZHLvvxWdaf4GlkozUOf35PRqVZsu1HQOciPE9tWcj/p1GnTZgaBmnTn1v1bj6nW8XD6B8YcOdhLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
X-Authority-Analysis: v=2.4 cv=B7O0EetM c=1 sm=1 tr=0 ts=691e7041 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8
 a=YmUmtjH_99bRf4nHA20A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SfEmizjXpvbHkQe2oBY-_P5vYg5qjFEI
X-Proofpoint-GUID: SfEmizjXpvbHkQe2oBY-_P5vYg5qjFEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAwNyBTYWx0ZWRfX2KrKs4AUmTZ+
 0qgeXxmK+eoK4APs0AroyO17zucASMgRsIuPy7J8aQbsZU5HhlLr5SZlDOC038WtHDOiy0bIKyl
 jl1mY3potUistzEXYVXUzLlBcDq0ZV/MUJl2cd/bwtUfLDS5ZEkJLLhCneDPLkCTUbVLUM3D5gA
 nv8DnyleY1hERthOUf4WZZq5Lknp7v0Prm5eb5htfuYnoAQ3/CZHc7oeIxopXRJPFLh9oze6nWN
 WhKA+MxEetd1YTNgI8F1K5cUFwN+t/wstsAtd08k13RvTYWMbs2im5QVHL50gy08B1+gB5eHtFF
 qQGsOu9fQA9ZnmJcWwl840PvyjcnL1C3CvlJz/n4GuUofnzHS2fRabQW881n9VPDrNeU68kUmLD
 8fybNJVHBJK4AAXDOFX+Z7RHGDV+RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511200007

T24gV2VkLCBOb3YgMTksIDIwMjUsIE1hbmlzaCBOYWdhciB3cm90ZToNCj4gQWRkcmVzc2VzIHJh
Y2UgY29uZGl0aW9uIGNhdXNlZCBieSB1bnN5bmNocm9uaXplZA0KPiBleGVjdXRpb24gb2YgbXVs
dGlwbGUgY2FsbCBwYXRocyBpbnZva2luZyBgZHdjM19yZW1vdmVfcmVxdWVzdHMoKWAsDQo+IGxl
YWRpbmcgdG8gcHJlbWF0dXJlIGZyZWVpbmcgb2YgVVNCIHJlcXVlc3RzIGFuZCBzdWJzZXF1ZW50
IGNyYXNoZXMuDQo+IA0KPiBUaHJlZSBkaXN0aW5jdCBleGVjdXRpb24gcGF0aHMgaW50ZXJhY3Qg
d2l0aCBgZHdjM19yZW1vdmVfcmVxdWVzdHMoKWA6DQo+IFBhdGggMToNCj4gVHJpZ2dlcmVkIHZp
YSBgZHdjM19nYWRnZXRfcmVzZXRfaW50ZXJydXB0KClgIGR1cmluZyBVU0IgcmVzZXQNCj4gaGFu
ZGxpbmcuIFRoZSBjYWxsIHN0YWNrIGluY2x1ZGVzOg0KPiAtIGBkd2MzX2VwMF9yZXNldF9zdGF0
ZSgpYA0KPiAtIGBkd2MzX2VwMF9zdGFsbF9hbmRfcmVzdGFydCgpYA0KPiAtIGBkd2MzX2VwMF9v
dXRfc3RhcnQoKWANCj4gLSBgZHdjM19yZW1vdmVfcmVxdWVzdHMoKWANCj4gLSBgZHdjM19nYWRn
ZXRfZGVsX2FuZF91bm1hcF9yZXF1ZXN0KClgDQo+IA0KPiBQYXRoIDI6DQo+IEFsc28gaW5pdGlh
dGVkIGZyb20gYGR3YzNfZ2FkZ2V0X3Jlc2V0X2ludGVycnVwdCgpYCwgYnV0IHRocm91Z2gNCj4g
YGR3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXJzKClgLiBUaGUgY2FsbCBzdGFjayBpbmNsdWRlczoN
Cj4gLSBgZHdjM19zdG9wX2FjdGl2ZV90cmFuc2ZlcnMoKWANCj4gLSBgZHdjM19yZW1vdmVfcmVx
dWVzdHMoKWANCj4gLSBgZHdjM19nYWRnZXRfZGVsX2FuZF91bm1hcF9yZXF1ZXN0KClgDQo+IA0K
PiBQYXRoIDM6DQo+IE9jY3VycyBpbmRlcGVuZGVudGx5IGR1cmluZyBgYWRiIHJvb3RgIGV4ZWN1
dGlvbiwgd2hpY2ggdHJpZ2dlcnMNCj4gVVNCIGZ1bmN0aW9uIHVuYmluZCBhbmQgYmluZCBvcGVy
YXRpb25zLiBUaGUgc2VxdWVuY2UgaW5jbHVkZXM6DQo+IC0gYGdzZXJpYWxfZGlzY29ubmVjdCgp
YA0KPiAtIGB1c2JfZXBfZGlzYWJsZSgpYA0KPiAtIGBkd2MzX2dhZGdldF9lcF9kaXNhYmxlKClg
DQo+IC0gYGR3YzNfcmVtb3ZlX3JlcXVlc3RzKClgIHdpdGggYC1FU0hVVERPV05gIHN0YXR1cw0K
PiANCj4gUGF0aCAzIG9wZXJhdGVzIGFzeW5jaHJvbm91c2x5IGFuZCBsYWNrcyBzeW5jaHJvbml6
YXRpb24gd2l0aCBQYXRocw0KPiAxIGFuZCAyLiBXaGVuIFBhdGggMyBjb21wbGV0ZXMsIGl0IGRp
c2FibGVzIGVuZHBvaW50cyBhbmQgZnJlZXMgJ291dCcNCj4gcmVxdWVzdHMuIElmIFBhdGhzIDEg
b3IgMiBhcmUgc3RpbGwgcHJvY2Vzc2luZyB0aGVzZSByZXF1ZXN0cywNCj4gYWNjZXNzaW5nIGZy
ZWVkIG1lbW9yeSBsZWFkcyB0byBhIGNyYXNoIGR1ZSB0byB1c2UtYWZ0ZXItZnJlZSBjb25kaXRp
b25zLg0KPiANCj4gQWRkIGNoZWNrIGZvciByZXF1ZXN0IGNvbXBsZXRpb24gZm9yIGVwcywgIGFu
ZCBza2lwIHByb2Nlc3NpbmcgZ2l2ZWJhY2sNCj4gZm9yIGVwcyBpZiBhbHJlYWR5IGNvbXBsZXRl
ZCBhbmQgYWRkIHRoZSByZXF1ZXN0IHN0YXR1cyBmb3IgZXAwIHdoaWxlDQo+IHF1ZXVlIHZpYV9k
d2MzX2dhZGdldF9lcDBfcXVldWUuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWFuaXNoIE5hZ2Fy
IDxtYW5pc2gubmFnYXJAb3NzLnF1YWxjb21tLmNvbT4NCg0KDQpBZGQgRml4ZXMgdGFnIHRhcmdl
dGluZyB0aGUgYmVsb3c6DQoNCjcyMjQ2ZGE0MGYzNyAoInVzYjogSW50cm9kdWNlIERlc2lnbldh
cmUgVVNCMyBEUkQgRHJpdmVyIikNCg0KQW5kIGFsc28gaW5jbHVkZSBDYyBzdGFibGUNCg0KPiAt
LS0NCj4gdjI6DQo+ICAtIEFkZCBhIGNoZWNrIGZvciByZXF1ZXN0IGNvbXBsZXRpb24sIGluIHYx
IEkgYW0gYXZvaWRpbmcgdGhpcw0KPiAgICAgYnkgd2FpdCBmb3IgY29tcGxldGlvbiBmb3IgZXAw
IHRoZW4gcHJvY2VzcyB0aGUgb3RoZXIgZXBzLg0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZXAw
LmMgICAgfCAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCA3ICsrKysrKysNCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9lcDAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gaW5kZXggYjQy
MjlhYTEzZjM3Li5lMGJhZDU3MDg2NjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZXAwLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPiBAQCAtOTQsNiArOTQsNyBA
QCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfZXAwX3F1ZXVlKHN0cnVjdCBkd2MzX2VwICpkZXAs
DQo+ICAJcmVxLT5yZXF1ZXN0LmFjdHVhbAk9IDA7DQo+ICAJcmVxLT5yZXF1ZXN0LnN0YXR1cwk9
IC1FSU5QUk9HUkVTUzsNCj4gIAlyZXEtPmVwbnVtCQk9IGRlcC0+bnVtYmVyOw0KPiArCXJlcS0+
c3RhdHVzCQk9IERXQzNfUkVRVUVTVF9TVEFUVVNfUVVFVUVEOw0KPiAgDQo+ICAJbGlzdF9hZGRf
dGFpbCgmcmVxLT5saXN0LCAmZGVwLT5wZW5kaW5nX2xpc3QpOw0KPiAgDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiBpbmRleCA2ZjE4YjQ4NDBhMjUuLjVlNDk5N2Y5NzRkZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+
IEBAIC0yMjgsNiArMjI4LDEzIEBAIHZvaWQgZHdjM19nYWRnZXRfZ2l2ZWJhY2soc3RydWN0IGR3
YzNfZXAgKmRlcCwgc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxLA0KPiAgew0KPiAgCXN0cnVjdCBk
d2MzCQkJKmR3YyA9IGRlcC0+ZHdjOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBUaGUgcmVxdWVzdCBt
aWdodCBoYXZlIGJlZW4gcHJvY2Vzc2VkIGFuZCBjb21wbGV0ZWQgd2hpbGUgdGhlDQo+ICsJICog
c3BpbmxvY2sgd2FzIHJlbGVhc2VkLiBTa2lwIHByb2Nlc3NpbmcgaWYgYWxyZWFkeSBjb21wbGV0
ZWQuDQo+ICsJICovDQo+ICsJaWYgKHJlcS0+c3RhdHVzID09IERXQzNfUkVRVUVTVF9TVEFUVVNf
Q09NUExFVEVEKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAlkd2MzX2dhZGdldF9kZWxfYW5kX3Vu
bWFwX3JlcXVlc3QoZGVwLCByZXEsIHN0YXR1cyk7DQo+ICAJcmVxLT5zdGF0dXMgPSBEV0MzX1JF
UVVFU1RfU1RBVFVTX0NPTVBMRVRFRDsNCj4gIA0KPiAtLSANCj4gMi4yNS4xDQo+IA0KDQpBZnRl
ciBhZGRpbmcgdGhlIEZpeGVzIHRhZyBhbmQgQ2Mgc3RhYmxlOg0KDQpBY2tlZC1ieTogVGhpbmgg
Tmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

