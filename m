Return-Path: <linux-usb+bounces-3183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589C7F465E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 13:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2C3280F3C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 12:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C174D121;
	Wed, 22 Nov 2023 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BaMv2Dp4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YG691J93";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XhvS+JzZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA9D91
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 04:35:52 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMB0n5S006016;
	Wed, 22 Nov 2023 04:35:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Wkc5kKA/iVZ+rjNlcmRCYOnhrL0aNXZq1sJkQzMTjFo=;
 b=BaMv2Dp4TUquTN4iX092MDobnt01td0X0hJAvSf6CRGLkBzN215WPB+Tk281AqwQNCPU
 Wx6EYON+BdYrKPgYaGbBqxvRzLv3WrufL8DD5PccP2kXj7KiPuSygSvaY+YtJyrfIRjm
 iUphr1GjY7/TUqJGToopmWa7KeVifTj8112lv8C6a7Arx3qygmNMR0rVha5bRNGsn1Ug
 f7rAOCxrUsHm4Q7wKab37BxoT2Oh/Z0SGLufoG6MpSfND2ICJ/DeODvP/6nwjjreYdIy
 6JjHwa4ctY83m6QM65n3yrEp0SXXaKnBdqBOB7dNgxXam9ebDsh6IXhANxIJAJKvkwbp Bg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3uewdb1g7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 04:35:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1700656546; bh=Wkc5kKA/iVZ+rjNlcmRCYOnhrL0aNXZq1sJkQzMTjFo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YG691J93PGMEJL5Ene0k3IvTssOj/niyv8zWadCjaEFg9FgwoUMd9qzkqbcqUr73c
	 tdIqAO05xcuJ3SlWYnBe889r6ZS2ZrBeDwIbiob0Yq7wsJ4WZuo0SrznnErUL1U4Zm
	 kOnT2yGGb+6RinKWZVoxEazh9N7fAZrBkicnMxCKKgwx42KoYmlM2T9i885cx+5s6r
	 PbHqxstegRpEx6Mnsalwh0qJvhN8oIAb7HhKJ4AFUIW6YzWyeQH1PvaBYU/tQ8NiAx
	 tmpvDpKhWL6aTmhuJ87+ZDM4r0bS/izTwjxDIFvA5zYhOlRltZZ5MjOXtcEU6gegIH
	 iQxYULU4m2dhg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 954C74011F;
	Wed, 22 Nov 2023 12:35:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 33E86A00A8;
	Wed, 22 Nov 2023 12:35:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XhvS+JzZ;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 83D95401DD;
	Wed, 22 Nov 2023 12:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUHlgPJ+6dcUSVELFAgiqvCgFI2ARxq16Ado1FPRPGZJP1Qft7/nQALucjYQMM1YJ5AHxhWR9bVBgbfQsUCLCIfSBjuSRUsEgMfyCepRErQnuppqbYy5yFyDHBApPLCMZWLPJHfcfmfnM6LfG+7cA0Ssl/e6qtdVFDkIj90WBQVXI16BBitfvRzJGXPLQXPeIG2xZz8nOzFDeKE8famrwZTyQCqNlqIiOZ1Z2fCyA30b8cloydTnDgEL/jbYI1nRa3710kmQ4BVZOGPIvd9sElA2Rixkyrj9mKswIRSRfV3zJoyo9M/223b4DI7lVUOH387juPLHBhYOgCTohamsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkc5kKA/iVZ+rjNlcmRCYOnhrL0aNXZq1sJkQzMTjFo=;
 b=ccmvYQrNnn6+yqo4rNmrYcR2p+i2Z4opNnMv/VhFypy1zpde6SdNR66Qx5IZmLvC0ZzH3dtTcqjErWp03NQc+vIyiW+wuWbsonnXgukjHpg18djoOG91o5GEDoRrOo/7WAokuJWF1jquAs7JDfdcWqke6AikgmfdZ2GU+cFdwLVW6n24DF2I3y1OLkep9I758IGdcyz2Z81y7ZYLBmTrCyTk4ykLw0CEVzkRaq8xKoGqz35BuVZ6Yta9IPj3bdQ0Ky592IAWVLA9OiUaE4ro/XokEQtcuiCi50Ps0sxE/RaeRrahWfuSE/QTBWO9EIPjQmHo1fW24JtdhJiDlyUCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkc5kKA/iVZ+rjNlcmRCYOnhrL0aNXZq1sJkQzMTjFo=;
 b=XhvS+JzZwepuu5NM36uNrFHM/tyrsJyx3t8lQhuYqKUiJAs9wamOyypsoMWt9gRrcgs2w7V0SiAAJ7RXknUa7Vs6PIegwAByiztWA4ztbkwhIII5+gvNraB7+HIgISX2ZE1HDQsEz9v+LK+Vk2ZL7ZjUjjYfES4rQ/qodxkrhuY=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 12:35:40 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 12:35:40 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Ivan Ivanov <ivan.ivanov@suse.com>,
        Andrea della Porta
	<andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index: AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGA
