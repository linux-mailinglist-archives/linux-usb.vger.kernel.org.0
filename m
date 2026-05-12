Return-Path: <linux-usb+bounces-37290-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAn+CzmCAmpDtwEAu9opvQ
	(envelope-from <linux-usb+bounces-37290-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:28:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A9518406
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FC683028C0D
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 01:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DD3275AE4;
	Tue, 12 May 2026 01:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UrOd/wPt";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W/s4oJw6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G70q9d51"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504F2236F0;
	Tue, 12 May 2026 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549299; cv=fail; b=TARMFOm6yEhHzFZlL9AQDBUKZcEQV0g9Iv1diHEotSkekpaoe9yrEfGw0qF9qU1fHQOCt98k9B8HL8yWu7UUFtRpUGJ+WhXWGZtGVCEmzGbqJN1OVN5lbhUylsAhB10oi7JFa+O5oMilBPtn+xTKIpahYSFXdMXshYRtGhrs/UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549299; c=relaxed/simple;
	bh=8gq4aVQ01JkshUEDFXibMUlqqOe6HzMfR3CgUTcNx38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n2DBjWkkJIzH+XCReaNCnO/Aj86a+DUgHwdzt7rQgoISDCXPfwX9DkqH/uFGmCk5ZPz623+w6x0lq9Cw59Hw4fF7gfwMb3xi5rqAqMwl23weJl5kcQwMIJGTKdcdNf2vywk27JEIDQ8Miq3zTgXKe5aUm+3qD5OaGdKT4riQYkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UrOd/wPt; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W/s4oJw6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G70q9d51 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BNhP0W2305254;
	Mon, 11 May 2026 18:27:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8gq4aVQ01JkshUEDFXibMUlqqOe6HzMfR3CgUTcNx38=; b=
	UrOd/wPtX5GdPb4zPlB47CK/X9BcNHvA+qR3ae3zruMAdyq3JSEP/sDgyyLksCIW
	knTNfOFMK6r2Upb8oL5IdKPrBgFEqOeYxDI0HMaKKo34kNypMAzrg+ihaxq2kePt
	wTWJBjUTyT+UQaxY/XyXJYsweiK6xs0CPKPEVUt8g7RiHlVy7ctNyiU0cHYr20aB
	C8SdVnMm206oNKpgyuo8K74Ykd9qB6qs90ryNciP3vUYwQTZiTMEu+LER89pXcL4
	6SaeW1YIIBaQWylKX0+6h7vjus6qG5PUWY1Z9wCnQro6bC+4S8wyehGie/kc7nGs
	2xHmzWRmjOTQXtTbxGafMg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4e3nv0s9s5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778549235; bh=8gq4aVQ01JkshUEDFXibMUlqqOe6HzMfR3CgUTcNx38=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W/s4oJw676LBD6wJciPrvcD5WNiEqltzL/NRKAd+Z4hGFUkyEr4EOe4BgehzNJqc4
	 XKoyZcZiUrO7RD2RUycYMBU8EIAWu1ho8NGt2Xp+GnbOImqP5KcE6uFv+ghCnV9CI8
	 WwJ47tAEMzoysrEwkunuwr5uKn0gziyIES+eB6Y72trwwR1Ng7ScWos8bMjLZqHpKE
	 i+Sy8Tu6tqZZfOkWKxEM8GUJyIuND2Va7lLQOcVWE451Ij7uYDMNoEZHhdcThE3D8P
	 eMN+Q7RxoI7vzwbb5kSAaxuz9pm2cIowe6+ZkNXwkCKZXDtb03TWhmqeCRyCqy0MYh
	 1u5iWYUGjLcjQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B374440467;
	Tue, 12 May 2026 01:27:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5616AA00AE;
	Tue, 12 May 2026 01:27:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=G70q9d51;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00303.outbound.protection.outlook.com [40.93.12.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 42E6840147;
	Tue, 12 May 2026 01:27:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc2XnKdHkF7LkB61O2tKdEFfbqaOpjz3epQEdvamkcEF1a/C2dg26U0eNk8RLeq8Ga975ERsG7cUHbKbdeSy7bGgvx2+myE02tx9BsZmnTFhHpobbSiYd6kVf5ZQmxL3LN9JrYzedMYM0MlN3XrhddiYskJVclrXsUotRr1qUXsiZrxBgvixoojTO8O3wa0qTIEuc+Z77kkH+S5gG+tOJm2I7HXMQC3Qc3lFa6oHKIPZR8yjOCpSQGxWSFPwcUFK2f2iWjHjamiFjN/VmkazEMbpbe4aavru89IUFYn7fBmwQWblElTpSrYXtKPgZjxjgmwdagsF9obiCl2l9YjdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gq4aVQ01JkshUEDFXibMUlqqOe6HzMfR3CgUTcNx38=;
 b=Fjxwm+38y4nUbtz3RXDTsaHcjxK19w195ns1+1ZCId6adHSY4Ioh0W/HLwh5L1Fr+Bd8KaYgPfEKKke3kEG1tjxiKN1s4KDZ6d28k27BOxT/JkEXisT6ae2F8se/zJTVOziCrulb7FKf3cQA6KgjVnm6MK2PXLG3LYk4qBBR9bmzgtqcL6NHLDLZwCZ+64g8CeiYqtCr+C3eJG1qlx8Ofj1LRaoj6e2zdslMarzOryqy2xPYT8LYEhABcb3CmHWSc+ZiThcdT3GLIfWN5tLGCyy6yKNoYPzLR0SOVwpDRsCLqs0HcvBNdfuialLvt9ZHtUNMMbU7nzMARP5aEUTQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gq4aVQ01JkshUEDFXibMUlqqOe6HzMfR3CgUTcNx38=;
 b=G70q9d51B0Q6ovPlvoLjCXT3fIU6gw/RKBIDuwuDHQHQa+QMsFVF5AoBffXCi9FZDivcook725zrXBN0h1MKLwVvlhmYz6j/6ZBOVxzIaFfX1uf/jSxrlIHSQhbYa8em/NsljAv/Xifex2l8NBB92ZCrXGeXuZyA4lwiEv1tMwA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 01:27:04 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 01:27:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sven Peter <sven@kernel.org>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index:
 AQHc3GzqfUjaf13lmkyktxAm9F4Ko7YBqo4AgAC23ACAAHigAIAAU7AAgADfCoCAAL/UAIADxZWAgAER1QA=
Date: Tue, 12 May 2026 01:27:04 +0000
Message-ID: <agKBR1hsbPw_24Ov@vbox>
References:
 <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
 <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
In-Reply-To: <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4495:EE_
x-ms-office365-filtering-correlation-id: f54ba440-be32-4b1f-49df-08deafc59300
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|38070700021|18002099003|22082099003|3023799003;
x-microsoft-antispam-message-info:
 b5TQorHtGTktZGfI+CL2l1Xi55UYTw8yOSgw0Hnvms2y/xXZ821kwK0uv/y5uVyOdmNXchIcA1bqpfMvLtYL6JhBLznzRQj963cHvty/qT0BoxU2vKu/VzDR5CK3ytxLHa2RmwLnd+XVeISPxer9gPKtkPvnnhMUbhB5KnfpgndNXr8ZeV0AZRObWdD7Ze1sOX39+Ino0hWBLV6KCxxDtCZQjqJxHU4PedtMcDYEI3Kobe1Tyjv0P1wEbNqvDDTyQvTlVs6kdMD7/8KzDERfdH/VVTUsDwlvxzoDJJoFf1xMqyzhJiqaE+fxxIlm3hd3oN+L6V/nu13Hg+EEjQIYQQ1iC6H6An8Kwd9ruoSefNKI2sl4x5ZmwV/M2qgiqmA0LX9rxwU7czgg5pdSCJ31ttZQK7ywQS1+tFnRivex6fl6lesL6s8Q4lL2FbhuA2G5W8+SkyJI8Uf5SwaVBXeu0hyoowSxu6NSFb107sgMPzyb58e5kX7Bv/gbZJdHWToO4/o5AwRXJVgYNeM0naVF8A/Zu/bnm90a9f7S2UqWNfQCJ3bhxW8voqq+bXlWrjfieNyHBYtgAd258PyQOjrUfipqf0kCF+nYcG1dzopEkWPBCOoyuHJVlqzMxgen8aS/1GvSY4ywa/lLDfnes3u07sTM/uibshzhob9/7lydYYwBFvV4NDJIaq+EsMKGjJ2BAsybJnEFPZook7mYv2+uxSQXg0e8hpLtrhWU3txTE+PKTSnr+xMzq0VrHYbyCfan
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(38070700021)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE9nNC9uZTcvTEc5aUhoUWptN2RBZ1N1Wm9OZ3N4UFVnck44Vk9EcUdWZXBR?=
 =?utf-8?B?K25hazVUbFd6bVlWU3hMY0xjbnBIell4cVo5SDVHU0lzUmNHNVVteStiQ1FY?=
 =?utf-8?B?UXI3QkdCNWZYYVY1WTdxcjRFYlExSGhGZUIvcmE4TWVacDlqa1dLU2NNdzVH?=
 =?utf-8?B?RUdTUzZRL1p1TnZvcGc4REIyOWxpaUgza3pRMDlzMnplYTAwQ2oxOHY1Ulg0?=
 =?utf-8?B?NU9OTnRwTEd6UU90RFdVUmZqWEFFaUVXcUh6SWlOVFlNVGg5VUpiYWcrdW1B?=
 =?utf-8?B?SE5MVmRwWEpaaUNoa1ltOFpiVWNtaFpxOVBEbjB4VjJYa1NrMER1d0FJZ2x0?=
 =?utf-8?B?ci80WGFUQWxxMG1VNUpsZzY0V2xHMTdaTHkwYVExY29ZN1Y5enVleVhFSlRp?=
 =?utf-8?B?VGpSUnh5RGwrQ1pEMGxMOGpBbi9JN09PaFdLemQ0ZzdSSHdhcXlsL0xxMFkz?=
 =?utf-8?B?a1MyYzg4RFlkQ2ZxL0RJc3JYdm55TUgzVDBxbkIrNmtFMUdXQ05nWGM0OTBi?=
 =?utf-8?B?ZFRSRU53TGp4c00vTzFGaURBVjR5THJjMWJNUDVodFFHUFhFVFV3QW5MR2dh?=
 =?utf-8?B?OWRWN2RCRFR3SHRycGVJU2V2YlpWcVM4SC93MUdDd2JFeCswU3RSUE9FK20z?=
 =?utf-8?B?SWFQSFdmMDVXT08xbGkwK1N2RWdxdGU1d0RGK2pSaU93TGpFcmwzVWFXRWQ5?=
 =?utf-8?B?Y0pGM1Fkd0tvQ1RHYWtRdG9XTjJuUjhZMnJ3aURJWnJocWFidC9PU2pUSTRz?=
 =?utf-8?B?NmZQbDBRalhUU0prUUx1SWhjaHRMbmk4NyszTjRWU0dSUnppWld2R1dRQ3Ft?=
 =?utf-8?B?eW12ckdmTUdJdXdFV3N6Wk1jUGFtVVNoRVdWSXRvbGJ3NmREdElIbHJrSFl4?=
 =?utf-8?B?QnhOMzUzTEk1M05IVG1qQjdkVVB1bzdjbFVsV20rV1FuUXQrTm50TjdiOGdv?=
 =?utf-8?B?UzN5SGJ1eVZLMzR6Wm1LZE5tLzhiRHRhK1JnQ1BZZ3R0Z3QxNGlxRzN5dXp1?=
 =?utf-8?B?dVh4LzRhLzFLSmtONERUbE9VeVR2NFQrVWJPUjY3L1o4d0licWI1UWhaSDM5?=
 =?utf-8?B?Q2tlNkpZbVYrcE5UdVpKaU5DbUdRTUdydEpHOEExWVlNOWtrU1VVQUNhdUNE?=
 =?utf-8?B?REY2QnIyUWNIWTg2UTQrUVM4Zk05d2NLczdjU2dqWGRoMUVQN0RJNkI0OCtO?=
 =?utf-8?B?QWFYd2dlUi82a1ZNT3lOd3NqVkFySUd5Z3p0T1EzWmMrTlNqMERNVHlPYXds?=
 =?utf-8?B?Mzh1dTFLdk12dmJ3bE1PV253L1I1K1g3R1BPbnhvcWhaZytMYW5KalhvL0FH?=
 =?utf-8?B?aUVUbFFnYlkvQlZYOEp1NEZ4UTVyQ3k5QzVrQXRERmVkWDJYVVBUZi9kdW1o?=
 =?utf-8?B?alRjdlhkdk5ycEtGV3FXTlRwdW5KMTJnaGRNSzF2VjJDWDZkQzRkUWtSTitT?=
 =?utf-8?B?YzdQT1dTc01vOEVJVGhiWUsvVHRpamZNZjJ0K29pbDM4Yncwa0dKTUJDVlpt?=
 =?utf-8?B?c3FOVGQrK09jVFo1U0R3OVljSCs5dXBWeE1MZE5uVE1xWWlaZmZGM1NwMkVL?=
 =?utf-8?B?YmhITHBENTNqa3FBbjU2b1o4UXNSQ0xrWG5GdXgra2dBWFhLN0lqakJQYlhI?=
 =?utf-8?B?SWM3NTdjaUg0RnFaalg3NHRyUXhuSmc4T1llejRmNmJwRjlsdWsxcW1IVnpD?=
 =?utf-8?B?Um9qOE1ZV0FYSUpLbFVBSEU5UjdUYzlHOGRubWtJR0N0L1hVNUxVdzRBSDZv?=
 =?utf-8?B?VEJCSStSZm5veks3VXJIK0N1UVVvaGVncVB5MUFQSkl2Zk00UGw2ekMwbGRY?=
 =?utf-8?B?TGMrQzVvR2dLNHdkVU9IRm5ub1BESk9hSk11b3NuajlCeEpaVDJnSHBnUVM0?=
 =?utf-8?B?S2V2aWtmZXdBZVduSkFScFdGWXJyMFRpZ3BZNTI4aFloSnd3K3ZTWUFscnRE?=
 =?utf-8?B?OEd2YVJrbm1wcXRaVUtxalhKS2ZnVlViNmhaL1VXQ0tiMlVGZ3dlWUViYUlQ?=
 =?utf-8?B?UXlQTE85OGhTdEZOZGJvdG1pWkVFbG9WTk15Z3pwVWp6dlM1VFdRanoxOWdU?=
 =?utf-8?B?N1ZrWWhQdDFzblZWS2Nva3FER3Nnekh1Z3dVWmYralVIQ0JKMXhoaUcyMHNi?=
 =?utf-8?B?VG85aS9CZVJicUFJZ2lMNWxtUFV1ZFk3d3g2NE9kbXZDTG5jNGUzeUs0Y1N2?=
 =?utf-8?B?Vi9jelZkNVhvU09ZL2RZQUFqazhZR1BhWWROSjl0M005VkZ4M1JuWDQxbGlB?=
 =?utf-8?B?a2szbW1FUXdUcTF4YTIrWk1ZaDdtQXluNGNtL2VKK3E5NVVUWWlRbmhkZG8y?=
 =?utf-8?B?TjVyQ3dKU05hSW9BaHhUWE90TVcvS3JNV2RjUWROSngweUFseHhsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3BA1BCCC0AE7148B5A66BDFE5C9F643@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	oVzxEbAZQv+p1RkRC4gKrHDAqatD4few+VRmIv+9aH0CnMNqV7PWZGya+lxVEK0fHKrw8BcVWgiEAwVtjZ3M8UbF57HqsSVfkfn1WeA3ifVlPP16aSfZNNkK2MMgF3cluY8bd9Ox2RQPumjOmMk16p9FFboiB1XT7k1iIHEq312AaA/QHBp/1JAsXAz+mHd+Rq3GOzgVFGugoqrtluiCwnYMqESYR18FtOT9jPrsDtgxP+F5tZT9+suap126GySY/mm0Bi0X76JWoz15M4x0TrEAWcvnMzQRsx/OXRSz41zyUauSeFVxMrh2tGm0qY0Pwj/rXJBSnmMUQdGnF0jK5w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g+OXxwz5vAg5RINIpPyyl+Ajx4ux3EDLlN5mT++JlIL4ygwtOj3P1JlwsCzbj1U+7YCI7TfVho63Xo91DLpJM55+QTYuscSmKr7oTQRmmjW/8uwgaS4fv7+OI5dguhcQRknavvhNJyBwwEe7o+anTqT2cceifyICmfLwMcp8uYE565Fr0ot8oLgHpaRBAixVv6Jqj8PChDK0pU4U+vkU/VGVFBe9n9AfSqPZR6nxTcZVJ96E02uz21SlvoO+aGHMF2An8vmbKtbYIJqt4+jIXnUOmp/1402WgbnYXHcDaHPjjm4Vruptv1d0eykahbL5JuTTCL45D/j1Gjyyf78A1FgeTpN51rwg77tjGvq4HeW1P631X5+/1KDtmiv3R71fIPDevtiWo4ckgyYelZyDXotEae6Bn4ivna235b26lilKh03L2BTjUZVk85f7HII7ZwrBSj6ctcS8dgJZz9tcRjpF70N5NIz64uOS2jNV94htNWGd3n07xk4oKB5B6ECYex/ywUT62lcg8X8mlVS9oU2GnDjg0LE7XFbMZ3oZmvetoJVRrpPzHuZOAHmxfLQaO4R4183R+nm6j70iLM5PnrCXJUbkJ+pW386K4EkhGlQH4F8yQhoLl+s4yS5TUHcP8YkLxRtu2WYVZ04/orlfwQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54ba440-be32-4b1f-49df-08deafc59300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 01:27:04.2356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rDMmjaflSii5cI9PoT+AZRs8Jh8C1rw0AWyYslmJ4PCRx0seIeybAZkbh95gqi/f6vlpMV7G360KsFpMqws2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
X-Proofpoint-GUID: fg61K9sYNUpzJKlve5yOHkK4BpEH6vYL
X-Authority-Analysis: v=2.4 cv=H+LrBeYi c=1 sm=1 tr=0 ts=6a0281f4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=b8tMqDVNUfNrg11lbl8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxMSBTYWx0ZWRfX61XLUOFbkZOh
 7vOBqMQ5WCM8FG3njEB/eNBEuywXWqqMj3tM0yVL24FKanHr5pW7aTjt8cMsf8Egy4p9AT5Ivpx
 6qgo9R1OeVX2B0TekJwbVrH3ztzxtE+TKDkV1p5m/qzcPcmJ4VFJvJ7dDQS69cmespjrLcwQTMi
 DJ9jYfOlO60Wgy0W2F/0pNPLVWxVXs+KkBVBI1I0/s0JbU9cuiA3Ch44ClWMVrqJdxKQXDeUfA6
 rVv8r6jQtDHpAqSEHS2Ha+3F/6E6MM/3s32yoZ3Qrzz7zNQhHiTBE9xFGxifQ6GwnfkE5oPrVdT
 hMBuqW2em5GBT0eFqMFmPsw4TtH17D5aJKCHCF4jYwdSrxUu12WuDbYLjvuyNmHMONCLuqWP4UM
 FZtQpICWri2FDgO38x1aMnWN0sEhGb5uDToT3w8rNdYWLvXvhKp3Z4iibbBVKrLtjQLjwYbF8j2
 XAi3JBj1ledi/P++UEw==
X-Proofpoint-ORIG-GUID: fg61K9sYNUpzJKlve5yOHkK4BpEH6vYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605120011
X-Rspamd-Queue-Id: 9A5A9518406
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37290-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDUvOS8yNiAx
OjMxIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gDQo+ID4gRm9yIHRoZSBEV0MzX0NJT0NU
UkxfQ0lPX0VOIHRvIGJlIHNldCwgaXQgbmVlZHMgdG8gYmUgZG9uZSBieSB0aGUgdHlwZS1jDQo+
ID4gZHJpdmVyIGFmdGVyIGRldGVjdGluZyBhbHRlcm5hdGUgbW9kZSByaWdodD8gSG93IGlzIGl0
IGJlaW5nIGRvbmUgbm93Pw0KPiA+IENhbiB0aGUgdWRldi0+dHVubmVsX21vZGUgYmUgdXBkYXRl
ZCBkaXJlY3RseSBieSB5b3VyIHR5cGUtYyBkcml2ZXINCj4gPiB3aGVuIGl0IHNldHMgRFdDM19D
SU9DVFJMX0NJT19FTj8NCj4gDQo+IEZvciB1cywgaXQgc2VlbXMgdG8gYmUgaGFyZHdpcmVkIChu
b3Qgc3VyZSBpZiBhY3R1YWxseSwgYnV0IGRlZmluaXRlbHkNCj4gZWZmZWN0aXZlbHkpIHRvIGEg
c2VwYXJhdGUgcmVnaXN0ZXIgd2hpY2ggaXMgdXNlZCB0byBzZWxlY3QgdGhlIHJpZ2h0DQo+IGNs
b2NrIG11eCBmb3IgdGhlIFVTQjMgcHJvdG9jb2wgYWRhcHRlciB0byB3b3JrICh3aGljaCBpcyB0
byBiZSBzZXQgaWYNCj4gVVNCMyB0dW5uZWxpbmcgaXMgZ29pbmcgdG8gYmUgdXNlZCkNCj4gDQo+
IE1vcmVvdmVyLCB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiBmb3Igb3VyIFNvQ3MgY2FsbHMgYWxs
IGZpZWxkcyBvZg0KPiBDSU9DVFJMIHJlYWQtb25seSwgd2hlcmVhcyB0aGUgRFdDIHByb2dyYW1t
aW5nIGd1aWRlIHNheXMgdGhleSdyZSBSL1cgLQ0KPiBwb3NzaWJseSBzdXBwb3J0aW5nIG15IHRo
ZW9yeSBhYm92ZQ0KPiANCj4gRldJVywgb3VyIFR5cGUtQyBpbmZyYSBpcyBhcyBzdWNoOg0KPiAN
Cj4gMS4gdGhpY2sgZmlybXdhcmUgbGF5ZXIgcnVubmluZyBvbiBhIE1DVSB0aGF0IHBlcmZvcm1z
IG1vZGUmUEQgaGFuZHNoYWtlcw0KPiAyLiBkcml2ZXJzL3NvYy9xY29tL3BtaWNfZ2xpbmtfYWx0
bW9kZS5jIHJlY2VpdmVzIG5vdGlmaWNhdGlvbnMgb2Ygd2hhdA0KPiAgICB0aGUgRlcgaGFkIG5l
Z290aWF0ZWQgd2l0aCByZWdhcmRzIHRvIG1vZGUNCj4gMy4gYSByZWxhdGl2ZWx5IHNtYWxsIHN1
YnNldCBvZiBVQ1NJIHByb3ZpZGVzIFBEIGRhdGEgKGFuZCBzb21lIGFsdG1vZGUNCj4gICAgZGF0
YSkNCj4gNC4gZHJpdmVycy9waHkvcXVhbGNvbW0vcGh5LXFjb20tcW1wLWNvbWJvLmMgcmVwcm9n
cmFtcyB0aGUgUEhZIGJhc2VkDQo+ICAgIG9uIHR5cGVjX211eCBldmVudHMgaW4gbmF0aXZlIGNh
c2VzLCBvciB0byBVU0I0L1RCVCBtb2RlIGlmIHRoZSByb3V0ZXINCj4gICAgZHJpdmVyIHJlcXVl
c3RzIGl0IFt0aGF0IGxhc3QgcGFydCBpcyBub3QgeWV0IHVwc3RyZWFtXQ0KPiA1LiBbb3B0aW9u
YWxseV0gcmV0aW1lciBkcml2ZXJzIGluIGJldHdlZW4gKG1vc3Qgb2Z0ZW4gUGFyYWRlIFBTODgz
eA0KPiAgICBzZXJpZXMgdmlhIGRyaXZlcnMvdXNiL3R5cGVjL211eC9wczg4M3guYyksIHdoaWNo
IGFjdCBhcyBhbg0KPiAgICBhZGRpdGlvbmFsIHR5cGVjX211eC9zd2l0Y2ggaW4gdGhlIGNoYWlu
DQo+IDYuIFtub3QgdXBzdHJlYW0geWV0XSBVU0I0IHJvdXRlciBkcml2ZXIgY29uc3VtZXMgc29t
ZSB0eXBlY19tdXgNCj4gICAgcGFyYW1ldGVycyAob3JpZW50YXRpb24sIGNhYmxlIGFuZCBwYXJ0
bmVyIGNhcGFiaWxpdGllcykgYW5kIHNlbmRzIGENCj4gICAgY29tbWFuZCB0byBhbm90aGVyIE1D
VSB0byBoaWdoLXNwZWVkIGxpbmsgZXN0YWJsaXNobWVudC4gSXQgYWxzbyBzZXRzDQo+ICAgIHRo
ZSBhZm9yZW1lbnRpb25lZCBtYWdpYyByZWdpc3Rlci4NCj4gDQo+IEF0IGEgZ2xhbmNlLCAyLiBz
ZWVtcyBsaWtlIGEgcmVhc29uYWJseSBmaXR0aW5nIHBsYWNlIHRvIHNldCBpdCwgaG93ZXZlcjoN
Cj4gKiBpdCBkb2VzIG5vdCBoYXZlIGFueSBzb3J0IG9mIGEgaGFuZGxlIHRvIHRoZSB0eXBlY19j
b25uZWN0b3IgKGl0DQo+IG9ubHkgYWN0cyBsaWtlIGEgbXV4IHRoYXQgc2V0cyBhbm90aGVyIG11
eCksIGFuZA0KPiAqIGl0IG1heSBiZSBnb2luZyBhd2F5IGluIHRoZSBmdXR1cmUNCj4gDQo+IHNv
IEknZCBtdWNoIHByZWZlciB0byBrZWVwIHRoaXMgbG9naWMgc29tZXdoZXJlIG5lYXIgd2hlcmUg
dGhpcyBpdGVyYXRpb24NCj4gb2YgdGhlIHBhdGNoIGRvZXMgLSBJIHRoaW5rIGl0J2xsIGJlIHVz
ZWZ1bCBmb3IgbW9yZSBpbXBsZW1lbnRhdGlvbnMsIGFzDQo+IEknZCBpbWFnaW5lIGl0J2QgYmUg
ZmFpcmx5IGNvbW1vbnBsYWNlIHRvIGhhcmR3aXJlIENJT0NUUkxfQ0lPX0VOIGFuZA0KPiBhbm90
aGVyIHBhcnQgb2YgdGhlIHBpcGVsaW5lIHRoYXQgbXVzdCBsb2dpY2FsbHkgYmUgb25saW5lIGZv
ciBVU0I0IHRvDQo+IGJlIHVzZWZ1bA0KPiANCg0KVGhhbmtzIGZvciB0aGUgZGV0YWlscy4gTGV0
IG1lIGdldCBiYWNrIGFmdGVyIGRpc2N1c3Npbmcgd2l0aCBvdXIgdGVhbQ0KaW50ZXJuYWxseS4N
Cg0KQlIsDQpUaGluaA==

