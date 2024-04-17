Return-Path: <linux-usb+bounces-9436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E68638A8D87
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 23:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CED12830AE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 21:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF334CE0E;
	Wed, 17 Apr 2024 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dsSx8O5L";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hbdOblDd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OyYUkR6K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8837163
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713388236; cv=fail; b=dCheP9IHVUo2VMpteFaJlYbmO6zvpzA4zhACQ8KnhF48AwljyoFDDZM1YI+iraeMMaDuiecPz5wDhH70NitaYbVlt28/241ktJ6kRHnOYkClY78PATlX+1wkp598BfYzTyPD703tvrCxuZc2izCYxIOl3Wkaxkerv7W1qnillCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713388236; c=relaxed/simple;
	bh=AvilWID5xL+YqEpVC30VIUOCOuAxg17V4HvAmhOSDlw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oHkfDeURQCyBeUzSzbCK8kWvAl+1v6JSYiXxiwvVmmxfbJKfqTkefB5cH8hN6qyrtss9BO6bMRwqxXcceqFDYQU7DHfuQufW4LKXVkTt6T5CK3NLF4YOLLRtJR/jV8CLJKLVNvU1nfLF8i8ptj1cADoeBM54YVzGTJCIzRw0KBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dsSx8O5L; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hbdOblDd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OyYUkR6K reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43HG6Ucg004328;
	Wed, 17 Apr 2024 14:10:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=AvilWID5xL+YqEpVC30VIUOCOuAxg17V4HvAmhOSDlw=; b=
	dsSx8O5LxZEY7zjRMTSC1M7UuIy4uZ11Raymoi3EOtP59GVR+KfbONOHITS9fJfM
	NxrhgLocl3vpU58btAjDa9vLmYQTDXV1CizioUWyVyV4cb7SYjg7VQu+WaLyqKTU
	zJ82nKPITCFx6YacHAv+Sdn8ALfKdyUXcPpPfHpp7hJOm5wMDL5ZdSzlF/6VIo7q
	N8U2XEIbrCyWz1Rn2ffA8ePZLeDaAX8lUCI6tWVjoFiM2AIRgzeHIs1mSIxJfHU/
	qKujorKmMSOr54RR2JQVPuI4uWRTCRsGToWeoxBfXFEDj15tKiK+w6nM6fqw1lKQ
	kbEcrKGQP5oVyDeuv/nuWQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3xjgkt9tqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1713388213; bh=AvilWID5xL+YqEpVC30VIUOCOuAxg17V4HvAmhOSDlw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hbdOblDd63ZS9+SvW04FH9p2IEQApSRX3bQAvlENebiXtoB6AKZS42Ha0j9iO7ORR
	 r5/5foUh1+rzNJFax1Tqg77jE4HePKkJ6+lyseqmJKCdpyv9D+HQzdouOLy7wwfIla
	 uQJQEAwrvxxM+N2GgzWWJR4nWC06bJpiyYNPc+nWS9n4FtSTNLF8zj/qYtO3BFPhOE
	 kfF29PhCrGTRBLg6r+TN84foxCcM980QGoevBloyyu9cV2RLD8C1tUpnbsLF8ZKDnY
	 xBFgb/Q7Lo+LsL7jnqtrQvWrjjXmTXQhAUjkgHboXbf1dqZjdVb0aEvoPZp9HF+ZM3
	 yR+mJNM+KtjeQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EEC824048E;
	Wed, 17 Apr 2024 21:10:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 82F48A006D;
	Wed, 17 Apr 2024 21:10:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OyYUkR6K;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id ECA4C404D6;
	Wed, 17 Apr 2024 21:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/3qJq42sc3tW4MuDqv/ExICZeLhqTBK3I534QO1oWzyK89S0gOSB5F/+8o6n+6ALJsnUgzWjB70/CKFcLUji0QdgDoUO7OgK68BQdxpIFN9HYC99jCXoQ+HE/4/Z3Ajs55UTF/NDsxksVApHhzSXN9nD8kHdiIPS+PNy6ja/pGU+qvSn8TdtmSX47QIn/8xCIBL9vCqWZWq0VLHPQlBeOEWHcoIXsPux3VVZ0iMyB9blwBeFM8J4xa9Tc+ij4PSGPb8rwnDIo/d07qYZyyk0J0CpxRayMM+8tJakjwIARZ4l/lo8tU1oa2JmWr4pK2NlUYrDv8s7F6Ox2/hOz8YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvilWID5xL+YqEpVC30VIUOCOuAxg17V4HvAmhOSDlw=;
 b=GYmpijvNg9pDYSAl7UB6fgs2SPEtxG8jNsRcu//af6XmKiY8ORjWxnKnxBlPTPMSv9mM//uFg9hC9d9nEh8p2UXUWf5BdeY3MtZhzASmWpRhrPa6sgeZE4CQjfOABxhjv8WDUX1OAFZSMnTLVXGfPe5mdU0GDBCKM/i0A70bsdc/z+G7ePrGNJWy8fm9jk5nDF65O/3Z3wpCR8OuxPfTZYl5Qggo0y7SdRZaTV3Y0juFrMiq07jRtRK1ZTkIUfCSkGuj6YBc/UVToIa31phOaGv/whKfo3ISUuOxvJ1TBu6BxMw3gJAL2kvXxph92Q5laDtcphC70XZQhz+9hfh5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvilWID5xL+YqEpVC30VIUOCOuAxg17V4HvAmhOSDlw=;
 b=OyYUkR6KigzdQQl4A9rkkrfRkp4Eg1uwWiISUisfpdDzP8ArAnhaBE7v/oMMqvBqN+c0QNaDJqB1CruPzAYwZIal8eVidpLqux59k175+u07xURC7hi7xeRXNnwSUYC9XjmvVeTNWntALH2G4VkPhbJIQD0uZntZC0cLYtcB35c=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Wed, 17 Apr 2024 21:10:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d%7]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 21:10:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Manan Aurora <maurora@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Topic: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Index: AQHaWvbI0vndRAl0XEWVNoceMCPwlLFhevoAgAEbnQCACi4HAIAAnLGA
