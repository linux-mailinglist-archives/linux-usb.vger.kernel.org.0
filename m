Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50ACA707F13
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 13:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjERLWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 07:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjERLWt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 07:22:49 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD2510FB
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 04:22:48 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34IAgke6015262;
        Thu, 18 May 2023 04:22:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=EFQids3Z8x6RirvtcyZqNf93NnywOf/fNi4yOEBUMTs=;
 b=D0muX6tqCcqVMrwz8La+VrAhzT68ZvOIjAhpKmnZw22wPnBwTU90B50mqW/YNwjFlXyG
 5+pk3ce/hUy2OuuslN5/hVtQP65YtBuVFMsfBUA8EOg1YgG7biMu3O/dA3ALOvaCwY4u
 etnlvmI89m1sFYIvfZQK7yA99Of7cV4/ouoYLtmAHZupp6UZ8jMmriksBrne+XWNJqZK
 Xmog+5Pw/V4+xmjD41XGhxzNsUiF0pVGr644bw/T5sdg2H8K5heeynN6+7GNKFQpcLpo
 U4HN1ktXtFMiMWmaeHTagD6o66KvCC/HISEF9KtRVPK8gHgQs+SYqcJ/a2WsmTsSrNSa 0g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qj9t50ryf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 04:22:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684408964; bh=EFQids3Z8x6RirvtcyZqNf93NnywOf/fNi4yOEBUMTs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ECBX+/N7temgpPGgWTAK17kZ/MfiueUeM7GjhPyEzXdVQyillkXNoROLuhB4PSg0F
         teYifCGv0NzZskPBgh5gn+MnMX0M7SHSo1P61L4BUNlxLIhdzwmbHdOIPsyHjzi99p
         BLb7FjhQm0W19IcXUBOEH1WccxB/5daaNHUqjvVjAx3qObOyWW6x6zLE8ehPqUf/OJ
         sNU6JA8695w9Bnre5JEUeEMticj5cesIkIpRtpHvCcfONb4og5Na8bFTMcyC38r+di
         qOv4sTFmYT+d+qbAwnqdPjIEM6qsFxZW0T69X66ccbFkFMkpOoTnIjN1kriE/mlkjN
         Y468lxicKbalw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3506840408;
        Thu, 18 May 2023 11:22:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C4BE3A005E;
        Thu, 18 May 2023 11:22:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UsyJ26Ji;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2E8FD4045D;
        Thu, 18 May 2023 11:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgVWLOIIID3MgCNeULT0jrI921jMhQCe5NL/5REMb9LiKi9Ro4US6+Fhb9pY6S8UFA2ku5r+N/GpidaGZMEiWQSU72H1LKY3BfJGC2xXTp0G1OSwYIoTACf0BSNFSBOEyHDFsbTzjzpyHWYqMaQvsHsnCnZOOFrA/IIUCKTh8D3a/y5V5DjnolCZ/vwnFHA4U/zm4t4Dex4urXBT0w8cIB2Ah/RNUAIFitRkOuQBFu13grUSHEAtq7RMpuf3gsZRSIeK+WpNuB11NaOebJDjOY61V8j8DIeX4Iac5nc06y8JBR2Yxn15xKSAs6WiVNj+4cZ2kyqFKZm8V9Ew3fe1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFQids3Z8x6RirvtcyZqNf93NnywOf/fNi4yOEBUMTs=;
 b=EL99ro96R8/8vySfHNVzvKLF7IcK1TPQ2Z5Fu7EwHrgscul2hJHwVNzqNyxJf3eZXbgyQi88mELpZB2DLMlt/6w/ETi/+5zLBwF/GuUVKX0QWCZw6XpfpJdJ+uKLWQDBxjf5kNXziIZgYlzdJPVw0eY89SsBu2/iwX5R07DngksyE3sWEqh4r9CSOVcHA7EA6Vlk/VqzsI8xOOsXl42HxtXw85nkgwColc0wz29nXvsBgoVuKLYVtLXK9BNGtpHPwyPUouI3Fyrzfy7GFQNMQg8WeSJ+RqVsy+Q7mbFgL6dIqNdJDgkqM/s/oN2azTm8PvHTbx+uaj+DS5Q5puNQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFQids3Z8x6RirvtcyZqNf93NnywOf/fNi4yOEBUMTs=;
 b=UsyJ26JixOm1/HruF54oxrVAOINjrICilinaUDFfnCmRFA5vIEvZdvUBNQc7KRLpkuSzoMOCuN+o8ysJes41zmhuno9y5grhWGPd9DX67gh8BdHOo/UG7g26kzJIefloLaRKmLbmqvWF7RhU1exCrOM3ICSXaqSUvL1wwy7Ga1U=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 11:22:39 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::788d:db33:93b1:53f8%4]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 11:22:39 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     PALAK SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8l67bcCYwgACjvICAdTpx0IAAvFDpgABzRADRMq4GAIAHf6GAgADY0ICAAJzGAIAA2WQAgAER1gA=