Date: Wed, 22 Nov 2023 12:35:40 +0000
Message-ID: <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
In-Reply-To: <20231115144514.15248-1-oneukum@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|CYXPR12MB9442:EE_
x-ms-office365-filtering-correlation-id: 12e1f0bd-9de5-47bf-0aa5-08dbeb578970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WQASr+6rNqDLbkDS0mymvyi5SYgk/hkbnrKZ4E9Zc1C9XTyY0NAmKcDuC5EcSjuS14TM6CG8j/OWs1K3UG1OSLE6FnulYgMbzAlBPqmInz+fD6ezlm5G1Iqbu9u+xQnixKSaKjsEIpuIaBtJJOLfU2YCV2/dPGBsYgblJM2a2LID5QISY0HLmj/3zRibt+xRMFva8hR2AVDUPFm17v5od6jrp9dHTBwrbh/WeLwDgSVbQwfPXdKQqUmFZ9r4pinkPcCcTLKRpbcEN1APDfrW0CcQ6Q7tWMeaBH3AII5Tz1lrq8U3cadJAit1lqY9GFgr+t47aNgMonUsKDKk3qo1wvUYLs/6gulqth/3eDgmAYnpu1FEh8DLEiZ1IfJ2syJv7kZULk4gbc2MvTPEbpId7cv+SjBC6yDbJmgJN7huSOlUW6ySJN0OgARuClOGnchHnBXyAywuUYxLtlYONAKaW6E7P31UzAEiNVRjntc9BhHlPN66RbFs3hi8KeKllnYthj4jwXyGp7Y+ddjZiACwBVCSEfuM9oXlFe9iJkz14jAZ3U3+fuSsNz2dEuqbnwtho0F8tcRCSI4DTwiSvu9XuNRhWvJO7iLmSu2aTqHdApvY4snbsAczTE6evx+8OuQP49WFh76tRSFH5LbmHQFG2rbzAB6OqKNlh8/ZqyXy384zpMgLLJeaGvqhaSUibUdw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(53546011)(86362001)(71200400001)(6506007)(36756003)(31686004)(31696002)(38070700009)(478600001)(6512007)(6486002)(2616005)(26005)(91956017)(66556008)(66476007)(54906003)(64756008)(66446008)(83380400001)(66946007)(76116006)(316002)(110136005)(8936002)(8676002)(4326008)(2906002)(41300700001)(122000001)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVBwcXZmSFFIVEhKRVJBbWNINDA0S1A0ckkyc3RoMktBVzlKK1pTdGoxV214?=
 =?utf-8?B?MXRmWVc4cUhwVFFCZTVKZlFEb2JuY1l6c0ZTemlsRTM4d2paK0pYaElxeUph?=
 =?utf-8?B?bzZXRXprY0hjay80NjlrdGxEYmN6MFJqVU9pcDBFd1V1RWtrR0Nyd1dVcnZD?=
 =?utf-8?B?bVByN3NkeWlzWlhCYmdpQWhrOGxRZ004aUkzS0FMVVIxSjNVRlB5M2ltdGIv?=
 =?utf-8?B?dXVwZWV4Q3BTQnlOWFpVbVVWcVpGRjlHS25INVZ3amJZTVlqM0tEWlFYNHh4?=
 =?utf-8?B?ZG0zdGxGZHc2dkVCVXZxcEJyN2RNSU5aak42MStUNGRzbTVTM0hCOGxsS21u?=
 =?utf-8?B?VEFoMmJReWdzUDFQYmtpcWNOR3g0MUd5ZGVQS0E2RkVrc2FZUWV0ck91dzU0?=
 =?utf-8?B?cko5d3JWK1g3aE1vOUtZVGZCWm5nQmdOU3Npa3lxbS93MnNhcGQ2eTk2ZEVr?=
 =?utf-8?B?UDh1czdVcGtRd0tWTXYvd2FFOEVwZE81Z1dyU1Nlc1hYdjVBcHRMeGw1UDUv?=
 =?utf-8?B?c0N3b09COEE3aFRTZkJYaUVlT1Rhb2ZTRFZqZEhOMWZPdU5qaEJnMFNsbG1a?=
 =?utf-8?B?d1I2bko2OWUweWVCeDJuUUtocDhHSUxSMzQ2QXQ4MlE3ek1UN1dnUVMxOHJK?=
 =?utf-8?B?UmRQMTY1RityVStveGMvVG15bklvQTM3b3U2TlpxVXl1SkZmVk1DRUgwaFFG?=
 =?utf-8?B?QjRoWEtibVJCeHR0Q01tQUFtYTZ6WS9uQktLNFpMREVLL25YM1p6WUZHSFpw?=
 =?utf-8?B?ZlBuS0crU3pGeUN0SEdRRTlyM2xJUUlMV3ZCT0dGTVRMdzZBRXRyUnhHRUlE?=
 =?utf-8?B?eTE0aUN4UmI5MStsWDU5MFZUM1J0QTRSSGlwdWtpWE11blJBQTV4OUlKZk9k?=
 =?utf-8?B?MlZndHUyU0NCY1R6b2Z1VjU4YTJNUWNjbDJxMzl5cm40OXR5UzJmZy9vMS9O?=
 =?utf-8?B?Ylp3TVBPOWZUczFCUDNjdUdYRkFwRE9iNjJMU21JWEhxSm52R1hrWUxZSGJH?=
 =?utf-8?B?YkplMTducVY4Vm9HWHpiTDRuMmhWSmhzdFA2Ujl6OXFlNlhURVpwazRVZk83?=
 =?utf-8?B?L2RMSEE5NkRHZUpHRlU4ZktRWmk5ZGovZDJ6SVlHSEJiRVF4cFlNUnhzNkRQ?=
 =?utf-8?B?d1NJTzZxZjRoc1k5ZkpqNk1SY0E0Tm03eWpJNDY5dFR3WWJzbnNzTnoyYkkz?=
 =?utf-8?B?VUdYMlhTNENmMjhnVUwxcWh6eWFsNUlWU2pvUFNVMXBGOHArbFBRU1Bxb05Q?=
 =?utf-8?B?U0g3d2lRTWdNVVE4N3BoM0tIcDl4UStlbjdFTFV0SWIxMmo4ZnY5S2YwMm9B?=
 =?utf-8?B?WkZvQ01LNXFIeG41OFhmQXpsRmxGYUZXWWNTSkE2Mm41OEU3aFdNd3pzRW5j?=
 =?utf-8?B?MUxtMTZKalg4cnZVdTdrckRFdkduS2JaN1gzT3EzSEYyVUY2UXhkSzRLRWJp?=
 =?utf-8?B?aE9BZisyTkZvd1dPU2tJYUVPTGJsSWhmWHFqT1VhZnYrWk9wM3NiVkJVV2lp?=
 =?utf-8?B?dklPdm9oeFRvU280SmltTEUzb1pFczFRaUpQUmRxelFrK0JubGw4NU5VWVNO?=
 =?utf-8?B?ZUI1N1Y0NXFmMGpURzk0U0N5bithY2hoTFc2UXVYRkhRRFRDNGxxSXVYaGZm?=
 =?utf-8?B?TGFXOHhZdWczWE9vQmdSVWY3NjVpSHgwRk1vUmFTSUI1SVY1TFh2N3RrYlFo?=
 =?utf-8?B?K1NBbmhsVjVqZlQrS0U1K0xoR3AzMTVUcTN1RUQ1dUhaWGpBTHh1SDdTSnZo?=
 =?utf-8?B?R3JFWUc0S0hham1iSHFXMW9HVndHZXNJaEhwaFpMRkorTFo5SFBiTW91WnJS?=
 =?utf-8?B?ZjhwZTE1TG44SWloYWJXMGdpTlZKQ2pzdjlnOHM0eFlDdzl0aDR3SWc2ZkxP?=
 =?utf-8?B?bm9xbTNiaHhkSlo3aERhVW9XcjUzTjNYS3RNTmtmQWZlRWE3V3ZXUmlMSWI0?=
 =?utf-8?B?enhnUTlmNndDYzdybmxadzJDTXQ2a21Xc3Nid0NXeW92RnJCWWJ2YTFLcWNT?=
 =?utf-8?B?Y1pQVGNWL0lWTTRoK3N4alF5UGFyOXRKcWZrSUFYRGNkc04zMUNVV2tCOEhP?=
 =?utf-8?B?dE8rOUMzVlRIMUhYMGJkNnlYZTI3cGFUSVloUVBaQ2ZKcGhXL05HK1MzYlVK?=
 =?utf-8?Q?d+VeihK06p8M+0mKgjkes2YAM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC7C65DFB9B59D4AA7910C694E17ACF9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mpCmbkfaOdH5I7U008zbIcb/y8HgkEHatXB9cVvApaKlg6gQkUHqiBG3/wLDilh8ZLNcY5cUgxJWONROC+D8MCd5JCktp/viIqZYAmXNJKoEui/g64ByrTXM2Tj9X/jJPtvv1xfkg72s3U4k7nfTL1IbCkFuxRA0Ph3OzWGacK2N2A71Z3AcxU7gKwdm0akJZM7fMLqSO48FEkYc+zAe0VpxJYWLpQLwe0Jh5sDup0ZWuhySqQWkKQmkU+Z1yH+BsBf3Rz7e2EyYwc/PACunff8o4cgxBJcWXcjdcYWnFR8ZKxgSLDRdbwO0SR6kgqrAC4srwPZnnadIWEZ+vLmspuv0IW8c4DSgsc9dlFK0Vswa24RWZcVLMwAsmEfuXa7urP0OCk4mIPsLR5QjJZvP4oLvZ/gzGZIGJztwiFKNWOekKRB2yLUes2j2/mjtNMDfnrGyxe7rD8csca03WzDkp+vt/iUGJo/56Lwz4SqjPIAdcP5Ag7oBvziOVJpQLKi47z8kn8gEdLlnpPUurHYGLvTZXHVmHaxeiNrX2aGsqxbx1ngZ0gvjH/PPq53dnPtj4oFP/4agtEKZa8o0uP+vLqxQDQJrgQeDiG1evjEJfR28p+BXBS8DDKj3uNubyheVmYKYzGUTxilL3wQx/MLIOq4UAea9b7I7gt8VFI1ZVQp89hlcZv5g9QXx/4Bpfg5kZc7RuP2tVQ0Nkxdk6BVA20LqDbpOgq7wNWUiIoo2dRSxBe+6bjqXA67t/KMqLo/bO6Y3ZwuFvaHuGs6cdo6yHGhVvp2mo37K+dl/1qNFDDPKTBYAJOYqacsyKLEoAzazlsP+nHjeG0CboP42ub0Ncw84/lydHFWT7HQSDefbkqyVDWWh9Yws5dHT2EfX7ypK
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e1f0bd-9de5-47bf-0aa5-08dbeb578970
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 12:35:40.3363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaQfJMuRRld1W6hnf0QYl1Ni4g4aWvsq8+8z8Cwz8Z7bZzG4rwHIhBxoVRe06ON2dBJ3Qn2YsFz6IHJ/WMZ6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
X-Proofpoint-ORIG-GUID: ce69f1Y-1PHpLMzBPVyKiQPXlTlBZ_81
X-Proofpoint-GUID: ce69f1Y-1PHpLMzBPVyKiQPXlTlBZ_81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_08,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=399 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220088

