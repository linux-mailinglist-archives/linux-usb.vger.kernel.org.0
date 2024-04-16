Return-Path: <linux-usb+bounces-9411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9A8A77CC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 00:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15DB51F23CDA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 22:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190D42943C;
	Tue, 16 Apr 2024 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sGXgBFM0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ni2N1f5r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rfhHkFz6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C71EB5B
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713306701; cv=fail; b=i+XSvGXTb5iEz+L6pcBiAmCMGH8iCr4S3LCPXiXoCK5vHl/6LY/ZdFlGJNMVvYhROzB0isE56f/BKVqbFQFyoY5vbvSPWPKj7WCXkeAtUl9JcLkket20yU15yDhQ8utH97zYSw7m4gZ8vQlO2OrlbQjnuJ6E7q5/y5zsP9Iqrm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713306701; c=relaxed/simple;
	bh=PqmSe6cV4BmJyStgXasKCcNVLJ88B/O3x/GwA21HkN0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pMgip5PK0P1LUVsfIZF5hN7BmHZz/j5QlWiPjhlNIvvyMMoDvrsmlIzuOuypRx/Fe5MFYuOWDh4OOTSIE8xuSSXv/4qkSWnwd+JTkLWD7K5SKiXS6kc29E6RLl9+0VloReM/D/itaac9iSN5cG9onm93eNbTpX5QClwTSextCzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sGXgBFM0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ni2N1f5r; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rfhHkFz6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GHbXeU013641;
	Tue, 16 Apr 2024 15:31:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=PqmSe6cV4BmJyStgXasKCcNVLJ88B/O3x/GwA21HkN0=; b=
	sGXgBFM0dI07V7qC9DT8A6Bokc1xwCsevxEIJ0FI48hR+7kk1tUB6T0S05LP0OpN
	7WipaELt3nnIznJ7YwUaJ8xHGf5VDY/UF7t9aIXMBZIqPgJRtuV7jj/5cjcRWLEZ
	9B7HD3+z5pRVb2BPykk5N726wo+ERY2H2E4IBoU6A9S3AP+AadBZnr/LT6OlpEO6
	o1JEYOL2wzRJJ4YtCqxy8X7MKBO2Hlwd7sLVz44oMWkiSPaE0BjgFUAigV2WcGns
	OZXscZFZYHvlCOb3+weD+RIc1Zrxx/gUtXBDWRFeyG8dvzXjZPi4f7WxaTKdrcR5
	TXs6kaOFfx0ZtBPS3oWVvg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xhrretj5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1713306690; bh=PqmSe6cV4BmJyStgXasKCcNVLJ88B/O3x/GwA21HkN0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ni2N1f5rKzGxHVy1xHtTmOzp2RUJdpCK66Y0Lk1Sy7yT4RLupOTi54pI1jENWZlNd
	 g7ORObcNvoE+HW9o1kGBSmIRySoiQCL77LP3RODsidY/QJ802nfpT9X23qVeFPnBav
	 e4AmmPk5a+0ll0k4++A7e6KvBQtlvkeNjVa4bnBBwJw6h6RZsKw3Vrmn3jw5vYOJN0
	 E4HmByHSlqvotUxOYefIElNIa/PDn/QppYSOjZBM7tgi9bqTHhmWzNHmk95wJ8lIot
	 YILce3Kyiub2tUOmhjmCu4aV7A2wZxEp/k2G2XD0LgYBYRK1QiSFM+XRVC0UQM6mfL
	 CNx+pd+ONBhnw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C5FF4054B;
	Tue, 16 Apr 2024 22:31:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 52BADA005C;
	Tue, 16 Apr 2024 22:31:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=rfhHkFz6;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9A0B1404D0;
	Tue, 16 Apr 2024 22:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG+BCCDUuJ4Y+Pto7g8YOaFyBjyobtKYFFvpdrdu/oM8+Qx2acwnhQ2g748MCVFc0vjwkIwJuKidOBIlPuEn9bIU9V1MWCyNUC85YoRlKjMQ+eGOVeNwAxbHX1MfzD81uwVMCQ+ChZ6esDMJ2CuO1uFvIvmwFlFTLSaN/VQL0VVgIWMlXZcVjzDRXb37QkAj4FOTJGbpbrn5xY/ClfXBo5wxzKH5npIORUc+Z0wVOqW/qPRg+xtqE+Gc6P0V2FJ4QUVRp3/YK+SbwvtDOJaVjnD8IWLxxMhkFKYWoUqbJG5ANAXImbHsFFFpZAufEigFrVawk/c1YD6MvEwvWIkDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqmSe6cV4BmJyStgXasKCcNVLJ88B/O3x/GwA21HkN0=;
 b=dw388iTaLMfUGtXcdjALoLzeLTkWdBduVOGNvc60lEmjK2l3HUaLKIgEd2ztCzU/BJfBXjT1u0VVM6dlK3vFP67ilATGMc1/AAoKQVwqyeQQQFAjuRB2sTg7QsStx4CSB0He3micdqGUf07bCurdLysVIVP7Gl8p8kctuR6lvBPSBDajRn7YdxZqDkNU4GCH5eAB+JPg2WCqWOt2F2rNBiwEMdUF3+jnv0yO1NqI2krCoVj80xzNmuWOtco6sHU9PMsbbsp24AlCzfBTcLXAii75UEwtBDy0IvGy9dCd75gORodrUQTtJo/8S5FqK+lA0RGucbPvxRNWTKETGN7nQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqmSe6cV4BmJyStgXasKCcNVLJ88B/O3x/GwA21HkN0=;
 b=rfhHkFz6xt3Rx1VP0QDBiebSj2Fj4L9YlRcQrGa3LBz1tHy2aMi1VVl2THmly+A1CHkd/pM7efMAgtRuYYhDCNGksVGxvGqy7/gcmwRGis7zu3YWzE+zDyylHhgCtzATUG5Dtu6vh7BO230H/N7nqpIZB1zotU8zNmONWnzDqBA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 22:31:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 22:31:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Grossman, Jake" <Jacob.Grossman@drs.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Krebs, Charles" <Charles.Krebs@drs.com>,
        "Hardee, Hayden M" <Hayden.Hardee@drs.com>
