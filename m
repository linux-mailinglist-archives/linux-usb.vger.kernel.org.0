Return-Path: <linux-usb+bounces-13397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976595104B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 01:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B513A280D57
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 23:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E381AB53B;
	Tue, 13 Aug 2024 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jZBSQc/7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GaRLLRMm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fBUo0hNC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D336B11
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590433; cv=fail; b=q5FZ7uJXQfqpUhfqzpaqa5Cc8P+pcXi3RD9aTFmBG5DDChHY0vJ0Sta0Jbd5qdsTtSEEkOlCUdVW5tpXMJ6jh9GFsVf3Sx0Rmcuaq+u4194uZaGAd1XjVmtJMTjiE+3odo+UrkyEyb0ZY7TF6xq7WcsU6QZX/AJw7qqj0tJSFSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590433; c=relaxed/simple;
	bh=cpqM9RKz49SgYleypw30/Xep5CfVXQLybIfE4QcZGME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lHXr4Wd4+Dlo8hznV/7qoy+7jOSh2btVJvrnz7tkTSgVhtbAxNLULjm0KMsXqWbbVtYXgHLC/RBaoQ8CeMIzCc39oq+xA9AEfHPdrnohZrcNLlYZ+DLw3+Fkdu70OX/DSgaxL9C7J9wNGw5ePMY1mfbVe7gvBUD+aN4qBimsC60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jZBSQc/7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GaRLLRMm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fBUo0hNC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DN6xKx003676;
	Tue, 13 Aug 2024 16:07:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=cpqM9RKz49SgYleypw30/Xep5CfVXQLybIfE4QcZGME=; b=
	jZBSQc/71Ilh/1qZjUBYIa16HHh+OiO+knyQdEtqV4I4Zp7TWMxk1S2EFhFMlOt6
	hD8LatUnFw/yi4c/qSeQULemAYROqEsmvwlOOBqzJaJgvGK0RK1sS3N01scLEFP8
	mUCBJYqB3vJ4cLFlYC8L0y0w0FSQuZjtnFK3xSoNp0fAW53EktdzKJdAGVb0YtPn
	5Ykb0UBq7zxphiOKlm1CWw+s5+L9WBcrapkotxZ7sT2V6hjky1x4K8Swu0BfdOzW
	3eEmeZTNQRTdNhxF0STlbFrKhLn33NS4gf/DYbletnpCPHixfJKbgNEE+wDOV/oc
	rrxlDzwyiU8pQaXAt8t8SA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 40x6udym8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 16:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723590401; bh=cpqM9RKz49SgYleypw30/Xep5CfVXQLybIfE4QcZGME=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GaRLLRMm89i2m+fBl4dTNVvwtf3uBe4ZHERwlLnZmOZKxY2yKvZnTIdJgQm/bUxgT
	 i1aEPlzi1qkKu6KwFM1hEOIAOSUzt+mvm66oMLJ/7JpXX7IZfl7Een+UX+YdYChFcc
	 QMyqY7du+yTCUe0IGRMuX2mAR7TB81D1PkDg5smQtxPttkuzjdsnDQoVvsVCHRRtBs
	 qcuZYDezm/EcAzQltW+8XawEZAwJ6SmeveMqoNgmfuKs5vSgBEncXV96HxgGjJdpv+
	 Mi+3SYMPm5cCuagAiRdBNfMIWaexoAvCtbIvkFH186YjROi8CksNTDkCaqlqZxsftD
	 td7/PUrV/Dy0w==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2532340130;
	Tue, 13 Aug 2024 23:06:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E399EA006D;
	Tue, 13 Aug 2024 23:06:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fBUo0hNC;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 25D5C4035C;
	Tue, 13 Aug 2024 23:06:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJFyMTTnCkZMNSIDyqel4M+yYQ53mrA6C21kXuEupHoxwcljklSTJ5uiUc41+YSby8sIzZ6mCrvqZajMmIjBiAl1/pS2JwauZUiSzJcO7A9ijuoWg9x67Gj1l4IIkcbI70eTcxvD5dG600O/e541ecF2Di0/+tIn05/3xjRnft9dXhyjcdYkQBowNg2k9t7gPRJoXx/lihu4ZcjQPFU0dFJ42QysTFYyz3b3O00i8GK4A4hnbD4+Wtwj0ayskjNpwIJC6vZFefUFoPvun8x0gH8VwEVnk9F5dxdbIt9wjd82wxXDoNP31RUVEV7IGM8m4boqChOz/8wOCrhNWZJoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpqM9RKz49SgYleypw30/Xep5CfVXQLybIfE4QcZGME=;
 b=DeER1TZKtRyda6g9ur4HtwuoHyL+8i8IZxYZmAvq+6mJW4iDsiDIEGau0dx7Ilm1hKxkB1Qd7HRec1j0VMf1mh81R1sgD4siA1/3XMqdQEHNGnV9y8WZvlu3NoVLBxcKCg/3GZY+RK3uhvhMNUNnpKtouxNGxuATHFVCRttHyBolWN0W51TZoUWY212MHJjn4T311lcwKVjEy8xXqiORcAlnszHA86AOEz6BbhZF/zdaWzK8N2SCxP5oLkFEpfd5zARDkc0WqpiGWn++T4Recfg23c4Yl8FmL/hPPU7UPQYE/86ETCDPNua2HkR7gyNMF0XCMgzF2xHU4AwNhIM0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpqM9RKz49SgYleypw30/Xep5CfVXQLybIfE4QcZGME=;
 b=fBUo0hNCxzklirY09K7Ul0jV1ogtKRzv7OX6gjSDRDD8vG1i5cvk4+oX0upq0CJAgHvM9XJnABjhDsH4tSA2cILyoMsgDD3jkoVaez0qWOD010XRpSXw+8aFdV3eN6c3QukWkfJLj43iMRLyS4UQIztfBQIA5bEWt8TgITLBYZU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 23:06:34 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 23:06:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "kernel-team@android.com" <kernel-team@android.com>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Topic: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Index: AQHa6nSXcGA8h7s8dE6vnyL947IEfLIfjakAgAQoRoCAAh//gA==
