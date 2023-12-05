Return-Path: <linux-usb+bounces-3713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B30804400
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 02:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F951F21322
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 01:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4311111;
	Tue,  5 Dec 2023 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qcNA2CnI";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fmr2I+jc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WxaGu30E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0988219B
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 17:24:29 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4JAZn5027150;
	Mon, 4 Dec 2023 17:23:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Xy1hQ3Usi0MkTAx38QRN903ZQ0LFJps5J8kgvcuZw6Y=;
 b=qcNA2CnIRH+RQ4gPy8BiwmAApsYoyKljoDzG2gQy2nymm7sjWm00z1K2cMzbhbnNj74y
 OC3Nxo8ONpC9Rgn9ghgc4bb0VeBsEcicXmhoo3IZbZEi9nXS2ZbxbqLWqQNqsMhP0G8I
 efiDJtZyBN/spfvs1B+bolcNomUV7nK6dBX0QXw4iOsGMteBGjLDBVmXbNvlEJ3BnX8g
 KpV8zMdCgI5wUeumZaF10atVq70Z4Qgd5TdNz4+7p3p3DeSt0jAEHEX0keEUawPclz3D
 h/47V+rYAgOSG2al1DflXnzqXA9SlP8gHSx4mMqv/j5khc46/Wg/kPMB98DmzbmDBkJ3 5A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ur4d1sc7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 17:23:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1701739436; bh=Xy1hQ3Usi0MkTAx38QRN903ZQ0LFJps5J8kgvcuZw6Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fmr2I+jcxfLPAzGo8nUmnDD5NPVEslv7uCe2fPEPd2V/DgJBdOrnzXARt0hOT8zhc
	 Mtr8uTbGhJMFjiaoZhSHQOWvx22t4APIt6fH06pLdj14CHdusolEogHN+hhvtKyguu
	 NAcJyJQ3z8i9AcQFnwkl9BY6A3XS/gDuLdsRSiXQbIoNWfw5RPudbU7PqMlNUBS5dl
	 zeUbJsY5+LFcTmVgZEbAGJs8B4CoSkA66glAvJFxZsPWSDmRPYyhWaNthuRYSR8+Fp
	 /fsCv6/9gXh1J1sTjH8ug0DLO6vbAWmzYQHR72baG2pTmDgC9nGWicNqn5b3MAhUqq
	 PZXDEtCUZo+tg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90A5C40407;
	Tue,  5 Dec 2023 01:23:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E891FA007F;
	Tue,  5 Dec 2023 01:23:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WxaGu30E;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 641344035E;
	Tue,  5 Dec 2023 01:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfp5opT0O1pRvblwYrW0HkTMFlJjzYsJcUVqGnGBbFu5JScrBCipR0WEqdTRvaLzh7BXtDoMXhf6+BFxUTFq2Sqfs/QlM7qlQ30FhZeDlTAoOMn+ABkT8HKvlN3GJVY30TGI1UikK59fUFmaqPZvCg/6CXeiNSXP07xM4F7TIs/bzVk6FEX/WPpLCiWvgsFTSYuLw++eoVe3/sYUYeW/z/dojGCPJgth9b/fJJYDFhiPapTl96PlFMCkQHRMLihvkhqwsdPXcJTDQM4YpMvIVEe7FJTc3ggyNSJVu9Q2e/211lZYxaKh7Y7Vlj74Q/b3tAuDOWiEEriKiH4Q9frjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy1hQ3Usi0MkTAx38QRN903ZQ0LFJps5J8kgvcuZw6Y=;
 b=TtISQh/OFl8vhu/PhRGERjw28Mnc7Pf3b6c952hISegHu+XzQkZp1rZitJH/UC85jCi1kpYAWNDvZ1j6IfYW4mL+NhtO1dcQSA3LMxxhV9JRG/RGhJKy2ecFfbvOqVtB98BzFEwnzV6F5KJZEzOB5yPXl3B6npw6ZfBnVk/vxeB90ynzIZLXxYAW6SeBIQYRKK06Se2IJHMJd/vPzC3QcfnBTipVWl0/BvbuRUB+cdIGEI9kl1IRHox6K6/8rgvSt+xEI4cIr2KEFSfcuvxkWm2S+2E9r+VIyvr8qx1szROgy9pvGP8eeqn32z7TqQJwM42yDl4zTSEKrTT85esE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy1hQ3Usi0MkTAx38QRN903ZQ0LFJps5J8kgvcuZw6Y=;
 b=WxaGu30ECAFmiEUrLi3Ah+UecxEwXzzV39MvXE0+fhXxkgKcn4vhGKdYuekVe0D3VC4kgOTrTnnW2lrkbLDuEMufhcqwzra1x5iq0zQ6pP2WLm5/5MA8rHyH9sSI9i77bay28teO03dErktZi12FVr/3r1FPsd6XUU3V6x9ZLkQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB5389.namprd12.prod.outlook.com (2603:10b6:5:39e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:23:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::4e1a:5b9b:db11:b40e%5]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:23:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gA=
