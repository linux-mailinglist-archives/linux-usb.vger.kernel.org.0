Return-Path: <linux-usb+bounces-9369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333F8A5F5D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 02:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECA7282E92
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 00:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2C5139E;
	Tue, 16 Apr 2024 00:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IoVA1div";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cwkGnaY/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oFLglGyI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5428A3D
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713228234; cv=fail; b=YfM4nlB+8isxA+WZZkk6R2carvMx9WSdYNWZ9YyjYDpE0WmUqdf7DjvhRRWinxyPnR8B5cgv0KRJsafWpx+Wu0XnO1cOlt0h7ccEVFYvhK5lt4bWJkEkec2s7cAk6K698ykpKI6FTXwwV5PCyCEfgqXKB7jDXI8IG+aOo1M23zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713228234; c=relaxed/simple;
	bh=//vwFOZV21C0S6Re74e45HQllhRKGIJm0VIQuHIjXHk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gASIbhjEzWwAtcqaOOmsBfVyZjFOApVuis1XsbYCppqYI8ql4OAU6RdegY+mnAGIIxPEFN8/xEKU0BFlXTUu29jdJzT9TSLScRTgZ8kD6Lx9cV4t1Kw41/8+xOjkGJ1YIWXQjSrwY099Ze+AREB8lK2BWxeMjDkWUby6Cvp8Hx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IoVA1div; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cwkGnaY/; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oFLglGyI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FKXQEK016937;
	Mon, 15 Apr 2024 17:43:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=//vwFOZV21C0S6Re74e45HQllhRKGIJm0VIQuHIjXHk=; b=
	IoVA1divE3NrhzZqBSChmX3kDcJR12b1fw2SFUNCUs1RS2vInUAihB7NTfesqY2q
	dEaYWzp3WzGX6pW1box8DeOjk1eMdfuNghX23M8ZXg7nE9iDqPpErGnubOFA8OOe
	kpsDpYLGdNqGSxGBf0HBEk4ISe/+0i8+IsolruG7y0fhguYc6/ibnw5ad+iZmR4L
	xJmLVPUtdZ9UGrWnh+pH4RELRi4U7ymu0SEP2hhOSS/z/6yoxbjxZwi+Rl5fMoZ0
	M+CH1yCzSIqlsihane5tshXFt8oWxmUHaJEY+x/bxSMvRjX5w9BFd/GJIeXC8Dki
	km6ihmCmfb+9A0R8tbCIPA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3xh7h71ws3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 17:43:36 -0700 (PDT)
