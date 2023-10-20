Return-Path: <linux-usb+bounces-2018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3A7D1907
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 00:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAB22B215FB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 22:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A45C341BC;
	Fri, 20 Oct 2023 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CefKHVWm";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kqC9KT6P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fPM61stt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC5321AD
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 22:23:30 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EFC19E
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 15:23:25 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KLRJ9O022746;
	Fri, 20 Oct 2023 15:23:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=BQy8shKnDIupWvVsptmEIrcGkdZ4i+A7CYlGQEuB3KU=;
 b=CefKHVWmLa0aNzwmItlWV7ivpFe2UCIG9xxAHHXMdwfkuHv7p7K1ubjS0sCxlMN/KXhA
 tPX5dNHLhaJJDwj3OE9wtqs6prIkkpVSyUWq0aOgRjrmAIOQ4dktCWcwR9N+HNx7lUn4
 hmhq/f14kFmY/H25UpTN4bDyq7mLlFhsA/Eiluol8/0AwDe67ER8f3Br1klDLiR6/61o
 KfNIzyLI3G66w27tzN0GXbAt29pjvhB9ADHk4FuoQ2xc9kXQXa438nD0MN2TumOE8ZeP
 y9/0HT79nN6eJRN+pP6LWUkFDkQ84sLBjnRubUnX05X4twmJgYeKNsjbEF71mZIv7Seo jw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tubw3kt2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 15:23:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697840575; bh=BQy8shKnDIupWvVsptmEIrcGkdZ4i+A7CYlGQEuB3KU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kqC9KT6P8Gkn5GL0n5j2d0LXLswVwn8VIR1MjSOu1IBg65V7wn8aFktfnrOCL3oJ/
	 sVoB/oWOE1b2JPoDpuMaO49SDH/j+0AyRe4gOSotYLG5nX6yuIXUoeNC8GpM/RNPms
	 hQ9sF/vg2WBmm5gdOSyxqNn/wESMxw3/V993nZ0LZypYhZqKVif/VAuYCA7p8KrBlR
	 4upTK9SdSrZp/985Zx+33TtJglRvKnUFx5mfQJ/TzRMRutwod+3vRfmrWb8AoEpXSV
	 Y7ddAe1ydcrG1dYedXgfVMnwTHaw27XJuGmUmBWNJSbjXZnofniU7G+odhUtX+ie7K
	 EVdEWvin1G1Kw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 06C8040354;
	Fri, 20 Oct 2023 22:22:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1D807A007B;
	Fri, 20 Oct 2023 22:22:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fPM61stt;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BCF9F40356;
	Fri, 20 Oct 2023 22:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRGLF31CnWHEpz4VJrBuS/GtUWK/nicqCfdStyMEg8A6LPefdwA8m8UlKIL7hxewSoT3I3MahiuRFPWbGjVGD8FZJyQIGjnuMlO48lfX+LWRVmXD1jScY2TxiKlofslvh+y43MD4V+wZN05uuYHsMbp5tFNGW1pk8IzFW0AzPA99Rv1OUE38gSGa5sMoY7+MVoMpjybvHLuOQIQWNu2vccoUN+uINBLzWIaz05FSeVIRUy8HCcrKyyy23PofD486Dz5VcXgRHReW4yHglVNuRsOe22FTkDCx795/LCqXzkIJYrhqI9U0yJWVXnEN1qhVuzMUBv+rU2+FYIKVT7ujRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQy8shKnDIupWvVsptmEIrcGkdZ4i+A7CYlGQEuB3KU=;
 b=MV531LXKdyZDZzGotUEHlO3AgLsCu8irmQeRMot7Vihqap3Exjydp1X8XFDM1vSlWfG/HDpXAXi+g9wUZvCm8XjWEvfXxTGxqwhO5kTzM6OVVSX9VSUxyQ1gUZhzvJoM6cVb5WRnXAfGtPl52Wx4piLC/5H/QIO65law7wkBxj+YFcjNJDaFZtWAKGqgI06E9739HKe3nVUXHdJPdFmMpTRom3IdvZi5m7rlgatDE/FtSgqutRWq5eSrSlFtk2MSKE4bIz1dCRiG7HyjUfzVz0xlGACC9O5hE2PbcjTmCuOifLw0NgBC3U+fA2JBlTZFloCJSIx1uy+WSVfEc6WA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQy8shKnDIupWvVsptmEIrcGkdZ4i+A7CYlGQEuB3KU=;
 b=fPM61sttXtx/HbBScer2XBovc4dPadYNMW1pTo/YNtGwS3jWpf15ComPsQhPo+4QUbh6T3tbyHt125TNIrxq0rzN0A5oFmKr+GrjiwKPfzV6/kQbxihOn2UmBoz8gvWxheib2OHyTAtDj2Sr/T+0h8HnaT6w+dSiNSMxeLCVy2A=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 22:22:45 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b63e:67e6:b5fe:a8cb%3]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 22:22:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>