Date: Tue, 5 Dec 2023 01:23:46 +0000
Message-ID: <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
In-Reply-To: <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB5389:EE_
x-ms-office365-filtering-correlation-id: 6447f393-103a-4022-32c0-08dbf530d417
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ojfCZoJ9bmjCncD9o4KhqD/Oo3cT1brWsF5Y1h1xBPEM0PPE6fgYYe8bw6CBFoCz5MvkmHCp3CwNMG/NJV0uMOgnNph21Eyv7lMdbPQEEXVxPkPlVj2Un1zGp35PHVCoPKVhFVQ1WxXHNvfJZ886b4cFtFIX1Bs+3WDeujy7OwW4ivy/a9KqrqWQr/K3QFKVERwy0mjcvQGH3q3sMehF4Yc7rh9aMheGz6uu6WkU1TzROiPnn4j6vXIhrZ19iewjHHSR+YWD4WiLW0BW8FjAYlcsrXytmHFBd3QpkXFuJWQFMgMGVQamcUsg/UiCquqUYnYHA5IvfEBNXzCKhbYX8Ogswl35Oj052U7Dz7miR56oElMiKyn4HBu23TfhlvFafL+p34Ik9jAFMqd+PLlDwgXlapBhu6AnDS9l3VpQCgN4fSZIWtwcYAT0tM0jPQr15CtJY8fAxcxzyQxyEuQZt27dM4Qcwoddd92g4YVRjdthXs2Zpc2KhDTYt51EJp9q3LT7moEZSfhvjN82naDFVLwld5pyjZ9vdpX4CW4t6g4E60t0ws9WQTW+3lzTXXhTqi3c7XADxehPu3YM7C/uYZqBvZ7fTyxfRMarPihJ99Hw3VpGtuA2byI2paZKDbr9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(66476007)(6916009)(66556008)(66946007)(66446008)(76116006)(54906003)(64756008)(6486002)(91956017)(38100700002)(7416002)(2906002)(5660300002)(86362001)(36756003)(41300700001)(38070700009)(122000001)(4326008)(8936002)(8676002)(6512007)(53546011)(6506007)(83380400001)(26005)(1076003)(2616005)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1lLWnVkMVY5bEhxNWovWU1nU2hMcWNxck5MSmpuNXJmOE5iNGtJaVN5cXFQ?=
 =?utf-8?B?T2VLb29NSlo3L04rdHVhQTF1MDRUY0FyQW1hMUxQbGdpRUVWQ1RSTmlTbVJH?=
 =?utf-8?B?R004Ymx2QzRqYWJCaDhELzRnS3lYSW04TkQvK0Vqa1UrWXIxeXNZY3BiYmpJ?=
 =?utf-8?B?dUVDRWJDUytXU1c1NUN3a3FBQlhuN29iVVJjTUVHb3p3M01uWGU0bWpWOWha?=
 =?utf-8?B?ZG14VWNsTWNZTVJkU1g3dHBhVVdKL3RoRVc5emlYUHhqdDZ4NjRjODd0Tzl6?=
 =?utf-8?B?amF2YXNEOFF5djlXRk1FMk4wZ2w0a0MvK2w1cW8vTGhGeDJjVm8yRnJmSGRw?=
 =?utf-8?B?cDhSYWVGY3FVNW94aU9vYWhWb1JaMXJxYlVScEh0aVd3VTVrcG9QR2RjQWJQ?=
 =?utf-8?B?eUNpMlhzK0Z4SmMxR3pLZ1dpQ3FFR0gyY1JXRngzTEh1ZFg0RUovaGhnL1dj?=
 =?utf-8?B?UzFyR2xNUWd6a2g0eEx3RGN2UFRiNDkvTnBJN28rUStTTlBWYW1pVUhrSHls?=
 =?utf-8?B?MDlubjd2Z1Y1QmlMTmFtNTBEK054Q0dYdEVKTVNOVjhwWUtmK2xsa1h6T1h2?=
 =?utf-8?B?Tm1iYUs0d1JwM0hyUWpLQldFM212SDlwcVhHKytqTWtsa2UxUlpoa1dIQXhu?=
 =?utf-8?B?T3dkY3IxamZOUXorcE1uc0FET0Z0czJWOWNuckNuaFpGaFFrcjhtdHlXSmxL?=
 =?utf-8?B?WXNlZGJUbWR3SDFXZFhZcEIydk1uWmRHWmhHaXBIYmFybWZNOC82d2tONnky?=
 =?utf-8?B?a0RZQjNvVndMdmttU2xOekJrYllZUFdvY1lOalZJVVU2YXNBVU1EVmZUTjVY?=
 =?utf-8?B?clk3YVJpTys5cktjVk9ZYlgxS3NYTnFnT3ZwajFLOUQrYTYvN1BpS20xVXpm?=
 =?utf-8?B?YktoTFVwdjZGSmg0dUVqOE5MbDRZZ0VEaW5nelhpajVSYW5WZlJsSXl3TTZp?=
 =?utf-8?B?cGU1SGZuZ2kwcEpaV0dxMFJ3ZkpBa01qUzJOc05FSk5STS9vTlg2aWY2QUli?=
 =?utf-8?B?QVhHdjFmTkpBOFM3NjJHeERNYlBnOWdsZStPYk8zd3ZncTlndlVIdlJRb2RC?=
 =?utf-8?B?ZExQRTZIUFREU0luUnFlL0xaL1RyYUdkZW00a3BrQzFUNUhac3hQUy9IUUZW?=
 =?utf-8?B?dEFlRnJHektFQ1VTOXJaZ0pyeVErWFY0NSsvTWNlR0srRWQ1am5ET3lGYU4v?=
 =?utf-8?B?cm5SVm5tcGZ5MXg3eldMQ3JwTnNZaGRQL3M4Y2E3RnRRYmZlWjBRb2t5YW1N?=
 =?utf-8?B?aVdsZXl6b25rNmxVdDB0VWs3N0NFbEdwc2Z2TUVBT3AyWFZtMEZpSDVIekh2?=
 =?utf-8?B?ZkRnaGdOdVhGZm91aCtwOWJlU25aWlFhTWYwRzJtYngreXUwdFhqTDRTZ0Ju?=
 =?utf-8?B?VVFXUHZ0OGdEbFdwUDgzWXBHZlBLUzZvaUxhMWJYZ0JBd3RZcjE2V3A3dEVR?=
 =?utf-8?B?NXNDMEplUzRFSGJkbFVHUFZNZjluSkF2cWVkeEIxZEc0WkcvUVRVaUZaV2VO?=
 =?utf-8?B?bjZyM002Y0k0b3dpS0Fla0FESzZYa1ZhdkZPNnphTHZHWkdqZVBCc0piSmwy?=
 =?utf-8?B?YjlKeXJ5cFlDd0ZaWXdjcVp1c25kQlF2Y21DTEJoeE56Wkk4MFZYKzI2cGdF?=
 =?utf-8?B?TGhtYjFxWjNBdmJoRlpoVXJZU21NZktCeWpJYm9DU2orY2JPczNHeTdlZmxa?=
 =?utf-8?B?L3FkaWM5bnozcVFIbVJvNnQ5cndHUXB3amx1aTc2OWJDdEJXT0RXVmI5NGs3?=
 =?utf-8?B?ZGdsRXhNNCtkeUdhL2pkSkVqSld0ZTliSWtDWEl6aXcxcStiU1FQZm9RY0Ja?=
 =?utf-8?B?c2IrK2t1UUxFZVBYTzEwR0hDcEhhRUFXWVI0V1VtdlZHMnd2VmRhbUhmWFUy?=
 =?utf-8?B?MG44K0pyZFNLSjhuRVFaYXdERkNRbnBNLzl1MDlvYjRFK1BleE9kUWlxUkx5?=
 =?utf-8?B?d2RDU1JDb05GS3gzUTFZb2JjbEorNjhMaVRuUHFyTnpBZ1VMc21ubWExWitQ?=
 =?utf-8?B?UWRIMnFCUVFHNzlTajduc1ZaSlE2TTRRSEo5S1JLWmdMaTRjTWthY0xPc3Jx?=
 =?utf-8?B?VjYvTW1JVkMyd0Ewak9vaVNMVFEwZUNCWlc0OFRQYjlSS0pLU25iYy9PN2Za?=
 =?utf-8?Q?HB0BeXIgDhZ9vBjM084HnjfAv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E30D3B4054564A4EB41253B72EEC4ECE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?Z2YxSkhPYlFTdUp4cU1NSWJRYUZCR2Z3cHdqWU5VRHdpU1dHS1p4bjNVb05L?=
 =?utf-8?B?cGI2ZlRHT0M1cUhyamdSWm55STEvektsSmlGSTVQMHBoNTVtTG1yUEppdGdW?=
 =?utf-8?B?V0U1bTA2VGxhN3ZtZGxqbm9YTk1PL1hqV0FieHZzVnUwNU4rcmxKb0lJUmpT?=
 =?utf-8?B?bkZqYTFnVS9NS2FkQVVEcGxaREZZc0I0dmVzOXZaRGUva05aNTRtNjRuNmZ5?=
 =?utf-8?B?cm1QeTlUdlZGTzlWV0pvMFhPVGhINTNacXFseTlzRklDRGw4Q0Z4bWVML3VN?=
 =?utf-8?B?c0VIZ3d1LzgxbUFDS1hXQXQ4NWhDRGJFMTkrYzdtbjhpRVNYK1ZHWXdLQVV4?=
 =?utf-8?B?bWZiZm00dm9LK0k1OXdRbzFoa0g0V29wZnVhWFN3VU5Wd3ZDR1hZRWNNd2Mz?=
 =?utf-8?B?eisybDdpODR0NUtVV05QbkRpUjFJdWFyQ0E1NjhhK3NoYzFpR0FwOFVFNmFV?=
 =?utf-8?B?clV5SHU5UTcwdHpFMDhzeDVyejlLcUhPTFV1TmM3RFZwUUJ0RjV3d2gxdkhn?=
 =?utf-8?B?RVA1UjAwa1FhdTVpYmZTVTlZSHVUeGQvU2JKdk96VEFNSHI4ckpSTVRZYnAz?=
 =?utf-8?B?UmtSVWJRZndSUTY3Skl5dEdjVHczSm9YdnhmYXhmZUZvbnFaek1QdlNLUGJX?=
 =?utf-8?B?SFo0Sy93bmFYdExoNVBjY3owZmxHTldCVm9GRGpFU3FGNWhuY2hheU9DSGt2?=
 =?utf-8?B?QlBuWm4wNEk0OU9oZDFHNjVHcFZ0aWpJdVdsT0h5KzZISVNRVi9neHpaYzdT?=
 =?utf-8?B?TlpKd2tTeHdHZHdZSTJ5VGVGTm5iNVJsUjFCWTMwb0o3MFY3d3dSa0RvU0p2?=
 =?utf-8?B?QWQyWlpLOGpyQS82VFp0c0tPQUhZUitSaXZhckN1akFoeVJVUlg5WWRackF0?=
 =?utf-8?B?akFCckIySU9HeXd0d3c2Wm5nSS83d3FtZjBQNitHTmNOa3JXVGdEWk11M0d4?=
 =?utf-8?B?OEl3eTdrMWVaMmhsbWhIMFdlaFpTaUt4aHVxd0Z4aW1mbG5KRHcra2pCRS9V?=
 =?utf-8?B?cHR0MVdLditVcG43WUcvRVc4ZXM2TGhYb1kvd016TW1qbzZiWWoyR2lza3VF?=
 =?utf-8?B?VFN1eXl2cGI0L2t1aFNjK1M3akVYbWczN1kwVXlhSUIvRHprRXlWZ3ZlRGJq?=
 =?utf-8?B?R2VDM0I5czd3eXBJdnpKN2xubW42WWNsTVp6MlpLUXNZUXlSeTNNWlFvbzBr?=
 =?utf-8?B?L2ZzWndBV0JKYzhYM1pLNTgvcmM2VFlwaXZFRUUxa3JMYlRIVTEwa0t1ZUlx?=
 =?utf-8?B?WEd6MURRblJFNituUVJEd0RPaDM2VTF4YmtWZ0tDZ0ZScEZ4Q3JqWGx1Y28r?=
 =?utf-8?B?RWwzcnJVOGRLTU5OQ3BvOXh5cTdYMm9VcCtURFlxQlNwbkI3UlhQNEdhd1B6?=
 =?utf-8?Q?kGoWaronFHSnA57+1GIpxXkO3s9MgYMU=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6447f393-103a-4022-32c0-08dbf530d417
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 01:23:46.8044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SzH28vEMOX+FQ18z8RqSVgx4PcoiHQa89ahl/B4rzi8qDEfF9lUW3WcUuyIKzqcpUawra32kSHY1eRvNK+D3TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5389
X-Proofpoint-GUID: L_kJJ0nX9QWuJ1gFWHR3HIPHLqXYwiwL
X-Proofpoint-ORIG-GUID: L_kJJ0nX9QWuJ1gFWHR3HIPHLqXYwiwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_24,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=587 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050010

