Return-Path: <linux-usb+bounces-7969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2A87C6EC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 02:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67DD52843E8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 01:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657C015BF;
	Fri, 15 Mar 2024 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rsMH+Obq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Lh3PFjR3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DIN0O6Q3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42FD6FD2
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710464654; cv=fail; b=GWNxKz+yWezNmp3rP2YW4kS3QO7TGrHnVX7EzmbE3y2WdsXjvI70CT5vYr/Eea0wm0p2QY3NwdlQ7lPvIJB0rpHYTY3QNKZScTt0j2huHG5CEtY40gec2UgP3pkneJyMjKx59Q1HbxMRJfVQXOyGzvbVJD9Sig1pxKifeAd13aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710464654; c=relaxed/simple;
	bh=rEHqZFVo+pMqL9dMZcTg/Q5Dgg5VhcksDKTFfH2Z9zc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZezKWm4+iW5pYny4RXkSJi0YTklco3D/ND7JNdORQbHd4TEOQETzhCCpxkDY4v+EwsCpl4i+AXXVj77fKDdxI53q/wSiE7vWOuiyDzCfvKnBmnSKdIz4OmhvF2D6ynEpNmovnN57rKTHvgSQGALZzJBhscyXLyS2gb/R0GpM2ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rsMH+Obq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Lh3PFjR3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DIN0O6Q3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42EMP71x031213;
	Thu, 14 Mar 2024 18:04:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=rEHqZFVo+pMqL9dMZcTg/Q5Dgg5VhcksDKTFfH2Z9zc=; b=
	rsMH+ObqdSRNdttJJkklQ6AP0iJmHCyHNwrwnBBrdq6lsHwI28B+LehE9jWcr6u5
	qdfdDfcvwlOBnqvVf1fn6XA7hUexuw3G4STlxmwStzQoyMpEZ9eUdKJfBxdd/h9d
	aL9Sw2wZ7P7Xg2ZkyP9dMlaJYGVyCpiv6KfOL+pH70XFTZ4p0Eb/+FdgVV48DT3W
	OBoIubJVxQIWJLsuYRmlYGDU4Jo/szf9UDoQ3NKfTp3LDGYEVbOkU10Ouaz2imRr
	x1TxmasCTm6L5RSPm+iEHp8d8JqRtzy8I/uD2W5RBVHsvmEceQU9xJjYHKm3KdQ3
	Q6b8wI6tqIgVGfOX85joNg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wva0v0fju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 18:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710464640; bh=rEHqZFVo+pMqL9dMZcTg/Q5Dgg5VhcksDKTFfH2Z9zc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Lh3PFjR3j3YOHxAlmrA6Cgug0NeuzaO5Ap2X/T0C64DPn+/sTUBOz+dQZodGV9PkX
	 RcjOtI+E0lEWhht1SbX4bGpBuvpRo3Hd5ujhxi//Yn4jDUmdLjmzEo3iitQopuSYXE
	 9+YujZaabwexs33zC127PEWv5pDtD8XQR+0nuQL53eCQNkbTnxpHStZEo0Pb/4tdV5
	 T7qoBIV57g29izRSViFYIkXoF4OZCHt433bPukXJO32CD1I3uLMnIXkLEHifIpKhyP
	 iTtYSXAoVxL4np86XKM3lht/tevE6LooS8Q6n+Eefqi1QjPdfGmXFFPyJM5KAzQvBC
	 SK7qU7VGbCETg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E50D2404AC;
	Fri, 15 Mar 2024 01:03:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 77A4AA0071;
	Fri, 15 Mar 2024 01:03:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DIN0O6Q3;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A220F401F8;
	Fri, 15 Mar 2024 01:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik0LgntgjbE0/ZbMXxf8vhNPGWZbtQ8xTiUyeTnnEMbG3P52KYq52FUkeG9rNAW6hb53S72uhoNLhPq+H8sXNfLggDO6QPBqgbTPdFPTx34rkq8zg+WQ6a4rQCXWfl9cbfMBOK+gOxIE/pzTauKwUG9y+EdS2fUd7UG/ZhqfPCr3mao0SibaksOvJ1y2KhG2Iz+LKGT22fHehWspHtRyk+NqsVIrpjCK8X6bLgfREEZDQ6xqJQmbTrge9vFmnSE+8RMAq528H5vx7Ko5Qgg3h5t3JvbhWPF3jMQO4weVwWfqiKtqxyqkK7Ub6HB9VPqOTYREeD8JqtoRZB/BX/WyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEHqZFVo+pMqL9dMZcTg/Q5Dgg5VhcksDKTFfH2Z9zc=;
 b=Og6EvaxtwsKv48wpdpVXJDBaj+zWxKkpi2aozkB7M7JMOMDab/cGglt0exIsqZErWMdrpnmO+W+BROE5v5lgWg2Y1nd63WWPXw7tiyyq/xPz1FB1kMJ9GpH8azUDo+/x+2eMKZqiVyPpQshNdYnknBVl2y8pt/zbmSiX/1PgK22cpYzqRGJk/Y0hccqty8i0VKERwG0fAc7UklVYnZDLEumba990klP3Dpc+8L3pedaGz9F2xQJ/wfWr3g37dpwsQXGRP1LESwS+hk02izyfDL/cZXw7q3jnfHAT5UHDLxslHhnRRkBbA/gAhRdHP65Mo3Kkv/XMv0VPZlhgbxab9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEHqZFVo+pMqL9dMZcTg/Q5Dgg5VhcksDKTFfH2Z9zc=;
 b=DIN0O6Q3Spv/ZciG1vV4q6y0mNi2IwG8BLdd0Uh3Upz1Hk7/WlPh6WrDD0VCGYoLx460Xk6CHaZc7q3vjH8GLBZRqFbek0UyPYX/CqXot1G/sIS8rfV77cAcUyV71K5hYfssLoysRIslkMD2fFMNx57lzC36lHzKs2DyEWTREY4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6148.namprd12.prod.outlook.com (2603:10b6:a03:459::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 01:03:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7362.035; Fri, 15 Mar 2024
 01:03:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: pci: Drop duplicate ID
Thread-Topic: [PATCH] usb: dwc3: pci: Drop duplicate ID
Thread-Index: AQHadHN0UQCfyAaXh02Vn9faUjCAMbE4AGSA
Date: Fri, 15 Mar 2024 01:03:55 +0000
Message-ID: <20240315010353.psnflrkzqj5bw7ji@synopsys.com>
References: <20240312115008.1748637-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240312115008.1748637-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6148:EE_
x-ms-office365-filtering-correlation-id: 30f33fa6-bfc0-44ad-ba36-08dc448bc997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zmE8gCrIUo+N18Az7zZujm1f5OyDsq1T9zqs4EcGYRlGKSjhuXcV9gEnNqNRWhv9OwmP3jUrkTYVBBpdBCPV9wWk4C0F5Xpmbc94VZhWLfIjr46cmO5GQTSE5DFbSxdnvg9dHnBWKAn0NgHuD15BEUVOVCtTCSp/1NnZyBtwruHUYxDPf9gB9K+I9o8NnKU57VoFl1n8LiuHWqS/UIK5+i0wnOVKVBzbaHqZvVMM0etfGh+TKY/daF8wGGSBdMT52jsSTQ8DvGNGznvw8fM6y3KQvkpF6OIiPjRjzroLVAgxnK1TysUZKRDU46BJUMfryUPSTHY+sqT0Ko38FcIYpai5Fa/bF+XSU69QP18QVGF4ZV2xj/90Yas6oZL96wkgYmJR/d6xEynZ0RYNdSpytjpNGeYt+6EJqsILyLYO6TTv5cYSgvWySErwzIFyZg8VcAwBccbwbO02ZXj1Viqq7n92OTwLptbj78uTHV+imDcdUw+raL7lVvkS34mf6whYafyGZ2oSXGRpAmFOCzFBpUDb8Ps/0Cj3S5nT6xHmeO6HI7ckQoNucZ4JbeXhue5fZTxkHNoICuxRd8FRqsYB/5kGH4gDIaDQHjM0JJ5hwfyHo4V8n3iMaj+GI+Lju6EeJConsVgfEBsiSltgBrCyOXS+omFo+euWajQB5O4pOO673ZAnXcEGIUol9kdSYVjh/rRMAHVgC4ifMYhM4HY9dePh7fcC1duKGdTNvMzz7Jo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUluOVhYbmlsZ2JVemRGVGJZcTBsL08rRE0zWnFWTmVIZWIrZGoyYk90TWpK?=
 =?utf-8?B?dmR3ME5CWmRTendVSzl2eFEwWENOMlV1MXJPYVR4ZjFRd2U1d3VlaEVlT1pq?=
 =?utf-8?B?blhKcUFNVC9BQ1M4dGRvQlc2RXRmR3ZmdlUvdXIyY1pZYU9rM3lvYzkrckpM?=
 =?utf-8?B?OTMyczNXUkZ3SHMvdXVpYWhaTk9yR2lDK2wwdVVpNE55VG9pS01od2dzNnV3?=
 =?utf-8?B?bWtqekVEdmpCNEJFU1ZLZ1VMWnFHdCtodmFnSTdQNURzc3U5Nit0RjJMdG1E?=
 =?utf-8?B?T3BXTUVId2I4aXk1Z0VYbUkzZldDYVU3SXBobVBZb1Fmb3I3MlJuRXB4aWVj?=
 =?utf-8?B?WkQ3T3BDeTl6YXVFdmhRaGpoc0VNUVQwQU1VSFVFWnVrTW1rK3RsS1cycDE1?=
 =?utf-8?B?azM3K2xVeUZCQU8zVlRsSHNsUnZGT2JkQ3F0aGt1ODZweHJSRlJCaFE5NEJ3?=
 =?utf-8?B?aHc0eFY3UW9MS2o2enpOWE9XTjlkNm5PL2l5VTNocERsZ2RhME10TUFXK1pW?=
 =?utf-8?B?d0VNcEdhci92NmtvMmVCV0tPMmZiMDVVWEMvcm5meWJPOTIramZ4cHhyWHZo?=
 =?utf-8?B?R2J2MW9YQkFjQVdZcWhkMzQ2NFVVZ1U4RVN5SVBGUG5rY2RpcitObFJBRTRI?=
 =?utf-8?B?WjZsbi9pZXpNNGVNZENOQms5OTBsdVBHZnM1OGZKcGNWbk9rcXphVUhkQ0Zy?=
 =?utf-8?B?cithdHEyNUhmRG54dHArU2hjUmNQZGF6RW9hVmloRVcyUGRJRnlIc3RsdHBO?=
 =?utf-8?B?T2pmYXNYak94SDlCd2owY3FCNi96cDFoMGtUN3VzRUVTaVBFT0NjdGx1aWhE?=
 =?utf-8?B?Z3MxcXlsWWo0OXBTSHJEN0FhcGhXTFRxSVc4VVI2RUJtOVh5NUt5ZmRNV1Za?=
 =?utf-8?B?d3Z0bTlLQkpaWERFK2FId1A4LzJnZVgvYSs5MVNYZG9DYjNCenpHVit0akhh?=
 =?utf-8?B?SzJ2azRmN0VNY0QzYVVXSTI3VkZlTXlHRVkyRTRMVHVrbGI5Mk1aaE9nZGN1?=
 =?utf-8?B?Ym8xSm8vN0VuZGpPL01RSnRnNGdYWndIODhaMDBySGxSRWxaRVhXYjYwSTZH?=
 =?utf-8?B?QlNnS1ZHdm1LUXh6NnlRdmZOOWJrMFF6Q1VvT09jRnZFenRLY1MxbWJBRVRK?=
 =?utf-8?B?RDdxZ1NOamo4a3JzTUQyclBCOVdYS0lHN1pBMUxFT0Q2Ulh6VnhTNGFSNElJ?=
 =?utf-8?B?aDhSYzBDUFdETFZITkliNWFDK3dGaWU2YXJVS1ZzM0kxNUdLSmlHemk4b2lD?=
 =?utf-8?B?d2xFN2pUamRxVHVDY0NEVW0wWnJhV1NOYXc0UHZVWDYvdFRZT0xEVFREVUJG?=
 =?utf-8?B?N3VibUhsYm84bmdBY0N2ZE9uanh1eXY4SnRUMytxZHF4aGtwdHoxYUdzckpC?=
 =?utf-8?B?ejBmVlFSeTY2ckpaNS9RME8yZ0t0aDRCUFIzemk2N1gxSjVDNXg4bUhqTWFj?=
 =?utf-8?B?OVRERVhjUWlWWXdkS3gwWmZCalVxaHRqc2Q1emd1eDNkTjVoL0JSc21McXJR?=
 =?utf-8?B?NzE5bGVPd3ZPc0ZsQ3lzUE1CbGJnaTJFRW5TWWF5b0JIdFdENmxkZ2EzZDM4?=
 =?utf-8?B?YXBKUnlJc2hWMWRMcU5pTFlodjVGd25WMmVzRmFvbVM4UUhMcWYwcHRxRUsv?=
 =?utf-8?B?cUVTdUVxSUI4NHNvQ1d3UHVsVS9HYUtiVWhoMVdCSFVRemxtV1pMYUhsUmNs?=
 =?utf-8?B?VzBUblRhRlhHTUcraHFJNkZEMDZOWXVLMW91Ly9yMmRMVHBZWkVvU2xsbG9s?=
 =?utf-8?B?OFNZTEFhcUthY1c4MUFIVy9OR0dMQVY2ZDlhUU1PTnVRSG9IQmtiZjFYTVlV?=
 =?utf-8?B?V0dDSmwzVzBEaWhQa3kvTkdmQ3VNQnFWOXlLVUxWTktvaWcwUDJjZnZZQ2dM?=
 =?utf-8?B?aWQzWUZWTTgvc3V2N2VuVElDclhsUlViVVhQRTJoV2JOeTJFb2NKQ3ZYU3Vh?=
 =?utf-8?B?WFZ2T2xVdUdwZ3hyMFU4QUhJTzJoK3kxQm5lQm1PRkxkMitSWUcycEJKbUEw?=
 =?utf-8?B?Qzc2L3M3bThJNGdaZ2ROSnlMdW9KekxqY2U0Tm5SLzg2UTRZMHUyNW9YZkhK?=
 =?utf-8?B?RThmcHBZeGpiWHhYVmd2WThnVWxqR0M0K2R6MkNqMkkvQzk1anNuak5uRDdm?=
 =?utf-8?Q?rUYD5OyFzoGRTt9bFv/pIOqdR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5599E4549347324B8DB49BB7888E1AC8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PeEc+31TMRZLFMLpqV2BqWEgN3C4an1LZbKTXU/Y9GeG+NHKi6FnK+Ho7Q8Bhk7eN/lQWLT4EGIFRA/2F1QmLczy//ECv5A2Y73K4xta7Pno82YOyoEs/5w806BIkElUe2CbFsVRpv4Ynjd7l039OHCplQOSI1qc6vjsLZ3Ecm6MxGg7D9vQMq4btakCImRvuVzhN4AtuLWBBY8AQK5yxhAB18zSbUZ1+4nKWWVqLULsJQhp6qq/4noh3fgjyb6Ip4Z9XmKpYcgJJdtk8eS9o2j0J26HDhk38dF0IV8+k39ofIKknffcMpxkDwCW1MeSdXgfBZMB8AM1D+Ns9eTh2XW9WKIVDSK4WTotcYdwSnZrC0UJmj4YRGQAbEJK7yHcQ2d2ceUuRnu/kVBVGCeYoN85KVxOSBsX+bqA+UBFmO+T6reNaKoE3Q9nWusnwHkvg/xILeMmIewCoDusPWl8DxkBJcRa2YY4zkMBu8vSjuHj8YnGAlZtmxseWcuP2/LsPXno3x9mPY4YuTgnHlDBm43P/sbQWjr6QvWqcJnP7XUGYt3gVZ+/Oxb91/wHaEc+X3U5A4e20ykJ1O+YYxZxMhEH8EqIpJwlxNQ9SA8GKDmsYZzkMnYPEDzAZJwAVWbQvBTUkizJ5ZhyTHQZyDVr9w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f33fa6-bfc0-44ad-ba36-08dc448bc997
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 01:03:55.2865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6C050LWIkXc/kxXZlVvPphSdXGEKEt5KiCskWdb7EI7iND7OqAKshO8qfS4ocZdp7Fmjm9Wr+lsdukU1mMudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6148
X-Proofpoint-ORIG-GUID: s7MqNnfhILVFmuHcCrKLyq46ntAa-0d5
X-Proofpoint-GUID: s7MqNnfhILVFmuHcCrKLyq46ntAa-0d5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150004

T24gVHVlLCBNYXIgMTIsIDIwMjQsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gSW50ZWwgQXJy
b3cgTGFrZSBDUFUgdXNlcyB0aGUgTWV0ZW9yIExha2UgSUQgd2l0aCB0aGlzDQo+IGNvbnRyb2xs
ZXIgKHRoZSBjb250cm9sbGVyIHRoYXQncyBwYXJ0IG9mIHRoZSBJbnRlbCBBcnJvdw0KPiBMYWtl
IGNoaXBzZXQgKFBDSCkgZG9lcyBzdGlsbCBoYXZlIHVuaXF1ZSBQQ0kgSUQpLg0KPiANCj4gRml4
ZXM6IGRlNGI1YjI4Yzg3YyAoInVzYjogZHdjMzogcGNpOiBhZGQgc3VwcG9ydCBmb3IgdGhlIElu
dGVsIEFycm93IExha2UtSCIpDQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtraSBLcm9nZXJ1cyA8aGVp
a2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtcGNpLmMgfCAyIC0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcGNpLmMNCj4gaW5kZXggMzk1NjRlMTdmM2IwLi40OTdkZWVkMzhjMGMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1wY2kuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gQEAgLTUxLDcgKzUxLDYgQEANCj4gICNkZWZpbmUgUENJ
X0RFVklDRV9JRF9JTlRFTF9NVExQCQkweDdlYzENCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9J
TlRFTF9NVExTCQkweDdmNmYNCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9NVEwJCQkw
eDdlN2UNCj4gLSNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9BUkxICQkweDdlYzENCj4gICNk
ZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9BUkxIX1BDSAkJMHg3NzdlDQo+ICAjZGVmaW5lIFBD
SV9ERVZJQ0VfSURfSU5URUxfVEdMCQkJMHg5YTE1DQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURf
QU1EX01SCQkJMHgxNjNhDQo+IEBAIC00MjMsNyArNDIyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkIGR3YzNfcGNpX2lkX3RhYmxlW10gPSB7DQo+ICAJeyBQQ0lfREVWSUNF
X0RBVEEoSU5URUwsIE1UTFAsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lf
REVWSUNFX0RBVEEoSU5URUwsIE1UTCwgJmR3YzNfcGNpX2ludGVsX3N3bm9kZSkgfSwNCj4gIAl7
IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTVRMUywgJmR3YzNfcGNpX2ludGVsX3N3bm9kZSkgfSwN
Cj4gLQl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgQVJMSCwgJmR3YzNfcGNpX2ludGVsX3N3bm9k
ZSkgfSwNCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgQVJMSF9QQ0gsICZkd2MzX3BjaV9p
bnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIFRHTCwgJmR3YzNf
cGNpX2ludGVsX3N3bm9kZSkgfSwNCj4gIA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1i
eTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpU
aGluaA==