Received: from m0098572.ppops.net (m0098572.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 43G0cJhX015084;
	Mon, 15 Apr 2024 17:43:36 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3xh7h71ws1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1713228215; bh=//vwFOZV21C0S6Re74e45HQllhRKGIJm0VIQuHIjXHk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cwkGnaY/eFQQk4Qrk8qFg51M9mS5MamsOttk70KdHScwpcMuWPXhLGpGwqN25E5Hj
	 Rdh94wV05FDQdhjmqAYjBQ2cpcjspDVh1H/hvzg5SBul+3xDeMTBjvnpPneFRNORGu
	 /pm6w/MncwsM/ZD2JvQ3sJl7W6DYodZgwvtcELD5WC0+jIjQbq0DyNq9V31qaxHkHL
	 GjyDNeikllSiDQww1OO0lo4/QB+DYoin3hQvYbrZXI0CrICQErP78vtIEJlOjehsbg
	 3L4hHTZlSb21b9ZP5X24uouKLVZ0MJbN4c6KmKVZkVDNeOS6vQ3JWTaNIPwdCciLqZ
	 apSC6YDGlO4nw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E24DC40347;
	Tue, 16 Apr 2024 00:43:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 704ADA0081;
	Tue, 16 Apr 2024 00:43:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=oFLglGyI;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 733BF40360;
	Tue, 16 Apr 2024 00:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwfVSX1LcsRxbTeUEjheP7/ENOnp9NNbofkZd3+EWLmnovsFt7Hf1WWQxiTsv4riafdIGE3uc4JQahqNv/9Vo8oWgH1NjTzW0yeflbYa+EjN5Zl4QJdRsOv08wl6rUHStTRl5kWxSy1U8Fz7qeivklW1smSvgIn4bjKCrg5R4drLqwYXzzDpF19lYDafp/hsxuOugwYhyYp0LCjtrket50JRp/WlX/5eRCDXLXe2FgPa0nVkc8UBHtMgnItmdii33E0P+oFkTnU/oAgdoupkfKdn+BmTVZZdq+DmQRSOAf6vaDZl33o1R9bpIzrQ20KopoNuZqQld1ZUP7fwWvO/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//vwFOZV21C0S6Re74e45HQllhRKGIJm0VIQuHIjXHk=;
 b=VRrTSr5gqAG5AK0ssDXujr55DP08opNLQjRNVGa5YVSd6sCBGEKNGsBWXMS6Lem2mrB70HSjjSYOnQM8gQOpnxcDp5wtshuwecP2MJpYYXGnMCO7EPpFiFZiTEsTgOTQx8gKF4ivdrvOKqrr6U4DAagsE/V5LQDmpW63/EcFnkUHQE/7eZmAK18zAcNvnh+SbMvBL1hrUekZOdtCPWN+4bT7SA25qplRdRN0tOIipjaAWSp9FAuZYvm9+PSFACA4INf2IwDhT8RqVKfZmVwIsCGipmcjbZbimeDgnwqBG/8J5iHJidh4jW5vHe2wLu25V63L8QAGMUfnqnF2DhH8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//vwFOZV21C0S6Re74e45HQllhRKGIJm0VIQuHIjXHk=;
 b=oFLglGyIRXIegmWghWTiINxuDjY43jOoqdCwhGLrQ1ltj1bo4L1Fue90nW8hXlpInQynfBHbHOlTcgvAxQU9D6625SxE28TO9emP5uECVbIWVXbxmFZyzOTe0mxCthF0/jXGF7gq2tqtEfE5ckr7Myv6MzqCc0V0z5xU9Lbrkm8=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 00:43:30 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::7b71:2b11:a09e:41d2]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::7b71:2b11:a09e:41d2%7]) with mapi id 15.20.7452.046; Tue, 16 Apr 2024
 00:43:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Anand Moon <linux.amoon@gmail.com>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Johan Hovold <johan@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] Use new helper function for clock and regulator