Date:   Thu, 18 May 2023 11:22:39 +0000
Message-ID: <8159bfe7-8c3d-cf85-a02c-95162a4407f2@synopsys.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <PAXPR06MB85319DCC50F69D0790D5F4198D719@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531E23298F9BA26C1E651AC8D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531BF29DA170252843DD5598D769@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <PAXPR06MB8531D31F642598C1D9B8555B8D749@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <BYAPR12MB3399F12C79131BE0BEC2B9B0A7799@BYAPR12MB3399.namprd12.prod.outlook.com>
 <PAXPR06MB8531AB0E54440379049AD5D68D799@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <0f75819a-cf35-d66a-4a66-bc2ffb0d9526@synopsys.com>
 <PAXPR06MB8531E462D0CBF0F2AF996BD68D7E9@PAXPR06MB8531.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB8531E462D0CBF0F2AF996BD68D7E9@PAXPR06MB8531.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|BL3PR12MB6593:EE_
x-ms-office365-filtering-correlation-id: 69eb7d5e-0dda-469c-e4f2-08db57923084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SAjrQer1QjsEjBoZQ7Kd6y7autNZ4+RJGdcKGrEeScP+SvmWCTcnsiaNgU35tsEuK6LIqiVPsnODMS/eB+vWri6G1WcUQgDglJw0h2dZuspOMlxpXgacIpBCqJOp7V8n8pZhPRNfvblURs655SV/zbLJdC/aszjUtD800pVBJOd8F9xpyab9J/w64Jnbuju4+RbhoB0XOIszzgnC1zCGwM/PC0TFlNxyjPU+USU1ToE9RohviuoXay+pZj6vaHpI0ZsvrWeyvvGZ/h0aRWev2v7wUjf1ESZP9hJM7KM49+S2zzl6L5LvzRC9GF6vGqv6cgba0P1DE1PSjxey+6nDdpUEZ1vhMHZy7ALwFBWxZUQ8d7GI0Odm6VD3Z/fL0Rq9KmV+NO2IPOxOiHXI/K38eyD03aVg+myAcJTKzQ0zu98JLKdOZqtqzLf0p4cVIkBVthXFyyeZY4km3xDGxUn0AlNU+exGpKwefZncWVoPCDrwavw7fL5W2G60RKryDha144uN6J8FMVQsrdEkd16d0reFMnfsakthyZrkH/usB1LMPAwKdx5CLBe44Cjb6PWDT8ypg3mdRhyKeMDAAHZvc9k+L0YE2Y28j2Ew0zPXbWKQBLDWOlclgFxLUH51Qv9ohNVCgoJAhJZ5MUZxn1j5CrX929R4lPMjKzSGsqwzR1p+dn+g0NqUw1ImojGhcCwM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(316002)(2906002)(478600001)(41300700001)(8936002)(31686004)(4326008)(8676002)(6486002)(110136005)(71200400001)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(91956017)(5660300002)(53546011)(6506007)(6512007)(26005)(38100700002)(186003)(122000001)(83380400001)(36756003)(38070700005)(86362001)(2616005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dSt0OGV2b1Y3VlRuZll0TEtvRlFONzBGK0VPRDJtd0t1VEI4dmRwOWhKQXZL?=
 =?utf-8?B?U3pBMUkvSlpaeUtoblYrMG9abThkdzhnTGN5TFBLNWhWTjIzYWg2WUlzUncz?=
 =?utf-8?B?K2xSd2dUWWxIb1RLSlQrVzdpMm5Xa3dSUkRoV0oyUDZURkZvbGZNR0JsdlNn?=
 =?utf-8?B?a1E4d2I1YW9heXVuODNJaUtzbExqQTFueHFUNXYzazVhdGtuMkxsVGZUYzZW?=
 =?utf-8?B?VmxzOURldGViWnRZY0g5WlAzdEQwWjh5bGlRT0d0SERDN1J4L2FlN04vZE1O?=
 =?utf-8?B?NTJMVmdrcGhZKzBpdFdVVjJ5K1FZMTYrbjNQQ3JXakIrNlN6dFNmQ3ZaZFh0?=
 =?utf-8?B?eVJkdEhKbElpWnZqQ041K1NGbmVQZHJQa0M4YXR1OW1Ld2V0NE81SzRLR0VZ?=
 =?utf-8?B?SkVGVm5vdWJtNnZEeDBNbklpN1JjNTB1MDJWZHdFVlZBclNFaE1CeHY5cUVn?=
 =?utf-8?B?NTZIZE95cEI2MjU1dFl5U0w3Y0Q0ajl5RDRtMEFtZGR4bEZzOEN0K25NekVZ?=
 =?utf-8?B?NWMvN0kzYXl5bGdwN3lwT21DWmZoTFdaeGdFcDErdGl2TXcxcHdIdkJuRUdQ?=
 =?utf-8?B?MHkvTHZjVG5qdVNWNzdFRFFEWDRnVk9MYU5qaUhubzZ6YmdBWTdvSVgvMUdp?=
 =?utf-8?B?MVA5TUJUbVlncmJKZkRMRGM2YUh6aFVCR090TzJNbFB6bjlJOGJ2bDRUcGtp?=
 =?utf-8?B?dzlrZGhGZFZ0NEFObmdNSElPVE9tZFFMYlRPejhOcUd5YmxGU1RtVStHOG1P?=
 =?utf-8?B?b2lIcHZ3OTZ6YlhPZ0tiSEpxTDFaSTVwbXl4L1FKZGFheWJyeklONmtnNURZ?=
 =?utf-8?B?dE04RlQxMzFsczVTRHlIYlNkVm5ORHA4elNqdVM4WTFteGxTUjE5SlZWMVpY?=
 =?utf-8?B?U2dqeENnMVhJZlhpL2NtUURIYWJkMm9lVEZCcEgzTXFpbFYzV1E4Wmc4R29B?=
 =?utf-8?B?eTcyUngrM3JBNEpQdVVqRm5adGFwTWFZQklXUk0yeVczUjVHOWJjSi90T3lD?=
 =?utf-8?B?U2tmdmp4a3Q2QmhiTFdtZVpYZkI2L1JNL3VHN3dLclFMT1lQMG9yeHlnTTR1?=
 =?utf-8?B?Y0RWQUxURTExNnVOVk5Ta25SUWZQT0VjbW00V2NJU1c1T3BQTnBpV21KYzZj?=
 =?utf-8?B?dURvRkRTT1hKd293WEYzU1VsbzFIMGlrQkRhSnltTHBERVoyTnRaYUVaeHky?=
 =?utf-8?B?ZFhhOVQrdXNadG9qMDZ5bzl6VmxSRkhhakR0LzdSaVNUcS9qQ3lTUTJ6Y1pC?=
 =?utf-8?B?R2tnUGVSMkRzU2VEdWkrenR1SWlza1VENzEyVzBtbUFNN1FwVG5EZk9KSkVs?=
 =?utf-8?B?QUtyMXkvYTJIUUlSV25LTngxb2dRVjJrdEpVMmRxdVU5S0VncjB3SWwwWkJs?=
 =?utf-8?B?bjEzYXJCTE1rMGJzbjNNYkdJeENZdlFLLzN4MEhJMkJuVEIxSTZRLzJmREds?=
 =?utf-8?B?eG1JSkRBVGxxTFJXU3QxVnhvZkViMTJDVnYrV3k1UG1NOHpVOFhDNXNma2JS?=
 =?utf-8?B?RjF0elRnV3RQRmh5b0xUMzBCdm9PVHl1RGJIZXUrR2xHQTlDUFFhM05UMEV3?=
 =?utf-8?B?SG50VnM4TGtOc2FtbWpMMmRvVElCV1ZlQ25UVjNxUzVZRXFkdkoyV0ZTREIx?=
 =?utf-8?B?dHhWcG9yS0lXMWxzUGFYYXY2QVBnbzlHaGNobGE3TFp6cForUWlzbUROdFBR?=
 =?utf-8?B?dTYzZDFEMVU0MGpQM0hmL1RybHhXVXVXVVNQOWtJZHJNZFEwOTk0RnlMV2Ew?=
 =?utf-8?B?bDU0RVRwS0k0cWF0VkljNG5pMDA2Nlh1RmV2NzRCMnhtV2hQbUYwUWN1OHYz?=
 =?utf-8?B?bTdRN2craC9naUhLcndNaUNkUVV0Z3VmSWh2SE9UT09TSyt1akxiZ2l4b0Fs?=
 =?utf-8?B?NVZUSHVQdmVYSGg3akFpVHhzczJ4Sm92VG5kdVc2eHZhLzM4RFhCUkFEcmpj?=
 =?utf-8?B?NmhaR01SZmZVR0dVRm1aZGVwaVE3eEVWdFdjSHNEQktYcjdvbm5pK2trR3J0?=
 =?utf-8?B?alB1MEIrR0R4MVNIS1JSUzdEbitxeU14cjFFYnNQUURGMWJ6RitqcW5jLzJE?=
 =?utf-8?B?Rzlxa2htT0FYRFJSemd4TXhqaG8vRjNMSktHSHZ3L2tzNWV0MVE5NVEvY1M0?=
 =?utf-8?Q?xmNnCTxic5Vjnbfzo6k8WtX3Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EC8A698EACE0B4CA6E82AFD39277E85@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5vuBZE4zCvaQpOu0MxUDEqn8UMBv00Fsf/LZCbrHSLKVufVinY6xPUeDTgas07nPiKuJ8aZHcF/i3Ix8uuy3fvrI0SyzQ3Zgjp+11TqSaG8mRjushrA2LLLefyuqw3lVlCSsbD40du+itOD2WKFqd9c8sgc9k3vH1phNIFlEudGC3tKzYn/y9VM3W7C/Zg1HOKqPyXlWRs9NMahMBXpVa/MEeYG3r6SWiAwp4Z9UQ/pmFuKui0aHlqM8He+f+fxYvuWO9vNJ0dGY5DgW60xPEJmkKIeECyP6hlSOgB48aTJ2DQdBDkMAWfnmjCg3E73mRvADUGHWCyQwbgwyDqjYnqSUHHqiQMnmYi7MGfpxikHlv9/YfH0O16ncLOWyNdn9y2x71JDhS75upUiv+w9l73mMdbDmA2oaAJ9apIHp5r4UYs5FZlarx4XY+Q0EwZCwstLr1UzY7iRm1eDY/rXf+mh3Y7U+ibA0GnlYyz7tGmFYhclt3F18WIOgEvE/MgofNto0XeIOE7hz1fRsAP1IDdqGyJElYp8Gj2nJaq2gZV2umJTl5K+jdi1xzDXQRz2SWNWTHQAvkZh1vbQqedJqTjRyPDflhT75NjD7TAKMcKgUs4skELX0NFD78xgesTk751Wj5c+yyZTtmRL0tPXKeAXpBfjrFhSjvbOjT2TPSgVlSYeviBJGYMM3YKk0PIHMlaWjTIztWtva5x2hGtcgWP1Ny97gz8L9o3Fq+g483X5fMhW0uDvSSGCmYxqD5jstQnCFtgd1BofLTuO3zUo4QgnCHyT8pbCKSphlFqaNXrha8WrH21/OJ56hRUIhiABgX/H6k+Vn4x3+ZHqoG2H9JQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eb7d5e-0dda-469c-e4f2-08db57923084
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 11:22:39.3858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyk4Z6De0fweQUV2LAUuOw5C8s4C96Qq2TWtj1BRFQgvUs5sGKK4jrD90y/HCJ6naGqEwKIe1YlTIN82VfrkdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593
X-Proofpoint-GUID: 56LjNPqZ5lGePfg0uhoUeG5A7pQj0-ks
X-Proofpoint-ORIG-GUID: 56LjNPqZ5lGePfg0uhoUeG5A7pQj0-ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_08,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305180088
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGFsYWssDQoNCk9uIDUvMTcvMjMgMjM6MDIsIFBBTEFLIFNIQUggd3JvdGU6DQo+IEhpIE1p
bmFzLA0KPiANCj4gTWluYXMgd3JvdGU6DQo+IA0KPj4gU28sIHRvIHNldCByZXEgbnVtIHRvIDMy
IHJlc29sdmUgdGltZSBnYXAgaXNzdWUgYW5kIElTT0MgT1VUIHRyYW5zZmVycw0KPj4gKGFwbGF5
KSBnb2luZyBPSy4gUGxlYXNlIGtlZXAgdGhpcyAzMiBzZXR0aW5nIGFsd2F5cy4NCj4gDQo+IEkg
d2lsbCBrZWVwIFVBQzFfREVGX1JFUV9OVU0gYXQgMzIuDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0
IEkgYW0gTk9UIERPSU5HIEFQTEFZIGhlcmUuIFdlIGFyZSBjdXJyZW50bHkgb25seSB0ZXN0aW5n
IFNQRUFLRVJTLCBub3QgbWljcm9waG9uZS4gVGhlIDUuMTAuMTAwIGtlcm5lbCBoYXMgc29tZSBw
YXJhbWV0ZXIgY2hlY2tzIChmX2F1ZGlvX3ZhbGlkYXRlX29wdHMgKSwgc28gSSBoYWQgdG8gZW5h
YmxlIG1pY3JvcGhvbmUgKEVQNChJTikpLiBCdXQgSSBhbSBub3QgdGVzdGluZyBtaWNyb3Bob25l
Lg0KPiANCj4gSSBhbSB0cnlpbmcgdG8gQ0FQVFVSRSBBVURJTyBvbiBteSBMaW51eCBkZXZpY2Ug
KGFjdGluZyBhcyBhbiBhdWRpbyBnYWRnZXQpLiBJIGFtIHBsYXlpbmcgc29tZSBhdWRpbyB1c2lu
ZyB5b3UgdHViZSBvbiB0aGUgaG9zdCBtYWNoaW5lLiBBbmQgaXQgc2VuZGluZyB0aGUgZGF0YSB0
byBteSBkZXZpY2UsIHdoaWNoIGlzIHRhcmdldC4gVGhlIGVuZHBvaW50IGZyb20gd2hpY2ggSSB3
YW50IHRvIGNhcHR1cmUgZGF0YSBpcyBFUDEoT1VUKS4NCj4gDQo+IA0KPiBNaW5hcyB3cm90ZToN
Cj4gDQo+PiBBcmVjb3JkLiBJbiBsYXRlc3QgbG9nIEkgc2VlIHRoYXQgZnVuY3Rpb24gZHJpdmVy
LCBiZXNpZGVzIEVQMU9VVCAod2hpY2ggZm9yIGFwbGF5IGFuZCBpdCBub3JtYWxseSB3b3Jrcyks
DQo+IA0KPj4gcXVldWVkIDMyIHJlcXVlc3RzIHRvIEVQNElOLCB3aGljaCBJIGFzc3VtZSBlbmRw
b2ludCBmb3IgSVNPQyBJTiBmb3IgYXJlY29yZC4gQnV0IHRyYW5zZmVyIG9uIEVQNElOIG5ldmVy
ID4gc3RhcnQuIFBsZWFzZSBwcm92aWRlIG1lIGxvZyBhbmQgdXNiIHRyYWNlIHdoZW4geW91IGRv
aW5nIGFwbGF5IHdpdGggYXJlY29yZC4NCj4gDQo+IA0KPiBBZ2FpbiwgSSBhbSBub3QgcnVubmlu
ZyBhcGxheSB5ZXQuIEkgYW0gdGVzdGluZyBvbmx5IGFyZWNvcmQgdG8gbWFrZSBzdXJlIHRoYXQg
dGhlIGF1ZGlvIGRhdGEgZnJvbSB0aGUgVVNCIHRhcmdldCAoaG9zdCBtYWNoaW5lKSBjYW4gYmUg
cmV0cmlldmVkLg0KPiANCj4gQmVmb3JlIGNoYW5naW5nIHRoZSBudW1iZXIgb2YgcmVxdWVzdCB0
byAzMiwgdGhlIGR3YzIgaXNvY2hyb25vdXMgdHJhbnNmZXJzIHdpbGwgc3RvcC4gV2l0aCB0aGUg
Y291bnQgMzIsIHRoZSBlbmRwb2ludCBpc27igJl0IHNodXR0aW5nIGRvd24sIEJVVCBJIHdhbnQg
dG8gY2FwdHVyZSB0aGUgZGF0YSB1c2luZyBBUkVDT1JEIGluIGEgZmlsZSBhbmQgdGhhdCBpcyBu
b3QgaGFwcGVuaW5nLiBUaGUgZmlsZSBpcyBvbmx5IDQ0IGJ5dGVzLg0KPiANCj4gQmVsb3cgaXMg
dGhlIGV4YW1wbGUgb2Ygd2hhdCBJIGFtIGRvaW5nIC0NCj4gDQo+IEhPU1QgTUFDSElORSAtDQo+
IA0KPiBQTEFZIEFVRElPIFVTSU5HIFlPVVRVQkUsIERFVklDRSBTT1VORCBTRVRUSU5HUyBTRUxF
Q1QgTElOVVggQVVESU8gR0FER0VUDQo+IA0KPiANCj4gDQo+IExJTlVYIERFVklDRSAoVVNCIEFV
RCBHQURHRVQpDQo+IA0KPiBBUkVDT1JEIC1mIFMzMl9MRSAtYyAyIHRlc3Qud2F2IC8vIHRyeSB0
byBjYXB0dXJlIHRoZSBkYXRhIGNvbWluZyBvbiBFUDEoT1VUKQ0KPiANCj4gRXZlbiB0aG91Z2gg
SSBhbSBzZWVpbmcgZGF0YSBvbiBFUDEoT1VUKSwgdGhlIHRlc3Qud2F2IGlzIG9ubHkgNDQgYnl0
ZXMuDQo+IA0KPiBJIGhhdmUgYXR0YWNoZWQgVVNCIHRyYWNlIGZpbGUuIFRoZSBsb2dzIGFyZSB0
aGUgc2FtZSBhcyBJIHNlbnQgeWVzdGVyZGF5Lg0KPiANCj4gVGhhbmtzLA0KPiBQYWxhaw0KPiAN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWluYXMgSGFydXR5dW55YW4g
PE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkg
MTcsIDIwMjMgMjowNSBBTQ0KPiBUbzogUEFMQUsgU0hBSCA8cGFsYWsuc2hhaEByYXJpdGFuLmNv
bT47IE1heW5hcmQgQ0FCSUVOVEUgPG1heW5hcmQuY2FiaWVudGVAcmFyaXRhbi5jb20+DQo+IENj
OiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiB1c2I6IGdhZGdldDog
ZHdjMjogbm90IGdldHRpbmcgYXVkaW8gZGF0YQ0KPiANCj4gSGkgUGFsYWssDQo+IA0KPiBPbiA1
LzE3LzIzIDAwOjQzLCBQQUxBSyBTSEFIIHdyb3RlOg0KPj4gSGkgTWluYXMsDQo+PiAxLiBEZXBl
bmQgb24gd2hpY2ggdWFjKHVhYzEgb3IgdWFjMikgeW91IHVzZSwgaW5jcmVhc2UgMiB0byAzMg0K
Pj4NCj4+IEkgY2hhbmdlIHRoZSAjZGVmaW5lIFVBQzFfREVGX1JFUV9OVU0gICAgICAgMzIuDQo+
Pg0KPj4gV2hlbiBJIGRvIHRoaXMsIHdoYXQgSSBzZWUgaXMsIHRoYXQgd2hlbiBJIHBsYXkgYXVk
aW8gb24gdGhlIHRhcmdldCwgSSBkb27igJl0IHNlZSB0aGUgRU5EUE9JTlQgc2h1dGRvd24uIEhP
V0VWRVIsIHdoZW4gSSB0cnkgdG8gcmVjb3JkIHRoZSBkYXRhLCBJIERPIE5PVCBSRUNPUkQgYW55
IGRhdGEuDQo+PiBUaGUgYXJlY29yZCBmaWxlIGlzIGVtcHR5IHdpdGggb25seSA0NCBieXRlcy4g
SSBzYXcgdGhlIHNhbWUgYmVoYXZpb3IgMiBtb250aHMgYWdvIHdpdGggdGhlIG9sZGVyIHZlcnNp
b24gb2Yga2VybmVsLg0KPj4NCj4gDQo+IFNvLCB0byBzZXQgcmVxIG51bSB0byAzMiByZXNvbHZl
IHRpbWUgZ2FwIGlzc3VlIGFuZCBJU09DIE9VVCB0cmFuc2ZlcnMNCj4gKGFwbGF5KSBnb2luZyBP
Sy4gUGxlYXNlIGtlZXAgdGhpcyAzMiBzZXR0aW5nIGFsd2F5cy4NCj4gDQo+IEFyZWNvcmQuIElu
IGxhdGVzdCBsb2cgSSBzZWUgdGhhdCBmdW5jdGlvbiBkcml2ZXIsIGJlc2lkZXMgRVAxT1VUICh3
aGljaCBmb3IgYXBsYXkgYW5kIGl0IG5vcm1hbGx5IHdvcmtzKSwgcXVldWVkIDMyIHJlcXVlc3Rz
IHRvIEVQNElOLCB3aGljaCBJIGFzc3VtZSBlbmRwb2ludCBmb3IgSVNPQyBJTiBmb3IgYXJlY29y
ZC4gQnV0IHRyYW5zZmVyIG9uIEVQNElOIG5ldmVyIHN0YXJ0LiBQbGVhc2UgcHJvdmlkZSBtZSBs
b2cgYW5kIHVzYiB0YXJjZSB3aGVuIHlvdSBkb2luZyBhcGxheSB3aXRoIGFyZWNvcmQuDQo+IA0K
Pj4gVGhlIGxvZ3Mgc2hvdyB0aGF0IHRoZSBkYXRhIGNvbWVzIG9uIEVQMShPVVQpIGFuZCB0aGUg
YnVmZmVyIHF1ZXVlcyB1cHRvICMyNTUgYW5kIHRoZW4gd3JhcHMgYXJvdW5kIHRvIDAuIFVTQiBz
bmlmZmVyIGFsc28gc2hvd3MgZGF0YSBjb21pbmcgaW4uDQo+IFdyYXBwaW5nIGZyb20gIzI1NSB0
byAjMCBpcyBPaywgZHJpdmVyIGFsbG9jYXRlIDI1NiBkZXNjcmlwdG9ycw0KPiANCj4gDQo+IFRo
YW5rcywNCj4gTWluYXMNCj4gDQo+Pg0KDQpPbiBkZXZpY2UgbWFjaGluZSBydW4gcmVjb3JkaW5n
IGJ5IGZvbGxvdyBjb21tYW5kOg0KYXJlY29yZCAtRCBwbHVnaHc6Q0FSRD1VQUMyR2FkZ2V0LERF
Vj0wIHRlc3Qud2F2DQoNCk9uIGhvc3QgbWFjaGluZSBwbGF5aW5nIGF1ZGlvIGJ5IGZvbGxvdyBj
b21tYW5kOg0KYXBsYXkgLUQgcGx1Z2h3OkNBUkQ9YXVkaW9nYWRnZXQsREVWPTAgDQovdXNyL3No
YXJlL3NvdW5kcy9hbHNhL0Zyb250X0NlbnRlci53YXYNCg0KT24gcGxheSBmaW5pc2ggdGVybWlu
YXRlZCBhcmVjb3JkIGJ5IENUUkwtQw0KDQpSZWNvcmRlZCB0ZXN0LndhdiBmaWxlIGNvbnRhaW4g
YXVkaW8gZGF0YS4NCg0KVGhhbmtzLA0KTWluYXMNCg==