CC: William Wu <william.wu@rock-chips.com>,
        USB list
	<linux-usb@vger.kernel.org>,
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: your patch to dwc3 fixing channel halt with unknown reason
Thread-Topic: your patch to dwc3 fixing channel halt with unknown reason
Thread-Index: AQHaACUAlpNM8S5gk0KWtiPtQIq1WrBTR5MA
Date: Fri, 20 Oct 2023 22:22:45 +0000
Message-ID: <20231020222238.rc24xbdioxvzt23a@synopsys.com>
References: <3f3c2d58-c962-4066-96ab-cca31eeba95b@suse.com>
In-Reply-To: <3f3c2d58-c962-4066-96ab-cca31eeba95b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB9029:EE_
x-ms-office365-filtering-correlation-id: 0a6bdd81-9588-4803-0838-08dbd1bb156c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ks2H57WI3pnyo5AsFOm7mrSjqJB8KLAAoejKMgN9PGOONXFYqwPUQW1TbpVFEeXDKekaXRRE7+PaVZtN4BfvvmdEa3elvGVFKMfYnpq5f31WEjo2w1cZmN5j0+cE8dTL95ZsK1b7fXQpS/FlIuqytKce1eqQB3+St8Wss0/nBTrGd1yPIAgGBveGfZjbdy//QFAg8pFXnhfD29bywestk42HDlm0XH04QJBdu/mD6E8aYi4zH+12j6+Y73ncJ/ajb59RSiex/FrhauNlPmgEYzE+cZNKs8QVc1XF0+tUZMrdQWILsJzz/AUQtxaJsLdURYcAOn3VN+8s+jTl3AH6XxRYzboBJ2LweKw4glIxLIlRfB8lb5fWspM6dH9rqxSlkrmjiYfE2AQuGPqgM9Ilzlkn8kMXznv2QPiDt+oDdXxPirPj2VgTWN0/0zv6rcCrqTt5RtV7Qfh7/W4xN2uig1Uw3scHi9sTPdxYAxW/lDuELsJLsx2y4fguJdKLDVoz73EMs/lasus2POuVgMw+iWWy2oSYorA29FY+I4owYZd2X+FiBF5dp7SvCB8uyfr4moDVrhJmzepzDKxmZEBFnafUqMwe12yGUjIZc2VjHGk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38070700009)(4326008)(38100700002)(8676002)(478600001)(71200400001)(316002)(76116006)(66946007)(6486002)(64756008)(966005)(6916009)(66476007)(5660300002)(6506007)(54906003)(66556008)(41300700001)(8936002)(6512007)(66446008)(2906002)(86362001)(26005)(122000001)(36756003)(1076003)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N1RSaTdwdzJNQlVYYUlTV2srZFJjMXVzWStMbkpNSkFPbEVDQ0kzbWtoYkt1?=
 =?utf-8?B?MThQTzljeXdPRW01a25oM3FDUHB3dVptbE1TaXFFc3FvYXFqSFhPWGF5RmxG?=
 =?utf-8?B?TjloNUJycmdVS01jRStCNnY2R0ZRRDU2UHZ6Z0J6bFFPQlkwYjhqNEQzMG41?=
 =?utf-8?B?K3pDSEpXeDJaaG9pZlNpN00xWVpZcWdhU0dTeXZPeXpJMFFPczJiYnpWTjds?=
 =?utf-8?B?dWFXMUFWaWF1aHhsRmtjQys0U1V3TjR3M3paMHArVTZLbmJWazJwdkpqRTl2?=
 =?utf-8?B?VHJwbGxEVHpEZTNwazdTWU1lYUdCbHdxRFB2SWZQcVFIaXFoT05hNG1ERzF0?=
 =?utf-8?B?SGRYZDUwRk4zNGpyUzlpQUJjUTVJb2VEZU5XZXhmSWhQYmtXbEFITnNaTGNC?=
 =?utf-8?B?c240S3lSdTN0N1IyQlI0RXBIOStWSE54Qk9kVURQOUZWVnNQejBhdDB5dnc1?=
 =?utf-8?B?MVY4SENxcTdxbm5KK3ZPcHJFZmV4LzUyaHZOMzZMYlM0UHB1TG9aYm5GSTZr?=
 =?utf-8?B?S3h3TEpCUTF5ZC83UWozWWE4TXVpV21XVURuYkNFTllBVUJXL1g1dUVBcS8y?=
 =?utf-8?B?U0FOZW5uaytBUzRaMGVZbVVnU2tLWUlBMTJ3SHZ2bzJqNVBhSFY2VFVNcjVa?=
 =?utf-8?B?OWpnMzJmcERoSzM3V05wN29admZpYVlKeUdYWjdsQmNRa2lWSVF3ZTZBaDBC?=
 =?utf-8?B?MXUrTXRTNGpjOUR0VlhsZGZMdytwNStxRWhvODdGaGMxeE0vUkU5L3pSd0lF?=
 =?utf-8?B?ZnJrMjFqRGNwK2huL0RocjdqN2EvclRhK25RaFd6VUpBYktOVzZhckRYcVgw?=
 =?utf-8?B?MUNaYy9Yb3A2SktsRm9HVWRNdWJpUWtFN1pMeHdraGdSQzFiSW5aYlY4RTRX?=
 =?utf-8?B?ZENBaTIvRWtYREZmc3lIQjlscnFzWVpUaS9SK2I2MFJUNnJQdGtTc0pPczZQ?=
 =?utf-8?B?S09hQjk5MC82cWNsRUNiS0FIZzR3SjFlcWM3aHU0TTFoRTFSNWQ3ZEc1UUxC?=
 =?utf-8?B?SGIzY2Q1RnJlM0x3MHFYMDgxM21kOTlCaXZCcjRBYWJaS2RIcFBUZlozTWhY?=
 =?utf-8?B?OFZpVFZIWnBoQkRST3BEY2Z6alhsSUpaM1RmakhBdnIwWUlLdGdzMnJYODNy?=
 =?utf-8?B?VGFvVmJmWmlFdVg0UU1YV2VaUzcwcThyUExSTDFndE5ycFRKYlpVQWt1OW5O?=
 =?utf-8?B?aEI5c2dLbDgyZVV4bm03OVBMdi80Njd4TS9WekVXMy85UERoeGl3SnlMT0Ew?=
 =?utf-8?B?VFNkMWROQTVCTDZVWXhlQUpBVHRWQUcvN1FFWmp3NWhUMFJsbWxTMjczb1dT?=
 =?utf-8?B?Uk1sbkU0RnV2ZXZtdlFkbTlsalUyTE1Db3hZc2Q2cnFJTlZmYzNoZklGbVRr?=
 =?utf-8?B?dEhObDM5dEJ0akF6Qyt5REx5L1BJWnhOQyt6L1N2NmRScWg4SGlrdG9KUCtP?=
 =?utf-8?B?QlZOSDNSVjR4SmJKUmh1SVh4M0NodE1jTDkxUlNuQldNY2p0WXRRa2xjZmdC?=
 =?utf-8?B?ODFpamhndmh4UXpiRzZaUVVyNFlaT3pwVFdUU21mSGdjUXR1VXBFOTdCVlJP?=
 =?utf-8?B?NHRRN2lsRkRTYWlDQU9pNDlJTXh2RTR5TWFvYVh3aFBDaFVwNjRwb1VrRjYy?=
 =?utf-8?B?dGoyTHpvVy9lQmJmUzhCQzZqZHBnTC9CKzJUc3pWZ3dmUytyOWVMSXR6WUw2?=
 =?utf-8?B?ZzVHd01EcFJ6QVV6cEdSUUtoK2lwWGMrRzB3MExqdHFxa3dTL3llVk02YlUx?=
 =?utf-8?B?TFBNUUJPVW9VaHJzQ0NFZmNuMjBMU1BtTURISW5xY0JQdzAwN0pEVVUvbDBG?=
 =?utf-8?B?T1dFZ29WVTFNNExxVFZOaFhPTUhLbmFuajgvbGdxdENSc2hvdzQxamhEZkVK?=
 =?utf-8?B?U2M2Z0JrQWUvdk13Lzk2RzNORTJ1WitzS2QzQnJPazRzN3RZcWhEc0tGcVFS?=
 =?utf-8?B?RGJaVnp6V3V5TVRIcUpSUG8wUlgxaXNJRXZYQlU3OThUMnk4RmJDRWkwVFRh?=
 =?utf-8?B?VEplb1J6UThJeGRjYXdHWlJoaktXSkJpQjBQdDBmbGR5dnVKSTkxTkN2QWo5?=
 =?utf-8?B?aERLaC84SCtwMElRVzBSSUtFY3dJb05aRU1veDZFclB1SGhQWnMyVnJNem5L?=
 =?utf-8?Q?vqhi20ZQWhKgGwy3ANV1OVItd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62F69AD436542642B5D6860E5046AD12@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	t8MlyvVfwUxBxXGE4O7idDxW9ZQLe2EbL2Ha/Vx0jXaDbtQ6ydr9tuVSLv2xmy4WCxRjPQOPm0PHHM+xAUDjOxZ3WN5IKzWyjz7N0ZCbCmcJlGARbtg0sH3fX1vUszB9OKG5cE+/fPU9qJns2kgIUBhIfthfp1KMyAxmzqQ5GEB2BHJU08R27zAkOH1uMleKt1qnLh/PGTuQhLeDmvgCufYaJnaWovr+DWmY6o09dwyaK2jdrZmCrzWEU3H6e1e+c19T0UIxRjs2UwQ8LdZg1jr3EjC9BzqcnWYBGg4eCL1zqaDF6o/jXVfeJks68jSbyNnoxn4ZdsNgfTvt+hF0+FBYuiWH50nMFcMVDs/FwvmKEAGjiKSV1fS9DBXVaWTAlRJvhB6qK/ENqC+1vJcbJWnDIn+SyHAPkisq8Rk9L21EFLRqEkCC+rZ+DkPq8/8Bx2FBtij6uLEbW3HvCrl4nndiOw0X3cfrKRSQ20DMbFevcwVRSeGdE2x+tITO4y0AgjFUNWqJQXKaogAHSho+P7zwydYFkpK/jyJmYd5HW6Kazhf/W5aU1cQ6dxEeuxEzV0CL40VuXOWETaYcwGC5Pqi2dRTu5bFxwgeKL7uJrtlNrc9JvN5lOQWw5qjBmPhSXz2bH2bfBDcxyv2vaERFdGXxGRmhkZZr3ayFXuKaw5CRUDs0DUX1jDJ69A+Q8xohbyMp5z89wFfOdeTMv1/q6Tv6CyeGGuaL1S6fH3cgBX7wUhUlnsZA7EnGa4Yp+UYCIcxQGVZDyOO3c9o7Y1NTsFGZs3LRNypABJesJTs3Hzry6UjUkhbzKUXk2x5bXdNRLTJcyMDehDSRb0Uc2pMfwNTOHuPOrn9A5balJPsWVRnyGAfn/JgUljRIKrFgQyKmcGl2tAuQ/jbd//8H+cAovg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6bdd81-9588-4803-0838-08dbd1bb156c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 22:22:45.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ETI1lr2hxEIQVvTH1gdeY2CD+OIr/kExpP36iYdPlRVZoUaIWbz5LVCUm7d7Zpw0GVzxrirdnHt7Et8M+Vvjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029
