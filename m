Return-Path: <linux-usb+bounces-9727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D158B1188
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 19:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33EA283CD6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 17:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107E716D4FA;
	Wed, 24 Apr 2024 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="Kw2XTgDE";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="sSRvl130"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A016D4CA
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713981443; cv=fail; b=lmWzzS8s6ARTtQrfAUOsFaWDX7u//fgo+FW93dx6iL70whRj+N/v2BVy2ENZS1SeHMOEO1QRzAj5Pzgg2z3SwLpjtegdhN793CqxDflt2BvqpUtr1i1WV1eFHdEBQH/u4YANZFzVNo36u8VKbtzwjL0xbMxGTrX1kb7J+F71BOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713981443; c=relaxed/simple;
	bh=pjV/KNsOWgT4hiRkBLfQCnIVHvwaZgC52LzHfdbndrE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UR2BSuDQ3rn2RX04Gl27Tp5LWKaiPz3/Pj0nS0L4FieslSYV/iSm2sOQnndj9aYh82zEDKS1qBmGlEiHXgYGjviSgd9CAUKtxj+AN9cniUMt3YJK4SoyIxmtYssSGaUpaS4+AiEbzBj4UTksCm3KBIE6LglxWnnELx8FkwdEr94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=Kw2XTgDE; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=sSRvl130; arc=fail smtp.client-ip=205.220.168.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OAU2Tj028125;
	Wed, 24 Apr 2024 10:57:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=4QULSbP7vkyOIg3nTRdQMO62+5KXKRFGxlaRn+SoQas=; b=K
	w2XTgDE191S06iW9qMK19UIzUSdI2+bMJ7X15juh55AtcANJ7NPQag8vqfo65cMQ
	TZVj8ElFviM6UdDeIzRZ375pmWvjLGncvOqM4Ah2+iBnAHUkEnEEWd7WoDMzBIFv
	BYTWj9vWgQR0KFHMmcpmLeiIslNhqWIUN8FW9HMBzX8zuUVMPN34roz6hD+JOt3z
	vm5kXPh7Vg/b2buPzod+BL1qUsw9ImCIPATxA9EUfY6cAjho/Z6PsXRcJ38O/TLD
	wpgc1kLZLWTW/8WszzVH4n7a5nRCznF+56DRVPftyvvHhCtIL8DgouEOkgtf7mdd
	2A8z//vtK+I7NdCFLrmmw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xmcrg34ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 10:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2/Y3yetsML78GGqe91KkjLTJYHSXR6COO2/zqAlMrtiKA2jfZQEZeR6RZ0gS9YlcJSP0PVxtd9+JfXDbSIUXi8chYAKOEINXwlM7zUac3yFRQkHvwCpX6NznGo/fkHVOjpsDkvfDgeM/H8OcTxumppZB8FpjOq2FMra1FCmZ+Tly7AwjvAMaQhBvwbSqjsPweKvgWX0xlCrjuIiULYb+dWaaFmfJPTm5B+5CsUBPOFLuV9QQB/v10yG4uG8pvxOmqFaCoYVRzMltbiDXyJvzGYrcM0EFXWMefWXyJJnOniIXB5qmKV+LjXma9Loyol7y3I8mVKO+t646/L1lEZ/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QULSbP7vkyOIg3nTRdQMO62+5KXKRFGxlaRn+SoQas=;
 b=bq3zlffskWQ09unOKISbVFX871k+DlsvF4tqP2K8uJidNAyN8ivAdr6YGQQvyXbxXvTQqCsRIRPF9M1J7CrB+Q/s1KZNem5qL238qGWZSxlPGC/R8/5pvmSUyDf4xLbefTMQMUsBNt1XN0Xb/ENk6OEGJ2Rah+cRwVY56+XdCSrnfiXTSiHo8Imoh9l0mCLxdO11UPFHjyfayYgOGVwIm8xACW5DD3oPgoXhj0mdZZ9uTI4wrMFf+ec+7907NtVQR3NmIGbnauzRM0TZQb5Yb1fENwGgUTl6JqMeJVSz6cYjm3bF97JejsmPV2uYAZmGXLzCq7/Ytk9hbIDl1dj5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QULSbP7vkyOIg3nTRdQMO62+5KXKRFGxlaRn+SoQas=;
 b=sSRvl130L85JBcbH8yf7naQFEZzbuyVRoPQAWaOeL+hBg9cUosEneEVVg3+xSFbppQ4nT5HuZOGN3w2I4fF8rJZp6OycahI7+1AQ48lzGed+9FPSrm9wkJjh4OqWCWB5RFhTRtfBKLwejFRUGkwTMKo6caAaQD4LzeNu7PLFnGSBTzOPhdwIBN8SRIqgTg82AoOaZdNxNxvX9HxEFL3n/a6HdZhvqmr/u6ePuL1V9LwLQOpUgM2ezU0qHstngH64eNeYI6aVr+GDGiA7CUQOnI33ZhkoKRg9sOX1iHfLNpyZNe5SJyX5zYIc/EQuRBg1hDdhr1sqM0LeJEo6JwOylg==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by PH0PR17MB5753.namprd17.prod.outlook.com (2603:10b6:510:110::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 17:57:08 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 17:57:08 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: u_audio: Fix race condition use of controls
 after free during gadget unbind.
Thread-Topic: [PATCH] usb: gadget: u_audio: Fix race condition use of controls
 after free during gadget unbind.
Thread-Index: AQHaldSOGFHU49J8vE+UcxZJMREgPbF3dqbv
Date: Wed, 24 Apr 2024 17:57:08 +0000
Message-ID: 
 <CO1PR17MB5419BB151E902045A7E98FF6E1102@CO1PR17MB5419.namprd17.prod.outlook.com>
References: 
 <CO1PR17MB54190B898057616EEB3F9E51E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024042346-pastime-platonic-7e28@gregkh>
In-Reply-To: <2024042346-pastime-platonic-7e28@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|PH0PR17MB5753:EE_
x-ms-office365-filtering-correlation-id: 781613c7-4d38-450d-a818-08dc6487f5c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?EWMuSdgXFEA2m0deFmzDjMIjQ6TgD7RWpoYmddvunqKglZmfg2p5XLyGdP?=
 =?iso-8859-1?Q?AKTuwiqFHwat2kC/9nRIeQR4uhGUs81utZEIWm4wsfsjvc3j5DoggwysnL?=
 =?iso-8859-1?Q?2WX5tkMhMS3wAL6RT0/bNlI0ESSAIEYHjoyOT+8NN69KtBgucDKhgHsfft?=
 =?iso-8859-1?Q?YOcPYf1xO9WgnijMEqsw2vNrIk6HAHj9bkidh1KpyXsScQjiPQxFUzka08?=
 =?iso-8859-1?Q?SOOxWjPVHo5bzqB+3DNbjtGbUpsNmTVEONAiXnAIe2Qx7m8iihEfWiTpdm?=
 =?iso-8859-1?Q?0kBVixdquxDg57WEs3TS7FSusKhMFOcaHqhDwPp3qT5Diw41IORPUtqHpr?=
 =?iso-8859-1?Q?Ru3g7WZP4PJKOHslQtNjHj0vMqXfjLVFAPBs8Vq1t5AUd0ljSlsf1ijUve?=
 =?iso-8859-1?Q?jTlvyVNwIPaRUPybqD9TcRebCiyUd3P+FJF5N8aD/m8uUyUMTSsRIXJqpC?=
 =?iso-8859-1?Q?/LdNjAirI1PmEKa0zJc3hlKJ+Wgz1jX6dYhBQ9XxozKaoLzxe61aonUgLD?=
 =?iso-8859-1?Q?FhInyvHTovUtx4v4jYy6AwZ6Rc60P9wQu1d+mOyHSqt3qehwrunpVOr8sL?=
 =?iso-8859-1?Q?IxMqm21zaNokJfVjuOHp1lX2kMQfbPy2IZ3KtVteofB8kar6J3gqQSRHsP?=
 =?iso-8859-1?Q?67Q9mHQo3BMrPsr2PiuO31QTbvKelkQJMNX/qqQHYXn70Yk28HdpYxWvRc?=
 =?iso-8859-1?Q?Jap67ElXqKfzPhWREj0X+3csoA+NER+jlW79x2evMpMCwfEa9tF2LE+x8r?=
 =?iso-8859-1?Q?p5Vy3zQG/T/XikgSJf9T6RzvpsiOXzRZFcN8YsEkwNrrdd4awbOLNRGIhW?=
 =?iso-8859-1?Q?hLMEo38jsixm5fhZqG6gPiItHAIMr0taPY+IMWqw7dMbp/GXHt/o0qtr8a?=
 =?iso-8859-1?Q?lTIMcWWSCHaqFE2uYyXt/lXVR/FQz7+WK4Lp0qn8ADxFZOQcSHdeFAEzHa?=
 =?iso-8859-1?Q?lhJ9AH58sUD4pdeUWRZs0RtLFT6RmsvOcBYO9CDWC8qwBYMLF2kKvRQR4v?=
 =?iso-8859-1?Q?zLilV7qJ5gHo+eglzg+3NQ8n37pM36+colhlfIQ7LZV2lF0PPKYtt5HWsg?=
 =?iso-8859-1?Q?gqSrYkgA5pDQKZCw31x0S/au0vtu/KNPyFoEqhy+H9tx2hBrk6d3Z5pou8?=
 =?iso-8859-1?Q?rkQFyxG3gdCGV30GGCAG5SPWARJR/xq8r16GcdjmJIFNIPuy7sYDei1J5p?=
 =?iso-8859-1?Q?G8bjXsftk24brjuRlTBbizqSIHtwkgXvxqDq46CkxA9f/5tjoMHBUQ8Gm1?=
 =?iso-8859-1?Q?vfWiuQaPCS1M3V9aMbAHqngOuVFFLiWEgHcs0ny+QWv6F9khfxuHwCBS+V?=
 =?iso-8859-1?Q?VHFTB57jG5X6YHXoajKNvzUz7dCOuMAQvO0wqr5Uztru4pl2LuKCMC4WKD?=
 =?iso-8859-1?Q?0Scbuw56ddR+HmKQEJjHNfd7FUfux7sQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4n4UTd7hv+UzzQ8h9YDSvV/MGRHKCxozkUNDxc5ZCLkXsvcRbQmwvko8PA?=
 =?iso-8859-1?Q?+DkmKPzGk7B4BrB3hEze+jU9xymw6i7AuNCIDIBUOyF92Vhiv+KKZPT153?=
 =?iso-8859-1?Q?I0EMT0gBx2lnt9wWTNSQLKDJFmqBfa5RVnybmvB1gpw0pSUeqNOtqRyRjv?=
 =?iso-8859-1?Q?YdHw8vtUEKAZPS15fkHqORlgKy9PdOTMRXkR4bUBP99D+pIO1GXatuYbH+?=
 =?iso-8859-1?Q?jtvuM1dVm5b+JEVeRF3fAKYjWAAXF4hSllfgINg0LDVqBRrMgs+wSzNJQh?=
 =?iso-8859-1?Q?WKZyVH9VNNq2PBILz/GMPKTRiU491nEHjfymQ+Z3mZuXJQny3gvLSDJ0W4?=
 =?iso-8859-1?Q?hOtNZ6Dz00XxZSGGdr7bPfsUoymhhivnbSdkDHYPQmDg0bQlpB0mZtNDmc?=
 =?iso-8859-1?Q?HpLBmXc0U+HwqX0FAx03Dj7ja3Fogr+v1cvnu6igYHEdud+mjeTJdNrZwi?=
 =?iso-8859-1?Q?yM3wN0HpJGx1mr7bcFAodB5/Qke3Pb6OUE6IW/bjrQAEdU/Y1JPLuM6Wwm?=
 =?iso-8859-1?Q?pxmD+wHcPlccaRoy+QH6Hf2ZAI8suSR5TCCv9Dukph7anEWKBOhpWzicbh?=
 =?iso-8859-1?Q?TE0KkpajGIDpS4GX30S1ne8OYKeccyxPFVQS0pPMJg7W+4h/I+vbaLdTKb?=
 =?iso-8859-1?Q?Q8/UUBK7pefk0qpwyWDLdCfchOZAt3yOoIvJrULffEbuPvJUM8YvX0HlI8?=
 =?iso-8859-1?Q?XgOjyXc4YfFSuHHopJtanNGwAlt2FUPFcOpPVQ95AQF4a5n8SZAfjT1olX?=
 =?iso-8859-1?Q?xJMcN1julCPClxWaANGy7vDjw/B48kIgzzXOv1X0HX7IszlESEdx17TGjJ?=
 =?iso-8859-1?Q?2wAwlHJUWBUcqy46KXnHf+WomCHK4Utmdw3Yv5e2rXeknrwaIOsJWJwRFI?=
 =?iso-8859-1?Q?zHbdFsF6PiUiOtq3gXDl//qY0Ug6fEONT0IPDNkS2PZjTKfipJ5znZazYG?=
 =?iso-8859-1?Q?y8kKkNw6lwRAcmS6Bn8oDGJnUs31vCEUxZ9rpkyZmQCd6FjgFugnTPAIv2?=
 =?iso-8859-1?Q?3O5S8rCaHvgcjKtIjlTcfLR87bXtHqU+Bfo925XF9ryRqmkyHFZoDoYQWM?=
 =?iso-8859-1?Q?076ZIuLSC0ijGxuojBWqbRwzmMWwQq+XwkUzuDwWYYzBulb60NXxGkAu8M?=
 =?iso-8859-1?Q?l49tTncvg1qU11HLGZHQAvsKEEVdaM38tnLBJJBuMZ5hiAtlZ932vSQCOC?=
 =?iso-8859-1?Q?gsByDOqtp5dRRSsuxd1cqa/7TOrXC+NtneSYCSUD2UUUEawxJ+UD6ngEu/?=
 =?iso-8859-1?Q?+hJIpVVj0DyvU2vspqSeAg3uL6BbirWMs5hAvpvhVMZmMXlkFlav5t2W17?=
 =?iso-8859-1?Q?revHyTDWYdKoviA7Z9tHF0EZM/QpIoxojHht8eOuHxob3DP7P9wanQCbqg?=
 =?iso-8859-1?Q?y9BP9jpH8jfShCLFy/+k9PodeoWsM0i5DFw15ST6ixeVcB4NHoOYa7yaXJ?=
 =?iso-8859-1?Q?XuXtc1W7m7AF0OMuyJENQqlEpUW1fq7DoYprZuFvry24GKvj9HlfqZ8Scx?=
 =?iso-8859-1?Q?nYvoS9sBETtChbpzZy/PMCa9Cvvfi76l+lBV95PyJtkwJD69xjudEQHv1N?=
 =?iso-8859-1?Q?8u43ksEmy/m8mPA/HdEHwhbky2EtA1rBRgUybYjo+oLu1oRP8JW3EzdI0t?=
 =?iso-8859-1?Q?hiKjyI6+RKFkeWvc+35BVwbKeLVytPZdkC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781613c7-4d38-450d-a818-08dc6487f5c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 17:57:08.5953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdBzrVH3OJkqrP02tSXjETpSd09euCqMHYyA828F+fCHz/jTyPEEgbp219l/kOyK3SpSOliEdMFbC8cci/xbTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5753
X-Proofpoint-ORIG-GUID: RU6TuxxUybLqFmg_DV7MEzBXyHzL9qu8
X-Proofpoint-GUID: RU6TuxxUybLqFmg_DV7MEzBXyHzL9qu8

=0A=
> From:=A0Greg KH <gregkh@linuxfoundation.org>=0A=
> Sent:=A0Tuesday, April 23, 2024 7:18 PM=0A=
>=A0=0A=
> On Thu, Apr 18, 2024 at 04:35:07PM +0000, Chris Wulff wrote:=0A=
> > Hang on to the control IDs instead of pointers since those are correctl=
y handled with locks.=0A=
> > Prevent use of the uac data structure after it has been freed.=0A=
> > Mark the endpoint as disabled sooner so that freed requests aren't used=
.=0A=
> =0A=
> Nit, please wrap your changelog text at 72 columns.=A0 running=0A=
> scripts/checkpatch.pl should show this.=0A=
=0A=
Next version will be wrapped correctly.=0A=
=0A=
> >=0A=
> > Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
>=0A=
> What commit id does this fix?=0A=
=0A=
Several (next version will have Fixes: and see comments below about separat=
ing fixes)=0A=
=0A=
Modification to stored controls:=0A=
8fe9a03f4331 ("usb: gadget: u_audio: Rate ctl notifies about current srate =
(0=3Dstopped)")=0A=
c565ad07ef35 ("usb: gadget: u_audio: Support multiple sampling rates")=0A=
02de698ca812 ("usb: gadget: u_audio: add bi-directional volume and mute sup=
port")=0A=
=0A=
ep_enabled:=0A=
068fdad20454f81 ("usb: gadget: u_audio: fix race condition on endpoint stop=
")=0A=
=0A=
=0A=
> > @@ -447,6 +447,8 @@ static inline void free_ep(struct uac_rtd_params *p=
rm, struct usb_ep *ep)=0A=
> >=A0=A0=A0=A0=A0=A0=A0 if (!prm->ep_enabled)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;=0A=
> >=A0=0A=
> > +=A0=A0=A0=A0 prm->ep_enabled =3D false;=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0=A0 audio_dev =3D uac->audio_dev;=0A=
> >=A0=A0=A0=A0=A0=A0=A0 params =3D &audio_dev->params;=0A=
> >=A0=0A=
> > @@ -464,8 +466,6 @@ static inline void free_ep(struct uac_rtd_params *p=
rm, struct usb_ep *ep)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >=A0=0A=
> > -=A0=A0=A0=A0 prm->ep_enabled =3D false;=0A=
> > -=0A=
> >=A0=A0=A0=A0=A0=A0=A0 if (usb_ep_disable(ep))=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(uac->card->dev, "%=
s:%d Error!\n", __func__, __LINE__);=0A=
> >=A0 }=0A=
=0A=
Looks like this actually is reverting part of 068fdad20454f81, which was pu=
t in to fix a different =0A=
double-free problem but introduces a new race condition that I am running i=
nto. In my case,=0A=
u_audio_iso_complete is called during unbind and _doesn't_ exit early and g=
oes forward to access=0A=
various things in the sound subsystem. I will split this off and see if I c=
an better isolate what=0A=
is really going wrong. =0A=
=0A=
> > @@ -792,6 +791,9 @@ int u_audio_set_volume(struct g_audio *audio_dev, i=
nt playback, s16 val)=0A=
> >=A0=A0=A0=A0=A0=A0=A0 unsigned long flags;=0A=
> >=A0=A0=A0=A0=A0=A0=A0 int change =3D 0;=0A=
> >=A0=0A=
> > +=A0=A0=A0=A0 if (!uac)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0=A0 if (playback)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 prm =3D &uac->p_prm;=0A=
> >=A0=A0=A0=A0=A0=A0=A0 else=0A=
> > @@ -840,6 +842,9 @@ int u_audio_set_mute(struct g_audio *audio_dev, int=
 playback, int val)=0A=
> >=A0=A0=A0=A0=A0=A0=A0 int change =3D 0;=0A=
> >=A0=A0=A0=A0=A0=A0=A0 int mute;=0A=
> >=A0=0A=
> > +=A0=A0=A0=A0 if (!uac)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> =0A=
> How can this happen?=A0 Is this a separate fix?=A0 Or the same issue?=0A=
=0A=
This happens if we receive a URB callback after/during g_audio_cleanup (via=
 out_rq_cur_complete =0A=
in f_uac1/2.c) for a UAC mute or volume control. If that happens, these can=
 access freed memory.=0A=
=0A=
I think the higher-level race is that the dequeue for the request happens i=
n composite_dev_cleanup=0A=
after the function unbind (which in f_uac1/2 calls g_audio_cleanup.)=0A=
=0A=
I will make this a separate patch if you want as it is fixing a similar sym=
ptom as the others, but =0A=
has it's own discrete cause. Presumably this can also happen for get of vol=
ume or mute controls=0A=
though I didn't run into that.=0A=
=0A=
Here's a little timeline to better illustrate the race:=0A=
=0A=
  Unbind                       URB=0A=
=0A=
  composite_unbind=0A=
    __composite_unbind=0A=
      remove_config=0A=
        usb_remove_function=0A=
          f_audio_unbind=0A=
            g_audio_cleanup                        <-- uac is freed=0A=
=0A=
                                                   <-- URB received from ho=
st=0A=
                               out_rq_cur_complete <-- set ctrl from host=
=0A=
                                 u_audio_set_mute  <-- uses freed uac=0A=
=0A=
        usb_remove_function...                     <-- other function in co=
nfig=0A=
                                                       may increase the win=
dow=0A=
      composite_dev_cleanup=0A=
        usb_ep_dequeue                             <-- EP0 req removed=0A=
=0A=
It is possible there is a better way to avoid this by making sure to dequeu=
e the req prior to=0A=
calling g_audio_cleanup in f_uac1/2.c. I will investigate that a bit and se=
e what I can come up=0A=
with.=0A=
=0A=
-- Chris Wulff=

