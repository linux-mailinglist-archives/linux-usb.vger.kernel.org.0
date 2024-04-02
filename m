Return-Path: <linux-usb+bounces-8775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC43895FF5
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 01:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E4A283D8C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 23:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6385143161;
	Tue,  2 Apr 2024 23:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="taLjXE0V";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oia/ikDI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qpBlBz2s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8E3A1CB
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 23:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712099633; cv=fail; b=UKtTrOqtjHjw2BxZX5prROmEWg4R8c0gDsdKoGntI/D35r5U2q0gpydV9TA/Yy9tAauzO8TAPtBhXx3D+wp26OsNw2k4+81Fyr42R6S7jrX/WedOJfReIp0Ow599ydda1rsb6aCuPeirTsJB8xBYp1XbuALajtofAVMRqzSYh6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712099633; c=relaxed/simple;
	bh=rz9ON/e3lciV0HD6xmrqgM70xtSH3KpurlI2ZGxYEHs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cETdm+KylPyxqEuLFLQA15QGumTyhHl83LmmbxVG6+9ZI96P1fI4nUcjRID5rwuuruOiqtxfYkqLyqYcznaJGznBTJ2qpGvScx4Wj9Q6b5wIwd3kAgPqDTMWqc5LKy5RSBrEWd3wVTaIn52FHAzqDfeuGhbyD0Dtqd+nfI6FDBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=taLjXE0V; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oia/ikDI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qpBlBz2s reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432IO0q4016541;
	Tue, 2 Apr 2024 16:13:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=rz9ON/e3lciV0HD6xmrqgM70xtSH3KpurlI2ZGxYEHs=; b=
	taLjXE0Vc1vN9FsCt3/byGkHR3JGaSPuT0f/PEwSJvikbiET4lSKxVo3t/oeLAm/
	WsFH7zw87o+14VJNTqZFnuSNfSNGtxsDcKuWT5nF9pMOaJEAUw67+xyNW7FFN3+p
	ja+8SNeNT6/8EiNncKqixUZzLkODVUUPXkj3N8UTxzXucJQYqRVWr8B+HK6PqNCS
	PPNZj5RJPX/BaT4qYSVRH3y961RCrORblvMpcXj9X6+03sm+KkSgLpVUhox0avEq
	2PjDdALbz0mEvURiAxA9dTPBiA54oP/OqjE9q2uNw89CqPEQlZDOwmEk18b6bhRt
	VRP6WTgfLcwwarAkriMwlg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3x8q81s0q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 16:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712099622; bh=rz9ON/e3lciV0HD6xmrqgM70xtSH3KpurlI2ZGxYEHs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Oia/ikDI2wNK3wzgWenFGhzlq3hirElWAZC5X3X4uenJTAnGTh8R9F04c0/V7122l
	 xU0A2znUdrHQ9JxrgrPzAr7B/d1/yOOXjFa+eZDrGlVbHqsnNGAOpjRX0JMkt8NSVA
	 +Ch7jaDx7JPnkp3EOvQmMFo80B/f3INm0pBfXVWg/MZFbM/PgXMhmEznb4yJ+oB+fS
	 ugZZwIBkV1SUiE3pFaLnu/H8vJGOubvVfp6pNc7fdAQ/fZT3QB+5ec6X/v/16DWfWo
	 zrqf75mQn9HaRqKn98riJEmu7WKl9ZIJYEEvD+UkIO6taaVUT6RS6DfVicZsbYDSn6
	 SEL7PRa2Y4nVg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6229C401C6;
	Tue,  2 Apr 2024 23:13:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1F136A0261;
	Tue,  2 Apr 2024 23:13:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qpBlBz2s;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B06DF4048E;
	Tue,  2 Apr 2024 23:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApnSIG1067V5/DGzHBh6TL93+heCXZcCcwl4hQ/JcxZz/5wzryIB5OEfqdMqSmzECEry96BeDZdRz9FjjwLb+mISEhG57UcKDuT5ZjyXzDaKssbTfL+EdeD7Q7KsQGPLFuQ+a/mBxN3COgPgi7GA0CCT8uTVt9v5VSRdm0zJsYSApo7pZgbybJFPub8H7vQhc9NrgxMW99QyE2IGg4EoSShG/37gwREtp6M6PhXzSh8k82Unm4EgphGKlx0BCMn5puIyWW2GVBySKvGTyAgCr720jSDWzqf39gVkOdqEGffjclDcHJRdjoITy5jRlDBIPCKwFn0hjTrHJ8qJL61YOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz9ON/e3lciV0HD6xmrqgM70xtSH3KpurlI2ZGxYEHs=;
 b=emMRpq9hRePGEihr4Vf6vJIcYFQ0qQVid1gwYOJuKe5IgRYtTAuJjyXIB6EKVIpcklJzK34AH5UbfGW2sQHiL092M56A4W65CfhFUzZKWWpd6bwYzkMdnbVm6gGn1kYzEbAnytGO7tpdVClWoFTjDf+AtFwawp/0HKG/42xJQeWKUZeEXfBBQPcTPzxdDRCmgtKJILpPyauqw6kpRTBDaAqIqbZ6XOgyEiU1tZFSw3eLiUU5z+YYsIEVYdyazl+yU94/bce2m8Gp/zeUCT3CCDZNbzpIEvt+n6muvQBHE5T/tUYYpx+meelFoPGv0JPNp5re2PqFGBTd4a6CuZfSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz9ON/e3lciV0HD6xmrqgM70xtSH3KpurlI2ZGxYEHs=;
 b=qpBlBz2sadzQprt3tHUHo51ZOvK5VJTSNoIV1dXtzyXBxGLGeZ5A2RQ9s7uWEabhqkqpJdLyh2TeMWMgc6cvBrd594Uj/FUNGSuj5xNOdwhhIoWe+T2tlzcOl6dH6FiDjGrt4nuNPl3mlXpeytlrlwVzJ4Z1Zi03xkvsmKxl3R8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 23:13:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 23:13:36 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Niklas Neronin <niklas.neronin@intel.com>
