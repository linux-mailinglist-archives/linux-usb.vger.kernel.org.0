Return-Path: <linux-usb+bounces-32209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 943CDD162EC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 02:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D647C300CB71
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 01:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05727E7EB;
	Tue, 13 Jan 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WWjDWqQo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BlTKellQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rm6tbhV8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8310199920;
	Tue, 13 Jan 2026 01:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268352; cv=fail; b=c5d8Z2t/HkreYHZY3IrE89zLMynW8qgopSbls+qZClQkW9cgUHyUL6Z4oBCwhsiUS2dk0Oi6fpQG5DYXA8WyBYAfLWd+g+zdU8b21I7ec8N6fndoeBWlM/sPq6ECrTRfPvp6qdc+8nc1KK76zgeyJkP9fkuzJwRorDWFpCP8RmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268352; c=relaxed/simple;
	bh=GtCMi+hbBl5GQxi4PM6dvy11m+T5nlXGOcjXVGvneKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F9OCfG1NtsZmvwRTuuDKVKCGyHZWwMMSLfVaLD07VysUaaV84fcAm734Y8jdZuVmy//j/GdUZ/1g3vWWAkkLVaCN6IqCp8NNbUFOitOu+cnMtg+BNfvXodAYYdmdmzi0dKQAADvB5hIU85CIaGbcwp9CePTVDW0ygUU4R9M0ZJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WWjDWqQo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BlTKellQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Rm6tbhV8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CKGf5t3837368;
	Mon, 12 Jan 2026 17:38:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=GtCMi+hbBl5GQxi4PM6dvy11m+T5nlXGOcjXVGvneKo=; b=
	WWjDWqQoLV7n9zWiF3ijv9tLEoj/3QfDOiUTmPYyZhyad3fQVL5ZAgii8uYIZ99T
	BW87sEbSsRoMDEDvf+MUA1U5PoGJEICB7REBVMTJqIlx5WDW0sg0Y+8egj+jV31D
	px4VS/ecPV17X2hcizHAKQORRScqUfAonMrIHoMfSCGVt3DsrPMf9dpFMkdL2YdS
	OfDMpHkFe+z5I0H1pFxvmx/caqV3q0dXBN5QyUAojWohSsU7sFrQ9rph8EbKXNCB
	8hLb6ZyBoTNlbZuKdepVIggeqbao+fFLtZQfmwd8J9tgCbZOY+Pbp3L/C1I8BE+W
	5publNZ9Ge55I8bZwJcygA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bkpnq903j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 17:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768268338; bh=GtCMi+hbBl5GQxi4PM6dvy11m+T5nlXGOcjXVGvneKo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BlTKellQF5QB8Jl8wIPYFY9miEy9KFUnNFQ58+9a9B9A5qC2b4+GegPQOu5ikGKoL
	 R8Fc8FVydG+zONQ/G2LPDYAGRCDQ2opilVoHsVoeCPNA40ULg18hBZKbacXP3YB3Oi
	 6xyrmE1zaieidVfilEn9n4t8mg/GLONWu6TRh7djlkOjftEc9Ui/0IZqHJfECGQaPP
	 ZhgKI9VN15oMC+jODMjCDmuy+1FhIOPPwCU8fwNONqRo7o3om3t5Qe+U1LbM6/HOIh
	 LUm8DshqhzTNz0BUQ61wPb2Q8sc7vKltmHTF7ydLZwiWzvDDxo87hHnj9BJyXagHtM
	 799ILpSHhyPFA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32687403A2;
	Tue, 13 Jan 2026 01:38:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 64B2CA0068;
	Tue, 13 Jan 2026 01:38:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Rm6tbhV8;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00107.outbound.protection.outlook.com [40.93.13.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 89F24401E7;
	Tue, 13 Jan 2026 01:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMibAqKd+gr+X5hq0zg2kFMS6mwHQlpOJnlxEPsgt2UYEF0aE/WVysCs90WjJmrrJzVO5dH4VVPxHa8y9ssDqnt+VvfiIqSNHWx5oSARTBxxUY30ZC6cySD/xPToyQfyhHi09Uwe8d3wfZqFINYrqKI3A+MDOXTQhk8z0nAxhlywmItcRmGzljuT41A5SqgHPBTMQuHdpg8gYO7W1sKZ9HCcUqSSyHyphD3+oPlbfUf6+nUD13+gwzI4b3rcP0NJ/de+TU+vJmGw3V/2fDAHnivvVG2SULEJkKxu0werPwvRLpUx+NUcmQPdpkzlCyk3h8TpEIj258sPAE7USyvKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtCMi+hbBl5GQxi4PM6dvy11m+T5nlXGOcjXVGvneKo=;
 b=M8epgIqi+y63Bkvl6mFW33LkREr7kNEBKiM2y/Ok7XVzbK+UfchmWS8WQCZx+256ss3jyPOtCh/n3eymhlDaRe8YSDtx4zWiUCOVeITzr2N6g6m/3Ch0pPkPzWmv+FHxNKGyUmIYrTejXKn0Eb/xpJYVmmFEg09IMfFq6QfABsu5LkZ2/8STHe8cgh6W62QF5AaWkBeY97vlJkYees6X7hMhHJatGGUG06z16lnDiNkKg1+96jWlNt3BBtN40S3NrJ0Xej/p+j3EP6qAbWZCdllZ+YNjHSlUTIPHSQysYTmiKdavSqDK3z5V7Por0IMlTWnbHqu8RY4dDW01YKEeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtCMi+hbBl5GQxi4PM6dvy11m+T5nlXGOcjXVGvneKo=;
 b=Rm6tbhV8sTnF0OpXrJ6OkgUPKxXHCd1pnTEp4IGA2p+De5JL9+rn+QLtGBcr/x8IAvyYBffMwGP5BsBRD3K0zV7fnNDNxTHRkojkEBoUu5RHSuArTkF9H9lUHQm5MJ4fEaqmq3CEqm50fh6OkI9rGSWPxvfC3n6PvGmwpkFW/BI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS2PR12MB9685.namprd12.prod.outlook.com (2603:10b6:8:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:38:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 01:38:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Topic: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Index: AQHcfjoF3oQQJwiJPEG0JsI/TTOU0rVJDzKAgACS9QCABbwXAA==
Date: Tue, 13 Jan 2026 01:38:53 +0000
Message-ID: <20260113013842.ryvstb6tmdmyqno6@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
 <20260109011813.6uxqrqzcf54y75xo@synopsys.com>
 <cdd3968e-e5dc-4e82-8e0d-accfb85823b4@oss.qualcomm.com>
In-Reply-To: <cdd3968e-e5dc-4e82-8e0d-accfb85823b4@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS2PR12MB9685:EE_
x-ms-office365-filtering-correlation-id: 32deb401-8b63-49fb-eac4-08de524482e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2dBQW5tbG4vcTdGNUowODg4TU1HTHBFZW82UjgwdVNTUGtwSyt4VGtKcVFt?=
 =?utf-8?B?NDA2MzNjUENzajhQK01tRmJBVEFPeXhsWG5lRGUwVkJtUU5RZDNTL24vMy85?=
 =?utf-8?B?d0tOMmkybU54b2hlQ2hDTnNZZm1CbXo1cDBqMnJqVDZzcWdiWnZ6YzZhZkIv?=
 =?utf-8?B?akl6RkZOQUJOaFF2bVl0RjV0OXhkRDE1SmdocjFta2lUWGNYSnh1bnNmcWJn?=
 =?utf-8?B?OTVyNVpOdTI0V0xBaU5JUUkzcEdxMWpYdVQ3MnZBMUJwSEduSnlxWHYvRkIz?=
 =?utf-8?B?TGdDd2J1dW1Fc08zMjBmaTVDU3dCS1Jydms5Skh0MDNVUjNkNjB2TmhMbjVs?=
 =?utf-8?B?cncySURaTURRWGZBa1JDYStIZTVHYXFJajl3NGI1bVNsOWVVdDZ4amtQQ2Nv?=
 =?utf-8?B?dzhYblE1UjN1Q0tSUjcvMTZubnVzcTZhckhscmo5dklxK1QwanBMUGtSemlY?=
 =?utf-8?B?WHlsQXpMcGdWdHFjY3ZnT0xXRUdRWS9kRE92Z012ZDBTTDdhdEpMTWpRQjRx?=
 =?utf-8?B?S3pWcENvN1h4dmFmZjFGVVkyMTU4VjU1ZzVHS1dvcUV5Nk1NTHYwZUJ6dkg2?=
 =?utf-8?B?bFJEUGdGYmRNdVRrVFU3UC8ybEtUZElQMnBiV09vUlZvUVY0MHNNbWVackor?=
 =?utf-8?B?THY2Zi9KUzhmN3ZCMXArd1Q5eGdkSzNBc2NMWmcrazBxaFJmU3J5WGZjZEFB?=
 =?utf-8?B?MEZRMVFnNURWd2pXczk1dTRlZDlaeFVQMUR2VkE1dDhXM0lxQk00UGRRWXFp?=
 =?utf-8?B?N3NqN0tEK2YzMldXVmFuemhJbDdVVGwxVGMwTklOZFFOZjRRLzZld0llRGMw?=
 =?utf-8?B?cnRhQ1M3QmVrZGtXTjFVLy9vajhGRVVabWdJMFJleGg1Z2xNejRnWkl1Nkx4?=
 =?utf-8?B?MkorVGE3SkhVV2I3VUlxNFdlQ2xlaEtWVU9QcXpzeHNWelZTeWFOR0Z5NTlS?=
 =?utf-8?B?ZS8raUdtNGdDWENURzB3SUxWdGlWeGxsVTZGNzB3N2paaXpLU2RidGoxMHhs?=
 =?utf-8?B?MHE2aDA5SDRTdmJCa1ZnTUMwSWloSHkzcDA3b2srUmUrNmhtZjdDSWQxd3dp?=
 =?utf-8?B?UlQ1eEZmbDlVb0dDSWlhYi9FOFRrdk1kd2paMVlLSFYvYnpjS2RpU1lZNVJB?=
 =?utf-8?B?NVJtSzgxbFh3bTFIODFTN2RsYXhvMHNrSURibjVXYko5ZWNCeVMwSVUvZVlQ?=
 =?utf-8?B?Y2hPMFdGTGVoTStuTXBUNm9kWWxmYkpoejJGN0JhODVaTWNDQ2xNVzdzQlZx?=
 =?utf-8?B?a3dQTmloWThWd1NmZVNoMEhvN1RCbzZCYWZvcFVuUDZlMEtMbDV3dlFsNGJX?=
 =?utf-8?B?UnFVYnlCVXhEREpKUVJYbXlzVzJnUW1PUllINWo5dnRKRXJ6NWxJN0ordGpq?=
 =?utf-8?B?L0RaS0tycnlRYmRZOGwwdElDbVdYRFU4bTBYQzlJM3RjaXEranpJdFFGY0pL?=
 =?utf-8?B?VWZMckhtb0laQzJMcXhIU1NSYnhmRnFrdHdhWXB4ckRtN2hPcUg3bkxZSVZR?=
 =?utf-8?B?VGNwMThLU1ZjdTA3N0g4Q1FHZ2x3U21CRFkyRjF2UG0xRHhwcEcrNlRZNWgw?=
 =?utf-8?B?TkF6R1dOSWRnNjlacy80a2xZOXNhRnlwOEo4QmhaM2oyc2lnanBvKzdBWE5G?=
 =?utf-8?B?cVFYL2JZR3NEem9kRVVzSUJUSlFyM3JIRCtMWi92bkwzL2hTcWg2b055Wmk2?=
 =?utf-8?B?dDdYYm5SMElSMnlwUGl2aFBXTVdBckpEOFRQZUdCRndqYUVqYlhPNk5UZ2c2?=
 =?utf-8?B?Z1hIZ2pPQU5OS24vQnpnbURrb2hvaEVuWlRWZTZqQnVRN0ZoMjR2NzlqcU9Q?=
 =?utf-8?B?Rm56c1BIVngreDFvaGRqK2Jub0tNeFBsTWFmQzBKbm9peEE3anFnTXNtemJU?=
 =?utf-8?B?Sk11WlBJdUZmbTlaYlBqclExUG0vQmQyMWpWWXFwRDZyVUZwbWYxZWxYTzJK?=
 =?utf-8?B?eXAvcEVIbk9GOC9NSDhkQy9ZcWRaYmY0YkkwYVJGMGR3aEdEUTlNOWV1UXY0?=
 =?utf-8?B?YzlkOTJkN0w5bTVyMytLK0VqZGo0Q002Y2hhTmkrZmNWeUxZaUVZc2lENXh6?=
 =?utf-8?Q?hzN6LT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXkzRTRFaExuOTVlMlBUR2pJZkkxVEV0Qko4MDlja0FmWUNqUEFGQUhTVENx?=
 =?utf-8?B?ekhxckNHQ0F4RkFZcGRCV1N1Ymd4OTlVT091eDhLaG9oRHovZ0pvVXkwUXMz?=
 =?utf-8?B?UGVGSmQwUWRWWmhsZE5vbzI0dzBiQXhVSXl4RTZabHM1RU5FM0VwaSsvNmpy?=
 =?utf-8?B?T1RnQ1grVjhGcmNybDdsZlQ5a2YxbHB2ejdTeWgxa2VkZ3NzUTBqVEMvTllw?=
 =?utf-8?B?c3pCUDZNbGVrTDlzYTQ3WXVDZjYxRFpZL1hxQWl1UmFDZHpYanFJTS9PM3hl?=
 =?utf-8?B?U0loeHN3QUp6Rm1ESzUwWUdsdUpndk9Wb21ERnBWNXpwTDlDREtsSkJGVVJw?=
 =?utf-8?B?WmxKRitKWFdFeTViSzFvNW9Jc1NIcmdpNFpwdmVEaGR3ais5cnhEUFk1dmd6?=
 =?utf-8?B?MUhNVlNib1dha1QwRWUvTXh6ZTJmL3J4MnBzeTNvV0kvVXk4SWxXRU8xYk5j?=
 =?utf-8?B?M3c2a1ZhbUVQWkd3NkV2RW1vTjFIZFpBRGtFTGdaTHphUGJ0cGtBSTYwK21V?=
 =?utf-8?B?MGRScUYwK0tVeW9Qbks2T1VtM3pSWDNYL29wY0tXMFhGMmh5VW4zOEhqazFV?=
 =?utf-8?B?YlBlWHJRdjZGM0JIOXVVeldRRFZHOVRzQWdPN01odUJTWXgyV2luQVAza280?=
 =?utf-8?B?Mm5zbEpkeXduajRsbTJKZ1d1bjhkMWpwQ0JmVjV6NU5IOXcvZlVFSW44TDJS?=
 =?utf-8?B?THB5WUMwMlpkZWQ5bHpIZWxPa0lVbUxKRXN0R1hPREJ3eDhaNFpOWG9GQW5a?=
 =?utf-8?B?bzFUaXFZaTZWdGRFSkd0UTJUVEMwMytwdlN4Zkh4Y0hjRlRFeWM5QXZPdFVT?=
 =?utf-8?B?b2RLWXVSYnpxb3llYmhRbjYzL1NEUWxWN25PSEtjbStEZTFlZTQ0Qjh6SW1r?=
 =?utf-8?B?bHZ6NHBqaTNLNkZHZHJrdUlCcGNCNGo2MCtudHFtN2hueCtwb3NZT00wU3h2?=
 =?utf-8?B?ekZBQzg1eFErZlZnZ3UreUlwQVBhZy9mZHNzRk5DQ2ZZVW0vL3A2LzRSL3Mr?=
 =?utf-8?B?V0k5TUljZ1VIQmNZRU0xK2VMME5nYUpORTdmaFJ0bi8xaEdRTC81enVwWGdV?=
 =?utf-8?B?WUZWU2tIUnFqbHpuWFNERnVvZkE1M3BuYS9vOVR3TGNPd1diYXRBOFhUVkdC?=
 =?utf-8?B?V2I4THpaMzlreEZ0dEsvaUxzbjV6U3RsL2ZSSTcrRzdKV0RIU2xBU0EwdWVi?=
 =?utf-8?B?eHk0TGlna2FQYmNXbUZhdE1YdkNvUEFuRkxkVnhOdkRBZzdJNzFjcmpDR1hY?=
 =?utf-8?B?Y2ZYNWNFMlhiWndDNHE1QXFtSE5wN244TVpkakpBK1RldGRUT0Y1UUNzelhH?=
 =?utf-8?B?cjlTY2ZTTXNZY3ZBbW1LQ290VGlwbUtyWmp5YzNSM2l4ZjFPMmR5amtUTUhV?=
 =?utf-8?B?OVpVLy9PQ1ArdUNzd21SVWdJZE15VHJXZlJxajRnSmxVb0o4d25uSzVvMzBT?=
 =?utf-8?B?ekJsbmFEZ1JZYXl0MzVRZWR3UUo1MkFGaDBmcFQ1NWxBTDVlTGJqd1N6R0Fr?=
 =?utf-8?B?YWwxNGtrblZ0a1ZXQURac1JEbzhseWZHM0VzaTMrSnFtQ3VZelVyQTFGYm9k?=
 =?utf-8?B?RDJZdWJ4blo1ODB0ZTJlTlhBSUdQcUdCdmJIMW0vTW1FdytxUHhiTXNZdjdC?=
 =?utf-8?B?WnhaNmVueEMvSFlmUkk2SEVFNEtQTk1ZSUFPZklQV0NtRmdLa013ek0xdDR4?=
 =?utf-8?B?c3BEaXRlbzJURFg4STByTlp3ODFuMEFWd2ZpYkxSZWExK1lRNkpZNHptSW90?=
 =?utf-8?B?UEtGVmhCWkMrMUp3Wi9JckgwL1QyYVF3TmVkak9CenNaWmpsZmhaNmRmbVB0?=
 =?utf-8?B?ZGRYRjJIUWFFaXlTU1VhMmxBM1lXOWNTOW5kTmxVOWsyMFpZa1NsOUxyeWJH?=
 =?utf-8?B?TlAwMG1lZlc2ZGh6MnhBOVI3ZjdXYjJhUzhvYzllSS9kTGhORVBQekhsUU1t?=
 =?utf-8?B?N1MxejJsUnYzOUJUSGNHTlpqc1dWMkVhM0kwQ29BRkpJMTB5bG9BQUUwSUJj?=
 =?utf-8?B?M2dKZ3lsQlBhVW5FQmg4NUUzSVd1WlcxQVlobFRPS1lKcHBmV0FrbGFvTGpk?=
 =?utf-8?B?RXF4NGtLdzdTOHRtWkRqUGFTUzJNT0xHODdkQWd6V3RvR1FWeW1IRTZ1LzRp?=
 =?utf-8?B?K2o3eVQ0RGJqWTZHQ0FJN281NHlTZHBQeTF0ejVheHdIRkwxc1dnWUQvcVNC?=
 =?utf-8?B?bDRpaWg2YkZoR1hlZzdTcnRVL0F1Q3JTLzVSMDRabm9ON0tpYkorVzFHcTho?=
 =?utf-8?B?UnIzYzVySlc3U1hTZTh3N1VXQmlSSG5MUFlSa0xoL2tKckJTRnVkZmxqZEZY?=
 =?utf-8?B?WTFpY3l1WHpLYkxQR1FUUW40aTFaRW50UUhoTlAwZi9DRFcrZ0x2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CAB9EE451904B40B665FE25576598D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lyJK9OU69zzLwCVUqu4NA6NKmlCjoYN4PAI0mwRKgL/VkC1CzLDoSGa7gDTbIbCG3fClTY82x2v0j6HrMQwVwfNo4H4KGl5G1CIOtP46e79Bx5HTEmqWyDj8ofnzVluVvTyjzxcVhNNzGcghNEd6eeuAkHal2U/0nE0aTjCdnSU176aUv/3uFAj0oaL6i66+A9jWd0tKMTe15Af25luVBjpAVs4JBqrhwiCUHt27HfWaAb3dP5RLyuT+Ysl4ZTl9nuAsI5gbmoA+p2+0/B4cAvk75MtB7J7pyOseKZgJD8AwVGg0hsa3uBAwFl//h5GwasMpjQwv51heuNYEdAYVP6pJg5tI0SItJOoefxvZqY+5Q418DFEySF8HJ9mPHHgZHkHyjeLIM1dsmQKelHxx++CyKm+Cp3V2vH7UuDIyDB/EtMKxaWZneHk3g4c4Cd4QIgaHjTNd+HWzPHQU17wKBJReF49Clc6UvaGaAskxkl0pUBM8JC7uXqMGgmLivLevhCi8KdYWQ+KHA9lh542qGIc3caS+HX08Y3gkzu+qtC83tQGQNOK0d0eXECD9Gzhzegho4gYiCRkvHrvPJ+XgIsXWC708Auhrag/SIHS1eEwWa2QHP2zhBxdKWySGEt8LxkW6zVQIMqAeUTo186BBKA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32deb401-8b63-49fb-eac4-08de524482e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 01:38:53.9812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUyckmnzjQY+7+Yiq3P0TuRG/XgS4Dhy9elXjV0yMeZKTLlXoM1kUtpoQSGJPGF40SAMzRFS7dNazm4cBYmaqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9685
X-Authority-Analysis: v=2.4 cv=NpzcssdJ c=1 sm=1 tr=0 ts=6965a232 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W5szHbn08CTsn6lRZJcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yqL0pyKXNI4X-eCfFnTq-ICZ2Q4HVk_7
X-Proofpoint-ORIG-GUID: yqL0pyKXNI4X-eCfFnTq-ICZ2Q4HVk_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMiBTYWx0ZWRfX+7L9NJwUF2Wb
 4WVzMjoEdKEzxQqRAdtPhPhQM+Xq6wOhzRpWKUz0FT+jKoBt3x7GBI233XXra3UimmUj1QENvAU
 ETUrroKoqL3RmIDSbnobnO2ucoEfEnLsOcO+Tbdd/eGpyOUuWRQbZYiUD4tv72SuRuWetYvhF/J
 HJ0TLtONHq0uIN+BLE8VvBeBXvp6AymidEd/AxuTZHZj3YiL5eEzTCjLtUhj6bxG9z0DmF7/1QV
 dAgEdUbINv2q4bXt7Fu47ZLstYBT1hyogG5pbfeq3qjr1RfYYKq5oKdih2xuAp2N2UWyiKwj+OP
 JHUWQLfbHdrVz4BkanNFqevmO0rrEjmslFznUTJepvLFDICZTHbjpkRDPYsZml+ytTA+b5jWG5j
 HSZt0DGB9uEXrI77kxkxsy+zve/C/owQzXy+ZukTR6aT8bfmj9WJXFWt6OldU26yjH8TQkXqs4B
 pVeYSXYym5LQmnKtpMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130012

T24gRnJpLCBKYW4gMDksIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDEv
OS8yMDI2IDY6NDggQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBNb24sIEphbiAwNSwg
MjAyNiwgUHJhc2hhbnRoIEsgd3JvdGU6DQo+ID4+IFdoZW4gbXVsdGlwbGUgRFdDMyBjb250cm9s
bGVycyBhcmUgYmVpbmcgdXNlZCwgdHJhY2UgZXZlbnRzIGZyb20NCj4gPj4gZGlmZmVyZW50IGlu
c3RhbmNlcyBnZXQgbWl4ZWQgdXAgbWFraW5nIGRlYnVnZ2luZyBkaWZmaWN1bHQgYXMNCj4gPj4g
dGhlcmUncyBubyB3YXkgdG8gZGlzdGluZ3Vpc2ggd2hpY2ggaW5zdGFuY2UgZ2VuZXJhdGVkIHRo
ZSB0cmFjZS4NCj4gPj4NCj4gPj4gQXBwZW5kIHRoZSBiYXNlIGFkZHJlc3Mgb2YgZHdjMyBjb250
cm9sbGVyIHRvIHRyYWNlIGV2ZW50cywgc28gdGhhdA0KPiA+PiB0aGUgc291cmNlIGluc3RhbmNl
IGlzIGNsZWFybHkgaWRlbnRpZmlhYmxlLg0KPiA+Pg0KPiA+PiBFeGFtcGxlIHRyYWNlIG91dHB1
dCwNCj4gPj4gYmVmb3JlIC0+ICBkd2MzX2V2ZW50OiBldmVudCAoMDAwMDAxMDEpOiBSZXNldCBb
VTBdDQo+ID4+IGFmdGVyICAtPiAgZHdjM19ldmVudDogMGE2MDAwMDA6IGV2ZW50ICgwMDAwMDEw
MSk6IFJlc2V0IFtVMF0NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHBy
YXNoYW50aC5rQG9zcy5xdWFsY29tbS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMgICB8ICA2ICsrLQ0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8
ICAyICsNCj4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMgICAgfCAgMiArLQ0KPiA+PiAgZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYyB8ICAyICstDQo+ID4+ICBkcml2ZXJzL3VzYi9kd2MzL2lv
LmggICAgIHwgIDQgKy0NCj4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaCAgfCA4OCArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gPj4gIDYgZmlsZXMgY2hhbmdl
ZCwgNjYgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
ID4+IGluZGV4IDY3MGE5ZDRiZmZmMi4uM2FhODVmNWYxYzQ3IDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiA+PiBAQCAtMTU4LDcgKzE1OCw3IEBAIHZvaWQgZHdjM19zZXRfcHJ0Y2FwKHN0cnVjdCBk
d2MzICpkd2MsIHUzMiBtb2RlLCBib29sIGlnbm9yZV9zdXNwaHkpDQo+ID4+ICAJZHdjM193cml0
ZWwoZHdjLCBEV0MzX0dDVEwsIHJlZyk7DQo+ID4+ICANCj4gPj4gIAlkd2MtPmN1cnJlbnRfZHJf
cm9sZSA9IG1vZGU7DQo+ID4+IC0JdHJhY2VfZHdjM19zZXRfcHJ0Y2FwKG1vZGUpOw0KPiA+PiAr
CXRyYWNlX2R3YzNfc2V0X3BydGNhcChkd2MsIG1vZGUpOw0KPiA+PiAgfQ0KPiA+PiAgRVhQT1JU
X1NZTUJPTF9HUEwoZHdjM19zZXRfcHJ0Y2FwKTsNCj4gPj4gIA0KPiA+PiBAQCAtMjE5Myw2ICsy
MTkzLDEwIEBAIGludCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0
YSAqZGF0YSkNCj4gPj4gIAlkd2NfcmVzID0gKnJlczsNCj4gPj4gIAlkd2NfcmVzLnN0YXJ0ICs9
IERXQzNfR0xPQkFMU19SRUdTX1NUQVJUOw0KPiA+PiAgDQo+ID4+ICsJLyogU3RvcmUgdGhlIHBo
eXNpY2FsIGJhc2UgYWRkcmVzcyBmb3IgbG9nZ2luZyBpbiB0cmFjZSAqLw0KPiA+PiArCXNucHJp
bnRmKGR3Yy0+YmFzZV9hZGRyLCBzaXplb2YoZHdjLT5iYXNlX2FkZHIpLCAiJTA4bGx4IiwNCj4g
Pj4gKwkJICh1bnNpZ25lZCBsb25nIGxvbmcpcmVzLT5zdGFydCk7DQo+ID4+ICsNCj4gPiANCj4g
PiBXaHkgc3RyaW5nPw0KPiA+IA0KPiA+PiAgCWlmIChkZXYtPm9mX25vZGUpIHsNCj4gPj4gIAkJ
c3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQgPSBvZl9nZXRfcGFyZW50KGRldi0+b2Zfbm9kZSk7
DQo+ID4+ICANCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPj4gaW5kZXggMjMxODhiOTEwNTI4Li5jMTZlNDcyNzNl
YTAgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4+IEBAIC0xMTc4LDYgKzExNzgsNyBAQCBzdHJ1
Y3QgZHdjM19nbHVlX29wcyB7DQo+ID4+ICAgKiBAd2FrZXVwX3BlbmRpbmdfZnVuY3M6IEluZGlj
YXRlcyB3aGV0aGVyIGFueSBpbnRlcmZhY2UgaGFzIHJlcXVlc3RlZCBmb3INCj4gPj4gICAqCQkJ
IGZ1bmN0aW9uIHdha2V1cCBpbiBiaXRtYXAgZm9ybWF0IHdoZXJlIGJpdCBwb3NpdGlvbg0KPiA+
PiAgICoJCQkgcmVwcmVzZW50cyBpbnRlcmZhY2VfaWQuDQo+ID4+ICsgKiBAYmFzZV9hZGRyOiBU
aGUgSFcgYmFzZSBhZGRyZXNzIG9mIERXQzMgY29udHJvbGxlci4NCj4gPj4gICAqLw0KPiA+PiAg
c3RydWN0IGR3YzMgew0KPiA+PiAgCXN0cnVjdCB3b3JrX3N0cnVjdAlkcmRfd29yazsNCj4gPj4g
QEAgLTE0MTIsNiArMTQxMyw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gPj4gIAlzdHJ1Y3QgZGVudHJ5
CQkqZGVidWdfcm9vdDsNCj4gPj4gIAl1MzIJCQlnc2J1c2NmZzBfcmVxaW5mbzsNCj4gPj4gIAl1
MzIJCQl3YWtldXBfcGVuZGluZ19mdW5jczsNCj4gPj4gKwljaGFyCQkJYmFzZV9hZGRyWzldOw0K
PiA+IA0KPiA+IENhbiB0aGlzIGJlIHUzMj8NCj4gPiANCj4gU3VyZSwgd2lsbCBjaGFuZ2UgaXQu
IEFuZCBhbHNvIHJlbmFtZSBpdCB0byBkd2MzX3JlZ19iYXNlLg0KPiBMZXQgbWUga25vdyBpZiB0
aGF0IG5lZWRzIHRvIGJlIGNoYW5nZWQuDQo+IA0KDQpJZiB3ZSB3YW50IHRvIHJlbmFtZSBpdCwg
cGVyaGFwcyBqdXN0IGNhbGwgaXQgImFkZHJlc3MiLg0KDQpUaGFua3MhDQpUaGluaA==

