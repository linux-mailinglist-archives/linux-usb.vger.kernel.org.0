Return-Path: <linux-usb+bounces-32397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B132BD25B87
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 17:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4C79302C8CF
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 16:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0193B9608;
	Thu, 15 Jan 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tqDxxOne";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DVf5ekC6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TLm9wqI5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE73B95FB;
	Thu, 15 Jan 2026 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494193; cv=fail; b=FWElx1lR/FzqTBGKpwpZV5eXLVIg/73YS4mkDmbWIzIIQ81uy0t7Kfzha3AK02O1BPwdZpqcy/5okk1Xme7xf0yYDK3lpiup6wXj+ByveSWNKoV1ZJOBxXgGtrffytSWGJ+jOkqOk1/NDkQYD1f12gP4dDsrUxhEO2fIa9jIF3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494193; c=relaxed/simple;
	bh=/MfxAT7E5IYJ1fuSqFRyYiihf4a95kHVsghLTliD+6Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nG+WYootdCq+mej/0ZlFFb1YTxFM9KcOiwYKbJlIlFjLT0DfN/Zx2OqSCFNQIIvO+w8p7YRM2jjiCrd948phlhxfGa96HAY/KABkzQTzn5j0SQBOqXbGC2gijph4pc3synCtdErngaSgnH4umUghhTgbF6EE7AopKXvQ5n7Cy5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tqDxxOne; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DVf5ekC6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TLm9wqI5 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FADTNi182750;
	Thu, 15 Jan 2026 08:23:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/MfxAT7E5IYJ1fuSqFRyYiihf4a95kHVsghLTliD+6Y=; b=
	tqDxxOne0hGOIoMj9/eSy5rd27Ome0o5SQ/Pi3HmNCQuKP9eE5j2G/5WjIDA/t3N
	ingWtHcmBZd4lIaZCs9+iD9C7F0OTc42V1pWM3XQuweidfg+2F84EOZrqtuJjJVZ
	+gNI8Cy9EI7r3dzpkOLE0uBYz0MBgwp+qH4waNGwhRZ8pw0iItm0CZMccFarT0Q3
	JsR93NgUjFFLvv0MtVnqDlHgLovhfHeV91QA9FrdS9jHeGvdmlbyLkUvBiLjAX0R
	31DWveCed+N7ixc78SD8dc6wI0SiJan1z/7cD5dZhwjctXymfdYh761wJcKVugpl
	KTIvKjQxqvIpdW7WM+CtEQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bpqf5tsrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768494187; bh=/MfxAT7E5IYJ1fuSqFRyYiihf4a95kHVsghLTliD+6Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DVf5ekC6il4sL6YtYVE+FjfhnIvcAiz+BZqR0ozCxBf3a97F2zd7oXl+x8nsPeMRb
	 UJZ7+Wyzxo+NTxaVHNJc2Ozw9xs2B5bkX+kFzJJvb4/LyLtNRYz5d7aTIGuYNH1OjF
	 VP7FsqoHZ+JK8M3zm6CVLh7heC5CLQwvHcvGrwvO9IFq5aHmuwTHhCmckN6K/Fvhmr
	 un2lhY5L0rUoOeJioVaFYpqzslwNhFlZHBQu/+RYxJpg3JrBRhyriEiZtqVcM6XUU8
	 TNAd2RveHRMMZFSEyfwWESI8x4cIA3n8Xru14I8VaNWxVXcKwY3tQv5rxPZZj6nN4P
	 Zeaqm/FZReZ7g==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B1B6E402B2;
	Thu, 15 Jan 2026 16:23:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7D490A0070;
	Thu, 15 Jan 2026 16:23:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TLm9wqI5;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DCC9740356;
	Thu, 15 Jan 2026 16:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/Q0Ct19C/zrfvvV5cjs6ig4iBFrUvYbNbSkObNKJ5FI5ngFuqtVa6+CGP/unh3XLKYTjfw9wfhzavDITHkiaLYAcxbvaVRdI2HhSX1PRq9djjsrrzN4hraPUC2BSt7Vz249ygIzo1Dx4OuuhwZebUpfm5/hdhi2/lyKfgNQ7goJOzEznLcQH3Z30QyasLw1EocJwNvOn3rsLEb/gZEtVwmcfI04o5lU1eUOAwcqs0p8F1xcQrlOx2nYSdmCSKsME2wksJ4tbNjhcIfKnH0KAdMejGZygpwJqFibIql/Lt4l2IiGlktk0bDRuCiZ2q/CMI3BoCBAfTFCvbsM6mKRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MfxAT7E5IYJ1fuSqFRyYiihf4a95kHVsghLTliD+6Y=;
 b=Bx7vjqITQffpETmxgAKUN+M0IF5YK3xaThAfOOS1gF4vn+gHY+CYSqQcRopDzCNpcbB+H4cTgFMGP8XERmPCirLXjDeF49v0vY3SHSwFfkxI8BZWVF/UyiCSe2psLq46SrEfRMjCPaOybabr60G0vhCPo7jSgqcmc3Zkr85fbPz1YGpOHv7RBVBiqewYtho85VdLh+4M/ZyclC0TW0fzjNdbGaTNShA9vM19ehMiLApLdeOyi5UckTNeghNcAwf9VJfEHCjJ/SZvEPdb6dStlx3jWyk9Z35bp6TgSARcyogXB4zkVwWibkXtViwS6Y+cmrU2vWzZ171fB6ofX6atAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MfxAT7E5IYJ1fuSqFRyYiihf4a95kHVsghLTliD+6Y=;
 b=TLm9wqI5WJhqbqhRKcJTA4Z5SkuCmk9TH+RGdE5XNMaHt+VQUpMyRsx5Le0SrEm1PmY+vpu3RMApiVazQdsIEjwC7L9y27fq/Pz8PeisL7U7WR3VfRlVlnuhKI55IMQ+AnDB6gm6F70ONlqc5EQq9TGvho6oxozfXSDYD7QnlgI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 16:22:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 16:22:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index: AQHchT2wbJQWlMamnk2JtLup9X7IcrVRio4AgAC8f4CAABCPgIAAcMoAgACjbQA=
