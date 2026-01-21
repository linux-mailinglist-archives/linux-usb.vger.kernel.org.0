Return-Path: <linux-usb+bounces-32560-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH9pDrcZcGkEVwAAu9opvQ
	(envelope-from <linux-usb+bounces-32560-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 01:11:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8C4E588
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 01:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68B3754A5EC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 00:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F95D224891;
	Wed, 21 Jan 2026 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hAaUnTVy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rj+z33/Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fpjEXBLN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62201DE3B7;
	Wed, 21 Jan 2026 00:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768954246; cv=fail; b=MxpHkgPk64q/42cdtMA323tZ+XLWfZIUy00pS7BneKQzGC9Q1fXI5xJW2R7041y0Z4it21fBmd9vUo9fPBXI6A26JtMgAIsicmELyizh3Oo8ZH1mPbq1kVJ8e2arl698T6bPVC54ccptOVnrzGCySA3XlC9GXbD7iSAEVbhPmTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768954246; c=relaxed/simple;
	bh=tvoa1lpJhL7TjyhFrKDgvCgwCOHoxCrDvUfzR7RXE7A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J79C6Bq6gQb0ClgJuRfz5vsHtkI60mUAm2F2MMhLaQbbrBfJIl7PwrqFtZU6JpVEc04ZFTZeP0BMEW/zCDn31CPR48ldmQznu9stvCnHVZDD20nCD3Ylc+IVYnuRRHbNb/ajzGU1ufcDHS4arYB/RUjgEDRfX6bV29EbXuQm3TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hAaUnTVy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Rj+z33/Q; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fpjEXBLN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KLqI9a503330;
	Tue, 20 Jan 2026 16:10:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tvoa1lpJhL7TjyhFrKDgvCgwCOHoxCrDvUfzR7RXE7A=; b=
	hAaUnTVy7kSlUZsZSi5RPQZ4jmHQBusy/atGtGCEEEhZATgQAK4mGj+hU/kuKW2+
	m6F5FyJAaeE12dWTHpQLr1kx7gxNdYjqCnkx49vl21BQC9UnCmU3Z0ObG3QFw1WV
	n9clXqE+3QbISejQT3rD5pgCPz6khbeS8bN728aTRBY7iASy+mVlGrOKPrGk3k4x
	6IGlayeIkSdboF27OzTKguhLKj/fwShDHB88XVLMxn5OTKtYtLt+je8AC1vCtpJc
	7BFL9BusIWOO5CjM2wF/DX+KRsAyRFizaS8DE0PUZp5/vcD9SYhrwBPPoLT1ZJN7
	5YnY/uadb6k18qQoo9QmrQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bt27gn0dj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 16:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768954228; bh=tvoa1lpJhL7TjyhFrKDgvCgwCOHoxCrDvUfzR7RXE7A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Rj+z33/Qiyqa1EGbz6ROZJzca7BvjRiTaxbJm30g9PaaTewJAG5DbTmj2z/nQmwpB
	 EeeFMtuCX0j6HJNv9QajatSBUu1O0F2ZFVa1Va0vexY4PGFONZWywwWhr0ltgoscXk
	 DHopv4QkMFqfpQ6JD3x8fftHOjSJOD1BbOWO0ddRr1siK3k+iykFPgvHQndfuQzWIv
	 Xiq/6DrSS6N4hrPY4iY8T+r2Etjxl3PCySWtCf1aw+JgzwNg/TjZwiLuRWPghPQp4W
	 H5vakU2bx/lgLNN9lsiyc0Jk8XWT9tklauGT4cqVqr4/t4hJn6ERaLvOpv6SfiOX+a
	 9AkPLKzhpAZhQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 62EE140518;
	Wed, 21 Jan 2026 00:10:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AA1E2A00AE;
	Wed, 21 Jan 2026 00:10:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fpjEXBLN;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00604.outbound.protection.outlook.com [40.93.23.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C6FD0403A2;
	Wed, 21 Jan 2026 00:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzEW4Tah/6ff/iSwZW1LGQBAeN1u0FQyjqh6TWacfd17Ud7NY6Ft0csnv8SjWeegeGeriCqQ/ruRQV7QX38qW7oG07ueI63V3GykjehzEgK1zS73s5vfN1QNoa03XLF0neg6XNuRklRgam8+rK8E4k9RCjjzlOOYHCTmblcs6GmrvggeD2f57Dco/Q49hn3UUPgiyxaGhOXkgFTkzkPUxoi89c70CM72kdSJNZD+G0WiJ972YonbigmYFYBD681+CRcPnbpb9d6Y88dtnecVt2lHwnvNMD0rWoWoYJh3X+D3LCtVmWVHvGw7hj7Pojtl86uJN0DbghXhxMJxnWBPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvoa1lpJhL7TjyhFrKDgvCgwCOHoxCrDvUfzR7RXE7A=;
 b=wbLsIcJIgd81kDfocjIieu3GueUL1rn8wFqHW6oo2FIYseVoIxYkYTNJhlfI8brzH/b9gwyMPZ3ihswl9+VfCs5FYweiGaQqPTRxO10WznnEjatvnZH5EnhDwofLNhY/gIN8Cd/ogSdkjkXwgXCgruKtS6gXEto+8yuatLcRkVimEZbivEtuZwtPcAoSP17AQ8L9h/+RrgAD1EVQ9WZtstpLmB6Emm/1tmxBhPzLo1wiDkiMS1q/hdG37qJjx03B9es/OapIza2IbNgYY54ZzT9ey+iI4NlX1m8Kh8OfeEne0IdUwRWxxjKcLZm0FB3L7lCQEhPIlabiTa2OrwuVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvoa1lpJhL7TjyhFrKDgvCgwCOHoxCrDvUfzR7RXE7A=;
 b=fpjEXBLNuxu9beBDfPT0mP48qVCCNPVwJ/s2krhLQqxdH34z6gifIgCEB3PfK1pKDK4MJDF9Yba6cn1PP3kmRV5rUcSfnt2sF77uRYn8fVF1qxPK+13zpFTIB1foSRWiMHz4K9Q1IsfhigBNYMz0HrZ1fMMQq7kQHYgiDJG/ltI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 00:10:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 00:10:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index:
 AQHchT2wbJQWlMamnk2JtLup9X7IcrVRio4AgAC8f4CAABCPgIAAcMoAgACjbQCAAN41AIAAzP2AgAP/xICAArNegA==
Date: Wed, 21 Jan 2026 00:10:21 +0000
Message-ID: <20260121001015.62ue4o75ntzmt7yr@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
 <2026011500-safehouse-alphabet-3056@gregkh>
 <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
 <26f7cb41-5fa0-4aca-a119-2a7510b027a0@oss.qualcomm.com>
 <20260116175133.m7jbgh2s3ofzj2jb@synopsys.com>
 <f1375e71-923c-4f59-84f7-6cf11629a443@oss.qualcomm.com>
In-Reply-To: <f1375e71-923c-4f59-84f7-6cf11629a443@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV2PR12MB5776:EE_
x-ms-office365-filtering-correlation-id: 746e97f6-9f87-475b-338c-08de588177a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ekwwSHN2VTR5M3hrRjFvQ3dxNk1ZaTZTRis5RXkvU2VTa1VOcHRvU1MyYXR2?=
 =?utf-8?B?S3pBT2hIWVlNNTdTQXZYVVZ2alRpbHBvS0t6aDh0RnpMbXJCM1ExOFZFb1No?=
 =?utf-8?B?SDEwbk1MeDBHWHNZTVE0WHhJbW42UThTWm5pbzZCeDNxNk1LNG1rRzVpNFdN?=
 =?utf-8?B?MHptQ29TRUltYStyVnhkUzAwSTdyUG1rYmlTdjNwSW5FWFVITUlrbzJKMmpQ?=
 =?utf-8?B?OXFMZjFLRGFIcHZEZkg4K2VBaFBjSTNWYUdlby9RYkxhalBkR2V6Q0pHYVdE?=
 =?utf-8?B?NU5mdWhjczNHSmd1ZWs3bXZhVFFPMGNhNU5zU0xDblJKVmVyQWpMR2VaN0xT?=
 =?utf-8?B?bHJkT3FYNW9YOTVETjJWelRVNU5HQWNZcDFDUTlZd0ovWnZveUJNQVZ4SUcx?=
 =?utf-8?B?V29RemNmRWhFclZpS1RselBEMkpYZURTcW9ZWTRraDNvdFI2dENYSDE2T3FK?=
 =?utf-8?B?N1h0NWxqQmtpVE1TS0ZGdDgxOW5XRmlVbW52cmJvZ21KcEdRdkNUc1BNVGhG?=
 =?utf-8?B?Ly9hR25Wa05Gdi90VHBOTUQ3Y1h2bTJRNUI0S25ubk56bUE3amJqUE9OejJZ?=
 =?utf-8?B?NVBPMno0MnF1MGg3bmNQaFZXN3o2dDlHWWVQRDFYYzdpRDlhbWRHazlEVWRp?=
 =?utf-8?B?K0szamsxNHdKbUxNRkxGSHA2M3VZUlRJdk5sOWhQVkVhUnR1S2FLbmRXbEJo?=
 =?utf-8?B?RW8wSy9xS1Ezb2MrMjUvRHVWb1BFMDE2VTdHVXhyWmxrNGJJdmc4dmNFdnlP?=
 =?utf-8?B?T0xDQXoxNTM3ZzRaUmU0MENycmlDOVc0eTJGYitHVVF5cHcwL2hNWFFObEQ4?=
 =?utf-8?B?bmFBTDU3V25Ra2kzOW50NUJoS1k4dXZtZFVsaW83b1ZwanlXSWVCbUVIc29N?=
 =?utf-8?B?UWxVY1VjeGNnaVQxNG1JOHBGdjI1aXFDdHFMYWNsQU9NQzNvRnA5bWt6Rmsv?=
 =?utf-8?B?V2tyeXIwSXRrUkQ4aWxuWUhCajV6OTIyNWRBUjAxUGtFN0RrbXFxY1dwaDJ4?=
 =?utf-8?B?VDNOenZaMFhwV213RnBRdmo5dStBQ21hdVU2Y2Y3dCsraTdOanlOcnE1RXh5?=
 =?utf-8?B?Y3ZZQnlXeDRPYStkajlHTE1mUVpXeDlmeGtJS1VUU01Gck00QS93UjdiODY5?=
 =?utf-8?B?L25FZ0lMY0xpTXQ5eUo5Yis5SXFGcTNkZmx3dlowanREcU1VMTBWK3VPVWJX?=
 =?utf-8?B?YWJ4WVMxaWVyTEIzUVg5YU5DZUl3Qzd5empzRDEwZlNDNlB1TGxDbUxTSUdO?=
 =?utf-8?B?TUJqVlNJTjFvbE1hSExob0M1NXg3UGtDNkE2YTZTeXdYbHZ6QlBVL3lRaGxO?=
 =?utf-8?B?bkduTzhtSjJZK1NBYmdIbytuTXhDU08wd2tOMzdNR3NDZ2FMQ3VOTnkzdnNq?=
 =?utf-8?B?WDJUR25LSytYN2l5NTVOc3p1VDJQWlpCOWxadzZLUi9nTzdWcGUyMG9qZDZx?=
 =?utf-8?B?SnlGUThHYmUyektLVW1GTlhhcG9UdmZHTUpsU0EvaEkzK2gwUHFabUV1Y1BW?=
 =?utf-8?B?Sys5YnFvR1I4a0d2dU9wZlgyZlV6L0pFOHRXOUVQRGN3MmlrbzQxWXIyRGdR?=
 =?utf-8?B?bkdXZ3RHcloyNmNEeVN0WjZTQjRWZy9lbXk3UFZTR0ZjT2doWXdoa2pVT1lU?=
 =?utf-8?B?aUJyc2toUjJyU0FsaGlYb2V1Q0lFOWlaNTBoTHdnNkpQQmlSVVQ0dmtaTVZo?=
 =?utf-8?B?UGdKU2NYODhXNnMwdXErUzhxWkNkek80ZzAzRTRkZHlGUVBaZFVXcXArRkph?=
 =?utf-8?B?OVJjUWp1a3JlNmFlMWliME15TUh1eURRbzVlMWFEb2Z6MWVZL2tpeVZmY01C?=
 =?utf-8?B?WERNcnRZMDZZTXJWdzBleGdwOUMwY1VSVStTRnFUdnErT1lBZmE2WjBMM3I0?=
 =?utf-8?B?S0hqcTNRaTNwYUdTNkpMMTB4R0daVnlTa0xjemUrZi9VSysrNjhvQWhLb0xp?=
 =?utf-8?B?aGlhUVZVb2h0aERJVUQ5UW1YemxMSTdxVnpqR3pjbzk3ZDlITnhDSDVIUkt1?=
 =?utf-8?B?U2QrWmptcUw2am54TEhjNG45WFBEWmpYUUllWC9JbG1KeVpkTmo5NUhEUEQv?=
 =?utf-8?B?blNpdFhaN3ZGMFpZOWNycElDU1EwTytablJmd3E4a0VqWUxzbFF1NnNzOVJu?=
 =?utf-8?B?YTZ3S3R0cU9QSnhXZkMvNDdWNHNKWjBDTlBYQzNFM3lKaEd6MWMya2hFaDdH?=
 =?utf-8?Q?6jVrBmDt1DaI0wrDE/Z5m0c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlB4R3JieHc5blJGUlhFVlc3bUFTV0tZRHYweEJ2SmhLY3owRFhpdExTZlhU?=
 =?utf-8?B?a0NmSndrSUV3ODlDYWlqakExYzZmS1Zhbk1lbElUZTdxT2VlODZZOWREbk1i?=
 =?utf-8?B?LzdSbHM5dnk3QzlPeWxCbGUyaDVtbXBMM2R1Tk45eFFCdjRVV3o5bjgxeXZq?=
 =?utf-8?B?MmtSVlhyRzJBUDFLQUdQYjQ2dEwwck5VVkZQTnduVUVTejdKU1lyd1E5U2xa?=
 =?utf-8?B?ek1xTzFvejYrTjFzR1pObUpFVDUxMCtodzJrS29CY081aDllNFo4anBONFlw?=
 =?utf-8?B?RmMxb29oMHhiOVl6L0FhMjdyTVZkQm16SE9FaExzWlgxWVk0ZDEwRE9nK0JS?=
 =?utf-8?B?d0o1aVlnZTVpTTd4RXhVd09qZVBQb09nUTVkeW9IRGRVWS81a0RBVTVMN1JN?=
 =?utf-8?B?SGxMajVRbER6T05YdUhxeFhBOUNneFhPaDlGSUt6Zks5TFhpbTVQV0FobklT?=
 =?utf-8?B?S256aW5PUElIK2tYLzZLSjRzQlNUTTQ5ZkFyTjJ5UWpsNjdpcm5kaUszMSsx?=
 =?utf-8?B?SXZqSkRTTGVpVmRNSXRhR2s1SitxOHRPVFB3TjNnamkrWnRnb1ZwQ3dXZlhV?=
 =?utf-8?B?ZDdnV0lkNUhadkVzMENPMkJvaW5tUklIaXAvclllRzRTVGd1M2FmV1JaNDQ0?=
 =?utf-8?B?bE55eUZjazdKRG1zUG00TE0vbUJIR1pXUzVLQ3hIbk1ONXExODYvOSt6VWph?=
 =?utf-8?B?aitDQXdVaFVtWEZUazBITGFSTWxoOWJVREFRRDZPRGZWTS8rbzdGOWIwTFN3?=
 =?utf-8?B?anZvKzRPejIwMXExRmp6YUJzRFNndC9VL25TU0hiV2JCbXFPOUYxWUgxWDVF?=
 =?utf-8?B?b1A3a3dXSTFSSUtndnVzRGtRM0VxeEdScm5RVWkybnJVQUhqclcxRlVhNnNl?=
 =?utf-8?B?OXA0KzdXYVBndThYZnpTaUs4bFRmU3d1bWRLV0RrdUFZMHdnN0VTT1pBQWpk?=
 =?utf-8?B?M2RNcVVpU3c5SUl3bzlBaml0cGgya1NrYit3RnoxYU9nZzdaYW1Ma1lkczEr?=
 =?utf-8?B?c3RZam1MbDFRNnpFNWdGQ3V4bVdJSWE5ai9QT0pzS1dPUE54c0wzUnJ2RGNM?=
 =?utf-8?B?bnMwdHVRMzdGLzZxWitTcEpFUjNqWlBjTzBoRVYweFZ1TmZSKzUyUHpiVWtp?=
 =?utf-8?B?Y3l6QlR1Q01hOUR6WDFqRC8yRTExRTBBNDdEQmlxN2xmZm1KNlZVSTJ6QTBk?=
 =?utf-8?B?NzhqMTM3UFRXSUxlSE9LNFRwcW80SloyamJpREc0ZUxndUxFS05BcElRL0Fr?=
 =?utf-8?B?aGJ3clVKdCtIYmxmSXNXY0RzWFFwYlhiUklWNE8rS3R0bWo4eVV1MTY1Y3Q4?=
 =?utf-8?B?WmN6N2VZNFl1RjBqQTMvaGdkOFVHa1NVNisxUWt4dVdpeUg2NVpQTW15UEVx?=
 =?utf-8?B?enEyNFdiMFdFWWc0SUYxU3dRcTYrQW5tVWpxNDJBY2FIdGJCRURDbWtGeGdE?=
 =?utf-8?B?a3U2SHUzUlVacUhYYm81Vkx5K0lULzFQZERiTE8vb2RRVjhHTE5neCs5alll?=
 =?utf-8?B?WjIwRUd4WS8wN1JDNWIxU0dOMDVwWUs5Kzd4N0o0b1Jnb0t2ZldRRHlIdTkx?=
 =?utf-8?B?TzJQQklxUkJSdVQzTWEvenYvV0RUTGVTR21SNE5LL09GOStvTFUzU1NDTTFh?=
 =?utf-8?B?ZEZhbWhMeVNJUEVYcVBtdk1tMlNOUmNHYkdYbklGeTFnUzJpL25Sck9LdTYy?=
 =?utf-8?B?akJOQ1JNRVM4QkhSQUNHc2kxU0owYWxZTEsvY1E1THdPaG5RemZHS1BxWHMr?=
 =?utf-8?B?MkczSGptQnlrT1A3SkV5em5kVEU2dEpnQUdJYUZRanpNNmpYK0RtRDRzVThV?=
 =?utf-8?B?dk1GV09Sb0Y2UDZqMWMyYnRiTGFSTDhKRDVQMzV4WVpHU0V3QndKcUVlVE94?=
 =?utf-8?B?MXRhTFp5ZFExdE9rWjliQ3JxbmwzQlBmN2FvcCs1TmlFTFg3QVM2N3V3ODhx?=
 =?utf-8?B?cUpySFo3R3I5eEloZWdTY1J6ZDh5Ym9yQ3RpZmkrZVYwOStxSjZHcGRNRGd0?=
 =?utf-8?B?UWhieVhPUUl5ZzhZQ1RMZndGeGt1SEcrZ2dGdWsrdWVROWh1Y0orckhPQ0Vh?=
 =?utf-8?B?WCs2Y2xVTHVJMkVDYnFzekFqbVkyQ1M5aFBwZDc1d28xN29oUHhuSlE3MWUy?=
 =?utf-8?B?ODRFRVRScVlFdnFmVHFnVjh1d3Rrd3Zzck9lUGFkbFNiUkY2RWw0clN2eTlx?=
 =?utf-8?B?TkdmcTRyZ3kzOWZDVkY3OVdxb0RjdkRpUmJscEY1eHR1dVpJa3RFT0Iramlz?=
 =?utf-8?B?V2IxZXVCMG5wUkwzbVBhSGdHYWxyb3RqVUxWVUhXUUI4Y1ZDU3ozeXFXdHpq?=
 =?utf-8?B?c1NXU3R4REtrQUYzU21yZlV4WGlCT3AwM2ZKMVkranplNW8zZ3p6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76327D0D3115D1439B8AFA59072D820F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BP9wpkz4srzbmWkQr2qPoy50Oup6f2f5ZdsY3Gy1zxlyPpz44PJFmWV3pGC1Cx91AD4BXNj5W/JP8qUwaIqSm00+QgoRfqeapIwYOlu3TIV72n3NRejXpMWqnpzWdAmDf//pfH7ck5OhJlIhufITXhljYTdso2KdOSfwgzhiumB1REyxN3oG6P4Rj1oMKvxvXMmJtvLivlGHyRmTAl4GSzatC1teiLhcE4hbnTyecrGVcANWsFdumlItERXbBgwYLiYmQRS6vguxm9XoatQ4S/WPjYnQsp6OTj7e1PxORhIRdOoCFqOGiAizY6UY3H87aPcjOE3gZMDSqld3IfR+KRHQe2A4cLvzkIM3vght83xTtVoaD5M1TevqvLDWWeKGke7Qb5RDR8+1iHUuIQF25BNjcfOmcrDeKjSO9RhvoG36VHs3hIqjHSkUR6389VXFrg0GsGcebu57mitmqcICH+S3oO6MfW5I/PsPD1ddhzR/VM2Ydsb9SNZCLdDANTrv05I7LLbBzBw6DdVNkSve0mnZnXTfjVVY3+ZrN0hIpFM2s9ZTor/WRsqKOZEdET0+UG5TcP/LxtKfqXnvJXSzmUgiD/P/aFDRiTxLHrSt/EulMdjCckPGjxIC8ZHryWmOeL9eM/PCf6wvAXUAYUAfPA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746e97f6-9f87-475b-338c-08de588177a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 00:10:21.3868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4zzPVJeQVkelFreYweXIwEi43EpSnMH3uhCfGi67+2KJBeTqN92A/EcpteZD/lt1V7fyn3hR9GtkmKFuxFkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776
X-Proofpoint-ORIG-GUID: KXRV2Q7_PsQmS7gi1XMHtF8Z3LM3LVzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5OSBTYWx0ZWRfX++uavvqPbWU2
 bsflDRls45NJGGmp4NMM1G9mCx93KmeaWHrO6afuw8V2c6WVxT/h3MNq7ndCBUFusbGbU7lX3tc
 XtSbblMYdepfJxakkb7KFrOlVGlZLUEBEITX2FpH4hmgBqiGX8aMZkR+oiofSyYeTkjKy7WhwCl
 Kw84IIoVHjhCXgPkEBfzk+MvxsG+en1Azo6lBLjHU+y0ozzH5qxGhzRxXrlMgG2lTXnWIK88Hp9
 UjWb57HRGyTPqekUIgssnYAWum0RR28MMHCyfn/7h2QVZCKZhRV7GyLMbaaXWdwqQZRpTEEtDNZ
 AmTYP8cFkhNTclHc40AclTL2+vCBgd8LT448QKWJe57/ON1o1sPTFurx3fwPmgMwh1NhuSZxT1S
 LDq2LZXQSwt8A3R7xAjoQLkSZy1ig56Vk8CpZGwwCW0AybUdwEkCeXexRLmNHXHOFQX2h9wlOQo
 YxXJyFduuuySGws5qWA==
X-Authority-Analysis: v=2.4 cv=BqWQAIX5 c=1 sm=1 tr=0 ts=69701975 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dHRKUuSakFZXd0Cii1IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KXRV2Q7_PsQmS7gi1XMHtF8Z3LM3LVzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2601200199
X-Spamd-Result: default: False [1.14 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32560-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,synopsys.com:mid,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DEE8C4E588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBKYW4gMTksIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBPbiAxLzE2LzIwMjYg
MTE6MjEgUE0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy90cmFjZS5oIGIvZHJpdmVycy91c2IvZHdjMy90cmFjZS5oDQo+ID4gaW5kZXggYjZi
YTk4NGJhZmNkLi44ZTVkNDc0ZmQ1NGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdj
My90cmFjZS5oDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy90cmFjZS5oDQo+ID4gQEAgLTM3
LDE5ICszNywyMiBAQCBERUZJTkVfRVZFTlQoZHdjM19sb2dfc2V0X3BydGNhcCwgZHdjM19zZXRf
cHJ0Y2FwLA0KPiA+ICApOw0KPiA+ICANCj4gPiAgREVDTEFSRV9FVkVOVF9DTEFTUyhkd2MzX2xv
Z19pbywNCj4gPiAtCVRQX1BST1RPKHZvaWQgKmJhc2UsIHUzMiBvZmZzZXQsIHUzMiB2YWx1ZSks
DQo+ID4gLQlUUF9BUkdTKGJhc2UsIG9mZnNldCwgdmFsdWUpLA0KPiA+ICsJVFBfUFJPVE8oc3Ry
dWN0IGR3YzMgKmR3Yywgdm9pZCAqYmFzZSwgdTMxIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gPiAr
CVRQX0FSR1MoZHdjLCBiYXNlLCBvZmZzZXQsIHZhbHVlKSwNCj4gPiAgCVRQX1NUUlVDVF9fZW50
cnkoDQo+ID4gKwkJX19maWVsZChwaHlfYWRkcl90LCBiYXNlX2FkZHJlc3MpDQo+IA0KPiBTaG91
bGRuJ3Qgd2UgYmUgdXNpbmcgJ3Jlc291cmNlX3NpemVfdCcgaW5zdGVhZCA/IEFueXdheXMgaXRz
IGp1c3QNCj4gdHlwZWRlZiBvZiAncGh5c19hZGRyX3QnLg0KPiANCg0KSXQgc2VlbXMgbW9yZSBm
aXR0aW5nIHRvIHVzZSBwaHlzX2FkZHJfdCBoZXJlIGZvciBwcmludGluZyB0aGUgYWRkcmVzcy4N
CkknZCB1c2UgcmVzb3VyY2Vfc2l6ZV90IHdoZW4gY2FsY3VsYXRpbmcgZm9yIHRoZSByZXNvdXJj
ZSBzaXplLiBMZXQgbWUNCmtub3cgaWYgdGhlcmUncyBhbiBpc3N1ZS4NCg0KQlIsDQpUaGluaA==