Date: Wed, 17 Apr 2024 21:10:07 +0000
Message-ID: <20240417211005.5sqwloxve4exurtb@synopsys.com>
References: 
 <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
 <CAJnM4-xYjmYUa4ePaYG3P8O3CYCWOMJwF=e7D1Pv8vvk6pBtNw@mail.gmail.com>
 <20240411002156.tlyqofiw7erfq7eo@synopsys.com>
 <CAJnM4-zq47f_1NWAfoKpm1Z56UTKjcCrMrjVunMC-3JO=cnLyw@mail.gmail.com>
In-Reply-To: 
 <CAJnM4-zq47f_1NWAfoKpm1Z56UTKjcCrMrjVunMC-3JO=cnLyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6416:EE_
x-ms-office365-filtering-correlation-id: 6288a333-463f-4e5c-1b05-08dc5f22c2b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KOUyhjA9WMylhDwKJzJGHo9dG+IBT3R9jVjoDQawx73soS6dvoy97Nq/9xPPQXwqU1O6yCBFmzp1+rt3P6INzh9tZBCfYr121U4Yf1zp2isDYen6GXqA6Myntly08CFfxFrRry787+OeBmDBShqN60BYTdAYP2Bi0U9yBD7XVwC5lWALdUH/iaMf1NlaZaRL/2t84vMd0TpdO5LYcQkEi3bO24Q/oVKzxMV2jKCwl53paGUydmH/m2naEkQIhmPCin0XbXm5uCcWapyng2UKmqWbO2cxBJ/ZdEnPI8De1WXKx+vDwA5Zv6N7NlGRPrzV9CyXZYht2mMLOm9N1Of2r5TBWuyUZ8L5OdOC+2LkuZ4VWL17PaoeD72wfvOjtvQUlBDI/YEq/3w19CIy5tD1wYXi1COWcBskDj0dHO3oFPVYeVPQxr79iaWNOO9WOaMWmVHkeMveR7VMA0EuhkHTT0qcOmMPUfqpuNAa3HvTE+v1sp+ysbWeprBmMyG0ZYmdhJcaQaUn4vEQy89iIjHqbF7MXFSF6VZ5CJAHIgU1rb4URzOOy30CBks6tSPJY6XXEXZuX0qBYyaNxRkCJLCEZaFXjfsRyHE6xM1Gdbz67P7mmZ+55EXWG/phslOhoYqRcPnJdhvJ8IZ2YyrImHM6IdjzOoX9iI0vagVbjmjh27Vq9TaFH5r+zvR1h7lG807Am0NytS0/SfflSuv5gHNSCZiksSBorc7dOpP0TEw3MsY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alNQbTVsSVNOb1h0L3orbUdRR3FjUFNuSDFSM1NCd3NPL0JJWWU5TEtVS250?=
 =?utf-8?B?bVZMdVZBalBVTTRSMFFEL1hIb0FlYmVwU0dmMmt6b2I2VllBYW1WQ0lHcEJ4?=
 =?utf-8?B?d1RqS0phcnA2RWI5RENMYlp4VnBpMExCRE14dFZ0aFlLTzN4VlMySWdhMVJT?=
 =?utf-8?B?T0NBSGMzMEM1ZktiYUpPR1Q1QzNiUjlVNi9kNWhnN1E5ZGxGSUltZHNLNW9E?=
 =?utf-8?B?dzlZakplaytlNW9jSFBSblRETC9laTRBbnQ5VUUrQWpNM2NibXlMelR1RkhX?=
 =?utf-8?B?b1lzblhXT0N2bzV5dkZxd2FNOVQwZFc1YU42L1Q0clhUR1lYK1JzWHh6SWNP?=
 =?utf-8?B?cGJGQjZjK0dNWG1HMjV1RkV3RVRhUlZzaEVBRkczdSttMjVDNm8vVUp4RjNa?=
 =?utf-8?B?QU8vQ2IvRTRkQWRxWEN3MHVuZ3VaZGM0WnJiaHVqbXdxeUVUeGhPSnY0VkN4?=
 =?utf-8?B?Z2x4ZVk0YndieUFveDNVOUorS1UzOFBvVWdDN0RDVFFQZHV6bUNlR1BuVGVJ?=
 =?utf-8?B?ZU1jREF1M1VZYWZtVVBPaXJrTk9BY3l3eDlQU1JhV1RVZ2FmUjljWjRpWEhV?=
 =?utf-8?B?NUNJaE5EZ3A5NnVjRCtZVUx2Y1E0NnlpY0lVSjdra01WWldGSWFZdU9Rc1JY?=
 =?utf-8?B?eC9XUjQ0OGNrOXRIWTEyQjBYV2J3ZDJ3bi9mQlptd25tM2xKRStHRmF2Nkhx?=
 =?utf-8?B?bWFncUwxeDZIczhWUy9ralp5Vm5PbU9HcHZqZ0VFMktISGM2YWFtTmlpaENi?=
 =?utf-8?B?UnU3OGxUR1dVRktINk9wZklycHRnelZhSG5uR1NPNVN0bkc2RmcwelF5T1d5?=
 =?utf-8?B?azN5MlhET0JNN1lPaWVSZEkzTGdtNDk5Vyt2bnRuVHdOeVlNZi94OUVPanJN?=
 =?utf-8?B?M2JyU2xoVE5oSjBWcjlvTEtMckgvVGNFZ1UyNGQwT0NRcDNLaUNBSWZnZGR2?=
 =?utf-8?B?Mmh6eXFRUkIyNGR1WWROL3BCVjQySklZbVJQWHdITkhVN2ErWUNrS1ljL1FU?=
 =?utf-8?B?dnhXaHNNL1gvTHZJQU90aGlzVmJNQkpyOU4yWFJDZjFwd3hDdXh6bVJPeFRN?=
 =?utf-8?B?cUVvM3NSc20yVTdNSUdIMnJaVjNNTytGTjhwY1ZtNHV6eGdJZjVzdXkxcVRi?=
 =?utf-8?B?RjRURllOZzBScHZBS0YyUUNvcy9uQVhLVktKYytqRDZNTHZiRFZwZmNpQisw?=
 =?utf-8?B?MFBvbWxEaUQ0S2ZEYjgyMWhKdE1TTDhNNUdQU3ZISUJ2Y1hWbEdnSDJtT0g4?=
 =?utf-8?B?MXB0SkNQYmNZaU5wUTM3R2VQSGFkZXhuK3AvWERGSU5FVTFlNEhiR1FSWHA3?=
 =?utf-8?B?NDFYU25FRWRLTGZ2OW95dWc1M1dBQ25wb1VvaitHOW4wRG1XMGRCQzE4Y29h?=
 =?utf-8?B?SGdLWFFhVXhuVDVTcWtBVU5KUFRyZzhLdWo2a2w3ZEhkNjF0STRoTUtrS3I3?=
 =?utf-8?B?Z1NWTFAwSDlmYUU1TUptS2dzZ1hjU00vbkhaOVF3ZHlkSFlDRmJFN0R3WDVo?=
 =?utf-8?B?a1JkTGtzMTEzNDlWOVEyU1J0QS9mOXUyQUowQ2hzQXQ1RGxDR0RicUlmVDFj?=
 =?utf-8?B?SjFBaWh6S0FRLzY2NzNzMUt1Mis1MEdtSzNpY3N6OW5BTFRZVUpvMHo3U0Ez?=
 =?utf-8?B?ZUJJYVloVVJvYngwelB1K2pVcWFNMjBKZWlXR0hpTjcrQTZucnovU0hveEhC?=
 =?utf-8?B?YjR5UkR2MmhVUmFsYW11Y24zb0h4THkzUGhVdjdEeFFrWkxxekpqeitleHh6?=
 =?utf-8?B?aEhsVE5yd3BqVFY5QkVGamVGaHdMd3NwQjRJZWZMa2treXBPOTlFV0xiSTBn?=
 =?utf-8?B?Und3Q1YzaC9HRTByNUROak9ocFNuV25IaHE0YTdFcnpMRUYxbkp3dEJlVk1a?=
 =?utf-8?B?akJpSTd2QTA2ZWExdXNKQTh3WEJqWVlpR0NIZlZNUFBJRG9yWUxPRTJYMWpH?=
 =?utf-8?B?QmRLRTcxUUl3dm1jclpOakVESEVWV1Voa2Q3L3prRVhRTGRNV2x4RFVRWGsw?=
 =?utf-8?B?VEpRaG5vbERrSEZhY1JrMlNzU3hxUjhmOUZldXUxVHp1WFBxTnoxaXdWRXRu?=
 =?utf-8?B?bk9sZnF5MzdhallrTm52UXRFYndzVWJTTkl6YTd4TnZYRFhKanplZ3ZkRVZN?=
 =?utf-8?Q?p4HzCuAxPfwCb/ldtrVoPJrZW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D41DFF04DE3454AB3D9E55B483378CA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qHI7X9dUNTj7NFLmxTHOdct6WZ1/F3qg2QsKnzPYIz72YR5PzpeN8wVTlOwafgL6FYhMUYkAVOy91T45266tXcq27WOlB3H08Xymx7s0x+hGO2omkvs7vEJnEvguIuZBP8yTwQ40C+9+rKEWf+4vlklBpO4mweWm5J/QXwvHxmOLgTAJShTXe6vhCkWMEYttbs7r5Y68AogyVWZvwVCX8a83eaMcrDpbOikUvW6PZb6lsX92D9kDntjOf/ME4zTAEh8Pdex9ilOZZygJ4oxgU7miP95OyYAugup9zNCsWyELpnCpmtz3nd0fGpss7eD1/BOXzLkQSEjvwa0IMFwBewS62M+77HHRNfe0OOjRJjYBduWkNHonDlE8gcO1VUTIpzY3hDPgF2Q9es76swNCfWOMQzzyIlaL3ZHlulNw8+dB8+fGlbbmWH4iS9deIMlZHWJh1x+aXOuNehKTXGdLOu8YPECe4egyl7P3jIhFL8HHX/TakUZA4WpzGOFoRkofDlHKh438M2zCGU8q2A5OFZ48uu40VYhPqGlOk8uAzrZlM8/73FEmlhMlUSwdrs82GnWLOCrZM7UTzH8LjsE8mfFdZi2Dp3AJAJIXelmgwq2fU1QvV2gN4Kpf74bJjYl7g9NkemujH8PZjHwyQAbJWg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6288a333-463f-4e5c-1b05-08dc5f22c2b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 21:10:07.9199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gm/pfCphU6Xv0S2bxZzh/5OCt32LxaJ1RNXzTdL03Cve2XbMGo/QJWfG34UfJUzdLqNV6SHQJAfpARbsIPXvkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