Subject: Re: [PATCH 2/9] xhci: replace real & fake port with pointer to root
 hub port
Thread-Topic: [PATCH 2/9] xhci: replace real & fake port with pointer to root
 hub port
Thread-Index: AQHaaxl48RCUcLV3qE+GJKDD2cgzKLFUWTaAgACgJ4CAANczgA==
Date: Tue, 2 Apr 2024 23:13:36 +0000
Message-ID: <20240402231333.6cqttc34udx5nzhu@synopsys.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
 <20240229141438.619372-3-mathias.nyman@linux.intel.com>
 <20240402005007.klv2ij727fkz7rpd@synopsys.com>
 <7726873f-940f-fe88-f065-2ef23edd3ab1@linux.intel.com>
In-Reply-To: <7726873f-940f-fe88-f065-2ef23edd3ab1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6904:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LPG/Gbhyr/2TVvhGbDNZvBmA/Sq3YNz8dlpgmXlsQJyNeWnAANGi+xU3mwn8qSw/YEAH9mmvqxECm8dW9q1LEIgtITwip/ORGd4uKJ7/OHImeSCWgLYJ9l9egMmnTJKDDo7DmqNtbvah8+1LPt8zVIPc+artv5rRjghiaWMakMZdtGmJVpvWdGGSWsXv/osWNI1KIArH1q2m7Qoa6/f/pndMwmFQ6I0/cgQ1ViHnIzAkwuzvUAf9m/e3elUxUVapVfSEOVv67pbmrxw5Z5P+NQsOzgXLYNjFynNaUbDbIth49+0vZU1epOXEQhQyyOj/UeKNTA8q0gtkYILaTiOtkAVQOdjZnx/kaYQfXycjEJOIZ34eroErk5Xw9UHagkv2Gr7deNyJq4YlN3in6HUUje9l5BjwhMPYfJZS/+6oHOFwlfXIHe4HnFX0lTjTcgdHVjm27vya4lB9T6g3sGBi1HSLV/u113prXveAT99DqCOsnJ5vw0bI+1DGSJlJmOHH19rF/Kk+y6yPcnOWdrdz9kTnszkKSEAoAU37wrkMRESwaWraPsShJHtF24QPCd4WG78MOcRDAHotX+POHCA3Q7sgmq3nFmjbLwBNYJqpebXDIOS8hScR5UKtUNUoOjOKnIg64JN+UAXDbpD1+GQvf0B3b1CYY+xPaUnBbVc+LUE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?anF6Nkp6d3J6eU1Hc3pMMEx5MU91aDVsRHZzRGsxUEpkOHBMMFNudkY4eVlP?=
 =?utf-8?B?T21KRng1ZHpqNDI3QS9ZYlpsNjUzZ3dKMFdKQWFycEp1VURtSkFRSHJLSTdI?=
 =?utf-8?B?MjRiWVR6b3pWUGZveFFQUFhyMUlvRDlkaldvL0FEd3hpakNuOTJvR3pxQWI0?=
 =?utf-8?B?eHk3K3N1QTBoVEN3S0daVWljN1JEME5vK01CL2dpMkl4by9ZNDRGRGpueEVL?=
 =?utf-8?B?RjZjVHJGVFlOVU5Qb2VUdVVxU2lLak1UQ0lRQndjM0RSTWJZRUxRRDdLN255?=
 =?utf-8?B?ZURXODJQUkNlcjFObXo4MWdMaWdhYmNFa2RHdE9iMTlZWmdSUmZBNjF6K09C?=
 =?utf-8?B?YXQ5K2t0S280ejFKOHU2ZG4rb05GRzZIZWVlKzBPTTVUVXQvZjdzZENlbG8v?=
 =?utf-8?B?dWRYSFJzbGcrc0ZtY1Z0OHJNdHB1aytsOHprM1hDY05HMlVub2FmNkdYOElG?=
 =?utf-8?B?dHk4VzNTWWJxVzc1L1NxUytKazJQZTJ5QllvR2lkaGhHTktRV2huWUVIUTdD?=
 =?utf-8?B?NERZV25Wekd2STM1S2lNQXNxOHVkalRKdXpLODA2Z2FwQzAvd29YUUFLQUp2?=
 =?utf-8?B?b2ptelUyL3l4YjF1UXowOFlKM2theFNxWlIraEVjeUZUd1U1SjlpcjN6bi94?=
 =?utf-8?B?K3VyeEJxVFBaa045UTJzbWgxMWdrY3F3bkh3dEZ3c2tpeHEwajVWZEdHeXFx?=
 =?utf-8?B?RE8zTVFoUWk2N050MHN3OWlDTXlLYUpxTmI4RU5ucnFhcFRNRmgwTW1Ealps?=
 =?utf-8?B?UXUzOVFtME5vRkxnL003dkU1L1ZLOUtVcVBnblVtVWp2b3dCVlkvbDNJcHRN?=
 =?utf-8?B?cFMzTmRLWE1sN1lNdnNpM2hmQnhIckRZZ0U4MnZpUnMrbEc2RWNmdVk4dHZv?=
 =?utf-8?B?ak8wdk5HNHZyNFZnbzdBejJ0ZUt2RFVLcEs5RGR3S0F3dEovajVuTFkzV3dX?=
 =?utf-8?B?SHdOTXY5bE1FQ1F3dGRCUmd0SzRSclhFc3VhVGhkQkwyL2FDM1ZhSVFJdUFW?=
 =?utf-8?B?TDZ0R2lJc1JTVllEcEhVenpIY04xKzNZZ05Ec0dJRzIwOStUdU5zellOUkla?=
 =?utf-8?B?cGxiTjJ6ek94YkttR3hVWWxmZnF3SzNlNGpmdWxkYXpVQTFsRjQrSnhXb2ZK?=
 =?utf-8?B?cDZBOVVNK1NRY0J5a0gwaW1zUjlFM1hmaHZuSnR2QUlsNStraWhXT2NlV3Nh?=
 =?utf-8?B?RXhNZUE3bHJXSEl1YUIrTnlNQUJCYytOelJLaCtmeUNEa3Y0THFBOFJlNW5x?=
 =?utf-8?B?TElEOEhBSEpSQytGc3hoRDhwWGRqd1lvaFZ5YzJtb25qYmhrNi9iU0ZVMXJD?=
 =?utf-8?B?c1czdEtvQk91azVncjBGcnlmNzRsY21nQnFkZ3pHUzhZL3ZaSHF1Qy9UVjh4?=
 =?utf-8?B?dUxaR0hlL09oWmZ4SFIwTEhiSWg4bnZRcE9QUVJnbVdsaHRDbEI1Y0kwSU1x?=
 =?utf-8?B?YjdoNTVReTZPcUkzdTZyZkJjM29TbitFbjZzeFNTUkZWK1ZpeGJGUCtyNTZj?=
 =?utf-8?B?VWdtV2ZFZ2k2dGg4RFV4THdreTE4b3lydis2a3VQTHl1WHhIYzRNcXFpa3Iv?=
 =?utf-8?B?bTZxNllvYWJUVkkwR052dnRCUEowaE03OVFpWHJmWjBzVTBIMTkvWXExMDJQ?=
 =?utf-8?B?b3NVZGRWMUR0N0V3elN5ODV4UVIyWjR2S1RncUExQk9GL0daUlByNDQrcXBE?=
 =?utf-8?B?dG1qTGx4TTZVbXA2RnhEc0FPTGwyY3kxbjdYR1Izb3I4M21OaXFvN2lPZDdF?=
 =?utf-8?B?bGl1UkM4OWczaGlXTzd3a2gvTVk2dGhBdEUrOFNFbkhma3F4VlhwTVBtVndD?=
 =?utf-8?B?bGRhWUhIRWdoRFU0Ukl5N01vU0hvV3hLYjZuYitMQThPb3BUNXVpY3JNQW0w?=
 =?utf-8?B?eTFMbG9OUEhvWXpUNFphSCt4WmIwenRkUnBTcG55NGRldHo1enN6emRnMGFz?=
 =?utf-8?B?dWFCU0hWWjJSRm5YaHBRRjF2Tk1VUFlCcHYvR042NUtzYm1UMG5zMjZUc3pD?=
 =?utf-8?B?MlZiRmdhTkc3akpqYTAybGtRZ3o4TzN0SXQ1VkJrRUdzZEh2ZzNBMTA5WVNF?=
 =?utf-8?B?TGI0Y2xJa09sZE5yNFZQUnUveWtLNlVReW1Henc5OXB2K3dLeHFSVitzRUU3?=
 =?utf-8?B?M0tEUHBOMmczY3dvdHBjaWpTTlpQRTNTNHJqbjNJOTZ0dzhtaWY5V0NIWjE1?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04ED0D35EA2CB54A9BF12AEF80A3DAE0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IKPUrlUrEBJmeOLDn84kW3060X2aVHz8Hmsl9Pr7cWvnAdkA6f4nE+8x7wrrBmI8P/rLG91W691e72EALYXnhhdthFuX9y2dIbu3RQpFleRyMpFRLzn69P307GZseT9XulcB019Pl2ZTagdtcJepPUyw33F6BnWRtqNecqTsn0seGVFwxM/7HvqNo2+cyygN1mfy9OVhEb6R68OazryZGMenZWXAeJ4f9HOCyAqLUC3AfPitrlf/rhqM88Sc3M2CHfcBG42Z2gl++QPQR8PCzczZgeTwVj1JPMlsjQfChZHrsRqyV8dpf4qp54hPNE7GQU/XkGQbLM7F7Mz6qLPPSgdMRrLglZw1t0+64Cg+BCcy/WYnSVgu4DFDfvgMANrMm5lZT7vyK3QdAE7ufda4C4tOeCaEfnuobtRZIzwtstz31mMYQUYjVYbWob8doHusaZKh0OJlQYEcYsYQAjTO8sOFMM7eI6rqHIU367Bw8YyCIFliIRDUx9fHyMXZdeTFx0cTjSQ+OR2u8jpgXOsoyrH4SGJQZ57ZemJ99vA0pPO5WHkS33++GeaZ16J5RGKVJrRUEPxXwrgUhWLT//OGdImei/lELBOb2r/ra6Mk7AO9N6qqyyLXGZmRgmOp2f6s/WIxCBxu7OByUHifBFdbmQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01aa20f-9c8d-4b65-7688-08dc536a8676
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 23:13:36.7239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PN48mr9Kib1pOaW04MrwOFWLkPRB/OjQEiP4sJw02oXMCK2sGrg476LcAFW/J8Y66qik0cTerCb83du7YRCC9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
X-Proofpoint-GUID: GqENAuwvzkcWN7RPiUCR1V98Gyou8sUY
X-Proofpoint-ORIG-GUID: GqENAuwvzkcWN7RPiUCR1V98Gyou8sUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020171