Thread-Topic: [PATCH v3 0/5] Use new helper function for clock and regulator
Thread-Index: AQHajOUFuIp6saWuPkij1bRB0UFzKrFqEPmA
Date: Tue, 16 Apr 2024 00:43:30 +0000
Message-ID: <20240416003111.n55mcgszumhdbnpo@synopsys.com>
References: <20240412142317.5191-1-linux.amoon@gmail.com>
In-Reply-To: <20240412142317.5191-1-linux.amoon@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|CY8PR12MB8066:EE_
x-ms-office365-filtering-correlation-id: 52b3af93-c4fc-4882-8e5c-08dc5dae3ca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J/BgMOqMJeq+uYU+Vdwx8MVaR2jzQv7wtMZi0ru8MQtAEf+dkdHFWi5FtVJbtj3zaAOj+yq4NUAOxCIJFvAsNKcAQmeO32jP832WHbd3pRwniiWzXTBT7cPgb8pw5TYkCE888tsdnYO26CVkvmhI6TLOtzQnZ4jnMxafcLEGYprlDeNmH+oMbbe7tXkuB9FWkSU34CxstlkDGCLbRnQ0/6GugjAY4+6guuQv/FM2CkloGe0V8PLJ/4me+66EdHmpON2zPGvGxZLnLrGRwxoIRRVWZ6vV5GTjdPPrHa+S4ubPiYGgxqqM+JXclDQH0whTt5Ei9ikGm24xSWUbliWUm8I14+qjVoioOzGXUd+ZF0tt9IV9a6/8XIL8HyJ2JtVPnjii3WImOWItwXvj9Axsj65rvfcMUJZzsOKXbaKOWfhvOsb5j36PJjKU1is7G/XmWz+pvnV0ndS7WKMf0cB7RQqG+sUblXdPZta8c694zIztQoLrQN1/YMQwTtZOCH+TlMjblQyJ9Imchkooy6pzS3pbbs2b8J6sdlW/0/UW7OEkLUrC1fI6FCpbX7/55kvPnplvJb5mPi4NLaRVqGSlweQD8FdxO3ONb+2LLjwFag8ToEXjbpQF4rkIgFchNYx+V2vLexmVZmzbXmE5Yd3GA5uoAcbUYl6UoeVZJi/WnnXjWuQGS8nO9SnwbQt/4ybajYIyc7Itk1VFZ7wCIIj2lw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVptbmYrc3hqb21KWkNDV1UyOG5mOURBSlA1L1JpTCt6bVhLQWgva2tjRlI1?=
 =?utf-8?B?Um92SmVwOTZFMWdZTVZobXlMUVd3UkhaUmtWUzFtZ1Mxa3FGRnZGSHRzUlAx?=
 =?utf-8?B?K3IzeXlUczY4ZHNaZjU4MmpjTmlvbStNZmFaNUhoaEpVMlVIUXJxWnNkczF6?=
 =?utf-8?B?bSttU2tMOUhpam9oRmQ4UzJEeVVSYWhjUFdEVnArcHFDT1Jrb25uVURRUm91?=
 =?utf-8?B?clh2eFdTZXhhTzIwNlNsK05BS21lNDdHQUcrSDBRMEROeS9JYm5CN1JmWVdG?=
 =?utf-8?B?V2ptR29BTVQ3eG5YamY2YXh5ekpPbFNjV2M2bjNNNTBKVmZ4MjNyVUxXbjNQ?=
 =?utf-8?B?Rk1OTUVuNXBPQkNhcDRJRHRtaDRQOUxwelV1VDdQR25tWmpLdFhaL0NSajRB?=
 =?utf-8?B?eFRDZnBlalJVUStMTlhPSURrVWRwRDlXa0hXd0VYMU84Z2MxdERtMjNsSGZS?=
 =?utf-8?B?M05saXlnc0JDV09WUFJndkdSU09CRnNNUms5cG5ZeVBRY05Vck5uY3FLVUd4?=
 =?utf-8?B?NHRUeisxWVV3L1lVT1R1aC9uKzI0VkUxSUw4T05aaS80N2N6VUFFSUtFa2hO?=
 =?utf-8?B?eUhQRm41NFB1bTJqZlIxZDQ5OFBQaHdLYTcyNmtBOUZGU1pKR01oMU1LZnZ5?=
 =?utf-8?B?YlNiOEw5ZUszNm5nWFpmOURnYzlVUFNNQ2VOS05QODZXT1VWQmkxRGVJWnh1?=
 =?utf-8?B?bjgvNExoZ241dlJDM0sxUVc2RzNNR0ZpQ2RjZHdwUUJ2Q3BMY2tzc2p6bkNT?=
 =?utf-8?B?M2VEOGVmcFVLbW5zUSszdzUwTDFDQ2NlZUFPaXdpNGk1WWJPRktkbklDYkZW?=
 =?utf-8?B?eUh6V051WHNxYlF4b1NKbW0zWWhvMElyZEZvUWkzQTdYcXp2OFlYNnBLM0xr?=
 =?utf-8?B?NURYdUNRMlVtZFE2WkJIcWVxYUM4c0JtVHRGN0oyckQvVjdTTjBoNUNVbEFy?=
 =?utf-8?B?YisxL25lTmJZS0ZxVFh3NmZ1cHl2Tnh3MnQzZXFLREc0Q1o5azlzN0FoekZi?=
 =?utf-8?B?ajJha3oveTBYM21OdHRubGtzSzFOZVZCZHJqbjkwOWpmM2xldFpzMnNwTVoz?=
 =?utf-8?B?K0lUUFJ5U3RKZFUwUDB3ZUV2U2EwdmFqTGxrMWF6b1dwUGQ4ZGVaTEkzMCtJ?=
 =?utf-8?B?RTd6S2pPanoyL3FnVnZTdWFlMUhNemVpNkRCSmpCU3JCazU0ajFWdXhNbEh6?=
 =?utf-8?B?b1FEZU1URWdmaDRURHJiTnJnYmowb3lCNnlYZlVoL1ZTUWdTaitwYXFsYkxi?=
 =?utf-8?B?YWZnWXJXcDNoRy9HeVVWNldNQlNSWWxyRVh4aExpaDVnYWFhSWJQVVBDUmZx?=
 =?utf-8?B?ZCtOeWV5M25kQ0Rya3pXWmpMNVRsWHpWRE43OW9LVXBlSmtsTCs5R1JlY1pj?=
 =?utf-8?B?U3pmUzhXMFJheC80MjllYVZVUmhtQW9YSDJMUU44RFBCbDIyUk9uV3AvWHdn?=
 =?utf-8?B?MkhTU0hHOWhHK1pLTjBNUklTMjcyeHdmU0l1ZThRL2c2SGFZYUc2WkFHRDln?=
 =?utf-8?B?MmxLcUo3cTZmQ2tqYXZZY1VxQy9sU3dhTy9LYUdVZkFnTTJwaXVDMGN5dFlF?=
 =?utf-8?B?OVdmUHNPUDVGUW1TNmN2QzZSRjI0RmpDemM4UGNmNFRwekRDMDJOSFBrWS93?=
 =?utf-8?B?cENibHA1VXczR1cwL0tEVS9GVDg3cnYyanh4ZWpSeVdRLzRnNE96TFk0NHVM?=
 =?utf-8?B?YXZzZHZmMGlKMC9sY3FhaVdHY2FSOUY0TERoZklGMXlkV0IwbjYrUDdxRUg5?=
 =?utf-8?B?ZlErUzlERHJKYkNGdkVTb1YvQzRzVUNoWkpTMHV3aTVtQ2d4ck45ditxUFZj?=
 =?utf-8?B?WXB1ZTlRMk9BSDJMcVFrTTlaY3pmZVFxa09iSjdXQ0FlZDBGMWtWb0NvU1hY?=
 =?utf-8?B?WlMrcndBZ25qaGZMUFdGYzh1NXpYK2d5VExtbzhWMFVrTGFBUjI5aWROOGEw?=
 =?utf-8?B?dytSUDlobVZ1VXZ0Vi9yak43Z2UyeEZlc01rQ2V5SXMvZGdkVmN6MFUvUGtQ?=
 =?utf-8?B?RFlRWThwakR6VUtNeHA3aEd4VWdmOHErbHAwSDhPTVdTTVpSNXZXaGNJdC9L?=
 =?utf-8?B?dThrN3lJVlkwcjBZVWY0OW5vQXh5cytMUlRvT3pJanRoTTE1blcwekExcFov?=
 =?utf-8?Q?it8ztCwkzjLAnnLG6DEuLpXGd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C92232AAC100CA4B825E791F2CB36BC6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EL+rhhTWMlzoVxqvtq3Omri4vqaLhuhSb4ZTSoTiUN0Lkzzb8jNDuZJaPqEHljMBQpxvm/ElyxU26BzKP5ZZQIhORxv81Ah7UUeqT5G0//M3LDaaE5pxSUZsXQ4hTabqSWj//5TQ7e3CNFqIp7kKxa91pPAJ+P+gKexVdkeLzyrf9lg6sz2Y8/cFsNVdmpq8xdHXXs1nXohrOZrJjZomE39B+0F8TgKrRktF+FLtwVnez9SfC9AujqZX2O+z2gbUuAlOhqRyoAScAogV1Fri/s9NiWwaQ38BunmEIqtRuRWsrhh/R8exr2dOBEoSDm2TCa3myU+giA47HTbfjHqM8pTSuG0JkxgwtwtuYFvyfHczXL5LGlnNuwUM6FlF+ldDqsKXY32s0VEAN3FXJuF0YW7GibT6z2eL/Ex3Ku9LR/mFVo/tOfmgitXc+aKaIZya27hFqqtiZaMYtAAB0LhmjSPrlcTIFdCqbHW4lQRXqkuqkEJSiN6oaTjJEAjkuSlXhgv0saGiDTo5cnBz0e2Rr2U5fEXouPgZeFO+aqjLGcVJ0gRXiHDT2dyGVajShmdNeSRoyu0oLVdXa5hufJDBA41jXCijf0w0QJbFvP2NbOkCpus1+4T+w0s79U8a6pWNQxQPmG7LHnkLCJWWBKHCFg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b3af93-c4fc-4882-8e5c-08dc5dae3ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 00:43:30.2635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/5I2iji/AokmSRwNS+N5oyHqVoZINHAGkdtf1P2K0OR0MHAVDM4ZsmmiYBu1VRErjb5wNkWYVEc8yiEMvo5TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066
