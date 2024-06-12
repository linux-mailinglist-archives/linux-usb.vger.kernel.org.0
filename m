Return-Path: <linux-usb+bounces-11168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC93904AF9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 07:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8071F22475
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 05:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8C73AC0C;
	Wed, 12 Jun 2024 05:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="kxjd9X7l"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2119.outbound.protection.outlook.com [40.107.255.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A41383A5
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170562; cv=fail; b=CnE+SpkJ6yolAdPJNtNFy5D96a5jDY8LLHLrUp92sigYlutOIBS5CeeSMfGOWO2Z6/qB8MczmaSpp9KY/54REAwN9WVoPHEzRyf+O4/btoJKG1qtb3ufqC2CfA/jzwtDVJwxUW0dSPD2Yds+bm7ysfGISTe4kjh3vgn9Obo3FN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170562; c=relaxed/simple;
	bh=jEhXajocuR/s2cWAZABDXrhZuxRBMgYMVgHHC+Aq040=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m1GmfHXcVH3PGPc/5+NWlllCeQmRwQfEYKDvyZr1LtSmQ3VauK5JCurtQsRcYCYMI8gpGU/gpORfFwQLekr2DHzPYK0vWiwal/volJezZpG7oS4isCuRRg4C3jfPWFI57DjPEr2JMeaJNNVUcWgg7CEaFagXpiB/63lO2HClk5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=kxjd9X7l; arc=fail smtp.client-ip=40.107.255.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7CX6lSV/aQhmG/CLnbaC9QWySw8edpNPpMkcNtwqe7dPqhIMr93YHwH0MXtuJWKN4VCLI0i/83772LBPa2xWMYJnhlmiJH4/BOtK/uF9P847yfiXJ1NshW8vTz69RhYUY2zLEWYr1meKaI7VGDDfLwoEx6c1ooMRSmN1Wmczc9YJ4eUgcR8V9JS1wsS8psxT/0SSFPFNmPukuxc5BuJbMmsePyM0TAponK8zOh1sIWzHVHiKAHF9JwXaEHlN0TdIGxGX2jvPOOFwN34q6BS7JrOMtajcZAODjDP6DYOYsZCmIpory1NAGvuJqpfskhhIAjGgZ3obOmLxr0rAPQI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEhXajocuR/s2cWAZABDXrhZuxRBMgYMVgHHC+Aq040=;
 b=K7uc4FxFbaWF+NnkkqxD5oC3+Qgnh1EbLmsAFDyOcAAOCoNwP0jOEQF745ZzkAntaPq4FAYvXRCdPTbvWopqnoGMiI3d3hV283eukfVmZhw6Rzu7zADhZwLCyGcLccG4/uft3ebGu0ZOtG1TJu2PlRzVx0j+u4mmAKKnPg6um9XMBaGfzXt1NKi4J2I+DSo7OWAj3xy4xxOycoNR5vsHb34pmlRa4rCJvlLFsJUC+YBUcF6DSKvN0oU5TV0K4Q/IReTa9ztMNh/YHXlb360+gxGvr5+/3OmhHJw5cdUkMGzP/t4I6eZhMy0JdYNYpMJO48TJdbhD2isKryePvYqScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEhXajocuR/s2cWAZABDXrhZuxRBMgYMVgHHC+Aq040=;
 b=kxjd9X7lQDNaeH5PaPNjzdX+pGMKHkj5egpZzKTBqXjc5OweAEhDbDKDlS/AxHashYHxp8LssXHSwDVubSto9X2ehlvva2ia/0gihC9mlUlbVOE3FWCfF0jYbtexgfFh8LKtM4MUnD38wN+zDFE9kSubvzpogpGbo2YoGhoipC1Ho3auoffziqex0HBxwuVGzPVvjGmHyEA4n8XvkGxFvYXTZF5VEvxGM235RxuORQa7mtJGLKLX4RxDv1SHELNwBbdxhgbiZt1fej1gZrH+GRkrKsf/fH2EAzMRTJFTXZT1VgzwU9RoIO7HrXICx3Lu1ghl/1yeWczOS8ybRXcjqQ==
Received: from TYZPR06MB6770.apcprd06.prod.outlook.com (2603:1096:400:45e::12)
 by SG2PR06MB5336.apcprd06.prod.outlook.com (2603:1096:4:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 05:35:56 +0000
Received: from TYZPR06MB6770.apcprd06.prod.outlook.com
 ([fe80::4522:999d:8f6f:140a]) by TYZPR06MB6770.apcprd06.prod.outlook.com
 ([fe80::4522:999d:8f6f:140a%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 05:35:55 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Jeremy Kerr
	<jk@codeconstruct.com.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix device address configuration
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
Thread-Index: AQHavG1d05Cp0QxdfEKy7n8B1POq1LHDgw4AgAAYkVA=
Date: Wed, 12 Jun 2024 05:35:55 +0000
Message-ID:
 <TYZPR06MB6770A341ACF092C2D4D08C5480C02@TYZPR06MB6770.apcprd06.prod.outlook.com>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
 <de1c329751bfc327901c969eafecb7624aaf6a97.camel@codeconstruct.com.au>
In-Reply-To:
 <de1c329751bfc327901c969eafecb7624aaf6a97.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6770:EE_|SG2PR06MB5336:EE_
x-ms-office365-filtering-correlation-id: 210d4a9a-705e-4925-ac61-08dc8aa187f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGpIZHFjWWZYSjJaQzRyRzdBdHAwQUhtQXl4ajlGQVVsZTBnSElDektPQlli?=
 =?utf-8?B?cUYrUzJvM1ROdXNCdnR3Z1d6TThWYWp1dzJUK1ZPUGFXR1grSDhiZW1qaGJ5?=
 =?utf-8?B?MzBKT1IzQSt3ZDMrN21pRmhvNDZQeUpwMDJ5b3RyczZvWmx1aWZnRW52Q2la?=
 =?utf-8?B?NTIxYjZjTGZ2T0xqQm5jQk40VWkyVXIzaHZBREVBczI1UUFWSmR5LzFNaHRG?=
 =?utf-8?B?WThkT3ppZmdJaHBCcEV4aXUzV3lNU3pwOHdZQ3NiRC92bnNzaWRGYnU1TGQ0?=
 =?utf-8?B?TlZLNW9HTlpnM0lTd0k1N09QMnRJaDJxSzdGSno4Vno0WDZWVVRDQ3JyeUto?=
 =?utf-8?B?TW9nZ1EvZGE4aE1kUkZCT0todHIrZkhub0tXU3o5dUluUmlSeUhLZFdhcURS?=
 =?utf-8?B?MWZQSGZPdm1OWHNFTlFsQnJYQmgrZms1ZjBnZ1k4M092ZXltNndmMWFNZG9z?=
 =?utf-8?B?VXdMUFNGWXhSc1NMbE9IV3hHSFFUVmNoSm5TTGxNY2hlTTJJMFIxR1NmTlA3?=
 =?utf-8?B?Q3g1ZGdoblhweDNHSzlMczVTMTNibkd1L2FKenlIaXlpamI3QTZNT3BlMEpy?=
 =?utf-8?B?aituRnVNMWw2MDl6Q29sM0xyODU4Q201VzArM2dNazU2czRxZUgwZzdxb0dE?=
 =?utf-8?B?UlUydGdIc1hWR29CODl4djFKZ1hxUHN4ZmFjYVUzOFhGMTdlOEI2ZVpYd2Er?=
 =?utf-8?B?dklTeG1KTVFwYkVrbEV0V3gwR0ZnTkR0djR1cjNrNlp2MzBxN3VwN1VjNXd4?=
 =?utf-8?B?eTErMGFRVnd5UzRDa1NvbkV6elppenh6Yml6NDBZaEM0TUVmN243MndLVVht?=
 =?utf-8?B?aE5JYkkyWXM3dkhTT2xPbWthbVlNbHkrdGhHNUlnd203VWduTXlVVkFiRmkv?=
 =?utf-8?B?OXoxOUJIOFRyd00vajFmQVpkL0VNbFh4VGF6QXVFY2xIamRiVTc4OTczR1RE?=
 =?utf-8?B?VTN5Qm5NTHFROVFLdmd6TzJsOFhISGRHSlVyTGpoSTJ2Ty9oVDF2elVSaTZC?=
 =?utf-8?B?OUpBOU1RY1ZldjhURUYvUjlVbVVxSEc4cFUzYnZVeE5weHh5aWdiVGhaVWQ4?=
 =?utf-8?B?clpNcm5yNExkZFNyTStJdnkwcTc2UW1wVlNWUEQvTk9NMWNjMktmUmtDdG1L?=
 =?utf-8?B?bHMyNkMzaVFHN0JnZUx1OEFHQ0d4Y2JGL20zU09maFhtOGh0bjJ6Q3N3bVRl?=
 =?utf-8?B?WGNGdWRNdEk4c0E4cEo4eVZ5ZVU1T01XMm1yWHZid2hpYzl6aVdNQ2h4TUVr?=
 =?utf-8?B?allZK1JxRWVNY2IxWmJ0NHRBTzJ0NDZKSlVnWVJJaFNWUlBrd0k1L2w5aWV5?=
 =?utf-8?B?MFVCZlBHR2ZtempRZzlMekY2UDhOT2E3bVZXcU15dmVUQ3VuTXRFSjg5ZjBi?=
 =?utf-8?B?U2w1azdwNzZMcG9pQ3NMM0xrVUkxQlFsMmFIcU5XTm5yNEU3clA3YW5hdWdW?=
 =?utf-8?B?TWtLZWhBQmdJNXBpcFFySHkySXR1SndVa040MFB2eUlHUmVoNm8zNHlkVXJS?=
 =?utf-8?B?KzRmWTBwdFJBK2VydjhxM3Y5bElxek1xWllqZzRzeHZoRjlSMlJRUjFMaEE0?=
 =?utf-8?B?Q2Rzalh6Unk0VUNvUWlkMlc0Y3Y2V0lnQjN5alkyYXdvSmY2L0N0Mit5UTNy?=
 =?utf-8?B?WjhxZE1Oc0pBbUZYMEdxRThLNXZYYTZPSkhqV2ZNOVM4ckVuajE0Z0VIc1p5?=
 =?utf-8?B?d2I4b1NoOUJNRDNxT2FzTTFOSXQzbXVVRTRCWlhmRzRkcU8yd2JrN0F2c29l?=
 =?utf-8?B?ZGJMbWYrTHhqSDA5QlpDb2pxTm9mOXZ0MjdZZUl1bHNTOEtqcmgreE8va1d3?=
 =?utf-8?Q?BpiShSBKuuzZdXv9daRsdd1C18/ltY5wuHa2o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6770.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1RkaEI0bm0vUHovakJUMkVzMURnOEZiODRWRmZKRW52QVdtamlOdm82VVJn?=
 =?utf-8?B?VVBPT2FCck5paDBGOFJmQytDVkJmK051NU41dTQ2MkNBS2pBUG9xRll2Ui9M?=
 =?utf-8?B?WjRYci92R1dlcHVsaUVtUDN1R0dadlZEWkNPVDlhTlJscUVoZzNKa2R3Nyt1?=
 =?utf-8?B?OWtCczhJTkN5T2EyaWJpZ0MzQ2xFN3BSa1JBa0RNeTQrTmNjSk5ibFJadEx5?=
 =?utf-8?B?anZtMi9EaDdDc2FSandMUTcwRzlrU2hBVW9nYzE4YUZxTDk0dlhxc0plbVNj?=
 =?utf-8?B?WVlzT1V5VG1XZXVaMk5zMm9MMldiWEVwbGRvVGtmZ3Bxc0N2ZUlKMk91T1Rh?=
 =?utf-8?B?OUE5RFBWcmlXVndtcmlXRDNWNWhsTG56QkRPaG0ySUlSK21IV1BvMnhqTmVv?=
 =?utf-8?B?TmxNOUEyYWt0SDJpTTVmR2ZSMHVFSmFIaUllV2lVd0prbUpQR3d6b2VNTnpi?=
 =?utf-8?B?M256a0cwR2VQL3lFUSt2VXBuRTBnSzFoMllxcXhweThIb0xNUW5qaEJDWHYx?=
 =?utf-8?B?dERFT2FXb2RoZlpiS0I4M2F6eFlYUWx6L2M5T2MwRllGWGhOSFBtaEp3Nk81?=
 =?utf-8?B?dDNaZGxJdm5YMVB3akFlZWlhQ2swc1N6ZFlMQ2RIOU1UeE5PUlNlR1Mwdlh6?=
 =?utf-8?B?M1Q2bTZWemJ5Wmx2YVNDQmlDY0lsdWRXYytVcHUzdlFlWFZvWExlbVN6UUw1?=
 =?utf-8?B?TGZ3ZFQ1Q0w2bklWNEs0VnVQellGRlo3S2FWVVZXOGZ0UTh3K0Y1V2pxOFhl?=
 =?utf-8?B?VXJJRDNHWlRkNlJNVnpkWURXa3k5bXhKdUZadGtiYlJucFhKSzhZcFpzbjA2?=
 =?utf-8?B?bmRaZDdLTGVlYmxrL3JFbGsvbnUxZWJpTjlJWjJTRWgycExCMXJoaE9wYXU2?=
 =?utf-8?B?U04yOWh1RERaSm5GWVpKRDZ2VDJNSnp3bW16UUoxOWZPSGdrSnlPbWhjNGN4?=
 =?utf-8?B?UTFXT2hNcVBNeUtJK2lrZmU4VHlXa3dZeWdXSjgvMmxMcTc0M1hhNVhlbGhn?=
 =?utf-8?B?QUtLMEJ6MkZkTGdWNFBzZWRnaTR2Lzh3K1I2Nys5b2hqZDdiNkh0SE5ra2F2?=
 =?utf-8?B?SGI2Y2t2cGdQck1iV1REV1h0NTJ6cmZVTk9TRGJteDFabEhqRTd3Nk1Ud0FQ?=
 =?utf-8?B?Z1RiYkZ6Y1dLdXprbTA3ay9ZM0gyTC95SkFyeGRhWkZuejJRNUZuYnE5WlBQ?=
 =?utf-8?B?WnF4WGl3d2JHNGZnVHFvOG5BTVNJcWRsZFprUnVQOTRYVm5jS3FKUVR6OE8r?=
 =?utf-8?B?Nmd3NWowUkZLWkxoakpmbUpnRUk4WUhCQmFFSkw0TlQ4MThQZ0xaeFFxNEc1?=
 =?utf-8?B?eVp2NTRJdnVhaFlxTjJtbkw1MnBWL2ZkdkQyaHl1U0ZNOXhNVWtYeklVanFs?=
 =?utf-8?B?cTJEVHliRys3dGwvZ2cxRWVRajRrWHNNd3hOR09Rcis3VGFEaGpCVnc5UHZE?=
 =?utf-8?B?eU4xa0RKeFpDbEQ3MGZVeVRZRzdOSEgzYWNzWEtiR1M0NEFZZEg1Z2VvYWFC?=
 =?utf-8?B?UlQxbG84R0tQcjVvK1lKZHd0Zmg5MmlRYW9sOURsMWFNT29rNW9pMG1MRE5Q?=
 =?utf-8?B?Z1JtMG5oeXJqOXdobk5KSjVsWVZjdjBLL1RVclNDMzRhMWU4VEhDeTBQbkNE?=
 =?utf-8?B?aWtQcnVjTUN4Z2I0REtFV3Y5elBEV21GRDJ1NTVWVzk2cDM2Q3JJNEErTm56?=
 =?utf-8?B?TEFLUlBoamtsM0dtT2J3ZDI1ZlhpbGh6K3NBTjZNVnJkNnU0QTBHUDRQQzN5?=
 =?utf-8?B?VHZsaHBId2JpelF4VWZyU3lRa3VnWVE0cURDL21HWERnZ1pEZjhHQVVjQlc2?=
 =?utf-8?B?bUxxaTd1czBPd1lLOFZOMVIvcVFJTGxFaGJEdzBSWU1rY0xCZEVxNHNCci9E?=
 =?utf-8?B?Z1pnWDYzaS9qREdkQTJhMlV2dGZvaUtiYnNuNUZRUTNiTXFlU1YremlyY0Vh?=
 =?utf-8?B?azZBMFJMNEtCT09JZnBHeElRTk53VnE3Q1NRWXp1RVVtaVZ0SExTODRGOGpO?=
 =?utf-8?B?Mno3TmFrWjJqQXNVOEJCbWlDRFAxYjNTandhcDVaSmZHV3pNRnNjcm1qL1M1?=
 =?utf-8?B?amtxTmJ5SVdJbVQrMVRBRW9Kck1vOFdHdGd5dDdTUzQrNUNBVkc1dmZsZjBR?=
 =?utf-8?Q?fr/ydEn541JGYyo/ejWwEciZt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6770.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210d4a9a-705e-4925-ac61-08dc8aa187f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 05:35:55.4534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 586eyphED4U6rSMz/qUgj3c3XsM90WHAxWIGbqM1WA+AUsgevJ+QS3OkgRBUMsk/ak2zr1ghrmikTtI6bRkf2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5336

PiA+IEluIHRoZSBhc3BlZWQgVURDIHNldHVwLCB3ZSBjb25maWd1cmUgdGhlIFVEQyBoYXJkd2Fy
ZSB3aXRoIHRoZQ0KPiA+IGFzc2lnbmVkIFVTQiBkZXZpY2UgYWRkcmVzcy4NCj4gPg0KPiA+IEhv
d2V2ZXIsIHdlIGhhdmUgYW4gb2ZmLWJ5LW9uZSBpbiB0aGUgYml0bWFzaywgc28gd2UncmUgb25s
eSBzZXR0aW5nDQo+ID4gdGhlIGxvd2VyIDYgYml0cyBvZiB0aGUgYWRkcmVzcyAoVVNCIGFkZHJl
c3NlcyBiZWluZyA3IGJpdHMsIGFuZCB0aGUNCj4gPiBoYXJkd2FyZSBiaXRtYXNrIGJlaW5nIGJp
dHMgMDo2KS4NCj4gPg0KPiA+IFRoaXMgbWVhbnMgdGhhdCBkZXZpY2UgZW51bWVyYXRpb24gZmFp
bHMgaWYgdGhlIGFzc2lnbmVkIGFkZHJlc3MgaXMNCj4gPiBncmVhdGVyIHRoYW4gNjQ6DQo+ID4N
Cj4gPiBbICAzNDQuNjA3MjU1XSB1c2IgMS0xOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51
bWJlciA2MyB1c2luZw0KPiA+IGVoY2ktcGxhdGZvcm0gWyAgMzQ0LjgwODQ1OV0gdXNiIDEtMTog
TmV3IFVTQiBkZXZpY2UgZm91bmQsDQo+ID4gaWRWZW5kb3I9Y2MwMCwgaWRQcm9kdWN0PWNjMDAs
IGJjZERldmljZT0gNi4xMCBbICAzNDQuODE3Njg0XSB1c2IgMS0xOg0KPiA+IE5ldyBVU0IgZGV2
aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0zIFsNCj4gPiAzNDQu
ODI1NjcxXSB1c2IgMS0xOiBQcm9kdWN0OiBUZXN0IGRldmljZSBbICAzNDQuODMxMDc1XSB1c2Ig
MS0xOg0KPiA+IE1hbnVmYWN0dXJlcjogVGVzdCB2ZW5kb3IgWyAgMzQ0LjgzNjMzNV0gdXNiIDEt
MTogU2VyaWFsTnVtYmVyOiAwMCBbDQo+ID4gMzQ5LjkxNzE4MV0gdXNiIDEtMTogVVNCIGRpc2Nv
bm5lY3QsIGRldmljZSBudW1iZXIgNjMgWyAgMzUyLjAzNjc3NV0NCj4gPiB1c2IgMS0xOiBuZXcg
aGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2NCB1c2luZyBlaGNpLXBsYXRmb3JtIFsNCj4g
PiAzNTIuMjQ5NDMyXSB1c2IgMS0xOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkL2FsbCwgZXJyb3Ig
LTcxIFsNCj4gPiAzNTIuNjk2NzQwXSB1c2IgMS0xOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNl
IG51bWJlciA2NSB1c2luZw0KPiA+IGVoY2ktcGxhdGZvcm0gWyAgMzUyLjkwOTQzMV0gdXNiIDEt
MTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC9hbGwsDQo+ID4gZXJyb3IgLTcxDQo+ID4NCj4gPiBV
c2UgdGhlIGNvcnJlY3QgbWFzayBvZiAweDdmIChyYXRoZXIgdGhhbiAweDNmKSwgYW5kIGdlbmVy
YXRlIHRoaXMNCj4gPiB0aHJvdWdoIHRoZSBHRU5NQVNLIG1hY3JvLCBzbyB3ZSBoYXZlIG51bWJl
cnMgdGhhdCBjb3JyZXNwb25kIGV4YWN0bHkNCj4gPiB0byB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIg
ZGVmaW5pdGlvbi4NCj4gPg0KPiA+IEZpeGVzOiAwNTUyNzZjMTMyMDUgKCJ1c2I6IGdhZGdldDog
YWRkIEFzcGVlZCBhc3QyNjAwIHVkYyBkcml2ZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEplcmVt
eSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0KDQpSZXZpZXdlZC1ieTog
TmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPg0KDQo=

