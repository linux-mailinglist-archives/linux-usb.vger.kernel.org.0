Return-Path: <linux-usb+bounces-963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 274647B58CB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 19:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id EEFC0282D86
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FB01E51F;
	Mon,  2 Oct 2023 17:35:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DD1E50B
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 17:35:31 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA3494
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 10:35:27 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392HCvno028600;
	Mon, 2 Oct 2023 10:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=CntKz9kP/rYCkatZJsuNYXdc/sz8gbvjsdhEIt43NY0=;
 b=aYHYvBHeUx4FxBd3RCdrRq/tOTBiJXprIMpuFv7rngEz4XHT58moK1fVEpPz0n1zT0KO
 grNaLLXzTq3hk/yKzWd2KL1uQpUuFSiLw/TROQC59iRZ7azEDOpn6Nynzz8/lOP/k2oK
 1C5HbqoGG4RS1hO5IC0SNrzLsPIfJWxVYQ90/CEE/0VrGLVgstr3xdfzfpBZnXLaUCJS
 gpNBfW8pTPOnrfgD56FUIMTaJKiGgvMdvBYhNqX1cl13T/Oz6VXCPWaVpeYPqYwLh8mG
 TTYXSRh48xemCoE/apHKDsTUUcZoCChWN7DcE4Ta5kvBALT344dNA3rssJ0vMDwuX51o kg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tejx654gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 10:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1696268118; bh=CntKz9kP/rYCkatZJsuNYXdc/sz8gbvjsdhEIt43NY0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WmrKsV87dkfFXKSq6I+ukC4Xn7E5q8YlETHlISyic51mfexmscbhb12iigp434SDf
	 FMmSVyf0lRZ3s/xoerAjA81dkX7EhAwsAGoRVigNtz8VwQpLrROd7Un5erMkBoQIpr
	 C3UyVGG+gRcgdGqzi01iD/5xw8D9wrdW4UKXKRQJXUzzHI7GI04VrjFbGCc8ugK8IU
	 nS+bJK5rq3jytv1pduAbhCW55u31Fo+5WdlTNYs+Lnq6Mu2Ozabl9xaD+dezbPxNin
	 889OPhruu0/1KkPGQmNXo+dwtjqprFr8DHQJ8UYK5ZI0eibACx7oGd8iyPlmGOxeYA
	 Zrl/TOQ8gfOOw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD5AE40599;
	Mon,  2 Oct 2023 17:35:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 031CBA006C;
	Mon,  2 Oct 2023 17:35:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=L7FmNiV+;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3049E40563;
	Mon,  2 Oct 2023 17:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEFoj4UBp9JtNlQXHg9w1hdujqs40POPxRy9xBD7glYGyADxALrekike03FTIUPGH/pf42wXxnFLB8mR8rx/XLKOl+sUT6zlnI52xjVGP8AOznOVUV4MqdaQnof68LeLUNMJdkdjWVwQ+jiE/BPkkajBFTVNR2jDGlwj6OMosIX8ExC0pKqC2XgIqpQfxS4OTAh7LC6lkXPbpSFEpE/2unq6lFgCROyD0r4bRlGLjVNldvB40z44TNKe59edG7d2mD274aBU8l9+svWpZ5hR2Hdpn7qpVe56rCjdMFDVjg8+sFeNObvzVesvQ8PN6Acayml+YLTlAQTCXpFl+mLRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CntKz9kP/rYCkatZJsuNYXdc/sz8gbvjsdhEIt43NY0=;
 b=V3jQ6wFe1LkskFDb0+gYgCEaGIuemyMoYdGjjxBZI/qEDa3yfvCbrgtxWtLC/o38NVVc6fIkfeF5CAEDFlokCMmrfPHZdfk16n3foQ35kwhmHKSmHfTTl/t7u8npmIQWa07uUwq9EESUJp8CRVpY+Dx/gxNh1TCzgE9homTAB/Oz8ncDe+i0Ou71QsHbbz1hAEb81ow7jxSqaOoklrEdTSwiO8yXdat4uN2B3AhvRlQkvLe8KyYY9Pv38GjatSRtzR6HQJ1qOsrjSbiYXI2sMO3McPuzXpZWU49H9l4jlbir0bDyiAYNLRonunaKx1RH4Kfn4CQlAcGLqhqjT4G/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CntKz9kP/rYCkatZJsuNYXdc/sz8gbvjsdhEIt43NY0=;
 b=L7FmNiV+4ZLO55qqrPybphYzhcEcGKUdx3wTLQLl44QV1J4OPKTfalxEG4uPR2vnG9280g9vRk1D08HKhSoCtdrEn7leQNs8gBmnZCTEKgpoSUK7vrejcNAFJMT5rQji4DFOQCgNN647BkkZypOxJS/y4PDJ4jEPNFeU6ZdeY9Y=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Mon, 2 Oct
 2023 17:35:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6838.016; Mon, 2 Oct 2023
 17:35:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: dwc3: gadget: remove requests from any list before
 dealloc
