Return-Path: <linux-usb+bounces-3534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB280082B
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 11:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 776AEB21229
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 10:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9941720B1A;
	Fri,  1 Dec 2023 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MhAfv/+l";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aMwPan3M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dbeSi6ST"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F03594
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 02:26:54 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B18wjFJ020308;
	Fri, 1 Dec 2023 02:26:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=blJnPw8Cbv7NTKv/tCjS+UA0LM7LR74EpRfpghBblvI=;
 b=MhAfv/+lKA1Dch/piWbzmLFJ42BF2lCYGyi5JosrWG935g+GnH9rLxDsoxQWYdp72iFG
 EWg1v03oMkRfo1kL9URYdebPkv6vWlNI1yxUWy4YgfUAxQYLvRxBc+aXAIquQFqsu/b0
 IKR2ZiTdyrBLvKhIufwA8cwqGxW1CpUMsdoID9j3eCuIqDodD7w+9Qt4DHrcNaVwKSTR
 wKoeI1q/gKOzpaVoChybUKMFYOVrAe365DIrNAo9CY+dIwlrtSqgNPVtjVMtEyOy3Pt7
 cNbfHKwoIBydTXuDqoKOR9gkbd2GS762sJVXP8zuyxwsgpeL9SXZ0BhoSQMy7jFAuF8x Lw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ukgemkktd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 02:26:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1701426409; bh=blJnPw8Cbv7NTKv/tCjS+UA0LM7LR74EpRfpghBblvI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aMwPan3MdVcXU8m953aYjDFiFDxBOOLtTp+yUuPcjMrSrzkOm6w+DCNjbCQu+aGEB
	 0wBmG3XvLAQWrKGCIh+63fW7cPbe67HDNo5h+EgC+22mrdklAtKcnz6N2yR4BoMYsF
	 9F8er+XogmHE/WQR+JRyJZGHHKKOimPhh01XxpW889S2Yup5eWpqmgCAAl8XN0Ja57
	 rjk9iwUwg6RrQtObBWqEnfB0/ddZWAjEys6ib1uJlLJ/kMO0BXhjSYhR+ixEGMLPPX
	 lBZrzsS2lXSp3hRKzJ4XfECItGMyadIt8u5U2ao+LBCw8AtQpbaysF1n33v7m4KFR4
	 BdgpZXIzkMOMQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1116140542;
	Fri,  1 Dec 2023 10:26:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D80C8A006C;
	Fri,  1 Dec 2023 10:26:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dbeSi6ST;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E8736400A2;
	Fri,  1 Dec 2023 10:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQBOOjc1B5UOsuQo9LHq7i1vRDseKKwH2QPWxhvvobSqCQiDRBPHzzuUegbiDk2SvvvWaxkGSRPtjpXT5Avse63oR2VUfPzizD8aA+niNxZJ+X+aLGSczHyg2ASwYQgCbqOn1dL6bpLvZ7xdGV+32OP6JtyW4/33VyJ6VzBehbOE6vD/Eugk4IDFbySakLXfu/VE/Y/ujibyuVqu/mWLRxjL3FaK5KoTts+0b6mcBDH3fQaHPwiQsEtL73r50gey9el+VGWdFqwbuCCUXogzjAa4q1YBw3TJPMHqyW2by8AD24aq+Qc1IoerHDKAYWNEtGuAkQjGrQa/h4OHf2KCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blJnPw8Cbv7NTKv/tCjS+UA0LM7LR74EpRfpghBblvI=;
 b=m+zf8cwmADMGdx4pTxZ0wE4U00gTrcdlpc5tGpvH2BqEVZQ8fW6vEMc3J/jED/Mw4lEgy8B7izwGkLNP6ehfalUDlbeyKt52DiEcNhth807nHXoUA9QNZueLgK2QnDLWeCna7fxQCe7iIY5qOxVZVW5muaxyijEOVnOH8vU33dULPm60IJVEBWYa1Yu7vG6mBZMlOqAd36ky8CtTfsjnfZOERuF35uMC+pANZMiBeU7vsOQGiLepr7bgqOO5VlI+Wjo5Kav5q2MJZGnOPaphSg2NFmR9ExiaPN5vCaF1B1LYqGfE+ABAm/rjznE+6FcXrPJ67Y1VEC0joMeEVaFNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blJnPw8Cbv7NTKv/tCjS+UA0LM7LR74EpRfpghBblvI=;
 b=dbeSi6STufuore/uCZCwmLpMBH+hIk9fVBTPFIRVV8TXrK2fHgRsjcr6j8fkCbPAHT4x5uBfIbT5XdIr5MY4M4rrfrJY+Aovp5sacnvbqS7uCUCKL73y9bF7HE3qVopxD/VBzlLN8lZB++PORCm+RikG4HigNXeVXD/92uqzOpo=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Fri, 1 Dec
 2023 10:26:44 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 10:26:43 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Ivan Ivanov <ivan.ivanov@suse.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Oliver Neukum
	<oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index: 
 AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGAgAegwICAAByPAIABdJ8AgAAvCwCAADDCgIAEb16A
