Return-Path: <linux-usb+bounces-37045-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLDhCq/R+2lxFAAAu9opvQ
	(envelope-from <linux-usb+bounces-37045-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 01:41:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CB54E18A3
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 01:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD77830262DF
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 23:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ECD3D34A5;
	Wed,  6 May 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X5+08ase";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kdlmSUPy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fQkUprFW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165017A309;
	Wed,  6 May 2026 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110890; cv=fail; b=K+or355AIZdDzGrvLAkKNORg60YO5pVbQ5XnLBXuxSHqfyBBIwerD7MBmOXbOm8jN1AVVQlHK/nm1A/CK2+2MmiyOcbrDg7e1gXEp4P9HuyiUyq5XK68JZ0oIPLloPtR/GF2XaTU9UDxQRSfd080QDsDMHQzFXr51Na9cI5QHoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110890; c=relaxed/simple;
	bh=0gMY/vuGF0z25XK4TwIK7NyJEsumsU2tszyGu6+5f7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=POy6PJkgO+c5dUE21cJ/SE3YurtwUw6P4XXMKt6TUX5uvddRDuSTffe96AlgNSLtwGiQQNhjDxOzKj+OSA22zRkN/v7qzvXIX+zQrdvqTWL4qLHqGaHoD3PuIr+ckbKsTmdN/m0q1jChUMEPwLYug+aUpr6LXBImIdpIIPbMRV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X5+08ase; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kdlmSUPy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fQkUprFW reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646MhpEo1409794;
	Wed, 6 May 2026 16:40:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0gMY/vuGF0z25XK4TwIK7NyJEsumsU2tszyGu6+5f7U=; b=
	X5+08ase/KHSiOJQnJZY69TLLKqd0KoL6kscZVW/Q5zqcsBpuyIXZPog5fdjQMkm
	Sl0CzzzQr1id6/OmZzf1GAt/JDoH+Odoo2ZvsrZVvOEAcU9O5aPk7hsez60Fszmn
	IfmL0sUh97VgAophMkBC9hSZnAQXvB7RqPhwoMjRahZ/cWu0cQuloCApqwe3N3HX
	0d5QIL6O/dEs5whIQ2v+OQjy14o5zHGiidg2jx7UfwnBJ00J+cUp2ML5ME95D1tU
	asIOKuV23biBPnTRwqnPiubDu0e9+ZyVe2ht8Ubi6ZrFgxHn5GkiQwQdRyUxa/SF
	O+g3GZtL5L253562D94/Uw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e04bqdgjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 16:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778110833; bh=0gMY/vuGF0z25XK4TwIK7NyJEsumsU2tszyGu6+5f7U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kdlmSUPy368vlkIAqz5O8q9s1jh4Ss6yiUt6V4iJdBvukzAJYfx0xKSPVS8qisttA
	 JDNK+GnBtRwAdDNYMse6xy7O4FpvN+cTJFA/JHEKpqjifQIgU3oEawCxIpqKnUXA4k
	 qruYiCi39gqE3ohsfyW7J5EqutC/1ayamxwi4T1EwuSBDqBvAyyIPsuJQn+8fzL09P
	 n84UcPniZ9gID5PvqpzipGHtdmD+NQxiOvi5tOccBr7VDXaRFHBSWHj8AxjE5OR97W
	 T4asM6iIRyZapoDriZJQJ3ZnXUhb7irIqXGei26I9h7vSAm1AbHA6ioP7Ocs5AXezC
	 bOTCblJcC5q0Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C3F2401F2;
	Wed,  6 May 2026 23:40:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 04FB1A00B0;
	Wed,  6 May 2026 23:40:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fQkUprFW;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00106.outbound.protection.outlook.com [40.93.10.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5099F40298;
	Wed,  6 May 2026 23:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuU6qF+J+Pbqs/0DRUvGh7nUaysC18jSm4RB0ljvTsI46d8SANGAoVcLS0Gie7xIv7oDxuwW+JV0f/+cMNQ3HKJnaOpQaDWZjRX83jrqDbOaerphlf63KlT9aX6TEhyoSPJX4X6EA5NwR9+7JMw/heKH5ncoZqBSef/eO1wZtdl+IGaS6gwZFLaoPcMHHPXZ7WDXAVvGSn168mvdsLMCu0QKVuWzJxH+CDcYylqOeWLqqYy0a43MT554MNP91ptKbIFAZ7du2ExfkZhTN6sNHM3qOrwpSubAKSxG08L8v2k29QmAhxFRC8YZO4wkZPVgs8D4kLiPP1SNDP217iH2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gMY/vuGF0z25XK4TwIK7NyJEsumsU2tszyGu6+5f7U=;
 b=t8JNleSf/PqcMMZRiv4vfuf+nAZzuCS5WdLnaeErOmdl3RBfdOteS0CU5nVcTaFYMT4QSmEvU56kITvcQ6ECdEHMo9P3umGrd524HSdompFDV6+42C4+pvTD40gA+mqINjTiuMi7gnlY86ZztC5dKn/y/y46zo/l8njtb8K2eF65EPkFNlvhK163cRZdMX6gm673cY43aNil4hzN/E7jUL96oR550zL5RntU5/N8oWrim2IynFG//xGuKKppvv0WA85xWWnxCNOeoS6oQL3LmA5SZWSYqn5Xu0UlwCH+4t+GCEda5coe45r0GhfErnDyagM4PeZGr4j6a9jSi6TTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gMY/vuGF0z25XK4TwIK7NyJEsumsU2tszyGu6+5f7U=;
 b=fQkUprFWRjGDMF3uizet026WGRO4xfG7Oa9c1FOr9wIxMXOGgsLkeAeWSKTiy7XHq+ZAvBu11M+QHO59TaCj0RzUkiRyGwGlbhCXRYayiqCP3fn5zAOodLasjhETmLfK5rz06wbFdlyNdt6tlz99tYyHOdrFxgKQ5xLiZCCOwlc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 23:40:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 23:40:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index: AQHc3GzqfUjaf13lmkyktxAm9F4Ko7YBqo4A
Date: Wed, 6 May 2026 23:40:24 +0000
Message-ID: <afpyvhadqZw0xfTB@vbox>
References:
 <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
In-Reply-To:
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB8798:EE_
x-ms-office365-filtering-correlation-id: 2b9f4486-1643-4174-7cfc-08deabc8d859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 W3TkQqiBlDszuyB13GanWcJhHAZiV9u/jcv13hn5lnzK45ZKRe6eNz1HTc+UiAu/JHtRt97DHvPFJeTktN5qmXnJqALTIa9zvcIGLVnJGbKWMLpOpwlXACX/+Pt0jYyqPhMPyGVZdfXgh37WvgEa24Lws+pzAM0XFLxfvBMXQ34GItYjrILu96l2YDw7MSZFFRnNZMegekktcGDKpuVgRfUcrXPtPbR4YUfRLlBnB0rY9dLiSiWA7R7fN1bumG1wzddX01rcZhed56cNX3Q2hvlzH7nFaNAO9FFJdvO+ZgxWRWpyjvrO3DmpN8XfZsMza9fGowAJERYnThr1IQrfrB3aebFZqY+wHzBlEXQKtTxs96FX7v8BzgV++FEVhCHiCFaf3gFHvboh2T5uzOKQIs91nmIxhyRmIH8g2MTkV28LMQnlCUTKfS12Yomo70U8UicVAVsJIgUMm9bseJsAxInGgcdY3qBzZ7t20J4khwUsGOkA7BfkweqtiFDM1hDBcRgkq/L/FAdEgNRWk8fvM1uFGkncy4Pm3ReLJwuAqA2VgfGwgNSl5aqJcAkLdCW/S6yDuk5r37+ogOKh9xlfTdwmcu8wTeoNLB4tWukh0FnWzcncBnOX8p1U6AnrZmTB07U56k6QfLIL89y1QRIy3j0c+ZCT4XMX67QhPn7IsWAp7Q4NNXT70pGtSDeB4TwBbourRtoL5LCdqCqDojh54gbD2dBqkn5IVz21FRb+CKxhQpi5n7i3KukZuUJiGvep
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkVVMi9FZHE1dzhucWFxVTFDYURRZlp2MEZubWoydUpXNTNPUjlGODJNK2wy?=
 =?utf-8?B?WGhWaEtWZ1lqRW04dVJZSjB4dFBvRjhnLzh4a2ZkSjZ0Zk00cWFETk5UU1FS?=
 =?utf-8?B?bEoxSHF0d1h2REkzajQ1MGZmZFU5UDhCeUlwaDhZdHo0V25tUTRQMU5qTlVK?=
 =?utf-8?B?U1FzOXQzZnJYY3RzNS9lN0RIRXdNV0VqSXc1dXhUM1hHeEsrV1RCV2dyYTVw?=
 =?utf-8?B?bzJKSUhmcWpwZkNlWGdWU3Z2bmNEL2pIRTRQR3ZSdXQ0a2dkek16TUlUTVZ0?=
 =?utf-8?B?MU5ITXNFbmptc25IUkw2QUxDdHY5VUlJMEtOd3F0WVl4SlB0VHdUcTZwQ0dm?=
 =?utf-8?B?SWdXaHJMWTJFK0poMFBZeGJGQmVPeGhyN2Y2dmVZaDZxYjdhclNCUzBvTzVM?=
 =?utf-8?B?aTZqa0lRSjQ3QXpDb3ltbXVMTkZnQWFiNmNDcWJ2QnBaOXlCWXJIL0VWUStG?=
 =?utf-8?B?cGk2Y1FvdTdORnAxWHYrWXhsNUk5S3BUNm56WVE5U2QyNW5jZEZIR1dPYzg4?=
 =?utf-8?B?eWg1ZVd5aWZwcVVoWXZRSXllZCtnQjlvdmlIZEppbEhIWjRCbFp3eDhiclg5?=
 =?utf-8?B?aEkrbVNNdkRRM29mTUF0MlpIRXkwYmdHNVJGZFJ2NEVSbFpaZ1gxZDVuM2Mx?=
 =?utf-8?B?bGxTSkRvVmM3Qk91cjljYUdyZ1FSenVIVVhPNW1kRlZldHVPeW00TDFuckdQ?=
 =?utf-8?B?Qk5IczF5QlU1OWxGV0dnZVNlKy9oSEkvVWlCZERQbHVXU3A5QUFMMUhrSXhu?=
 =?utf-8?B?dkRpdUIvejJmeXlZcklsQVAyUHk0MnBFbXdjUzBqb0h2U2xkL1Vsb2lQekNt?=
 =?utf-8?B?TUtNbElCVWw1UnliZHk0WnhXWmdzakNCdVc4NG5ZWEI5R1pVNnQxMXJRL0Fa?=
 =?utf-8?B?RmhTNnBlbDdwUFJ4dXhYbWU1TTI0Mm5iaGJyMDNvREVLbmp4cVRMazVxNk96?=
 =?utf-8?B?WERiMmllbzkvM0htbVNLWWlHek5yTFZyRnp2L0hVQXE3bzBQbDBKUWQreDRV?=
 =?utf-8?B?SklERWo5SmFwclpKcXFac2s3cGpRVTRsSVVheEhYeWtQRVlySEhYck15YXFs?=
 =?utf-8?B?MzN2eXRlNjJJMnZHZFg3Q0VHR0xIcnd6UmVlSVVXSVF3TzZrVzBHTTUveGRr?=
 =?utf-8?B?OTU2bGpmU3k1QjhjdnZwU3dwakIyWmcvakd1cE16ZUFjbmY5aGUzMUNzaFBw?=
 =?utf-8?B?dklzYVU2bml6azc3Y0hSMG9UdCtxVXNyWHdVOE80SHlTZWtkWWs1SElscVFv?=
 =?utf-8?B?V2RnSGZjQzdtTVlueVF1VEgrSEFjb0ZtcmFVcjdIK2FOaW0rMTVqVTBXNElQ?=
 =?utf-8?B?c1dad0h5M25aN0F3bFpaaWh2YktVcnNuQnN5ZHVsYXA0TlNkN2FFZC90UnhT?=
 =?utf-8?B?TTRhc3dWU0cvcDdwazd5a2t5RWFiak9WbDllc1RJbms5T1U2MngrRXdNTDlP?=
 =?utf-8?B?NXU3QVR4d3RCeDgrUFF4UzcvUzRBU1FhTEFPRUFuc0EySUVZOTVITDBhN1h2?=
 =?utf-8?B?anludnFTY2ZCRnVxNUYraDVNaWdVZ0xaTVNFcHdROW4yVitxZ0Fpbmk5UXJE?=
 =?utf-8?B?aEFBMCtWNWNMVW1QRWNvRzd2TzdKL2M3OWM3a01OSGwvUkpUdTZFaU84RS9K?=
 =?utf-8?B?Mk1vTlZZdlg3OWxwNkVBQktsdHQvM3BpVzVuZ2dieTY0R3ZSWUZSbGFFT1Vo?=
 =?utf-8?B?WmlSdlcxd0RQV2VxSDFVNDN4YWtnUXVEL3ZUSFlqa2xFYnVkZHhFaFhBanZO?=
 =?utf-8?B?VVdkYUlGZVR0SGRlZWU1dzNVYVAvWkRIdUgrZTN6Z2RDT1lVMTc2ZUVDSi9B?=
 =?utf-8?B?NW1CemZuL3dPc0FJblBxQU9wSy9VaktkaEF1Vk9pU1BwTTU1U3NNNytad1dw?=
 =?utf-8?B?ZW9SZW9Rcm1zV0NxS0ZNajh5VEF0UUZEQ2NrS3VjakF2ZEpyWU9LMVdBWW1x?=
 =?utf-8?B?cW9IVy9LSktNV1Zqem9wOFdUZWUxMEpuVU9RSGxiUHlHV3p2dEU1V2VUUGNu?=
 =?utf-8?B?dmljOUxFbFZQQlJNY0VDUHpSNmpNZnR5bjJnNUs4ZWd5dUhiS0lMb1Jick5C?=
 =?utf-8?B?TWRyaVZMOUl6MVF6eCtzSVVrTkpobW10S1Q3dVpxWTgweGkzM3hPVWNoMGdO?=
 =?utf-8?B?eW9sN1dvaXZWeGYvcmw4a2RPbHB5RElPcHk5Skh2RCtEOHVpUXpFWFVZMjRG?=
 =?utf-8?B?cmlVSmhHZ3REV0RJRmVyNU5DSGdaSnZBN2xOODJOUGZzbVNhQXc5Rmg5dWxX?=
 =?utf-8?B?eDFIU3phdlJxOVBhRlZNaTdaeXY5UWw1b0xaZCtIMG5WQTZ4a0RhdWlpM2JU?=
 =?utf-8?B?Z0hHUnlTQ1FUV3JtQ3kvSG9JSHRES3l6QUYyMHNZQ0l3M1dYb0ZWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0EEC582D96A14DBCE60FBF3A1FBDE7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rqFcSb6MzrI2xLjo4M30I6J02Td9JUZRnwd/SpPrCGi5SondNaQXQZsxpoEkSJJSAZlZezmeg4Lwd/rlwoCZU/oRm2ICBPwkmZQKnKw2tqJ27kd2YxDBlVla7iQ+/AMPPzqLzKiayoroC4mafy5uJLMlzpYbCI0TwPs0wYq+UOWUK9v3gFHEu2n/3XRlI2J2gNU/0j4xq0soucor0oi/RIOTsvxkxTvw/NnM4jMZcZXLhYMFsP9FDh4wPAD8P50zZqoBi0/KjaFDeVLAqBFkzo53/e8T4kizPz2IeMX44cf/hjs2UOxP44y3kGpwRH+6E2vTFA1+ePej3X48gzn5lg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T/rormWqc1cDDGeooxMQTtOJirCltML5oNJk0mu3xbgnqnlUK5FiqP/Ln7/lQ4pc77kvuHN9wZG9KijSSsgZC1lciGNrd8a9iVcDniXRW+Lhj8FiNzrTRwCZcNH6gOVWz2aNPnO/7qs4DgOez6YUdbeUzPekCcCFs3FXiseUuX2UzFtrBTIvC1zcsx+1IMJW2fRRrZwnzivmyagGEN8Xfw90XXcDAo2mtd3pjw7rreM5cc768vI6LdWrMdujoak8D4GereGSP7KdfifkKkA6549B/XgvOk+8fV/nz8TxyM2cVpORDRYOWY1OgJqI99pGi5PUu6NDgvx8wOUUXLfNS3erNpp6uBgNpN0xWbLZw/yJXFJxqGn/Xf/+09xAC9p+SudSYDcOv2Si0QfNHgi6CHOkwCht/PSdu+NDMYtPVyHb+Tl9Bban9VecbTmnV+ESKmKkwRT1Lu7BwuP/xLzntRExu22emW+LDE9oPyHYc8zcpQER7ON111qH6DKqayPATTqgdM/cECCr9J/srPVTrpIsQgbH0u5tc+M1CkB0blFynuQf/qh5GkiJiPhHUFmYFTU0p+W+hp44ZsWN8WoU07SziPQyAjvlCW2f6pYw0uNKgL1PLn+aAJ0p8mMh5DndXnm5xxy2m3JzlVnEsn+qiQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9f4486-1643-4174-7cfc-08deabc8d859
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 23:40:24.4100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdjvyVwWSvSjTCCyJVXsohNVvDM8wexbwNytzeZ80huCrqLlfWu03oSzbhXso39mup/qjm5iPvuE4pOuH7LGiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798
X-Authority-Analysis: v=2.4 cv=CuCPtH4D c=1 sm=1 tr=0 ts=69fbd171 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=LAcRD_A3MIUKMeka0OAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VJOuJ0a3OBLUtAyoNbkPHwYGrzR-fV8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDIzMiBTYWx0ZWRfX1cq6mboOY6mi
 PYRI7Imu8KLCYaLVvyqWMHyY7g+QiqtnmGVwcRiTecbGSN+XHdXTetazEUgXvkqxx+PZg5+eb1H
 cTcphKlJkz7xWXxDrb93Mhxnp2WI+8qfxfjWA1o9Y16oXRU/WqK82CKB6/YPXtLcbOUIocn5Hmg
 Ecb6Gvz8yACw2dJcU2FfgF6G15+crN6NdmU7RZDZ/pj/+IClDrMBEkQvvUcg51+Pi64JbJugVU0
 O9AEQKU9vfzcIyDDutYHpR/0I6TUXhwlGU+I8hgGdgBCy98GmczamzF2IXqlluaQIvzS3jE0Vkb
 BSLvXZb4pvrKFHw/JGEhY8MPWB+1oBdYcEtk0M0p1apWsGKiPkiGCDhww0ykvJDiK7Pr+To81yc
 R4SEgdD/ov/IAMiP1mhddTKcHcDo1kyBdivYeimHVZEP8vDpxpQtfTa/etFWXONxym0VV34myxK
 E9zMdi/GZefxiFACw0Q==
X-Proofpoint-ORIG-GUID: VJOuJ0a3OBLUtAyoNbkPHwYGrzR-fV8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605060232
X-Rspamd-Queue-Id: 80CB54E18A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37045-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVHVlLCBNYXkgMDUsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEgY29u
bmVjdGlvbiBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+IA0KPiBBZGQgdGhlIGxvZ2ljIHRvIGhh
bmRsZSB0aGF0IGZvciBEV0MzIGNvbnRyb2xsZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29u
cmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTIgKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaCB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9o
b3N0LmMgfCAxMiArKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNjUyMTM4OTZkZTk5Li43Y2VjNDkxMWUyNzggMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jDQo+IEBAIC0xNjIsNiArMTYyLDE4IEBAIHZvaWQgZHdjM19zZXRfcHJ0Y2Fw
KHN0cnVjdCBkd2MzICpkd2MsIHUzMiBtb2RlLCBib29sIGlnbm9yZV9zdXNwaHkpDQo+ICB9DQo+
ICBFWFBPUlRfU1lNQk9MX0dQTChkd2MzX3NldF9wcnRjYXApOw0KPiAgDQo+ICtlbnVtIHVzYl9s
aW5rX3R1bm5lbF9tb2RlIGR3YzNfbGlua190dW5uZWxfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1
OCBwb3J0KQ0KPiArew0KPiArCS8qIFByaW9yIHZlcnNpb25zIGhhZCBubyBDSU8gc3VwcG9ydCAq
Lw0KPiArCWlmICghRFdDM19WRVJfSVNfV0lUSElOKERXQzMxLCAxOTFBLCBBTlkpKQ0KPiArCQly
ZXR1cm4gVVNCX0xJTktfTkFUSVZFOw0KPiArDQo+ICsJaWYgKGR3YzNfcmVhZGwoZHdjLCBEV0Mz
X0NJT0NUUkwocG9ydCkpICYgRFdDM19DSU9DVFJMX0NJT19FTikNCg0KVGhlIENJTyByZWdpc3Rl
ciBibG9jayBvbmx5IGV4aXN0cyBpZiBEV0MxX1VTQjMxX0VOX0NJTyBpcyBzZXQgKGFuZA0KRFdD
X1VTQjMxX0VOX1VTQjJfT05MWSBpcyBub3Qgc2V0KS4gSW4gbW9zdCBjYXNlcywgdGhpcyByZWdp
c3RlciBibG9jaw0Kd2lsbCBiZSByZXNlcnZlZCwgcmVnaXN0ZXIgcmVhZCBvZiByZXNlcnZlZCBi
bG9jayBzaG91bGQgYmUgMC4gQnV0IHdlDQpjYW4ndCBndWFyYW50ZWUgdGhhdCBpdCB3aWxsIGFs
d2F5cyBiZSB0aGUgY2FzZS4NCg0KPiArCQlyZXR1cm4gVVNCX0xJTktfVFVOTkVMRUQ7DQo+ICsN
Cj4gKwlyZXR1cm4gVVNCX0xJTktfTkFUSVZFOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBf
X2R3YzNfc2V0X21vZGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgew0KPiAgCXN0cnVj
dCBkd2MzICpkd2MgPSB3b3JrX3RvX2R3Yyh3b3JrKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggZTBkZWU5
ZDI4NzQwLi45NTk0ODI5ZGU2YzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0xNzksNiArMTc5LDEx
IEBADQo+ICAjZGVmaW5lIERXQzNfT0VWVEVOCQkweGNjMEMNCj4gICNkZWZpbmUgRFdDM19PU1RT
CQkweGNjMTANCj4gIA0KPiArLyogQ0lPIHJlZ3MgKi8NCj4gKyNkZWZpbmUgRFdDM19DSU9fQkFT
RShuKQkoMHhjZDIwICsgKChuKSAqIDB4MzApKQ0KPiArI2RlZmluZSBEV0MzX0NJT0NUUkwobikJ
CShEV0MzX0NJT19CQVNFKG4pICsgMHgwMCkNCj4gKyNkZWZpbmUgRFdDM19DSU9DVFJMX0NJT19F
TglCSVQoMCkNCj4gKw0KPiAgI2RlZmluZSBEV0MzX0xMVUNUTChuKQkJKDB4ZDAyNCArICgobikg
KiAweDgwKSkNCj4gIA0KPiAgLyogQml0IGZpZWxkcyAqLw0KPiBAQCAtMTMwOSw2ICsxMzE0LDcg
QEAgc3RydWN0IGR3YzMgew0KPiAgI2RlZmluZSBEV0MzMV9SRVZJU0lPTl8xNzBBCTB4MzEzNzMw
MmENCj4gICNkZWZpbmUgRFdDMzFfUkVWSVNJT05fMTgwQQkweDMxMzgzMDJhDQo+ICAjZGVmaW5l
IERXQzMxX1JFVklTSU9OXzE5MEEJMHgzMTM5MzAyYQ0KPiArI2RlZmluZSBEV0MzMV9SRVZJU0lP
Tl8xOTFBCTB4MzEzOTMxMmENCj4gICNkZWZpbmUgRFdDMzFfUkVWSVNJT05fMjAwQQkweDMyMzAz
MDJhDQo+ICANCj4gICNkZWZpbmUgRFdDMzJfUkVWSVNJT05fQU5ZCTB4MA0KPiBAQCAtMTY1Mywx
MSArMTY1OSwyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHdjM19wcmVfcnVuX3N0b3Aoc3RydWN0
IGR3YzMgKmR3YywgYm9vbCBpc19vbikNCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdD
M19IT1NUKSB8fCBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19EVUFMX1JPTEUpDQo+ICBpbnQg
ZHdjM19ob3N0X2luaXQoc3RydWN0IGR3YzMgKmR3Yyk7DQo+ICB2b2lkIGR3YzNfaG9zdF9leGl0
KHN0cnVjdCBkd2MzICpkd2MpOw0KPiArDQo+ICsvKioNCj4gKyAqIGR3YzNfbGlua190dW5uZWxf
bW9kZSAtIENoZWNrIHdoZXRoZXIgdGhlIGxpbmsgaXMgdHVubmVsZWQgb3ZlciBUQlQvVVNCNA0K
PiArICogQGR3YzogUG9pbnRlciB0byBEV0MzIGNvbnRyb2xsZXIgY29udGV4dA0KPiArICogQHBv
cnQ6IDAtYmFzZWQgcG9ydCBpbmRleA0KPiArICoNCj4gKyAqIFJldHVybnM6IFVTQl9MSU5LX1RV
Tk5FTEVEIGlmIHR1bm5lbGVkLCBVU0JfTElOS19OQVRJVkUgaWYgbm90LCBvcg0KPiArICogICAg
ICAgICAgd2hlbiB0aGUgY29udHJvbGxlciBkb2VzIG5vdCBoYXZlIFVTQjQgY2FwYWJpbGl0aWVz
Lg0KPiArICovDQo+ICtlbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIGR3YzNfbGlua190dW5uZWxf
bW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1OCBwb3J0KTsNCj4gICNlbHNlDQo+ICBzdGF0aWMgaW5s
aW5lIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgeyByZXR1cm4gMDsg
fQ0KPiAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfaG9zdF9leGl0KHN0cnVjdCBkd2MzICpkd2Mp
DQo+ICB7IH0NCj4gK3N0YXRpYyBpbmxpbmUgZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSBkd2Mz
X2xpbmtfdHVubmVsX21vZGUoc3RydWN0IGR3YzMgKmR3YywgdTggcG9ydCkNCj4gK3sgcmV0dXJu
IFVTQl9MSU5LX1VOS05PV047IH0NCj4gICNlbmRpZg0KPiAgDQo+ICAjaWYgSVNfRU5BQkxFRChD
T05GSUdfVVNCX0RXQzNfR0FER0VUKSB8fCBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19EVUFM
X1JPTEUpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvaG9zdC5jDQo+IGluZGV4IDk2YjU4OGJkMDhjZC4uZWIwM2IwNzk2OTZlIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2hvc3QuYw0KPiBAQCAtNzcsOCArNzcsMjAgQEAgc3RhdGljIHZvaWQgZHdjM194aGNpX3Bs
YXRfc3RhcnQoc3RydWN0IHVzYl9oY2QgKmhjZCkNCj4gIAlkd2MzX2VuYWJsZV9zdXNwaHkoZHdj
LCB0cnVlKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGVudW0gdXNiX2xpbmtfdHVubmVsX21vZGUg
ZHdjM194aGNpX3R1bm5lbF9tb2RlKHN0cnVjdCB1c2JfaGNkICpoY2QsIGludCBwb3J0bnVtKQ0K
PiArew0KPiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+ICsJc3RydWN0IGR3YzMg
KmR3YzsNCj4gKw0KPiArCXBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoaGNkLT5zZWxmLmNvbnRy
b2xsZXIpOw0KPiArCWR3YyA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsNCj4g
Kw0KPiArCXJldHVybiBkd2MzX2xpbmtfdHVubmVsX21vZGUoZHdjLCBwb3J0bnVtKTsNCj4gK30N
Cj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB4aGNpX3BsYXRfcHJpdiBkd2MzX3hoY2lfcGxh
dF9xdWlyayA9IHsNCj4gIAkucGxhdF9zdGFydCA9IGR3YzNfeGhjaV9wbGF0X3N0YXJ0LA0KPiAr
CS50dW5uZWxfbW9kZSA9IGR3YzNfeGhjaV90dW5uZWxfbW9kZSwNCj4gIH07DQo+ICANCj4gIHN0
YXRpYyB2b2lkIGR3YzNfaG9zdF9maWxsX3hoY2lfaXJxX3JlcyhzdHJ1Y3QgZHdjMyAqZHdjLA0K
PiANCj4gLS0gDQo+IDIuNTQuMA0KPiANCg0KV2Ugc2hvdWxkbid0IG5lZWQgdG8gYmUgZG9pbmcg
dGhpcy4gVGhpcyBzaG91bGQgYmUgY2hlY2tlZCBmcm9tIHRoZQ0KeEhDSSBkcml2ZXIuIENoZWNr
IHhIQ0kgc3BlYyBmb3IgUE9SVFNDLlRNIGFuZCBVU0IzIHR1bm5lbGluZyBzdXBwb3J0DQpjYXBh
YmlsaXR5IChzZWN0aW9uIDcuMTEpLg0KDQpTZWUgeGhjaSBzcGVjIHIyLjA6DQpodHRwczovL3d3
dy5pbnRlbC5jb20vY29udGVudC93d3cvdXMvZW4vY29udGVudC1kZXRhaWxzLzg2ODI5Ni9leHRl
bnNpYmxlLWhvc3QtY29udHJvbGxlci1pbnRlcmZhY2UtZm9yLXVuaXZlcnNhbC1zZXJpYWwtYnVz
LXhoY2ktcmVxdWlyZW1lbnRzLXNwZWNpZmljYXRpb24tcjItMC5odG1sDQoNCkJSLA0KVGhpbmg=

