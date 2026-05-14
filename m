Return-Path: <linux-usb+bounces-37431-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH3eAFgkBWq3SwIAu9opvQ
	(envelope-from <linux-usb+bounces-37431-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:24:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA353CAD7
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E74C302FB7D
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B5E2FFFA4;
	Thu, 14 May 2026 01:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BrF5TSHp";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aTKHCLtY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eopOFB9R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572118872A;
	Thu, 14 May 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721874; cv=fail; b=s8tZ7ikh3cdOZVhmK/GBkqsVspR0h3qrN5qOdluw4j27oRy9tbYDViADg4UTv06loUbaxSkudrKCaMdLifpNYZJnDlWXkgTtiad2E30sKkBdKuiObDNo5Lw0+t3CN5IxTnPxKCaF/OjS0LTFCqsm7PrFuNsvkQ+uNJw99n0gHME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721874; c=relaxed/simple;
	bh=mKWSP9GciOLZl09g39NO1SEZ5Uhe0P3rdWAUi+Zz/yU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eKhV0It8W2hAX+hvevaVYwuZOj4Xqe0Iud9zrsLD5+FHdk4Z7Zrrwz/2+7v1nMIckuVq9+pw372hzv6OOJw9rDW9OYaygmYm/TXZnkyyHYyJLpC6YTd3RMDQtfuSSyNEQo8TVJWt6lHzOB0650EGKAK2IJ4ANe2YLXMW3VMirAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BrF5TSHp; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aTKHCLtY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eopOFB9R reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DLZH3c1011221;
	Wed, 13 May 2026 18:24:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mKWSP9GciOLZl09g39NO1SEZ5Uhe0P3rdWAUi+Zz/yU=; b=
	BrF5TSHpA236B2MeTWDmbnRYz9xefvorekntpyhgOJIggj2JyKn+9twA9heKd3Ud
	JtWFSs9/cLoyk3pXywLwUMLdMLA8n7mfNfDtCo7T345l+j7I37nMUBToryimQDE4
	WRu0+JqZb4Sz9WCbtBEUH3rwYn0EDCwHA7F8YinijfokuOSETNYgIi7qVYwlHuf/
	UYwl+x8HCnr4vNVp0VN68vFl8aszNnc8wvu93m/8X1cj6kwAn9bVG3Nu0XMQkOVX
	J4bqfcCqK4LD9zazB0cRVaRphsuKqG+sPt61qkp57FsV7UGqwWd15hsGrZFxEo+B
	Wytnp/xe5m3FYowfafK1ag==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e4uw835hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 18:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778721844; bh=mKWSP9GciOLZl09g39NO1SEZ5Uhe0P3rdWAUi+Zz/yU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aTKHCLtYnEZHaHa4MyYbVpkIREAGWW8SAeWrEImP1zvMOMZt7J1iXEy83CLwaYFiI
	 +Gt7zemfrNJpdXiGA9IABVpLX6qgO34WE5978loJRdZKzZoS8xQhnIF8+byz1WvT3z
	 nWZrPEhD+SiY9mq1DuM/9hMQa7opU657p5dtozlckt6CFAI2n2NQ3nSSmqJHkhIq1z
	 7Lzd3jIZubxK67jKYVybOOvnhZNJA11j6orkg7I07BYivOVEQFZa4MERP9USNMDMC3
	 26X1Zj5gjtIIcBaxX3dADfZAlSNqGx3dA8mD+AJGvVCKBDvr+6q32uP4G5Bwzf75Rd
	 iZdn6xq+jKV4A==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4EA2940467;
	Thu, 14 May 2026 01:24:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C80F2A020A;
	Thu, 14 May 2026 01:24:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eopOFB9R;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DB69F40174;
	Thu, 14 May 2026 01:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn8d9MB8Ucf+JyzTTisinx1fEC03v3621Ha+yoX3KPq4n0LzZ8oN0aUVZzsi3pmEDcqmfHNZ1WbwHFZn6DL4+4DHc8RlcPZPcmGnHnIN++8FnwbMGOmjo5iDIkj15FSzqPQPQBJh+k+NqtJmXioG0f3+WuZKp6mAPyzpGRlbXxAKKNhOaJi5d60FBiUdmB3chaL48Vc2+72H1UmWFp4j28q78/wiTgTicu9yjFaFoIg5Q0DSLhqagCeiEwsnVTHv4UY/GDAMIJO9lf+EqE17Skd7LuM+MuVzYHey7jygSojStQs9qGLJpZfDMnXSRm6pzPNE9HN5NXTEns+zNGXHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKWSP9GciOLZl09g39NO1SEZ5Uhe0P3rdWAUi+Zz/yU=;
 b=e3B82rld4tkoC1h3RIg9uPEQ1s0XMqR0tdKFmlo6m86W4UQUSF1e7yKIb+FgoRMJcdyhFUDUysp0fn/ISlA+38rMY80HwxYxZ0eTBdMAiQl/4+wgRBPhLFVzGRZdE8x2LuXCJiRNJWeGvXDSMt3skynBVanvzTAOZppvRQH40bh7YhFabFaWJRiE0/i7hx1wqjK51MYhpqXm+6NSOkrwPXoT/BpOegj4WhPbLett85yOU3zllrH933Dc4Ywj6VbYjyx3GeA0nWF9dAncgwi5Vjd+LixYZkfCccOu3qcGY1zC/TZAZtEs0YerJu3pP868vPMy6kuBdWtY8pMS8Zv4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKWSP9GciOLZl09g39NO1SEZ5Uhe0P3rdWAUi+Zz/yU=;
 b=eopOFB9ROd7gxqoMqahmvCKRvzzr2JBWvWvZAi0/aNN6gq4IcDcpTAy98y1TpeJUUpGb9GimgQ8jvdEXp0O3JNgvRXL52L6lVk5K9LTBboTnTUTSt1jUE5XAErM4MZ3XXW+VRvYmtaI9stthjkn4lukuaZSO6dXmNDee7kVCqAU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 01:23:56 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 01:23:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 1/3] usb: dwc3: xilinx: fix missing space before closing
 comment delimiter
