Return-Path: <linux-usb+bounces-9682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D38AFDBF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 03:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBB31C219A2
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C85610C;
	Wed, 24 Apr 2024 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N5th5BGU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LXeL3Yk7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ovEl81iP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111291171C
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 01:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713921673; cv=fail; b=CmDD1ahnhm2Xi0yHHe6FZ/LGfz4x0GliXFjF2zfDp4Tz3EYJiofweAtHaCIKb+GlaNBOJp77HqZ+M8ugHpyu1CetFpzqN/9rJOq4Mjjh9SD1M8HhfUYa6bluFtFr8Y48mUSab3sfhMG9TTnkJEfWTikIkYHOvlcf/UBDkV3x9Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713921673; c=relaxed/simple;
	bh=GMh5tHz9C5zzFYhXJEoDi3CAXaRJ+1/oq6zeUfsGq8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Za1bIYEs/OK4idhdt/24pX8iXEY6yawH+vRocI6lhy5xMcxcYHTvs0GhMlg6QDdBULi5fT1NEnKL0CQ4IijeBu+j0NC/9KLY46DemKgReGHt12vn3VNVOTTqAwL0B6OF8cJ7os86TqSjFRHMz72/aQjNDpaDUNfBBF15G7boG7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=N5th5BGU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LXeL3Yk7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ovEl81iP reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O0mXFx009646;
	Tue, 23 Apr 2024 18:21:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=GMh5tHz9C5zzFYhXJEoDi3CAXaRJ+1/oq6zeUfsGq8k=; b=
	N5th5BGUPVT3i/00qJIzs5XjvJOr2rPwcnX1ckzBVuiO5DOx6k2xN7Z3qDQrXBtq
	UKESMnxSt8CmEtjSRq16fXVLPUcBCWA8127KPthaHxeXxrNYsP8zXrNSeVN53oXa
	aS2AFQzjcB9w7682PPaUnCTrwq4srvzrgyY26SH8uGz1Muvl3Q3qZ5Rqn2Ewf7Gj
	PJjSMwogA0Jn973Ih6PNHYwl/s3x2ourDvgR1UgkwipAFNSLO2Ci6/+pew13MaQ2
	Pg9LHVuz+ogNTwxKYu7iwUPu8OY2tpv8Y7sg+grhE+X7bQtY9czsf5onC5wMGZ35
	7OmAeHho2uEX1/KxVcWSVA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xpf6x2drt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 18:21:09 -0700 (PDT)
Received: from m0098571.ppops.net (m0098571.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43O1L8sf025195;
	Tue, 23 Apr 2024 18:21:08 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xpf6x2drs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 18:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1713921668; bh=GMh5tHz9C5zzFYhXJEoDi3CAXaRJ+1/oq6zeUfsGq8k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LXeL3Yk7Ko0Pfn/NouCZN9DvkMbasCJbFLCA2hmu99VUwf+dIVuDfwP2pXP9piZdc
	 nyjegPDYj/0xJBPTx/iuKoLN47OrZWMDlKbxedeSw23NOFqFUoiFUTG6skLhXmwXLQ
	 rbNdr0v/3bIuvKRsXjMxm9gaJuPeDvx5qKhhFc9wFdU0uYwsR3q25/MWHEnVwhfjZo
	 tt3i2ST2GZJrKjyR7stKwZzUbCDIj31HVQh+FhGLATgrih0UdaH55PX/jNa3X7buFj
	 yfe/cHwUBjfcjkvQmbM2naY6TpViZfbQJPGo9JR7NYNMV0zWmuGKNi1M7bIa47ePEy
	 m/2m3I1Puee5w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F285C4048E;
	Wed, 24 Apr 2024 01:21:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 84661A0092;
	Wed, 24 Apr 2024 01:21:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ovEl81iP;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E773C404CF;
	Wed, 24 Apr 2024 01:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1Qu8RNOWJ3Tj0Er6ArWKFAbyczuOKITO/bl5SVByE8c6AlwbjLGBdcMqxvrGcpOIr/zoPcfYJsL3C5IByo7h4zh4AfclNT68COYri8mZeTu/NyGyUIIYmq4XmFdyVBsjq2sZohTxfGB6ERlaVvGknza2MdBLSdldM0jzKJldzXssmEan4SpN5H5TEiQXqqxzbWUSnfo4Ora41wIO99yn1UJFTl6WgDEtU9erdzgRRNo9IhCpeA7i1yAq11MJwFSUeVsrjfPHalxiDUT6atHHVlobcltoKShMZxc74GjjDLbCBFrjPAuXZCZFeCcp67Hdk22zhe5BElaZv09gLAy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMh5tHz9C5zzFYhXJEoDi3CAXaRJ+1/oq6zeUfsGq8k=;
 b=BTcKcaJzw2RgW1iTk9XPgvXI4LxM33EKxRnwBZ6kiEBXKijq46rY/Y74SQBbX95C4SQph7wyAQu6QtOIFzr4bQvepZCU/VEMeEG6xgPE0GKaV0UWXxY5Jnq4KW+GnHMDXA47GnMxBgSz9xYSAXVq2cEvXSWfj0IB7ukZO4CEb21BxogqqQ06uCa8UIai/XkcxQSWlYNnYC/NkIa8YWpeZ+2FTde52rVR9tw4tMZ1WGl4zVe9O16Hko6KULlJIhZRVDqdHfOsq1iNknOLbyRDlAvjXKuyOTTAaP1getGCr2xenbXBfMjfA6jCgG1LM+nZE7k91tXL4KVYbPALKogHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMh5tHz9C5zzFYhXJEoDi3CAXaRJ+1/oq6zeUfsGq8k=;
 b=ovEl81iPBzec+xB+muwVWxpYUeoQoCCoBFoWnJ+Zv2MC/bvOyoNF0YBCJ7tJDdTk4DvBJzTSlQ8wWuQuRxOqUjtyALsGLe2cx1igoPgayBTiuOS5Chj+PNrccnahuFaKdXPjuhEyv4c154pgWHDou5EbUSdo+7WVtdaI1BC+QGw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 01:21:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d%7]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 01:21:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Anand Moon <linux.amoon@gmail.com>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Johan Hovold <johan@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 0/5] Use new helper function for clock and PM macro