X-Proofpoint-GUID: iMhP35VGwsnBCsYl-_BWB2Hc18-MNFH6
X-Proofpoint-ORIG-GUID: iMhP35VGwsnBCsYl-_BWB2Hc18-MNFH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=601 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200191

T24gTW9uLCBPY3QgMTYsIDIwMjMsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IEhpIFdpbGxpYW0s
DQo+IA0KPiB3ZSBlbmNvdW50ZXJlZCB0aGUgc2FtZSBidWcgeW91IGRldmVsb3BlZCBhIHBhdGNo
IGFnYWluc3QgcG9zdGVkIHRvDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2dpdGh1Yi5jb20vYW9zcC1yb2NrY2hpcC9SRUFETUUvYmxvYi8yM2MxNDg3ZjgwNjBjNzlmNWFi
NzNlYmM3YmNjY2UxMGM2YThiNjU1L3BhdGNoZXMta2VybmVsLzAwMDEtdXNiLWR3YzItaG9zdC1m
aXgtY2hhbm5lbC1oYWx0LXdpdGgtdW5rbm93bi1yZWFzb24ucGF0Y2gqTDI0X187SXchIUE0RjJS
OUdfcGchZHcya19Yei1WMHItZkZnSEpaZVFFSS1nRDBxNk9zNHpMTFVwTGE0WnA4TEhsVHlwNjFo
LVVaMWozTVg0dUQtTjMzbnY3Um9aMVRFRnRBWUlPT2skDQo+IA0KPiBXZSwgdG9vLCBhcmUgc2Vl
aW5nIHRoaXMgZXJyb3IgY2FzZSB0cmlnZ2VyZWQ6DQo+IA0KPiBbTW9uIEF1ZyAxNCAxMDo1MTow
NyAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6IENoYW5u
ZWwgNyAtIENoSGx0ZCBzZXQsIGJ1dCByZWFzb24gaXMgdW5rbm93bg0KPiBbTW9uIEF1ZyAxNCAx
MDo1MTowNyAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogaGNpbnQgMHgwMDAwMDAwMiwgaW50c3Rz
IDB4MDQ2MDAwMDENCj4gW01vbiBBdWcgMTQgMTA6NTE6MDggMjAyM10gZHdjMiAzZjk4MDAwMC51
c2I6IGR3YzJfaGNfY2hobHRkX2ludHJfZG1hOiBDaGFubmVsIDAgLSBDaEhsdGQgc2V0LCBidXQg
cmVhc29uIGlzIHVua25vd24NCj4gW01vbiBBdWcgMTQgMTA6NTE6MDggMjAyM10gZHdjMiAzZjk4
MDAwMC51c2I6IGhjaW50IDB4MDAwMDAwMDIsIGludHN0cyAweDA0NjAwMDAxDQo+IFtNb24gQXVn
IDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX2hjX2NoaGx0ZF9pbnRy
X2RtYTogQ2hhbm5lbCA0IC0gQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3duDQo+IFtN
b24gQXVnIDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAweDAwMDAw
MDAyLCBpbnRzdHMgMHgwNDYwMDAwMQ0KPiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2My
IDNmOTgwMDAwLnVzYjogZHdjMl91cGRhdGVfdXJiX3N0YXRlX2FibigpOiB0cmltbWluZyB4ZmVy
IGxlbmd0aA0KPiANCj4gQXMgdGhpcyBwYXRjaCBpcyBmcm9tIDIwMjEgYW5kIHRoZSBpc3N1ZSBy
ZW1haW5zIHVuZml4ZWQNCj4gaW4gdGhlIGN1cnJlbnQgdXBzdHJlYW0sIEkgd2FzIHdvbmRlcmlu
ZyB3aGV0aGVyIGl0IHdvdWxkDQo+IGJlIHBvc3NpYmxlIHRvIHB1c2ggaXQgdXBzdHJlYW0sIHJl
c3BlY3RpdmVseSB3aGF0IHByZXZlbnRlZA0KPiB0aGF0IGluIHRoZSBwYXN0Lg0KPiANCj4gCVJl
Z2FyZHMNCj4gCQlPbGl2ZXINCj4gDQoNClBsZWFzZSBtYWtlIHN1cmUgdG8gZml4IHRoZSAkc3Vi
amVjdCB0byBkd2MyIHdoZW4gaXQncyByZWxhdGVkIHRvIGR3YzINCnNvIHRoaXMgZ2V0cyB0aGUg
cmlnaHQgYXR0ZW50aW9uLg0KDQpUaGFua3MsDQpUaGluaA==

