Return-Path: <linux-usb+bounces-34767-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI6yIV+MtGnBpgAAu9opvQ
	(envelope-from <linux-usb+bounces-34767-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 23:14:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025528A4AB
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 23:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E9F23037904
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 22:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B41383C6F;
	Fri, 13 Mar 2026 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pOFSWlIw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NoMPETUA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hkZ2ANKH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8E175A89;
	Fri, 13 Mar 2026 22:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440087; cv=fail; b=VL4+g8Fguki5rNTyBnWizU0Zj14ixkUY6sSMrrM1OBmJXg0vtDE19I5Pj9C+X1OPvg6Ni97OaZ0z8bXJDwHOWe6mWfIMY2yo/zQm/vG3LZV3c2sIITxvMbMStKbir7yccPK72hKqJkZC4BlmsyzGbFQdJsPQjoqP+l9KXLDtczE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440087; c=relaxed/simple;
	bh=WOpwJ/KAu4q01SoFaCiz5D/vG/EgF8q/YywTCD+9LnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+n508nFVHWSf58r+fbU70oKL9csj4i5iV8w79mHdDY4Xz8qEqaZK0ur03tmtWjQLT0ws4+AT9MWNRZJPUg61d+lOdgXjZKsMb04jCoya6+9IgPFSI/lgV7NIisukyjlZ/XkyKvjz1V1t49qleSb1FzPdaZV+SWM5yj3KrapclU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pOFSWlIw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NoMPETUA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hkZ2ANKH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DMEKxr1113081;
	Fri, 13 Mar 2026 15:14:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WOpwJ/KAu4q01SoFaCiz5D/vG/EgF8q/YywTCD+9LnA=; b=
	pOFSWlIws1vEIsQkczjvXGD2VdSe/IZvyMgLb6dYr/TtqnAWbtUCcRiv6rL/ITJz
	sp1kDeW2V8xWw4XgdXd5B1+nN86Qge9ZaEvN+XZN5Y1qR88krqEndOTFk4jaAAWV
	/R5OMfdVprVQlWhKwsY85/FlBP+caTTlnefay19NST5veOWR2YVLDdFYc3gV95yk
	BMUUmV4V4BoRc0KfAtiw11CTcaBBtoYn+sjKBUD9Tc1DKZFWe2No7WC5vAc00qdN
	Q4Ywx18Z/VX/HYRpT1tN/m4TH1IIcAsfC/gAHwXDt3w5YLGs5e+pydKs63O33NWK
	XSOgnizcBhuxg+w/TBGH4w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cvgnnmj14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773440052; bh=WOpwJ/KAu4q01SoFaCiz5D/vG/EgF8q/YywTCD+9LnA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NoMPETUA4rYOYJnCz+09A4moyX4UTZJ1bGbMlcmcwW5sjCYpDl3l1VSg3WKEzIrmv
	 MYArSIh1UEH2VU1hD+9oJccyL9k0mMS70sCDbhSTDjtk7xlK8aWE5tWTIPeMWeYmJU
	 UF8AQFp6/aApUlGhDsXnJ+lBOC1jCashFY2Z1Rwkqyg5Duf+eeE5MVu9Beysbgc/2R
	 WEpF3PErJqKHE4e0y+3LtkXITfMlRxwXpKxkAtqWG36Q14wmbsdnao7bzUK4iOBlWw
	 6mqP5X0pyg+QfruwR7tjPXyOLTI5Nnt655rSaxuaIVVlljbc9CSMhoeCjkKDhvqFjY
	 Irq+Fp8PcEZog==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FBE840534;
	Fri, 13 Mar 2026 22:14:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 78870A0081;
	Fri, 13 Mar 2026 22:14:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hkZ2ANKH;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00407.outbound.protection.outlook.com [40.93.13.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 90613402B2;
	Fri, 13 Mar 2026 22:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW8H7EPyjn5/1b/3HtwF4MdCapAXCnJOJvcPMZBu4ZB7Fre61DN7AnnKVZqZvt7Xt35OTzB3wf7vlsTvj+iki/n6tkMnrMH0zsEUpCqVl6ExNDCgiYglK2YiNiqmUsNjBKxGTYpWCVJzySi5NPBTKzrIzSZUQr7J81pEE0aR1g4vBnMRMWKlQY0/cZsqkWRvJWf5iVRfmLdXXP9Jr51WY0jNMAYU7cjR4LzcN4Z5UBlNmLwCpz/fNAOtCzjy4YFl2ZoiuGa0u9rKvJbUQXtG5DnVZ3F6YL5z4aaSeTHiNDpExBzSMtnKRZlyUr2iUHaZxr2xAwSmgtYdJ8fOmqi+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOpwJ/KAu4q01SoFaCiz5D/vG/EgF8q/YywTCD+9LnA=;
 b=ZyYhkTA1eX/FLVmo4xfvzMhbjn+LKShtifN8cLE2sb2eZzF1IoT6ZlK0EDNMQSYnAdmyamXvn9t3rDiMy1pR8KInAsuEEwENb7sSfMYJPfRbDUQpkgL9fxlJ/sMdYzjeTGkoOI4j99beb0uAi8BlP0v2ppSVaxn8yFBV5Du5cvLg3dlvQpOpYLeC5CZv7I62DEFiMxBOEvwkslO/P/dIWJVFKOBJe/heu7XKFai9czG29naUqaxqauAw4p/wG7VH2+AP1LoWT6L5p1FEsABq16UirE/ou+CZitndtO2jYwQAXOCgY0ytMgG7q5/3ehOxfjLEOdZWK2FrVdZ8j5ISEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOpwJ/KAu4q01SoFaCiz5D/vG/EgF8q/YywTCD+9LnA=;
 b=hkZ2ANKH10DJHt9v+DbnDuUXCFGWWTQhn0n2QG0ZNPci7Ps+bHTgODt5KzwQ6OBRCRygUxwbx8jzuIvZPdwdENkwgjCij9xN/trV7juScdU0Jt8Ip7cSBJhOqHHQRYovuFafr3vMJwWvAp0RXeb0sPJu6rNfHgTfupWoTYwckdc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB8887.namprd12.prod.outlook.com (2603:10b6:806:386::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 22:14:06 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 22:14:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: grumpy DWC3+UCSI, usb-role-switch semantics
Thread-Topic: grumpy DWC3+UCSI, usb-role-switch semantics
Thread-Index: AQHcsVQ5avbxwV9e70qm5RMQkhVPMbWptdAAgALJ2ICAAIsUAA==
Date: Fri, 13 Mar 2026 22:14:05 +0000
Message-ID: <20260313221402.nk3e5od5qrertyli@synopsys.com>
References: <8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com>
 <20260311192118.hpf6nujgikytngvl@synopsys.com>
 <c9c3cb25-f37a-4270-9f84-f6e4df3ccbd6@oss.qualcomm.com>
In-Reply-To: <c9c3cb25-f37a-4270-9f84-f6e4df3ccbd6@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB8887:EE_
x-ms-office365-filtering-correlation-id: 255188d7-026c-4920-3f63-08de814dd766
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 pubjOXaa/PIE0zDqud87c0Mjl+yiHvbSbMnj3I9gfGkb60n/UCLDTE+eCgVfE4R8Cdwetwo76fisuxVIWena6y6/BqvhzXqFve6flioJt664Y6FJ9lUzKAD0AYsCRsyZghPP5Gv/nedsmcAXU2tQZLPe1yRnsNgtAuP5YwHgNEcCrvsqH0C2EPZLQrrBG/F2ycTLOu/mrcvef6Y5csbw1HjXW/xNR3rB+kOH5mu67EIlalnB2sUUkagzNeMooqNveyFmreuxD45yTpMbZ9oojji6Ho/OkWWw7jPh4IU7yCUeErR/J9dLEYlcKIiAA9vUcN2cXQB3qzW7xqTmJrpHEooZNVLgF3oP4VoN67LCIjtzVQ06kSJUSyRbW2GlBh3QLpCk3V6MpjKOhNzT2lHiHxdKY1jP2oTLcYXKieGPDneqEs7yB6THz4FMIC69tgBD2nr7NZYgfzR82zviIoWPcq4Bjwb6mzh6xYD2mjsZ99tjv4H+S5A7eh/Nxpm6m5x+NvMqfSWVGVgyTBou2PFR+9xg+hlKkDLZq4jkSW+/EsaR5VfZVl6VukfeCbi2cawYQsaJROpEAVOCC7qKRbxdmm21oGmqiQFxvEOjQQEXN9bnW83C1MGvCO53YbBELrcbYEMDOdm85YYnmCXr41HBfWQa8FSwlG02pWwKshErPESoLBVyAQyZr13MWxP3HbNiAy1jn8I8t36ERFFVkkrQcw2NIQYE1zOO3/sScK3b7Rn8llgIFVU06o+XxU3b0lmjIrU95TojuTFyyFEvhEixfClA3/yXifj224AJFSfOLCY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjFacHNITForMjFVV3hIT0ZaWm9VNUpvOGRiZ01hU1Bhdmk3d3QrdzRNaEZD?=
 =?utf-8?B?UTF6RGhRdXFLMnBDMW1KZ0FPY3hEaTNBMkRrYXhYM3Z0TnIrRE50a1h2aTU2?=
 =?utf-8?B?OXRVMEhzT0QwbkNnN0VrU0lGZjJxS2hwQkpvdEZzUWRmUHRrTGIwZGZ5RWNV?=
 =?utf-8?B?N0d6MHEzSFlaOThkYmRyZ2s5eW52cXZLaGwzTXo4cTlod3BzVDRyREx2QmpK?=
 =?utf-8?B?NjY1em92WklUQW5lb1oraFUrZS9JWDdzTjdld1hJdlREM3M4K2VqRFcyQ3FB?=
 =?utf-8?B?STV5cFhiY3g1OU95QXUxeWpnYUZxV1UrTTRtRkl0c0Y0NkVKaFdRWjNsakFK?=
 =?utf-8?B?a1ZKNHVISENhRzN5TnZNYkRGc1F3YkJtTXRDN1EwQ3NIb2l0NU9wU1hIZ1J6?=
 =?utf-8?B?UTJ5U1FjbnBzdWpRbHdhOEFoZ3d0MVluUnA0SjBHd0dBL0lsVXdwVC9SdmZM?=
 =?utf-8?B?ZStzWGdmMnJjdTJSYWYzZ0pabWVvL2FETUM5VHNzMjgwdGVOZjN6Y0MxMjBT?=
 =?utf-8?B?Qmo4US9uQUk5Z1ZYeWtNVFJ4K29jS3dld1g5OGpFbmtZVFlNemhxWVFDc1dn?=
 =?utf-8?B?ZFUwZnBMUDhDaE8wWnZIMHZHZ0xBMVFleVEzb2o2cytJUHQyU1lhNWlqSkJS?=
 =?utf-8?B?YzJpRzdsRUM0Tnc2bjV0cXloUmtLTUhVWUhoVld5amZhT0N1VWUvNzNMdDJI?=
 =?utf-8?B?RmdsNEc5NWVmekY4VERyR3dOSzQ1MVpVSG5yTHZxMXdMb3JHNmxtSXJrL3RI?=
 =?utf-8?B?NHpiVW9EcHZqekVaYXFob0xjRlQ3U1M3T0pZU1NyeWorU1RXWmhYakhEMVUy?=
 =?utf-8?B?eWJDQVh0THNKZUFlNHdkTjd1aWlVN0crUHpHVXA1dloyT0d6OWVZZExXS2RO?=
 =?utf-8?B?UzBGNTR0dExUUzJXSGl1NGQwejc0Mlpma1haemZ4NGs4QU9ReHQ3M2JpT05h?=
 =?utf-8?B?VjBNcVpYUzdoN1JvcmlKd0RhZ2s4bDh3TEdXaE42ZUZMRVEvTHNzaDg5MXkw?=
 =?utf-8?B?blYxaCtyTkpGVjhpK2lzdlBUY21kbWhtRVF0d1Fxb0h1YmNOUUt6bGQxSG5Z?=
 =?utf-8?B?ZGZmOUdMNTdoZjQ1bGFuSDVOL3dHQ2JLU1cvdGh5U1puNDFvNDBURHVqVjU4?=
 =?utf-8?B?Ujc2YlRpTG54Sk5oTHU2MzhiaTdnYUFCN0FDczJWU1Q0bktuWlZjQkFZZVhG?=
 =?utf-8?B?dUtOZGxqenJoT3c3eFBQVjJJRnFieGx0V21SWWx5R3NMZnhqdnRubkUrSVl4?=
 =?utf-8?B?aVZSU29hT09BQ2lEZXRRNFJrTGFrS0NhWFBsKysrNlVsUXBIQmdZTU0xQ3Jv?=
 =?utf-8?B?UzdGbm1qbkIzS2pkU05vMkg0VXN3Nkd1SWNYRmRhTmpNb1FsYytCOWIzQVN3?=
 =?utf-8?B?TVZnWnRNR1dOU3UyVlJYd3FReEdsWThDWXQ1cFRrYWJYOFRTa2VKcHV3OFk3?=
 =?utf-8?B?clZWMzZ2R3g1NXlvYlpFTW1DTm1rblBtdmhJd3pxQWJqellJeHFyRDJKcmhY?=
 =?utf-8?B?aVpONW82TGVtTk5lY2wxUElOVUtLNENkdUZSZ3BUUCttdHg4K0xJS3I0cEtS?=
 =?utf-8?B?bmowTlFrTE9PMXBrSlYyeWZoWHhEZDNWNFVJMElNTEJoNXVuYmpKS0xtSDEx?=
 =?utf-8?B?akNtMDZrL2JUbFI5amJOSWhIYnRMYmdPMWtXbWticDRyN1pBWVNVYmJVVW40?=
 =?utf-8?B?VEpyUHM2NWVjNEVKZ2VsZWpTTVJVVVBPSjd4UTBmUHd1b1Q3MXFMcVRoUTRY?=
 =?utf-8?B?Y2MzR3lnT1BMdnI5YVVZVUR4VXI0S2Vkb2t5OElhSmdFNGEyWmdpSTVoSmF0?=
 =?utf-8?B?TnA0NmRva0xCRkZjaTNveFQzWlRTbXdGQndYOVpkMWVLL3BoR0d6YkphK3Bm?=
 =?utf-8?B?RGorZDROazBXblUvdWhqZzRnMDJ4dFFINHZrbUZyczhrZDlSMmxkYnM2b1k5?=
 =?utf-8?B?L2Q2RXoxVThKSFdVWUNtcVRCRkRHQXk3ZUIxOTRlRXlGMXcrbERPMkcrU2RH?=
 =?utf-8?B?UWpUZXNuRi9YbUNTV0lENEF5TW85OGlMbVA2YjVOQStoVXNtNnAxZDl2bGEr?=
 =?utf-8?B?azRNOTVZQ3BrS3VObWtaYmZSNUtKOU5FekVZMWhJemJXcU1NcVFaaW1pSnlp?=
 =?utf-8?B?Q2wwUFZjOE4xeWFSOUZoZnlGMXNOY3JpL3dJL1NCNXFibnlTR2Z4ZkRjZEs5?=
 =?utf-8?B?VGF4eUQyMDJiMFpOS0pQTzRjSExOdzRSUlZuMzNqOEVLV0o3TDNXME5VQ3FT?=
 =?utf-8?B?VklBZzRicEo4bXdzZ0V2NFQ4WWNDS09acnIzWXhud3djbnluM1ZpOERmREZB?=
 =?utf-8?B?T1BDVnBLM2luMFpaL2I0U1ZibzBvWVlObGxRbDR5VXhJb3BLQTVZZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC64577CD96CD540A3BB0C1689269CD6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	px7vrELZTrzKgCLMOI+MWOs6ni8aPXqZa5d0rhbCT3fUjccJMfiNLHd64j+HFxDKy9tI+YNgba8sjCexabsYsHjJCt9KDlKPrngykhXvR3sUxLho4WI/X8w0sFNtFzXBMMOe3N9+cYUuhyY0jhVo6kWhxF7+z8qy7ck1c2YvCZ2E4xTkw3s/nhZiGBjLEwxj9UrNBdJlWYPECOsemgWsrZ4i7o820ASjSkMgmIxF+dlQmASjtjaFDBl19sJA9dfa4tdBgaY9wNNK6oaqsi+DxUZQSeBcPVX6hf3fHnZBQOGbNADS5RqrKw3ny+JKz6+gu3oeMCp3FJSoUsgK4liPsA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5xViTdPJBcI9A9nyECjQuEKIlm+guMrvP4KWyY3gIXeACygHjj3jy6jG8uR0ktYw3Krz0tPaE/usF77cfmeuoL8Ov2lrDpnCGh5QW67JT2I5dJUax1gU+u02I/6R4G4Ro/dqcbkRCNhPznq02fxXf8+QmVVZy2zIA18VaPdBCsVSlRdhELX355gYE8NnPSj9Cjy7zI96mQwpQdOdsnSmb7Ez7jfqbgPN5T+ofQ6Wd4BRlAW/ALeDDA2hGzMWFZwGe15p5DD5pFv7DNFcx3cAaggtY9pA1Ei4XgFYbw+Ai8CHyw7Jd9MoYuf8mJtKX55iNk/O1L9xezyUlM1ojGq8lw4avhBRU5UAoGpF2qL7LXdrkXVkbKJOqaH/g0gwvXwJrLkM2F9yqf1rwIN2I5lkFEiL1FjpLGqElkfwoNbWM7+WyeQSOiU2Xvwxlhabo3m0t71dbqfXWjdOxvjzzt6AqlGc1YlpxIZaFLijT/7leZgZNNAeZMBEKjrr/0Kx80YjwAhydHpP/+zDuri9WR5Cu4PHx0kGR0C3PyyRddW4ePPoWTXAxwh0fS/j/d4hxw4wZO/yQAjzyCwdZoGDcVGIxXKT2F10ViNSGgOUmnEW2nbg+4lV9oDZ+Ezhrl6Lj7Fb+KnoaOYskYj0GnrRdSgEJw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255188d7-026c-4920-3f63-08de814dd766
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 22:14:05.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZP/kpaRQyj2Qr/yoWWO+Z/XTGFRVm3sfVN7PYbkR+KtisL+2nCOWiztfnZMwqzklzKyI5+VfMd0HOrr3WBQjXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8887
X-Proofpoint-ORIG-GUID: 8Qao79rYte9E8HupqANuoxDldOiw05OO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE3OCBTYWx0ZWRfX3PUlnvGjlBnt
 fvcwDE56cm818hCJT9jcf8/31Xyi+UXgdTAT6mHZihMeHvhasT3b1K5kRkBoD5PCQ74OwJQ1rIP
 yBTwN8+YeA+CE5ZgxNuZajjYtfldwLIN0I4uIYOYEXxPC9uWVveHh+JF0GhtfH8roTBoBPHg6Kb
 +hOVIIWO/BnjF2OhEut8yb7sK55AbgMkMokgpiGKKsPmjCqinkG/knjIsl+atSwDn/hzz36q4CD
 0km/SusrhhSKOJ6KGHvV3X9CvCA7YHjujDtQdKJpIE2FnJyOBRbBcqyt8Hc4wN5HBh01h+VHb1i
 kn8NQzcRI495EJywo2UEmikfAmtRjeKWtIuLWlTdYY1ocNuApinqrGQed2ZtXK9N2Tv4QKtNXkU
 0z4jlBwZ1uCp6P+2bbZqBg1at4coph8QLtV0GFNOAQ6a94WCdkiMDFwbqEASbcGFXlCYgA9eAkT
 AoMgnEeNHzj8b/mD7rQ==
X-Authority-Analysis: v=2.4 cv=cuyWUl4i c=1 sm=1 tr=0 ts=69b48c3c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=f25I9ERTwJLkeqKe_LEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8Qao79rYte9E8HupqANuoxDldOiw05OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603130178
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34767-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0025528A4AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDMvMTEvMjYg
ODoyMSBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwgTWFyIDExLCAyMDI2LCBL
b25yYWQgRHliY2lvIHdyb3RlOg0KPiA+PiBIaSwNCj4gPj4NCj4gPj4gVGhlIGRlc2NyaXB0aW9u
IGZvciB0aGUgdXNiLXJvbGUtc3dpdGNoIHByb3BlcnR5ICh1c2ItZHJkLnlhbWwpIHN0YXRlczoN
Cj4gPj4NCj4gPj4gICBJbmRpY2F0ZXMgdGhhdCB0aGUgZGV2aWNlIGlzIGNhcGFibGUgb2YgYXNz
aWduaW5nIHRoZSBVU0IgZGF0YSByb2xlDQo+ID4+ICAgKFVTQiBob3N0IG9yIFVTQiBkZXZpY2Up
IGZvciBhIGdpdmVuIFVTQiBjb25uZWN0b3IsIHN1Y2ggYXMgVHlwZS1DLA0KPiA+PiAgIFR5cGUt
QihtaWNybykuIFNlZSBjb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sLg0KPiA+Pg0KPiA+PiBU
aGF0IHRvIG1lIHNvdW5kcyBsaWtlIGEgZGVzY3JpcHRpb24gb2YgdGhlIGNhcGFiaWxpdHkgb2Yg
dGhlIG9uLVNvQw0KPiA+PiBjb250cm9sbGVyIChpLmUuIHNob3VsZC9jb3VsZCBiZSBzZXQgcmVn
YXJkbGVzcyBvZiBkZXZpY2Ugc3BlY2lmaWNzKSwNCj4gPiANCj4gPiBUaGF0IHByb3BlcnR5IGRl
c2NyaXB0aW9uIGlzIG1pc2xlYWRpbmcuIFdlIGVuYWJsZSB0aGlzIHByb3BlcnR5IGlmIHdlDQo+
ID4gd2FudCB0byB1c2UgdGhlIHVzYiByb2xlLXN3aXRjaCBmcmFtZXdvcmsuIFRoaXMgaGFzIG5v
dGhpbmcgdG8gZG8gd2l0aA0KPiA+IHRoZSBoYXJkd2FyZSBjYXBhYmlsaXR5LiBUaGUgZGVzY3Jp
cHRpb24gc2hvdWxkIGNvcnJlc3BvbmQgbW9yZSBjbG9zZWx5DQo+ID4gdG8gaXRzIGNoYW5nZSBs
b2c6DQo+ID4gDQo+ID4gNDUxZDE1YTE3MzFjICgiZHQtYmluZGluZzogdXNiOiBhZGQgdXNiLXJv
bGUtc3dpdGNoIHByb3BlcnR5IikNCj4gPiANCj4gPj4gaG93ZXZlciBpbiB0aGlzIGNvbmZpZ3Vy
YXRpb246DQo+ID4+DQo+ID4+ICZ1c2Igew0KPiA+PiAJZHJfbW9kZSA9ICJob3N0IjsNCj4gPj4g
CXVzYi1yb2xlLXN3aXRjaDsNCj4gPj4gfTsNCj4gPj4NCj4gPj4gdGhlIHJvbGUgc3dpdGNoIGRl
dmljZSBpcyBuZXZlciByZWdpc3RlcmVkIG9uIGRldmljZXMgd2l0aCBhIERXQzMNCj4gPj4gY29u
dHJvbGxlciwgc2luY2UgdGhhdCdzIGhhbmRsZWQgaW4gZHdjM19kcmRfaW5pdCgpLCB3aGljaCBp
cyBvbmx5IGNhbGxlZA0KPiA+PiBpZiBkcl9tb2RlID0gIm90ZyIgKG9yIGFic2VudCBzaW5jZSBv
dGcgaXMgdGhlIGRlZmF1bHQpLg0KPiA+Pg0KPiA+Pg0KPiA+PiBUaGlzIG5vdGFibHkgY2F1c2Vz
Og0KPiA+Pg0KPiA+PiB1Y3NpX2luaXQoKQ0KPiA+PiAgLT4gdWNzaV9yZWdpc3Rlcl9wb3J0KCkN
Cj4gPj4gICAgIC0+IGZ3bm9kZV91c2Jfcm9sZV9zd2l0Y2hfZ2V0KCkNCj4gPj4NCj4gPj4gdG8g
bG9vcCBpbiAtRVBST0JFX0RFRkVSLCBzaW5jZSB0aGUgJ3VzYi1yb2xlLXN3aXRjaCcgcHJvcGVy
dHkgaXMgcHJlc2VudA0KPiA+PiBvbiB0aGUgY29ubmVjdGVkIERXQzMgY29yZSwgYnV0IHRoZSBy
b2xlc3cgZGV2aWNlIGlzIG5ldmVyIHJlZ2lzdGVyZWQuDQo+ID4+DQo+ID4+IE5vdywgaXQgc2Vl
bXMgbGlrZSBkaWZmZXJlbnQgZHJpdmVycyBkbyB0aGlzIGRpZmZlcmVudGx5LCBlLmcuIERXQzIg
c2VlbXMNCj4gPj4gdG8gYWx3YXlzIHJlZ2lzdGVyIGEgcm9sZXN3Lg0KPiA+Pg0KPiA+Pg0KPiA+
PiBIb3cgc2hvdWxkIHdlIHRhY2tsZSB0aGlzPw0KPiA+Pg0KPiA+PiBGV0lXIEknZCBwcmVmZXIg
KGZvciBtYWludGFpbmFiaWxpdHkgcmVhc29ucykgdG8gbm90IGhhdmUgdG8gc2V0L3JlbW92ZQ0K
PiA+PiAndXNiLXJvbGUtc3dpdGNoJyBzZXBhcmF0ZWx5IGZvciBlYWNoIGJvYXJkLCBkZXBlbmRp
bmcgb24gd2hldGhlciB3aGF0ZXZlciBpcw0KPiA+PiBhdCB0aGUgb3RoZXIgZW5kIG9mIHRoZSBV
U0IgY2FibGVzIGlzIHJvbGVzdy1jYXBhYmxlIChzaW5jZSBhZ2FpbiwgdGhlIGNvbnRyb2xsZXIN
Cj4gPiANCj4gPiBXZSBzaG91bGRuJ3QgZG8gdGhhdC4gVGhlIHVzYi1yb2xlLXN3aXRjaCBjYW5u
b3QganVzdCBiZSBpbmZlcnJlZCBmcm9tDQo+ID4gdGhlIGRyX21vZGUuIFRoZSB1c2Ugb2YgdGhl
IHVzYiByb2xlLXN3aXRjaCBmcmFtZXdvcmsgbmVlZHMgdG8gYmUNCj4gPiBzcGVjaWZpZWQgYnkg
dGhlIHVzZXIuIEZvciBleGFtcGxlLCBmb3IgdGhpcyBwYXJ0aWN1bGFyIHNjZW5hcmlvIHlvdQ0K
PiA+IG1lbnRpb25lZCwgdGhlIFVDU0kgZXhwZWN0cyB0aGUgcm9sZS1zd2l0Y2ggaGFuZGxlLiBU
aGUgZHdjMyBkcml2ZXINCj4gPiB3b3VsZG4ndCBrbm93IHRoYXQgd2l0aG91dCB0aGUgdXNiLXJv
bGUtc3dpdGNoIHByb3BlcnR5LiBOb3QgZXZlcnkgZHJkDQo+ID4gcGxhdGZvcm0gdXNlcyB0aGUg
dXNiIHJvbGUtc3dpdGNoIGZyYW1ld29yayBmb3Igcm9sZSBzd2l0Y2hpbmcuDQo+ID4gDQo+ID4+
IGl0c2VsZiBpcyksIGJ1dCBpZiB3ZSBnbyB0aGF0IHJvdXRlLCBJJ2QgcmVxdWVzdCB0aGF0IHdl
IGV4cGxpY2l0bHkgZm9yYmlkIHRoZQ0KPiA+PiBjb21iaW5hdGlvbiBvZiB1c2Itcm9sZS1zd2l0
Y2ggJiYgZHJfbW9kZT1ob3N0L3BlcmlwaGVyYWwgaW4gYmluZGluZ3MsIHNvIHRoYXQNCj4gPj4g
dGhlIGNvbXB1dGVyIHllbGxzIGF0IG1lIGlmIEkgb3Zlcmxvb2sgdGhhdA0KPiA+Pg0KPiA+IA0K
PiA+IFRoZSBkd2MzIGRyaXZlciBjYW4gYmUgdXBkYXRlZCB0byByZWdpc3RlciB0aGUgcm9sZS1z
d2l0Y2ggZGV2aWNlIGlmIHRoZQ0KPiA+IHVzYi1yb2xlLXN3aXRjaCBwcm9wZXJ0eSBpcyBzZXQu
IEFkZGl0aW9uYWxseSwgdGhlIHJvbGUtc3dpdGNoaW5nDQo+ID4gY29uZGl0aW9uIHdvdWxkIG5l
ZWQgdG8gYmUgcmV2aXNlZCB0byBlbnN1cmUgaXQgaXMgY29uc3RyYWluZWQgYnkgdGhlDQo+ID4g
ZHJfbW9kZS4NCj4gPiANCj4gPiBJdCdzIGEgYml0IG9kZCB0byBiZSBpbiBob3N0LW9ubHkgbW9k
ZSBidXQgYWxzbyBuZWVkcyB0byB1c2UgdGhlDQo+ID4gcm9sZS1zd2l0Y2ggZnJhbWV3b3JrLiBJ
IGRvbid0IHRoaW5rIHRoZSBVQ1NJIGV2ZW4gdXNlcyByb2xlLXN3aXRjaA0KPiA+IGdldF9yb2xl
PyBJbiBhbnljYXNlLCB0aGUgY2hhbmdlIHNob3VsZG4ndCBiZSBhbiBpc3N1ZS4NCj4gDQo+IFJl
dGhpbmtpbmcgaXQgYWdhaW4sIHdlIG9ubHkgcmVnaXN0ZXIgVUNTSSBpZiB0aGVyZSdzIGEgcHJv
dmlkZXIgKGluDQo+IG91ciBjYXNlIHBtaWMtZ2xpbmsgd2l0aCBVQ1NJX0dMSU5LIGFzIG9uZSBv
ZiBpdHMgYXV4IGRldmljZXMpLCBhbmQgc3VjaA0KPiBhIHByb3ZpZGVyIG5vcm1hbGx5IGNvbWVz
IHdpdGggYSBjb25uZWN0b3IgZGVmaW5pdGlvbiwgd2hpY2ggaXMgbG9naWNhbGx5DQo+IGFsd2F5
cyBhIFR5cGUtQyBvbmUgKHRoZSAnQycgaW4gJ1VDU0knKSwgc28gaXQgKHZlcnkgbGlrZWx5KSBo
YXMgc29tZQ0KPiBmb3JtIG9mICdkYXRhLXJvbGUnIHByb3BlcnR5IChhbmQgaWYgaXQgZG9lc24n
dCwgd2UgZG9uJ3QgZW50ZXIgdGhlDQo+IHByb2JsZW1hdGljIHBhdGhzPykuDQo+IA0KPiBUaGF0
IHByb3BlcnR5IG1heSBiZSBmdXJ0aGVyIHJlc3RyaWN0ZWQgdG8gc29tZXRoaW5nIGVsc2UgdGhh
biAnZHVhbCcsDQo+IGJ1dCB0aGUgY29udHJvbGxlciB3aWxsICh0byBteSB1bmRlcnN0YW5kaW5n
KSBzdGlsbCBnZXQgYSByb2xlX3N3DQo+IG5vdGlmaWNhdGlvbiAoVHlwZS1DIGNsYXNzIC5kcl9z
ZXQoKSBub3JtYWxseSBlbmRzIHVwIGNhbGxpbmcgdGhhdCBvbmUNCj4gd2F5IG9yIGFub3RoZXIp
DQo+IA0KPiBTbywgem9vbWluZyBvdXQsIHRoZSBwcm9ibGVtIGhlcmUgc2ltcGx5IHNlZW1zIHRv
IGJlIHRoYXQgdGhlcmUgaXMgbm8NCj4gcmVhc29uIGF0IGFsbCB0byBsaW1pdCBkcl9tb2RlIGlm
IFVDU0kgaXMgYXQgcGxheS4uDQoNClRoZSBzZXR0aW5nIG9mIGRyX21vZGUgaXMgaW5kZXBlbmRl
bnQgb2Ygd2hldGhlciBVQ1NJIGlzIGF0IHBsYXkuIEl0J3MgYQ0KaGFyZHdhcmUgY2FwYWJpbGl0
eSBwcm9wZXJ0eSB0aGF0IGVuc3VyZSB0aGUgY29udHJvbGxlciB3b3VsZCBvbmx5DQpvcGVyYXRl
IGluIHRoZSBzcGVjaWZpZWQgbW9kZS4NCg0KPiANCj4gSWYgaXQgaXNuJ3QsIHNvbWV0aGluZyBt
YXkgc3RpbGwgY2FsbCByb2xlX3N3aXRjaF9nZXQoKSBhbmQgZmFsbCBpbnRvDQo+IHRoZSBzYW1l
IGRlZmVyIGxvb3AsIGJ1dCBhZ2FpbiBpdCBzZWVtcyB1bmxpa2VseSB0aGF0IGl0IHdvdWxkIGJl
IGENCj4gdmFsaWQgY29uZmlndXJhdGlvbiAoSSBjYW4gb25seSB0aGluayBvZiBkcl9tb2RlIHVz
ZWQgYXMgYSB3b3JrYXJvdW5kDQo+IGZvciBEUi1jYXBhYmxlIEhXIHRoYXQgY2FuJ3QgZGV0ZWN0
IHRoZSBkZXNpcmVkIHJvbGUgcHJvcGVybHksIHBhaXJlZA0KPiB3aXRoIGFuIG92ZXJ6ZWFsb3Vz
IGRyaXZlciB0aGF0IHJlYWxseSB3YW50cyBhIHJvbGVfc3cgc29tZWhvdyBjb25zdW1pbmcNCj4g
YSByZWZlcmVuY2UgdG8gdGhhdCBjb250cm9sbGVyKQ0KPiANCj4gSGVuY2UsIEkgdGhpbmsgdGhl
IHdheSBmb3J3YXJkIGlzIGp1c3QgdG8gc3RvcCBzZXR0aW5nIGRyX21vZGUgd2hlcmUNCj4gaXQg
ZG9lc24ndCBtYWtlIGxvZ2ljYWwgc2Vuc2UgYW5kIHJldmlzaXQgaWYgdGhpcyB0dXJucyBvdXQg
dG8gYmUgYW4NCj4gaXNzdWUgaW4gYSAicmVhbCIgc2NlbmFyaW8NCj4gDQoNCkl0J3MgcGxhdGZv
cm0gc3BlY2lmaWMuIFRoZSBkd2MzIGRyaXZlciBoYXMgY2VydGFpbiBsb2dpYyB0byBkZXRlcm1p
bmUNCnRoZSBjb250cm9sbGVyIGNhcGFiaWxpdHksIGJ1dCB0aGUgZHJfbW9kZSBwcm9wZXJ0eSBj
YW4gb3ZlcnJpZGUgdGhpcy4NCklmIHlvdXIgcGxhdGZvcm0gZG9lcyBub3QgbmVlZCB0byBzcGVj
aWZ5IHRoZSBkcl9tb2RlIGFuZCByZWx5IHNvbGVseSBvbg0KdGhlIFVDU0kgY29ubmVjdGlvbiBk
ZXRlY3Rpb24vbmVnb3RpYXRpb24gYW5kL29yIHRoZSBkd2MzIGNhcGFiaWxpdHkNCmNoZWNrcywg
dGhlbiB5b3UgY2FuIG9taXQgaXQuDQoNCk5vdGUgdGhhdCBpZiB5b3VyIHBsYXRmb3JtIGlzIERS
RCwgb24gZGlzY29ubmVjdCwgdGhlIGNvbnRyb2xsZXIgd2lsbA0Kc3dpdGNoIGJhY2sgdG8gdGhl
IGRlZmF1bHQgbW9kZSwgd2hpY2ggaXMgdHlwaWNhbGx5IHBlcmlwaGVyYWwuIElmIHdlDQpzZXQg
dGhlIGRyX21vZGUgdG8gaG9zdCBvbmx5LCB0aGVuIHdlIG11c3QgbWFrZSBzdXJlIHRoYXQgdGhl
IGR3YzMgbmV2ZXINCnN3aXRjaCB0byBkZXZpY2UgbW9kZS4NCg0KU28sIGFzIEkgbWVudGlvbmVk
IHByZXZpb3VzbHksIGlmIHlvdXIgdXNlIGNhc2UgcmVxdWlyZXMgdGhhdCB3ZSBzdGlsbA0KbmVl
ZCB0byByZWdpc3RlciB0aGUgcm9sZS1zd2l0Y2ggZGV2aWNlIHdoaWxlIHRoZSBkcl9tb2RlIGlz
IG5vdCBvdGcsDQp0aGVuIHdlIGNhbiBtYWtlIGEgY2hhbmdlIGluIGR3YzMgdG8gZG8gc28uDQoN
CkJSLA0KVGhpbmg=

