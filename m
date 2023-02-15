Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308C069881E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 23:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBOWxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 17:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBOWxw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 17:53:52 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B40132E4E
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 14:53:50 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FMqiNQ008501;
        Wed, 15 Feb 2023 14:53:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=9d3HuJspg3bgEMHF+lLThOO+nxtSvhjGPicFcCMCodE=;
 b=r2hvuBGw8CuqM2TQVmt4TSnpkFKLNAXvhV5io8RN5j5u0H960FkQj4sMYI3lVsw5YUKf
 Cmf0oT064PKkx5BXeSXpivbH/khh9BmuIGJ7cSgLTQK6qPh5X3JKs4vzsvsyPB2nTlIO
 i5K30P7FBwTjaB7Z+O+YG7JwI/3cECGR2jKe4TPeZ6IfYYSJXf+n3Lirho6BNLtvSuId
 nLFVwrNF6OEouwBe7fR7bZR1Kew2jrJj+ZIPZVXibBI3KcI5i99Y3tdQ351xy3VgWZeF
 f6turs9JXFoLA2d5cSOytrbTa96zYDXD6Usi5eWWDg2uwZgyHUhOcFYSpcLsUQ0yFO8B Cg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3npau0e41u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Feb 2023 14:53:43 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A0A54007B;
        Wed, 15 Feb 2023 22:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1676501622; bh=9d3HuJspg3bgEMHF+lLThOO+nxtSvhjGPicFcCMCodE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RxwCIShPvbHZqQWSeYO+8sUKL3ql1bpdTD/+LjO63Pgc94HLKi0axufKxhGRfUgw5
         IjYXKhwtk3FpDpqARDhu/s8Tk/kotb/5gd4MfSEb2zen1VHHFQwTqliV60INL2kGuP
         IoqhGJ2fQVaOHT1h7PiYRJBZmNFs/0W/3VkqFrPw6jlZ0STajkilu6tTSGb37elBaY
         NNVMtK3FqqZ9v8arQb/tuDCtRQf4xdudP3ouYrmchzX0lt6bLryU5k2WWKjJAmVpuM
         HcrX8qJh9cTf8F6tq+9QRomVl9D4smuAcURcIfw3z9W/SHuVb+n5BM1/tovjQ8ntW0
         c2geqpEdMvnSw==
