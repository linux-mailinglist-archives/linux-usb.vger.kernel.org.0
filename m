Return-Path: <linux-usb+bounces-2023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFD7D197D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 01:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4063BB2157A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0B5354FB;
	Fri, 20 Oct 2023 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="APLWNHK9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kY++QD7q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T9dIbAIh"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BE1A71B
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 23:11:22 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1D0D46
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 16:11:18 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KLXk97001073;
	Fri, 20 Oct 2023 16:11:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ymL1gnnfr4xp0SwkzOIOSApVmRG9ab0FR7J74iRHSz0=;
 b=APLWNHK9b6JAnkyamyw8qPPDqV7CGfBNlwTPArr1eXrJM/j611R8UKYPZD6REvKvPH1h
 AsKNpDulox7dcILmwkRkQ3Qv9NEKhVCgGLpiyV2r75xv8aED/w19Qu+bUl2AGNyYJ7m4
 i+Dc7lwZF8teRETHRasJClKqxqaFCSrb+MEmS8BVls9FrmpQWAsoOiJScUnLIuX9fpri
 MccBeQLnVRlkhAQbJIxlAepLEifIsEW92WpryIzVKSnAl3Ewj4QvNbp6/4F3VT78apzC
 FpPTUBowSjDMetNlv5Bpf11DY7igDhMzp+fhHP0rbKVf5m3WH8FXi68gg9leRJ2zkD6z +g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tubw3kwyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 16:11:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697843473; bh=ymL1gnnfr4xp0SwkzOIOSApVmRG9ab0FR7J74iRHSz0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kY++QD7quVfT13gLwtzTK3aCfSZggtDSphXGhwqo6btoh3xsfwjPyOd+ikkdrMRcr
	 ccN0vzfZ+E+h4wDoP5dnfq+prmi9L8/TCb0cKAiAUiMvHUJl7n7A2fHg9O0nIOicnQ
	 TxgiMXZY4K8HneFMQ0Joi980tcAsogwlk5mj5ft4qdjCz5hRNLU7Q13nB5aR2Ke7Cy
	 gvIoyGTl8FAQzXnZjDhcgccURYarUh8YrGuZGWpSh54HnPubygJEOh2ukt3Zcbzrl4
	 MenFI7ZJy8kehf7qgZlQiwOKnJ+sUxf/6CBb485GRyU1IKe1JsMQx5sCCaRnTkkguw
	 yB60hEZC4wiYA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9BAF040565;
	Fri, 20 Oct 2023 23:11:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AC25CA0081;
	Fri, 20 Oct 2023 23:11:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=T9dIbAIh;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BCAF640357;
	Fri, 20 Oct 2023 23:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igiGP6lyDvnquGU9u1/TH5+z+esyzCT8oYaOduYGaI/WgdvueeRE6Mc4RmhsGPAIq99RxWH9sT6NPc40wPnlrM95+RrBEdIwOqGVd4+zqgM+hkcfLkTLZqxVzitfSmis4n9323lSH4g59wHyzQVWK+o6Jfr1BVSZkFLJsZvhv62FdkH/96f51HKTXAZJlq8rUn5LyFrKzC190yY+Wa2Xxvge2eZYLC7qAqzhsNV/ra6dv9i6OOTRHPTuoXbTlbb893ccElMx25PjAeyNTjmIQf55dEg0A7hgTzgKwCcrh/PRTf/JLyfnOOLFW30RzFHXJttRCNRRSMTvnCrQtBhmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymL1gnnfr4xp0SwkzOIOSApVmRG9ab0FR7J74iRHSz0=;
 b=n+6dXzFfQ8phP7lVHN6ryK4oBjoV2LJTn3FkQwMrP0WwzNVChGACTqW9DZZTga4Y48NuPr/ptH4qpR6v9yddqQSq/eWswCH6jxO1rOQLSuXrFj8ynvZJi0cZMUfZK+CPiCdIAbU5t8HLAcJ3bgRIW/vh2GwEDlvulxoElbTajr7xzmcTDiVF4/HWonz51weQUooi1zpQgvpc4cU+FBJJgJCKKapmGcq2L3SbaU2iXOEEFSXeglLVAYmB1/u2saPHKxjngVBjBB+gzGi5ijbZ88l32FdpPKhHfDtCEzgsu24kLQtbQrzJe4+7tqQde3HWcTj+82H/k2IINPp5S9znzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymL1gnnfr4xp0SwkzOIOSApVmRG9ab0FR7J74iRHSz0=;
 b=T9dIbAIhttzp5VKfMkW4pDhJZ4hL58YTCdF3WFQ6skaFMdN1m0uUvsFZiPeT1PcT1IN60jOYUrJdiqnuT4MLK5ZZsG95W2UFMMlUDWcSrnOROSbCTxtIyiO7cgcvMJGz8ebNq+Ls/q/NLZLFtMsuifbKT1+10xAnuGqKhtgUrsc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 23:11:04 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb%3]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 23:11:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ladislav Michl <oss-lists@triops.cz>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Thread-Topic: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Thread-Index: AQHZ/UD3pAn64kboaEKjcKPKLnMEgbBGuvAAgABzbICADCx8gA==