Thread-Topic: [PATCH 1/3] usb: dwc3: xilinx: fix missing space before closing
 comment delimiter
Thread-Index: AQHc4WB4bOVEFafMykC3PA+JlqSi3bYMvbQA
Date: Thu, 14 May 2026 01:23:55 +0000
Message-ID: <agUj84Mxa--lDnC-@vbox>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
 <20260511160814.2904882-2-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260511160814.2904882-2-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB9493:EE_
x-ms-office365-filtering-correlation-id: c1ee01ff-f923-4fa5-b5d3-08deb15777a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 569+oBqOyE0ykE1So5+loHRsDXMFVkWTaZCIQ5kLT7LR/iBZiSBe8aoxf2+LXy689P6FIMBxmrv6Y5aaQJPQxbTv6YzpG3OG7/hQpkqFXUIKW7Kc0HZIKnBEqERWhJfMsFIdEov5IsWV17DHFO9kMHX0J4j0VtPJB8MU0c5vAdSqN1RivrjhV8CsQYiv00NzCO3gdMxCxPAVD80tShmZ6PITz68QKzBRlsR/rcL0Pjn3/dHdEKeXYo8O2sm37T851ErsA9ZSKV4dK1+gjc4CiOwHl0w24QTyXuE7zQXdHq3tKEB4icVtEG57VkXtxMn7mP/bhmdUveUjhtfOkA+ABv+c3kw604dZdkvkxS6S8ANeoHzjlpc8dMYZrPL4gUbFN7sWzSkqMNp6H0b3WQnOnMY0aPm5loJEoUlrzrzK3YUh52QsJHkg2WAODK9BH1X7wbWcWPQduVagiSRzIqywqKrgDpnduNFW6EtN39sFsHI3Gbirn89zJGsrhbMOqWq5pihJcV+3xMveoOQDi1pN2tyiqvNhp/+EFnzcml3yN+Ep/6bTMhT4tgvTGR/m5jFo8wCZZWLFEYUPiJ1rME+qMWfvRsdQcPUKrU91bY07lqP4NC1LWwoLyPJq4YtGuCsA0+Rm9IwsiYCAjtnT1CHzqrFOcFcPs2IL7pERHHOqK9wBXW+klzdVddmB4NWXzY+s5TYgFU6JY6S5CV63jPfCj1Uf7cl0C00roSlarN41fm7+NbKuIEY9hDl2YvsOOAqF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ai96VXVEL0tVVFE4MXNCSGZqclZMUm8vZlhmOXpFK3ZpVXhsRzgrQ0NlQ2Ew?=
 =?utf-8?B?RTMyWDZ2RkZ2eVdJTnR5SzBJeUh5L2FWTzBBT1VJSGJTQWNYcVAzdkJzdUJT?=
 =?utf-8?B?LzhDUWpCVHVabFFWZmdoei9WU2w4b0JtZWpKYWpBelpwdkIrQUQ5bXpuZ0dH?=
 =?utf-8?B?UThwZ0x2NU5EdEFhREppeVFJMXUvMUlaYWZlVEZVN0pGUTVXWi9kZW4wbWkw?=
 =?utf-8?B?S0JuV2FmejAvSXE3Uk04SmN2UnBXc3VyR2w4MTgwNEp6d3RKOTU5RFU4ZGJw?=
 =?utf-8?B?SnF1NklMSFFaQnQyZUhPNG5jRGhrdWd3ZHhRYUFmamd4NjVNVWo2cWxQV1p4?=
 =?utf-8?B?TWt3YXJ2c1dmcGExKzRhd08yMTE4anN5Vmh4bDR1bktFKytmV0xIOHNIU1lU?=
 =?utf-8?B?c3FUM05vUkxmam52MFdtcGhPbkJMelIrK2k0RlcvTzQyT1F2UzQ4ZjEzd1hU?=
 =?utf-8?B?NzdKVjBveUlUTUw0ZTMxa2lHdTA0dHNjNHIwcUpmcnp4K2JGRzAzaXFBRVo3?=
 =?utf-8?B?RW9tQ2JxYVk1cCs2eTE3ei9zSlIzeVhiSUpQTEtjcVZaci81VWdrWHo4UDRz?=
 =?utf-8?B?SFZicGpKTms2dDNzRlVsRGcrYXdYVllERFNQY2NGNWhjRVYxTEV5cnhURTN4?=
 =?utf-8?B?UjVTRHRzZlJpNTFhT1MzeG5TQTZDRXJBejljbnNXUFRzbUpFbGZIZnFoWGps?=
 =?utf-8?B?VGZKdVNzV1V3QW1hbTRwTVJFWDFNSlBkam91cVJ1M3VDdUxVanl6UWlXZ3Bz?=
 =?utf-8?B?YllUc2d1NEh6c0E1NVBxaVlHblEzNXRlR0xuUkpxVmdWUUFUKzFPTThEbnJs?=
 =?utf-8?B?WDYyNzduQm1uVmVYQmVuYXllT0ZKSDJVTktWTDZITmhxK05TRVpORjdkVEY5?=
 =?utf-8?B?QVNBN3dOMWlaWUJwMDdPVTlraEt3SE8vSi9mbW45WHdBVGNmSDQ1aGJWMmRP?=
 =?utf-8?B?bEdKOUZraWxmVDRrZGNVQlRxWVVXQm5WQk5TeVhDYkprb3dkMjNvZDVnSmh1?=
 =?utf-8?B?WFhOWWxrWUt1Z2RoTkxDUmZhVUFRd0xHbC9RZ0gwSUFnRnJFemQ0dWM4cko5?=
 =?utf-8?B?MWdYb3lIaDFpazZDVHZlQzhuUkxRMUM4Y1orTlRBN0kweEsvRElqVkp5ZWF6?=
 =?utf-8?B?bUhlR3E0WC9ObW5IY0c2Zjl5Nm4yL0RYaS9hR0NvMTVFRHdSTVAwSHNWd1Fm?=
 =?utf-8?B?eFNMbnJtYWovNVI4VWxqeGNWUWF2MUdPMGwxT2t2eUUxSktnVXIrUzhHQ2o0?=
 =?utf-8?B?dmVMWWlxRE5ZZTVRNVNlYi9rRFE5OGwvWmRzbms4NDJIRXh5SHNvQjJzTDBw?=
 =?utf-8?B?d2NLM3poeWFXNXM1OVhoOFJ5bnU3Tjl4cFVPRmNvdnUya2pzK3dzL09la2hz?=
 =?utf-8?B?cnFtN0ZyMWFISHR5KzkvU1dXQUxsYmJBb2NoZzFPNkV4WEhrU2dVSTBjbUtP?=
 =?utf-8?B?Q0RoV2c4dmYxTlJrQ3g3WXhPV25Dd0YvcjQ2WGYxajI5Y3NsVXpESE04a1Fr?=
 =?utf-8?B?Z3RxL016anl1RkxHQlkzR3JGSjA2S3M4Z3gwL2V3NXg3OGVScjRLK0FxL2FI?=
 =?utf-8?B?Zm1WWlNSRFoyNCtGdElzWEFtZ0RjNnpnckRBbXlqSXY3K2I2UE9IN0hkMy9z?=
 =?utf-8?B?MDVRa2RkYzRWS05Ga2dFQ0tZeCtDckhUWHI1M3hRcXQrQ3ZDamJMMXhmK0l5?=
 =?utf-8?B?bDF3cE1Bc0s0R1dMQlZ1cWtBckJjb2FCdFRnenVrK2JyWERjbldIQ3duakxF?=
 =?utf-8?B?WVE3OXAyRVVoZHp4UU9FMTZjbUFSdlV2UGFpWDRZczhaQ3VSWFlraUl5UCs0?=
 =?utf-8?B?WjloMjlVUmxITGxLYVBnSkswN3gxYlMvYnRsb1gxT1ovWGxSWVRGUTJlVnJI?=
 =?utf-8?B?bGlZamtkV3ltRlVENFNkNjhqWUw1YUJDdEdKMlF5WCs1NEpCeEkrcDFrdWl6?=
 =?utf-8?B?VmMvUG5QV29kRkx4d0FId3hhR1VySUdBR2RqbkRHNklJb2lrcWxhY2pobEVy?=
 =?utf-8?B?NDI1SjF1V2t1R2I1SEZGaVlOTVcyajk1NTFUM21NdFJ3YjgzQit2aWNiajd4?=
 =?utf-8?B?YS9LRVRVMEFWOU9DL2Y3QVlCMHM0TVVwYUEwa3c5M3IzYlc4bFdpMlAvNU1h?=
 =?utf-8?B?RWM0dlBmLzg4b0MxV0psVDNmMVFoT2RkL1RPWG1qQmFLVG93WmRvSHFPaDBm?=
 =?utf-8?B?ZGcvUjZWQ00vbTRUMmNQRlpNaC90SmlIQ2plQ2xMYUdveHJsdnFMWWF1NUhl?=
 =?utf-8?B?RmlWREJjQmx4ZE1BSDB4bmQxemxuVG5JZ25LSkVJTXNhN3piZzhnK0V4Yytx?=
 =?utf-8?B?WExoeWVPVDl5WjJtNGtXRFlIU1A1L1ZUZWY0czFMRjBWdXU4Ympndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1DB9B4C67F49D4689A63C9CC6B433E0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	EuzLqu9hG76ezFdYDrIBLXjWkYp4IvKMiuD9254gB2guSdKuGNKEb1UrjUhUcxnA7X+bFZ7KsHdM3oKtHonLDAr9tdbAgOSd+ufs/A9IMjbaH1GFBG/aX/7qYQb/AHrunG9MQxfklFDCKt2UQWd6HU4qBEQltC0pI9VxLammScQ5uDre9vjWux5XYVdL3rPJHTY6+p0ovc8J8v5UBSGQ3aY+36j8bt5m/VvlHMDAQ20tmYjcPxi73mG1L6c2DzcJ1f1pIC8D5WS9bE65SgDF/styHqKqW9aP9vHYdq9K7oEtdQrEsNQ4lAdeuW5DBLPbP2BjJTFirnKoLjWFMxXW2A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u/Wy2e1qEzQVcwXlQ70CVQilv7pUk/1WVYkxo6uOmciQzvG5KDAcxpfCO+8Pl+Ojme/ppfQlGfEqHcD7Pgb5/iU9xKYvUeOqEfi22Dkn/yPitqVJt/Vdur3h+Ws+cQHcLmYt/6s9UlKu0hgjEG8dw9IWYhGsPPDz06dMpQlzH1xBOsM+PEbZ5EkWv7wpN4QJgMhSIPrpSPkvCHivrDuRkcoIkGEiqDl1tyvry6zfF4HECJZOvXwmAwFut1AO7DGk5EevtUAEMN09g/fNwzNfRUikIuBafPyQUmgUSGy60aneOGIoLmrgCmHSoMYmRaSTaM/KOxJCJQnEJDSCWL78W6f8JCyOPiKzo8k2Ywz3WxfEJgbSWuF6b+/iKQ4zQhfB6F4B90Xm3Bd66h/gk1rBrAsmsPKEqoP+sxjtUTQQTcvFjMGaJipDxxwp3Gu+ENAmOS5YhAPgcOzlHjM7tYIeM+I2lk12K+xjuOlIwVREPJbqrjy0oym0G1tFMtxAlgcWE98RhRIGVrD6SivAYh0Sm3OkwP8P+d+6g85ND8yomkhxutDYLG4pxi9jdFQChLSPELOabG2r3rU+4jY0gpTsxlM6R7Ff5xNpwZY6xU24QRYt5/5W38TkVrChEN+Ig93Yl26ldn1HQagR5wemTXMs1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee01ff-f923-4fa5-b5d3-08deb15777a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 01:23:56.0237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scVgnPBAxZwTNsMRk/feEfdvR7wXzMA7/VCz2Wpn9YuEO+R7VFq6frZrzZ+b49a6w6zwvl0kFl9tNdDrXwmEZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