T24gVHVlLCBBcHIgMDIsIDIwMjQsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IEhpIFRoaW5oDQo+
IA0KPiBPbiAyLjQuMjAyNCAzLjUwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gSGkgTWF0aGlh
cywNCj4gPiANCj4gPiBXZSdyZSBnZXR0aW5nIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGJ1
ZyBmb3IgdGhpcyBwYXRjaC4gVG8NCj4gPiByZXByb2R1Y2UgdGhpcywganVzdCB1bmxvYWQgYW5k
IHJlbG9hZCB0aGUgeGhjaSBkcml2ZXIgd2hpbGUgYSBkZXZpY2UgaXMNCj4gPiBjb25uZWN0ZWQu
IEl0IG1heSB0YWtlIGEgZmV3IHRpbWVzIHRvIGhpdCB0aGUgaXNzdWUuDQo+ID4gDQo+ID4gWyAx
NTE1LjczNzYyM10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNz
OiAwMDAwMDAwMDAwMDAwMDBjDQo+ID4gWyAxNTE1LjczNzYyOV0gI1BGOiBzdXBlcnZpc29yIHJl
YWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlDQo+ID4gWyAxNTE1LjczNzYzMV0gI1BGOiBlcnJvcl9j
b2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlDQo+ID4gWyAxNTE1LjczNzYzM10gUEdEIDAg
UDREIDANCj4gPiBbIDE1MTUuNzM3NjM2XSBPb3BzOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgTk9Q
VEkNCj4gPiBbIDE1MTUuNzM3NjM5XSBDUFU6IDEgUElEOiAyOTA1IENvbW06IGt3b3JrZXIvMTow
IE5vdCB0YWludGVkIDYuOS4wLXJjMi1zbnBzLWRldGFjaGVkLUhFQUQtZzViYWI1ZGM3ODBjOSAj
OA0KPiA+IFsgMTUxNS43Mzc2NDJdIEhhcmR3YXJlIG5hbWU6IFN5c3RlbSBtYW51ZmFjdHVyZXIg
U3lzdGVtIFByb2R1Y3QgTmFtZS9QUklNRSBRMzcwTS1DLCBCSU9TIDI2MDUgMTAvMTYvMjAxOQ0K
PiA+IFsgMTUxNS43Mzc2NDNdIFdvcmtxdWV1ZTogdXNiX2h1Yl93cSBodWJfZXZlbnQNCj4gPiBb
IDE1MTUuNzM3NjQ4XSBSSVA6IDAwMTA6dHJhY2VfZXZlbnRfcmF3X2V2ZW50X3hoY2lfbG9nX2Zy
ZWVfdmlydF9kZXYrMHg2NC8weGI3IFt4aGNpX2hjZF0NCj4gPiBbIDE1MTUuNzM3NjY3XSBDb2Rl
OiA4NSBjMCA3NCA1OSA0OCA4OSA1OCAwOCA0OCA4YiA1MyAxOCA0OCA4OSBlNyA0OCA4YiA1MiAx
MCA0OCA4OSA1MCAxOCA0OCA4YiA1MyAxMCA0OCA4YiA1MiAxMCA0OCA4OSA1MCAxMCA0OCA4YiA5
MyA5MCAxMSAwMCAwMCA8OGI+IDUyIDBjIDg5IDUwIDIwIDQ4IDhiIDkzIDkwIDExIDAwIDAwIDhi
IDUyIDA4IDg5IDUwIDI0IDhiIDkzIGIwDQo+ID4gWyAxNTE1LjczNzY2OV0gUlNQOiAwMDE4OmZm
ZmZhYzMwYzBiZGJjZTggRUZMQUdTOiAwMDAxMDA4Ng0KPiA+IFsgMTUxNS43Mzc2NzFdIFJBWDog
ZmZmZjk5ZTAwMDMzMDliOCBSQlg6IGZmZmY5OWUwNDBmYjQwMDAgUkNYOiBmZmZmOTllMDAwMzMw
OWI0DQo+ID4gWyAxNTE1LjczNzY3M10gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAw
MDAwMDAwMDYxNiBSREk6IGZmZmZhYzMwYzBiZGJjZTgNCj4gPiBbIDE1MTUuNzM3NzI5XSBSQlA6
IGZmZmY5OWUwMDdiNThhMjAgUjA4OiAwMDAwMDAwMDAwMDAwMDAyIFIwOTogMDAwMDAwMDAwMDAw
MDAxMA0KPiA+IFsgMTUxNS43Mzc3MzFdIFIxMDogMDAwMDAwMDE0ZDMzY2YzMCBSMTE6IDAwMDAw
MDAwMDAwMDAwMjAgUjEyOiAwMDAwMDAwMDAwMDAwMDAxDQo+ID4gWyAxNTE1LjczNzczM10gUjEz
OiBmZmZmOTllMDA4YzlhMjk0IFIxNDogZmZmZjk5ZTAwOGM5YTI1OCBSMTU6IGZmZmY5OWUwMDRj
YTUwMDANCj4gPiBbIDE1MTUuNzM3NzM0XSBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6
ZmZmZjk5ZTM1YmM0MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+ID4gWyAxNTE1
LjczNzczNl0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mw0KPiA+IFsgMTUxNS43Mzc3MzhdIENSMjogMDAwMDAwMDAwMDAwMDAwYyBDUjM6IDAwMDAwMDAx
MDI0ZDYwMDQgQ1I0OiAwMDAwMDAwMDAwMzcwNmYwDQo+ID4gWyAxNTE1LjczNzc0MF0gRFIwOiAw
MDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAw
MDANCj4gPiBbIDE1MTUuNzM3NzQxXSBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAw
MGZmZmUwZmYwIERSNzogMDAwMDAwMDAwMDAwMDQwMA0KPiA+IFsgMTUxNS43Mzc3NDNdIENhbGwg
VHJhY2U6DQo+ID4gWyAxNTE1LjczNzc0Nl0gIDxUQVNLPg0KPiA+IFsgMTUxNS43Mzc3NDhdICA/
IF9fZGllX2JvZHkrMHgxYS8weDVjDQo+ID4gWyAxNTE1LjczNzc1MV0gID8gcGFnZV9mYXVsdF9v
b3BzKzB4MmVhLzB4MzgwDQo+ID4gWyAxNTE1LjczNzgwNl0gID8gc2NoZWRfY2xvY2srMHgxMC8w
eDIzDQo+ID4gWyAxNTE1LjczNzgwOF0gID8gdHJhY2VfY2xvY2tfbG9jYWwrMHgxMC8weDIzDQo+
ID4gWyAxNTE1LjczNzgxMl0gID8gZXhjX3BhZ2VfZmF1bHQrMHhmZS8weDExZQ0KPiA+IFsgMTUx
NS43Mzc4MTVdICA/IGFzbV9leGNfcGFnZV9mYXVsdCsweDI2LzB4MzANCj4gPiBbIDE1MTUuNzM3
ODE4XSAgPyB0cmFjZV9ldmVudF9yYXdfZXZlbnRfeGhjaV9sb2dfZnJlZV92aXJ0X2RldisweDY0
LzB4YjcgW3hoY2lfaGNkXQ0KPiA+IFsgMTUxNS43Mzc4MzJdICA/IHRyYWNlX2V2ZW50X3Jhd19l
dmVudF94aGNpX2xvZ19mcmVlX3ZpcnRfZGV2KzB4MzkvMHhiNyBbeGhjaV9oY2RdDQo+ID4gWyAx
NTE1LjczNzg0NF0gIHhoY2lfZnJlZV92aXJ0X2RldmljZSsweDc2LzB4MWQ4IFt4aGNpX2hjZF0N
Cj4gPiBbIDE1MTUuNzM3ODU2XSAgeGhjaV9mcmVlX2RldisweDExMS8weDEyZiBbeGhjaV9oY2Rd
DQo+ID4gWyAxNTE1LjczNzg2N10gIGh1Yl9ldmVudCsweGNhNi8weDEzN2UNCj4gDQo+IFRoYW5r
cyBmb3IgdGhlIHJlcG9ydCwgYW5kIGZvciBkZWJ1Z2dpbmcgdGhpcy4NCj4gSSB3YXMgYWJsZSB0
byByZXByb2R1Y2UgaXQgbXlzZWxmIHVzaW5nIHlvdXIgc3RlcHMuDQo+IA0KPiBUaGlzIHRyaWdn
ZXJzIGlmIHhoY2kgdHJhY2luZyBpcyBlbmFibGVkIGFuZCB1c2IgZGV2aWNlIGlzIGZyZWVkIGJl
Zm9yZSBpdCdzIGFkZHJlc3NlZA0KPiBhcyB2ZGV2LT5yaHViX3BvcnQgaXMgb25seSBzZXQgZHVy
aW5nIGFkZHJlc3NpbmcuDQo+IA0KPiA+IA0KPiA+IA0KPiA+IFRvIGNhcHR1cmUgdGhlIHRyYWNl
cG9pbnRzIGFuZCBhdm9pZCB0aGUgTlVMTCBwb2ludGVyLCBJIG1hZGUgdGhpcw0KPiA+IGNoYW5n
ZToNCj4gPiANCj4gDQo+IEkgdGhpbmsgd2UgY291bGQgc2tpcCBwcmludGluZyB0aGUgaGNkX3Bv
cnRudW0gYW5kIGh3X3BvcnRudW0gZHVyaW5nDQo+IHhoY2lfZnJlZV92aXJ0X2RldigpIHRyYWNp
bmcuIEkgaGF2ZW4ndCByZWFsbHkgZm91bmQgdGhlbSB1c2VmdWwuDQo+IA0KPiBJdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIHByaW50IHRoZSBzbG90X2lkIGluc3RlYWQuDQo+IA0KPiBob3cgYWJvdXQg
dGhpczoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktdHJhY2UuaCBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS10cmFjZS5oDQo+IGluZGV4IDE3NDAwMDBkNTRjMi4uNTc2
MjU2NGI5ZDczIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktdHJhY2UuaA0K
PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktdHJhY2UuaA0KPiBAQCAtMTcyLDggKzE3Miw3
IEBAIERFQ0xBUkVfRVZFTlRfQ0xBU1MoeGhjaV9sb2dfZnJlZV92aXJ0X2RldiwNCj4gICAgICAg
ICAgICAgICAgIF9fZmllbGQodm9pZCAqLCB2ZGV2KQ0KPiAgICAgICAgICAgICAgICAgX19maWVs
ZCh1bnNpZ25lZCBsb25nIGxvbmcsIG91dF9jdHgpDQo+ICAgICAgICAgICAgICAgICBfX2ZpZWxk
KHVuc2lnbmVkIGxvbmcgbG9uZywgaW5fY3R4KQ0KPiAtICAgICAgICAgICAgICAgX19maWVsZChp
bnQsIGhjZF9wb3J0bnVtKQ0KPiAtICAgICAgICAgICAgICAgX19maWVsZChpbnQsIGh3X3BvcnRu
dW0pDQo+ICsgICAgICAgICAgICAgICBfX2ZpZWxkKGludCwgc2xvdF9pZCkNCj4gICAgICAgICAg
ICAgICAgIF9fZmllbGQodTE2LCBjdXJyZW50X21lbCkNCj4gICAgICAgICApLA0KPiBAQCAtMTgx
LDEzICsxODAsMTIgQEAgREVDTEFSRV9FVkVOVF9DTEFTUyh4aGNpX2xvZ19mcmVlX3ZpcnRfZGV2
LA0KPiAgICAgICAgICAgICAgICAgX19lbnRyeS0+dmRldiA9IHZkZXY7DQo+ICAgICAgICAgICAg
ICAgICBfX2VudHJ5LT5pbl9jdHggPSAodW5zaWduZWQgbG9uZyBsb25nKSB2ZGV2LT5pbl9jdHgt
PmRtYTsNCj4gICAgICAgICAgICAgICAgIF9fZW50cnktPm91dF9jdHggPSAodW5zaWduZWQgbG9u
ZyBsb25nKSB2ZGV2LT5vdXRfY3R4LT5kbWE7DQo+IC0gICAgICAgICAgICAgICBfX2VudHJ5LT5o
Y2RfcG9ydG51bSA9IChpbnQpIHZkZXYtPnJodWJfcG9ydC0+aGNkX3BvcnRudW07DQo+IC0gICAg
ICAgICAgICAgICBfX2VudHJ5LT5od19wb3J0bnVtID0gKGludCkgdmRldi0+cmh1Yl9wb3J0LT5o
d19wb3J0bnVtOw0KPiArICAgICAgICAgICAgICAgX19lbnRyeS0+c2xvdF9pZCA9IChpbnQpIHZk
ZXYtPnNsb3RfaWQ7DQo+ICAgICAgICAgICAgICAgICBfX2VudHJ5LT5jdXJyZW50X21lbCA9ICh1
MTYpIHZkZXYtPmN1cnJlbnRfbWVsOw0KPiAgICAgICAgICAgICAgICAgKSwNCj4gLSAgICAgICBU
UF9wcmludGsoInZkZXYgJXAgY3R4ICVsbHggfCAlbGx4IGhjZF9wb3J0bnVtICVkIGh3X3BvcnRu
dW0gJWQgY3VycmVudF9tZWwgJWQiLA0KPiAtICAgICAgICAgICAgICAgX19lbnRyeS0+dmRldiwg
X19lbnRyeS0+aW5fY3R4LCBfX2VudHJ5LT5vdXRfY3R4LA0KPiAtICAgICAgICAgICAgICAgX19l
bnRyeS0+aGNkX3BvcnRudW0sIF9fZW50cnktPmh3X3BvcnRudW0sIF9fZW50cnktPmN1cnJlbnRf
bWVsDQo+ICsgICAgICAgVFBfcHJpbnRrKCJ2ZGV2ICVwIHNsb3QgJWQgY3R4ICVsbHggfCAlbGx4
IGN1cnJlbnRfbWVsICVkIiwNCj4gKyAgICAgICAgICAgICAgIF9fZW50cnktPnZkZXYsIF9fZW50
cnktPnNsb3RfaWQsIF9fZW50cnktPmluX2N0eCwNCj4gKyAgICAgICAgICAgICAgIF9fZW50cnkt
Pm91dF9jdHgsIF9fZW50cnktPmN1cnJlbnRfbWVsDQo+ICAgICAgICAgKQ0KPiAgKTsNCj4gDQo+
IEl0IHdvcmtzIGZvciBtZQ0KPiANCg0KVGhhdCBsb29rcyBnb29kIHRvIG1lLiBDYW4geW91IHN1
Ym1pdCB0aGUgY2hhbmdlPw0KDQpPbiBhbiB1bnJlbGF0ZWQgbm90ZSwgb2Z0ZW4gd2UgaGF2ZSB0
byBkZWJ1ZyB4SENJIGRyaXZlciBvbiBhIHN5c3RlbQ0Kd2l0aCBtdWx0aXBsZSB4SENJIGNvbnRy
b2xsZXJzLiBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBhIGdvb2Qgd2F5IHRvDQpmaWx0ZXIgdGhl
IHhIQ0kgdHJhY2Vwb2ludHMgdG8gYSBzcGVjaWZpYyBjb250cm9sbGVyPyBJIG5lZWRlZCB0byBw
cmludA0KdGhlIGRldm5hbWUgZm9yIGVhY2ggdHJhY2Vwb2ludCBqdXN0IHRvIGdldCBhcm91bmQg
dGhpcywgd2hpY2ggZG9lc24ndA0Kc2VlbSBsaWtlIGEgZ3JlYXQgc29sdXRpb24uIEFueSBpZGVh
Pw0KDQpUaGFua3MsDQpUaGluaA==