Thread-Topic: [PATCH] usb: dwc3: gadget: remove requests from any list before
 dealloc
Thread-Index: AQHZ6Cy99ZmND0efwk6yC1acUGjwm7A23T+A
Date: Mon, 2 Oct 2023 17:35:08 +0000
Message-ID: <20231002173513.jlu65vpmbsixkeqv@synopsys.com>
References: <20230915233113.2903645-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20230915233113.2903645-1-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SN7PR12MB7954:EE_
x-ms-office365-filtering-correlation-id: 1c719e4b-d725-4a65-67a3-08dbc36dec61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3DXhxGD7WD1IrTWWfAQ/M4ZH5tZnfUqMqfYx5wckqOqkXsBnYfeCSFdCf3xVkpI7NrdeQW2ef9Z5EaryrlCYOjLjmNXjZGqqkyC5GMty72p9H5p8qv1MtB+yNEknHbg6r4JalhvpuYxPRBJf0JIU8yaRPlbDf7y9AYbXACipR1RZ8CAbs4Fi3f/AHoyb6YLVQiy59QfvfZhJ9GvrFCKJm8Q/ELR3EX1Ch9l5ocSABl7Z8ao4PeP0RpHdCXYkpZOVNii15N8RHExxd/ZBZ87g7pT9Rs/YFnKovuFR//bISSya4e5nbWds+CLj9oJVCm/SSK1L4PjeTR00UWuu8vcRTfSxswD53FZ9CTRjDjg5A8tuOcJ+ZecxDLvv5A5oDM47uvWVu+CSyQQfk8MoD3p9Fn5HMShBb5bIEXZn+sj+4NABqOTv+CSnXQVCYQemh7MLy/gn3hpx/94XGzCWQOhDcg3MMkelF7YAY2TC5pfRPG6b10wADOEvexEkwJNtYtRz37SrSAJ5h7bj9OM+5m5xW5ZQivHGKh6P0OiO/v67DgGo0K21C7y8m6jPHJKiez2BNYxVaZu1nj4BG3h32YNiCSj86PcdX2DooCnF3Siw+HlZRz4+RyVZBzzTTTTjBeaf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(5660300002)(4326008)(26005)(1076003)(66946007)(76116006)(2616005)(41300700001)(8676002)(36756003)(64756008)(66476007)(66556008)(8936002)(66446008)(316002)(54906003)(6916009)(83380400001)(71200400001)(6506007)(6486002)(478600001)(86362001)(122000001)(6512007)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3lIMlFHdG5wSVpxZ3RIWlB2b1N3MlVWNmZKb29UMkNGTTV2NGl0MTZmdml3?=
 =?utf-8?B?dktJZ0x4a29menpsRlp1OXVMcTJEL1VvcVY3YmEyQ3cxMmFpQ2FKVHV0V1ph?=
 =?utf-8?B?NDVhVjBzSXhsQmxHWXBCZDJER3gwSnNXTmVWcGJ1UU1ORWx3Ym16SllrbGhT?=
 =?utf-8?B?NXhWaldvMkp0dGQ1eERCYUlMODBvbGxFd0ZGWHBMOHVVSUdPaGRNZzM5U1Rz?=
 =?utf-8?B?UnlxS0RnMWd1UU1zTE9ERGp4VUgvSzVrYm9NUmtIOVg0NElWMWhwc3AzRUJq?=
 =?utf-8?B?UlFrU0Uxa1R6MkxhTExBOTJCTTdWL3V1Uk1reDVQdzVXUGpuZHJxeFQ1d0RE?=
 =?utf-8?B?SGlEZzc5VDA2K0tSZTkwWXRwbXBPaENKb3kyaVhrMTlXWXU0TWtrRm05dktI?=
 =?utf-8?B?QmYxR2VkUnZKTTErTi85eHZnZXFmWk1JWUxiU0dNV0RMaHpDNDlVWnlqUCtl?=
 =?utf-8?B?Wm9HNzhVRlVyNGU4OWFvMTdMWklNVWtLSUNja2YwQ0g0TVRzbXp1WURtUllJ?=
 =?utf-8?B?aWdWOEZJRm1BR2QvMFhsenI3RDJrL1JxSnkzODQ0dUwzeVhrUURDc1l3ZVFR?=
 =?utf-8?B?eGU1NVl0dTkzeE9jcUxzTXFxSEk4TngzZDMrd3JWNGRpYWJMRHpaSjIvaTVi?=
 =?utf-8?B?NmNMdFhtcGhHa0g4amRYVVM5OWlyTE5yNGxvUm5zdGszM0tJYUk2WC9zSllE?=
 =?utf-8?B?NEVrOHdoMGtxZndwZGUxVTY3Y09WWW1rVVhwYW84U1lGWFQzeVRUYlVJLzFJ?=
 =?utf-8?B?S280aG51dVNZNkFTOVJkK05RNXZSNjIvS3B1Vk9vbUdkSmtxRDhGY3dSMjBm?=
 =?utf-8?B?YVJ3SHB3YndsRk5zVmpMb0ZsRnJ1clhxRHNPdmxTcUw1YlN4K1NjTUMvMlBq?=
 =?utf-8?B?bkYzejROcTY1T1N2U3VWbUpCVVlWaUtHNW1OUFF1RkNJZXZpZ04zUHdaL0pk?=
 =?utf-8?B?VGNuUU92MDdNY29udkVEQ1pMelFnK3NVSmY0Q1dFZlp0K0hTSC9KY2dheTdG?=
 =?utf-8?B?VXptSkluRlkraUpMRENFN2c5OXdTbXB6eGd3cHI2TndUdCtudXJ3RGQrTzdK?=
 =?utf-8?B?cFJ0SitjcHRYWktVV28wYlU4TWs2RTFtOUp2SWJYRko4NDB4YkRuVXM2Qjgz?=
 =?utf-8?B?a3JZOFhpZTJIMlUvanVFU3JUTzJYeFVSNU51NFkrRmdlWUF2am82REc2SEYr?=
 =?utf-8?B?dk1lVDZERnVFZk1PTnZ4WHBuSUZyVGVseHdFOUlvTFoxV1E2RGxURFNiKzlJ?=
 =?utf-8?B?TGJVZHpFZ1gwOWIwK3NycmxRR3hZdk45L0hVN2RzQ3EvN1ZIaWFURmlmb2VD?=
 =?utf-8?B?ZkJ6cm16T1dpRm5BUno4OHNwdHA3RzRWZW9aK2M0b296UVBDL2ZYaVZTUEJw?=
 =?utf-8?B?aENBa21MN2FFaXZEVEdXQkl1N0ZCdjVZL2M1cldqVktZODdsYVhkdDhoQXZ3?=
 =?utf-8?B?bStWTDlzV2ppWGl0ZEl6aU9TRzRXdEY1NElrKytHWExCalRJb0V5VFUyZXhl?=
 =?utf-8?B?VlFZNi90QWcvL2lPbEhHektWY3dJaGxNZGZpMWlCRVlSbjJCU05WdDJVUmF2?=
 =?utf-8?B?b0FUYS9haHlBamFMUkpDTzBrelJsaC9ObTJ4KzdRamNiNXJrSktmZVRIK1gz?=
 =?utf-8?B?b2dMdTRGZytpWVl3OWUxN0RvaHBBbjRNcVluQlgwaG85cDgzQ0p3N0hqYmZt?=
 =?utf-8?B?ckd1aDNZYXM3VGZVZUxnVDZGRVhMTnl3a0xiQ01mYVFSNklwRFQ4ZytKWU9V?=
 =?utf-8?B?TVQydHRPTU95eHdZcThrZXdBOEIzSXhsN244cHBGMHU1UDlneFVPbi9QTDYy?=
 =?utf-8?B?d3VpNmEwN1RFQ21GSTZnWHc1SmxEbGFLNGNDdGhCUit5bXhQcDJ4UkF3cXdJ?=
 =?utf-8?B?Z2J0ZEZrWDV2S3FPTzFtdGRIc3dCNzhIbTVwT28xOHUvOUs1SHFyZ255SlR1?=
 =?utf-8?B?WjByVjJWdVpPRWlGWE5USG5qR2hZU3lGNy9LQ29Rb1paVTI1b2hIcENBOTFp?=
 =?utf-8?B?WU1nRkVjL3d2VUJNdVNnQ3BpaXRDVGw1YVdPVVpLcDNibk5BV1kzRzNSTHZs?=
 =?utf-8?B?Ykl5YUlqdjhKbEd2NWRESTg1U2VUQm1QUVhSa3Zka3FFK1JNZ3kzUERQMWpl?=
 =?utf-8?B?aXVTTWQ4dDNZYjRRM0ErTU1YVWdOZm8ra1lzNVJ0RUNWRFM5SlpNTTFWTzhE?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <684D00212A48AA4A8D150BC7D5D6FE57@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6GscC+SSJpFgB1xFulgL20KuWZY/KYNpXMvvUeguVYCvwlUASJlNRgIzv8/c7sulrv3NjJWgWT9+ImHuwZ4RwYOzp767abhVCXJsfXbnLygLZc+jQY0pCrLPx2YfT5tGcJgjdjLaU8Za2q2/xLrEwrA21eoB0TqO8Bf0zUzf/cNNXomtvNF3g2DheYRptOGBKshbn9/99EsJozxAODzCy6hmv18j0SY2QhOFSZsQHHvFetWTqkrKQ+4/5YlsXd5zjrbOhi2aE8X81miuP821IHccUa5jQJ8uKgu7eS4duEhaDFcdScFNsWXKEayvORkjJqS9Kdd5EbQL44NF8I+gjuReg4SUmMsN79js/GehuQNmNyzPlNZlBLSMjfV3EN4tVIyIya5ZiOHfVECs04fGzchOtvMo+ZN6Ce0U23ZHw00uigWRLVpSr1t8N8p3rBAqE7PKdHhKm73PG95d4ljuCb/siPvvf1OggXsOjuhXBfTD/r9QOsvmz8uOXfK1V9J9pfuR2YU2ClTSxfuNVhj4NO29mpWwc0OWCX7xdynT4NCqpB1BRz0k/UtaTIxe0RbmHKL+LDb21KcTduwXMqrO7XFS0JkZSMBTJ1bWJRnS3kYvyQci5USvDkGc7jSWBW/30QVdS4SLHvUcWWltY0jCMY8GLkor4QQIhZ4FfBHIYiHT7fhYLFdntw6ACmbQhQUfD37hP3zAuIqxmNkz+XyALoEwUA8s3xc0jXkjBfoT+ElyoUhMOA5oa/mum29xweJw8GjzbwhBPCYZ87SaZDDry60kzUYlExe5m0ATl9Zxub+Flu2t7opSxvsDAM/RbTdq0dSqjhxR4RPYmHPfrqNzU9SbddtveHDLWb3x7KoMFy7DiSY4rdar4rzPyFwhxi2bOkTOwrk71YUTUWEf1+IZaA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c719e4b-d725-4a65-67a3-08dbc36dec61
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 17:35:08.7269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWh2e96E+7IHnYlEl2lFsgeU3p99vQFB6XmaLN+NfH5nJ1n595hGD4S2RMoHOw1atIgezLOBRMH2RQnSL46SOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
X-Proofpoint-GUID: 2pR9-fwU5jxrD3ZAZKxf8S8nD_GTlaPS
X-Proofpoint-ORIG-GUID: 2pR9-fwU5jxrD3ZAZKxf8S8nD_GTlaPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_12,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1011 mlxlogscore=735
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310020136
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gU2F0LCBTZXAgMTYsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBPbiB0aGUg
Y2FsbCBvZiBkd2MzX2dhZGdldF9lcF9mcmVlX3JlcXVlc3QgdGhlIHJlcXVlc3QgaXMgcG9zc2li
bHkNCj4gc3RpbGwgcXVldWVkIGluIHNvbWUgbGlzdC4gVG8gYXZvaWQgdXNlIGFmdGVyIGZyZWUg
aXNzdWVzIGluIHRoZSBkcml2ZXIsDQo+IHdlIGVuc3VyZSB0aGF0IHRoZSByZXF1ZXN0IGlzIHVu
bGlua2VkIGJlZm9yZSBpdCBnZXRzIGZyZWVkLg0KPiANCg0KVGhlIGNhbGxlciBvZiB1c2JfZXBf
ZnJlZV9yZXF1ZXN0IG11c3QgZ3VhcmFudGVlIHRoZSByZXF1ZXN0IGlzIG5vdA0KcXVldWVkLiBU
aGlzIGxvb2tzIGxpa2UgYSB3b3JrYXJvdW5kIHRvIHNvbWUgb3RoZXIgaXNzdWUgaW4gdGhlIGdh
ZGdldA0KZHJpdmVyLg0KDQpUaGFua3MsDQpUaGluaA0KDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgR3J6ZXNjaGlrIDxtLmdyemVzY2hpa0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTEgKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggODU4ZmU0YzI5OWI3
YWYuLmY0YmMzMzU5MGY1NzBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTExNjUsOCArMTE2
NSwxOSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9lcF9mcmVlX3JlcXVlc3Qoc3RydWN0IHVz
Yl9lcCAqZXAsDQo+ICAJCXN0cnVjdCB1c2JfcmVxdWVzdCAqcmVxdWVzdCkNCj4gIHsNCj4gIAlz
dHJ1Y3QgZHdjM19yZXF1ZXN0CQkqcmVxID0gdG9fZHdjM19yZXF1ZXN0KHJlcXVlc3QpOw0KPiAr
CXN0cnVjdCBkd2MzX2VwCQkJKmRlcCA9IHRvX2R3YzNfZXAoZXApOw0KPiArCXN0cnVjdCBkd2Mz
CQkJKmR3YyA9IGRlcC0+ZHdjOw0KPiArCXVuc2lnbmVkIGxvbmcJCQlmbGFnczsNCj4gIA0KPiAg
CXRyYWNlX2R3YzNfZnJlZV9yZXF1ZXN0KHJlcSk7DQo+ICsNCj4gKwlzcGluX2xvY2tfaXJxc2F2
ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlpZiAoIWxpc3RfaXNfc2luZ3VsYXIoJnJl
cS0+bGlzdCkpDQo+ICsJCWxpc3RfZGVsKCZyZXEtPmxpc3QpOw0KPiArDQo+ICsJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gIAlrZnJlZShyZXEpOw0K
PiAgfQ0KPiAgDQo+IC0tIA0KPiAyLjM5LjINCj4g