X-Proofpoint-GUID: QXVRpvcLEZNEqKWDDXc1WgrSByH8w-FW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAxMSBTYWx0ZWRfX3IXlJf8MBb+b
 8SR1msa0mDhzWrKUWeBFErYdfIFkofCmIoTseaGhO+xI6PSIiVPZtTCQX0Df1jlRGqprM33Jrz1
 FhOlWOGxfMA6HvnS+U5Gd9auWF0H/l7DH+SPOPNpGkbgpbdoWgkMPtOjbM9XrS+NhGEf/RyZbg3
 1HLxvm3tjfsZIZkKxmGSEy5Lhawx3s3sU/qGOKseZMKzqWg+DtcdzorH+sbft5RQPCkUN/4vpp6
 tKG9fqwRvGextCTVA81BOYCXQMzt8htxwBEMlzv8iW5zWmbwHaWK6+Bp78tfYmFIHQqjKoac46L
 LC6YLEuakxY8mc+idUE+bcoisDYiF/rF6+Dv/0ZOdawZ/5Yk3N2UELJmJziX42j4FPO/edl14qI
 MYriDVEbP/ngyONCff/69jiV6SXwkenpHJE/flh2PLDXupkiKbmhHQLHk9FsbHlROuFvOgJzDvy
 +ZiW21nWmDRTKBhrbjw==
