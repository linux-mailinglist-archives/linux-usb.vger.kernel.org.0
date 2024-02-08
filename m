Return-Path: <linux-usb+bounces-6115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7384EE13
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 00:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E7641C235FF
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 23:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE1050A68;
	Thu,  8 Feb 2024 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KCo8iRhD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dRBUNNUF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="u9EjrtDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38D50257
	for <linux-usb@vger.kernel.org>; Thu,  8 Feb 2024 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707436467; cv=fail; b=sY9rZihW+TXp4c9su6qFwUP4eETroqLP4UseA9MDn0aIP5yVtfzi8Dlr9GsB3cx8hdT6rbgAOvkerg4LYh3KSajIMGb3IKB4WT3ZL8NvU5+tuuwlEFUJ11+RczVvYTga74l6YcJO1JCUwX520EC9VsrQwLQPfHj9Xwwhrb5dyJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707436467; c=relaxed/simple;
	bh=6w6MgGQH8yl9UnUz59kkat62UGqx/PGoKZWVlWQeNLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dCZJRTidxUR/2EzgeT0VzNwtWkRFjJv2YmbkYI21miDV/nT4foCM2hWIsiSghnmnCTGc3xOCTdGfi9F4j+2PdJnmuZbXl+MZBCWZmAqOBNR7QSo0GnDEZbS0hEDzxKoG5i75zFxOjP5JdKUp2E4SXfD7CvoZ88ZX165GgtS9EPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KCo8iRhD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dRBUNNUF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u9EjrtDS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418NBKQH007870;
	Thu, 8 Feb 2024 15:53:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=6w6MgGQH8yl9UnUz59kkat62UGqx/PGoKZWVlWQeNLQ=; b=
	KCo8iRhD/JBbkg49u7pX6zydjbSktbEslwXG5UKGTArXwi0JAeXhPNRSWM+OKInD
	1u9Isbwy6DwejXkkteiTYIKREfc5WEEh19tB7beK/J4hm/fz6mSRScWoV4LVIJoj
	gYILqdR3wVZDn1uzMz/tVdnqIuQ68AkCul3lKqGdxo0Rqm9GwoiPMaXYaegYUwKd
	+nH8siR9yKgSTOpadoo1wFU9YKQhV6CPrwhhiYVkVnSrJ4QOGZu/8PfNG9cMH8Js
	8cN9Sxy7k8xGiBqy+uwc4eaL9vSaQerRwB++MrsocBV1AJ/pcjBUI7vUCOVMGGf2
	5aM53grYS8I5x62tX4GpWA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3w1n9w99w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 15:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1707436423; bh=6w6MgGQH8yl9UnUz59kkat62UGqx/PGoKZWVlWQeNLQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dRBUNNUFJrLMYRZFHzoIVwB+39p3JzI0dlSDC1sNjO/efVvPtmFNxmREvbjmmDSG6
	 jbBUfLzDjX4CHzzV3RKUXyv5nEJzP1h6Rl9rh4tTj6G01HFCl1dORn1w2Gws3ZmNwP
	 4Jy3pWweB/+567XDCMe4JZk5DGvSovMwwho1gXA2rgn8WsjxkF25vxKv9XyaI7UJpP
	 iz35hkTapm0TbDj2MQF5fDrj8Q21IjpsYtdyKbp5sx0bxblUkXyiaQFtWfGIXa+nW4
	 MGIIrzYqXRKf42F1ycn1Hl1xgi/Nq9KYgf5BzeEZ1w0L+lAN3+Xso/sdx/yVMwPBaO
	 FjfrRp3R2ZN7A==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E21DF40362;
	Thu,  8 Feb 2024 23:53:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 06879A008D;
	Thu,  8 Feb 2024 23:53:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u9EjrtDS;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B0D7D40361;
	Thu,  8 Feb 2024 23:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbIYKkTP71Wx5Dzj2xjV7l0vMkqEeqqiy46RsWg55zWi7LrMLe3IywLGdtGrZONvUCMIByINdYTbI5P6D8bPQd/pa4QJyYwI3onWmX4WpHeM/hNNGip+XJ99pPlku+SeUsl6euu+B25QtiHhnX86p5Gfi3gIQ/49/vok1eL0M0p2H2PPOHj5jnIxnXaCfBh5Wbsf1r0hjuS/Zggo6i3fcy+kZkTb8YcUDapYMAIkB59OmcNZLHtgNs+Q5cvQchKAwrJQTm7pHiZFQWpFpSditIIi4DAxwC+N0QR8JheupHpJLZdeyNUAZEzUlEGkK/hHxDUnlC9CQUkL6uSTfYlBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w6MgGQH8yl9UnUz59kkat62UGqx/PGoKZWVlWQeNLQ=;
 b=Z4vRBaRmvu5JTKWQ12jLbrCZZBUfj/2Yd8+7E/BpTGZ4lMc1MjtWJpNwP1jXaIuj35Asnh0Akwi8t3+KHF28LfpZAQTV59iFqK9b8H38WnUAOydRSiEGYUcMbul7lVZIU7LUWeM0owg2Ix8RRt/1stiGWb49MkGNRHU1AbN9bksiL1WhEHEpibCSXaXripDpqzc4UjuPOAvt2xzEZpsRNV5gB6GQaBYT1DsVQb7sK0QdNS2nzk7LFsLN/Zo+9n82TcrWqGDJC3cE+NJQm3kORhs4wcuhMOewAexY7PZmEL4rUSh4NeeH0nqwpGKf9X091INiGHsXdapACXIEoHi6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w6MgGQH8yl9UnUz59kkat62UGqx/PGoKZWVlWQeNLQ=;
 b=u9EjrtDSAeXf967ykW+iKBj8E4llazE2o38RX24v3AGbwDVh5tSGOk5ACGEi7Zy9daAIn3sGyzslaT1My48TEl/1JBzs4NfHhwTmHWkRbE7y1db08cRFR8JVNWcBWze2WurJD0RmVjHcX4E2mL4mEOIFmS1Eak43XT0rCeSewzI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.13; Thu, 8 Feb
 2024 23:53:33 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7270.009; Thu, 8 Feb 2024
 23:53:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LICAAN6oAIAHFi2AgAB/wICABATrAA==
