Return-Path: <linux-usb+bounces-2025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 217FB7D19A5
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 01:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73FC7B215CB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AF23550C;
	Fri, 20 Oct 2023 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rdZ/C8w4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gL+sVgay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qrYNhiGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE181A71B;
	Fri, 20 Oct 2023 23:31:28 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8555D51;
	Fri, 20 Oct 2023 16:31:21 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KLRJF6022746;
	Fri, 20 Oct 2023 16:31:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HGe4p/INsJ+gfrdDWl50nlPgcKs84iZajcqtC9xMblg=;
 b=rdZ/C8w4Q4q99ICjQoLlr2uxe7SSiSdl/7Hz/IjX5AZyGdFGq1fcIlC1mD2M7PB7Lgau
 hrUwuRLzIt0/0tknItyVVWxe/HUpRc8IMzBi47g6CayjlYrxEGr4KVdiPsOpxmAI03sq
 Ve93sZzB+XTRSbJyxmALtL8qzMnOaaJbfuQqVpJwhyBOoxoT19nnmrpue0mQG6wa3EdL
 TTAvCcl7bC7IN1ElSmvrRH381YRxjZTAcdyjbstnakKP/S+CrGAF1ch4MEOemtGH5EML
 AaJhFo/Ryfr7ikl3cu1O36IPDfsBZIWJ5klawUGmZ1bjQzeJbGd3eOa4hd7zcopEbdCs KA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tubw3ky97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 16:31:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697844666; bh=HGe4p/INsJ+gfrdDWl50nlPgcKs84iZajcqtC9xMblg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gL+sVgay/vc/NhNbIhheYLgTnKiuexEKBVBAXaWX5CL/jdU+NhO9YmDVM+7tPgsdY
	 m43lBA8oK/vcQnkJwFvv7Hzso4CtXG2bX6AAPw/nvbqbu++N5fHLaBwI5reZN6M3Ey
	 XlcCGIoFKxE3hU51ynXUZUNLISRKr0RDLfyOr/CX88cNa6LBZylhhL34LFi233Noo7
	 QF1NFyX8M7YBeSbFamO8IK1SeEUGhHPbcGwsfqU82w658P8UTM1ZP2QR4seD1IQ1GV
	 EhrPyRk1UVchAgmDXgSDMwCS8jPCrQDzJfIAS1mfeHk7iLik/ionwqYbZddOqn06z4
	 NmitLwJ5TG6JA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F204B404B0;
	Fri, 20 Oct 2023 23:31:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 162D3A0071;
	Fri, 20 Oct 2023 23:31:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qrYNhiGJ;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2FC8E40567;
	Fri, 20 Oct 2023 23:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HERJfRJWFVbt/ks7TWyGy/3q80rIxdODLxnKgyHz4fXoKLeWYTFLFVwUZN212Qhfx5f7pU7FI3XmvfeyBzZVGZVzTEJ8e/OkXdTAS66CVxrd6EZkWqdOml1O5V+77ewTrGdFxd73iN32U3tYwJ2nRlBKekubiZeD9KUiW5pCqUd9VgwD7b3dDfeZvoPEG69ui+D5zctv6HTEB4uSqXtSJDbZVwalT4M+EjTW4QJ+RrKPX+tHqjgI/Xv/2VRHALm5wCLTqKLj745NqoX7ik/XwTJMBWODTHwLzU0zNLmoIEi7Q+dlP4t70CJBuibO0LFzdlO+U9ZvlmoDTffHyJc5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGe4p/INsJ+gfrdDWl50nlPgcKs84iZajcqtC9xMblg=;
 b=WU0LViq47BOikCbbSdk2GzvyXEQzBcjBeLLC1mf5BpawpYSw2doPOmo7R8Hvbn1bJPa8py6aCiqIGmEjaCkna2pTud5gpapeLPzxu8CCPn9/+LaXKqpaUiJydpJKWEweOtkFdeJRgK3FAOnPaWAfVyFpPK3J4jJ2Zb8uzVNd5sSJgjH/AupGJRxVpWaqesdBEAZfS9lC8QmwDO9rNaqbYqOrXv4427zKsIhoFYD7/972xsP0ELz0jp3oB0TfrABT4KkkJrpbWMYesMF7YvyFaJt4pspqDkdaOqyLzIXmfDgfspqTf4sUXoqqRHLOTQmPP3wu3ZQtk0s7z5pRFMtFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGe4p/INsJ+gfrdDWl50nlPgcKs84iZajcqtC9xMblg=;
 b=qrYNhiGJFjuNkn7DJYmGM6vn9BZa+lqfNmGZeMBs7ZJm/gL3YiXgQ+cJ8b7Cyb83napa92ZzvqVJlQ4OKevEShGELQwdu4z5Xhm5+022/BzNBk5hVu9H+0yfBp+8ElmXVbfmC9R1JDlgChGMI1zKOxXgYA2hdzLIEWi7w7Ytfj4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 23:30:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb%3]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 23:30:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jayant Chowdhary <jchowdhary@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "mgr@pengutronix.de" <mgr@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "etalvala@google.com" <etalvala@google.com>,
        "arakesh@google.com" <arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Thread-Topic: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Thread-Index: AQHZ+KEKBuYujouRjEW8XTDGwXvQc7A/ZBGAgAKsIACABHhTAIAFWh2AgAeHAQA=