Date: Thu, 15 Jan 2026 16:22:58 +0000
Message-ID: <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
 <2026011500-safehouse-alphabet-3056@gregkh>
In-Reply-To: <2026011500-safehouse-alphabet-3056@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7139:EE_
x-ms-office365-filtering-correlation-id: fbd979af-406f-4841-183c-08de545258f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGlNVHo2ZHczakhhWDVqVVhscE9uenVRWjIwL0l3djAzblZDNFEwU0N0Q3Fl?=
 =?utf-8?B?Y3R5RGk5VXkzd2VmWldSRzh2YU95RG9SR1UvaThGeFJwSzF5RFlKaEc0bTly?=
 =?utf-8?B?VHYyQkVnYmVBdFEzY0lqWlN1MGUycU5MdDJWcDg4ZitScUdydDZUcWczb1cz?=
 =?utf-8?B?Z0JtQi8yaWlyaDFCY2l6WUFNN1dHNDVhR2ZYMGZoQ3FYRHRsRHVyRkpodDRa?=
 =?utf-8?B?c2Y0QlkzeWgyYVRQR2N3Y01GRTVkK2s5b2dtMGxOdmNSYnNKOXJpTjhLQnRj?=
 =?utf-8?B?R3FwVUM2NVRtNnhleTQ1STR0N2tVYWl5OHdoU2pDNTNJRUoyVlZqOG0xVHRO?=
 =?utf-8?B?RVJVNkEyTmZlSmdnMHIyMHI4cUFLNDdRSHFMZ0VOQll6a0gzVWtQUW9wc3VB?=
 =?utf-8?B?ZzJaM3M3Rm54M3hwQTE3bXovVUxud1o5b28rYjBMTnJkNFFVNW1XenoraWMr?=
 =?utf-8?B?K1JlN1hKZy82U2xXcmtjQnBNZG1ySVFyemFKUExXSWFyUTY4Ky9aMGJLT2dD?=
 =?utf-8?B?MDdEcXcybWh6VS9EZzczYkdEODlKQTVDLzc0bk1IVkNqQWloR0lJNmJhdDgr?=
 =?utf-8?B?YVU2alZteStCVGFoRWxSS0hLdngySHQ5eHo5OUV2RkNMUjdqVDFtdDVuR0Fk?=
 =?utf-8?B?WDR3amJCSzMzbkg4a1NKejdteksyWUFHNW9hWHpuYTgxMkd4Qjc0dXJRWlNF?=
 =?utf-8?B?OFdtYzFRMDlIZjJ2SFloNnVYWm1xS2UvR1J0YTRjQ2R5QWpZNURHd3hoSXd3?=
 =?utf-8?B?cmNFWHpocWErc0N3YlBmY1E5TUQ5bzIyYTkyTHZCbUtZb1Arc0VVSmxPcWxj?=
 =?utf-8?B?TjhQK2ZCdU82TnBnZzFReS9mckdTSksydnZseXc3ZGJ2OVJJcFJrTWtxNXo1?=
 =?utf-8?B?MGFHTk9YTFpzUytpUE5CSmdFYndubUo4N2VDekNEUkU0Vy9SUHRZSkxRMHNB?=
 =?utf-8?B?bmE4NXRnYXh0Q05GNFpWY3lLUU9oYVpqOEJ3eW52OXR4dXZDejliY08vKzVB?=
 =?utf-8?B?U1AxbWo2RlFQdkVxQnVzSFptd2dFcTJGZVZldFFCQkhZc2szTVBLcTJVMyt2?=
 =?utf-8?B?cVpKQVBJWW5BUVRTRU5GeDlnNGpPeTg4ekdab044Q3JHTVp1WGxORGJmK05S?=
 =?utf-8?B?b3hDZkMxN2VyUUJxOXBPZEVzMTJWYnk4T1RiZ2hMdEh5U2RCSDR1TGY5d1hv?=
 =?utf-8?B?eVZ0ZU1yMW01d1U5NllXdmFVR2xjNkdoR1h5bDlnTjkvTlN3cWZyZHJUMTJG?=
 =?utf-8?B?NXlURkFUTWVGcDZhL1ZBM2JnZU5QVHFRc0UwajMxNUNxdUphRENvRE4vblNU?=
 =?utf-8?B?enQvYXk4bnh4bThGWlk3c1hrZFU1MEJyQ1pHNjhQVmZXYnVvMGVxYmhKSVB6?=
 =?utf-8?B?cGlzUGpMTU83aGt5ZnhEYTdHd0NZeno1blA1RTRPaWpkMnFtcTYwL3MwTis5?=
 =?utf-8?B?YmNCaFg0aHpSYXlqK01LdUJMeTc0c3dxWnFlMDl2UVNTaTFKbzJVVG9NS25B?=
 =?utf-8?B?S3cyUXkwUGkzRE9ZaVY3V09UNXN4VHhpa0VMNGpBT3laaGNObHpReitRSTRp?=
 =?utf-8?B?NUR4dVJpNkx1cHcxK1h2MmFMMTU5aytPS0w2NENPVWFXbUswZnE5bktmMnRp?=
 =?utf-8?B?aGI4VkdDYWpTb0pvV0laKzlxSmN2VzRTTEdRWEVWbDNBNDdWU3V3b0RhR3ZD?=
 =?utf-8?B?Q2lHeVIrY2YrRm9KWWU4SkNsdFVOY3FIcXBwR2RzSk1OMi9WWHgyOVB3aGZK?=
 =?utf-8?B?MVF5T3E5dnlyZTZGa0c5ei95Qkxpc0FuQlFpRzJzd2lock9FQ2Q0ZUM1YVRR?=
 =?utf-8?B?b2lmcTN6aUJHRDMzanFRYzlkcjduUTBJb29oblk4TkdGTVc0U3JDYW1Fd1RY?=
 =?utf-8?B?SjlFaHl2QUdDd1MwQ0VHMHJDczZOZVhPYStCZDlhMjhQM0FmTWpoWkttTnVS?=
 =?utf-8?B?Q2JpQTNrRlRsOVdLZjYvVnFLV3FxSkE1L1ZsSDJicjQ0TTlDaHlTRG0rdkpp?=
 =?utf-8?B?bTFNVnAyZTdmelNUSGZVWUpveCs0RkVtdlZBSEZwVjhRcFYxSU1BRDBqMFM0?=
 =?utf-8?B?MGxNbVVsY0JpM0hQSEFBNFhlRnFCZ29BZkZuYjBibEoyN3BlbC9RNXd4S3JY?=
 =?utf-8?B?OHk3QVRIbnRvQUNOYkxDSGRHRmxtTkRraDJGTUZjNEJhcEF1aSs4aU12K0VH?=
 =?utf-8?Q?IPtSWepYu7lTCsjh304p5kc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWRXUS9Na3N5bGFvYUx0YWlERFlaQXhBSi9pVG9UaVNXYWhTMzAxVVBXWE9n?=
 =?utf-8?B?bW5Qeld5NVR4ekRwbkxQUGkvY0dveVpySHV5VVpLVUo4eUc1eThucjVYeWVp?=
 =?utf-8?B?d1NoSUNDWU00eGUzT3BQSEpYbGFzQk5mUnBmUzhON1pVL3RJdjZJVEV2SG9B?=
 =?utf-8?B?bWZnam5YbzlPeUh5RkQwanBRTWpJb3FyakI0Ty9HWXJQeEhDbUxQb21LNHJF?=
 =?utf-8?B?RENhZUxmK24wZVFiOFozb0QxK3hjR3ZUSDlQUzhkRHFTUFQwNklZZXZGWnNQ?=
 =?utf-8?B?OUk0Y1VpLzVocEhUMUpZbDQ4Vkk0VVpqT25obzNZbWZjTTlRSTUrQW10TTdR?=
 =?utf-8?B?b2toTkgrTWpXeWtlRitLYldId05POE1ZdFo1SnJ1cnQ4TzhSYU1BNnVXMTUr?=
 =?utf-8?B?QWE1b3hrcTlPYnFLWXJjN0Q1a3dzbUJHOHI0dFRWUXZrQTg2WU5UNDExbnBz?=
 =?utf-8?B?aUxsSnVKTzFqL1dmZDFtb3FwVHVPcitDaXN6MCt2dmxsbDYzUm9nM3RuSjI0?=
 =?utf-8?B?WnlibnF3cnN2YkhLNVFGU0RsaVJCWlhQR0VDa0xDbXpvdExiQzJqOEVHSWJj?=
 =?utf-8?B?WktjM2tVZEhMRTQwODExemQzZ3k3SktYajlkTStqZVJZa2lXTUNNZXg4T3h6?=
 =?utf-8?B?TjlRV2kwSUJxZGZzb1VtMDhIR0E3Rncrb2hrTzlmOU5jZlMyaDAvRGxReERP?=
 =?utf-8?B?WHlqQVZjMTQwRUVINFdBQ28yaXJjaW5taFh2Z2laNFIxWVdrWHJjb2MxWis2?=
 =?utf-8?B?VHNpVmNnb2U5SUxTWDVNUURSb2ZBVysvUk15alpHZHh6bjV1QW9WTW9XN0F1?=
 =?utf-8?B?aElBMHZxSkxnN0JVWXp2SjJKZ0VjMXJpbUdiNnRNRGNHV3hiSHNGbERmMEEz?=
 =?utf-8?B?T21zOGRaclVGUXNkTTZ6Z281TXpwZGEzaVRhcldDUHc1OVBvZWFCcFpvNWFx?=
 =?utf-8?B?a0NXY0ZsekRBZlBLS1VjV2ZtdC9pRkRVZUNaYXcrdG9tUDc3WndIM1NjVWtN?=
 =?utf-8?B?U01sdVovaWZSZjFpV2h3M2RGMUo3SVdMLzF1c1UxT1lmbTVIYWllL2c3c284?=
 =?utf-8?B?V2VycDRhSVFzOXBETE40RW9zcjNJUEJoSWpvNUJiUVlhcDh3VXY5VEQ5OXN5?=
 =?utf-8?B?b0pRTjVZdUhTZjRHSFpwYi9CcVlTT0pmNVUwcUplb0cxRHFncTY0cVlmcGlw?=
 =?utf-8?B?R1NhZW4rQXdzaHBPU1JDUmYrS2dMd1FQNDArT3Vzb1dxY09QRnRyY1M4cXNo?=
 =?utf-8?B?TVZYc1JhbmpMWXFZak9HQjN2RVB6MzdtWUhpR2FHR1VnYWl3R2xMdHo3OFdu?=
 =?utf-8?B?VWFFVFUzbDV4bkZjVTlrV0huN21ZL1pnbFFjeFlQOFQwWVV5d1o2RHhiYTJL?=
 =?utf-8?B?R3VNOWR1SE5CUUtmUE9XOEpIYUZqMkFGYm5VbUFNWEJaVDM3YS9UQnFmanBx?=
 =?utf-8?B?S1Vkc2hGS1BJa0xuT2pkRzV6U3FpS1E5aUtxUXpvbzR4NGM2T3NXLzNnNDhN?=
 =?utf-8?B?N1RESTgwK2g4U0JSUGVaTGMrbkRYVDVoNS8xM3MyTE8zR1Zzb1BUcWpXb3I1?=
 =?utf-8?B?aXRyUTNkNnYwVHA3dVRSUjAyUTh0RnRoNCtTeEJxbzhEM2JkazN0aG4yZTcx?=
 =?utf-8?B?SXU3MEY1TjBrYmRPMXRYUGk0enVkamh5cmVYSVc3cVpZaHN1STgvY0d1RmJ4?=
 =?utf-8?B?Mm5NdGN0czYyaHFaWFpwbXlFMXU1cG8vRW1neGxuYmRMR1Q5eVFjRGNmYXg0?=
 =?utf-8?B?dWlMOFJmcjF4alVyQk9lRGFvWnkvekpaNHZ2QXQvY1ZSRThDMTZJRlNmc2kz?=
 =?utf-8?B?czN3WURERGZuTWZNV24zUktwSVJjUUtncXF3U0lCL3JFekpXUE9CcVJkLy96?=
 =?utf-8?B?cTViUGxoaXZBbTk2WUlZK3djUUs1ZksySlRmdzk2cU1iM2ZOMFluK3BvTG9a?=
 =?utf-8?B?TGx0VjZUSEUwYVhnQm8xb2NtMzIvTzlpZUs1R3F4VnZkOExuT1lWdzlvbGFN?=
 =?utf-8?B?UHZ3QloydlhwNXFycDVHZFZnNmllUUQ1OGZTVVFjU0szbk9qc2FiNkdWVEZr?=
 =?utf-8?B?MzlNQWJ3RHJsQ2gxdHpvckxQKzlPTVVJT2llUHZMbDJHSzlOZ1hSMDJ1ZCto?=
 =?utf-8?B?UnpLaVZhN2EvSGlaZmpFR1lRTG82SGNJVmZXUDBzWHd0K2FHZ0gvVDVTMTcw?=
 =?utf-8?B?Rk1hWUh6ekQ5SUxYRzl2OXpTU283QzI4SllKQXErYjQ1ZVN5WDhzNGdVb3hx?=
 =?utf-8?B?NktSK2dVdGsxcXhVRDNLNU5YbmNmdHBmb2tVQWtaOHFIb1NDeW03eThGT3J3?=
 =?utf-8?B?d1JSaXRXZDhhbmNJYldqdnp1K0tTRzYwanVtbmJ3bmQ3Qlc2akdpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAFAF76EE80DC648A7C1A3185D031C78@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bCNyrd8ekqe4zzITXkoioqmcStxrPFPvH1Akjq0wY2bdQWnuNhrfFL7LPJ2HSV/a6HFiYYCpkLRIc397o5PDuGrfjnU9843SpyksnlWvbGxvT5GWNs4TsJ3UnBG0HliEIA6LcqTep+5GU056KVE6ff1aArSIhCQ+Q3WVOfy7DkRAi1+FXgPX4ROE5VfDTSgYiBX9NuYzVo59fG/U1z/FGNDspdPpkQjjznpd/e7ZlHxRLsYobtQBCphSlMpJyA/beEwzyubjyuaLEeHrLVa5jrh1dqnX+dgLXqVVC+s1oEYWv+Qj10NRqii4tkxn8MT+Keis3Uk3Z9Clk+WBH5fVjshlhFmopltqmsydDZyquhgCn7SCPG3dcaXGE8lpMuWOBmG1gtnzfhZXzsPAnUbE5ZwPDh52jUrfS570ds6Crtmk47s+sLbFf8Q2ymFpTp+/pMMoTvcQN3lGNoTp6JJ9Fdh+VbskR4db+4RUh2phg6UoQL5+zXT9liocpgHKfu3XXt5ivw3WYPRq0QoC35h3HA7vltO0NkS4H1SsOPEnxtAePD6JwqyYFbC/klE/vzkbWkjI7fJetEoyb9DSK1ey56k40Y+ISuxzcPM/DV+pzNYJQ9VkhOOc6Zlhip9dFblZamXXi7tLGyweoJ6rs4wN+g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd979af-406f-4841-183c-08de545258f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 16:22:58.8843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYom7DmrXFmMo0zRyfmRnvSQ5tKqKapCVpnM58V0HzPdvVFfA5HZsY/jy4N31cxLsZoodlMpBOOvCevuYyOHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyNSBTYWx0ZWRfX0ia20b/1B130
 w9zEJ6XGUJxcCjkbLG2fgpV1kavKT+rUJ0vX4JFsLtyzpK4IN1PwrloEtzY7U1tnICaawjqTr7b
 0J1CB7pBcLKSVv01m01C/7ng59S5jmw5jCuYnN7pKF9P2UlBnmaJaYjLBjVn5/RBl52JE6pzm+q
 UQPX2KYulNk4+cj4JPRivOaoxpeuftQO8M1zQtagUHa8PBM4hy37eqPg3QAdHOoZ5eUuiWIQVV5
 kA9lpB6oilh5pVli+VFgkjknfm0XBJNj8f4N4mvuHG9jwXDS5IOQvnszQun9+KpSb+te4fPRSUE
 +2+V1UdrejGRe2KNnhuHRyNVbIppKcXcPrDP4zywZd3p0yJFCbKWFHluHj3U42UTvh8wlE21cju
 P6UxHRswlOAD9bxNlte2276I1ZLp9ZKi75a7wOJGxc+l5Th/bGRdrSvoSJHyj3vFYLnPjt9CE3g
 zaCz/trMQ8VC9+q9FgA==