Date: Thu, 8 Feb 2024 23:53:33 +0000
Message-ID: <20240208235300.pjife5zxfz5onqvk@synopsys.com>
References: <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
In-Reply-To: <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB6102:EE_
x-ms-office365-filtering-correlation-id: dc9c2ea2-9504-4719-2d31-08dc290128a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zrisf62CPt7VrqDoZRgcl0qOVLMsZw1aE7mS8mryFsmqLR/j4Xm05pJx06/R144HFxz7tiVBbiGZbW3G54SZoXl7LaoWHIssRruDyNTenIeTtVR2qqP/Jr6+oX1DA9xTLnOiEdVZQe7Pw/5pu5iBDEI23hvyHynfDm5e6v9vWMJAOa5sqMZoDnWBK6Tuhh06931YPsLwnrm3Q/P4/iRMg9c7c6WQ24+XQTuznfdRhc5qqAxxYtdYvc2vyaZ6LyT3E5DP0lNcwa/SG45mokdcaZtX1nCU8RtepKZzPR0PqqMh+6Omog1XYz4U/8IaQmqtYNRXgO/MJ2hl2MPRH5E3zQw5liyN5uCPNzrx3sVmOifcTnx5NOfzsJuE1Jp+nqsxnAZlAo9tbPb2UNHnkpqfd1LF2hVo/zKXiqsZovs8FNzVtV1RBoC9m7if0V9ibB36/SAI2fWTVkE/vA608VEJohevih3Dlq9S5pCBNrzhS2ne8GNCogw61Wp99XmfunP1/gg/Mbi0lFA6wMBwCE7M1c5C2n6hIprW3fOBJlKYFMjfv/VN+JSHjbxIPNAC5UnAqpbyt+ZOmCV9dAs/6JGmB3hiXaPswlO/1GM/tGreCEdlhXxrqJN9NaQj66LpJ7fN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(76116006)(478600001)(7416002)(8936002)(6512007)(4326008)(71200400001)(1076003)(26005)(86362001)(83380400001)(64756008)(66476007)(36756003)(54906003)(38100700002)(6916009)(2616005)(122000001)(66446008)(41300700001)(8676002)(38070700009)(66946007)(6486002)(6506007)(66556008)(316002)(2906002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L2JEdjBEWDNZN0xNWENhL1VEZWJnbnhQbkdjY052TGw0ekVTSEkzV0h3UkhL?=
 =?utf-8?B?bXlaNS9GK3hDaVFNaEdjTU5Db0dMWUtUamtkRWRUeEZWWXczNW5jUVo2dlh0?=
 =?utf-8?B?djBwZy9oNDZ2UWhUSmxybDBUMTRCZ3I5OGpHU29TaXlXR1V3eE1lRTFPY1hz?=
 =?utf-8?B?QVAvQzZodnZQbEk2OFY2OXhQYmdHSXZFcFpqd05ucS9iaGltb0J5K2pzWmFw?=
 =?utf-8?B?MHltdGNiRzRDRnJOcjR5aEVqNHM3VHd6Q3RZd3dnc3lJN3FMczRIVThFaXFR?=
 =?utf-8?B?S1FOTnB1K3hyeEY2dzZBbG94bm05d0s4YnFZQWV2UXdSUEFCNFlsbmM3c0w2?=
 =?utf-8?B?V1kyemRTSlo0VUtJNHFBNEpFZmFIL0M1ZG43TkRWZ3FrRmRBMDBBU0ZVTU5x?=
 =?utf-8?B?T0t0b3RURk9Lb21QU2xRcW84VjBhUUkzRlp0VHNsY0JSKy9mSXEydml0WUl2?=
 =?utf-8?B?QkVqTEFWTzEwMDBYVzdSQ0JzWGhrQnl2R2szYmlkTDc1MVlQaXRna2RDRXFp?=
 =?utf-8?B?N1hWTFZlc01WVHR0NzRGTlFZVmFMNFMyME9WWHpmTHZHQ0ZhcHlPalFHVHhj?=
 =?utf-8?B?T2NmVXkrQmRnUkxXQkFLakhsdE16SnZCY0lQYnFLYlZxVlA5SHg4bWMyNGtM?=
 =?utf-8?B?SmtBQkxRMTVJcCtKczdiR2t6ZWpOTDJ5Uy9udm5UcUhwMkZoNDE2MzZmWXpZ?=
 =?utf-8?B?RXhnbHJjWFpKdThDQWxZTXl3bWZlTnZnTWJ1eWs1cTFxeUxGWVNrMmx4Y1ha?=
 =?utf-8?B?VlFTMjNJaXlOdTdXajhyT2diZ0tyazVaNWI1bEJkS1dJeDFHOHVYZkpnVVFv?=
 =?utf-8?B?UmtZNTBLUlIxb25DWExVOEVSaGVDbWUwcVR6SVlRL1BOZFNXeGxaQnRUQWNH?=
 =?utf-8?B?Y0NUWGJiSncwVng0Zm90dVVqcFNiQk9nQVh2YzMvOVluaVVmdEhkclRkZHVK?=
 =?utf-8?B?Z0Fmd1ZQZTF6U04rQ1VmNVZvQXFieFJiZEIwWC9uUFJXWUxyQXV1ZUowRmVx?=
 =?utf-8?B?blpEeGhoU2hSWnVHY1gxZXA3dTFqaWtWRmozSDZkMUhBZWQwbmdYUVVXV3Z2?=
 =?utf-8?B?eXNrOEJ2V2MvUUZ6QUozR3hlckFHVGdyb1UrQXp1dzRmRW5HVkJnTWFQMUZQ?=
 =?utf-8?B?VFJ6bkl0cHhBc1lzeW5NTnlHcEFJb2diclFEdFZlNFJpdWR0L3MxbnNScDB0?=
 =?utf-8?B?STVBUktHMHRLb0RPbTNPeVRmV21yelBiUDB3cTJnR2dmOGI5dWZPcmFod2c5?=
 =?utf-8?B?bkdKa3dqTUlFaitzRHFsaG5tSFYrWElhL2NxRUFDUzRjM0tIcGpsczJDWnRT?=
 =?utf-8?B?LzVuVXRlUnJtR0dhN0RyUmVCc29tOVhQbkxoM0tySnd2ajJXWXZlTkJhbS9S?=
 =?utf-8?B?NE1zN3JZREJJSXJ0QjVibWNDbWY3a2pwSTBkNU13WG1HckdkMmRpMGxWV05y?=
 =?utf-8?B?S2JKWjArUXpsLytqeUZrdVRBMHVSa2RQYzhDbE1ZWjhZWnJZU2k3QVV4TWxR?=
 =?utf-8?B?NGZUUE5xWXBKTGpVNmFCMlFEN1k5VVdNcEZPaHAyT2hDZWsxSXlwOGFoK3dN?=
 =?utf-8?B?MThSSk1nY09MSHBNN0VyMnRPTnZkZmw1UGlLTytCMXJRVW1sN2x3MStSZ1F4?=
 =?utf-8?B?blFsVXdIOTA0WjRIT1pNY01aUks2UFB1WWY2cFpzSlpqdWJsY3k1WnMrVTlQ?=
 =?utf-8?B?aG1GaDk4Wlova3hieWR6TmUxOUhLWWRPM2M1VzVjS1VlVzArNnJ3NWllMkE2?=
 =?utf-8?B?QTAva2UwSjdUMmFkbjVuR2s5bDV4aTU3ejVYQUJ3eFdoZHkwSXllK1lrUVk1?=
 =?utf-8?B?eVJtZUZmekEyK2JzMFdPWUgwMmpZSnpBNFFxeTY4RkNGVEpQYUpCbHg3QjFa?=
 =?utf-8?B?b29IUVZFR1lUMFR6THlzYWVEV0hRQjVzTFVzdE4vaWhKUVdXZ0orRy9HVnJ1?=
 =?utf-8?B?bFVraHFtSkp0R2tTb2FVcU9VRHVEbWhDVUx0TStkejc1ejhDVkh5YllOZmN1?=
 =?utf-8?B?YnQvUVYyNTRTRklWSG9vY0VNeGhJWTRvNEMzeDlOUEhJOTVxS0lhdVJCdmE3?=
 =?utf-8?B?RE5CYjdNZzhHblZKL0cvbUhDOHV4cTlEdDMyYU9MUUF2N1JFZXVxWlkwZDcz?=
 =?utf-8?Q?yTdXxEfi9w9hanXAzXPlMJbym?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54E672467DF0EA4D92740944E6068A1F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ublV/7e11c8Hs0UqIR96GphZrFTdNEN0lRIcqEWRfvf1KIft1oaUHXh92fhxaW8VHSjXX3CogJTLu5z0l32X1PEdcLhAkCEGW3VfFCPMuW5LvstoIBxs45nkAUqPRrs4RdVBVipUx4DJ8ugzEcI3pA47icusdz9s2SjqHwVD0LRqxl1butp7p02Ip8H5hZygujxLjCLSFQ0bWK0KHEEXT0Sq0g2yTec4LyQuV7dIfTHrQwO/qtxZkJZ+i0BieJ93m9xS1maxaPuLHsNA/WPs/o8TxX7Esip7/ZrHBGOEiT0fbMr+02xdIR1G0ADVQv2mwISsxb6+90XooDSs6/gPwaO0VPxQV4rgr+GKy04KmM/tg4Nt83NseEJsHP56PlTTJm5CVE1hCx4m1rmowL5sYEar/9qaOUu1NGv9fz/5d5d8nO3vHem2EKK8faSASN3ISvYC5x6T2Jdhf/AUdDKsP78nPuUEfnBEFMBkSQoRkQ9AqlzT4SdoZjql/DeziL9McYYUI94rS9Awah41jJ+1NJOdB71JRrA3zMLaciHrwUAa0sUJZo1EuloVngP3uy9qsX3f45ETu+MdhEZvl3IEyurki4gwjLBLUqkWw43ZANN6p+Fc3jWbNNJ7Ke9Fb/dKw0yiMw9WaDDZ/sGajJbPQg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9c2ea2-9504-4719-2d31-08dc290128a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 23:53:33.3197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKL8HlTdq5Df4A1qaRsmThruwcOwGkDxi4nwf0aGaPTLHt5yI7rtRiZlDA0GsZcE/ZNDftk3kj0Uy1Y6RpjqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
X-Proofpoint-ORIG-GUID: csDLGV63B-GtWFQdNqk0DbooL8_uGlGK
X-Proofpoint-GUID: csDLGV63B-GtWFQdNqk0DbooL8_uGlGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_12,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=509 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080136

T24gVHVlLCBGZWIgMDYsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiA+PiBb
Li4uXQ0KPiA+IERpZCB5b3Ugc3RpbGwgc2VlIHRoaXMgcHJpbnQgaW4gUzM/DQo+ID4gDQo+ID4g
CXhoY2ktaGNkIHhoY2ktaGNkLjIuYXV0bzogeGhjaV9wbGF0X3N1c3BlbmQ6IGRldmljZV9tYXlf
d2FrZXVwOiAwDQo+ID4gDQo+ID4gT3Igd2FzIGl0IHRoaXM6DQo+ID4gDQo+ID4gCXhoY2ktaGNk
IHhoY2ktaGNkLjIuYXV0bzogeGhjaV9wbGF0X3N1c3BlbmQ6IGRldmljZV9tYXlfd2FrZXVwOiAx
DQo+ID4gDQo+IA0KPiBJdCBhbHdheXMgc2hvd3MgImRldmljZV9tYXlfd2FrZXVwOiAwIi4NCj4g
Q2hlZXJzLA0KPiANCg0KVGhhbmtzLiBJIGhhdmUgc29tZSBzdXNwaWNpb25zIG9mIHdoYXQgaGFw
cGVuZWQuIEknbGwgY3JlYXRlIGEgcGF0Y2gsDQpidXQgSSdsbCBuZWVkIHNvbWUgdGltZS4NCg0K
VGhhbmtzLA0KVGhpbmg=