Received: from o365relay-in.synopsys.com (us03-o365relay7.synopsys.com [10.4.161.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 05977A006D;
        Wed, 15 Feb 2023 22:53:41 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3D53CA00A8;
        Wed, 15 Feb 2023 22:53:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="u1bYqKjt";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lugVJ3qSe0tUma0mFsbwVAwuERYdOg/8qoA506QrJoHiO1wId/wP5pFd5R2tIE0MxYBWGLZ6v+viOs5Sklth1bw2JzCCEq0V/g7cAfc6StmIHbT8Al/wlg9RGd8MCZTcexuUWpX7mpuVJD4Bt/1IpocNVpaXPUW2YKoT1e/tRGgDWNSKuW3O1Bi3/6/MdMhBE6kDKgpbSoqzNzLdrB3RaCiq0X5G4RJBRjgQUL4yAhl9k/RMIsz6BJNBIFS5WigXFaSO/NddbS9ticMtOcSQVv16dcyOhRcGpe25NWnqd8E/GSnG6aepDORbdF5l5hNjjxA0umC/3ZK7O2Bw65l47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d3HuJspg3bgEMHF+lLThOO+nxtSvhjGPicFcCMCodE=;
 b=L3KVdeZDARMBMTVjmYNq0w2fOZ0hQ7h7zd9+RSGE/NDqh1cdOgE14FzQWxyyZq44AxhUICimJK8oC9emWv7BiRwR1RNx9LQFu7IfR+vKNXj8riuvoxRApbBGCh4ZegqQiH4vdn0HohKvPAdZ1/EdAzDMElmb1WKz27wqSXLyHxyej8S+rEXZwvdGJyMvdcVDJXhnGaZSoktDUvLRcXbhGB9m2OKbKIiRJbmbdgAhlw2K3k1eq51YhoOd/85cCXnPs/NoPLP9C/6pbIUuqEQfcT8NMU2hxa/V8yp8oaDePtQQqkGLeiXWl8kXzWiOUAup/6TrxWRkTiQ+xDSMdv3s1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d3HuJspg3bgEMHF+lLThOO+nxtSvhjGPicFcCMCodE=;
 b=u1bYqKjtdc5AmsCyAf1QqH//gO6EAdH0ieN3on0MAfZPVG+vqEkfMrQz4a22IDXf3h6f47WRsPcVJusPgaDyFBJHb0c1sAUACx1N/brefJ04io6OSEklT1n644dCY8nLoe554Wx+oTrSI00rZurQLlGwSW9399KXRPtVl/Q19SU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 22:53:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6086.021; Wed, 15 Feb 2023
 22:53:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Roger Quadros <rogerq@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Topic: dwc3: gadget suspend/resume vs system suspend/resume
Thread-Index: AQHZQSGIQpZyBgHR1ESwyvCYdmUCwq7QJboAgAAeOwCAAA9MgIAASymA
Date:   Wed, 15 Feb 2023 22:53:38 +0000
Message-ID: <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
In-Reply-To: <Y+0jZScRX80mF8tS@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH0PR12MB7472:EE_
x-ms-office365-filtering-correlation-id: 8fa51bd9-0cb9-4507-53b5-08db0fa779fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 17nG09HDvNYB5zQAoVPPrhGUtA1lhVh4Qc2xsyYipk5HoIMJoVD62FoM82rEV4MilcUJl9k9IINXuL/R/oTQSoaT0rf8KmKWH9jzKAaQjetyhyqwLQiVWINGghTTYonv23/Vc2cH2HRzQyAGxsJW+wh7XIn0F7L/7OQgKJMMN/p//Xg2pGsfsB25hNnEtBkqBRLcJ9PWhSmyuInTx6pVq+hw6UMZJXgJnHAsT78tnZsCKk8yrNzBofVh/ZI1O1jlgpNU4NT1WRS5qoKs0BpuS2YthJfbJZPREbt2GBxT01BegTHpHTbUOX+CulWuzxahKt064WuQ/wf5apvw9TlerLZPTjjFXbr5w9iYSpWEbUl8+0bz9ShQUbKxgrURNk3bKuHuVjoTokHguY+TO2ElwpfgFugnSay/hlyIcl1oiLJFvufeqikQz0PMVUrT6vfgmfiBWMnqX9Ck8JcZE/Qrqy/2GgpKoFakkaRgXTM41rrBmF5jZKvQdvJ/sbarIC5/ipaN/Bv6c99yG4rXZqobQ+Z7RV//s3nXoTfGug3lHvxnjx+p1crlRPfKlvsHZWX85f+Lww41DD97OnJZ6W6VmIKNaKPqMF3zCJ1YnRoozw7/QM1WmzSskVHSOwtLnngYRcwTIhIAXv/HW6mO52MzCJg33F3FqE4NViehiFxtD6FGu9E0PSdnH08qUvD6b7/9qqeYFbE+CUNsWy7jWRQCsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(38070700005)(2906002)(6506007)(83380400001)(36756003)(1076003)(2616005)(86362001)(478600001)(110136005)(316002)(8936002)(54906003)(6486002)(8676002)(5660300002)(186003)(26005)(66476007)(76116006)(66446008)(66556008)(71200400001)(6512007)(66946007)(41300700001)(64756008)(4326008)(38100700002)(15650500001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGtmeEVIbE9WTFpxTHJ4UFFteXN1aXRGd3V4Z1ZWSXpsd3hVSkw0cjNweW95?=
 =?utf-8?B?UFhoNUVKakhjZlNJVWozcGZBYnNFOUJsbDU4VUl0UjhjNHl6djBVQldjY29w?=
 =?utf-8?B?a3I4U2JJNWN2UXZ2ZjNPZXZ4SG5mTUxvMW9ibS8zZjNBZ2h6NjNJcFNDQmVY?=
 =?utf-8?B?VTdCb0w3VCs3ZFJYNzJWR2gvb3BJN0cxZXJLSExBejZqRTE5eGNhTXpNK1VB?=
 =?utf-8?B?aUV1SHB3K1lhWjdCVkJtUTdhblpUc21kSXNDVHI1ampqU2NDTmJ6eG00L21a?=
 =?utf-8?B?c2FuRVdRK1pZczB0dHFPY0lpeGhYbUZaQmFNT1lLa1NwYjdiQXdNb3VsUW4v?=
 =?utf-8?B?MEtRSG9CYStCejlVWmhSMndqQlc4Nkx4dXRBcktLSTFpRElGMjhMZkVjcS9T?=
 =?utf-8?B?bExsTGlnY29OL2xyQU9KZzJqc3NEWGxRckwyQmNsWm10Vzd3OWNEY3YvSjZ2?=
 =?utf-8?B?V3hLdmpHOFNCTTJjMmhobkk3ZXMyM2ZLSUxUcldnWVhTL3gzcGVqQloxc2E1?=
 =?utf-8?B?OFQ2VE9NUmRkUjViM0ZkVlZIZ2xNNjJ5Ty9RREZXaGhmVXhlVkFuNENsdEh6?=
 =?utf-8?B?dFRvL2Vic0piRkw2RHRoU2VnSzV5UFkxU01iSEh3YzRvQ0hoZE8zOTVGOGkr?=
 =?utf-8?B?aFlzOCtyTHZDN2ZubHVFYm9HaDFrdmlEaWJsZzVqelZ4eGd5aEVoVGdWMzkz?=
 =?utf-8?B?U0o5M2J4Y0hobTlOMUZtZFJXWU9mZ01iZU1Db2w3ZW1lVjZBRGduT3pnTVFq?=
 =?utf-8?B?Zm9SNzd1ZG04VUhzdXdSRk5qSFMzR0JIUUhvMzRqWTRlT3FINFBwUDRnRzhp?=
 =?utf-8?B?c2ZadExUVklEclM5NjZQZGx1ZlNoYWFkOWhoWU1jVkFoa29GZVZwTmp3K3JH?=
 =?utf-8?B?NG5HUjdTeHpyeVBpcFJxRVduVWg1R01EaVJNM2xnV0R4Ty9LMjl4dzgxM1lr?=
 =?utf-8?B?dXVQdENFOGxxb0FuM2wzaEkwNUZPZVdmM1ExUFl0ajlHYkZlcjREZXpSVzBh?=
 =?utf-8?B?aHYxSHdNc3owMzhTblJqeGF3bFpOMGxjQWZVaTFpM3lyUXdKa2gyV1p0Skpt?=
 =?utf-8?B?NFY0NGRkNDZNTE9sTWV3MkkzS3pucFIrSm9hTlp2NUFtajIvTDJKZXB2U3J6?=
 =?utf-8?B?TGROUVB0cCtjMkRhbXczaEljZkFEcG4xSUg4MHNnc3R4L2FhV080elB6OXBU?=
 =?utf-8?B?THM4M2lHZHJJNUdJWFhqMm85QnJkUlB3QmRoaENxeE1HeHZyZ1VLb3RlR3g4?=
 =?utf-8?B?Wk80QVA3RjUvYmhOaEFXNUlJU1IvYWpnVVBLcWdqU0NmeW01WGhDbGE3TUxP?=
 =?utf-8?B?Rno5dDNzSVAwYkw2Tm9yT1FQYmFWdjNqb1d0UmUySGw0WFNSeEFpNTVudEtu?=
 =?utf-8?B?eTBRdEk2Zlp1eHdSSmd6ZlMwVDUreURJMkJIZWFxd0plTTlnL1dnK0RyVDZP?=
 =?utf-8?B?MnBPaW9RTWMxbXNrbERoWFJwamZjZTNkaXRnbDMyMnN4V1ZHQytCakNtdmsy?=
 =?utf-8?B?MXBwNWxrdlczNmlsWDBOb29yWTBpRERGdjNqUWJxOVV2T3k2bFpub1hJaTF6?=
 =?utf-8?B?YWpYYkt6VU01eG9UQmFXdVg5RU9xSC9HZWRyWXAyTWs0TWlOWFBrVHlpaFVy?=
 =?utf-8?B?UmtaTXhBa1RwcmlEY1g5QmFkMlJ5cUhuYkZsT1Y4S3VHdU9HN1JSQ2pyMUhv?=
 =?utf-8?B?NThwTFZrY1kwYzhVait2S3k5NnNJQVIyelRXY0FLSDZkZWUzVjN6ZzJtbGdu?=
 =?utf-8?B?VkFNYjRpWUJoTk1qRm9oc2hDT3ZZZ09oMlZnNEE4U3FidUNVVktVK3FwSnpR?=
 =?utf-8?B?b2ZBazZTVkNPR0tNaFlhbkVHSzRHY0dySHZTN052dit3eXE1SGd6MmluWU0z?=
 =?utf-8?B?S0c0dWcyN2E3ZUlkTk1SMzQ3MlNycXVsUUNESlpkd1lObXdoeE5wMGFXYm5Z?=
 =?utf-8?B?Y3YwQlV3andYaDR0YVNVU3JHcnR3OWx1UGtVVmRVUVhXMUM0WFJwa2JLeFZM?=
 =?utf-8?B?U3paS2kxbC9ISkdsaGlQaklOQldKbmNJbDRtYjR6N05DVDkva24wRExXQ3pn?=
 =?utf-8?B?WVRoTW9vMHRZY3lrZFFIVWYzbVl0WmdyZkRMdm9ranJCMGNRNkZZUzZ4THBz?=
 =?utf-8?B?QzlqQyt0dlc0bGhrN3p3OG9IS1VGcHVBRWpib3BLdEI0UWR0R2VHNEZRM1Zp?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D01DAC8D207244A50EC92A52B3A464@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JlI/5eOgVwJgluoqKw2bt/ETZuRLgflU31S4F/KudElCBpC6vklGwUFXDe3QV3nMkIdpqw23abF5D2Z/yXacSH7bA+qsM+GoGJSe4rNYN3G6TPqnjv6JbwyOf0jTxIbq39woXy+sTgncyRVtxCu4hUq4LWR/WxYLiiC/grs7j7mUfhOdU7k6eiTvZTvzIOeZlhn6yhMh8UZYxZBe9mGMA6veQAj6Os4yo7WLWfYMj687gPYVORetzAabB2iARtQp3lvKb+Hq9TFPF+Rv7skGQ97zGO9wmUsMMzNQWkWUpTd/rp3PYyh4iy93lvIAUOPUVFkx8oeFzNBGteEh4EqXOngUp7BBOzn8NpUJTO83cOcPoaXaOgwv1z9E1riYkKxuEOgbomEnQNs89jNrX16Xlmny73bhrMZH/GhkZMn9Y3tt/UIsd+fdpY/DfrSadshxUacpdD6irbHRu0kN8kgMKtGihu4m3bp9TdHnq8goFZMW5KNmbZroKifteou5doiBJFBox/QC27icJvkzWEQax2G3kUyRGgzh+LfvLJ2wEzieoXdQpL/NxfRA+TxyU+3gOLCVeHU520HhcsEjNNGKsrVU1VMaLws5z+pJKZDR1ymcda5pHGyfcvRqppD9/6cpeHR5BH8zUUIZG3Ex6lmv4Z3+YKL2zAkAEjPtx0s1oYM0XiD43OohMEeOZBCxO5iRhu+b7r7BtNFFFQMpccKkAHxAclPu2XsH4BSbYcI5nyjhovProJdvCKDsS1UnjiMjCp2UooZUUjo45NpyHNw4VXesl4O7r/pEFDMG67k132C+xgDKmAv0rEA5OVtGu3UjwJ+fLe35woLmpVe6WQgWhPpMuKz8Dw5qRwKrsWAmShA2Xu+R70Jb7TXhe5QPo+p5sLE40uhVHnL173xF00uuoQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa51bd9-0cb9-4507-53b5-08db0fa779fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 22:53:38.3123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pYZFYTEkCaqsC/YkqCavW4lnBTfRTBkt78FK9URhuHgsM1/jRiE+RnlZVDWWkxRksgAoOTk0QJeyk/O9jAdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
X-Proofpoint-GUID: HxsgK7gjZNLTqskfkxHdOkq9W8kyYqOk
X-Proofpoint-ORIG-GUID: HxsgK7gjZNLTqskfkxHdOkq9W8kyYqOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_13,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=505 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150195
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBGZWIgMTUsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwgRmViIDE1
LCAyMDIzIGF0IDA3OjI5OjUyUE0gKzAyMDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6DQo+ID4gSSB3
YXMgbW9yZSBpbnRlcmVzdGVkIGluIHRoaXMgY2FzZSB3aGVyZSBVU0IgaXMgc3VzcGVuZGVkIGFu
ZCB0aGVuIHN5c3RlbSBzdXNwZW5kcy4NCj4gPiBXYWtpbmcgdXAgdGhlIHN5c3RlbSBvbiBVU0Ig
YWN0aXZpdHkgKHdoaWxlIHN1c3BlbmRlZCkgaXMgdGFrZW4gY2FyZSBvZiBieSBoYXJkd2FyZS4N
Cj4gPiBCdXQgSSdtIG5vdCBzdXJlIGlmIGdhZGdldCBkcml2ZXIgd2lsbCBiZSB1cCBpbiB0aW1l
IHRvIHJlc3BvbmQgdG8gdGhlIHJlcXVlc3QNCj4gPiByZWFzb25hYmx5IHF1aWNrbHkuIEl0IHdv
dWxkIHRha2UgYSBjb3VwbGUgb2Ygc2Vjb25kcyBhbmQgaXMgbm90IGhhcmQgdGltZSBib3VuZC4N
Cj4gPiBJcyB0aGlzIHRpbWUgbWFuZGF0ZWQgYnkgdGhlIFVTQiBTcGVjIG9yIGlzIGl0IGhvc3Qg
aW1wbGVtZW50YXRpb24gc3BlY2lmaWM/DQo+IA0KPiBUaGUgVVNCIHNwZWMgZG9lc24ndCBzYXkg
dmVyeSBtdWNoIGFib3V0IGl0LiAgT25lIHBhcnQgb2YgdGhlIFVTQiAyLjAgDQo+IHNwZWMgc2Vl
bXMgcmVsZXZhbnQ7IGl0IHNheXM6DQo+IA0KPiAJOS4yLjYuMiBSZXNldC9SZXN1bWUgUmVjb3Zl
cnkgVGltZQ0KPiANCj4gCUFmdGVyIGEgcG9ydCBpcyByZXNldCBvciByZXN1bWVkLCB0aGUgVVNC
IFN5c3RlbSBTb2Z0d2FyZSBpcyANCj4gCWV4cGVjdGVkIHRvIHByb3ZpZGUgYSDigJxyZWNvdmVy
eeKAnSBpbnRlcnZhbCBvZiAxMCBtcyBiZWZvcmUgdGhlIA0KPiAJZGV2aWNlIGF0dGFjaGVkIHRv
IHRoZSBwb3J0IGlzIGV4cGVjdGVkIHRvIHJlc3BvbmQgdG8gZGF0YSANCj4gCXRyYW5zZmVycy4g
VGhlIGRldmljZSBtYXkgaWdub3JlIGFueSBkYXRhIHRyYW5zZmVycyBkdXJpbmcgdGhlIA0KPiAJ
cmVjb3ZlcnkgaW50ZXJ2YWwuDQo+IA0KPiAJQWZ0ZXIgdGhlIGVuZCBvZiB0aGUgcmVjb3Zlcnkg
aW50ZXJ2YWwgKG1lYXN1cmVkIGZyb20gdGhlIGVuZCANCj4gCW9mIHRoZSByZXNldCBvciB0aGUg
ZW5kIG9mIHRoZSBFT1AgYXQgdGhlIGVuZCBvZiB0aGUgcmVzdW1lIA0KPiAJc2lnbmFsaW5nKSwg
dGhlIGRldmljZSBtdXN0IGFjY2VwdCBkYXRhIHRyYW5zZmVycyBhdCBhbnkgdGltZS4NCj4gDQo+
IEFjY2VwdGluZyBhIGRhdGEgdHJhbnNmZXIgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIGNvbXBs
ZXRpbmcgaXQsIA0KPiB0aG91Z2guICBUaGUgTGludXggVVNCIGNvcmUgZG9lcyBzZW5kIGEgcmVx
dWVzdCB0byBhIGRldmljZSAxMCBtcyANCj4gYWZ0ZXIgcmVzdW1pbmcgaXQsIGJ1dCB0aGUgdGlt
ZW91dCBwZXJpb2Qgb24gdGhpcyByZXF1ZXN0IGlzIDUgc2Vjb25kcy4gIA0KPiBUaGlzIGdpdmVz
IHlvdSBzb21lIGxlZXdheS4NCj4gDQoNCkZvciBtb3N0IHN0YW5kYXJkIGNvbnRyb2wgcmVxdWVz
dHMsIHRoZSBzcGVjIGluZGljYXRlcyB0aGF0IHRoZSBkZXZpY2UNCm11c3QgcmVzcG9uZCB3aXRo
aW4gNTAwbXMuIEJ1dCB0aGF0J3Mgbm90IHRoZSBjYXNlIGZvciBzb21lIHJlYWwgZGV2aWNlcw0K
c28gd2UgaGF2ZSBhIDUgc2Vjb25kIHRpbWVvdXQgaW4gTGludXguIEZvciBvdGhlciByZXF1ZXN0
cywgaXQncyB1cCB0bw0KdGhlIGNsYXNzIGRyaXZlcnMuIEZvciBtb3N0IGRyaXZlcnMgb24gTGlu
dXgsIGl0J3MgdHlwaWNhbGx5IDUgc2Vjb25kcw0KYWxzby4NCg0KSU1PLCB0aGUgc3lzdGVtIHN1
c3BlbmQgb24gdGhlIGdhZGdldCBzaWRlIHNob3VsZCB0YWtlIHByZWNlZGVuY2UuIFRoYXQNCmlz
LCBpdCBzaG91bGRuJ3QgZGVwZW5kIG9uIHdoZXRoZXIgdGhlIHVzYiBnYWRnZXQgaXMgaW4gc3Vz
cGVuZCBvciBub3QNCnRvIGdvIHRocm91Z2ggc3lzdGVtIHN1c3BlbmQuIEZvciB0aGF0IHRvIGhh
cHBlbiwgdGhlIGdhZGdldCBtdXN0DQppbml0aWF0ZSBzb2Z0LWRpc2Nvbm5lY3QuIE90aGVyd2lz
ZSBJIGNhbiBzZWUgd2UgbWF5IHJ1biBpbnRvDQpjb21wbGljYXRpb25zIGZyb20gdGhlIGRlbGF5
IGZyb20gdGhlIHN5c3RlbSBzdXNwZW5kLiBGb3IgZXhhbXBsZSwgd2hhdA0KaWYgdGhlIGhvc3Qg
aW5pdGlhdGVzIHJlc3VtZSByaWdodCBhZnRlciBzdXNwZW5kIHdoaWxlIHRoZSBnYWRnZXQgc2lk
ZQ0KaXMgc3RpbGwgc3VzcGVuZGluZz8gV2hhdCBpZiB0aGVyZSBhcmUgb3RoZXIgZ2FkZ2V0cyBv
biB0aGUgc2V0dXAgdGhhdA0Kd2FudCBvciBub3Qgd2FudCB0byBnbyB0byBzdXNwZW5kIGFsc28/
IEhvdyBjYW4gdGhlIHN5c3RlbSBkZWNpZGUgd2hlbg0KaXQgY2FuIGdvIGludG8gc3VzcGVuZCB0
aGVuPw0KDQpUaGFua3MsDQpUaGluaA==
