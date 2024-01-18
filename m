Return-Path: <linux-usb+bounces-5200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819C831098
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 01:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3BA284146
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3174186C;
	Thu, 18 Jan 2024 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="q1lgmcTY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lAzqtisQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DQGU1es1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3539A55
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 00:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538443; cv=fail; b=YDZNYqhlnYFuE7RffXuDbI36fZKuaoZMjbKYLsTNm+E4C7dDp55/+OVuxIQPXRMsvEfyQpv2Iz6tV1otIbDgD3DBKKMsNg8JMhIujE0b+bUtFzQZhvpE36/7QSrRrPPQN5TX80AxZzXAVaMyb81IqFXBpMnkx82dFxLQzi5OqYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538443; c=relaxed/simple;
	bh=32Pp2i/fE7xl6+3F/KKdbRF1vHZJbvWWeAtQMbo9pNA=;
	h=Received:DKIM-Signature:Received:DKIM-Signature:Received:Received:
	 Received:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:Received:Received:X-SNPS-Relay:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=TEIdbgy7N0uFpAX9eSm+6oe/toSMjFQW0l8ND2/bBYJgvv81dd+v1DhizHLYfHdf0Dh4aV+PavsjGUOCF6ML14+ASA8AeBEg6y4cspU0zXz93T2V/tRrXkCeeKQXwIz2j0ruO/n0hBXkNPx1MFrYZLX1xPFTGUz/UPRNb+c+SRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=q1lgmcTY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lAzqtisQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DQGU1es1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40HJ4K42023424;
	Wed, 17 Jan 2024 16:39:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=32Pp2i/fE7xl6+3F/KKdbRF1vHZJbvWWeAtQMbo9pNA=; b=
	q1lgmcTYf10fZYhxgvmXu6DDTEIvl109uJ0YhBf4ZvzSrF/nk2LAOGJn/vH2rz1Q
	cE9Xx6e2mWXfVFRfggHjI/dX7p8/haqp2VNPBlgZIFe47t1PMvqw6EtBwrpLoTJ9
	ZYNy526M68oaUndsZAPzRZpSwO1YbOLhBh8pCQnUgOccLI/epLbg89C3tZMQEJ2H
	cWvNKvXpNU4dqmrDVdlnx4enikMpG5GLZ3RvugGgbha6KGI9ltikWrbE774Ijnt1
	9e+X3Xst4bEYYIOK/tbYdzsDBbnS7XpOjrvOYP9Ed9SRnNPTL55929jMP6W5PCbD
	u0X4BaFvZAq0JlI7zHAUAw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vktn6ck3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 16:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705538398; bh=32Pp2i/fE7xl6+3F/KKdbRF1vHZJbvWWeAtQMbo9pNA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lAzqtisQNUnsW+qe4qQyopfBg/lHqqBPCxSMuXxpM8fc+iEssFdp1ie0MMsQtMFpX
	 llgKXRHimMudbmaqJKf+nsmEzQ3YS/C/Clfqby7G6YZ0rwK2nH8CRrHvZJHU7QX0dF
	 Z6M7c4iOC17tFIgbw+ffpXTQ2vKmJ0I/vOieDxN26us99TSMBBr8T7lNRXffPEhBFV
	 ZcB7Nj7ZqB4tMQqojadnRPtuK92IdRKMLYT3kOTUjuNl52xjJiTT7I0hczZU8zbY1T
	 LWVIKueJzfm2Y8I7Urt6rSFEjvhrvj8wmQB5OyMFGe4bqziKhVWDNB+YN0Pg52rbAa
	 IwPyGu0hge20w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0D810401CA;
	Thu, 18 Jan 2024 00:39:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 856E3A009D;
	Thu, 18 Jan 2024 00:39:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DQGU1es1;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9F30F401B8;
	Thu, 18 Jan 2024 00:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki0UIIUdwT4gosAWrAKVLDa1Pz104yR+QJxL9A3It3EQasTx/5DQ8n4yMquncAp1yAAifzJFqDBnOupl8NL9kewTgN58vzRJeSIxmVWr/vX4Fp/3kB1ukmjwp9YCkR2P2CUBuXIWeBA1FNhArNCTCdPvhMzIKm74QJcspBakG5nWCSiCQw8W4BuaF7G+5DLXbz/lFBWPIlPEiipcsDbpGOHLGuujtCxsvNg3SqLuUmeoVAbJEwEKAgMMBIxlh81jmN38nz6iK6cSf6FQl4OAa+FaHjHJLYFMWqDtcvXlmRnYBcU6C70cgowZk9UX61R4lNEf3csfHQO/9slLRLMdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32Pp2i/fE7xl6+3F/KKdbRF1vHZJbvWWeAtQMbo9pNA=;
 b=aC3OvmNYSmPISdTE8IWh4N5yIG5UcVAulOmWoI+SvwU1U0sTt1NSB96+EreoIBoEFC609Htk1I56blCF2Ug1fu1j7X0Ba9zivN8A22cMEWVR7pWVq2bX10InUZ3CU0164IyWJhcEubgKssHieaIA/XpIl1Ci8NQtOgXoXPLGjIwUZy541fEegT0xqBJo4HUgbY3yuu5CTxhRjopnX9Q1tSYlx/4i3IvdU2hvpcsZbDlMG2n8k/GYeZDPdM0Jg0C0ff6S9/VEQmYsx/GU6aLQKdhOrWTmVzyi/MQcRD4KFxEjuInbwB93vzvQEnBAY+TG5N3/5B+cpwfi39VHBlJxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32Pp2i/fE7xl6+3F/KKdbRF1vHZJbvWWeAtQMbo9pNA=;
 b=DQGU1es1YQW3zx7zHRwI0xHxtImFgrETM+Wjvc7kgnkNephR+L8cHsoxtIO/Xl298/cVd+y4ccw1is4s6N7N/xwU/JlLcdkvHW6aSi6iLjhERmsBR+49azWedlCeq0JngOVOFLuFt6AHoKW9phiVDeI1bZwKP8Erc4Gofh0zUJI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Thu, 18 Jan
 2024 00:39:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 00:39:52 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4A=