Thread-Topic: [PATCH v4 0/5] Use new helper function for clock and PM macro
Thread-Index: AQHak/KMBQotjIPShkqgWJKizuNE07F2o28A
Date: Wed, 24 Apr 2024 01:21:03 +0000
Message-ID: <20240424012100.srm7zjy26in4w4c5@synopsys.com>
References: <20240421134752.2652-1-linux.amoon@gmail.com>
In-Reply-To: <20240421134752.2652-1-linux.amoon@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB7226:EE_
x-ms-office365-filtering-correlation-id: 0dc759c6-0f85-4fdb-9037-08dc63fccecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?THU1RXR6bnlBOVJvQ29qSUNmTFdYMDNnenZaOEFJTzA5cjZPMWwxR2JlTWM3?=
 =?utf-8?B?UEMySjc1aFZ0enR6S3BOQWxUeUdXdnR3MjlMbnZMMUgvWmozVkppYnMyVnAv?=
 =?utf-8?B?a28vcU1XajROSHlFNkJNNlZlaGlJSXJURk5CT0FubldQQzdQKzRyNTJJVTVs?=
 =?utf-8?B?VHpsRDhVSXYwV1lDTFNEdFdqT1dkUUtsWGMvZ2dkLy8zOVFZa1BHT2pqU24y?=
 =?utf-8?B?RUJHVit1YWtTT0J1YWVFSHJodTRTVUxEQTF3ZzlJbkYrOXBjcnlpWWVRaVpu?=
 =?utf-8?B?dnowVGxkZ3hRWkFwQkhvNUtsalhrUUc0cml2YkJIR0F2NlFjaFNkaGlWUjJi?=
 =?utf-8?B?N3BhdU5XNk9mSm9Ka1FUWGgzSTNVN3ZvMldyNjk4WWRrdTVSRVZXNlZ0cWVK?=
 =?utf-8?B?YzRqZG5SUlg1a3FSQU9UYW9VZ3hHNGRQZmllZXVFdWh5Qjljd0tGbWRDRVo1?=
 =?utf-8?B?RDhqYmV2aTRGdzF0SkZsUWV1cXlweEk3ODF0UjFpQU5sMFR4aW1YcUtweWtZ?=
 =?utf-8?B?U2h4YXA1emlkcXpFbzQzMlVLR0lwV1RRdmNnVDZic1FWS2d4SXNIY2tERjl2?=
 =?utf-8?B?YU00S3Rhb0M5ZGJuZm9zMEN3b3I5UUIyY2xmZWQvQlZ3RDd2UGZNSU1JQTZQ?=
 =?utf-8?B?T1Y4ZzhnVXhCN0FuSGg4QnlQUW41RDFyZnYwbjlpd01obVVPMXlDd0QyOU5z?=
 =?utf-8?B?ZEZxeFlnTXAzWTBxcm53UEJRZGREYkd1V0dZd210RTBrOFlsb0h1V0dNVXpI?=
 =?utf-8?B?L0tsSUtOR3JOMVR4cFgzc2tjSnZKUFpDZzlPdFdqcUQ2dlJENVlEQ2VUVmdx?=
 =?utf-8?B?Y00vWkVhZ3JSbFJNMVZHTXJtcU1Ta1k3bUdjRHpjdXpMcC9lWVhXc3h4YjdU?=
 =?utf-8?B?Y21ORW5VdzFFZDlZY1hvdHZvc0hHdXE5SGp0TXV6Q0Y2c2FKNEZPbnVtQmdQ?=
 =?utf-8?B?Q3R6WlM1aldKM2t0ZHJLdTYxQXFqMVpqVGJReVN2WFI0SnBoSUdyaEt6NFZy?=
 =?utf-8?B?SVYrYUczOEVGNHlFcERKdVc3bUx3WUt2ckdsckRSelhUTlVMdldSVXlMVTdJ?=
 =?utf-8?B?OEtZcGZmZTVqak1LUUlCeUU1Z3JZemxoUG1ldjRFdkxVMmF5azdId2FUb2NF?=
 =?utf-8?B?T2lmZHRBYkhJZmF3bTFoS2ZWYVk0SDR2T3d0MURQd1k5ZWZwM3piY1VaMmE1?=
 =?utf-8?B?VUtPc3BqOXdsbzRnTk9xRlI2MjNrQkZtUktFOTdkY2V0WkxZOEY2Y25yU3VO?=
 =?utf-8?B?WXI3aTJpc0FLb2E4RXNrUUE2ZFNjVzRUQm1obzVGMW54OEwrM2tmMzVLVDdz?=
 =?utf-8?B?ejFUUkJqenp1alFWY0Z0Ujd0cS9abmRYbGtGdnltMTFnY3BIV0o3azR0Q0Fp?=
 =?utf-8?B?VEowVFNXTnpOZko3NEFrSGFrNUlRMmEydEJNbTFDcnVEdE85aHFsN1FRMTlX?=
 =?utf-8?B?ZFZrbUV1djhBODIxUldsWThqbW5VVzFETXBmUlBzRXdDd1d0L01PR3JMTDdK?=
 =?utf-8?B?cW1UWFAvVmFrM3RYMnRYTXFEZkY0bW9SdTB5dW5DNGd3andlVVM4UHZyNnlz?=
 =?utf-8?B?RzI1ZWlJMjZhbExWeElqVC9nWk0zeGt2V3ZDT1VVc2p3VTlSckNoRDN5Nk94?=
 =?utf-8?B?YUNvT2IrN1pleTViNmpDYUlodGZoTnVvbGF0aS92QzNabTRVSTlZVUdnYkJD?=
 =?utf-8?B?VXJYRzBQNTlNM1JiRDQ5UDg5c3FMSFRJUmovcDAyRmVMZEtTcDhiZG5nPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SDlOUEtaQkZScFg1VGIwc2VZNU1tbHRBMFk4bXNkSnJISC91RDRQU2RERHEz?=
 =?utf-8?B?ckhjNGtEcWhJNnFuTnZNZjl4L3dUY2ZZMEVhNmNBVDA1SkQ3N084U0x2OXZI?=
 =?utf-8?B?WXM2aUl6enhYd2l6Mm5DeHREU0ZlNEdSQUhkYmFvNmVtTXIvR0NuY0RlTmhm?=
 =?utf-8?B?emFJN2JlcHdMdHByNlVvQktxK0pmVlI1a1ZlWFBrV2Z1cndxZjdNRGkwNUxQ?=
 =?utf-8?B?TVZ0YUF1aW1Jc0E0RWlzYTJyQ29qVlAwSXJ3MVlLcm9tVTFWd0NIZXkwSnRh?=
 =?utf-8?B?RmxNdVZKQm5VUExWN3RVNjFtY3Axd09kK08vWFl1Nmg3djcxRk9JS2hrYWta?=
 =?utf-8?B?WGhvaUYrZkNlTytkQzREUkwwVEZudUo0OFhzSVdQSWU0dFRNUUpTYy84MUhw?=
 =?utf-8?B?ZGpNSFFhOUkvdzdISzVvTDA0YjV3UlhxeGdMQS90VDVoYTJPbmtnZFBWK2Zt?=
 =?utf-8?B?dWVoOUE0MUdoUjFCZnJZTXpUT1NBY3dESitTV2dSUWRoMDFpbGNvem1Rcy9Y?=
 =?utf-8?B?ajdWMjREeDEyWE5Zem82UklkVEpFYWRZWE03bkx0U2l1alFSQ3dwbTBKUHA5?=
 =?utf-8?B?RmQ1YUFTc1FjQloweGRwZWJ3UC9PdGlvd29VZGJ0NkJtUmMrR1JBbUVKdDJP?=
 =?utf-8?B?SFcraVMyeHpEcFBjVmxOMWhSTFBhajdERXhudkxrOVYxNEhhdmFMUEd1Rks3?=
 =?utf-8?B?WGhlbVI2bmNCUnJJMnJ3eFRsVlZmU1RacVJ4cWk3ZkUwVWQ2SllWeWp0WVU0?=
 =?utf-8?B?cGNsYVlqc0xSUWI1MElsUFBoa2NycW8yUlc5TUxKaHdUejFIRC9LSEJvZTRL?=
 =?utf-8?B?dkJ6NEhuQkNkUzJ3NXJ0UUVqYXhBc2JzT2dGM0lpYS9xSkZyRHRWM0w3cmQv?=
 =?utf-8?B?TXY0Q0I2bktBZGpwVGxoSVkwMHJPNVlLelJXSnBnOFVjQ3o3Yi9SWFRSOXc1?=
 =?utf-8?B?TUtCZlo2NE9QbjRMUy9seEdMTWNUTG5ZckNqYUNFUzFzWWpEWmNjblRMRmZD?=
 =?utf-8?B?NktUQUpKRjd6QmVOeHNvejRKZ0xKanFrUmVIK0F6YXRHbXJFSU1nRk96MEQ3?=
 =?utf-8?B?c2FqaksycWdXSHZmMTB0R2h4WjFDdnVMQmtvZlJ5dVU3RkZhTjllcDNuYUhJ?=
 =?utf-8?B?UHp4c21iQUlGTTlydkxmWDM4bG8yeDlIUjdaTlZTMnNKWDlPbHVxRDE3dlJD?=
 =?utf-8?B?dDBXZTQ4aUNMak85U0tPaHd5K3ZFejUxbXJZdlhCZXNwYU52YVlOSTJGdFky?=
 =?utf-8?B?UG94M20xN2RSVnZZV3JMNmlpd0ZNRkg0Ym5SVXZFSndCS3c0LzlpNDdtbmNa?=
 =?utf-8?B?RUszT3dFdjZjbW5tWHNCa3lwb2tQbkRJbG9mY1lZZDRIcFBnUzgrZkVadEg1?=
 =?utf-8?B?T3dNK2VhazJuZE5EY1gzY0VmczQzNWx4UUpjRWU2WmJMRml2T1BUUjZxZ0JU?=
 =?utf-8?B?ZnhsZGk2K0ZIdEJqdnN1ek80ajlmWWYrSVl6YmtkM1lWOE0yU240c2t2dVdT?=
 =?utf-8?B?RmtZTlBwREFTV1lxUHBrc09uQWgwWnpYNWEzbkJqd0dVcXNUWU9yL2dtSS9U?=
 =?utf-8?B?NzdvSzB5UkpqNXlrVVlzck5JUFFFeTVDWHkzUS9GMGJXc1JzSUk0WkZBUThw?=
 =?utf-8?B?Vnh3REcvWWRLK0hxNnNUWkhVY1l4RUd0ZXNZYVFEL3JKNGxqK3N6YlN1dUQw?=
 =?utf-8?B?eGx3SWpnekdtYkt0UzlXYmVWS0ZyeHlMcVZsNGpDUDZKZGVUVzRobGp5Yndz?=
 =?utf-8?B?cFNpZ1VtKzNWUHpvOGxJU2RadFY1YWMxRXIya1FTN3Bacnl0THpRMnNSU0dE?=
 =?utf-8?B?Q21YTUUzVlErN2JhQTFSUGpUK0JxNUdRL0xYYjJhTzZMa1ZHLytGSlk0anA3?=
 =?utf-8?B?ck82U0F6MEkzTjlJSDM0a1FpazQ2MEQzeC9GZnhXc240OFg3RjRhc1JoalRJ?=
 =?utf-8?B?RU1CSmJWeXU4WTZ3VE1UajNBYWwxS3pSZUxjREJKUXZ1WEJCMG1zdHVPbnBS?=
 =?utf-8?B?NzNwalA5cjBkc29MRW5SUW1xOTFYdVZXWFZQNEVlN2VPVzJMbTJqejFUbU1w?=
 =?utf-8?B?L2pJSXFuUEZrYVRmWmlEaDlyV3lFSzNrN1VVUFVvNWRpZE9aOWp2SmxmdGIz?=
 =?utf-8?B?bW9vQUNvSnpSYnN6QUdLbHJNSWc3am1CSFBDZGxMM1BnSk8wLzBObVkydWo0?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FCD66789276304D9836306C9BE997D6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YtPzHdFbrGu4zuPyKU2aGUYFAhOOH0WqJkLyypIPkrsNBqKReVtFEMlISLILLPaKZ+yVYvI6uPCRA7iH6Bm/yAE8BNXSfwVtcIwjemTwWRizK9A0gC3uG4AwjYLTrw5GVvbsRaAXdStnXXKjzhuz7WIRIVxU5+9d6VMVggv+UZBZ5DXHBO3GaIB4qo3MI1d3+0Sdw9WEUQy2q96BW5sYg91G2qn7L4EZ0YyX+ciue9Jm/fqIRZrkunpvqNdMjzzKTjHLNBUCiTYkJOzpoUUJ/2PLvCS9QMrhm4S97p+HlgqVJgJv/O00PCOdVaOtGpfGz0rpN8LL/QvQMPk1w7wr18+Idg4txZeKF0/4WIJYrNWOhrzfocsvR9gPqyAfzwoJPbgeZsXrLliW4c12rk+ZwgUcrJ6n2I4hd2Z9rSS8UiMOB1QXwDb1qRpb7GGE8Si1GLmqQasRkEVrKXDqS9I+TnrzkRAdq0o2Rf7/UTeF5ZUq7NpRo5ni2n3PK3S4jhYAB+MT/wH0+815oM+yImYGRpPbNaFVRcThKEdL9piynSztidcmXn79vngMVH9TqIlZQQwN9Un+w7CTYoYs+pR47KBuLLVz0WjB0x9b2mTwW3ZXssH9j7tLG3cLN+HJx6ALJv7g478oHI0O9fjPme7iOQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc759c6-0f85-4fdb-9037-08dc63fccecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 01:21:03.2003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfPna5Yq+efSsCXsJD9e6mU0fWFJxXpGfBHCF+ah/xwuyLLxLJ8+t8hLIFPbGinK27Mw2XVwQhfpnE/NpJZNDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7226