X-Proofpoint-ORIG-GUID: Td1PlKkNXS9fU3Ds5voYjvormsVpc1TW
X-Proofpoint-GUID: Td1PlKkNXS9fU3Ds5voYjvormsVpc1TW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_18,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404170150

T24gV2VkLCBBcHIgMTcsIDIwMjQsIE1hbmFuIEF1cm9yYSB3cm90ZToNCj4gT24gVGh1LCBBcHIg
MTEsIDIwMjQgYXQgNTo1MuKAr0FNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lz
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIFdlZCwgQXByIDEwLCAyMDI0LCBNYW5hbiBB
dXJvcmEgd3JvdGU6DQo+ID4gPiBIaSBUaGluaCwNCj4gPiA+DQo+ID4gPiBJJ20gd29ya2luZyBv
biBhIHBhdGNoIHRvIGJyaW5nIEVCQyBzdXBwb3J0IGJhY2ssIEkgaGFkIGEgZG91YnQNCj4gPiA+
IHJlZ2FyZGluZyBzb21lIG9mIHRoZSByZXF1aXJlZCBjb3JyZWN0aW9ucyB0aG91Z2ggKGlubGlu
ZWQpDQo+ID4gPg0KPiA+ID4gUGxlYXNlIHRha2UgYSBsb29rIGFuZCBhZHZpc2UsIEknbGwgcHJv
Y2VlZCBhY2NvcmRpbmdseS4NCj4gPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBPbiBGcmksIEZlYiA5
LCAyMDI0IGF0IDY6NTXigK9BTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDM5OGFhOWE3
ZTc3Y2YyM2MyYTZmODgyZGRkM2RjZDk2ZjIxNzcxZGMuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSB1
cGRhdGUgdG8gdGhlIGdhZGdldCBBUEkgdG8gc3VwcG9ydCBFQkMgZmVhdHVyZSBpcyBpbmNvbXBs
ZXRlLiBJdCdzDQo+ID4gPiA+IG1pc3NpbmcgYXQgbGVhc3QgdGhlIGZvbGxvd2luZzoNCj4gPiA+
ID4gICogTmV3IHVzYWdlIGRvY3VtZW50YXRpb24NCj4gPiA+IEkgd2lsbCBhZGRyZXNzIHRoaXMN
Cj4gPiA+ID4gICogR2FkZ2V0IGNhcGFiaWxpdHkgY2hlY2sNCj4gPiA+ID4gICogQ29uZGl0aW9u
IGZvciB0aGUgdXNlciB0byBjaGVjayBob3cgbWFueSBhbmQgd2hpY2ggZW5kcG9pbnRzIGNhbiBi
ZQ0KPiA+ID4gPiAgICB1c2VkIGFzICJmaWZvX21vZGUiDQo+ID4NCj4gPiA+IFRoZSBlYXNpZXN0
IG9wdGlvbiBzZWVtcyB0byBiZSB0byBhZGQgYSBuZXcgZnVuY3Rpb24gdGhhdCBsZXRzIHVzZXJz
DQo+ID4gPiBzcGVjaWZpY2FsbHkgcmVxdWVzdA0KPiA+ID4gZmlmb19tb2RlIGVuZHBvaW50cyBl
ZzogdXNiX2ZpZm9fbW9kZV9lcF9hdXRvY29uZmlnX3NzDQo+ID4gPiBUaGlzIGZ1bmN0aW9uIHdp
bGwgY292ZXIgZW5zdXJpbmcgdGhhdCB0aGUgZGV2aWNlIHN1cHBvcnRzDQo+ID4gPiBmaWZvX2Vu
ZHBvaW50cyBhbmQgcmV0dXJuaW5nIGEgc3VpdGFibGUNCj4gPiA+IGVuZHBvaW50IChpZiBhdmFp
bGFibGUpIGFuZCBOVUxMIG90aGVyd2lzZS4gVGhpcyBjYW4gYmUgaW5kaWNhdGVkIGJ5DQo+ID4g
PiBhZGRpbmcgYSBuZXcgYml0IHRvDQo+ID4gPiB0aGUgZXhpc3RpbmcgZXBfY2FwcyAgc3RydWN0
dXJlLg0KPiA+ID4gRG9lcyB0aGlzIHNlZW0gbGlrZSBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uPw0K
PiA+DQo+ID4gVGhhdCBzb3VuZHMgZmluZSB0byBtZS4gRm9yIHRoZSBuYW1pbmcsIHBlcmhhcHMg
anVzdCBuYW1lIGl0IGFzIEVCQyBmb3INCj4gPiBFeHRlcm5hbCBCdWZmZXIgQ29udHJvbCBhbmQg
cHJvdmlkZSBwcm9wZXIgZGVzY3JpcHRpb24gaW4gZG9jdW1lbnRhdGlvbi4NCj4gPiAiZmlmb19t
b2RlIiBtYXkgbm90IGJlIGNsZWFyLg0KPiA+DQo+ID4gTWF5YmUgdXNiX2VwX2F1dG9jb25maWdf
c3Nfd2l0aF9lYmMoKT8NCj4gPg0KPiA+IEhvdyBhcmUgeW91IHBsYW5uaW5nIHRvIGltcGxlbWVu
dCB0aGUgYWJvdmUgZnVuY3Rpb24/IEFyZSB5b3UgZ29pbmcgdG8NCj4gPiBhcHBseSB0aGUgRFdD
X3VzYjN4IHNwZWNpZmljIHJlcXVpcmVtZW50cyBkaXJlY3RseSBvciBpbXBsZW1lbnQNCj4gPiBn
YWRnZXRfb3BzLT5tYXRjaF9lcCgpIHRvIHByb3Blcmx5IHJldHVybiB0aGUgcmlnaHQgZW5kcG9p
bnQgYmFzZSBvbiB0aGUNCj4gPiBlbmRwb2ludCBkZXNjPyBBcyB5b3UncmUgYXdhcmUsIEVCQyBp
cyBvbmx5IGFwcGxpY2FibGUgdG8gbm9uLXN0cmVhbXMNCj4gPiBidWxrIG9ubHkuIEFsc28gaXQg
ZG9lc24ndCBhcHBseSB0byBmdWxsLXNwZWVkLg0KDQo+IFRoZSBpc3N1ZSB3aXRoIGltcGxlbWVu
dGluZyBtYXRjaF9lcCBpcyB0aGF0IHRoZSBBUEkgZG9lc24ndCBsZXQgdXMNCj4gc3BlY2lmeSB0
aGF0DQoNCkJ1dCBJIHRob3VnaHQgeW91J2QgYWRkIGEgbmV3IGJpdCB0byBlcF9jYXBzIG9yIHRo
ZSBlcXVpdmFsZW50PyBUaGUNCmdhZGdldCBkcml2ZXIgY2FuIGNoZWNrIHRoYXQuIEp1c3QgbWFr
ZSBzdXJlIHRoYXQgdGhlIGR3YzMgZHJpdmVyIGdldHMNCnRoYXQgaW5mbyBzb21ld2hlcmUgdG8g
cHJlcGFyZSB0aGUgZXBfY2FwcyAocGVyaGFwcyB0aHJvdWdoIGRldmljZSB0cmVlDQpiaW5kaW5n
IHByb3BlcnR5PykuDQoNCj4gYW4gRUJDIGVuZHBvaW50IGlzIGRlc2lyZWQuIFdoYXQgYWJvdXQg
YWRkaW5nIGEgbmV3IGZ1bmN0aW9uIHRvIHVzYl9nYWRnZXRfb3BzPw0KPiBUaGVuIHdlIGNvdWxk
IGFwcGx5IElQLXNwZWNpZmljIHJlc3RyaWN0aW9ucyBpbiBvbmUgcGxhY2UuDQo+IA0KPiBTcGVl
ZCBjYW4gYmUgZW5mb3JjZWQgd2hlbiB3ZSBhdHRlbXB0IHRvIGNvbmZpZ3VyZSB0aGUgRVANCj4g
KGNvbmZpZ19lcF9ieV9zcGVlZCBldGMpDQo+IA0KDQpTb3VuZHMgZ29vZC4NCg0KVGhhbmtzLA0K
VGhpbmg=