Subject: Re: usb: dwc3: gadget performance insight
Thread-Topic: usb: dwc3: gadget performance insight
Thread-Index: AQHakAlEOXyT1lcifUm2l6SVwC7O4rFre3uA
Date: Tue, 16 Apr 2024 22:31:19 +0000
Message-ID: <20240416223109.ckmljamgjc53sbpr@synopsys.com>
References: 
 <PH1P110MB1489614D2BD4B34E66B9A3208334A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB7748:EE_
x-ms-office365-filtering-correlation-id: 2e78f729-3e5e-4c95-60ba-08dc5e64f010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4A6dcd7tWtDRKy3rhhyIINl2mpjUb57YZFBhQCuwXaEXUoH5+o+b7w5D4uXsGgaOrxzznJ2xQR+TXkHIiX3deDSzhXB5MTvMIOmptLNBUOmqUe91L3hN+AI7frfYPISTeyjtKQ3kM64z4rB85A5JHiIqbs572aG3sKl1jD6nMCQ8+7TJ1irekSZCS5jhi4PDPMA3+vjLQOeqqt20eW0+A/UIs01WbHZIBlgQ+vfP+jFL3J3CrmpNVVJ/vNcN0ey0oaDKjKmrinPTKV01EsfvWEOq3OoiPbfJHP10fPovdj0HRjB8uU+ITM6em8E045ZWorz8mPzEKrz4/SN6V3SO3gtIRElYP+tT1MAa+RPwWlBMZvdkc/W/1Q4gcBqyFfgwME8f+Qctjn5I3/VzA2UiwtqWi3q8QueO+bi6FqMV66RVEk5vPz6+2kPrpFqxsn+vZvPGcFJcfHe0LpkJY8MgcElfc+0wgmrHG2+96vp9bhw6hyTjxAhNTwcOZVcXYbo8CND5HyLNXG6suxnc4W+MoiBAcTR2n4RXHmCyQDJKDEoCT7hwPJHIRfWH44g0iWVORRraunGU47vEQcEMAtiVi3fFsAkUCbQJxC2l3lyQ+odScTZRJv5ITg50J2EJBTHAF9RGRU9uynjdcAq5HU2BYEOCBMRFyqQA0boyaCvBGwI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aTRFWTdURUl6NklFZDdPM1lDSTArV01ueDJqWEd6eWN5V0wyME50Q2w2VWdG?=
 =?utf-8?B?RUZySVZ0ZlFlN2tIaHZCTThhT2ZKOGxqK0QrNTYxd283Zy9uSGptdWpieHRN?=
 =?utf-8?B?V0N6V0lhUlFVRXlMZTFob2trVUVxZjI3SHZ0NTNyZ1hiTHB6TEp0WWdNaHls?=
 =?utf-8?B?T3MxM3JHa1YxWkMvV1dxaEduYWhzdFJNYkNVM1ZpUHh2T21ncGZFakdLVy9i?=
 =?utf-8?B?bGdyQ29uUUZubDlOOUdsZ3JzSjF2bFFyVmNVZkZWWW5ZbGFFVWlEbUdqcUlh?=
 =?utf-8?B?RThZWjNaazhPbEl5QUdHWDdaSEtLMjZIaEFOVDU4b2pzS3Vnc1FQVXBMdVov?=
 =?utf-8?B?Wk9BZkluZWlDQnVOZlB6MWtBM2lqdHhIUGIyYlFvOUZkT1lHWjJsZGFIdWsx?=
 =?utf-8?B?TmE4OFI2MHhpTWg2UU5jeEJDeUZTM1FlWW5ESWdQZ24ySW11OXF3MG5FeXU2?=
 =?utf-8?B?ejVOdG53WlQxcWY4N3pGS21jV1JZOElSUy9XeWRWTGRobWlyWUs4dGcrdStP?=
 =?utf-8?B?ZXZac0MvVk5LY0M4VmZlYXJFNmdQUE5EUFdjeDBwbHEyeFNxSUdUdGJDYlRK?=
 =?utf-8?B?dFoxZmR2RERwVXJwbTNRczNGQTF6cE1GanhTa3lKcmxBb2hkczA0OUNlT2Z3?=
 =?utf-8?B?ZGNwZjdQWkFYRGZHMkgwdlQ0VzFQenI4MkpXYkIvUS8zcDg2cEFCZlFoQVZK?=
 =?utf-8?B?dVVGUmNtclVza0M1NlZFSlVkODdTMWZFSURsbml1bDY3YzFlclprd1NXMStW?=
 =?utf-8?B?SEt0S0hYQW1GNWM0NUI2ZGt6UVdIc2U3N3VhSzhLUFYvUmo2WTlHWjBucEhs?=
 =?utf-8?B?S2RwQ0hKRW9zeVNQOUQyKzcwdWljQk1jV0pMTTl3eitRdzlLOEFqRWVnaTJD?=
 =?utf-8?B?SkFjZmR5c01GMXdGSWYweEp2RGJIdGh2elQ3cXV5Q0dHY3N4RVA5QWp3NC9t?=
 =?utf-8?B?Uko2TXhnVUREQVkwdVhrc0J6Ty9jYkVUM1ZramVxdmZaMDljNW9GR3VkRmZr?=
 =?utf-8?B?K0F6b1M5a0J0MlFsa21xaUNvclhsZThyLzlrSnJWeTc4NzhTYXA0a3RyY24x?=
 =?utf-8?B?MlZBcUR4V3pxcHBudjRUSmNtTjRyMER0Nm5PbDkrSFBCTHhSZmc4d3lkZHVa?=
 =?utf-8?B?dnB3WkR4RHJLSTEyNVIyL1VISkhXTEw1elE4L1FIMm5LUWFJMFpsbXQxQTdy?=
 =?utf-8?B?Y3JYZ29XZDd5VG9yM0RMVlZHZVZqMHpheG9QTnJEQ2IyNzg2b3pNT1huMkJP?=
 =?utf-8?B?Y1p6bUNSWEhzTGVMNFZxM0R6elBjUTJLVE1RcVdIMnh3SUgxcmx0Q3MxVmVY?=
 =?utf-8?B?TXlGMVJrWGIzdzIrL1YyQnU1bjc2WVNJZ3l6YU40K1lWa1FEcHlCMERzQUhw?=
 =?utf-8?B?YUplN2tLVHJUME0zK2I5NVAzQm1ybHpaR2RzM3lnOGFzc1V4RTZmSGF5T3p4?=
 =?utf-8?B?Tnl0cjRJT1crSlhTcCswV1BYSGFLbytEdW5CTnlURmo4Zm54R2pmM2xEbTVF?=
 =?utf-8?B?Z1V2M3FRSDdqUnc1YzFLcTE2TVA5MWVFRk9SS2VjY3NsVTBQTVVrNzhNZHI5?=
 =?utf-8?B?a0dYbWZrVGgwVWpFNkhjQ2czNmg4MzVBcFcxZ1hSTldXd0pNQ29oUi9zb25w?=
 =?utf-8?B?bm45OUtpWk0yZytESHNhcUpMNytOKzZPdno1V0ZORllMcWtDVDc0d2FWYVNB?=
 =?utf-8?B?bERKMVJEd3FWcGRlMFJxd2FGc2lMQjQ3K01kSjVzQmlQUXVrTjk0eUZpZUNZ?=
 =?utf-8?B?RXdsNm8ydzVKdDlRRFNNNVJmdHN1eXB5N2pCVXRPKzVGcjdoajFZWkNEbDhV?=
 =?utf-8?B?MGhhdytiZE9wMlFPSlNRUGpyVTZwU1EvZ1huTk1MVzh6OUtRMkFvaGpWSXRw?=
 =?utf-8?B?UHBmaWZQZEJZbXF3Q2VuY2g1UzZhRnk2dTlweG94YlBQV1ZCWEo3Mzk2cTY1?=
 =?utf-8?B?V2lRUlNqRWJUVEpOWVN0a1BXd0FpSDhDVkxuSElWNXNVc1hvQUEwL09OWlVx?=
 =?utf-8?B?VG54b2krMWFJUS81WVlDai84K1NmSHhRanhoK1VUREtjT3BGdUxsSmxVK09M?=
 =?utf-8?B?c0U4RDFMaEE2QUhRSFhCdXVXUE9QVVU0ODdIVnZDVHM1elYzK05tTjk0cTZL?=
 =?utf-8?Q?KNazZp+QjTsgsEyXrOBqjoCzX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65F052ADCB7F8E419C0ED4DE46871B9F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	h4cL4hCD8BNUn/pqoOmb99xIbMQoWi1GqYH4OjBVNPiqEGy/7NMu/J1qZShT+644zkmIBjVNpyfc0NevkSYlCi7r8/QacuVudqTWlrn3cnjJToY8T9HqFpTctLEHxauSYzfhCQsGY66Y6rDvaMIqOCVfMJakUP6rK3memL5ojQxu5IZiq0pSNuU1BDYHlAWyKSxjM1o4BqL8QIAFuhvfn9a8yONA6Ie4/awWFgqdjZgBlBxaAPq5T3Vk/S9Se4EvqQt3QgsfXYcXE7QUUMs1oSlTQ29qViStZ1gjGF4OdMxR1ptQsjLCxA2P3SaAvCCqTpOeiiz+oZvN5p/2LJsRQcmCTTeAB+k+jKxmIaLOib775dghohyFU2Ka745kCcxTVJ38t+SQdkMWdSEAN+Ho31V28dE3mbnv1d6+MKg7vtZaZKpkktKn0KCtuBzCSgSpvzUzfyGxYgzcj3tKWnLyn0EgDXHhmORI+/kqpXkwJwhh5Lr4AXU9ZiH93BZPSWEvCrfu2frn0HnVT1imUc08plRi5CYT10oRPpjGTkWmFqE2lHj07vblxhQyaOKpEa8C3FtORbZ9x9YygM9LM6louAOUb8cf/F9xqXyW7z6V8AbAHgRqH1bWmrqaL+GLr6xURgHDERJOKyBguHoIMZ2kyw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e78f729-3e5e-4c95-60ba-08dc5e64f010
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 22:31:19.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: isJllsyva+7gTfkhhwo1FH4TOqkzsgkpbefPYgTO4CPLpYclichSdinW2mKG5Q3jEhMUFGbxFuOjumOPh6SH1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
X-Proofpoint-ORIG-GUID: JnX6ZTc8vtKdyXbsNvwOfIgezeZ2LLFH
X-Proofpoint-GUID: JnX6ZTc8vtKdyXbsNvwOfIgezeZ2LLFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_18,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=651 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404160146

