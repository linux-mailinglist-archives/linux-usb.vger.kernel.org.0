Return-Path: <linux-usb+bounces-7704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D9875C62
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 03:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73504B21DF1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 02:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CE728DBF;
	Fri,  8 Mar 2024 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nbz1XOtA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L3R4aDni";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g2ItDVIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2248A21A1C
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709865799; cv=fail; b=hfclPtZIABcp9VFrLrg7QdW5actGrVYnflVjml1AbfQ1KymkPeEyRFk2yjaINcbW+cVIEpEKem5ziX9gKxeVNUktoPvYVKgOEh5FZiTR1bbarfEBsvX7LOIPRNmY/Ew5C5d2i6sTim9juHBRpRFUTAK/kwb/UCIWybIqlOpo6Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709865799; c=relaxed/simple;
	bh=VIJJARyCCgDwNBDq1yrus0tpMRppk5tnNXmt0PAL7to=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ogMnTD7qERAW7l4cbdug0FFRp9uHnqqRjnqU174T3NMLo/R7AeN5AmtI8eWP2FdGblEFLMrTMpG/vMok4h2EGhZWF28JQjyBc/+Pb7l+AKPIY5mM2DLlf1QIRjZBtPWuXHTY6RR4Ai9qDY7N0TpBtLi31aWjInOCrMQRs/nhIXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nbz1XOtA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L3R4aDni; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g2ItDVIz reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427Kq6ZM007809;
	Thu, 7 Mar 2024 18:42:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=VIJJARyCCgDwNBDq1yrus0tpMRppk5tnNXmt0PAL7to=; b=
	nbz1XOtACQzb5AUtkRRUT1dYIrwKuTPsDjwYmmUmpgKH96+2JAv1KKCTGmt5hWzf
	Q30MU4zCzDMPIRIAhGEY2byU0447eTAVaZAsEm0Jv8X8maeALOsT7+X0Ab8GRNj9
	CV/ZaRuusMmFwSnXY2O6TALKLAxY+zh8FUvTm72VefKYW3Gvk31UsR8Dj5SQdiJe
	J7M0gOhRC/zf09IKCJoK6e4uvZ2qiGfmmdauLo9MzGAyypBx6phhbdwfePPPdnL6
	UJncKf0Dk80Qz9c0mLbz9cYFACiebY6kp56xEvPIjtB+PkbdnE4CLlex8mXd1x1p
	MffiZwtpYYO7Wr4DYiJ9Qg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wm3mhtgt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 18:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1709865758; bh=VIJJARyCCgDwNBDq1yrus0tpMRppk5tnNXmt0PAL7to=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L3R4aDniYEhRTKWYea+EuMrGEHtky9+Af8Ib6zThpKsM5anVTnzysweqErBTzsUgn
	 VAsUSuF1J2qLG8f5gRvyJcH+JHiY21EG1xz0oBZbq1BAf7CW8vP8S7EEYROcwkRYcW
	 qdTYK384JwHjhFSYJ6nTgpwlwoOvtcgaphAanK89JNTwNxKxRf9CryLQU1aY7ZEzGZ
	 6GM/qsgiXpINeSN+iWm+MUxCNuP0oygrknhS5ZDDfXey60sAf9pPil1Wupeypr5fAZ
	 TCpe46bQQ+iRRjzNqPm9cu1yeyc/CRulB2VDNtCX23QPSNdZ1X0Sp7j2iTjMG4T+R0
	 OdfpIgzVX+0nA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC95B40408;
	Fri,  8 Mar 2024 02:42:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8A4B9A00AC;
	Fri,  8 Mar 2024 02:42:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=g2ItDVIz;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6B19D40346;
	Fri,  8 Mar 2024 02:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQZ1CMsjnRobUCcfg6bMiLVzkglw8Ro2rS1ohoO54jeV2fw9k9mUka/1lKEfDlBY6NPWsk22XGtZNi6IEUCUHgA/J9PH2ISKJIIni//didzkRvCFVdQf1rvOp7fCbfS/3bae8VnMrSkzvDEUDvvttgNWRGPx982KVp/dtgvfWo6ShkcHPDW3CdwIXQWlkS22RM3qf7ENoFJNe+570AFvK/2tA2wGI5Ubze2jWB1eNOj4bF46Usg3y785KWvuNy9utuZhuPMvQQRgPguWtVxcWhxWCp8h+6idtmGqtysE7s9Ev3amy1xhb34FQlJBaOUOqzhb7xKafxcjkhts2dIdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIJJARyCCgDwNBDq1yrus0tpMRppk5tnNXmt0PAL7to=;
 b=R+J3sELUvlB5iWTc4TyXRKBnIS3LfrxLiacg7ahIneK16rPGM+n6/zr+FCBOg5/krbaWVWhWlmVsCuSq/xFB8Dgny6s7C3oV9rkf+gV3THfiYukEMQ6yis9IvCTfUa9WBMbWdbMdI8CrbuafS6mUBZfqPTRLv3tWhYpm9PGK9BfjsPJ6IXGDIFYeTTbjXUL9/13D0m28znrUGG0tqNXcLtH1gABdR65B0hYasrZ5JmiY0RPX6waWwAzD1f7hWc1+sAxFo0ECT9AA8HlXR1ieRRCE7gPqOV6fcvKmZ97V3bQIGuxmrPJZj75E4+V35seYA3h/g3z/p8OkGa0q4GnytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIJJARyCCgDwNBDq1yrus0tpMRppk5tnNXmt0PAL7to=;
 b=g2ItDVIzg3XhLVg/ZmG0uz2On96Negvea4AhsOKyHIRhEAefR2p5swVLSRfTxvb4xWUSUMQKks9aXdcOYdeOZd4mcPni6Hj6Gg6IKBeDWC7HXfTgUxypr3Oud2T82tU6CG8t8WfeDF7AgEhbW4PCleCZOqKBXhMq5qMpBCB5dNg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 02:42:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 02:42:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LICAAN6oAIAHFi2AgAB/wICABATrAIAAF8SAgCauMwCAA7YYgIABOZsAgAB68AA=