Date: Fri, 20 Oct 2023 23:11:03 +0000
Message-ID: <20231020231055.j7mhpp65t2umacut@synopsys.com>
References: <ZShGmL4mph91Ncib@lenoch>
 <20231012222328.ts3z3csvxi4obkig@synopsys.com> <ZSjSs5vLutIDU2MO@lenoch>
In-Reply-To: <ZSjSs5vLutIDU2MO@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB8553:EE_
x-ms-office365-filtering-correlation-id: 3f39d2af-0cff-473a-8384-08dbd1c1d539
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XG2GJjPuPr1IAtTJGjrF0KTS8ZKCv9kn3nLuUxngfOkaSX9PeDBz/YvKrfJwRSKzodgwtUCnrKQg636oFPJK9912A7ul50Q84EoxC2zdJSpfiE0vimy1w8cao2NTVa5kyBJdIujWNbpUDI00DYDfFSAUOR8hNiTYH6xqewL7h/WuirAoQQ0RRzc0HPSHGyJ4ktKo9Veq6x1RdBhbZO7cbuXYlPKu0ko/89MJGHvmuxmLvDi9ONXrJ6ve725j3oFLqIRTtQ/RzvDIGeVSl/7udpnL2zJGrkRsZNO7nxF5FcVYED/Q0mt0zddg9gvn/bpG7D5/utKZ25U6KueTtLvh5lNbRVEQGcFsASrW6a7BN9J0StaB11pWJ6m0qPZXSfTM30oswMQCEa/nk61Ct8VG+vjntN+RixN/9Y7/Vkxto3NjubqBifMMl8R/kJh+jd2zNvAZzo3DhN9Eg3RCG9wrq18xeAgW0zjhy8PNAhDQB5VFq3h3+/i4c2fM2E7jKRlUqCODIHfZQYaYtJNX1jpiYOAXuWB+VlkrNqwizUkWACiM3E7II20+JCPPfRz+TKMVx+sDonLsn4EquRNMA4hNvUNRF03Th2C39xNbacCdIA62qeSYMGJrTA0zJUXvcot6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700009)(2906002)(38100700002)(6506007)(4326008)(8676002)(41300700001)(36756003)(83380400001)(2616005)(122000001)(6512007)(1076003)(26005)(8936002)(86362001)(66476007)(478600001)(66446008)(66556008)(6486002)(6916009)(66946007)(76116006)(316002)(71200400001)(64756008)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QnJWc0o3ZmR5cTVVV09Qd1h5bTlPdHZGUk9Bbm8zY1ArMjR3L0lIQ0RocWU1?=
 =?utf-8?B?QXp3bTlOR3Vaajd6czZqbUI2M2R5S3pDSlBmWlFDNU12VVdTUU5wY0pQV2xr?=
 =?utf-8?B?Q2g2c0hVeW1DSE8zUTB2c2NyNlM5S1BSdzRzTjV6NkhUcGhjbHVwaDFwLzlE?=
 =?utf-8?B?dUw4eXVEVTdKMW15YVlXbnRyS09lcm84Mk9HWmtZaW9JYkVWaEZSWHNxTUV6?=
 =?utf-8?B?ZWxhVlBRdjNYUW5VczNqTDFFc3kzTk1MNHV5ZmU2S1U2MmR6RGkwL2ZRM1FE?=
 =?utf-8?B?bGEwVzZqNUxubVdkeGZTak5SbExmcVM0VlpxeEEwdFV3NURuY0hNd2dCcjZx?=
 =?utf-8?B?VWYrTWdCelduVlpIVXpoVHRrRTdDaWVoN2o0aEE3V1A5cjBTOFg2dXhFaENp?=
 =?utf-8?B?aW1oMUJUSEY0UFoxQStoMTZCZ0NvZjQwYmQ5N1FMQ0lRRmhhZk16bDFNNVIy?=
 =?utf-8?B?S3dFbm0zWmJCc0VnRFB5VVlCZ2d1cmpqMWlSeitjS3pFQTRtcXZwVFVGdmE5?=
 =?utf-8?B?UktRVGM5MmRyRDFwbUdtODR1aGpINjF0TFNINnlhaTByamdwUnVMbVVTSG9U?=
 =?utf-8?B?N0VubTVHUk1aOEZOZEVuOU1ubVN6L29VMEFpL3BTSUVMSDhPZmgyZXFzVWZL?=
 =?utf-8?B?TzNTdHNkd0VnaWxLWDhCTmhocXVLeGRHRlNNa2p5N3ZMeVBMZ2lBWld2SVRS?=
 =?utf-8?B?Z3BPeGh1RmlNQVlMdXhMOXJJaXFONmVVUFBBTXNEallqTXBtdms4NWFodkZt?=
 =?utf-8?B?alZUMnJxWHFxclhmdkhyR0pma3VnWnZra3dLbzYrcFRLazVZekRDRzZtMVJ2?=
 =?utf-8?B?MGdTQjFsaDB2MnNSYitrTWZ2VnZ4eHZVVW9LNnExU3JHTDBlaVFpRDdJL3VP?=
 =?utf-8?B?N0VwbEltb05mQmt1M2pQZjBjaHRsOFNQdUFUZHVRWWREcTVrWWtLbXk4WFM5?=
 =?utf-8?B?eWlFVHcvTGRpdlN6TTRJNGhCKzZ0SFJmLzM4REZ6SFlHYkVuVHJLRmZTNVlk?=
 =?utf-8?B?WmZnOCtEYjFPN1haUFBhMUUwV2w5eHVsT0xubFJJTWwzUW82K1plZXFIQUFT?=
 =?utf-8?B?WVc1bzRzekR4UlJueHRkMDA3Vzl1Y3JUV2tZOXpYVVk4WWppelVTYkhSa0Np?=
 =?utf-8?B?NTRVMzFwbWlaMVhNSU5KV0drSWVQOWdTb0JpZzBGRSt0MlNnV0h2eXI2NXNx?=
 =?utf-8?B?dlE4UWlvYmJ4UDZSUGxERFo2ZUJHTGx1U0NCbEJHNzI5dlVWeVF5bGJIS3Jl?=
 =?utf-8?B?MWNyaVVsOVBSQzhVamtTNktoN0ptY3J5N3d1NVZiVC84UnpPRlNURnF3eFNC?=
 =?utf-8?B?a2dYVm5QQjRtTUJVWGpPbkc3VldhazIyKzNNb1pURytRQkdDNllmemdHeEF2?=
 =?utf-8?B?WnRNdmk2ak5OV2VVT3dMUEhsRDlSWG5XRzQvaS9kT1FCZHpWdEZjSHFwbC9m?=
 =?utf-8?B?OGNqTVBUaGM3bDgyY1N4Qy9yajlTVDhHaWgyWldQUE1sbk9vcnhFWjM0M1FZ?=
 =?utf-8?B?VjhSaGJOc3RFLzVVcFVkaDRUSXk2K3dDaVpHOVRnQnBsY0RVZ1hhUllqNzFD?=
 =?utf-8?B?bkVCV243Z3FHdnRvanRGeDAzU0kwWWd2MUorOGRxdW90eldqc3V5ckZEdVNC?=
 =?utf-8?B?K0Zzd2N6NEJsWEt5RmluRWl4NFJIMEZQTy8rVXhmMEh6WmF1L2VneHpwOGtW?=
 =?utf-8?B?WnhmdlhSQmVUWXBYTnNnVWZUWXk2WUVLdnBCKzdsMDd2bDd0VWNHWUtkYWxm?=
 =?utf-8?B?MUR5YmE3MG1RaWs1dmlYSXFVZHowZTlVb1U3T2YrMkJBaGVPNmgxYTZQdWhJ?=
 =?utf-8?B?dkJQaDQ0TGhhTDZLZUk0cHJRdUV4WkNYY1Q0UWNiMGFVSGszaU8rSENDWS9i?=
 =?utf-8?B?Mm1yM3ZLTXdSUkxzUGNuUWJjMGVpeStHQlUwUzd6cDl0M3ltemtORk1uVnBC?=
 =?utf-8?B?SWZpd0twRk9mT3dkY2ltUHpNUGhXZmM2Qk9NM0xwcW1yRVpZRVdIRUZCNlVx?=
 =?utf-8?B?OXplNUdBKy9VSHZKQnVwWmM3QVdqSE1pd3JVNy9MT0d0L1ZVYjFMMVlteWJE?=
 =?utf-8?B?OEdRTis3UXZwWFFlR1FMdzhXOUxCVEJhNXI4MlFaTXdQUkZycit4MFcxMDVk?=
 =?utf-8?B?RXljR3pHTzlheG1BdHhpbTBiS1dLNFFzV2J0K1FIclFrMm90dGtadDNNZ0VO?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3134A96AE58FD0468A39FB3E4C808B3F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xkcHiivLLZK09d24kRm8xmHuCvcRXxhB8GD6SdYxvGs7OWPb9eYmclVD9PaZ1zHkQ/NvXIIyC6oolI7MnRbk3bBE07z/pKJ9SrtFAopH70MHPyOeb+zgsPnMai7PbW2HEUrQXoCAGjwsCJ4N+7aoviu5UDUraI13pdZ/vKxGbTgEPXtOwjhBtxD0AzGq7dfxPKNk1f/l2PFUWBpsPhyw3LM2OitLxOAt8DbGEQEYHF8CrEW0GJ5MWq1Ni9cf3KoGSLVjXDDbN6BrzRHry/m7mkjR10FVQmgCGKw740e0FkZ+abp+iX+5qLrhK6y+wlj/Cr1v49ah94zOdwDsVb9mGh8cROIeAQa1GUkf2Ruq+8OrEeDQTW1auklEL5SXXODcDtCD8QeNl/GBatQMM3V9JFgG4+aaONMdoh/Xb+7wOFjnZGLshhEr4HATXIUpKtcQejefQ9UGi5IBkwIp5aVcOA8j6xxx2YLJukkLh5By2x0rExuynmjRoEZZDllsD+fGa2yRMpkMs84psucmn0gwJ68ipXUgwLpqIuf1waD2/fTIlECfPmOlV18MtwsFeQ+9SgHX142Pw3iCwb4/TyMzW2uldjfWXRdBNaIsxPB9F4pe53cTvX3z6E5awvQGJOQ5PB2UG2g+KIUHqX5xZejMf77XIB3Qqq+DEjNWcQWa9N62lMxdc5vAWEEZ68Z0Be2j3Mvmg3ppVUb/kTt+g6lVi6W3Ryiie5d3PTh3rtOU4z9xUebsxnbEPzApZp4f/RjnCDSbM83v/6gpA1Qahzyjh8B+Vb9AeOHVLtUObGu64hf6ZRg/NH8xpPeG4FqFJWwK4smStjnUM19+GBniJ5RN9g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f39d2af-0cff-473a-8384-08dbd1c1d539
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 23:11:03.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QsGTa2UOkeHyZwzojkQnmh2Zy/bDKwhKREv5DDQR0iFxkLTp4izUzGnmjG+5kn4QEtuUCfa2h7J+rqTYypGJYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
X-Proofpoint-GUID: nhy5PSZJ1IdaXAdd0FidkEu2DfIOJyMa
X-Proofpoint-ORIG-GUID: nhy5PSZJ1IdaXAdd0FidkEu2DfIOJyMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200197