Date: Thu, 18 Jan 2024 00:39:51 +0000
Message-ID: <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
References: <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
In-Reply-To: <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7365:EE_
x-ms-office365-filtering-correlation-id: 7589d7f6-f17c-47d0-6ff0-08dc17bdfbc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZWz8+D98Wbx+8NtLHLCNQ5TFdnqAYtSNek9+w8oS/iUFbgAxn6tVKaoB1uZ3DByiujrlwv39PKQCPBuyrmINt1BFPFAz0aM4EbhUxJChM/M1j5n9KxIj3k+t3lxSww4W9OYJmgr8Xy+hNHxmuSMhezCbzdbWD+JzZIL+2Ggmd79x/jSrc2zZWQFx1oOvgivKypyR0JT5aFNKMmXhbQFUEM8xILqL/qHLcfY76s3cIJJZE414mZEcE3FEUrDqBBuorByi19r+9z1ud7SzBL2SM+IOUQRvcKyqv3wp6sj7N/JZyv/gcKb63PzaHeldJ4vky5Cuvp8IvbLWttfHIGO7l6Wmkrav5OWQszsSWNyKhg6usH7HHLfL/qXKIMG3gktWJhxpC2WHb6Lx+ZNyr7vqiyK8J6kLxDu/qBFX6J3X/IQlQ8t8/M+b81VvT+7u6FrW/5tfCxkLk9GL+hwvjrxPdlIkxCYjg6HBVnu824f6kJ6RPkV1Ae4ACe21bMBFg0Gez8kf4pBrDbZqWxJm/s15Bn21YimpmGDp1AymUAPmvKTDSdrj4fU/xL80OcIRjJlRsYuKYvpE27dFGx/WPDb7MV4Nt8Dmohi8IQvtxQayw38=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(966005)(6486002)(38100700002)(26005)(83380400001)(1076003)(2616005)(122000001)(8676002)(4326008)(7416002)(6506007)(8936002)(64756008)(478600001)(71200400001)(54906003)(316002)(6916009)(66476007)(53546011)(2906002)(76116006)(5660300002)(66446008)(66946007)(36756003)(41300700001)(66556008)(91956017)(86362001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NnpuSjBkaXc3QlVJSU04QWdYWUREYlJGeFk0UUF0Vmc1V3NpZXlFUXd2N3gy?=
 =?utf-8?B?UFBmaVpob01mTmxaRHhIOG41UG9vUmR1OG5xb2dFdUI1QmNUN1JjZ3NIK2k4?=
 =?utf-8?B?bXVaZWdqVy85L1Y0bnV3eDBKUWg3ZWg5Q2VoZGpkSXIwNDE0MENjUHZZZGRN?=
 =?utf-8?B?V3pZQktpempQOTBtcTgrd25JL0ZtR3dNa09aZ0NCY2ozNzhST1QvZnA5TEpP?=
 =?utf-8?B?bXVOc2d1WFRqTWJHKytQbnJQUTN2bXR4SnBEUEJIWDdUSlEyaXdnRmEzOWtS?=
 =?utf-8?B?eW5WaXY1VzEzdEhrRzdpQ2svbnR2RW85K3hzTjNHS0dLTUU3NGEyK1JTaVJO?=
 =?utf-8?B?b0FyZlZWTWhzdmVLeWIvNGlVMk5kOVJLcWxLY0ljS25sNmdhT3RyQlRiVitw?=
 =?utf-8?B?MDVkR1VNZGM1NnBWckt5cHhJQUpPMUpHdDhPbzRLZXM4cWZ3eXA2REhVMXhl?=
 =?utf-8?B?d0h4S0N0am1ML2NKRnVPOXVZS2FDM1hSaXkwb2NWUlkvSC91bDhNYjV3QWg0?=
 =?utf-8?B?SGNidndNdnBRVGZ2UkxJTnVjQWhua3dHaDdjb1YvejJHNzM1MlVDWVo4MVo4?=
 =?utf-8?B?MVpTRC9oU2FnNlZLS2QxNEw1UVNJU3kvUXdGdnRWRlJkaWdYSkQ3RzcyOU5I?=
 =?utf-8?B?TEk5Zm9Dd2JHTi93RHpPc1UwQUJiUGh3WXZNOWNEMnk4Q1pwbE45VUdxRjJl?=
 =?utf-8?B?VERzS0tjQVA4TlFRR0c2MFlEUlNHRWVwUG9pL2svRVcxbHdDZm1wNExRdXJD?=
 =?utf-8?B?YVFEcmtqZGx2M0VyYTBJQUpDNVBrSWtLaW5BUG5sZVk1TnMvWDBSZGFXMCtM?=
 =?utf-8?B?L1Z5aVVISzNHbld2bldJRWJpT1JUZnlqMHBrMDZXMXZNVTgvT3lJSmhZcVN6?=
 =?utf-8?B?QTZOVFZoeHcvV0RvMVJKUWJiSmllMmpFSXpPMy9CMnM0ZXMrbGRmemFZby9u?=
 =?utf-8?B?WUc4M2o3MmNGV2l3UTRLd2NOMnF6TW1mL3lHRTF2aGRENVVqaWdDNC85VDcx?=
 =?utf-8?B?T3RSbnppSllzMUlsZGtNQUlPcTJ3dnhZRi9hbFBmN0JHQ3h6a2hYbkhQUHEx?=
 =?utf-8?B?dWlpVVZPWlNrRnduVXpJTVJDUDNrd2tqdGdxbDVmTklBcE00RVZRNHRzYWc3?=
 =?utf-8?B?RXAzTWtBSG0xWjBWdUpmeEpiYmVsZXlpTzQ1UjFUQkNtUkNHR0t2U2dHaVlQ?=
 =?utf-8?B?ZUpRaDhjek9WR3BGNkpldWx1ekRCK2poSS9UMnpCN2VYSm54R0poWVYyNSs3?=
 =?utf-8?B?UnpyUDN0MUpqcUgvRXRESkdwODc1amQyelRObEtIOTR3dS80V0daL1I0b3VW?=
 =?utf-8?B?M2grYmpHSXlBaWV5OVV4ZGxHdW4zMk50b25sMHl3Y3FzQkdiWFc4d0puSFR5?=
 =?utf-8?B?Q280ejV0U09WeG85ZnRkWitHQU5zMkJ4MjNBRjJSRjNMQjBMazRwemI5WEtv?=
 =?utf-8?B?TjZhVzVyNXJxYzVIU0lNKzBtU0dhZHZVR2FkeE5sck9YT1Z0WEJYWk9yOFRL?=
 =?utf-8?B?bzBwWEZ1cjFqckZMV1dyRUgyZnVWNitSTXh2c0sya3h0endtWUtrY012eC9O?=
 =?utf-8?B?L1F3QkxERURCbGxwTmZuRUp0MVFQSGxaeFZEVVE3dUpCL2tjTzlFdHZ5dk1L?=
 =?utf-8?B?US9wNzk2LzJGUFVlZHBsU3RwWDY1SW1yNGtXa3kxa1Y1MmY3MFozcU1qSFE2?=
 =?utf-8?B?emcrZEN2dlRVVmNhU3RzbHhEWFdZdnJ3WWkxa042OXVJazc5N3hEVzh2OENt?=
 =?utf-8?B?Y3lWVlRxTXVseU1MQldHU1pZUmtBbVhhN3Y3ZXBPcnF1OGp0c3E1NmV2Y1U1?=
 =?utf-8?B?aHErbU9rbHdrcU9EWjJFcGUvRWZZT3BxNm40YVgyTmM2c2p4SFVwQ0Z6VjdU?=
 =?utf-8?B?b3VVOWRwa3o0TllwaGpDb0J3UWtJRm9LQXZDVGFHbHpDdzVaNmYrLzZkZHFj?=
 =?utf-8?B?VUZYcFg4anU0ZGU4NW1jU3VqUHNSOUFoTlJETzNINjZ6NW9JMmc0cnZubTN6?=
 =?utf-8?B?RCt6RjcvcEI4aEFDRW16SFowNnMvTUFrcFVGWXY5Mlp2WWZ5QmxBUEFQQTZF?=
 =?utf-8?B?dmg2UWtzQjduS21yQWloVWkwanJ3SEpXb3ZSSHFoVkFpQy9ua1ZJUk1zdERv?=
 =?utf-8?Q?Pj/NyGeSGLxyRb9d/pnbzVKI5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17F487BADE8CF9409E10515874321A88@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EuBpm+z+4AAzCPFJ3FEAfKJgmq1/48TjGb0EVoYcGjcCbbumIdqqAU/FhK0lZNLv1C95KDpfHhIvymRKoj3IWT0Mf3CgfYAr0qCACIme0rXCnPRKi50YDohO0nzN/KXJr7ZF9dj16eqHTuFzAgIlpM1HqdwDqwi6rHHwRMeXShEvNyJB+Z5zv//Urjoi47RdEqwImi+rmznt8/JTAQH1i+4Y/8PnZXQmwWp2HAMw2g6Wp0WZkTjTPZ1zex0uTXQTiL2k8nADwYtvSmGQDPizAYOVaRh3YcWnclRPGhUI+L+syG2IpLP6xxkHLNZhC1aGff6OA4991iF0J9p3HAOZvCENTOowQCDd3lhFflFG7Dkq/Unl1iittV88111hvHkRkIZ1Upqh07AlTYnyzp0hk/rcvmtqDnYQjKVMK/5jGTnYyiv6/g8OAQLcsBnJJM/FT3JbdeY48plnmBU67OnFnwjwhYTxr1/U+1xS1raZ3T265x0hdqHI+qRDcO7LqADmf9hAZnxeMeFUQ4+IFBthPPnvbxbp2MMjQmG/dtVrK2F/Sm0/1vS8g2M2cHa4YgXtBMtWfNtL+VM6LrL0Hrg+T7auJd2j9/6y4EjWuZgv2o+UX5/nLwra2frHmd3XJXpL6ODwHczmRJJgjj1UdPh7HQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7589d7f6-f17c-47d0-6ff0-08dc17bdfbc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 00:39:51.9586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSSt9Crr4IS2xraBam2Rpt/NfGoKwg7NXz6wQlGDPz3rPc3QZsak4Wtyhl6LFIAFCp1XJIonYZRA7QP2KvcOmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
X-Proofpoint-ORIG-GUID: jiDOYeBDhHLZBCFuu-V0m6hwvJoTo7jl
X-Proofpoint-GUID: jiDOYeBDhHLZBCFuu-V0m6hwvJoTo7jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_13,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=734
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401180002

T24gV2VkLCBKYW4gMTcsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAx
Ni8wMS8yMDI0IDIxOjM0LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiBQbGVh
c2UgY29uZmlybSB0aGF0IHRoZSBTVEVBTSBERUNLIGlzIHNvZnQtZGlzY29ubmVjdGVkIHdoZW4g
eW91IHB1dCBpdA0KPiA+IGluIHN1c3BlbmQuIFRoYXQncyB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgZHdjMy4gSWYgbm90LCB0aGVuDQo+ID4gaXQncyBwb3NzaWJsZSB0aGUgYWN0
aXZpdHkgb3ZlciB0aGUgd2lyZSBjYW4gd2FrZSB1cCB0aGUgU1RFQU0gREVDSw0KPiA+IHNpbmNl
IHRoZSBjb250cm9sbGVyIGlzIHN0aWxsIGFjdGl2ZS4NCj4gPiANCj4gDQo+IEhpIFRoaW5oLCBh
cG9sb2dpZXMgYWdhaW4gYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgdGVybWlub2xvZ3kuDQo+
IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHNvZnQtZGlzY29ubmVjdGVkPyBEbyB5b3UgaGF2ZSBh
bnkgc3VnZ2VzdGlvbiBvbiBob3cNCj4gc2hvdWxkIEkgY2hlY2sgdGhhdD8NCg0KVGhhdCBtZWFu
cyB0aGUgZGlzY29ubmVjdGlvbiBpcyBpbml0aWF0ZWQgYnkgdGhlIGR3YzMgZHJpdmVyLiBUaGlz
DQpzaG91bGQgaGFwcGVuIHdoZW4geW91IHB1dCB0aGUgU1RFQU0gREVDSyBpbiBzdXNwZW5kIHdo
aWxlIGNvbm5lY3RlZCB0bw0KdGhlIGxhcHRvcC4gRnJvbSB5b3VyIGxhcHRvcCwgeW91IHNob3Vs
ZCBzZWUgdGhlIERFQ0sgaXMgZGlzY29ubmVjdGVkIGFzDQppZiB0aGUgY2FibGUgaXMgdW5wbHVn
Z2VkLg0KDQpJZiB0aGF0IGRpZCBub3QgaGFwcGVuLCBjYW4geW91IGNhcHR1cmUgdGhlIGR3YzMg
dHJhY2Vwb2ludHMgdG8gc2VlDQp3aGF0J3Mgd3Jvbmc/DQoNCllvdSBjYW4gZm9sbG93IHRoaXMg
aW5zdHJ1Y3Rpb24gdG8gY2FwdHVyZSB0aGUgdHJhY2Vwb2ludHM6DQpodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kcml2ZXItYXBpL3VzYi9kd2MzLmh0bWwjcmVxdWlyZWQt
aW5mb3JtYXRpb24NCg0KPiANCj4gDQo+ID4gSWYgaXQgaXMgc29mdC1kaXNjb25uZWN0ZWQsIGJ1
dCB0aGUgUE1FIGlzIHN0aWxsIGdlbmVyYXRlZCBhZnRlciBzeXN0ZW0NCj4gPiBzdXNwZW5kLCBj
YW4geW91IGNoZWNrIGlmIHRoYXQncyBhbHNvIHRoZSBjYXNlIHdoZW4gcGh5c2ljYWxseQ0KPiA+
IGRpc2Nvbm5lY3RlZD8NCj4gPg0KPiANCj4gQWdhaW4sIHdoYXQgZG9lcyBpdCBtZWFuICJwaHlz
aWNhbGx5IGRpc2Nvbm5lY3RlZCI/DQo+IFRoYW5rcywNCj4gDQoNClRoYXQgbWVhbnMgdG8gdW5w
bHVnIHRoZSBjYWJsZSBjb25uZWN0ZWQgdG8gdGhlIFNURUFNIERFQ0suIFB1dCB0aGUNClNURUFN
IERFQ0sgdG8gc3VzcGVuZC4gQ2hlY2sgdG8gc2VlIGlmIGl0IHN0YXlzIHN1c3BlbmQgb3IgaXQg
d291bGQgd2FrZQ0KdXAgcmlnaHQgYXdheS4NCg0KQWxzbywgaW4geW91ciB0ZXN0LCB0aGUgY29u
bmVjdGVkIGhvc3QgKHRoZSBsYXB0b3ApIHJlbWFpbmVkIE9OIGF0IGFsbA0KdGltZSB3aGlsZSB0
aGUgU1RFQU0gREVDSyB3YXMgdGVzdGVkIGZvciBzdXNwZW5kIHJpZ2h0Pw0KDQpUaGFua3MsDQpU
aGluaA==