Date: Tue, 13 Aug 2024 23:06:34 +0000
Message-ID: <20240813230625.jgkatqstyhcmpezv@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
In-Reply-To: <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6436:EE_
x-ms-office365-filtering-correlation-id: 6b4356d5-747f-44ba-bb30-08dcbbec938a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVk2ZlFLMElSbnJxSG00ekhXK2tCUk9KemVnUC9POEw5SkZNSzVBVFFidjlz?=
 =?utf-8?B?TDIzdS9JYWpXUElxaDNMa2MrR3Q2TUY1MGxyWUxBVVdnYzRoRkVOdThpbG1S?=
 =?utf-8?B?MVMycG5OZEwrMzVXTlRQb2UzMktFUVRGVTM5djNMZ09JVkF5a0tFc2VFVXlG?=
 =?utf-8?B?N3NFcmw4Z1FET241ZDJIUmthSEVZV2FzbHRsaVE1bG5wbmNnUHNzLyt3SUpX?=
 =?utf-8?B?UzlkU1BtNlQyUUVpdkl5NW13N1B5MFpGcXkyYWxUSjI3Y0pvZUg1M0JKTitJ?=
 =?utf-8?B?RXBRYTM5b1Z1M0pkOGNyM0dTeU1aVUlWT2NhaSs5MXZmd0VKU3hFRmNXb2sy?=
 =?utf-8?B?OWNTMTJNRUQ3UlhKNC9zZGFiM1dEc0huSklSaTRLSjR1YWkzaHNINEU3Tk1Q?=
 =?utf-8?B?UlFBWmc3OFBOS0pqV3BpVHBDR2ROVUlQZUNsWHdjUjljT1MzMmRxcnM1UTh2?=
 =?utf-8?B?WnpZbUZWb3BJbk03aDBMT205ZWIxYXVZcmZNODRhVnJ5Tmhld3l4MGZ2U2ls?=
 =?utf-8?B?SFRhV1dQUzNabFEvcnpXNk9uL3JkNCszMzdreTYxdFl4WFI1T1F1K2w2a1FE?=
 =?utf-8?B?MGVFd3pVYmc5bXZOczJtT0FDU1doS1gySTFYMXkxT3UyWjRjYlUxZm9iQzFK?=
 =?utf-8?B?SWc5dlYvdEE3NEZrMzdJQlBlSlZjNytyLzJnYmN5WWg3bTJzLzZ5UStxM241?=
 =?utf-8?B?NzNqY2VrTkdTcFJsR3ZvRytqaWNIYWU3ckY0ZWVPY3k5SmJFZkphWkZ4dXFF?=
 =?utf-8?B?REJEVzdySHJCL0l6V01ZVFZERC9iMDR2NkcyV0tMZktxcVd5M0pRUlFBQjV5?=
 =?utf-8?B?ZzhaYlJEajM5eGFqNkhMOGVLS2lCSmc4T1c2NkF2Q2tzQUxXY3NBS282UzNZ?=
 =?utf-8?B?NzBvNzJKNmVmMjkwVVlUV3hEQlRzeW55NlZ5RlAvdE9nQWZEY1VwdzgyQU9k?=
 =?utf-8?B?K21oODNxZkZEZWFGcEw1VWRpM1NxZ203TjRCUEtmVjRwTFZCL3k2b044YlFK?=
 =?utf-8?B?ZTJKdXhhMnQzZ0lNc0R2NHd1WHVXNXVZRlBwK2VmRVBzYWY3RXB5N0prQkRn?=
 =?utf-8?B?ejVSbkFUU3hXNk9CVXVuZ3ppOWZvcE12QTVUVkhjK2ZjMXhXSVdscjhYUWpa?=
 =?utf-8?B?ckJCelZVcllrczV3eVU1TytaQTJ3VUdFU0dNYXpSeTJTQ053MWpSRUltWC9O?=
 =?utf-8?B?OXFJa281VGx2RzF2TFZaT2RmZzRmZ1NFUWZpZ2VZWWQxMHo2WDVGSy9WMm93?=
 =?utf-8?B?TVhIRW42WEw3RU13YUF4ZWFGUXpEcmFPYUVoSG15by9ISEtkYXJyMkJFaVVV?=
 =?utf-8?B?SEVPUzA1VGNFTWhDVlgwSVVYOU1QZVFjKzlRbnhGZkwyVi9TZmtFY01oYVZ3?=
 =?utf-8?B?N0d6MHFCVkNhVjl3UWNtWXlGeUQ1OVNieEprUEtoYXN1QzJyb1VmY05MTDNU?=
 =?utf-8?B?Y3ZwRUFZakM0VTl0bW52VTZsbXlGdnNxcVlVMmd1VzJkM29nSWs3dDF0aG5M?=
 =?utf-8?B?SURmVW9sUUxNS2VoNTFjNlRhTFZ0TjJOelFiR2FwUG80MGRIazc2b2pPQTZM?=
 =?utf-8?B?d3BZL1EvNVhxOVZMODYrM1NFT1NhSnBsd1RWT0NWN3FWbVNRUVVKUmUrTVYz?=
 =?utf-8?B?NkhJRVJTWXZJajdScGdEMkMwQ09pY1paeEhkM2pPTzFUb1JGMFg3TWZ3a1VG?=
 =?utf-8?B?U3ZIenl4RHJNQ3luNlh1dCtTcldJbzZsWGRlNGJWYldLS2VPZkoveVhIcHNJ?=
 =?utf-8?B?MDB3K1pmQVdFTW13R29sSzZhc2RkaHN6TnZVSnIyT1BiVW4yNFROcGpQTUM2?=
 =?utf-8?B?dCt1c2FXRkpQaUdnUEhub1VzZW1HTkxsdy83UGdGbjRNbGxXcyt2VlBCeTZq?=
 =?utf-8?B?ZFJJODBoNEorNms4RUVaeFdXdmlWMEkzNXpLK2hBU2orZWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDlTNmV4Y2ZYUDl3MmtSYklYbi91VU5MYVBTTlFOYmpVa1h1Vlh5ZWU3MVZG?=
 =?utf-8?B?Rk1KcWo0VTNzbG0wUUxLOXRuVjRKeEEwZi9oQTdudGkwc091M0Myb0Y4VEs3?=
 =?utf-8?B?UWxCUUdUYUc0cVRLbGRZck82cUVlOXlJaEVuRkZDT3gwVGdRU1FNNGlwNklq?=
 =?utf-8?B?RHdpTEY2OHhHNlJFcW84VTl4L0t3YVYvc1VHNXg3bU9OT0U3aWVhYzdHR3dy?=
 =?utf-8?B?RklGVG54TTI5Y0NNSGg4MUZ1bTJYRnAvaXY3dDRHMmlWb0NZRUJQRGhuNzF0?=
 =?utf-8?B?UjRUK2hodHJKWElMLzNWQ1VOYVJWSnNZUlZCM0NpODdLZ0tUR1pML2M2OG9X?=
 =?utf-8?B?ZWFjMWVRdG90a1hiTzRmNFR2UnltVzVJMzBMK21rREVLSlhRU1A2QmI2STFU?=
 =?utf-8?B?Y0pvRlhzWU1WMkxyTXBWWGZ3RVNCaDA0SU5ocE5uaVNHS2drays3Vnl2TTRo?=
 =?utf-8?B?UDVETFBZd3RGdE1zUGdOUS9EY3ZvTzdVQktTOVBpMWhsMytBcDBIa3p2dmNr?=
 =?utf-8?B?dmRjYTk2ZGp3S2JkZ0daQzlFSFNhT3lCR25od3VVS0QweVVuRnlhcHMxeVg0?=
 =?utf-8?B?YTZvNlpTQVl4KzMvRHJ2UEMxNlR0NkdBWU5ER3FDOEh0dWM4WE9EUFVReS9s?=
 =?utf-8?B?YjZLTFNpNE9VUEptRGNyWGlNcm5UR2dUR2xxdjFtZUErdDdDdjBkUVcrNmRN?=
 =?utf-8?B?UXhobUJHMDUvMmcvQVY4V0ZndTErcnNkNDg1MEl1bVh3NVpKQ2xJbzlza2lR?=
 =?utf-8?B?MlZVODExTXBYMjVBMkNkc1RJUGh0UWVZNFRzMUdiNEtHdzVGQ1BBaXJPbDBT?=
 =?utf-8?B?QUczVzhTZ1RqaFVvRER5cEFCNHgwV0l4T1lXZmpMZDFlSHhWeG4wM3BHa2pD?=
 =?utf-8?B?VnpWS2UrY1dCQS9vSHlJRTZHYWF3NGtwcHhvUk5hUHhxajRlOXhPcEFpSjUx?=
 =?utf-8?B?VExvTldyc2RkVGhEZzFTQ2ZTTmpmb1FZejBZTnZjeENTRmk2RWVORFZ0U0Zi?=
 =?utf-8?B?Q1ZhaUE5YzFvaVN0anpZdlUydnlGQmUyVTdRT2x5RStVMlZVc0txL2FzUHAw?=
 =?utf-8?B?aUY3MjFoMG9rZlhHMExLd2ZUWVA3Uzcydko1c005VVQ3a2prZ3pSdm0rNjZw?=
 =?utf-8?B?aUpPMlowWHlaWTN5Smthai9Kdmw0N0JJbE5STGx0SG9NdlYzQTRZRHAxeWJq?=
 =?utf-8?B?YzExemRDVmpLdy9LZTBNWHVpeVE3RnlvK1d6d1RyUWRVUDZmb2VrRmhkRlB2?=
 =?utf-8?B?MnZFLzI5SUVETlR0T1oxOVB4b0FWZmczdWxoVU81SGVXR3RtT3ZIZkpnYVZv?=
 =?utf-8?B?QjJuejdyWjBpNnc4S1hibGVuM3ZvK2tBSlVWR1pQendIQWpKaENLZ0VyNklK?=
 =?utf-8?B?THZJb05ybU10KzNXSFZMR2VZcjZzNkMyV2dOdStUU21IMzZmY1hJQlA2dHdq?=
 =?utf-8?B?dWN6MWlFVFg0L1FxN2RvRWdmTGw2UVRzUVNRNGdUdHovajhGNFlxYkdLcEZs?=
 =?utf-8?B?dEtwNjllOE96dDFoc2Q0dU9BT0hlUXRDcDNpUG5qcXVPSmZqdGtKVXVBa1RX?=
 =?utf-8?B?QnN0aDZXQ3NMbWZ4OU05M2NlckJQMVYxVVFMSWRjdkZjVXkyYUNKZi8rYXFZ?=
 =?utf-8?B?eEZXQUxEVHJGaXU4TWswbjRQYWZxSFViTjY3Q2c3V3p5clVFTEpNLy95QlFx?=
 =?utf-8?B?aUdnNXhqNEh5d0VnSWRmdWlDWHAzT3JiTzhoZStsMmRxdUFDUnRtd083eVlL?=
 =?utf-8?B?cU1TVGtibDluanFQQ282ckJuWHFyZVFzSGszZUlRV3hUUGpIalRnSEhZWS9B?=
 =?utf-8?B?bHdHa2R3LzBGVEl3Q3I5MmZrRExxSmlUYlNMdFNaQzhRbzJBUGRRSFJoRHJ3?=
 =?utf-8?B?d3dZcnM4cnR1ZVlpY1BOcVM5RHhIQVh0QXEvaEx1dWh0M3VjbGFIVjZySjNO?=
 =?utf-8?B?b3plZnp3S2luanJOMC9Gb21RQ0dVMVlQU2p4Z0RBcUc1Smg1aVZlRXgxSGgz?=
 =?utf-8?B?cmY0MnN3aXRjUU51NVJMd0F0SDk4ODQ0N0p4OXJ1RTZ6d3psdUM3Zmw4b3BC?=
 =?utf-8?B?L3NPUlQ2MXRuQjBSYkxZNGljMWMvLzNsRy8wd21Fa09scDBncTU0ZFBqZUFN?=
 =?utf-8?Q?IUXhoScgn9CeL54NtHiqXOSeC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D931F51F7669E4FBA073BC1B573C267@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qSBIYprUAYlOkWGdVI3Mc/5aqeGTwJhUshNgaAldO9Hxyvb/oeaXUtvnCA/S0vtl9Sk9i7krgFi6Ax9v7q3ZwQywhCFQNous/L4+vRn47hX96qAzdQHfZ3aU7D/TpoJae35PtGCNdHe0GhhAb3LT/auHBv7NUSwk4UztAdvgRP8TKd4v5mQvDnVOLCA2FVo9lB6fskJJdhYV4eH3doJulJeypormhgfl2gX5C42yrHNQ2iC4B42EABK25cRhH2ysitw2zoF8KjBY0vLm0+bH9kPA3lHjARiOCB7J9i8q95Fb+Pyq51dcd3s9N4pEUMLpbaPH5fQI/9BORfolxngZimkexDaOyIEt7HThRTcReQM3TKB5BcS+uDTVybCqo+hU0XTqsuQBs/ChrHx34/sZEgz1EWChMDv4sqT/HD0R2SV+WMRkuzvVyCmIQ9jR4DLm89qncUOcRe366iRJDUQOFMuuLSQidtdTupKUU9P2KFCyAPWZpXjvqhpY563esxR/ngpUSasImvD4/eYVVJzy9ais8bnfWdeZNGi6dkCNFh1QYOlZclk+l/9Dc+Dfd7/1qzCi0SM9jPv1jrZs9CaqEOAixbqLSOtqNsBIPPnUrCsrkrA2oVdabCSUEkAnSfukQ8ConFBkl6lwZGNeS7IvmQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4356d5-747f-44ba-bb30-08dcbbec938a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 23:06:34.1339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWJDs4JPWmBuN05M2KbEuurOJtHLDc0A/3iRYen94q2nsScxdTd6LRJ/JXFflQHEEebAFJa8KT6QZxykxuATWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