X-Authority-Analysis: v=2.4 cv=NJXlPU6g c=1 sm=1 tr=0 ts=6a052434 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=zd2uoN0lAAAA:8 a=jIQo8A4GAAAA:8 a=soKO66J3RpD613XK04IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QXVRpvcLEZNEqKWDDXc1WgrSByH8w-FW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605140011
X-Rspamd-Queue-Id: 5FCA353CAD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37431-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:email,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IEFkZCBt
aXNzaW5nIHNwYWNlIGJlZm9yZSAnKi8nIGluIGFuIGlubGluZSBjb21tZW50IHRvIGZvbGxvdw0K
PiB0aGUga2VybmVsIGNvZGluZyBzdHlsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhZGhleSBT
aHlhbSBQYW5kZXkgPHJhZGhleS5zaHlhbS5wYW5kZXlAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMteGlsaW54LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4g
aW5kZXggZjQxYjBkYTVlODlkLi5hM2M3ZGMyNThjN2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGls
aW54LmMNCj4gQEAgLTE5Niw3ICsxOTYsNyBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9pbml0X3p5
bnFtcChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEpDQo+ICAJfQ0KPiAgDQo+ICAJaWYgKHBy
aXZfZGF0YS0+dXNiM19waHkpIHsNCj4gLQkJLyogU2V0IFBJUEUgUG93ZXIgUHJlc2VudCBzaWdu
YWwgaW4gRlBEIFBvd2VyIFByZXNlbnQgUmVnaXN0ZXIqLw0KPiArCQkvKiBTZXQgUElQRSBQb3dl
ciBQcmVzZW50IHNpZ25hbCBpbiBGUEQgUG93ZXIgUHJlc2VudCBSZWdpc3RlciAqLw0KPiAgCQl3
cml0ZWwoRlBEX1BPV0VSX1BSU05UX09QVElPTiwgcHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0Jf
RlBEX1BPV0VSX1BSU05UKTsNCj4gIAkJLyogU2V0IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBiaXQg
aW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gIAkJd3JpdGVsKFBJUEVfQ0xLX1NFTEVD
VCwgcHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0JfRlBEX1BJUEVfQ0xLKTsNCj4gLS0gDQo+IDIu
NDQuNA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lz
LmNvbT4NCg0KQlIsDQpUaGluaA==