Date: Fri, 20 Oct 2023 23:30:52 +0000
Message-ID: <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
In-Reply-To: <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BL1PR12MB5288:EE_
x-ms-office365-filtering-correlation-id: 60f9018f-1edc-496c-9e17-08dbd1c499bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5sx6NvMgK6u7bUNpBtWe6FEC+Y7LFFCYWG413Sakt2ZAzOCFFrMnwmvCgGK8iWUocnTUZIbtQlWVYj9r3yJnZtXmge8i/iSDlvl9EDQzZKU33Nc1iNEzWNOCTiaHICOMOT2fTFcs+XxWGD6uCUip+BoJdIJBZkRsAddPuDzxLboy+vlPwnklUeHcVFwzWCfrbT+K0tNfjTbsfHm+nKM2aNJWzU8qHuAH1ZGmHSMZsY5gaZM1auaLS5+HiyezTxC/YEJSjFYTsOMjKE65BOdhXLgrod8dPAtvscV3MO6mcbv+pc6XFlcFpvIRv0Wq6Eo+p1w0dVVzZR2q3tTBvxphwGyeaQQR2LFEJNJc9vUGvgkIlsg1wI/31Y77FkCY2ygzgaDj5AtKO15icRFY6ESXmaBBqTFiQjWrRsyMaFe+klilMGBLjsRK6tLTuA2s8G2AdnhWrIUFVPK4ZWgrrfsCDWE+dvXIgQ+o8o2V8WsUzAvJfDYvOi8DX3iyHH9tPRSPacKG2bhi2jGDrGZU2Zt0TV4usPSiwohR2tEJCmYk8tUV/ysmNqZWeCGR91eFjMmui5zRjf+b2VZ6crAO3OoKfxP5FXbT0BG68HnhWIDibqc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(38070700009)(86362001)(4326008)(316002)(76116006)(66556008)(64756008)(6916009)(66446008)(54906003)(66946007)(8676002)(8936002)(71200400001)(478600001)(966005)(66476007)(6486002)(5660300002)(41300700001)(36756003)(38100700002)(7416002)(2906002)(2616005)(53546011)(6512007)(26005)(1076003)(83380400001)(122000001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWV0VExYZUFXSnBmSzh1WC9yNXZ6NCtxTWlvWUxibXBmV2ZzYk5Bc3pZSlJE?=
 =?utf-8?B?WTlhek43RWdhK1FMWmJmN0ZuY0c3MFAyZHlvU3VsN2d1cy9KK05TMzZTZ1dw?=
 =?utf-8?B?WVJJcmwxL2VXNVVpeXgzaXN3Z3drVk1TejkyeHVCeisvMVBvZ3BpZnJxWitC?=
 =?utf-8?B?WWRCQUkwTVZwWTdvZkx0Rm1uOGZ5MlU2NnVDY3BYa0pHT0JpWCtzS1lSQjE5?=
 =?utf-8?B?ZXZHV3FSZUZvSk1iYlpPMnRBeU85d3ZZTkRjeXpGSi9vVHByT3IwK1ViQVoz?=
 =?utf-8?B?ODdhR3ZYOHc0c21DRFNCSHRQR3RoaFpLNU5jQnBxNEVnRW1XNW1veXVCbHpr?=
 =?utf-8?B?NWVHU0tVVzVLRFduaUdyY05YblBlVDAvSFVja3h2NWExV0g1SFlHTXBCSFhM?=
 =?utf-8?B?OEZEL0VkQ1BvZVFEYktFdkFYcTdFaFRIeVZUazBkU0Z5bXlydWNYOG1rUlkr?=
 =?utf-8?B?R3hnY2p5N05Oc0QxRHF0NDNPcEx3NmlLMUZWdDJVWkUySC8yTjk5NGx4YzlT?=
 =?utf-8?B?RWRxcS9BbU1NNUdZNXBwNXloZ0ZIUDdJRnFsWCs5MmNlYnJmM0RFbDBrN3NS?=
 =?utf-8?B?N3UrR3NPK0wzcUtLZjNyU0pFT0pLZXFpeFRKejFxR3JLd09HaHdXRm9hZitN?=
 =?utf-8?B?UmdMeVNVa0VnQkludWlsY2oxSlR5S2RvM04vVGxMeVZpNjBaVWZqNEZ2SzVS?=
 =?utf-8?B?QnVDYXpDVytVVWFJUE1kbUhORkJGZjlpWE5Zb0RSa1o3K3gvZTUzTWFaYzk5?=
 =?utf-8?B?b01BM0NOalFUbnFSRXFWQTlsempndkxaaUF3OVQxcHNYd2lTVitnNk41M2E3?=
 =?utf-8?B?UmhzUm5OSHZPRU9Na09ybW5PTE1RRzhCZUlFNER4bmNLZlIwbVlsRmR5eHpx?=
 =?utf-8?B?SXpWMmltcmJHN1pEMDlqMkFaNjVhRXFNUDVXdGJqNUtFY1NTamptMnlzaWhu?=
 =?utf-8?B?NERFbFBVSjNRR1J3eFp0SzFHNDdtR0NLOVJiMFFRS1RvU0lYemZKQU9aV2ZU?=
 =?utf-8?B?ZE4yelQweUZUVFR6UmtuUkxZdXplenNMUXhzT0tBMTQ1dUJNa2dnN0ZzY2dV?=
 =?utf-8?B?Mms1VE8xakE5ZngzbFc0K3Z6NzJWYzJLaXBVR05xYmZYRHRpOFp3SisrejR4?=
 =?utf-8?B?Myt6SlB0MERXc0RjT2ZDcHJHT2twUnJTL2Uvd0U0UUZtUVl0MmwrbmNZZUFK?=
 =?utf-8?B?ajlBZFB4anFFWDRKbUxIQ2FzZDFqT1F2cVFYcE1ZUkF0MzdzRE1tVndtQXp1?=
 =?utf-8?B?a2djMW9za3ZyS3BmdTNpbTZidkQ2QlRjZFdROGZ2bnhrLzhSdGp4TGFnVU1W?=
 =?utf-8?B?bFJybEFJaVRSS2pSUHlIWWRONW4xaUExVmJlaGJwU2ljQUIyeWZ5cDRRdWYv?=
 =?utf-8?B?ZWI3RFZHQWdXcjdZY1d2QjRYMFJnSFhJcE9veGpKeVJtMEVlSDYxYWt4ZDV1?=
 =?utf-8?B?akRkQmJmZ2NGWUpyUk1rVGkyMWZkanhQYzg4N1NZUVBhc3JpSi9ZaWw3bTVj?=
 =?utf-8?B?dlRWNHZiNTQrWFREQzR2azVGb1lBcUtnM2o5YmtvN3NoUTV1aTFnbm1ybHVJ?=
 =?utf-8?B?NnF5UjY1SkxsODFRZ0xKSSswQ21ORk5Cbjl1dDlzQ2tLdmNVUmJkN2lPQ2FC?=
 =?utf-8?B?MitCWGFsbFMzU3lWaEk0emlLcldpYnh5OG93RVh3N3Y4VzhaRGZ6VDBwK0Nu?=
 =?utf-8?B?em1ZRE9DdDZ2RkVSZGI5TFZTV0RrSWRPenlMZVQxNlZHd1VPWnVmTERmc010?=
 =?utf-8?B?TElMbnRZbEtVaTlxT2NjT1NBK21LR0JtMFlGbGdPbkI3dlNVTnNFa3QyWWlw?=
 =?utf-8?B?RTlFYXRPaWxYRVlxdmoyVXNBWlBXWUtySVVsV0lyWXRnaHlFb2d3d0drclli?=
 =?utf-8?B?TXFiOWpzeCtoSnNRd0s4R2h2WDdsa3h2SE8wTytaTzhudVV1dzcrbUhIVGk2?=
 =?utf-8?B?T2ZDSDFldThOUFpIQXlnRjVuSFM2ZGx1WEpCeDJmU2NpM2laWGptWlZhQzhn?=
 =?utf-8?B?VFZ2UFIxQ01aV0RRblUrRzd4eHVGdWIrV29UL3lzODUxRlB6TGNpeXJXNHJr?=
 =?utf-8?B?c2lXNEhZaXFsSnJPWktUb3hEYXdXWDNna3ZIdkU5TzNNa3J4RDdkSzZGR2Jk?=
 =?utf-8?B?RGZkQ3kzUTVQVTZZMVZLQWtkRGF3UmN3dS9vQnBvM2VZK1NhWU5KUEdFc3pD?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBD3F852B2E7094DBF41275500CA1FF8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?UHZGMThlWFhKanJjeVQ4OWdLMWU2M0p1amljVlJwb3B3MFRFZ3Bvd1RBL3Zz?=
 =?utf-8?B?NHdMNkdJZzBvZGFkV2lFbUpwK0taSVZMMmJ4WEVWL0RhRjR3VGNmbnhIZW4v?=
 =?utf-8?B?QnQrSWtFaGFyb2luT2RveWtBQk5LeHNpT25yNTl4SURHTFN1VHdRdTNUZHBH?=
 =?utf-8?B?K0pnRzg1dU9tRHZ5UHFMQ2plY3NyOFBycnFjeHFIaUhXa1NpdUhBOXJneGd2?=
 =?utf-8?B?U0pxQ21MSDhOUUNKTkFIdjFJMUU3TGZkSTVGTkhKSGNtcmFBakdEeU9FM2R1?=
 =?utf-8?B?RVdscTE1c0xOZ3dvYk94SkJCZTBXNXdMVU1yQUdHRTJ0OFphbEpGL2F4bUNF?=
 =?utf-8?B?Qyt3VkRLYWNsb1YrbXBMRGlFUWxUaTVvREQ3ZE9FSTh2SU5UaitNbVQ3Rlcz?=
 =?utf-8?B?REk3MWdDYkFFdTEvb2hZbHJuS055bGl3czBTYTQxclJPbHMzRXhEcU5ONjdk?=
 =?utf-8?B?eTE5QkFiRTNRbCtzYjhHanhnYTFzTHoxSXliTndtSGkxcmxwTU9IUzBMVzZ5?=
 =?utf-8?B?WUNPMUZtejJDNDFsKzRDVlJiTE5pTyt2Mmx6ejhVZmJ2MFBoYzlINE5uNUJx?=
 =?utf-8?B?NnRHSUFMa1c0cG8rcWxEaWhITS9PdUt0dEJyRFRtTUc3c0h5L0Y3UFVOSmhN?=
 =?utf-8?B?dU1hTHVSNjRkL3lLRVkvaEVXOVVDWE1JN2ovbU8rajZoOHBvOVFOZTJOeENM?=
 =?utf-8?B?SnhvNGJkbmZWenlxeFBZTzFhd0c4N1lrWWhzTUpDYWN5djBPZnBiQnIrMUhw?=
 =?utf-8?B?Yktjdi9MNUlLeGE4MS9WTWk1SDBOMmZwZzJJYVBySThKYjJ6R3NWc2c4VWZj?=
 =?utf-8?B?SXpvWDEydWFDQ1JCSzBRd091K25HNzc5SGkrdmZOQ1J2VzM5NlB3WDBhalBO?=
 =?utf-8?B?UEMyZmVyemQ1ZitOUjlIVjZnVTR0ZGJ5QXRNdEthei8rYUJtVUF6d1A1dTI0?=
 =?utf-8?B?NllGZHM5Q1pCUDBlR1ZlQ1FWZ2RSeEloZlFOOXZtK1AxYWtBV1hZMEFXbVdY?=
 =?utf-8?B?SHBoYTk3MEhFa3VVRC9iMC9uU1cyRjhRaExSWVRzSTE4c1pNbVlwNXZVWmN2?=
 =?utf-8?B?RGk2a2h6VytjMG1aZk9uUXlwZTZiTW90NDhMNnBQVEdaNTJTMEYwUXZoNzh1?=
 =?utf-8?B?dGJITDdockR5M1hoN2d6VmplcTFLV29BWG1PczRNYWRybHgxSGdaZFdKRzhr?=
 =?utf-8?B?NVY3NEgvZzRpM1hleFpDcVByOHo5ZkE1OW9PVk8rSnRaK3ZHNEdrYjRHZ1lP?=
 =?utf-8?B?VGZ4NG9SMFRUNSt3eXUwLzZRSGE4a0IyNFhuL2J5eExSWU9SYm5TOWVSTjND?=
 =?utf-8?Q?sU19exZpuXTLjYgPPqheFHSFtHOnN8+ugB?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f9018f-1edc-496c-9e17-08dbd1c499bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 23:30:52.6082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: musq92nYY0vlZGZ9ckTERLolszuvbUsd/9abMY49rlt1oVE1+TlZPTj5NaFh3M1VW0cQMfA6thdIVsCgQLmBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
X-Proofpoint-GUID: 20KYu4g-iNBlMpQLcb2XaEcvsjffLIga
X-Proofpoint-ORIG-GUID: 20KYu4g-iNBlMpQLcb2XaEcvsjffLIga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=777 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200200

U29ycnkgZm9yIHRoZSBkZWxheSByZXNwb25zZS4NCg0KT24gU3VuLCBPY3QgMTUsIDIwMjMsIEph
eWFudCBDaG93ZGhhcnkgd3JvdGU6DQo+IE9uIDEwLzEyLzIzIDExOjUwLCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+ID4gVGhlIGZyZXF1ZW5jeSBvZiB0aGUgcmVxdWVzdCBzdWJtaXNzaW9uIHNob3Vs
ZCBub3QgZGVwZW5kIG9uIHRoZQ0KPiA+IHZpZGVvX3B1bXAoKSB3b3JrIHRocmVhZCBzaW5jZSBp
dCBjYW4gdmFyeS4gVGhlIGZyZXF1ZW5jeSBvZiByZXF1ZXN0DQo+ID4gc3VibWlzc2lvbiBzaG91
bGQgbWF0Y2ggd2l0aCB0aGUgcmVxdWVzdCBjb21wbGV0aW9uLiBXZSBrbm93IHRoYXQNCj4gPiBy
ZXF1ZXN0IGNvbXBsZXRpb24gcmF0ZSBzaG91bGQgYmUgZml4ZWQgKDEgdWZyYW1lL3JlcXVlc3Qg
KyB3aGVuIHlvdQ0KPiA+IGRvbid0IHNldCBub19pbnRlcnJ1cHQpLiBCYXNlIG9uIHRoaXMgeW91
IGNhbiBkbyB5b3VyIGNhbGN1bGF0aW9uIG9uIGhvdw0KPiA+IG9mdGVuIHlvdSBzaG91bGQgc2V0
IG5vX2ludGVycnVwdCBhbmQgaG93IG1hbnkgcmVxdWVzdHMgeW91IG11c3Qgc3VibWl0Lg0KPiA+
IFlvdSBkb24ndCBoYXZlIHRvIHdhaXQgZm9yIHRoZSB2aWRlb19wdW1wKCkgdG8gc3VibWl0IDAt
bGVuZ3RoIHJlcXVlc3RzLg0KPiA+DQo+ID4gVGhlIG9ubHkgdmFyaWFibGUgaGVyZSBpcyB0aGUg
Y29tcGxldGlvbiBoYW5kbGVyIGRlbGF5IG9yIHN5c3RlbQ0KPiA+IGxhdGVuY3ksIHdoaWNoIHNo
b3VsZCBub3QgYmUgbXVjaCBhbmQgc2hvdWxkIGJlIHdpdGhpbiB5b3VyIGNhbGN1bGF0aW9uLg0K
PiANCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEl0IGluZGVlZCBtYWtlcyBzZW5z
ZSB0aGF0IHdlIGRvIG5vdCBjb21wbGV0ZWx5IGRlcGVuZCBvbg0KPiB2aWRlb19wdW1wKCkgZm9y
IHNlbmRpbmcgMCBsZW5ndGggcmVxdWVzdHMuIEkgd2FzIGNvbmNlcm5lZCBhYm91dA0KPiBzeW5j
aHJvbml6YXRpb24gbmVlZGVkIHdoZW4gd2Ugc2VuZCByZXF1ZXN0cyB0byB0aGUgZHdjMyBjb250
cm9sbGVyIGZyb20NCj4gZGlmZmVyZW50IHRocmVhZHMuIEkgc2VlIHRoYXQgdGhlIGR3YzMgY29u
dHJvbGxlciBjb2RlIGRvZXMgaW50ZXJuYWxseSBzZXJpYWxpemUNCj4gcXVldWVpbmcgcmVxdWVz
dHMsIGNhbiB3ZSBleHBlY3QgdGhpcyBmcm9tIG90aGVyIGNvbnRyb2xsZXJzIGFzIHdlbGwgPyAN
Cg0KV2hpbGUgaXQncyBub3QgZXhwbGljaXRseSBkb2N1bWVudGVkLCB3aGVuIHRoZSBnYWRnZXQg
ZHJpdmVyIHVzZXMNCnVzYl9lcF9xdWV1ZSgpLCB0aGUgb3JkZXIgaW4gd2hpY2ggdGhlIGdhZGdl
dCByZWNpZXZlcyB0aGUgcmVxdWVzdA0Kc2hvdWxkIGJlIG1haW50YWluZWQgYW5kIHNlcmlhbGl6
ZWQuIEJlY2F1c2UgdGhlIG9yZGVyIHRoZSB0cmFuc2ZlciBnbw0Kb3V0IGZvciB0aGUgc2FtZSBl
bmRwb2ludCBjYW4gYmUgY3JpdGljYWwsIGJyZWFraW5nIHRoaXMgd2lsbCBjYXVzZQ0KaXNzdWUu
DQoNCj4gDQo+IFRoaXMgYnJpbmdzIG1lIHRvIGFub3RoZXIgcXVlc3Rpb24gZm9yIE1pY2hhZWwg
LSBJIHNlZQ0KPiB0aGF0IHdlIGludHJvZHVjZWQgYSB3b3JrZXIgdGhyZWFkIGZvciBwdW1waW5n
ICB1c2IgcmVxdWVzdHMgdG8gdGhlIHVzYiBlbmRwb2ludA0KPiBpbiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjAwNDI3MTUxNjE0LjEw
ODY4LTEtbS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGUvX187ISFBNEYyUjlHX3BnIWFBbnpDb3Bi
VGJadFV4Qks2YTZyNl9RelYtYjJaMko1bzVlc1BhYXJ0WjJqb2dLaWptaHFqNk95aUtEZy1CUGh4
cThwSkhSM0hTMUhmOHo2WW5xZldUb24kIA0KPiAoSSBzZWUgbXVsdGlwbGUgZW1haWwgYWRkcmVz
c2VzLCBzbyBhcG9sb2dpZXMgaWYgSSB1c2VkIHRoZSBpbmNvcnJlY3Qgb25lKS4NCj4gDQo+IERp
ZCB3ZSBpbnRyb2R1Y2UgdGhlIHdvcmtlciB0aHJlYWQgdG8gc29sdmUgc29tZSBzcGVjaWZpYyBk
ZWFkbG9jayBzY2VuYXJpb3MgPw0KPiBPciB3YXMgaXQgYSBnZW5lcmFsIG1pdGlnYXRpb24gYWdh
aW5zdCByYWN5IHVzYiByZXF1ZXN0IHN1Ym1pc3Npb24gZnJvbSB2NGwyIGJ1ZmZlcg0KPiBxdWV1
aW5nLCBzdHJlYW0gZW5hYmxlIGFuZCB0aGUgdmlkZW8gY29tcGxldGUgaGFuZGxlciBmaXJpbmcg
Pw0KPiANCj4gSSB3YXMgY2hhdHRpbmcgd2l0aCBBdmkgYWJvdXQgdGhpcywgd2hhdCBpZiB3ZSBz
dWJtaXQgcmVxdWVzdHMgdG8gdGhlIGVuZHBvaW50DQo+IG9ubHkgYXQgdHdvIHBvaW50cyBpbiB0
aGUgc3RyZWFtaW5nIGxpZmVjeWNsZSAtIA0KPiAxKSBUaGUgd2hvbGUgNjQgKG9yIGhvd2V2ZXIg
bWFueSB1c2IgcmVxdWVzdHMgYXJlIGFsbG9jYXRlZCkgd2hlbg0KPiAgICB1dmNnX3ZpZGVvX2Vu
YWJsZSgpIGlzIGNhbGxlZCAtIHdpdGggMCBsZW5ndGggdXNiX3JlcXVlc3RzLg0KPiAyKSBJbiB0
aGUgdmlkZW8gY29tcGxldGUgaGFuZGxlciAtIGlmIGEgdmlkZW8gYnVmZmVyIGlzIGF2YWlsYWJs
ZSwgd2UgZW5jb2RlIGl0DQo+ICAgIGFuZCBzdWJtaXQgaXQgdG8gdGhlIGVuZHBvaW50LiBJZiBu
b3QsIHdlIHNlbmQgYSAwIGxlbmd0aCByZXF1ZXN0Lg0KPiANCj4gVGhpcyB3YXkgd2UncmUgcmVh
bGx5IG1haW50YWluaW5nIGJhY2sgcHJlc3N1cmUgYW5kIHNlbmRpbmcgcmVxdWVzdHMgYXMgc29v
bg0KPiBhcyB3ZSBjYW4gdG8gdGhlIGR3YzMgY29udHJvbGxlci4gRW5jb2RpbmcgaXMgbW9zdGx5
IG1lbWNweXMgZnJvbSB3aGF0IEkgc2VlDQo+IHNvIGhvcGVmdWxseSBub3QgdG9vIGhlYXZ5IG9u
IHRoZSBpbnRlcnJ1cHQgaGFuZGxlci4gSSB3aWxsIHdvcmsgb24gcHJvdG90eXBpbmcNCj4gdGhp
cyBtZWFud2hpbGUuDQo+IA0KDQpUaGF0IHNvdW5kcyBnb29kIHRvIG1lLiBJIGJlbGlldmUgTWlj
aGFlbCBhbHJlYWR5IHByb3ZpZGVkIHNvbWUgdGVzdA0KcGF0Y2hlcyBhbmQgeW91J3ZlIGFscmVh
ZHkgZG9uZSBzb21lIHByZWxpbWluYXJ5IHRlc3RzIGZvciB0aGF0IHJpZ2h0Pw0KDQpUaGFua3Ms
DQpUaGluaA==