X-Proofpoint-ORIG-GUID: pyGkOOOHSoti2W03J5dPPiRb1N1fIMeO
X-Proofpoint-GUID: pyGkOOOHSoti2W03J5dPPiRb1N1fIMeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_12,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxlogscore=594 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408130167

T24gTW9uLCBBdWcgMTIsIDIwMjQsIEFuZHLDqSBEcmFzemlrIHdyb3RlOg0KPiBIaSBUaGluaCwN
Cj4gDQo+IE9uIEZyaSwgMjAyNC0wOC0wOSBhdCAyMzoxMCArMDAwMCwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPiA+IE9uIEZyaSwgQXVnIDA5LCAyMDI0LCBBbmRyw6kgRHJhc3ppayB3cm90ZToNCj4g
PiANCj4gPiA+IFdoaWNoIHBhcnQgb2YgdGhlIHN0YWNrIHNob3VsZCBiZSByZXNwb25zaWJsZSAv
IHRoZSBlbnRyeSBwb2ludCBmb3IgdHJpZ2dlcmluZw0KPiA+ID4gdGhlIGRlcXVldWluZz8NCj4g
PiANCj4gPiBXaGVuIHRoZXJlJ3MgYSBkaXNjb25uZWN0LCB0aGUgVURDIGRyaXZlciB3aWxsIG5v
dGlmeSB0aGUgZ2FkZ2V0IGRyaXZlcg0KPiA+IHZpYSB0aGUgZ2FkZ2V0IGRyaXZlcidzIGRpc2Nv
bm5lY3QoKSBjYWxsYmFjay4gVGhlIGdhZGdldCBkcml2ZXIgaXMNCj4gPiBzdXBwb3NlZCB0byBk
byB0aGUgdGVhcmRvd24gYW5kIGNsZWFudXAuIFRoaXMgaW5jbHVkZXMgZGlzYWJsaW5nIGFjdGl2
ZQ0KPiA+IGVuZHBvaW50cy4gSWYgdGhlIGdhZGdldCBkcml2ZXIgZGlzYWJsZXMgdGhlIGVuZHBv
aW50LCB0aGVuIGFsbCB0aGUNCj4gPiBhY3RpdmUgcmVxdWVzdHMgd2lsbCBiZSByZXR1cm5lZCBw
cm9wZXJseS4gQ2hlY2sgZG9jdW1lbnRhdGlvbiBvbg0KPiA+IHVzYl9lcF9kaXNhYmxlKCkgZm9y
IG1vcmUgaW5mby4NCj4gDQo+IFRoYW5rIHlvdSBUaGluaCBmb3IgdGhhdC4NCj4gDQo+IEkgdGhp
bmsgdGhlIHByb2JsZW0gSSdtIGhhdmluZyBpcyB0aGF0IG5vdGhpbmcgaXMgYWN0dWFsbHkgZGV0
ZWN0aW5nDQo+IHRoZSBkaXNjb25uZWN0LiBCYXNlZCBvbiB0aGUgYWJvdmUsIEkgYmVsaWV2ZSBJ
IHNob3VsZCBnZXQgYQ0KPiBkd2MzX2dhZGdldF9pbnRlcnJ1cHQoKSB3aXRoIGV2ZW50LT50eXBl
ID09IERXQzNfREVWSUNFX0VWRU5UX0RJU0NPTk5FQ1QNCj4gYXMgdGhlIGVudHJ5IHBvaW50IGZv
ciB0aGUgZGlzY29ubmVjdCBzZXF1ZW5jZT8NCg0KT2suDQoNCj4gDQo+IFRoaXMgZG9lc24ndCBo
YXBwZW4sIEkganVzdCBnZXQgb25lIGludGVycnVwdCBhbmQgdGhlcmUgaXMganVzdCBvbmUNCj4g
ZXZlbnQgd2l0aCB0eXBlID09IDYgKERXQzNfREVWSUNFX0VWRU5UX1NVU1BFTkQpLCBzZWUgYXR0
YWNoZWQgdHJhY2UuDQo+IA0KPiBJbiB0aGlzIHRyYWNlLCBJJ3ZlIGNvbmZpZ3VyZWQgYSBuZXR3
b3JrIGludGVyZmFjZSB1c2luZyBDRENfRUNNLCBhbmQgdGhlbg0KPiBhbSBkaXNjb25uZWN0aW5n
IHRoZSBVU0IgY2FibGUgQCB+MTU4DQo+IA0KPiBBbnkgaWRlYSB3aGF0IGNvdWxkIGJlIHRoZSBy
ZWFzb24/IEZvciB0ZXN0aW5nLCBJJ3ZlIGFsc28gYWRkZWQNCj4gDQo+IAlzbnBzLGRpcy11MS1l
bnRyeS1xdWlyazsNCj4gCXNucHMsZGlzLXUyLWVudHJ5LXF1aXJrOw0KDQpZb3UncmUgbGltaXR0
aW5nIHRoZSBnYWRnZXQgZHJpdmVyIHRvIG9wZXJhdGUgaW4gdXNiMiBzcGVlZCwgc28NCmRpc2Fi
bGluZyBVMS9VMiB3b24ndCBkbyBhbnl0aGluZy4NCg0KPiAJc25wcyx1c2IyLWdhZGdldC1scG0t
ZGlzYWJsZTsNCj4gDQo+IHRvIG15IERULCBidXQgdGhhdCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBh
IGRpZmZlcmVuY2UuDQo+IA0KPiA+IA0KPiANCg0KSWYgeW91IGRvbid0IHNlZSBhIGRpc2Nvbm5l
Y3QgZXZlbnQsIGNoZWNrIHlvdXIgY29ubmVjdG9yLiBDaGVjayB0aGUNCmxvZ2ljIGZvciB2YnVz
IGRldGVjdGlvbiBvZiB5b3VyIGNvbm5lY3RvciBhbmQgc2VlIHdoeSBpdCBkaWQgbm90IGNsZWFy
DQp0aGUgdmJ1c3ZhbGlkIHNpZ25hbCBwcm9wZXJseSBvbiBkaXNjb25uZWN0LiBMb29rcyBsaWtl
IHlvdSdyZSB1c2luZw0KVVRNSSwgY2hlY2sgeW91ciB1dG1pc3JwX2J2YWxpZCBvciB1dG1pb3Rn
X3ZidXN2YWxpZCBzaWduYWwgb24NCmRpc2Nvbm5lY3QuDQoNCkJSLA0KVGhpbmg=