U29ycnkgZm9yIHRoZSBkZWxheSByZXNwb25zZS4NCg0KT24gRnJpLCBPY3QgMTMsIDIwMjMsIExh
ZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAxMDoyMzozMFBN
ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMsIExh
ZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiA+ID4gRnJvbTogTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxp
bnV4LW1pcHMub3JnPg0KPiA+ID4gDQo+ID4gPiBJbXBsZW1lbnQgd29ya2Fyb3VuZCBmb3IgT2N0
ZW9uIEtub3duIElzc3VlIElkIDI5MjA2Og0KPiA+ID4gfCBUaGUgVVNCIGhpZ2ggc3BlZWQgbG9n
aWMgY29udGFpbnMgYSBQTEwgdGhhdCBtdXN0IGxvY2sgZHVyaW5nDQo+ID4gPiB8IGluaXRpYWxp
emF0aW9uIGZvciBjb3JyZWN0IG9wZXJhdGlvbi4gSW4gdmVyeSByYXJlIGNpcmN1bXN0YW5jZXMs
DQo+ID4gPiB8IGl0IGlzIHBvc3NpYmxlIGZvciB0aGUgUExMIHRvIGZhaWwgdG8gc3RhcnQgY29y
cmVjdGx5Lg0KPiA+ID4gfCBXb3JrYXJvdW5kDQo+ID4gPiB8IEFmdGVyIGluaXRpYWxpemF0aW9u
LCBjaGVjayB0aGUgVVNCIFBMTCBsb2NrIHJlZ2lzdGVyIHZpYSB0aGUNCj4gPiA+IHwgVVBIWSBD
UiBpbnRlcmZhY2UuIElmIHRoZSBQTEwgaXMgbm90IHJ1bm5pbmcsIHBvd2VyIGl0IGRvd24gYW5k
DQo+ID4gPiB8IGJhY2sgdXAgYW5kIHJlc3RhcnQgdGhlIGluaXRpYWxpemF0aW9uLg0KPiA+IA0K
PiA+IE1pbm9yIG5pdDogQ2FuIHdlIHJlcGxhY2UgInwiIHdpdGggdGFicy4gSSB0aGluayBpdCdz
IGVhc2llciB0byByZWFkLg0KPiANCj4gT2suDQo+ICANCj4gPiA+IFBMTCBpbml0aWFsaXphdGlv
biBjb2RlIHRha2VuIGZyb20gQ2F2aXVtJ3MgdmVuZG9yIGJvb3Rsb2FkZXI6DQo+ID4gPiB1LWJv
b3QvZHJpdmVycy91c2IvaG9zdC94aGNpLW9jdGVvbi5jOm9jdGVvbjNfdXNiX2Nsb2Nrc19zdGFy
dA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGlu
dXgtbWlwcy5vcmc+DQo+ID4gPiAtLS0NCj4gPiA+ICBOT1RFOg0KPiA+ID4gIFRoaXMgcGF0Y2gg
Zml4ZXMgaW5pdGlhbGl6YXRpb24gaXNzdWUgZm91bmQgb24gc29tZSBDTjcwMjAgYmFzZWQgYm9h
cmRzLg0KPiA+ID4gIFdpdGhvdXQgdGhpcyBwYXRjaCwgY29udHJvbGxlciBzb21ldGltZXMgZmFp
bHMgdG8gZGV0ZWN0IGRldmljZXMgY29ubmVjdGVkLg0KPiA+ID4gIE9yaWdpbmFsIGNvZGUgY29t
ZXMgZnJvbSBDYXZpdW0gcmVsZWFzZWQgdS1ib290IG1vbnN0ZXIgcGF0Y2gsIHdoaWNoIHNlZW1z
DQo+ID4gPiAgdG8gc3VmZmVyIGZyb20gbWlzdGFrZXMgbWFkZSB3aGlsZSByZXNvbHZpbmcgbWVy
Z2UgY29uZmxpY3RzIHdoZW4gdXBncmFkaW5nDQo+ID4gPiAgdG8gbmV3ZXIgdS1ib290Lg0KPiA+
ID4gIFRlc3RpbmcgcmV2ZWFsZWQgdGhhdCBvbmx5IHNpbmdsZSByZWluaXQgaXMgbmVlZGVkIHRv
IHByb3Blcmx5IGxvY2sgUExMLA0KPiA+ID4gIHRoaXMgYWdyZWVzIHdpdGggY29tbWVudCBpbiBD
YXZpdW0ncyB1LWJvb3QgY29kZSwgd2hpY2ggaXMgY2xhaW1pbmcgdGhlDQo+ID4gPiAgc2FtZS4g
SG93ZXZlciwgc2FtZSBhcyBpbiB1LWJvb3QgY29kZSwgcmVpbml0IGlzIGF0dGVtcHRlZCB0aHJl
ZSB0aW1lcy4NCj4gPiA+ICAoaW4gY291bGQgYmUgZG9uZSB1c2luZyB3aGlsZSBsb29wIGluc3Rl
YWQgb2YgZ290bywganVzdCBsZXQgbWUga25vdw0KPiA+ID4gIHdoaWNoIHdheSBkbyB5b3UgcHJl
ZmVyKQ0KPiA+ID4gIFNvQ3Mgc3VmZmVyaW5nIGZyb20gdGhpcyBwcm9ibGVtIHdvdWxkIGZhaWwg
dG8gaW5pdGlhbGl6ZSBQSFkgYWJvdXQNCj4gPiA+ICBzZXZlcmFsIHRlbnMgdGltZXMgb2YgdGhv
dXNhbmQgYm9vdHMuIFRoaXMgcGF0Y2ggYWx3YXlzIHJlc3RvcmVkDQo+ID4gPiAgZnVuY3Rpb25h
bCBzdGF0ZS4NCj4gPiANCj4gPiBXaGF0IGtlcm5lbCB2ZXJzaW9uIGRpZCB5b3UgdXNlPyBQZXJo
YXBzIGl0IGhhcyB0aGUgc2FtZSBpc3N1ZSBkdWUgdG8NCj4gPiB0aGUgY29tbWl0IGU4MzVjMGE0
ZTIzYyAoInVzYjogZHdjMzogZG9uJ3QgcmVzZXQgZGV2aWNlIHNpZGUgaWYgZHdjMyB3YXMNCj4g
PiBjb25maWd1cmVkIGFzIGhvc3Qtb25seSIpDQo+IA0KPiBQcm9kdWN0aW9uIGRldmljZXMgYXJl
IHJ1bm5pbmcgNi4xLnksIHBhdGNoIHdhcyBkZXZlbG9wZWQgYW5kIHRlc3RlZCBhZ2FpbnN0DQo+
IDYuMS4zOCwgdGhlbiBwb3J0ZWQgdG8gNi42LXJjNS4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBSRkMg
d2FzIHRvIGZpZ3VyZSBvdXQNCj4gaG93IHRvIGhhbmRsZSBzaXR1YXRpb24gd2hlbiBpbmZvcm1h
dGlvbnMgYXJlIGNvbW1pbmcgZnJvbSBOREEgZG9jdW1lbnQNCj4gYW5kIGNvZGUgaXMgYmFzZWQg
b24gdGhlIG9uZSBjb21pbmcgZnJvbSB1bnB1Ymxpc2hlZCB2ZW5kb3IgdHJlZS4NCj4gDQo+ID4g
RGlkIHlvdSB0ZXN0IHRoaXMgYWdhaW5zdCBHcmVnJ3MgdXNiLWxpbnVzIGJyYW5jaCB3aXRoIHRo
ZSBmaXggZm9yIHRoZQ0KPiA+IGFib3ZlPw0KPiANCj4gRG8geW91IG1lYW4gInVzYjogZHdjMzog
U29mdCByZXNldCBwaHkgb24gcHJvYmUgZm9yIGhvc3QiIHBhdGNoPyBJIGhhZA0KPiBub3RpY2Vk
IGl0LCBob3dldmVyIHRoaXMgcGF0Y2ggd2FzIG5vdCB0ZXN0ZWQgd2l0aCB0aGF0IGZpeC4NCg0K
T2suDQoNCj4gDQo+IENhdml1bSdzIHUtYm9vdCBpcyBhbHNvIHJlc2V0dGluZyBQSFlzIHNpbWls
YXIgd2F5IGl0IGlzIGRvbmUgdGhlcmUsDQo+IGJ1dCBJIG9tbWl0ZWQgdGhpcyBjaGFuZ2UgYXMg
dGVzdGluZyByZXZlYWxlZCBpdCBpcyBub3QgbmVlZGVkLg0KPiANCj4gUGxlYXNlIHNlZSBkd2Mz
X3VwaHlfcGxsX3Jlc2V0IGZ1bmN0aW9uIGFuZCBjb21tZW50IGFib3ZlIGl0Lg0KPiBXaXRob3V0
IGhhcmR3YXJlIGRvY3VtZW50YXRpb24gSSBjYW4gb25seSBndWVzcyB3aGVuZXZlciBpdCBtYWtl
cyBzZW5zZS4NCj4gDQoNCkkgaGF2ZSBtdWNoIGxlc3Mga25vd2xlZGdlIG9mIHRoaXMgcGxhdGZv
cm0gdGhhbiB5b3UuIEFzIGxvbmcgYXMgeW91DQpkb2N1bWVudCB5b3VyIGZpbmRpbmdzIGFuZCBo
b3cgeW91IGNhbWUgdG8gdGhlIGxvZ2ljIGZvciB0aGUgcGF0Y2ggYXMNCnlvdSBkaWQuIEl0IHNo
b3VsZCBiZSBmaW5lLg0KDQpJIG5vdGljZSB0aGF0IHRoZXJlIGFyZSBkZWJ1ZyBjb21tZW50cywg
YW5kIHRoaXMgbG9va3MgbGlrZSBhDQp3b3JrLWluLXByb2dyZXNzLiBXaGVuIGl0J3MgcmVhZHks
IHBsZWFzZSBjbGVhbiBpdCB1cCBhbmQgcmVtb3ZlIHRoZSBSRkMNCnNvIHdlIGNhbiBtZXJnZSBp
dC4NCg0KVGhhbmtzLA0KVGhpbmg=