Date: Fri, 1 Dec 2023 10:26:42 +0000
Message-ID: <079ddad4-ab41-49ac-6d86-d90075320dcd@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
 <ZWWsGknhNuVggNNa@apocalypse>
 <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
 <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
In-Reply-To: <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|SN7PR12MB6672:EE_
x-ms-office365-filtering-correlation-id: 5f5a0e6d-cea9-4eef-6173-08dbf2580355
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dv1cc5xty16oyEKnJoXv6vCYCvtQENDfWIPpZIuF1J1hD7eVrScIe5Rgo6ejgLkzIL+8Ax+RSPcxf66gmmdDUH/Nh0Ucnfyo+oT5H9jA0I+9mAQhQ+TRtwtz7WEJY8smBFxtsB1Y9uohqdfvyeGcwh+pTAKEhHDJ/4qFUyisO7sd2jbdyQrCAxJK1z1FPjnfZyx9jxLgRRhXovpGNJPL24gKrXXcb0r8FPkSvg4StkkQ1YCn2EpPK+oWoVSjrRG4aHA7s52l5NxuTw+5zf0emwlpeqC/JfjjWtxcPPg473bh2HgNg8k5mTHr39VwPa83nc2Ri+OqBXBQhMvHZPjQXpZ4BmGb7+PZ5gb85a20ZG5Kr/W6yeNwLeUxW/jEj7WAEphJePXlNRL7K0QZVvdQ2nLCwxf7HAZYKoX5x98AmaOcpsee5nOq/HXcYDntoXf+ZDhKipoOMbtWqKkEr0WUxGe6XY/JXDwrjbCO8CFKllfpMKPviBs2hqTEOV7nA2alyBovF2bYf+IeX/eE86x7MA5/HAMQC0ZbpNph1I1rGt8pOyRCqJBhMMHdzHB3tYDUKXLW8tf0JH+RarqJ3aop6DnP4GDHoPTn9UEZSKo5lqtgIRpHpy/UR/ojTVhvNPMsBG+l/kNOcqHsyfN+O76k9wOnodOnQPnlDcokC7Y/1G34KsBVc7J3tJouSIc4TEcE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66574015)(38100700002)(122000001)(38070700009)(31696002)(36756003)(86362001)(66946007)(76116006)(91956017)(4326008)(8676002)(8936002)(54906003)(6916009)(66476007)(64756008)(66446008)(66556008)(316002)(5660300002)(4001150100001)(2906002)(31686004)(6512007)(53546011)(2616005)(478600001)(6486002)(6506007)(26005)(71200400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MEpBbzYwRGJTVWp5UHFqdnVkNkNmcllqeUJsbWJFMnRwWmN2U1JySHZlRWg4?=
 =?utf-8?B?SnlLT3lzY0U4MlFLVVVTUlhZd3Q5ZVBMK0VzZ0tMMEgyUWxpWGVkQWdEUmR5?=
 =?utf-8?B?Mkk5SHRyU1VpWGtUU2lhaE52U1cxaVcwT3dxSjlwZTdFTFRlY2labTFYM3JY?=
 =?utf-8?B?Zzl6SnVYT1FVMkEyd2tlTFF3R0dTOHZyT0ZublhQYTF1REVRYm1PQkNkdTly?=
 =?utf-8?B?MEZmcldVS29SYnNLbFQ0dU1hSThGSUVsTFU0TWhaeDM0a2w4NTRla0pGQkVD?=
 =?utf-8?B?MytkaFg3N25PWjRmZmVjcFNJdlZMWmlrdmg1Y25VdWY0VTMwV2VIc0diOWNY?=
 =?utf-8?B?dXp5U3R5Znc2akljeWV5djBnVnlhbWdjK1ppTml6SHBpenljamYvTjc5ZXoz?=
 =?utf-8?B?TVNjZk9MelNCSnZ6Z2V6YkljQzZMdGI0cGZHSCtaYzRjZTloZUJrQ2h5WHls?=
 =?utf-8?B?RXVsN0w2Vkp1cU5LeFNSaFN4WngxVkp4RnVjR3dEdkRVN01XZE9ndUcrMklD?=
 =?utf-8?B?Z1R6aTVVQjhZQWRiSWtDV3ZndUNEVnNOWEJmckovWVRHdVFzbUFuZ1JzRHRO?=
 =?utf-8?B?VkJIaVdRaXNBQmVrNzZtbkc0YmQwMmdmUU52bUVjc1R0ZE4vSi9Ma0pyekVm?=
 =?utf-8?B?VzlZbEEzWEo5ZEFUL1RreVRtcUYxbG5KeVFJbGxackx6S013OWJtK3lkcXZP?=
 =?utf-8?B?V2lkZ3VjTElHd1BVTUN3dTdmZXg2anNhZW1zcjhvbTIwTnhBWWtSVlpHM1hT?=
 =?utf-8?B?cm1PamVFNCtPNnNsTmpyTVR6azF5V1Q3eGhQVjVSdDZsNCt3NzdnVU9oREZY?=
 =?utf-8?B?djFIQlRnNUlKaUxQNWdRaDJDTCtkWVAvbnhSZm12NDZnUTV5RFJZWm0yalZr?=
 =?utf-8?B?MmlSUTdMYVZ3dGVVSkxFVkpsQnY0bjJwTWFKSjcrRUVZR3V1cUV1c0pZSDRO?=
 =?utf-8?B?SW43ZEtsZCtmTFVxUWJmQ0xlcGFWSmZQOE5ZNjR5aGtDdEVJa1J0MnRVVTFX?=
 =?utf-8?B?TmN1NXBlMXlwQW9Ed0cwVjlZZTF3aGFSVTFOWmxrWEdZaU5pT3FDdTFSVzRw?=
 =?utf-8?B?ZkQza0Y3UVRrNEpLelhBWTY5ekhROG1TVTFLRk1KQUoyWlBKRG1FdEk4eVky?=
 =?utf-8?B?clV5SVNvbXcrQXNPNkpEOU91NmZ0eVlNb3pQcnNVOEw1V3o0Q0w1UVV5dVlP?=
 =?utf-8?B?ODlDNWgxcUF2Y1dLQWt4bkVLNGo4bDkvSE81TDgyTk45Q0dUODMzUkZMN3VZ?=
 =?utf-8?B?WHgxYyt6V1RTaEc0NXJuak5VY1VHMW8rQ3NsejUwRlI5ZkRnMEJZa1J5clZu?=
 =?utf-8?B?U0wwWHZOeGh0eElhc2xMdkpPbGFWM0RzTlVWK1oxY2RXN2ljVkpPRWV1eFBY?=
 =?utf-8?B?YVpZaTBFb1ZEWC9oT1lzellGcDN3a1RNb0dDWEJobkMyUXRsK2FwRkExRE9C?=
 =?utf-8?B?Sy85TG5XV3lHWVgvdG5jMmV4dVJPTGdkVGRzbSs5endKNHJBS2FSZnlTdlNX?=
 =?utf-8?B?TURreGdMUXh4amM4UFZEWkhwcmxTemRBdmVHWVpSbEZVK2tubVEzSDhqbHps?=
 =?utf-8?B?eUR4K2NLd3hJeXAvM3hlOHBHNXdmU2liYVRvUTA4MHQzOGpwa3hvaVNIZjlZ?=
 =?utf-8?B?QzhtOHhPQXdrS01jNTBOU21wcGZ0SWJGQzVLc2JGSHBIbHhhclNrVTl0MnZi?=
 =?utf-8?B?b1NPaWM5cStLOHBwbFV4eWk3QlkzdmVvNE5sVlhMMTVzckxLVlNYRDVNeHJm?=
 =?utf-8?B?YlZoNGhxVm5TTStTdjVuQUVKVDJXVkFjd1lpQjVMaE9ja3lWS3Zna2JIWUxP?=
 =?utf-8?B?VWxiZkNOamVrTUtkWXE2WVVrYnIwZlY1N2hzNnlRKzF5NTZ6VC9WWmxtZlZ6?=
 =?utf-8?B?dHl6ZjNJOWlUMEZMcldET0dST2NPdHBrYjN4d1A0dXc3WXhwYVRTZ0lQM2Vm?=
 =?utf-8?B?NXlrckV2R3VHRXZsaTE1Vk82STBtMFFwbmZ3OEM5a29aVFhzVitXQzJaMU1t?=
 =?utf-8?B?eXQ2dmpnUVA2SWZ2a2hFMjdyUytsV21aKzM4OThpQTNzWFB3Z1ExeFJXQkhy?=
 =?utf-8?B?bU9yV1NRN1dEUGdPb0o2dHlYYlhKYzhuQXZvd1JNeXJhckdZS2FCNWRwSC9F?=
 =?utf-8?Q?YeK1YvlUyBI3xRQmnygBFRHtC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C58CDE86DDDEA14B99D143A6E2C95C72@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/n1NIZQMSa3OgeDsm645KIPVVbOpIdd+qlMs4BDzOMdZzhSANZTRmavf3F9PtKqE6XtIp0xwWKCemMteT8mLYaM/x6HQcr/offU323trwF+n+t9y9StR46E5gk1GgqOkx+yIvni0bohEmaRS8gb0uspriK8w/816+meqyldVsw/3tpEVfEQEORPIdsS6TYvoEQt3ZSyZdfQfeR8vJHzR2/TOerrVMdcDWKoiBw8HSFS2UcLM0gvjbRh6uNyCHPACoGnvWjg/GkCfbKtV7tOIMHiJcWkEEiklDTPt+xeAV8dUPRflqVbf5Ep6q84ZzIvFO2e1MV/gcaFyukO3Z82ye50aZ9cGR+JOhy/VO0Pv78AUbsbMydRxNrDqjoV/7IDB1H+1AUrknRbhXgmImM9Y4+Wk6yB46lwbhF3ETP/RN9ZdJeZvtrPbAgiJLbHGxr7Jq+1AcaoqouGs6bsjZUZpL2FUTMZMuVVIjCbW7CJq6lH9DIWPsIserNBFJcbKjDnfs1Ld4VVsqv8hh2UiavDw2qaL+oRT//UGdoneXcy7FmO3+I7A49OoC0IVElm4KmwDPIT4rtMkZSXI0I0FtPbdq7lyCFsJ6XlLv5A3WFDMMajH6KBvX/et2Ss9owd0LS5rwDpJiTMwVU4VxCuS0WZMWFRRJRE6Utfk8lTsEtZpxSMjRte0T8lq2XwKINCWUvVg7pvMgaL6BEF1AdX3eWR63B2bL0IdfAETovGFihU7JoKHNC/XDQL0AG41OGiUFp3QvyTJW4Eeaye81PGoDJeybaj5kW/U7Mpbm2TA39wvAKPnpJo+bH35d+Wj2Of5tthzmHUwwhtnMgg/vNAwfG0Mt4WT5P/ur3PYpSXMp0EpuE15fmDIWnt20U7h8xWsFrWn
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5a0e6d-cea9-4eef-6173-08dbf2580355
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:26:42.9662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kk/ouhgxuCF7NNMiK+6V8U/97SIToBCCsKQ9FU24tnnoHeP6yT0l3n1DAFhTEOaRCCX4CZKeBBZD+xL2WFakpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672
X-Proofpoint-ORIG-GUID: DtLYtFZBqg-EugUS4WJdZts-Ni5ZhRiC
X-Proofpoint-GUID: DtLYtFZBqg-EugUS4WJdZts-Ni5ZhRiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_08,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=727 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010068

SGkgSXZhbiwNCg0KT24gMTEvMjgvMjMgMTg6NDMsIEl2YW4gSXZhbm92IHdyb3RlOg0KPiANCj4g
SGkgTWluYXMsDQo+IA0KPiBPbiBUdWUsIDIwMjMtMTEtMjggYXQgMTE6NDggKzAwMDAsIE1pbmFz
IEhhcnV0eXVueWFuIHdyb3RlOg0KPj4NCj4+IERvZXMgdGhpcyAic3B1cmlvdXMiIGludGVycnVw
dCBicm9rZSB5b3VyIHRlc3RzPw0KPiANCj4gSXQgaXMgbm90IGp1c3Qgc29tZSBraW5kIG9mIHN5
bnRoZXRpYyB0ZXN0IGNhc2UgdGhhdCB3YXMgYnJva2VuLg0KPiBidXQgcmVhbCB3b3JsZCB1c2Fn
ZS4gWW91IGNhbiBmaW5kIGNvbXBsYWlucyBhYm91dCB0aGlzIGVycm9yIG9uDQo+IHZhcmlvdXMg
aW50ZXJuZXQgZm9ydW1zLCBqdXN0IHNlYXJjaCBmb3IgZHdjMl9oY19jaGhsdGRfaW50cl9kbWEN
Cj4gYW5kIGl0IGlzIG5vdCBzbyBkaWZmaWN1bHQgdG8gcmVwcm9kdWNlLg0KPiANCj4gV2l0aG91
dCBkYXRhYm9vayBJIGFtIG5vdCBzdXJlIHdlIGNhbiBjcmVhdGUgYmV0dGVyIGZpeCwgYnV0IGlm
DQo+IHlvdSBkZXZlbG9wIGRpZmZlcmVudCBzb2x1dGlvbiBJIHdpbGwgZ2xhZGx5IHRlc3RlZCBp
dC4NCj4gDQo+IFJlZ2FyZHMsDQo+IEl2YW4NCjEuIEluIGFkZGl0aW9uIHRvIEhDQ0hBUnggYW5k
IGVwX3R5cGUgcHJpbnRpbmcgcGxlYXNlIGFkZCBwcmludGluZyBvZiANCkdSWEZTVFNSIGlmIEVQ
IGlzIElOIG9yIEdOUFRYU1RTIGlmIEVQIGlzIE9VVCwgYW5kIHByb3ZpZGUgZG1lc2cgd2l0aCAN
CmVycm9yIGNhc2UuDQoyLiBJbiBmdW5jdGlvbiBkd2MyX2hjX2NoaGx0ZF9pbnRyX2RtYSgpIHJl
bW92ZSAiZ290byBlcnJvcjsiIGFmdGVyIA0KcHJpbnRpbmcgIkNoSGx0ZCBzZXQsIGJ1dCByZWFz
b24gaXMgdW5rbm93biIuDQoNClF1ZXN0aW9ucy4NCjEuIERvIHlvdSBzZWUgaW4gdGhlIGRtZXNn
ICJUcmFuc2FjdGlvbiBFcnJvci0tIiBiZWZvcmUgIkNoSGx0ZCBzZXQsIGJ1dCANCnJlYXNvbiBp
cyB1bmtub3duIj8NCjIuIFlvdXIgZHJpdmVyIGJ1aWx0IGZvciBIb3N0IG1vZGUgb25seSBvciBm
b3IgYm90aCBEZXZpY2UvSG9zdD8NCjMuIElmIHlvdSBidWlsZCBkcml2ZXIgd2l0aCBkZWJ1ZyBh
bmQgdmVyYm9zZSBkZWJ1ZyBwcmludHMgZW5hYmxlZCwgDQppc3N1ZSBzdGlsbCBzZWVuPw0KNC4g
QW5kcmVhIHdyb3RlOiAid2UgYXJlIGF0cnNzIHRlc3RpbmcgdmlhIHBpbmcgZmxvb2RpbmcNCnRo
cm91Z2ggYW4gTFRFIG1vZGVtIGF0dGFjaGVkIi4gVGhpcyBhYm91dCBVU0IyLjAgcGluZyBmbG9v
ZCBpbiBVU0IgDQp0cmFjZSBvciBqdXN0ICJwaW5nIiB1c2VyIGNvbW1hbmQ/DQoNClRoYW5rcywN
Ck1pbmFz

