Return-Path: <linux-usb+bounces-5612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687A8418FA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 03:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF5B1F25098
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 02:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2713208AF;
	Tue, 30 Jan 2024 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bLLcYT90";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QlwxK9yX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VEzCBo3V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC958364BE
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706581095; cv=fail; b=Hq6EV53CrmmPtz/OHUrZ0y+6IYB0Xi/xmfCFmw9urDFg1g3Siy7p32y4t8XBCS+cJzJfAuoIxSmGdqGH5k7m97dfiaJBYeIvOufEdetW8NXBEOymGTAfwY9UjzAcRqOaUI39g6kFIUJ02Y/wJLJalE+Vc/A1CFqILdEZ38Wnb7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706581095; c=relaxed/simple;
	bh=rOT/HJG4O7OX/nIeikqvnUGObJ412DEV1EpNEZhM7/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MP5Bj6qlgSigGuH9oa05SsxcfPEkDM8bEwUL3EGpAR8/WFE70CoIu1ounB5bbDvqyLysWdTqUk/ekZJ78Xg+LOmn6W2KktYQaiMpVW+8DZbmr9mF18cZxi74HKo3Nd2+Xv5OsbKGrSQkQ3jEG4XFKvpOF9IrFPvqutlkci+xiJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bLLcYT90; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QlwxK9yX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VEzCBo3V reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U0OMLG030319;
	Mon, 29 Jan 2024 18:17:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=rOT/HJG4O7OX/nIeikqvnUGObJ412DEV1EpNEZhM7/k=; b=
	bLLcYT909BqXbMCTqoNacWZ/Lgubdi6JSi/HB2hqa/f087PfQzrCbR3/8PmWbJjz
	1VDMWnhMTsl/vy7tFRSbaeo4KgYHZv760ky/gNe443N3db53Dt5vkLT11dveijM2
	Jz08o1qrvnPztUp+WJQBdtqCktwNDnkmhNF5nyWSGzixqLUPG+fSoZw4pgYZbGgx
	fLP2zhfKc53/PmjIupAKFlUWmf8p5TKtuQtghyYZ1zhZpWk+3Wo6LL5TOHjgCZD+
	sk+RdyKkq1gqqjJgL7l87OgrU8oJeQKBSmE7yO/G+9NCEsSUrW4TaUSq6BXLmkJk
	TwhFUUnvaDeSE8f7Kh1i2A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vw1y697xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 18:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1706581043; bh=rOT/HJG4O7OX/nIeikqvnUGObJ412DEV1EpNEZhM7/k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QlwxK9yXfEbpNMEnZfRBsmTt5dILxfiSAYtb1CKyRyEoWutdLcP4VopTq/yOggb+j
	 674kb8lcGN27ajCS/AwP804oBXwoK84AJ6+GagWq/KYQ0u9ncqUCXwMPve01s3h6NZ
	 A1nlFDgmQCJaiB2LiwCqnbRcYB5DuK60EnwIBr0Lm38pGZT9CZ0M+HYSkEptF5XxqK
	 vX2b/uZkyGxR4Tk3nkKI/IsEiubpGyEAKvzuuRY40OVaDPmRiCFdhK1q4iAk3vWQId
	 daL2ymHjwH5yQt5Q3O0Skal4BY5xYgi/zlFotbEVIUrMNN7Mf18OSd9LW+mnk9ejud
	 8L0wOdmsoHucA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3297F4035A;
	Tue, 30 Jan 2024 02:17:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B4A89A0062;
	Tue, 30 Jan 2024 02:17:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VEzCBo3V;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A58B2401C2;
	Tue, 30 Jan 2024 02:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn52xK0ZpRCF4P8so6unPIilVqt4eGb9+Q67Hrj/FNcfJq7F5ASGm0Amq5Wbri+R07zLbWpzG03Pt2vxCTeCcfHZl5UGjr7f72tbUJHEf9Elfxn9bScyDCW+qGc2FwdB2rXclPhCR5XACMDYh2Gs6Q4RLgHfWeDpcA3eDTezEcNqvW84ch03ScvMfIm1a0JJXimufURQpnEIhRiqWh1ui3B6Xl8r3uAlBWsqjaiu5339Jq5A5yvk6ZHMxqOEzt2NO4PdrhyYpLh/KEWKzjqtc09MxliMngn5pUQ5Z56NilwrSb6ASIu9cIXuoEIwcFvapJ6DJ6hJcLfW7lPFYcOC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOT/HJG4O7OX/nIeikqvnUGObJ412DEV1EpNEZhM7/k=;
 b=Cd0Fh+rW5jHCm1lUzvgRsKn4xrtSCb+AdZgw+AAMtoNBPFQjeY8O7Kd9kRh7joEe+d6mtP73yb0KPkY00VF9shdi0jbT6sb/VMqc4PKjbiG0QJhue6JFCk7renW/Yi6/kuezZq2Z3LQlA5BCDAKRcWKzj4MuPtDAJWMCwE92AM5vNk6B6yQBo0wg7oUtNu5ENXBX+nKwojVu2IOzIS5k/o2WExJH5b2sQ9/6ZxtEHcn6Wcdt10jdz9iYcnCi2oZTFvn43oRbzLx1NXtIsU6axeKc9WItVg+mNwg4N92MOqAG2b7xH7FlvjsxifEV5j96FCTsopPelN1rd9f2yQAXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOT/HJG4O7OX/nIeikqvnUGObJ412DEV1EpNEZhM7/k=;
 b=VEzCBo3V93KjJi5NB6f1q6nsIHxEuLbMqKQwry2wchQgIUJZXioMxBfaTBrpOL1ozer8fN+CjLlyA0C+aaIHvaw2Mbr9WftBCn1LUyS8tOdkWLAj5sibQp+XZdBponObwM/HWDLahrPlGHELnEnNGOZxgMJ5l4T8NoPv2CET5yM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8235.namprd12.prod.outlook.com (2603:10b6:610:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 02:17:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 02:17:07 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AA==
Date: Tue, 30 Jan 2024 02:17:07 +0000
Message-ID: <20240130021704.ndbkkyksauku7nwr@synopsys.com>
References: <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
In-Reply-To: <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8235:EE_
x-ms-office365-filtering-correlation-id: 0ef3cf75-98ae-49f5-a74c-08dc21398f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 j0WkeTbBaVLovDPrPAwBIARdrvHFS0kOrWW5k8/IcZD6zKkmHmyL9fE/iR0EwQPK7SXtAXAqYhFY0HMNHFfI2KEvyzHVCwilHapJdwuMfTZ8syvp1/H/+l1MejPy1++mtYNq4kwZ/LH8kCpa2G88wu/3mXUFdOGxG4GijEa9LO9LEjfxzi52O3epgULLPHEEERCqDrvJs5ginUs+Vmpe+dw+gQf0wg3SbKXG2cPvSgS0WxJoIIz3PEXhWLVuC29sU8H4fZq1nnKGfkJW2nov49XlnttqDLw0KlwKcv9RAmZH/odCQttWGlAKYobfWNvgJqkHW8eL6KcnOpa+Z0rZWv0FpM/NOl8a66U/cNXf1bbJLwpGtdH48aCD9BGhotMfDKFj8OzVmPC09LE2z3XSbdtuvRv0VCCD7Mh/SV2/Sb9YawcTPbMmKuUZ/dna9jO5293B4i2AV2dwV6kTLvwQf1R5bi0E7wHjBIdxbVU2XQWui4THDUQ0UK/mXmOZDuKtVsjQJ4pTzKrlQk3j6WWzMABXh9tGZwcI1ACs8q0hDjewRuzVcsyuwMmjo/efcnAm32RNdG3t0CKqVlWHjajjf2VHOI/SNDe2DJ2GEY/yYtyJSkhBrpOkYriRR1CfSfLQIICUoTi4fRUJ2sPExyyOYg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(316002)(54906003)(64756008)(66476007)(66446008)(86362001)(6916009)(66946007)(66556008)(83380400001)(76116006)(6486002)(478600001)(6512007)(53546011)(71200400001)(26005)(38100700002)(2616005)(1076003)(8676002)(8936002)(122000001)(6506007)(4326008)(7416002)(5660300002)(2906002)(38070700009)(41300700001)(36756003)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SW96Q3VzQUhpK2E4d3FxSko1YnA3NTNGekZpcnUvbkpDaHQxdkl6R1VCQWNk?=
 =?utf-8?B?V2xnRlVBMkg4VURXakwxU0drWFJRNkpHS0lrU200TmluQkxydWhMOFVGUWxw?=
 =?utf-8?B?TGNmTksrNFJDY3lpWTYyS0ozclRDaTlzaWxib3hBMnFMd3FvQ2lBUml3U3kr?=
 =?utf-8?B?clBZSld3SjFpNlE0aXo2dmhEUFVVeEpFOUR2N0xPUWEyaHA1cDl3T2VSdVZO?=
 =?utf-8?B?SlNCTDhLRjJyamFzNDVMNXlWbnI2YmRsVlNwZnNmUUdRT0hEQk9kVWQ5Rm1o?=
 =?utf-8?B?UHNOWDdHM3VMR3BFRzgyci8wczJIU2tqMXBKRDROeXNXUHVlcEpFcE5qMlU3?=
 =?utf-8?B?TEkybXlnb1ZsVmJERW0xZGVrZnhWOTg0c09MNmNnSitFallndkpITjVDamVo?=
 =?utf-8?B?VFJsRU9RTCtIeUZWUTdlS1R2ak5kWC9JVkQ0U0VGYXdwMnkwSFNjYStJMEsx?=
 =?utf-8?B?QXRva0RNMFI3VFJGUVBFb0h0aEhTbHIrdzBFTHlOMU5xRkM4ZTBKTU9rQU9i?=
 =?utf-8?B?Wm8vS2RML3dYdGxLNWU4eTg5NktMdGV4cGE0NXFpWW05ZjB3azk0ODNlRHUv?=
 =?utf-8?B?MVdrTlM3Q2NjWlNCbVVCM0dWNy9nSnVwa2RmaHhsdnFJemRndzhsYVJqM2Ft?=
 =?utf-8?B?UEp0TkhMcFpYcWliUWRUS3BOZ3p0YVJDclNUdHNoL25ZeXp2Y3dJOW5aclFQ?=
 =?utf-8?B?UkJvZVhlT0sxdUdlRGZOQmRKZGsrYkNIeTYrS0xaS21JRUhRYk9hWjIxUkNw?=
 =?utf-8?B?QW4zNEs1cHZlcnBmNU90UE1LV2dnQWJaNjY4N2lGNGorNTMwTnpOa2pOSVcv?=
 =?utf-8?B?ZGgvNkxHeWw0L2lzMTM1TTR0WGc0RFpoeXEvVFhVdXdvOC9mNUU0MmtnMEgz?=
 =?utf-8?B?TmFlaGlEeTljcXpiQWZKSmN4WmRpRXdRcnEwN0xySmtNc3FEaHQ1aTloMkl6?=
 =?utf-8?B?MzBmZVRTL2hPYlRCbGcwMVQ4ZWVGS1NRM0swWWFEQWV1cVRiYjZ1djBuQUFq?=
 =?utf-8?B?b3NRb2tnTGl5SjZqdkdqd2UxU3FtSkZmT3I2dGxqVVlndmd1ekVFTksrdWc3?=
 =?utf-8?B?YVhZeXprbDE2ZGU2MXJsYjQ0Skl2ZFFDRExJUk1kSFNuNTU1empvSzJNQkI5?=
 =?utf-8?B?RDZCVmhoSTBVTzRhRTV4WXpOUEZEVStBc0JkdGJMTGNhV091WXZDd21jM1pq?=
 =?utf-8?B?b1ZWS3k5dlZDalBOU01xZktTUnJla1Q0ZFYxSDFmdUlxYTVKU1F6TG9YaEgy?=
 =?utf-8?B?UTgyL0tkbnhzTmhZUGpXRjZZTC9ac1k3QjE3d05FNFZaS2JSZWsya3NVL3dl?=
 =?utf-8?B?Vk5YVUFoUVVxcXJUaExKMnVBUXp2QlVFN2JRTjlhajNEanh6L05tWHFLT3Nu?=
 =?utf-8?B?K0RuL2hsRnV1L1N3bGp1NytvUXFjT1lqQ1ZubG1nRUhDYTN1dUg5V2daWVJv?=
 =?utf-8?B?b053d244Z2MybS9Zakc0R2NJcFhIRG9KQ1BjZWd0aE82SDBDMjlRNDdWYXpJ?=
 =?utf-8?B?L29RRElaMUx2eE9SbFFQMGJlYmtLY2EzTllWQnZCUWVVYlpQNjZybW5Pcyt4?=
 =?utf-8?B?MTh0VFZsbVkrS2o0SmdKb2RhQ0dCN0trL1hib0crNWY1Y2lMZ0RZbFlod01y?=
 =?utf-8?B?d0hxczR0ME9heEphZHdUQS9nSytYaktQNzdTZ0tvaTIrMlhOZW9aaE1zSXdn?=
 =?utf-8?B?Y1UwVjYzQTVBK2tlWW1vbTB1OWdtTCtuQ2pJWFFKWDh5T2QvVzRwRDFxZXQ1?=
 =?utf-8?B?Q2pKbURtVEJwald3NFdIN0tqbGh3MXVHNEhLdGs5QkJEdlh2NmFjZmJVZW5E?=
 =?utf-8?B?aERaS1BYcTQ4TlJ1REcvWGdTNGJPL05iYnEwOVAyYkJPZEFCWDlOcGhDd2VS?=
 =?utf-8?B?MEllODhwUjZjYVp5TkFLRWIyM1J3am1KK1UyVFRIU28rN01QZFlOVFVEOGR6?=
 =?utf-8?B?enVtZTJLQzRmY3Y3bE0wYU1IbkdQMnBxcVlkbXR6b1ZCSVlHZVNrVE1jTndE?=
 =?utf-8?B?SGFlQm9UNHMyaXlLUS9KL21OU0R3dy9XcTd2S1RzZmFaK3FiSnZEL3RuUEp4?=
 =?utf-8?B?bk1IdDVHZldXYWdiK2FNczgvYS9NbisxWG1rbGdmVi84enFXTGZSMTdmdlFo?=
 =?utf-8?B?VG5kdG9qZ0h1anhOb2ZOdkZXWERvMnBjWXhZeGRiaHBFemVGQkJHWjJQa1pL?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B0ACA2ADDE775468E1CB07A8E93E99B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iTYsjvRwTW5o8kqs/CMpODaEQjiITBHzOR6/6zk+RkM3xx28epR7C5G/Oyj7okAy9tOjhAC5Er3sWbcehZYK6t/NsyqPiftBFs/hfpMC4vNIaxIhIZawgIK5S7b1UuWizYz9vqKZ0z1ckMg+oTg4GtQQ4/im+83dEuuWfqQgoB89huOWFZSEaRqdXEeyAySebeEhqbH8R9ogRagpGk7o0vda7gP0OxjAB50Qu9QfxB0cN+j13RrTPtvWtFlzuzTvfiOoIZaRJOSudpXr0NGt45/kURymcUmWEMkWvR7GPnXH56CdzMWglgb9BSeqby9+lInmCZVLGLO4x6cqZNhBMaoHd/X+ycgjYU8/3KFy/un9MsXG7sKyK4vsRY129KyXQme1LoxaipnZanL8PV11w+UBGrBB9jwvlC/jr6tU5DhAtnzTllI/JbSktAXUwJMwNR1sINDCQbpG4Fng1Da045fPv8rhwsAQ9v9aEcG/WUpDbF7rHWY99lAbp1ZtsHWKXh1LH8oZwcwMgErpdkCKsNFELx923GvXjsuwllItJjanKM4M0UE6mpVLmc4NZBCxeM6NnD+HYseDfCOZgL3y+W5kDi3ZaaifaUCBG/fg77lU8FZHC2QssNb/ibtLFpdtPx8tYK0BzRH3gQZyaJN6zQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef3cf75-98ae-49f5-a74c-08dc21398f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 02:17:07.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J42J/v/ROYCVm+9U/irzL3nV+UGx/Xr8fKg1gt0jfJ+d6yFbdulULbc+Jm6F+64mV8VPm5f8EbCG0ntUAZTPqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8235
X-Proofpoint-GUID: hHm07uJ8Md_W2MkmjNfKf92zpfgRjLw6
X-Proofpoint-ORIG-GUID: hHm07uJ8Md_W2MkmjNfKf92zpfgRjLw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401300014

T24gU3VuLCBKYW4gMjgsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBIaSBU
aGluaCwgdGhhbmtzIGFnYWluIGZvciB0aGUgaGVscCBhbmQgYXBvbG9naWVzIGZvciBteSBkZWxh
eS4NCj4gUmVzcG9uc2VzIGlubGluZSBiZWxvdzoNCj4gDQo+IA0KPiBPbiAyMi8wMS8yMDI0IDIz
OjEyLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiANCj4gPiBUaGUgdHJhY2Vw
b2ludHMgaW5kaWNhdGVkIHRoYXQgbm8gZ2FkZ2V0IGRyaXZlciB3YXMgYmluZGVkLiBTbyB0aGUN
Cj4gPiBjb250cm9sbGVyIGFjdHVhbGx5IG5ldmVyIHN0YXJ0ZWQgKGllLiBzb2Z0LWNvbm5lY3Rp
b24gbmV2ZXIgaGFwcGVuZWQgaWYNCj4gPiB0aGUgY29udHJvbGxlciBkb2Vzbid0IHN0YXJ0KS4N
Cj4gPiANCj4gPj4NCj4gPj4gKDIpIFBsdWdnZWQgdGhlIFVTQiBjYWJsZSBjb25uZWN0aW5nIHRo
ZSBEZWNrIHRvIG15IGxhcHRvcCAtIHJlc3VsdHMgYXQNCj4gPj4ge3RyYWNlLHJlZ2R1bXB9LjIg
YW5kIGFzIHdlIGNhbiBzZWUsIHRyYWNlcyBhcmUgZW1wdHkuDQo+ID4gDQo+ID4gUmlnaHQsIGJl
Y2F1c2UgYXMgbm90ZWQgYWJvdmUsIG5vIGFjdGl2aXR5IGlzIHNlZW4uDQo+ID4gDQo+IA0KPiBP
a2F5LCB0aGF0IG1ha2VzIHNlbnNlIHRoZW4gYW5kIGV4cGxhaW5zIHdoeSBJIHNlZSBub3RoaW5n
IHJlbGF0ZWQgdG8NCj4gdGhlIERlY2sgb24gbXkgbGFwdG9wISBEbyB5b3Uga25vdyBhIFNXIHdh
eSB0byBtZWFzdXJlIHRoYXQgdGhlIFVTQiBwb3J0DQo+IGlzIHByb3ZpZGluZyBwb3dlciAvICJl
bmVyZ3kiPyBJdCdzIGp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgbm90IHRoYXQgd2UNCj4gbmVlZCB0
aGF0IGluIHRoaXMgY2FzZSAoa25vd2luZyB0aGUgbGFjayBvZiBhIGdhZGdldCBkcml2ZXIpLg0K
PiANCg0KTm8sIG5vdCB0aGF0IEknbSBhd2FyZS4gWW91J2QgbmVlZCBzb21lIGFuYWx5emVyL2lu
c3RydW1lbnRhdGlvbiBmb3INCnRoaXMuDQoNCj4gDQo+ID4+IFsuLi5dDQo+ID4gDQo+ID4gSSBj
YW4gc2VlIHRoZSBkZXZpY2Ugd2FzIHJlc3VtZWQgcmlnaHQgYWZ0ZXIuDQo+ID4gDQo+ID4gICBr
d29ya2VyL3UzMjoxMC0xMDc4ICAgIFswMDJdIC4uLjEuICAgMTc5LjQ1MzcwMzogZHdjM19wY2lf
c3VzcGVuZCA8LXBjaV9wbV9zdXNwZW5kDQo+ID4gICBrd29ya2VyL3UzMjoxMC0xMDc4ICAgIFsw
MDJdIC4uLjEuICAgMTc5LjQ1MzcwNDogZHdjM19wY2lfZHNtIDwtcGNpX3BtX3N1c3BlbmQNCj4g
PiAgIGt3b3JrZXIvdTMyOjE5LTEwODcgICAgWzAwNV0gLi4uMS4gICAxNzkuOTM5ODM2OiBkd2Mz
X3BjaV9yZXN1bWUgPC1kcG1fcnVuX2NhbGxiYWNrDQo+ID4gDQo+ID4+DQo+ID4+ICg0KSBbYm9u
dXNdIENvbGxlY3RlZCB0aGUgc2FtZSByZXN1bHRzIG9mIDMgKGFmdGVyIHJlYm9vdGluZyB0aGUg
RGVjaykNCj4gPj4gYnV0IHJ1bm5pbmcgZHdjMyB3aXRoIHRoaXMgcGF0Y2gvcXVpcmsgLSBpdCdz
IGVhc3kgdG8gbm90aWNlIGluIHRoZQ0KPiA+PiB0cmFjZSwgYXMgd2UgY2FuIHNlZSB0aGUgZXh0
cmFzIHJlYWRsL3dyaXRlbCBwcmlvciB0byBzdXNwZW5kLiBJbiB0aGlzDQo+ID4+IGNhc2UsIHN1
c3BlbmQgd29ya3MuLi5hbmQgcmVzdWx0cyBhcmUgb24ge3RyYWNlLHJlZ2R1bXB9LjQtUEFUQ0hF
RA0KPiA+IA0KPiA+IEV2ZW4gaW4gdGhlIHBhdGNoZWQgdmVyc2lvbiwgZGV2aWNlIHdhcyByZXN1
bWVkIHJpZ2h0IGFmdGVyLiBUaGUgcmVzdW1lDQo+ID4gaGVyZSBtYXkgbm90IHRyaWdnZXIgdGhl
IHN5c3RlbSByZXN1bWUsIGJ1dCBpdCByZXN1bWVkIG5vbmV0aGVsZXNzLg0KPiA+IA0KPiA+ICAg
IGt3b3JrZXIvdTMyOjYtMzU2ICAgICBbMDA2XSAuLi4xLiAgICA2OS42MDA0MDA6IGR3YzNfcGNp
X3N1c3BlbmQgPC1wY2lfcG1fc3VzcGVuZA0KPiA+ICAgIGt3b3JrZXIvdTMyOjYtMzU2ICAgICBb
MDA2XSAuLi4xLiAgICA2OS42MDA0MDE6IGR3YzNfcGNpX2RzbSA8LXBjaV9wbV9zdXNwZW5kDQo+
ID4gICBrd29ya2VyL3UzMjoyMi0xMDI4ICAgIFswMDFdIC4uLjEuICAgIDcwLjEyNTI5NDogZHdj
M19wY2lfcmVzdW1lIDwtZHBtX3J1bl9jYWxsYmFjaw0KPiA+DQo+IA0KPiBZZWFoLCBpbiBib3Ro
IGNhc2VzIHRoZSByZXN1bWUgaGFwcGVuZWQuIEJ1dCB0aGV5IGRpZmZlcjogd2l0aG91dCB0aGUN
Cj4gcGF0Y2gsIHJlc3VtZSB3YXMgYXV0b21hdGljIC0gdGhlIGRldmljZSBlZmZlY3RpdmVseSBj
YW4ndCBzdXNwZW5kIHNpbmNlDQo+IGl0IGF1dG8tcmVzdW1lcyBpbnN0YW50bHkuIFdoZXJlYXMg
d2l0aCB0aGUgcGF0Y2ggKHNjZW5hcmlvIDQpLCBJJ3ZlDQo+IHRyaWdnZXJlZCB0aGUgcmVzdW1l
IGJ5IHByZXNzaW5nIHRoZSBwb3dlciBidXR0b24gb24gU3RlYW0gRGVjay4NCj4gDQo+IEFuZCBm
dHJhY2UgdGltZXN0YW1wcyB1bmZvcnR1bmF0ZWx5IGRvbid0IGhlbHAgd2l0aCB0aGF0LCBpdCdz
IG5vdA0KPiBzaG93aW5nIGhvdyBtdWNoIHRpbWUgdGhlIGRldmljZSBzdGF5IHN1c3BlbmRlZCwg
c28gaXQgbWlnaHQgYmUNCj4gY29uZnVzaW5nIGFuZCBib3RoIGNhc2VzIGNvdWxkIGFwcGVhciBh
cyB0aGUgc2FtZSBleGFjdCBzY2VuYXJpbywgZXZlbg0KPiBpZiB0aGV5IGFyZSBjb21wbGV0ZWx5
IGRpZmZlcmVudCAoZmFpbCB2cyBzdWNjZXNzIGNhc2VzKS4NCg0KVGhhdCdzIG9kZC4uIG15IGFz
c3VtcHRpb24gd2FzIHRoZSB0aW1lc3RhbXBzIHRvIGJlIHZhbGlkLiBXZXJlIHlvdSBhYmxlDQp0
byBjb25maXJtIHRoYXQgaXQncyB0aGUgaXNzdWUgd2l0aCB0aGUgdGltZXN0YW1wcz8gUGVyaGFw
cyBjaGVjayBpZiB0aGUNCm90aGVyIGRldmljZXMgaW4gdGhlIHN5c3RlbSBhbHNvIHdha2V1cCBh
dCB0aGUgYXBwcm94aW1hdGVseSBzYW1lDQp0aW1lIHByaW50ZWQgaW4gdGhlIHRpbWVzdGFtcHM/
DQoNCj4gDQo+IA0KPiA+PiBbLi4uXQ0KPiA+IFRoYW5rcyBmb3IgdGhlIGxvZ3MgYW5kIGRhdGEg
cG9pbnRzLiBUaGUgdHJhY2Vwb2ludHMgaW5kaWNhdGUgdGhhdCB0aGUNCj4gPiB3b3JrYXJvdW5k
IF9vbmx5XyBwcmV2ZW50ZWQgdGhlIHN5c3RlbSB3YWtldXAsIG5vdCB0aGUgY29udHJvbGxlci4N
Cj4gPiBUaGUgd2FrZXVwIHN0aWxsIGhhcHBlbiB0aGVyZSBhcyB5b3UgY2FuIHNlZSB0aGUgY29u
dHJvbGxlciBnb3Qgd29rZW4gdXANCj4gPiBpbW1lZGlhdGVseSBhZnRlciByZXF1ZXN0IHRvIGdv
IGludG8gc3VzcGVuZCBpbiBib3RoIGNhc2VzLCBwYXRjaGVkIG9yDQo+ID4gbm90LiBTbyB0aGUg
d29ya2Fyb3VuZCB5b3UgcHJvdmlkZWQgZG9lc24ndCBoZWxwIGtlZXBpbmcgdGhlIGNvbnRyb2xs
ZXINCj4gPiBpbiBzdXNwZW5kLg0KPiANCj4gWWVhaCwgdGhpcyBpcyBub3QgcmVhbGx5IHRoZSBj
YXNlIC0gYXMgbWVudGlvbmVkIGFib3ZlLCB0aG91Z2ggdGhleQ0KPiBhcHBlYXIgdGhlIHNhbWUg
aW4gdHJhY2VzLCB3aXRob3V0IHRoZSB3b3JrYXJvdW5kIHdlIGhhdmUgYW4gaW1tZWRpYXRlDQo+
IGF1dG8tcmVzdW1lLCBwcmV2ZW50aW5nIHRoZSBzdXNwZW5kLiBXaXRoIHRoZSBwYXRjaCwgZGV2
aWNlIHN1c3BlbmRzIGFuZA0KPiB3ZSBjYW4ga2VlcCBpdCB0aGlzIHdheSBmb3IgdGhlIGFtb3Vu
dCBvZiB0aW1lIHdlIHdhbnQsIG9ubHkgcmVzdW1pbmcNCj4gd2hlbiB3ZSBwcmVzcyB0aGUgcG93
ZXIgYnV0dG9uICh3aGljaCBpcyBleGFjdGx5IHRoZSBleHBlY3RlZCBiZWhhdmlvcikuDQoNCk9r
DQoNCj4gDQo+IA0KPiA+IA0KPiA+IFdlIG5lZWQgdG8gbG9vayBpbnRvIHdoeSB0aGF0J3MgdGhl
IGNhc2UsIGFuZCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQNCj4gPiB3aGVyZSB0aGUgc291cmNlIG9m
IHRoZSB3YWtlIGNhbWUgZnJvbS4gRG8geW91IGhhdmUgYSBjb25uZWN0b3INCj4gPiBjb250cm9s
bGVyIHRoYXQgY2FuIGFsc28gd2FrZXVwIHRoZSBzeXN0ZW0/DQo+IA0KPiBJJ20gbm90IHN1cmUg
YWJvdXQgdGhpcywgd2hhdCBkbyB5b3UgbWVhbiBieSBhIGNvbm5lY3RvciBjb250cm9sbGVyPyEN
Cg0KSSBtZWFuIGNvbm5lY3RvciBjb250cm9sbGVyIHN1Y2ggYXMgVHlwZS1DIFBvcnQgQ29udHJv
bGxlciAoVENQQykgb3INCnNvbWUgc3BlY2lmaWMgcGh5IHRoYXQgY2FuIGRldGVjdCBhbmQgcmVw
b3J0IHRvIGEgZHJpdmVyIHdoZXRoZXIgYQ0KY29ubmVjdGlvbiBldmVudCBvY2N1cnMuIEZvciB0
aGUgbGFjayBvZiBiZXR0ZXIgdGVybSwgSSB1c2VkIGNvbm5lY3Rvcg0KY29udHJvbGxlci4uLiAo
cGVyaGFwcyBqdXN0IGNvbm5lY3Rvcj8pDQoNCj4gDQo+IA0KPiA+IA0KPiA+IEFzIGZvciB0aGUg
d29ya2Fyb3VuZCwgaWYgdGhlIHdha2V1cCBzb3VyY2UgaXMgdGhlIHVzYiBjb250cm9sbGVyLCBk
aWQNCj4gPiB5b3UgdHJ5IHRvIGRpc2FibGUgd2FrZXVwPw0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNp
LmMNCj4gPiBpbmRleCA2NjA0ODQ1YzM5N2MuLmUzOTVkNzUxODAyMiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtcGNpLmMNCj4gPiBAQCAtMzU5LDcgKzM1OSw3IEBAIHN0YXRpYyBpbnQgZHdjM19wY2lf
cHJvYmUoc3RydWN0IHBjaV9kZXYgKnBjaSwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlk
KQ0KPiA+ICAJCWdvdG8gZXJyOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCWRldmljZV9pbml0X3dh
a2V1cChkZXYsIHRydWUpOw0KPiA+ICsJZGV2aWNlX2luaXRfd2FrZXVwKGRldiwgZmFsc2UpOw0K
PiA+ICAJcGNpX3NldF9kcnZkYXRhKHBjaSwgZHdjKTsNCj4gPiAgCXBtX3J1bnRpbWVfcHV0KGRl
dik7DQo+ID4gICNpZmRlZiBDT05GSUdfUE0NCj4gPiANCj4gPiAgSWYgaXQgd29ya3MsIHlvdSBj
YW4gZmluZSB0dW5lIHRvIG9ubHkgZGlzYWJsZSB3YWtldXAgd2hlbiBpbiBkZXZpY2UNCj4gPiAg
bW9kZSBhbmQgZW5hYmxlIHdoZW4gaW4gaG9zdCBtb2RlIHdpdGggZGV2aWNlX3NldF93YWtldXBf
ZW5hYmxlKCkuDQo+ID4gDQo+IA0KPiBPaCwgZ3JlYXQgc3VnZ2VzdGlvbiAtIHRoYW5rcyEgQW5k
Li4uaXQgd29ya2VkIQ0KDQpHcmVhdCEgVGhpcyBtZWFucyB0aGF0IHRoZSB3YWtldXAgc291cmNl
IGlzIGZyb20gdGhlIHVzYiBjb250cm9sbGVyLg0KDQo+IA0KPiBTbywgd2l0aCB5b3VyIHBhdGNo
LCBJJ20gYWJsZSB0byBwcm9wZXJseSBzdXNwZW5kIHRoZSBEZWNrLCBldmVuIHdpdGgNCj4gZHdj
MyBpbiBkZXZpY2UvZ2FkZ2V0IG1vZGUuDQo+IA0KPiBJJ2xsIHRyeSB0byBjb29rIGEgcGF0Y2gg
d2l0aCB0aGlzIGFwcHJvYWNoIGJ1dCByZXN0cmljdGVkIHRvIHRoaXMNCj4gc3BlY2lmaWMgVVNC
IGNvbnRyb2xsZXIgYW5kIG9ubHkgd2hlbiBpbiBnYWRnZXQgbW9kZSAtIGRvIHlvdSB0aGluayB0
aGlzDQo+IGlzIHRoZSB3YXkgdG8gZ28/DQoNClBlcmhhcHMgd2UgY2FuIG1ha2UgdGhpcyBhIGdl
bmVyaWMgY2hhbmdlIGFjcm9zcyBkaWZmZXJlbnQgZGV2aWNlcy4gU2VlDQpiZWxvdy4NCg0KPiAN
Cj4gQW55IG90aGVyIGRlYnVnIC8gbG9ncyB0aGF0IG1pZ2h0IGJlIHVzZWZ1bD8NCg0KSW4geW91
ciBzZXR1cCwgY2FuIHlvdSBjaGVjayBpZiBob3N0IG1vZGUgd2FrZXVwIGlzIGVuYWJsZWQ6DQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIGIvZHJpdmVycy91c2Iv
aG9zdC94aGNpLXBsYXQuYw0KaW5kZXggYzVkOWFjNjdlNjEyLi43MTZiMDVmZjAzODQgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQorKysgYi9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5jDQpAQCAtNDcyLDYgKzQ3MiwxMCBAQCBzdGF0aWMgaW50IHhoY2lfcGxh
dF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiAgICAgICAgcmV0ID0geGhjaV9wcml2X3N1
c3BlbmRfcXVpcmsoaGNkKTsNCiAgICAgICAgaWYgKHJldCkNCiAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Ow0KKw0KKyAgICAgICBkZXZfaW5mbyhkZXYsICIlczogZGV2aWNlX21heV93YWtldXA6
ICVkXG4iLA0KKyAgICAgICAgICAgICAgICBfX2Z1bmNfXywgISFkZXZpY2VfbWF5X3dha2V1cChk
ZXYpKTsNCisNCiAgICAgICAgLyoNCiAgICAgICAgICogeGhjaV9zdXNwZW5kKCkgbmVlZHMgYGRv
X3dha2V1cGAgdG8ga25vdyB3aGV0aGVyIGhvc3QgaXMgYWxsb3dlZA0KICAgICAgICAgKiB0byBk
byB3YWtldXAgZHVyaW5nIHN1c3BlbmQuDQoNCldoZW4geW91IGdvIHRocm91Z2ggdGhlIGR3YzMt
cGNpIGNvZGUgcGF0aCwgdGhlIGR3YzMgY3JlYXRlcyB0aGUNCnBsYXRmb3JtIGRldmljZSBmcm9t
IHRoZSBwY2kgZGV2aWNlLiBQZXJoYXBzIGl0IGRvZXNuJ3QgZW5hYmxlIHdha2V1cC4NCkxldCdz
IGNvbmZpcm0gdGhhdC4NCg0KTXkgc3VzcGljaW9uIGlzIHRoYXQgdGhlIHBvd2VyIG1hbmFnZW1l
bnQgaXMgbWFwcGVkIHRvIHRoZSBzYW1lIFBDSQ0KUE1DU1IgZm9yIGJvdGggdGhlIGhvc3QgYW5k
IGRldmljZSBtb2RlLiBXaGVuIHRoZSBkZXZpY2UgaXMgaW4gc3VzcGVuZA0KKEQzKSwgaXQgZ2l2
ZXMgY29udHJvbCB0aGUgdGhlIFBNVXMuIElmIHRoZSBQTUUgaXMgZW5hYmxlZCwgdGhlIFBNVXMN
CndpbGwgZ2VuZXJhdGUgUE1FIG9uIGNvbm5lY3Rpb24gZGV0ZWN0aW9uIGlmIHRoZSBQTUUgaXMg
ZW5hYmxlZC4gV2hlbg0KeW91IGdvIHRocm91Z2ggdGhlIHhoY2kgY29kZSBwYXRoLCB3YWtldXAg
bWF5IG5vdCBiZSBlbmFibGVkLg0KDQpGb3IgZGV2aWNlIG1vZGUsIHdlIGNhbiBoYW5kbGUgZ2Vu
ZXJpY2FsbHkgYnkgb25seSBlbmFibGluZyB3YWtldXAgaWYNCnRoZSBmb2xsb3dpbmcgY29uZGl0
aW9ucyBhcmUgbWV0Og0KCWlmIChkd2MtPmdhZGdldF9kcml2ZXIgJiYgZHdjLT5zb2Z0Y29ubmVj
dCkNCg0KVHJ5IHRoaXMgKHRvdGFsbHkgdW50ZXN0ZWQpOg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KaW5kZXggM2I2OGU4
ZTQ1YjhiLi44YTEzZmQ2YzgxM2EgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCkBAIC0xOTgwLDYgKzE5ODAsOCBAQCBz
dGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiANCiAJ
cG1fcnVudGltZV9mb3JiaWQoZGV2KTsNCiANCisJZHdjLT5zeXNfd2FrZXVwID0gISFkZXZpY2Vf
bWF5X3dha2V1cChkd2MtPnN5c2Rldik7DQorDQogCXJldCA9IGR3YzNfYWxsb2NfZXZlbnRfYnVm
ZmVycyhkd2MsIERXQzNfRVZFTlRfQlVGRkVSU19TSVpFKTsNCiAJaWYgKHJldCkgew0KIAkJZGV2
X2Vycihkd2MtPmRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBldmVudCBidWZmZXJzXG4iKTsNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oDQppbmRleCBkZjU0NGVjNzMwZDIuLjM5ZjdiZjA2OGIxZSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5oDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KQEAgLTEx
MzQsNiArMTEzNCw3IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KICAqIEBkaXNf
bWV0YXN0YWJpbGl0eV9xdWlyazogc2V0IHRvIGRpc2FibGUgbWV0YXN0YWJpbGl0eSBxdWlyay4N
CiAgKiBAaG9zdF92YnVzX2dsaXRjaGVzX3F1aXJrOiBzZXQgdG8gYXZvaWQgdmJ1cyBnbGl0Y2gg
ZHVyaW5nIHhoY2kgcmVzZXQuDQogICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUg
c3BsaXQgYm91bmRhcnkuDQorICogQHN5c193YWtldXA6IHNldCBpZiB0aGUgZGV2aWNlIGlzIGNv
bmZpZ3VyZWQgZm9yIHN5c3RlbSB3YWtldXAuDQogICogQHdha2V1cF9jb25maWd1cmVkOiBzZXQg
aWYgdGhlIGRldmljZSBpcyBjb25maWd1cmVkIGZvciByZW1vdGUgd2FrZXVwLg0KICAqIEBzdXNw
ZW5kZWQ6IHNldCB0byB0cmFjayBzdXNwZW5kIGV2ZW50IGR1ZSB0byBVMy9MMi4NCiAgKiBAaW1v
ZF9pbnRlcnZhbDogc2V0IHRoZSBpbnRlcnJ1cHQgbW9kZXJhdGlvbiBpbnRlcnZhbCBpbiAyNTBu
cw0KQEAgLTEzNTgsNiArMTM1OSw3IEBAIHN0cnVjdCBkd2MzIHsNCiANCiAJdW5zaWduZWQJCWRp
c19zcGxpdF9xdWlyazoxOw0KIAl1bnNpZ25lZAkJYXN5bmNfY2FsbGJhY2tzOjE7DQorCXVuc2ln
bmVkCQlzeXNfd2FrZXVwOjE7DQogCXVuc2lnbmVkCQl3YWtldXBfY29uZmlndXJlZDoxOw0KIAl1
bnNpZ25lZAkJc3VzcGVuZGVkOjE7DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCmluZGV4IDAxOTM2OGY4ZTljNC4u
OTY5NjA1NzBkZTMxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KKysr
IGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KQEAgLTI3ODMsNiArMjc4Myw5IEBAIHN0YXRp
YyBpbnQgZHdjM19nYWRnZXRfcHVsbHVwKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLCBpbnQgaXNfb24p
DQogDQogCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2KTsNCiANCisJaWYgKGR3Yy0+c3lzX3dha2V1
cCkNCisJCWRldmljZV9zZXRfd2FrZXVwX2VuYWJsZShkd2MtPnN5c2RldiwgaXNfb24pOw0KKw0K
IAlyZXR1cm4gcmV0Ow0KIH0NCiANCkBAIC00NjY1LDYgKzQ2NjgsOSBAQCBpbnQgZHdjM19nYWRn
ZXRfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KIAllbHNlDQogCQlkd2MzX2dhZGdldF9zZXRfc3Bl
ZWQoZHdjLT5nYWRnZXQsIGR3Yy0+bWF4aW11bV9zcGVlZCk7DQogDQorCWlmIChkd2MtPnN5c193
YWtldXApDQorCQlkZXZpY2Vfd2FrZXVwX2Rpc2FibGUoZHdjLT5zeXNkZXYpOw0KKw0KIAlyZXR1
cm4gMDsNCiANCiBlcnI1Og0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCmluZGV4IGVlMWZmZTE1MDA1Ni4uNTUwOWIwMzU1ZDU4
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCisrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvaG9zdC5jDQpAQCAtMTYzLDYgKzE2MywxMCBAQCBpbnQgZHdjM19ob3N0X2luaXQoc3Ry
dWN0IGR3YzMgKmR3YykNCiAJCX0NCiAJfQ0KIA0KKwkvKiBQZXJoYXBzIHdlIG5lZWQgdG8gZW5h
YmxlIHdha2V1cCBmb3IgeGhjaS0+ZGV2PyAqLw0KKwlpZiAoZHdjLT5zeXNfd2FrZXVwKQ0KKwkJ
ZGV2aWNlX3dha2V1cF9lbmFibGUoZHdjLT5zeXNkZXYpOw0KKw0KIAlyZXQgPSBwbGF0Zm9ybV9k
ZXZpY2VfYWRkKHhoY2kpOw0KIAlpZiAocmV0KSB7DQogCQlkZXZfZXJyKGR3Yy0+ZGV2LCAiZmFp
bGVkIHRvIHJlZ2lzdGVyIHhIQ0kgZGV2aWNlXG4iKTsNCg0KQlIsDQpUaGluaA==

