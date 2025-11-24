Return-Path: <linux-usb+bounces-30875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A615C82B47
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 23:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A67B4E3B19
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FAA25FA13;
	Mon, 24 Nov 2025 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e0eHM3tZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h6G/V3Zs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OB4xU8dh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717D251793;
	Mon, 24 Nov 2025 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024082; cv=fail; b=BAIYnKazn8mDPlgzob38sZMHTiOGu8i1fUCX39LOf/l7Ln4eafh8FbaYedXaDSGYivHqpgucJHI/YEmQRhxs4YUg5N6f3dlJPfb130yyWtc67Iv5e8OJwspLYVDUoMfLQ3p/uXyvVQ9P8Kb7mggNnJvCHbJjiM7L1zk8Lo7xfnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024082; c=relaxed/simple;
	bh=bNbK0Uy6sQfdNZIYGlj7pvSajn/S9ge0fzYEEnDy5OI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EklYYUyzCDlSw5FdzstsE0O2H5fnvRR+txsSz6gyhqoVclz4I76dGQbO1P6rex/7curkum0r92Vwnip3HvUs+zyV1XqUI6p5bd5OazqXcIxYt3qdcWX0vD8bw7/0KTUICWy3x0OlrI+HnVeWSWeBN6IpKd59NALRdDiHktv5xDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e0eHM3tZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h6G/V3Zs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OB4xU8dh reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOIF3s91439776;
	Mon, 24 Nov 2025 14:41:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=bNbK0Uy6sQfdNZIYGlj7pvSajn/S9ge0fzYEEnDy5OI=; b=
	e0eHM3tZLihUXYWuoWEiV3Ggn/Dtnpoa/RtYv+Mh2GxhLtRaaXoAQCqmHHrDD+TC
	wcKmUJ8SmVsw6dEUzS+z4kWmiQAz6YvXiB55WdSWvI7xRR+1Xh0kjkPfzotztZdh
	g3RiDF5qH2TgvtIS+AOt8V7cWbrXCO1kCq25oU62xeXLYOTQx2LIiVjba4sIybCD
	qXM95+RjPwOnsnpQcAqnPLCbgNSQhD9XbQCIB4Lx9dyJpoAHQnI1DrsP03DK8Tid
	ATM0ql2UCZyZvJ3qsm9kRgImVuLFAS7xy7kkOqGXTT3uQxvlEqLtjAbq44cxcX9X
	18/pu5aEZqyZgmWdZEG7Bg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ammbsuh0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1764024064; bh=bNbK0Uy6sQfdNZIYGlj7pvSajn/S9ge0fzYEEnDy5OI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=h6G/V3ZshU4hT6LO1qC6TTEqqMnvhEikfQkI8xqe6IgCP6nHD5iwpeB4I5zkfMv/B
	 hhJT3rcbr+Vy7ERGpyClx/fVls+Rbbmi1mMpILwIJqgz5tsvRur+k2oAGhUX3RheXA
	 fqtpUm7CRMNQYsz/tNgOgOLJ0V6NWS3/mYO3FO+bkX0m5B0w8/nbB8Mf9II4zRfdxT
	 xwdNp30UHdqavNlYcnC/DDHi1xOC+hIHld0905yXrMaEZ4kaQhQEKINzMdxXaZKONC
	 87MYvnThFey+VuSa3ZdOK3FtSd+8A/9L5a26xhFuPojrZLOUSPDc89fWl4Qltzx+uL
	 3D2h6qgOutBKQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3BB19401F0;
	Mon, 24 Nov 2025 22:41:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EF186A005D;
	Mon, 24 Nov 2025 22:41:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OB4xU8dh;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00405.outbound.protection.outlook.com [40.93.13.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0B97A401D0;
	Mon, 24 Nov 2025 22:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwlwOFHA0bkK+YFcKnD+nNN7EboUzzPIERXzUe1oKCQKcluo0mg9LqdS2NjSc2VuMWv4b0+UpSrioizMuseYJibHcshKWCeZhxSQN1DqnX3yDTM02TUMsxR4t+dQPqAoe/OTINE16SPTOcjQJBkKMyPQz4JxXJndNo7ZrIG4bmIZWqvOy/Hf0dgpXvcUbz0vXlN/3znxUoBSiWVpggkj7+EaCqRFh8FR2BCVds6V+Ctazc/kSlqJMWP95GD1ddXhOwauFeqbh1B1M2HBvz0L/VTlvygcSIJIUdvlr6/ua5hI4eqTrSN+Jj0MSP84flxO+KcCmMyVZTuBtPlBZP14UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNbK0Uy6sQfdNZIYGlj7pvSajn/S9ge0fzYEEnDy5OI=;
 b=ugL1O5Hkefgduoiw1Fv+dpkMTLkL21sO4HDecNBmoz4XDW1TZTUYkla6EfG195y5ov6R6L3dNwfSZqRUnVv1oL5hp+PVBGESFf99eSr9JOJ+cvcINLgzi7afvIyfZiZ+QpIfgPebTw4fpC19/ft509QDEar1X/DQLdSYoek3iaprOoFAXfnBkl93Q97qJTh28W0Wea5lHDGtZ7VIHFK6+SK+/P2DS1LMOWHRsxbmc9SZrn9bdJlf95MafADwkzMEekZjvsJ58XGh/HYGZL1j+AnBMEot2WOiMAZeqwe0b9glpdOL8dhf1X4ZywK7uablq2sV1iXBapKR90rDpqOOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNbK0Uy6sQfdNZIYGlj7pvSajn/S9ge0fzYEEnDy5OI=;
 b=OB4xU8dhgu1vC3t+gjsjwNq+R4Ux6/ejSiqO57pXSWCZQKsedKdjBgJzB5LFWyZ/swn/H3YWWphLb2cwDzRYTdB+BevTO1mk2FH/H6+bHarKVgUMEGOcLDZLVL3CUKe1FYGcchE5KZB4CtqhnLosZxXzu9HmT2L4Co2XjgWaGKg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY3PR12MB9606.namprd12.prod.outlook.com (2603:10b6:930:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 22:40:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 22:40:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: core: Remove redundant comment in core init
Thread-Topic: [PATCH] usb: dwc3: core: Remove redundant comment in core init
Thread-Index: AQHcVvTXxWXi3lY8m0KQV3Z1Q9hwnrUCeOEA
Date: Mon, 24 Nov 2025 22:40:59 +0000
Message-ID: <20251124224056.agfnrjjz7kfbw5ou@synopsys.com>
References: <20251116123033.131004-1-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20251116123033.131004-1-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY3PR12MB9606:EE_
x-ms-office365-filtering-correlation-id: 3e3f8913-6635-4839-d5d6-08de2baa8a4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnBaeUFYRmFCVWxLM3M2TVNCdWpGaEU1TGFGam5NV09NdFhIa3hDbEM5YWF3?=
 =?utf-8?B?S2c3S2l6eXR0MEFMMGZoU0J2S2hreE5FMlNueU5aVy8zZGk1RjBPRDZyNlV6?=
 =?utf-8?B?NkFaM2NabjlNSzV1NGlJdnpqbGhyV0NmRlBoRmE2WGtpZXMxMkUyTzJlSGx1?=
 =?utf-8?B?a0xPTWlYR3pWSGlEb3hpb01YNTJVUHk0dmc1dWtWaFhnNVVxNXNzNlAxY0s2?=
 =?utf-8?B?Qjd5ZFBVYmNTTTdmNXZOMTRjbmg3bzBjRnBLYXBrUncvbitVRklpelJXdFFw?=
 =?utf-8?B?UHgwbWJiTmZOSzdVRlhWbVJRdG1Yb1RXelV6RFMzWEExVHgwTUZFTGlkQ0cx?=
 =?utf-8?B?UTBvbTJiYk82OFpYdHN5Uk5CSTFycXRnSnZVNm1DQU5GVE8wVnZtU08wdmxK?=
 =?utf-8?B?Y2VrTU9EckwvWkNjNkxzNVZnYitjMnh1NmV5QjkvMFAvVlZIclgzeU8vY01J?=
 =?utf-8?B?bTk3cmRNTHVPVmZDMXJkQ2xqQkVXNlRyM2owWW82WjdCU3JLaGt5VXNvNnZK?=
 =?utf-8?B?bG8yZFdac3cwQnk1UlNuSFBPbHFrckZSbG1kOWhSWDEzLy9tajg4ci96WFFk?=
 =?utf-8?B?dEhteFhVelRkeHVhL3g1WVdzM3Jmd2dzS3docDdjVVNaNWJCeCsxWkJIRjJz?=
 =?utf-8?B?YXZBZ0ZpQXcrVk5Sa1RHVkFGeXhrMDIzRi9RamJwaDZQZzB0bnNBMVlRR0Qw?=
 =?utf-8?B?N0dlN2l3M3VTdTFJenp0VnpLYzNHQ1RWT2pDTUd0SU9uYVRRZk1oL3VNVk5u?=
 =?utf-8?B?UERtb0NiK3pLb2ZETVFHMkY2UFV5dFQ1cWt1SzF4N0I0MHIxczBOY0RlKzkz?=
 =?utf-8?B?VktKVWwxc3c3dERJUUZCOUVaNnV2ZndPbGdYeVJubGNzVExOVS8wbW1jcnAw?=
 =?utf-8?B?emJUSndrMVFHL2pINkRQUHQzSG5mZTBreVlCT3NybVdPSXdkbkhvL2NtMzlF?=
 =?utf-8?B?aUgwNklpd0FDVFBnVkpyYXRzazFOTEdaSFFMZHF5L25FS3h6RGwvY0hwVkor?=
 =?utf-8?B?T1JVblZPd1NpZHljRnVmWUdINXFLb3hwQ1M3ZlVDdEZwdHNaTHFqWXA0a3ZQ?=
 =?utf-8?B?ejNpczdiajBQUEZEbzJaMEJrR2lzUzN3cGhjMEhPeVdaOVRQcWFoUG45Z0py?=
 =?utf-8?B?bzI1WDc3V2VGeFowaG45alpHSGJwY09HeFllRVlQSnc1TGh5L0R0RjFjOW91?=
 =?utf-8?B?NWtzNXZnQTIvWkpkSE96N3NSMlNCRzNnTUxRWGx3b2pUcmJpL1kwMGV2TlZU?=
 =?utf-8?B?enNZM3hhK09xajNmczlqM3RhTURkN2xra0FMZkVCWUtDMTVidWlaa1JOSEVW?=
 =?utf-8?B?RmxvNURiWnNiaTNmdFJPeDJLTC93TFhuUElMRVJPYms4NGlCTWh4aElBc0V4?=
 =?utf-8?B?UzN4UHlTcTBPbW9vQ3U3UHZUaEVOTm93UFpYTkhFQTR0NHRoU1hkWXBCY2lw?=
 =?utf-8?B?WTFDcWM4QWc1NW1ncXZ3Vlh1MlBxaTljVkdqcGpGZFNPZ2w2N1QrR0s4LzVz?=
 =?utf-8?B?SWs2bUMwT015VWEzakZGZVZCSzkrbFliQmUvU0VCS3FtZUpITTlHZ1lHYVFp?=
 =?utf-8?B?emVTcVJBSGZCK1lUUWRKNWQ4Skw3VHYyRVJPZ3dMSDFmQnY4V0hRKzd5bHgw?=
 =?utf-8?B?SUtNeWxtcXAzZjFMOXd6dkVpcW9sV2dLS2JSMVVhNWRDZ05TRnNKMDExN1RC?=
 =?utf-8?B?NFVmN05temhwbmFWNWtMQ2JKeUhDNXJ2WmZST09heVdILzlyU25ZUU1JWkhH?=
 =?utf-8?B?ZnFBc0p1bHhjQ2ZCR0EwamxUTnRvTDBSaWh3U0NSbjBiQ29GUEp3RTBXUDQ1?=
 =?utf-8?B?NnNFN3hRZWNWNmtITnB2VSt5WmQxM2ROY05MS1c3a1IyM3gzY3RPOUcrak1q?=
 =?utf-8?B?VmhRS0Jyb2tiMEZTUWsxcFA2RzJqSS9KSEtidGQ2RUNLZ2FyUCtJTmZYaWVQ?=
 =?utf-8?B?TGlIL25nbTRYTmlZRlRMMkxTTDREUTJQVEhuaWFwd0NQa2hoMVp6cS9RT2l6?=
 =?utf-8?B?QVdDUGljSExGWnR6U3NFTHRCOHp4cjVWUGhZbG1lM3VHdThwMWVMY21SNnRN?=
 =?utf-8?Q?MK7jJ5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RysrLzB5aGdTR2tqNVdSK3JqNmFoYkxxcTNEVkFuTW8rWVBUMUVpZmxoS3Z4?=
 =?utf-8?B?Zk1nendkY3JCaXlRN0hLZEFLbTkrOCtJcUptNGVrYjlRcm9EemtxTlFmdjE3?=
 =?utf-8?B?RVZ1RnBxbS85T09MOS9WOWNXbDg5T2tHSHlkekMrREVGWEhJUWEybXVUVmZH?=
 =?utf-8?B?aTRRWVorT2dsUmJMcTdSY1JTLzFjYzE0TnpXbmM5VTV6UWVmaG5WL3hSeU85?=
 =?utf-8?B?TENDU3FGOXRXS2NEb3R0ZlYzZWIyblJycnlXeVZveTREYnA1V29CckxhTUEx?=
 =?utf-8?B?bEdZQ2dqd1ZZb3R0dTJXVENoOFRRcXIxUThiN3kwTVFncnN3Q1g2VlpVWjBx?=
 =?utf-8?B?Rjh0Ry82QWwvaWViMzJxRjgvdWFVekFjd2VhK0Z4Nm0rNDZVSWdSMXNIVUIr?=
 =?utf-8?B?Z2d4a0kvTlZKVHpsTFExMFhwOGVCTG96S3RGcXVyTkpXSXFYNENjaTNWbThR?=
 =?utf-8?B?U2oreEcxRGZOU255dFE2MlIxdkNab0pKMWMxYllaV0JNU0tHd3BCSEVGdG1o?=
 =?utf-8?B?YU9hQ2RsbmFlR0xHeDhWMnM2VTdwVG5Fa3J4Z3lMRC9uSzI3MGJJbE1CZ29L?=
 =?utf-8?B?b0FsYVFLb1Z2OXcrWnZ5MjJJZ09Rd0V1M1E5VkpvTjd2dkFENXhFUFBCeG1R?=
 =?utf-8?B?K0hubWx4VmJpRUVxbHNTcVJ1TnJZWENkQWFualNNakZzT3d0RGtLd0tMcDFO?=
 =?utf-8?B?cjNLcHM5VGdPV1J1QjJnajAyVER4UEpsdFNsUk9tS3BVT0ptQXJNRmhzb1NO?=
 =?utf-8?B?V04ydmZjMmdGTmtRWUswdmJjVzUwSFRhYnFUdEJMaFkvNHdRVUJMSGI4NXZx?=
 =?utf-8?B?MzkrYTZKSHR0ZVFkMkJmbURFWGpwdjFyWnJZNnpZVXVNRG5Rb0VWaUVhME1R?=
 =?utf-8?B?c25maUVuM3ROY1d1SnBYcjRDUFdJZ2RSZGNic3A5bzlsclhwV2JzMmRrWHJI?=
 =?utf-8?B?d0pueDJtb215c05uWEUyOFJldVdzbDBRWFEwM2R2VVRPQk51OWd0NDR4ZThY?=
 =?utf-8?B?bnFXR1BLODRrc1Y4emRydVJ2N2dNdDdtZEMyTGlSWE40azk4MHVmY0x6cEtD?=
 =?utf-8?B?VkdxK3hKNXVMUHhIS3p3TCtiRkhzeUFNazFibkIySDRZeGZSNzcxYXJGVUlq?=
 =?utf-8?B?MG1xR1QyaUFpSXdkNFRIMXUxcHVLY0licGZQVzF5eXc3ZnV5TFhFSXlRZS8r?=
 =?utf-8?B?a0JNcm1vLzI4S1U2MEdPTS9xSjBjdnNYOElna3RaalBPMmJqNjNicjh2Yjli?=
 =?utf-8?B?NEdlTWtUdHJTUlg4RS93b2dqRzdDaWd3OXhlTzZBYS80TG1veFNIeGJFYVpq?=
 =?utf-8?B?VzRZUTczaE5SNHIveE50R2prT1hwbHZxS3daSXRSY0xaK0g2WkVWbXNzc0RN?=
 =?utf-8?B?Tzgydnp3SlBxY0lUdC85QUQ5WHo2VjBvYmhPYXZNdkRQakUwUGg1YnlQN3BZ?=
 =?utf-8?B?Rm5NVXF5NjFmbFA0QW5WYTdvdjFjbHpWMVdnaHg5eUhiajZhNHRZdkMxUmts?=
 =?utf-8?B?ZzdkU2ZGMkcyUmNOV1EyMVpOcEswVGNQVzR6LzZPOGIrZElrTkJ1bGplTWdP?=
 =?utf-8?B?VUxhYmY2NU5wcWpoVDQ1M2JFZ1BzT1FFeVlwSVkwbDhEVTVvSmJidzZRbXg1?=
 =?utf-8?B?MmhQazg0ZVFCMFM5U1RIeEVOMmZHdHZTMDZDVFk1ZkZwdFpCbWRVcGF0emo0?=
 =?utf-8?B?cnZITjhLRWxhY096d3ZDbVRyRis4Z2VjRHhrdkJCZk80ckp3UTdMZDU0ZDlD?=
 =?utf-8?B?ZUxDUnBOMHZHdnY5UEhVei9TYjRNbzJOMVpwdjVFSXpCcFFEMXVaL1UxWStR?=
 =?utf-8?B?WHF1YWpQRmJXYTN6T2FqYXQrajRTb3NWL0JpQVNTYjBhZ3hCTThKZmN1Q21m?=
 =?utf-8?B?OTRIWm9UVnBHeFlnZ3NKZlVabzFEMXRHTE1zTjUzQzcwb3JYN3R5R0txV0pz?=
 =?utf-8?B?RVFEeWxEcWRrRFdJNmxqb3BsT0YwTUI4V0lHem5YNDNBeWloUEZLN2NpNTZN?=
 =?utf-8?B?Z21Fb2JxcVlnU2RJQzNQbXdaN3ZaVDZiVHd5MEo1NGs2ZWtBM0wzNlBsK0s4?=
 =?utf-8?B?K05UbngwTmpWbE1Yc1g3VmtDS2dNRVZpZkc0ZXVpSnF1czZlcEJGMUEyaXdt?=
 =?utf-8?Q?U24wgOv6foEcfzme30YfyHJed?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <354075893870AD4EAA125E74D2F708C0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fM83UwYDCqvBS6NiZkYv65r5l+eJwNffEelgn0tdOrSpBDwqLyVB4enhnaS7kbxdsTZUyLK4D6/7QW0S+K6oGWrCKY3EsMBKQ1LJlkByanPaaGjASb3+7q3QJluYmIRkNJCWu0YCtr+RLs5niSKcA1lXK0sWWq85Wu7IPWRpV70o6jSvy6ttrmJRPciraWhAMwOYtwSyb0Z+ekqheZR3M19wyeNjyABSHTLIGZjRQoHDZfYP+KGikNTMfHmWi3csilGtj/Ymdxxqs63QdV/pz1G6QgX1Noj7LeDrkQU8l/1jhQJCShXamaITHV3SX8TpfIyyW0bLgy/JTOTOLYemxkcD3Pwp+cOHepNzJMrLF99U2QYriz5jrLFigMxgcANporic2tl5GaIzDrqwT+eaACLyg/QWLQghzHAmbSkLw2tIzxRaybgvfrIMKPsYjB0nSYRytpT1TKDXx2+2JxmPrOliAeLl763xG9HpWJg5XvqP3iyIUpJvcRMGFFb7finH83XPiHuhPYaX6tlYvshI09oGXwnsuSCFl5VKbsXd1OJ4cwtYCGOs+dC0Yi/BsIZj44qSL3+5kLcUJfAZous93ZHgE6zCmm7xOVMMEFyTjj88cy1HtGQfQEuZSJOv8Ec2M93V84yZ3JVS84yJ2OFG6g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3f8913-6635-4839-d5d6-08de2baa8a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 22:40:59.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KockDvkvVDNG7b/iZDvRfpiiKL5oxWnCs8SDFaQrNVVASSKGOPCB0dmqIy8cDeUECKzk+wt4HPINFhAmgcWqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9606
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE5NiBTYWx0ZWRfXwxbrPAJNCbKQ
 lMMmGuX/PaCLx1B9vT+dmNGfKmLxJHPyAVhAPOVCfYFDFj2YRrNOUZ+Pzhivx1yaDtDv8EOW4H3
 GGbWNginuGFgTo5NbB9xzTdZwjUeoeLqUDNig36uvVY6aJUglm/yEAUgfLCCRhkubJj0MkqSsZV
 yL2ICwHXwb6Zoxr/hEbd1Bpb14tTUNoihTqa/o4NYcxyeNvc6GKrj18CFN/GQ5RlsJPYYzi01jm
 jrsEa4XouBrRSuZQsSqr4uU5i+bK7GuovPys3NmVCcVmdfhsolFSKz+YAGkn3E3tY4AWmrqmIt/
 IkqPzWmxaUqIxb2Itzr52hqy9oRGApadsLRqKc2TegxsesupAGQDUHGKJ6EX1HQrWEkwPU+t1D3
 7i2iD4gklpdAkVeB3gf//MClTd1VrQ==
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6924df01 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=5oeLYei82KMIqBVJ4WwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2m0GGJGt_kWpCrsyv97jcL_oR177OJo5
X-Proofpoint-ORIG-GUID: 2m0GGJGt_kWpCrsyv97jcL_oR177OJo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_09,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240196

T24gU3VuLCBOb3YgMTYsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IFJlbW92ZSBy
ZWR1bmRhbnQgY29tbWVudCB3aGljaCB3YXMgcHV0IGluIHRvIGFkZHJlc3MgTExVQ1RMIHJlZ2lz
dGVyDQo+IG1vZGlmaWNhdGlvbnMgZm9yIGFsbCBhcHBsaWNhYmxlIHBvcnRzIG9mIG11bHRpcG9y
dCBjb250cm9sbGVyLiBBbHRob3VnaA0KPiB0aGUgc3VwcG9ydCB3YXMgYWRkZWQsIHRoZSB0b2Rv
IGNvbW1lbnQgd2Fzbid0IHJlbW92ZWQgdGhlbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyaXNo
bmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDQgLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCA5NmY4NWVhZGEwNDcuLmZiZWRmNDZk
NzQ2OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTE0ODQsMTAgKzE0ODQsNiBAQCBpbnQgZHdjM19j
b3JlX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIA0KPiAgCWR3YzNfY29uZmlnX3RocmVzaG9s
ZChkd2MpOw0KPiAgDQo+IC0JLyoNCj4gLQkgKiBNb2RpZnkgdGhpcyBmb3IgYWxsIHN1cHBvcnRl
ZCBTdXBlciBTcGVlZCBwb3J0cyB3aGVuDQo+IC0JICogbXVsdGlwb3J0IHN1cHBvcnQgaXMgYWRk
ZWQuDQo+IC0JICovDQo+ICAJaWYgKGh3X21vZGUgIT0gRFdDM19HSFdQQVJBTVMwX01PREVfR0FE
R0VUICYmDQo+ICAJICAgIChEV0MzX0lQX0lTKERXQzMxKSkgJiYNCj4gIAkgICAgZHdjLT5tYXhp
bXVtX3NwZWVkID09IFVTQl9TUEVFRF9TVVBFUikgew0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpCUiwN
ClRoaW5o