X-Proofpoint-GUID: HWjaskqDGuU8SVoO1f6VobdNarutirrb
X-Authority-Analysis: v=2.4 cv=Ap3jHe9P c=1 sm=1 tr=0 ts=6969146c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mJECRuGVvQduxYH9LaMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HWjaskqDGuU8SVoO1f6VobdNarutirrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150125

T24gVGh1LCBKYW4gMTUsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gV2Vk
LCBKYW4gMTQsIDIwMjYgYXQgMTE6NTQ6MDNQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiA+IE9uIFdlZCwgSmFuIDE0LCAyMDI2LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBPbiBX
ZWQsIEphbiAxNCwgMjAyNiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+ID4gPiBPbiBX
ZWQsIEphbiAxNCwgMjAyNiBhdCAwMzozNzo0OFBNICswNTMwLCBQcmFzaGFudGggSyB3cm90ZToN
Cj4gPiA+ID4gPiArICogQGFkZHJlc3M6IENhY2hlZCBsb3dlciAzMi1iaXQgYmFzZSBhZGRyZXNz
IHRvIGJlIHVzZWQgZm9yIGxvZ2dpbmcuDQo+ID4gPiA+IA0KPiA+ID4gPiBXaHkgYXJlIDMyYml0
cyBlbm91Z2ggLyBvaz8gIFdoeSBub3QgdXNlIHRoZSBmdWxsIDY0IHRoYXQgeW91IHJlYWxseQ0K
PiA+ID4gPiBoYXZlPyAgV2hhdCBoYXBwZW5zIGlmIHlvdSBoYXZlIDIgZGV2aWNlcyB3aXRoIGp1
c3QgdGhlIHVwcGVyIDMyIGJpdHMNCj4gPiA+ID4gZGlmZmVyZW50Pw0KPiA+ID4gPiANCj4gPiA+
ID4gVGhpcyBpcyBhIHJlc291cmNlIHZhbHVlLCBzbyB3aHkgbm90IHVzZSB0aGUgcHJvcGVyIHR5
cGUgZm9yIGl0Pw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyBvbmx5IGludGVudGVk
IHRvIGJlIHVzZWQgZm9yIGxvZ2dpbmcsIHNvIEkgc3VnZ2VzdGVkIHRvIHVzZSB1MzIuDQo+ID4g
PiBJIHdhbnQgdG8gYXZvaWQgdHJlYXRpbmcgdGhpcyBzdHJ1Y3QgbWVtYmVyIGFzIGEgcGh5c19h
ZGRyX3Qgd2hlcmUgaXQNCj4gPiA+IG1heSBiZSBtaXN1c2VkLg0KPiA+ID4gDQo+ID4gPiBBcyBm
b3IgdGhlIHJlYXNvbiB0byBjYXB0dXJlIG9ubHkgdGhlIGxvd2VyIDMyLWJpdCwgaXQncyBqdXN0
IGJhc2Ugb24NCj4gPiA+IHdoYXQgSSd2ZSBzZWVuIHNvIGZhci4gVGhhdCBJIGhhdmUgbm90IHNl
ZW4gZGVzaWducyB3aGVyZSB0aGUgMiBvciBtb3JlDQo+ID4gPiBpbnN0YW5jZXMgYXJlIHBsYWNl
ZCB0aGF0IGZhciBhcGFydCBhbmQgc2hhcmUgdGhlIHNhbWUgbG93ZXIgMzItYml0Lg0KPiA+ID4g
SXQncyBhIGJpdCBuaWNlciB0byBzaG9ydGVuIHRoZSBhZGRyZXNzIHByaW50IGF0IHRoZSBzdGFy
dCBvZiBhDQo+ID4gPiB0cmFjZXBvaW50LiBCdXQgaWYgaXQncyBpbnN1ZmZpY2llbnQsIHRoZXJl
J3Mgbm8gcHJvYmxlbSB3aXRoIHVzaW5nDQo+ID4gPiA2NC1iaXQuDQo+ID4gPiANCj4gPiANCj4g
PiBPciB3ZSBjYW4ganVzdCByZW1vdmUgdGhpcyBhbmQgcHJpbnQgdGhlIGFkZHJlc3MgZnJvbQ0K
PiA+IGR3Yy0+eGhjaV9yZXNvdXJjZXNbMF0uc3RhcnQuDQo+IA0KPiBJIHRob3VnaHQgSSBhc2tl
ZCBmb3IgdGhhdCBhIGZldyByZXZpc2lvbnMgYWdvIDopDQoNCkFoLCBJIG1pc3NlZCB0aGF0Lg0K
DQo+IA0KPiBJJ2QgcHJlZmVyIHRoYXQsIGluc3RlYWQgb2Ygc2F2aW5nIG9mZiBhIHZhbHVlIHRo
YXQgeW91IGNhbiBsb29rIHVwIGlmDQo+IHlvdSBuZWVkIGl0Lg0KPiANCg0KWWVzLCB0aGlzIGlz
IGJldHRlci4NCg0KSGkgUHJhc2hhbnRoLCBjYW4gd2UganVzdCB1c2UgZHdjLT54aGNpX3Jlc291
cmNlc1swXS5zdGFydCBpbnN0ZWFkPw0KDQpUaGFua3MsDQpUaGluaA==