T24gVHVlLCBBcHIgMTYsIDIwMjQsIEdyb3NzbWFuLCBKYWtlIHdyb3RlOg0KPiBIZWxsbywNCj4g
DQo+ICANCj4gDQo+IFdl4oCZcmUgdHJ5aW5nIHRvIG9wZXJhdGUgYSBVU0IgZ2FkZ2V0IGJhY2tl
ZCBieSB0aGUgRFdDMyBjb3JlIG9uIGFuIGlNWDgNCj4gcHJvY2Vzc29yLCBidXQgd2UgYXJlIHNl
ZWluZyBpc3N1ZXMgd2l0aCBwZXJmb3JtYW5jZS4NCj4gDQo+ICANCj4gDQo+IEFzIGEgY29tcGFy
aXNvbiwgdXRpbGl6aW5nIGlwZXJmMyB0byBiZW5jaG1hcmssIHdlIGFyZSBhYmxlIHRvIHNlZSB+
MjMwTWJpdC9zDQo+IHdpdGggYW4gUk5ESVMgZ2FkZ2V0LCBhbmQgfjkwME1iaXQvcyB3aXRoIGEg
aGFyZHdhcmUgVVNCLXRvLUV0aGVybmV0DQo+IHBlcmlwaGVyYWwuDQo+IA0KDQpXaGF0IGlzICJh
IGhhcmR3YXJlIFVTQi10by1FdGhlcm5ldCBwZXJpcGhlcmFsIj8gRG9lcyBpdCB1c2UgdGhlIHNh
bWUNClJORElTIGZ1bmN0aW9uIGRyaXZlciBhbmQgdGhlIHNhbWUga2VybmVsIHZlcnNpb24/IElm
IG5vdCwgeW91J3JlDQpjb21wYXJpbmcgMiB2ZXJ5IGRpZmZlcmVudCB0aGluZ3MuIEFsc28sIEkg
YXNzdW1lIHRoYXQgeW91J3JlIHRlc3RpbmcNCmFnYWluc3QgdGhlIHNhbWUgaG9zdC4NCg0KPiAg
DQo+IA0KPiBMb29raW5nIGF0IHRoZSBvdXRwdXQgb2YgcGVyZiwgd2UgYXJlIHNlZWluZyB0aGF0
IHdpdGggYWxsIG9mIHRoZSBnYWRnZXQNCj4gZHJpdmVycyAoUk5ESVMsIFVWQywgQUNNKSwgdGhl
cmUgaXMgc2lnbmlmaWNhbnQgdGltZSBzcGVudCBzcGlubmluZyBpbiBhbiBJUlENCj4gY29udGV4
dCB0aGF0IGRvZXMgbm90IG9jY3VyIHdpdGggdGhlIGhhcmR3YXJlIHBlcmlwaGVyYWwuIFRoaXMg
c2VlbXMgbGlrZSBpdA0KPiBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSBpbnRlcnJ1cHQgaGFuZGxl
ciBhcyBkZXNjcmliZWQgaGVyZTogaHR0cHM6Ly8NCj4gZG9jcy5rZXJuZWwub3JnL3VzYi9kd2Mz
Lmh0bWwuDQo+IA0KPiAgDQo+IA0KPiAgMS4gV2UgaGF2ZSBub3QgeWV0IGFjcXVpcmVkIHRlY2hu
aWNhbCBkb2N1bWVudGF0aW9uIHJlZ2FyZGluZyB0aGUgRFdDMw0KPiAgICAgbW9kdWxlLiAgRG8g
eW91IGhhdmUgYSBsaXN0IG9mIHRoZSBEV0MzIGNvbW1hbmRzIHRoYXQgaGF2ZSBoaWdoIGxhdGVu
Y3kNCj4gICAgICh+MW1zKT8NCj4gIDIuIERvIHlvdSBiZWxpZXZlIHRoYXQgaW1wbGVtZW50aW5n
IGEgcGVyIGVuZHBvaW50IElSUSBmcmFtZXdvcmsgd2lsbCByZXNvbHZlDQo+ICAgICB0aGUgbGFy
Z2UgZGlzcGFyaXR5IGluIHBlcmZvcm1hbmNlPyAgSWYgbm90LCBkbyB5b3UgaGF2ZSBhbnkgaW5z
aWdodCBpbnRvDQo+ICAgICB3aGF0IHRoZSByb290IGNhdXNlIG1pZ2h0IGJlPw0KPiANCg0KSSdt
IG5vdCBmYW1pbGlhciB3aXRoIFJORElTLiBIb3dldmVyLCBteSBzdXNwaWNpb24gaXMgdGhhdCBS
TkRJUw0KdHJhbnNmZXJzIGFyZSBzbWFsbCwgYW5kIHRoZXkgbWF5IG5vdCB0YWtlIGFkdmFudGFn
ZSBvZiBVU0IgYnVyc3QuIE9yDQpwZXJoYXBzIHlvdXIgcGxhdGZvcm0gZG9lc24ndCBzZXR1cCB0
aGUgVHhGSUZPIHNpemUgZm9yIHBlcmZvcm1hbmNlPyBPbg0KYSBzaWRlIG5vdGUsIGlzbid0IFJO
RElTIGdldHRpbmcgb3V0ZGF0ZWQ/DQoNCldlIGNhbiBhY2hpZXZlIGNsb3NlIHRvIHRoZW9yZXRp
Y2FsIFVTQiBzcGVlZHMgd2l0aCB0aGUgY3VycmVudCBkd2MzDQpjb250cm9sbGVyIGRyaXZlciBl
dmVuIG9uIGFuIEZQR0EgcGxhdGZvcm0uIFRoZXJlIGFyZSBtYW55IGZhY3RvcnMNCmNvbnRyaWJ1
dGluZyB0byBwZXJmb3JtYW5jZS4gWW91J2QgbmVlZCB0byByZXZpZXcgdGhlIHRyYWNlcG9pbnRz
IGFuZA0KcGVyaGFwcyB0aHJvdWdoIFVTQiBwYWNrZXRzIHVzaW5nIHNvbWUgVVNCIHNuaWZmZXIv
YW5hbHl6ZXIgdG8gc2VlIHdoYXQNCnRoZSBib3R0bGVuZWNrIGlzLiBJIGRvdWJ0IHRoYXQgaXQn
cyByZWxhdGVkIHRvIERXQzMgY29tbWFuZHMuIE1vcmUNCmxpa2VseSB0aGFuIG5vdCBpbXBsZW1l
bnRpbmcgcGVyIGVuZHBvaW50IElSUSB3aWxsIG1ha2UgdGhlIHBlcmZvcm1hbmNlDQpldmVuIHdv
cnNlIChpcyB5b3VyIGR3YzMgY29udHJvbGxlciBldmVuIGNvbmZpZ3VyZWQgZm9yIG11bHRpcGxl
DQppbnRlcnJ1cHRlcnM/IFNvbWVob3cgSSBkb3VidCB0aGF0J3MgdGhlIGNhc2UpDQoNCkJSLA0K
VGhpbmg=