Date: Fri, 8 Mar 2024 02:42:27 +0000
Message-ID: <20240308024222.oaxnvagajnnstxrh@synopsys.com>
References: <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
 <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
 <20240307003955.js57ik6cuxhhsae3@synopsys.com>
 <70a7692d-647c-9be7-00a6-06fc60f77294@igalia.com>
In-Reply-To: <70a7692d-647c-9be7-00a6-06fc60f77294@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB9047:EE_
x-ms-office365-filtering-correlation-id: 05d22ea9-21ca-47f5-c8e3-08dc3f1964b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bmOdl0EBglQNy8KSSmQ2cVxynfBzKKgdNNMxisIWt+rjxw6jn+WpNVT/kttcyTCv+vRRd4UHc3eFjS70mOqljwcj9qldAyl3BtxEDWs4F03/t58mOfLKve4zAK6bDOZcx2e1IfeNfRVx/xPIn67k1y9g/+U1mrsOkK9HnhqfO5iVnq3TbrG1Vu9x5kEfhPW4w4BLBPw+8zh8D4pXgvoNFyWLKyxseBz4TX2KGGbj19FCqdsmXenJkFNaMweESoWJzwhEL035UHMbnV61qiO1l/M7x3dSklQogpjBBaecVfAZVP1p5QYLMz/7NorxUVHULKcR6PufjhahWmCuyp6LuhMaBEkZU4M3TDujUBa2jcST8GlEXKpmPlTD4Xmee+9jbkevOwhAMNVO2D56TJiflcZrlVLo5HeMCWbRVxz+723Ve8GKKBWt5VX9+tevvw+qdOXAsn/ZGJ+l2Up3V+dHBTSymDDkyuREWNBZFWweGD2GxX4TvUFR+XPhAL+rCIv+6hcpu/dz+anAB3LqoA97dgX9/qAQhmHzl7UiRQzFPJ49Xa9/MTm5Ml0qO72ge9YPEGgkyDWoKOKZnvX4eJ7TWr+2MlkaI4GcXa2Qz9TaXSX0N/DzV/zRrKvtvhlpWxa6KxWZ51fnhhrXcNmCwwr6jBYril68mpCx+FO2Lb+XHirZa6AktIzRgGRULpOIxPeMcgXOwOTXylVX4LmvsgGJMg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U25FbEt5S3NIckZEM1RXckJIc09mdUtuMklMTXpna1FhbEhhVVM5VHBZSnYx?=
 =?utf-8?B?RzZuM1o0eWZBTEtSMmQ0WTUzbjRTNmR3TkF4b1hjelp2VTJ4NkpkUURwL3Mr?=
 =?utf-8?B?QndZYXgwZ2xiSUtYQi9iZEptTDV6aGd4Q1ZOTDdjcjBMcmUvZTlJNDdCbGlt?=
 =?utf-8?B?YUNpRzVGR09BQk9uMVkxUjNaZDFaT0cvWkhuZjZaK0lKZWFHeCtRZFhFV2Q2?=
 =?utf-8?B?M0hNbEwvQWI0bDVDM1V3OVNYd3FVbEI1ZlpueVN5UzZiaEE0RHdHYzlTdVMv?=
 =?utf-8?B?UG5EVWFPRHhyeWtlYjZaM1hYU3ZFUU1XVU5kYm5ZM3U0WGowd2huSDliVVRz?=
 =?utf-8?B?T1dDdDY0VGxqWTcvQ1VvaDhPVzdubzBjdWtIcU9VemdTVFFrSk9tRXllYkxw?=
 =?utf-8?B?UWFKOFUyRVVlUnlCb280a1R6SzJ6ckhzUmdVa0NlM29hUVlIWU1wTzJ3US9F?=
 =?utf-8?B?dWlnaGpaN05wTWxzQmk3SjA1S0dZKzRKLzRTS0hVNDlpTlE3NUQ5WmVSS0dq?=
 =?utf-8?B?MDZSSmZwQTlYRDVtM1ovbmFWZnNpOTJDM1g5d21WS0twQTBpNWxiNlgrTktC?=
 =?utf-8?B?YjZLZzd2YXdVNHdGWS9WODVFNWVlMklxNnU5UTkrRXMzTUdaQW1wS3NZeEsr?=
 =?utf-8?B?NXRSZGd1enRpWmVqTmdpSVdLSUxvWnlRbVIzeWVJYjQ1UjRlMzh6YlBvWE5x?=
 =?utf-8?B?Q09PK1RlSGZNRG9laXExSE00cWVqSnN4TTVpK3c5aThwTVY5bldvRXIrS0Yy?=
 =?utf-8?B?dlVlaGdCTFFaVDZBRHU1R28weURmVWxlMTFGTXZwN3Fucmdya1RhOTYxQktq?=
 =?utf-8?B?OHY3enozVVpIWDZETmVXU3NmSStSN0UxZHhJZEFqYXVEMUFpTE9vRS9pd0gw?=
 =?utf-8?B?UHBPSFYvR1RobHhFaWRsWFZJdXNTKzR0MEhzeTFHcTRJVWtVRDF5MmRvTGFI?=
 =?utf-8?B?b0ppT1piMDFKQTJFWmJub2Y4dlJXMHZJb0xmNU4vM1VCbWV0cWpvZ1JsL3M0?=
 =?utf-8?B?SWxQYWxJeEFFWWtGUUFyL1VLYThpUkpkdnJjRWQwbXUwckd1ZUtnRll1bTRi?=
 =?utf-8?B?QjZmazBIN3dCSUg5a25tVzlmUmFxemYrR0I1VDNhaGUycVdpUURQMG9CVXFM?=
 =?utf-8?B?Qno5YklGWTFLY2dpejdhTzZpVzVQRDJuNW5SQXMweDBxdFNQWldBZFpEYVE4?=
 =?utf-8?B?S0hIWnlGUW1RR0p0K01EYTdqV1owWS9CQmFWZGcycjI2VktIRnVBMjhUa2dh?=
 =?utf-8?B?MW0rN2o0Q2FLV1YyeXlFZndheEVrUXJzbDJIeXF4Tm1JTU1aeDFLU3dBNjB3?=
 =?utf-8?B?S1FZaHNMUys4eGdVc0s2QkgzTGoyellmdDErTUxBVkRscmZ1TFk1QnpjeFhP?=
 =?utf-8?B?SGJkZXM5NW8waGlzdlJqNWFtUWlnS1V6VTBuZWlWUC9zUFpQUU03NUVMT2Qr?=
 =?utf-8?B?eFlLMURvQU5FZzR0ZXhzNkppSXlNdVFHUkVRUnRBY2xPdnVZYlcyWVZHSmhP?=
 =?utf-8?B?L2lBOE9aYWE3TkhxK2p1cW5GTUJnQVZ0S1hVVlRQcWQwSytiTzlhMXhMMks0?=
 =?utf-8?B?N0NpK3dCNnpkMDAvS09remltdnMxYkpCVzRmQUdtWXJqY1lxTDR3Y2pxbU1Y?=
 =?utf-8?B?SFZYRVRkQ0poQW1NbzRuTEZ0N0dVUUJLeHJVODZZRExoeHB6cGt2WXpSMnVl?=
 =?utf-8?B?SVBDSlFWdEZXQTAwRjhvZEc2WVdxaUc0Z20xRmkwZnFHSXY4aDhIQzVCTTFq?=
 =?utf-8?B?Mjgrc0JuMkpTYXp5VzRHSFRwNDlPTm9tZHVkNUhNQXJnVUQ1eWtNR0pRNlpD?=
 =?utf-8?B?UWo1NkVuWklmUnprRm1oS25IekM1d2wyQjRSanA2YzA4a1o0N21sZGhBcjdX?=
 =?utf-8?B?TG9rVzJEeGJuV1NqZ25ySkYwMWFTUVZmUmxQQUhLTmhEd08wclpBaXJvbURw?=
 =?utf-8?B?c3EvSEZXcTAvaFRHRTQxZG1zS0xxa3ZCbTJ4cTNoSnlsTzVrckZ5b0IrMnVj?=
 =?utf-8?B?WjJOZGw2S3Ixa3ZvV1VQaWZ3cTBYbnEzU2NGUUcrYjdZUmJTQTBOMjdUSC9E?=
 =?utf-8?B?U0hjMnBwcmtuTldhTWVndVVSK3pqelNRM2d3a2NHSTJLQU0wL2FQMGV0VDR4?=
 =?utf-8?B?TGNkZmN0OEFZdmxCcmVXMDg1RDQ4QmRETXVSVTJ5SmxzQVllNFBoa3JCbUJC?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56F9DADCD3D6F14CA49DAEE56DEABAAE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Gema3CB/C3saRll4m3KCNuHMMjtFbQCFrUgHL45/Xn8adzP2kPNbirMBVQmXFCHRePjYApmMJJGGUUTryXMsZTrmJxzgNndGMHT50y4Hw7JwpHrTnX8DNdaluFF0sU1o6blG74OtE3ZB5IPFioijbdhF80rqYZnV/MSQvfjLQG+K9HZF14iQqOXw4/DA1jtiIlHWOJbpovkWn2lS1QzelyHCEr8ZB5cHkZvaB7Jh4Or1SmVN0aDDWukJ0GOUnPcWg1Wlt3E/O9KoCGr2RKY0pcgq+aw3KOVzyokgZiwQRTdx5HrOeqhICWTQwYKtbJbnDYiM2zBQXXwAT98xAx+YyrOJxgkQGa0fFZgPw/iXW1+mwcvOHEOde6LT9A5oW9Y8wb2iOMGyrnafHNzYFWenyonbMRvs08b1A53stjq1+Y6RE+bBjdPPPA0ikhgSsKf9cZSWrmwCNMciObcmblsWaQGn7SzUhGfMIPJUVQip7zb0GJoBQNWDGAnaOA34vNRzEwKWtxsKQm0/6Iw6fh/slaSpUHb8t8cjNUp+7UbV4Im2Jtu5u24cq2JRF16gEBm4ndy7xOb8lDPwX0lsZdnJaomtX6LgfK/kupF6x0BH/+5cflpbgRXNF444tRA5P82gKzHHbszvQp4ohx6y0Kqucg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d22ea9-21ca-47f5-c8e3-08dc3f1964b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 02:42:27.5592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 386G/Zu+XwRmjZfUNucQSNq7X02cIHtKTGlMgMWWgBp21Zh55jUnr5J1xeiWLH7Feubwqh9SY1JKGyysRS5eaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047