X-Proofpoint-ORIG-GUID: kReah-2TV821ZtpPKeQoPBVyX4BEAVzv
X-Proofpoint-GUID: wW0-RitROv2HvvNE2j3Mrxyhx3CCO6n-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_20,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240005

T24gU3VuLCBBcHIgMjEsIDIwMjQsIEFuYW5kIE1vb24gd3JvdGU6DQo+IHVzaW5nIG5ldyBoZWxw
ZXIgZnVuY3Rpb25zIGZvciBkZXYgcmVzb3VyY2VzIGZvciBjbG9jayBhbmQgUE0NCj4gdG8gc2lt
cGxpZnkgdGhlIGNvZGUgY2hhbmdlcy4NCj4gDQo+IEFkZHJlc3NlZCBzb21lIHJldmlldyBjb21t
ZW50cy4NCj4gDQo+IHY0OiBBZGQgUmV2aWV3ZWQtYnk6ICBBbGFuIFN0ZXJuICBGb3IgcGF0Y2hl
cyAxIC0gNDoNCj4gICAgIEFkZCBBY2tlZC1ieTogVGhpbmggTmd1eWVuIEZvciBwYXRjaCA1DQo+
ICAgICBGaXggcmVwaGFzZSBjb21taXQgbWVzc2FlZyBmb3IgcGF0Y2ggMiBhbmQgNA0KPiAgICAg
Rml4IHNvbWUgdHlwbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2VlDQo+IA0KPiB2MyBjaGFuZ2VzOg0K
PiAxIFVzZSAgbmV3IERFRklORV9TSU1QTEVfREVWX1BNX09QUyBtYWNybyBmb3IgUE0gb3BlcmF0
aW9ucw0KPiAgIFRoYW5rcyB0byBUaGluaCBOZ3V5ZW4gZm9yIHlvdXIgaW5wdXRzLg0KPiAgIHNv
IEkgaGF2ZSB0byB1cGRhdGUgdGhlICRzdWJqZWN0IGFuZCBjb21taXQgbWVzc2FnZWUgd2l0aCB1
c2luZyBuZXcNCj4gICBtYWNyby4NCj4gDQo+IDIgRHJvcCB0aGUgZGV2X2Vycl9wcm9iZSBpbiBy
ZXR1cm4gdG8gc2ltcGxpZnkgdGhlIGVycm9yIGZvciBjbG9ja3MuDQo+IA0KPiAzIERvcCB0aGUg
ZGV2bV9yZWd1bGF0b3JfYnVsa19nZXRfZW5hYmxlIHBhdGNoLg0KPiANCj4gVGVzdHMgb24gT2Ry
b2lkIFhVNCBhbmQgT2Ryb2lkIFUzLg0KPiBmb3VuZCBubyByZWdyZXNzaW9uIHdpdGggc3VzcGVu
ZCByZXN1bWUgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IFByZXZpb3VzIGNoYW5nZXM6DQo+IFYzOiBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjQwNDEyMTQyMzE3LjUxOTEtNi1saW51eC5hbW9vbkBnbWFpbC5jb20vX187ISFBNEYyUjlHX3Bn
IWIyRUJ6Vi1VVGZ1dndTbXNlLThrbDRqc3E4dDRLZ0JQVF9HLS1RQ0dfVERWNGF0Y3l3VlFnTEhQ
RkdteEduUEFTT0tPbXA2cjB4eUkyRG5VblJwX2N1cjZFdyQgDQo+IA0KPiBWMjogaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQwNDA3
MTM1MC40MjQyLTMtbGludXguYW1vb25AZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFiMkVCelYt
VVRmdXZ3U21zZS04a2w0anNxOHQ0S2dCUFRfRy0tUUNHX1REVjRhdGN5d1ZRZ0xIUEZHbXhHblBB
U09LT21wNnIweHlJMkRuVW5ScW9JbDd1RUEkIA0KPiANCj4gVjE6IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtc2Ft
c3VuZy1zb2MvcGF0Y2gvMjAyNDAzMDExOTM4MzEuMzM0Ni0yLWxpbnV4LmFtb29uQGdtYWlsLmNv
bS9fXzshIUE0RjJSOUdfcGchYjJFQnpWLVVUZnV2d1Ntc2UtOGtsNGpzcTh0NEtnQlBUX0ctLVFD
R19URFY0YXRjeXdWUWdMSFBGR214R25QQVNPS09tcDZyMHh5STJEblVuUnBKS00wUjJnJCANCj4g
DQo+IFRoYW5rcw0KPiAtQW5hbmQNCj4gDQo+IEFuYW5kIE1vb24gKDUpOg0KPiAgIHVzYjogZWhj
aS1leHlub3M6IFVzZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGhlbHBlcnMNCj4gICB1c2I6IGVo
Y2ktZXh5bm9zOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMN
Cj4gICB1c2I6IG9oY2ktZXh5bm9zOiBVc2UgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBoZWxwZXJz
DQo+ICAgdXNiOiBvaGNpLWV4eW5vczogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3Ig
UE0gZnVuY3Rpb25zDQo+ICAgdXNiOiBkd2MzOiBleHlub3M6IFVzZSBERUZJTkVfU0lNUExFX0RF
Vl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucw0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1l
eHlub3MuYyB8IDEzICsrKy0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1leHlu
b3MuYyB8IDI3ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvaG9z
dC9vaGNpLWV4eW5vcy5jIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0g
DQo+IDIuNDQuMA0KPiANCg0KVGhlIHYzIG9mIHRoaXMgc2VyaWVzIGlzIGFscmVhZHkgcHVsbGVk
IGJ5IEdyZWcuIENoYW5nZXMgZm9yIHY0IGFyZSBub3QNCmltcG9ydGFudC4gV2UgY2FuIGlnbm9y
ZSB2NC4NCg0KVGhhbmtzLA0KVGhpbmg=