X-Proofpoint-GUID: Lx57Ohk_NkulIt6Hi3HOSD-NFSo9lWlY
X-Proofpoint-ORIG-GUID: CNIbmcdTGj_tJNomRT8d3GuyZLX1ny_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_20,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=974 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160001

UGxlYXNlIENjIGxpbnV4LXVzYi4NCg0KT24gRnJpLCBBcHIgMTIsIDIwMjQsIEFuYW5kIE1vb24g
d3JvdGU6DQo+IHVzaW5nIG5ldyBoZWxwZXIgZnVuY3Rpb25zIGZvciBkZXYgcmVzb3VyY2VzIGZv
ciBjbG9jayBhbmQgUE0NCj4gdG8gc2ltcGxpZnkgdGhlIGNvZGUgY2hhbmdlcy4NCj4gDQo+IEFk
ZHJlc3NlZCBzb21lIHJldmlldyBjb21tZW50cy4NCj4gDQo+IFYzIGNoYW5nZXM6IA0KPiAxIFVz
ZSAgbmV3IERFRklORV9TSU1QTEVfREVWX1BNX09QUyBtYWNybyBmb3IgUE0gb3BlcmF0aW9ucyAN
Cj4gICBUaGFua3MgdG8gVGhpbmggTmd1eWVuIGZvciB5b3VyIGlucHV0cy4NCj4gICBzbyBJIGhh
dmUgdG8gdXBkYXRlIHRoZSAkc3ViamVjdCBhbmQgY29tbWl0IG1lc3NhZ2VlIHdpdGggdXNpbmcg
bmV3DQo+ICAgbWFjcm8uDQo+IA0KPiAyIERyb3AgdGhlIGRldl9lcnJfcHJvYmUgaW4gcmV0dXJu
IHRvIHNpbXBsaWZ5IHRoZSBlcnJvciBmb3IgY2xvY2tzLg0KPiANCj4gMyBEb3AgdGhlIGRldm1f
cmVndWxhdG9yX2J1bGtfZ2V0X2VuYWJsZSBwYXRjaC4NCj4gDQo+IFRlc3RzIG9uIE9kcm9pZCBY
VTQgYW5kIE9kcm9pZCBVMy4NCj4gZm91bmQgbm8gcmVncmVzc2lvbiB3aXRoIHN1c3BlbmQgcmVz
dW1lIGZ1bmN0aW9uYWxpdHkuDQo+IA0KPiBQcmV2aW91cyBjaGFuZ2VzOg0KPiBWMjogaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQw
NDA3MTM1MC40MjQyLTMtbGludXguYW1vb25AZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFlMFdE
OWF6QUhLOGNmVkQwTHpoQWVuUnUzNk1LQVE3NWlSV1V2TkxkdmQ3SXhYdEtDalB5a2prcU5Ea0Zj
b3BKSHhua1FkNTBieUg3eWF1cEVyWFp4cHRjWmckIA0KPiANCj4gVjE6IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
c2Ftc3VuZy1zb2MvcGF0Y2gvMjAyNDAzMDExOTM4MzEuMzM0Ni0yLWxpbnV4LmFtb29uQGdtYWls
LmNvbS9fXzshIUE0RjJSOUdfcGchZTBXRDlhekFISzhjZlZEMEx6aEFlblJ1MzZNS0FRNzVpUldV
dk5MZHZkN0l4WHRLQ2pQeWtqa3FORGtGY29wSkh4bmtRZDUwYnlIN3lhdXBFclhZMnlYWFpnJCAN
Cj4gDQo+IFRoYW5rcw0KPiAtQW5hbmQNCj4gDQo+IEFuYW5kIE1vb24gKDUpOg0KPiAgIHVzYjog
ZWhjaS1leHlub3M6IFVzZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGhlbHBlcnMNCj4gICB1c2I6
IGVoY2ktZXh5bm9zOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlv
bnMNCj4gICB1c2I6IG9oY2ktZXh5bm9zOiBVc2UgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBoZWxw
ZXJzDQo+ICAgdXNiOiBvaGNpLWV4eW5vczogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBm
b3IgUE0gZnVuY3Rpb25zDQo+ICAgdXNiOiBkd2MzOiBleHlub3M6IFVzZSBERUZJTkVfU0lNUExF
X0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucw0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdj
My1leHlub3MuYyB8IDEzICsrKy0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1l
eHlub3MuYyB8IDI3ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy91c2Iv
aG9zdC9vaGNpLWV4eW5vcy5jIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQ0KPiANCj4g
LS0gDQo+IDIuNDQuMA0KPiA=