SGkgT2xpdmVyLA0KDQpPbiAxMS8xNS8yMyAxODo0NSwgT2xpdmVyIE5ldWt1bSB3cm90ZToNCj4g
ZHdjMl9oY19uX2ludHIoKSB3cml0ZXMgYmFjayBJTlRNQVNLIGFzIHJlYWQgYnV0IGV2YWx1YXRl
cyBpdA0KPiB3aXRoIGludG1hc2sgYXBwbGllZC4gSW4gc3RyZXNzIHRlc3RpbmcgdGhpcyBjYXVz
ZXMgc3B1cmlvdXMNCj4gaW50ZXJydXB0cyBsaWtlIHRoaXM6DQo+IA0KPiBbTW9uIEF1ZyAxNCAx
MDo1MTowNyAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6
IENoYW5uZWwgNyAtIENoSGx0ZCBzZXQsIGJ1dCByZWFzb24gaXMgdW5rbm93bg0KPiBbTW9uIEF1
ZyAxNCAxMDo1MTowNyAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogaGNpbnQgMHgwMDAwMDAwMiwg
aW50c3RzIDB4MDQ2MDAwMDENCj4gW01vbiBBdWcgMTQgMTA6NTE6MDggMjAyM10gZHdjMiAzZjk4
MDAwMC51c2I6IGR3YzJfaGNfY2hobHRkX2ludHJfZG1hOiBDaGFubmVsIDAgLSBDaEhsdGQgc2V0
LCBidXQgcmVhc29uIGlzIHVua25vd24NCj4gW01vbiBBdWcgMTQgMTA6NTE6MDggMjAyM10gZHdj
MiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAwMDAwMDIsIGludHN0cyAweDA0NjAwMDAxDQo+IFtN
b24gQXVnIDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX2hjX2NoaGx0
ZF9pbnRyX2RtYTogQ2hhbm5lbCA0IC0gQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3du
DQo+IFtNb24gQXVnIDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAw
eDAwMDAwMDAyLCBpbnRzdHMgMHgwNDYwMDAwMQ0KPiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIz
XSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl91cGRhdGVfdXJiX3N0YXRlX2FibigpOiB0cmltbWlu
ZyB4ZmVyIGxlbmd0aA0KPiANCj4gQXBwbHlpbmcgSU5UTUFTSyBwcmV2ZW50cyB0aGlzLiBUaGUg
aXNzdWUgZXhpc3RzIGluIGFsbCB2ZXJzaW9ucyBvZiB0aGUNCj4gZHJpdmVyLg0KDQpJJ20gT2sg
d2l0aCB0aGlzIHBhdGNoLCBqdXN0IG5lZWQgc29tZSBlbGFib3JhdGlvbi4NClNvLCBjaGFubmVs
IGhhbHRlZCBpbnRlcnJ1cHQgYXNzZXJ0ZWQgZHVlIHRvIHNvbWUgb3RoZXIgaW50ZXJydXB0IChB
SEIgDQpFcnJvciwgRXhjZXNzaXZlIHRyYW5zYWN0aW9uIGVycm9ycywgQmFiYmxlLCBTdGFsbCkg
d2hpY2ggd2FzIG1hc2tlZC4gDQpDYW4geW91IGNoZWNrIHdoaWNoIG9mIG1hc2tlZCBpbnRlcnJ1
cHRzIGlzIGNhdXNlIG9mIGNoYW5uZWwgaGFsdCBpbnRlcnJ1cHQ/DQoNClRoYW5rcywNCk1pbmFz
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+
DQo+IFRlc3RlZC1ieTogSXZhbiBJdmFub3YgPGl2YW4uaXZhbm92QHN1c2UuY29tPg0KPiBUZXN0
ZWQtYnk6IEFuZHJlYSBkZWxsYSBQb3J0YSA8YW5kcmVhLnBvcnRhQHN1c2UuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL3VzYi9kd2MyL2hjZF9pbnRyLmMgfCAxNSArKysrKysrLS0tLS0tLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvaGNkX2ludHIuYyBiL2RyaXZlcnMvdXNiL2R3
YzIvaGNkX2ludHIuYw0KPiBpbmRleCAwMTQ0Y2E4MzUwYzMuLjVjNzUzOGQ0OThkZCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzIvaGNkX2ludHIuYw0KPiBAQCAtMjAxNSwxNSArMjAxNSwxNyBAQCBzdGF0aWMgdm9pZCBk
d2MyX2hjX25faW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGludCBjaG51bSkNCj4gICB7
DQo+ICAgCXN0cnVjdCBkd2MyX3F0ZCAqcXRkOw0KPiAgIAlzdHJ1Y3QgZHdjMl9ob3N0X2NoYW4g
KmNoYW47DQo+IC0JdTMyIGhjaW50LCBoY2ludG1zazsNCj4gKwl1MzIgaGNpbnQsIGhjaW50cmF3
LCBoY2ludG1zazsNCj4gICANCj4gICAJY2hhbiA9IGhzb3RnLT5oY19wdHJfYXJyYXlbY2hudW1d
Ow0KPiAgIA0KPiAtCWhjaW50ID0gZHdjMl9yZWFkbChoc290ZywgSENJTlQoY2hudW0pKTsNCj4g
KwloY2ludHJhdyA9IGR3YzJfcmVhZGwoaHNvdGcsIEhDSU5UKGNobnVtKSk7DQo+ICAgCWhjaW50
bXNrID0gZHdjMl9yZWFkbChoc290ZywgSENJTlRNU0soY2hudW0pKTsNCj4gKwloY2ludCA9IGhj
aW50cmF3ICYgaGNpbnRtc2s7DQo+ICsJZHdjMl93cml0ZWwoaHNvdGcsIGhjaW50LCBIQ0lOVChj
aG51bSkpOw0KPiArDQo+ICAgCWlmICghY2hhbikgew0KPiAgIAkJZGV2X2Vycihoc290Zy0+ZGV2
LCAiIyMgaGNfcHRyX2FycmF5IGZvciBjaGFubmVsIGlzIE5VTEwgIyNcbiIpOw0KPiAtCQlkd2My
X3dyaXRlbChoc290ZywgaGNpbnQsIEhDSU5UKGNobnVtKSk7DQo+ICAgCQlyZXR1cm47DQo+ICAg
CX0NCj4gICANCj4gQEAgLTIwMzIsMTEgKzIwMzQsOSBAQCBzdGF0aWMgdm9pZCBkd2MyX2hjX25f
aW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGludCBjaG51bSkNCj4gICAJCQkgY2hudW0p
Ow0KPiAgIAkJZGV2X3ZkYmcoaHNvdGctPmRldiwNCj4gICAJCQkgIiAgaGNpbnQgMHglMDh4LCBo
Y2ludG1zayAweCUwOHgsIGhjaW50JmhjaW50bXNrIDB4JTA4eFxuIiwNCj4gLQkJCSBoY2ludCwg
aGNpbnRtc2ssIGhjaW50ICYgaGNpbnRtc2spOw0KPiArCQkJIGhjaW50cmF3LCBoY2ludG1zaywg
aGNpbnQpOw0KPiAgIAl9DQo+ICAgDQo+IC0JZHdjMl93cml0ZWwoaHNvdGcsIGhjaW50LCBIQ0lO
VChjaG51bSkpOw0KPiAtDQo+ICAgCS8qDQo+ICAgCSAqIElmIHdlIGdvdCBhbiBpbnRlcnJ1cHQg
YWZ0ZXIgc29tZW9uZSBjYWxsZWQNCj4gICAJICogZHdjMl9oY2RfZW5kcG9pbnRfZGlzYWJsZSgp
IHdlIGRvbid0IHdhbnQgdG8gY3Jhc2ggYmVsb3cNCj4gQEAgLTIwNDYsOCArMjA0Niw3IEBAIHN0
YXRpYyB2b2lkIGR3YzJfaGNfbl9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZywgaW50IGNo
bnVtKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgDQo+IC0JY2hhbi0+aGNpbnQgPSBoY2lu
dDsNCj4gLQloY2ludCAmPSBoY2ludG1zazsNCj4gKwljaGFuLT5oY2ludCA9IGhjaW50cmF3Ow0K
PiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBJZiB0aGUgY2hhbm5lbCB3YXMgaGFsdGVkIGR1ZSB0byBh
IGRlcXVldWUsIHRoZSBxdGQgbGlzdCBtaWdodA==