SGksDQoNCk9uIE1vbiwgRGVjIDA0LCAyMDIzLCBHdWlsaGVybWUgRy4gUGljY29saSB3cm90ZToN
Cj4gT24gMjIvMTEvMjAyMyAxMzo1MSwgR3VpbGhlcm1lIEcuIFBpY2NvbGkgd3JvdGU6DQo+ID4g
SXQgd2FzIG5vdGljZWQgdGhhdCBvbiBwbHVnZ2luZyBhIGxvdy1wb3dlciBVU0Igc291cmNlIG9u
IFN0ZWFtDQo+ID4gRGVjayBVU0ItQyBwb3J0IChoYW5kbGVkIGJ5IGR3YzMpLCBpZiBzdWNoIHBv
cnQgaXMgb24gZGV2aWNlIHJvbGUsDQoNCkknbSBub3QgY2xlYXIgb2YgdGhlIHRlc3Rpbmcgc2Vx
dWVuY2UgaGVyZS4gQ2FuIHlvdSBjbGFyaWZ5IGZ1cnRoZXI/IElzDQp0aGlzIGRldmljZSBvcGVy
YXRpbmcgYXMgaG9zdCBtb2RlIGJ1dCB0aGVuIGl0IHN3aXRjaGVzIHJvbGUgdG8gZGV2aWNlDQpt
b2RlIHdoZW4gbm8gZGV2aWNlIGlzIGNvbm5lY3RlZD8NCg0KPiA+IHRoZSBIVyBzb21laG93IGtl
ZXAgYXNzZXRpbmcgdGhlIFBDSWUgUE1FIGxpbmUgYW5kIHRyaWdnZXJpbmcgYQ0KPiA+IHdha2V1
cCBldmVudCBvbiBTMy9kZWVwIHN1c3BlbmQgKHRoYXQgbWFuaWZlc3RzIGFzIGEgUE1FIHdha2V1
cA0KPiA+IGludGVycnVwdCwgZmFpbGluZyB0aGUgc3VzcGVuZCBwYXRoKS4gVGhhdCBkb2Vzbid0
IGhhcHBlbiB3aGVuIHRoZSBVU0INCj4gPiBwb3J0IGlzIG9uIGhvc3QgbW9kZSBvciBpZiB0aGUg
VVNCIGRldmljZSBjb25uZWN0ZWQgaXMgbm90IGEgbG93LXBvd2VyDQo+ID4gdHlwZSAoZm9yIGV4
YW1wbGUsIGEgY29ubmVjdGVkIGtleWJvYXJkIGRvZXNuJ3QgcmVwcm9kdWNlIHRoYXQpLg0KDQpJ
cyB0aGUgUE1FIGNvbnRpbnVvdXNseSBnZW5lcmF0aW5nIG5vbi1zdG9wPyBEaWQgeW91IHRlc3Qg
dGhpcyBpbiBVU0IzDQpzcGVlZD8gRG9lcyB0aGlzIGhhcHBlbiBmb3IgZXZlcnkgbG93LXBvd2Vy
IGRldmljZSBvciBqdXN0IHRoaXMgc3BlY2lmaWMNCmxvdy1wb3dlciBkZXZpY2U/DQoNCj4gPiAN
Cj4gPiBFdmVuIGJ5IG1hc2tpbmcgYWxsIG1hc2thYmxlIEFDUEkgR1BFcywgdGhlIHByb2JsZW0g
c3RpbGwgcmVwcm9kdWNlczsgYWxzbw0KDQpFdmVuIGlmIHlvdSBtYXNrZWQgYWxsIHRoZSBpbnRl
cnJ1cHRzLCBhbmQgdGhlIGV2ZW50cyBhcmUgc3RpbGwNCmdlbmVyYXRpbmc/IERpZCB5b3UgY2hl
Y2sgaWYgdGhlIGRyaXZlciBoYW5kbGVkIHdha2V1cCBmcm9tIFBNRSBhbmQNCnByb3Blcmx5IHJl
c3RvcmUgdGhlIGNvbnRyb2xsZXI/DQoNCj4gPiBieSBoYXZpbmcgdGhlIFBDSWUgUE1FIG1lY2hh
bmlzbSB1c2luZyBub24tTVNJIGludGVycnVwdHMsIHRoZSBzeW1wdG9tIGlzDQo+ID4gb2JzZXJ2
ZWQgYXMgdGhlIEhXIHN1Y2NlZWRpbmcgdG8gUzMvc3VzcGVuZCBidXQgd2FraW5nIHVwIHJpZ2h0
IGFmdGVyLg0KPiA+IA0KPiA+IEJ5IGNoYW5naW5nIHRoZSBQUlRDQVAgbW9kZSB0byBEV0MzX0dD
VExfUFJUQ0FQX0hPU1QgaW4gdGhlIGNvbnRyb2xsZXINCj4gPiAoYXMgb25lIG9mIHRoZSBsYXRl
c3Qgc3RlcHMgb24gZ2FkZ2V0IGNvbW1vbiBzdXNwZW5kKSwgd2UgbWFuYWdlZCB0bw0KPiA+IGNp
cmN1bXZlbnQgdGhlIGlzc3VlLiBUaGUgbW9kZSByZXN0b3JlIGlzIGFscmVhZHkgZG9uZSBpbiB0
aGUgY29tbW9uDQo+ID4gcmVzdW1lIGZ1bmN0aW9uLiBOb3RpY2UgdGhhdCB0aGlzIHBhdGNoIGRv
ZXMgbm90IGNoYW5nZSB0aGUgaW4tZHJpdmVyDQo+ID4gcG9ydCBzdGF0ZSBvbiBzdXNwZW5kLCBv
ciBlbHNlIHRoZSByZXN1bWUgcGF0aCAidGhpbmtzIiB0aGUgcG9ydCB3YXMNCj4gPiBpbiBob3N0
IG1vZGUgcHJpb3IgdG8gc3VzcGVuZCBhbmQgcmVzdW1lIGl0IG9uIGEgd3JvbmcgZmFzaGlvbi4N
Cj4gPiANCj4gPiBDYzogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4N
Cj4gPiBDYzogVml2ZWsgRGFzbW9oYXBhdHJhIDx2aXZla0Bjb2xsYWJvcmEuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBpZ2FsaWEuY29tPg0K
PiA+IC0tLQ0KPiA+IA0KPiA+IA0KPiA+IEhpIGZvbGtzLCBmaXJzdCBvZiBhbGwgdGhhbmtzIGlu
IGFkdmFuY2UgZm9yIHJldmlld3MvZmVlZGJhY2sgb24gdGhpcyBvbmUuDQo+ID4gDQo+ID4gVGhp
cyBwYXRjaCBpcyB0aGUgcmVzdWx0IG9mIGEgZGVidWcgYXBwcm9hY2ggd2l0aCBubyBkYXRhc2hl
ZXQgYWNjZXNzLg0KPiA+IFdpdGggdGhhdCBzYWlkLCBJJ20gbm90IDEwMCUgc3VyZSB3cml0aW5n
IHRvIHRoaXMgcmVnaXN0ZXIgaXMgZnJlZSBvZg0KPiA+IHVuZGVzaXJlZCBzaWRlLWVmZmVjdHM7
IG9uZSB0aGluZyBJJ20gY29uc2lkZXJpbmcgaXMgdGhlIGZvbGxvd2luZyBzY2VuYXJpbzoNCj4g
PiBpbWFnaW5lIGEgZGV2aWNlIEEgd2l0aCB0aGUgVVNCIHBvcnQgb24gZGV2aWNlL3BlcmlwaGVy
YWwgbW9kZSwgYW5kIGEgZGV2aWNlIEINCj4gPiBjb25uZWN0ZWQgdG8gaXQsIGFjdGluZyBhcyBo
b3N0LiBXaGF0IGlmIHdlIHdhbnQgZGV2aWNlIEIgYmUgYWJsZSB0byB3YWtldXANCj4gPiBkZXZp
Y2UgQT8gV291bGQgdGhpcyBwYXRjaCBwcmV2ZW50IHRoYXQgZm9yIGFsbCBjYXNlcywgYWx3YXlz
Pw0KPiA+IA0KPiA+IEkgYXBwcmVjaWF0ZSBpZGVhcyBpbiBjYXNlIHRoaXMgaXMgbm90IHRoZSBi
ZXN0IGFwcHJvYWNoIHRvIGZpeCB0aGUNCj4gPiBwcm9ibGVtLiBXZSBjb3VsZCBhbHNvIGdhdGUg
dGhpcyBhcHByb2FjaCB0byB0aGUgSFcgYm9hcmQgYXMgYSBmaXJzdCBzdGVwLA0KPiA+IGZvciBl
eGFtcGxlLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiANCj4gPiANCj4gPiBHdWlsaGVybWUNCj4g
PiANCj4gPiANCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA3ICsrKysrKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+ID4gaW5kZXggMDMyOGM4NmVmODA2Li41ODAxZDNlYmJiY2IgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYw0KPiA+IEBAIC0xMDQsNyArMTA0LDcgQEAgc3RhdGljIGludCBkd2MzX2dldF9kcl9t
b2RlKHN0cnVjdCBkd2MzICpkd2MpDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICANCj4g
PiAtdm9pZCBkd2MzX3NldF9wcnRjYXAoc3RydWN0IGR3YzMgKmR3YywgdTMyIG1vZGUpDQo+ID4g
K3N0YXRpYyB2b2lkIF9fZHdjM19zZXRfcHJ0Y2FwKHN0cnVjdCBkd2MzICpkd2MsIHUzMiBtb2Rl
KQ0KPiA+ICB7DQo+ID4gIAl1MzIgcmVnOw0KPiA+ICANCj4gPiBAQCAtMTEyLDcgKzExMiwxMSBA
QCB2b2lkIGR3YzNfc2V0X3BydGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSkNCj4gPiAg
CXJlZyAmPSB+KERXQzNfR0NUTF9QUlRDQVBESVIoRFdDM19HQ1RMX1BSVENBUF9PVEcpKTsNCj4g
PiAgCXJlZyB8PSBEV0MzX0dDVExfUFJUQ0FQRElSKG1vZGUpOw0KPiA+ICAJZHdjM193cml0ZWwo
ZHdjLT5yZWdzLCBEV0MzX0dDVEwsIHJlZyk7DQo+ID4gK30NCj4gPiAgDQo+ID4gK3ZvaWQgZHdj
M19zZXRfcHJ0Y2FwKHN0cnVjdCBkd2MzICpkd2MsIHUzMiBtb2RlKQ0KPiA+ICt7DQo+ID4gKwlf
X2R3YzNfc2V0X3BydGNhcChkd2MsIG1vZGUpOw0KPiA+ICAJZHdjLT5jdXJyZW50X2RyX3JvbGUg
PSBtb2RlOw0KPiA+ICB9DQo+ID4gIA0KPiA+IEBAIC0yMTI4LDYgKzIxMzIsNyBAQCBzdGF0aWMg
aW50IGR3YzNfc3VzcGVuZF9jb21tb24oc3RydWN0IGR3YzMgKmR3YywgcG1fbWVzc2FnZV90IG1z
ZykNCj4gPiAgCQkJYnJlYWs7DQo+ID4gIAkJZHdjM19nYWRnZXRfc3VzcGVuZChkd2MpOw0KPiA+
ICAJCXN5bmNocm9uaXplX2lycShkd2MtPmlycV9nYWRnZXQpOw0KPiA+ICsJCV9fZHdjM19zZXRf
cHJ0Y2FwKGR3YywgRFdDM19HQ1RMX1BSVENBUF9IT1NUKTsNCj4gPiAgCQlkd2MzX2NvcmVfZXhp
dChkd2MpOw0KPiA+ICAJCWJyZWFrOw0KPiA+ICAJY2FzZSBEV0MzX0dDVExfUFJUQ0FQX0hPU1Q6
DQo+IA0KPiBIaSBmb2xrcywgZnJpZW5kbHkgcGluZyBvbiB0aGlzIG9uZS4NCj4gVGhhbmtzLA0K
PiANCj4gDQoNClNvbWUgcGxhdGZvcm1zIG1heSBuZWVkIGEgc29mdCByZXNldCBiZWZvcmUgYSBj
aGFuZ2UgdG8gcHJ0Y2FwZGlyLiBUaGlzDQptYXkgYnJlYWsgc29tZSBzZXR1cHMuIFRoaXMgc2Vl
bXMgdG8gYmUgYSB3b3JrYXJvdW5kIGFuZCBzaG91bGQgbm90IGJlDQp0cmVhdGVkIGFzIHBhcnQg
b2YgYSBub3JtYWwgZmxvdy4NCg0KQlIsDQpUaGluaA==