X-Proofpoint-ORIG-GUID: Xx_ixCUBnCa_nh_-2pGnNZ9uInkc95r1
X-Proofpoint-GUID: Xx_ixCUBnCa_nh_-2pGnNZ9uInkc95r1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_01,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=835 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403080020

T24gVGh1LCBNYXIgMDcsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAw
Ni8wMy8yMDI0IDIxOjQwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiANCj4g
PiBDYW4geW91IHRyeSB0aGlzPyBJIG1hZGUgc29tZSBhZGp1c3RtZW50cyB0byB0aGUgcHJldmlv
dXMgY29uZGl0aW9uczoNCj4gPiAqIElmIG9wZXJhdGUgYXMgZGV2aWNlIG1vZGUsIG9ubHkgYWxs
b3cgc3lzdGVtIHdha2V1cCBpZiB0aGVyZSdzIGdhZGdldA0KPiA+ICogZHJpdmVyIGJpbmRlZC4N
Cj4gPiAqIE1ha2Ugc3VyZSB0byBwYXNzIHRoZSB3YWtldXAgY29uZmlnIHRvIHRoZSB4aGNpIHBs
YXRmb3JtIGRldmljZSB3aGVuDQo+ID4gICBzd2l0Y2ggdG8gaG9zdC4NCj4gPiANCj4gPiBJZiBp
dCB3b3JrcywgSSdsbCBjbGVhbiB0aGlzIHVwIGFuZCBzcGxpdCB0aGlzIGludG8gMiBzZXBhcmF0
ZSBwYXRjaGVzLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBUaGluaA0KPiA+IA0KPiA+IDxwYXRj
aD4NCj4gDQo+IA0KPiBIaSBUaGluaCwgdGhhbmtzIGFnYWluIGZvciB5b3VyIHN1cHBvcnQhDQo+
IA0KPiBJJ3ZlIHRlc3RlZCB0aGUgc3VnZ2VzdGVkIHBhdGNoLCBhbmQgaXQncyB3b3JraW5nIGZp
bmUgaW4gYm90aCBkZXZpY2UNCj4gYW5kIGhvc3QgbW9kZXMuIEluIGJvdGggbW9kZXMgdGhlIHN5
c3RlbSBzdXNwZW5kcyBhbmQgd2FrZXMgdXAgZmluZS4NCj4gDQo+IEFuZCB3aGVuIGluIGhvc3Qg
bW9kZSwgd2l0aCBVU0IgY29ubmVjdGVkLCBJIHNlZSB0aGUgZm9sbG93aW5nIG9uIGRtZXNnOg0K
PiAieGhjaS1oY2QgeGhjaS1oY2QuMi5hdXRvOiB4aGNpX3BsYXRfc3VzcGVuZDogZGV2aWNlX21h
eV93YWtldXA6IDEiDQoNClRoYXQncyBncmVhdCEgSSBhc3N1bWVkIHlvdSB0ZXN0ZWQgcmVtb3Rl
IHdha2V1cCBmcm9tIHRoZSBrZXlib2FyZD8NCg0KPiANCj4gUGxlYXNlIENDIG1lIGluIHRoZSBv
ZmZpY2lhbCBwYXRjaGVzIGlmIHBvc3NpYmxlLCBJIGNhbiBzZW5kIG15DQo+IFRlc3RlZC1ieSB0
YWdzIHRoZXJlLg0KPiBDaGVlcnMsDQo+IA0KPiANCg0KVGhhbmtzIGZvciB0ZXN0aW5nISBJIHNl
bnQgb3V0IHRoZSBwYXRjaC4gSSB0aGluayBpdCBjYW4gYmUgZG9uZSBpbiBhDQpzaW5nbGUgcGF0
Y2guIFlvdXIgVGVzdGVkLWJ5IHdpbGwgYmUgdmVyeSBoZWxwZnVsLg0KDQpCUiwNClRoaW5o

