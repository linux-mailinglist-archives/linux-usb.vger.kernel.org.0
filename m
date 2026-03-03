Return-Path: <linux-usb+bounces-33932-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGSgMbl1p2mehgAAu9opvQ
	(envelope-from <linux-usb+bounces-33932-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:58:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DB51F8908
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A2F43184608
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 23:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CE8375F62;
	Tue,  3 Mar 2026 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JXXUAyyh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QOf/CChc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kLLbl3n9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175935D5E2;
	Tue,  3 Mar 2026 23:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582038; cv=fail; b=hrYmXyX2CA/YAo+KvpwgS75KhfY+g6g3K389fbQ4n1JS9ZqG8Ce93lexwWuuwt+eBepSz4CSKPbxEUdBaGiJrNo65efPGM1d/EMs/5/HiBFJ8edHw+X29nMJGXG0PnWCcYMee1oxRF8R/vwmK07Q0O5pciFDzAo/fE6q4Yo09h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582038; c=relaxed/simple;
	bh=XWs6z52r/z8uj/Ms7IE53QS+yXJIqv9nwGgx53iImrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GJi2b2JHJMeV/LJd1noKLN4lFTNSJusopp5HOvDs0TPRiC1YkD54//7e3+hirTj9FER1Q1/2a7UuVjqkmm+zAtM4Y4xlPoB0AC5tz8pJEWNaqBNH0L7JCLbji9Y1yaixx2bT/jGyrrF57GwW+cHbCHYZaCklA51HpdJzjb8gT+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JXXUAyyh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QOf/CChc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kLLbl3n9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623Kj4YY1667156;
	Tue, 3 Mar 2026 15:53:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=XWs6z52r/z8uj/Ms7IE53QS+yXJIqv9nwGgx53iImrw=; b=
	JXXUAyyh8QiNqiDqIwY8SwhC3GJKXXscrZiSzS8dTjxsjLNAiCdDDH106XMvF6t/
	yQS+MZXdGv7GRKsg2kfRIdaWl6WdtCASSgP/M99CwCcjMX7rRoEKOUcM4Lp72vdO
	v2BrSlII1j33FPtkPFm3SUJh0G5TvMTSejxGpih9+XhTDto5uDnegJn/LVTm8yzz
	spixDF/DC+iWi8Aiwnem/jTTcPQP8MdFnSCsx7VsrDmmz5nT/Fa4nrgXyFqRW0ud
	k+OO+VXxLzRwR+jBZYG1vgiaZlbegoRsTXHbT6dayQ5iIwx3D0XojZBq+2g5BVA8
	QxSLLEi+cR3PWFdGqJWSFw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cp1pg3j8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 15:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772582026; bh=XWs6z52r/z8uj/Ms7IE53QS+yXJIqv9nwGgx53iImrw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QOf/CChc1wPk6M9N4/t2p808qvPpucqL+cQ1ldIfphg3gbs6ENn3tOgSfQbpeiN3Y
	 74RQYqrJ23xPdvct1Be8Zi6S6ELfgU/AMcrN7YJq1U9eitvU4ThKW1DpjgYF6ET9MY
	 fXtsOYknKJ8IdhXQk1ey/z7yQlSyjzNkZmZlS9ZaTw4DqMCoYTwmOcXt9RJstJ9EqZ
	 PBh7mQpCE/bZwhzVZWA9TCLI3HtMhK/gA5jtc4y19RqeXzCEVUrBMmhkd8oqUqqk4r
	 oufhEYh1IbInfQO3UfxTFLjrDZKyfPENMnpz6BXMv1l84UJZlCxk/M/cAzVWtLwCGk
	 I8lq4Z3EIC9ZA==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1322B401FA;
	Tue,  3 Mar 2026 23:53:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B93F8A0271;
	Tue,  3 Mar 2026 23:53:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kLLbl3n9;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00102.outbound.protection.outlook.com [40.93.1.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 018FD402B2;
	Tue,  3 Mar 2026 23:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlJODs5BGs25Xe6P5pPNfnZ4A1hv7ttHbsRb3w8p4sHWeODJIHLfhgdTsJqfofZE8IQ7bQgMZdOZZTDX72T2tDXaD7LOpar6Jjo7ITerW+CL6aksmJ0fk9OtMVzLIG8mbdJf75LPmwEVBUKbOH6O08OfHwKig3f6gXsXrkLITsMMZGxZDgVqA/M7WtgrxuCRWS67yFAJHCl6vOR8jUyEVLi/q7N4Xb0MIMvvsKgD1cpdkAHmuHkcoe6l6U3BXJ1O78ydf112WgzNDC5nhs71/24WXrMw/2XL+mu9yiHkl6ZilqN3l7M4JufjqsElyCFK38QTsTqFMLu3dKm7MU8mZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWs6z52r/z8uj/Ms7IE53QS+yXJIqv9nwGgx53iImrw=;
 b=A2DD4k9iuquPEZibbwFpiIfb3Prgebv77lXatuvx7i/m6tbqdrm5FcOc+vvy+e25a4b8TiltVaNkk9wLzW69Cm1V+LfxItpqDVayD+TZ0hj/DdHIlqHaIHbp47ok/ILKeS1anlF4S4WOFnOuy1w14inAtyzt65kKXkvMEXWWuwVRtD2xYqqel/P9pXBBQDSeUmjI+cQ8mGp/WBV5cjwrqE5QCXxl96XI0dBfvTD2gyVXEIr/5kRitud521H1aDyFpZOZGMESkD3mVODtWeDAQWpYIqwkOiN/OUFc0NS08/8BVKYEu7ZEbCiYBoql7bJmK/Ne4Vv4ahvJEVQwLm5Isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWs6z52r/z8uj/Ms7IE53QS+yXJIqv9nwGgx53iImrw=;
 b=kLLbl3n9qpaDpHHNhGnvYL6RJg4qmcQW3nJULOne8kDbEQbnu0UgLxss8GpFR0z8xhd1RJwOW3LSZigTkVbNbVPdxiPqb6xmFzNVDv8a9x9qETLF5I7OHY5S03DMamTzmWFasW5BGT8b8bKlrSnMZKfKVn/qW057mOcvpNZmvac=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:53:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:53:41 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.li@nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: fix a typo
Thread-Topic: [PATCH 2/2] usb: dwc3: fix a typo
Thread-Index: AQHcqrN1t5vedqsZj0Gz9WYENuaoG7Wc9OMAgACHoQA=
Date: Tue, 3 Mar 2026 23:53:41 +0000
Message-ID: <20260303235340.lokkq65f5vg6la6q@synopsys.com>
References: <20260303021559.4021177-1-xu.yang_2@nxp.com>
 <20260303021559.4021177-2-xu.yang_2@nxp.com>
 <aacCvuqHDR2rbHmj@lizhi-Precision-Tower-5810>
In-Reply-To: <aacCvuqHDR2rbHmj@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB9529:EE_
x-ms-office365-filtering-correlation-id: cdd81fa4-6bb6-44dd-fab2-08de79801912
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 MU08kOAbs1vD3c1tdC0LuprfLKM0R9G+FF2dOGYmBf3fvEKN+dECAPC6aKOugOIa/oDVapQWYx+de6Cjm6ATiFD8LbISnJwkdpz02DjpOW2CMCdvbqd/gMKMRU3b3q+z/lUN/TkL6HwlApHNrRsDt7IUjyUnH+rCVCbdCbw9eED7O9mn267iHEQi4fkQU3neikAIwX6TkZJ8gs6568MMTJA/Q1/TyPXNkp8BNxC8xkDQ5LvyPwJA7e+p6FR3YyIX+e5GYVZZeT3iB1+qyk2gZVgTb1VQK/bS3msE5GFIpqwqV0UPA5/FuMip71QKzUVBNQNMQbRyPUCXGhjWrS34XAbcx+p/AU+nGgQPpABKw+vXOOroJ7vkt+SY0QtAdGva2BtiIvc5o6DAr2iTdC/6jjW+hx06ymj49FPZT+LQ2z6z6t+TQwabr7MbfR3Fl4447D9KsbPB5GK3gVxhilME0AJD8AVNE4pvZAmZ8AylGWbAySpUzLwyxarTEUmBfc2VDEedVcUM/PdIfsyGlv29th7NeetQIEvXLtO8rYByAfs+oxJRd4yI8o/+zriO5bmA8qR6/OqHeLVgW7U8UE71ahw0vrNfJO61O6zd0GOu7dmbjm0j2rVGmIa866q7vQHQrfNkqJPcxlthGz+QSF59QXJ/HOPLAQacbKzpb0LfRYvw/AmPJGYU1Vjv170laob/x+VfJEXl/F4gFseXWybNwCci3wB56V8iI+uRjYMBD85T4GEWQ8NBmRSwhFRYQRTqILahvVYXwklN0CkhwqBl5ZFo8dBI1ov/fTdN52eo2EQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU9QNk52UGNXelg4R1JQMU10OFR6YlFwbEFJOC8yL1AvTGg0TmtHaE5JWlZE?=
 =?utf-8?B?NmpESi82UXY3d1hsSE1GTU0yWjFWYm9nMU9CQlNLNFVRUXFQciswMWRiMlh0?=
 =?utf-8?B?eHJRanY0WjRrL3pkeDFkcGo5QmhHbmhQanVBOWtDUGdIeGlBUklDNWVEdVpt?=
 =?utf-8?B?dTJZbXl1SlBvTWhjZGlmakRBRjA1bzBxdjNTUVdldTlod2VPMGIrM0hzUXVZ?=
 =?utf-8?B?VjBlZkRObnE2cFphOUhjWmtqeWF5VE9WcWVRY1ppUGpMMUxUMzN6aC8yYnk2?=
 =?utf-8?B?YUlESVphcTFDN0Z4T1A2U21iYkYwcVYwMjJMV0RMZWQ0WllCeVg0WCtZSExB?=
 =?utf-8?B?RkMwY09lUzBQWW5nSkdvWk5tS0N4U1ZjZkUvVmRZNWpCTkYvemhTbVFkOVVi?=
 =?utf-8?B?aGF4V2NDMmdMdlI3Sk9hQVUzblJxc2J5WWk2bXdyb1hIY2lZTUlyalNZUkpm?=
 =?utf-8?B?ZlBDTXdaQm01Q0g3Q0JnNmdweCtXclovVFNEMXl0RFFEUWZub1VWUXNSbmVQ?=
 =?utf-8?B?bFIySUw1MHM3b3VtSVFKdWd2ZElCZEtQTi9qcUdsbFFqK3hNd3RqbC9rRGJD?=
 =?utf-8?B?Zm1KWUJBd1dvK3RkWEdsQzBtb21rVk0vaGVtVENTeTJUYWxWMHVBTDdFdDl5?=
 =?utf-8?B?UG45L3R6NFg3V3E1MnhlRXk3UU1Qck1JRnlhNzgxbGhUbGpqNEhnUWF2UW5w?=
 =?utf-8?B?K3RUQTNQdjZiZVo5MDJsVTdDTXlmMGNPR2EraVZaRytxNkdlQy9iN2cvdFFR?=
 =?utf-8?B?TWh2S3JqdFU2WlRsaU96YnUrU3A1Zk83Njk1ZkcxT1l2U2tPTWw5WFFHY1RU?=
 =?utf-8?B?RC9wS0cyb2MrR1NYc3JMbjFlU0lWM0lRdTBSRGVGbnFIN3EyWTh1Q0ZyVmxq?=
 =?utf-8?B?YXVXYldSWEx6enBzdmFhSDAyc0cxcDJUNUhXSjZSRkVPLytLU0V6OUZNSXpq?=
 =?utf-8?B?SEY3UG1uSStjTlJ3WTFKaCtUK2tKLzJWWWM0cEUyOXlxZm1WVjVtbDl5cDAz?=
 =?utf-8?B?eVVRM1ZscWRraG53L0EvTkJLUHBYbmZ4R2U1SitkT0g5cVhHSXJkWEFvL2Mr?=
 =?utf-8?B?a003MDEyN0tpSXlOblNLeEM3Z2o4aUgrcTVnVzEzRkdpTlRIVFNwQ0NvL1pv?=
 =?utf-8?B?aHZ6UTBPQnBIOVdKQVR3T0l3OHN3Zlg5bUd2bWRvM0hMdjJmaDVnSGdSYURw?=
 =?utf-8?B?K1ZWV3dRL2RVR0NXemE1S0VQQWtBTFVldHArdm01SmF2UzQ3U0Y4dzZET3JQ?=
 =?utf-8?B?VzBwQ3QxR0J5NEgwSVlDOW5OMGxlTmVGdGlBNDJJa2J4aCtaaUw5M0pEMkt3?=
 =?utf-8?B?M2YzaVBNd0gyVjVMT083QU42d1JpRlhFS29SS3BoUGkyM3FRcjY2RngwQS9q?=
 =?utf-8?B?dUxvMHpBVlM3enNPdTluY3NsYXl6UkJVSURDcU8zalVKZTBVdmd3MjBLcFNL?=
 =?utf-8?B?RVhMa1pFMFdHNGE4ZVNSRklJNGVHRU13c0JzWlZyLzBBd0RxUXNhbGRUM2tX?=
 =?utf-8?B?NFlFRm9QeWRZZGZGblhTdHhzakM1d0FnWHNvNUpVUTFvMkp0UUNCbnQzZDYr?=
 =?utf-8?B?V0lDTUdPVFNyaUI4dTdOT2hzVVFGTGgzaGUzV2kvYU1WL3BSeW5rS0FFUm9Q?=
 =?utf-8?B?N0hZb3NnTjAxbGlsbHFvcDN3aTI3QXB3SVd4a0hBek1jcHRYUTJiQlBENHhU?=
 =?utf-8?B?REswbFkzQldlZW45TXRjM0dlT3RCSzZhUmlTTDVlU2VqUkNycGgzdzI5RVhI?=
 =?utf-8?B?cGtnQnlzbk9WemhkS2N2UFI2SVloYkRIVmE2Q2dqQ1ZLYlV2b0NlTk4zUlFn?=
 =?utf-8?B?YVlUQVY1UUlLMVpmeWJEWWpUZEM2dk10ckVOeS8zNGk0cmRGSzUrRVFjb2wv?=
 =?utf-8?B?ak5CYTBpQzVHcmJDd256SXlQYUFLbUU5Q3NscUNWczYzMkpkU2NWaGV6dS9O?=
 =?utf-8?B?NmVUbTFOeElJSTUwVktqOXNSVWFZQjhyODRTRXZ5N1U4dGd3NVVWWFQxNnVD?=
 =?utf-8?B?dnN5V2NMbHlBNUY1ZFhhM1EwOG9JRGttZVVCSW9udHkzMndSd3VHb3pGUHZK?=
 =?utf-8?B?QWFpdFZrTlFvOGFvYlJSYkxwYXVSUTIralRyUld1U1Q3TFpSQ2pFUUplVWRH?=
 =?utf-8?B?aUdkSklpdTZlR2VyYWpQaXFEc2RPSWpOZ09XU1BjU0VKR3ZiYjNGYStVMjli?=
 =?utf-8?B?Y011MUJmVkhKMDFWWUhiOWY1T3pzN2FXcVJTQXd4U3dyejdhdDNhb1YyYldu?=
 =?utf-8?B?aC9yT0hMd1RKcGNvZTdERDB3aXBuSS9rckQwWi9CbWRJTkU5ZU1GUVRrRW5E?=
 =?utf-8?B?K2xtNE5tMlZyTDgxNDVZbjNGNDExd3B4UWgrNi90aDYxRTd2TlpVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <080D335B1097BC43ABEA052D3A1C5C43@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Fmo0J+/Mvrvt0alBGMKqOv6GCm2+KeHZeFyF0EsX/GjxXxX5iZcqnxxm7la3CE7ppxLl5frvzNXdB423RozHAq+EKHx2SIZ2yaOhQ+MWf5xlTYf9JDhEtWMVRJFETaQpz2CbsewXTdxHoMT23iuDRATGZGB9naRv46rW+yCYmX6Wgo4fBeq6Yb8JC1ATg3bJsYcLgealt5Vok3uPvJjAIJ/qDUlhBqT4cTyY3R98yklTL+agL4icMmqphJT+kLW1WfQWIIOkQ3B91bL2oBDrKrUucbSM0MwkRQ6CLeGpIIMRTbFd5MwrpnqU5dq/dBGqX+I4WdhSDN1iv/DImUFwy1E+ISEHtcIfmSQLxKkuNB8Mh+poS9yo9ourz0cKZdYK/z13OdfD6tMjJsTBHuHkAl932IYRj6CqHv9U5lo2JPbeXxkoTFHAzmONOi60bWp3frYgsyLIoCSDRvqf0fnrwMM7hnHNlN7wX9h79ZpCWLKv9iOXk28mplEczxSBmGmztcLTxRo+jHitsuMmcyGHB8RWNhD/UVGoJS6vIoEx69rtyny/yFwy8XE/GqPpi6YUqvi9UHzys3ePw+YI1XKwEgPE549gZq9UR8kFhMwBSLgvyWtO2xIrlJ1bPB2Y4jPHNeuB7bG0aTYoxYB2YZFxIw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd81fa4-6bb6-44dd-fab2-08de79801912
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 23:53:41.5372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PeszV/F1dppOsht4oH+AgAiqTZxUaOvkBbwx7ZW8IUwujzwTa/eINKqVHECi0pJgZp1gOzCiM7zAKerUqPwPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX5vCBzM6JievV
 SHq82+C5ahp10Sy/Hwm3pV9DFQx8wlW5ChPRPYpjavwwGViQ9mGIo757vf4zM5LH/jeGdZeImAl
 HfkyeHAqWMrGlOkSCaMKLxLQqGv1HKODQvxCFsurxP0X1cZKAsLCcMIbOhJDugwBKDfy8/Sx2Ki
 waOriBoNVy/RH2H185f/1/20KoAjqWTStFTHuCqTewhP0zj3Y+jP3Y4Er86S7hu73896l8PAi9R
 NA9IVnvJ21IrhGqeyv/84Xjb5UYNYMZrYhCERLogDE/T8cnRY9uUNqIFc7ErQTv1hyVypER8umN
 6Xmc8tpN6UOxgn0ygjCIN5acVqjDnXOPEnL5H0L5X7LGwB/85U9SDK+RVv28l+C/VKoeTqePx3X
 Es8Zeis7CVHE1tALqf92Iaq3JMZ+APx8fRB7HY0Y+oieGVgtq7mN6PLh1TzY6mcUYfQEwJPiLnX
 HcnIsBpiu6fPzJikQFQ==
X-Proofpoint-ORIG-GUID: gSXsjXnQJslMEtb-INiO-x4BwJHx3C5k
X-Proofpoint-GUID: gSXsjXnQJslMEtb-INiO-x4BwJHx3C5k
X-Authority-Analysis: v=2.4 cv=Ramdyltv c=1 sm=1 tr=0 ts=69a7748a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=8de5bYm3ovKCRR3WOjwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: 71DB51F8908
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33932-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMDMsIDIwMjYsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBUdWUsIE1hciAwMywg
MjAyNiBhdCAxMDoxNTo1OUFNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPiA+IEhpc2hTcGVlZCAt
PiBIaWdoU3BlZWQNCj4gDQo+IHN1YmplY3Q6IHVzYjogZHdjMzogZml4IGEgdHlwbyAnSGlzaFNw
ZWVkJw0KPiANCg0KSSBrbm93IGl0J3MgdHJpdmlhbCwgYnV0IHBsZWFzZSB3cml0ZSBhIGZ1bGwg
c2VudGVuY2UvcGFyYWdyYXBoIGluIHRoZQ0KYm9keSBkZXNjcmliaW5nIHRoZSBmaXguDQoNCkFs
c28sIHBsZWFzZSBhZGQgRml4ZXMgdGFnLg0KDQpUaGFua3MsDQpUaGluaA==

