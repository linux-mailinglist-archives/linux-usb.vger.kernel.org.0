Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662096E87F8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 04:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjDTCbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 22:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDTCbn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 22:31:43 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7C546B8
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 19:31:42 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JIAFLx016332;
        Wed, 19 Apr 2023 19:31:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=6Srx2gP55cPkPctkvvrnY2jU9FY3K6rCDD7M/K0qYNM=;
 b=l4cEGpQNYw/O8gDF+DP++s070e91lUxv1MJyG+HM1B3uDSey64XpnBLL4uf0Lmtaq60i
 9FZCOOY4kOoNXmDrBQ4L3H0l+rmumg0+Y3ZdGagOtdhs84quccI33lbKbr0ZS+AUye+j
 r8S04QDlmshPfjbJIcvbuY9gR56gVyZjOV3eN02VQm4nrNXK/WvWhMly1BeZZFZxMsTd
 7j7pijzh/WaV3KMe/zF6lTZJ490XJ7Zldr8p/eBkxpwDJ0Nkb9nQcq7og3QvtSFaLnze
 SWqXloxsm71CZbJc5qdms50eXuJCpJjjjXD+l9Smxv+ekVpqj4J7BSJHj4mJPdL8pugI sw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pytxnm8ng-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 19:31:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681957894; bh=6Srx2gP55cPkPctkvvrnY2jU9FY3K6rCDD7M/K0qYNM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dAWLuU096lIozzaLXEjCwskWyzrED7yDh0wGrvov7Ztt286Q5qTNDA3XA6Q1icUOm
         PiJf0Zq/8qXq54mgYoQ3KiETFnubmbZsLIlAahnV5H/IgxuOSZl8ekhS9N4zJDu0/J
         OOZ4B+qMUPFyAwgZ+Ei+K5bt9Ff9NEIKdw1zmchUrZFg4maK0eDSV14U9mBvrngl1M
         4LZb7Nnjz6H2kX8pGcoprCCx6jx+yLIMjqVN0gJ4S3y/Sp5IhR2fk9WPBlhXXtCE1k
         bkG0VzI+k3ikzXJxo1scPzwMi/ZPHuc37JHzMsiNPD4jOFjGyMZ329SBhlYURH6/+F
         dZxkPJ43AcMZg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3668140753;
        Thu, 20 Apr 2023 02:31:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 30FC5A0071;
        Thu, 20 Apr 2023 02:31:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VK/ZyPcW;
        dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4BCA340753;
        Thu, 20 Apr 2023 02:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXmaZqCZRAQym0Timtlsav11ER38ElQrKcHRFAs2AhQjFuDNJTUXQyDxNPvW29cxPbIB2flsCNWk9IAL2Q+eR09I9VMVDMH1kFJSNgyZON0CbvqV5BfULK57Rw1IZtmThMq5timcdI/gAIEka1M7KM2meXZ2SNtcD4A5u8ta4St2RMlfJ/b0c7+/FJ5jxWR73J5GuxrJwjuqEcteOZX+TI9jb4oP2oNKDuUYCjsM02lU9IOhDPL4SU1edkzd0V5SPB5F7KNSMgHaxVhUxhfw1HmijDt7CbfmBHj/s8nMl7m5alQtCig4YM+Yn1+V3zJHFUiJ5o5tfySbuLPI2QB5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Srx2gP55cPkPctkvvrnY2jU9FY3K6rCDD7M/K0qYNM=;
 b=lR+zBw32jg/Xdou+WKkLGKzPJ495kLqSvl6cxGT+tKDPvIuryEKOt/7ADadxO7HC17L9AwFDx4Dib/MaUmquModc1I7KTDi/bvc+iWvF7nZIs9YnkxspLOb4EFiqvlnXxxGIa+bG6FgHKu8aKCsCajTX3nzvJsBmgys/RPTHi+XBEcdHsk2N5ZGKyVGkijUL8sBXT7GD+ZfLsES8e7IU3qr95s+ehmsmES2o3ZchDMiYDszsQ7OeiJwe2eoOukt3Vrqj4JFyBHkWlQZVIMdNYP2aQGFJ9LIDSnqsOTAKo+MfjELGa9bx4ywarc6OVG16DIFln0ZoyqOF0kSUgcvkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Srx2gP55cPkPctkvvrnY2jU9FY3K6rCDD7M/K0qYNM=;
 b=VK/ZyPcWZxCcvM+gsfL5sxGHLpFiyOdRWV6u/eoVls9UrNERwqanmXVLrmNt1SU0ZZdeXS79L/cqmRR8T6R/qnEc9LRFguf6qJBuDy0HxucY10667Agk+UmTf4hJl9DMHLooZQeatt3BGrdrQB+f18VECylcQap7/L/0MPOZqnw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 02:31:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 02:31:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Avichal Rakesh <arakesh@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAARK9gIAAOv8AgAATwoA=
Date:   Thu, 20 Apr 2023 02:31:25 +0000
Message-ID: <20230420023123.hkde4t2ayrrri2lb@synopsys.com>
References: <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
 <857134d6-1537-4879-9c1e-b7067d0fdeb3@rowland.harvard.edu>
In-Reply-To: <857134d6-1537-4879-9c1e-b7067d0fdeb3@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB7522:EE_
x-ms-office365-filtering-correlation-id: e1c3d0cc-9805-4ebb-036d-08db4147568b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kTgqZ2kkkZ4B3jipA6ZfZ17ny85Pca/IeTBL/h5/JNrwj91WAzy1ksR8M50+zmuQKJAQNjZd/LCjJEDQq7Ckq9gkxBJFDsryx/eFTB9ktopbU7c4FwcxUDJ+H8lm/J86Sg0hhQ+SG0Sjo9GB0Ujd+fa5NVI3NLlC2vaT/5C8nnFKnq+MUZx2s/eWmAcm9X9+gJAqWVhyyjv3r6GBMUnzZGKZiom5rD4ch6XqgnZ2c9NpmF1ra0FyycfMb8ufQB+PheBHeVgq5dfRPQM1afW3NupNPbSeOI/auWE2Th61Gw50zw1AeUHmRfy+BFpJf18LXmAyHb5X0qRZQ0EosWR21RbX8MbqgqVXZK7P+hqw7102FnILsfd37nOoqGR87Sv/tBWsTZAN/0F3pAzySHcQX8hmQeTvVkmQStxkI42+op49+sQl1+5QqbnxhCG71gXwFVxsLfd9yhT6moZ/psy3EYHh/LTr6CCbBSeF+3evzcBwzBQo1f/wpBnewIl0nSyiIWEb2j6UlcSByZlbb+nOKt9O5e5EAi5qhUIbBMDZA33JDzs55vKMRxBX651kIFQ9U0fg/eNMGdtVxu1GTmAUsgobXZ/1EQJ34EI+zwPXph1fwxq8QF8A8kKoYovuaRgx5ULm5F4NTr9ORa++MZIaqoKI9OYDKcoy9VIsVgX9w5c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(54906003)(71200400001)(478600001)(6486002)(6916009)(83380400001)(316002)(66556008)(64756008)(4326008)(41300700001)(26005)(2616005)(186003)(66446008)(6512007)(1076003)(66946007)(6506007)(76116006)(66476007)(5660300002)(2906002)(8676002)(38100700002)(36756003)(8936002)(38070700005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzA5b0tBQTg3QWhLdFdmT1N1aUdZWWdtMy8xaUNiVW9VSTB3NEt0TVFFOHRY?=
 =?utf-8?B?a1RZUUYyclNxOTFvOExOVzloS0dVVnJDdFNETXdCNW1OdDZaOEVOZlpJV0lH?=
 =?utf-8?B?QTg0TFFpL040NnZtR1lDd0c1cmhYTkI5Y1dOQXo1anVFYzFYTG5QUmd5WXV4?=
 =?utf-8?B?Qk1hdWk5ei9WWFplRGxvaWxGWVdqYUJqaTMvSkYvam9ld0Z1L3FCNkRTUHJy?=
 =?utf-8?B?NlU3WWhwWnd4Vkt6R2t3eGdYZTE2U0hyTzB3d3cvMDlySlBTaXQzeXpRZk9k?=
 =?utf-8?B?NUg3VXpWbUx2N1M2TUlxLzNyaWZIeE5zWmRGS1N6SUxTc3ZTWE4wa2JJK3ZJ?=
 =?utf-8?B?UG84c2V6QmxWcnBnMTVzK3AvZjJzRjlYYVJxOVYwRDlqMjRERlF1SlI0cGsx?=
 =?utf-8?B?b3BpNEdPdXhkdllzYk1VTGVWK2tGb056MDd6WHJ5d3BGQXFRWEdJQkdMdlJu?=
 =?utf-8?B?VWdjcVlDcEcrK2d6N3VEZ0QvdXd6ZmhFM253TWNLZ3BTNnhKNjg4L0RPTzBL?=
 =?utf-8?B?bDZ4dDlQeFRCYWNaa0FPSEhqZG95ajl3dEhwY3JmdVJFZzNpeUNYbE1TRTZ3?=
 =?utf-8?B?TS80Z1lsRHltVXdabThCM3NycWhRMlBTa2tZcDkwUmRBVG1vblZHbkQ4NWs4?=
 =?utf-8?B?UWlMUmM3a0xBUHpKb3RpTzJEWjB2L0t1OHdaTC9MVTVvdlJoZE5hOVNxeHlP?=
 =?utf-8?B?MVRta0pVL2p5ZXpVOVFnZjRFNUt0MFBRcnJVRzh2SGhQekpta1FtZ2pvWVZG?=
 =?utf-8?B?ck4wUjFYb2ZoNlNmT2NlNXdad09mbjR4LzlzcVhRUVBWZW51VXZ4WklkSEVN?=
 =?utf-8?B?T0JTMDJteU5FVHBpMFU2bzg1MG01U1d4SDBycWUxWDFxWjBMWFdMTGs3djNF?=
 =?utf-8?B?emJaaXVQeHIvV0plbFovQ0N0UmxkckNSUE5HbU8veHZuQ0x6VWpzWEM3elIy?=
 =?utf-8?B?Yyt1cU9PdWlHZ3BrS0lGaitzc2hjVURDWDYzSVZ6T0tEdXF1bFRiTG9maUFT?=
 =?utf-8?B?c0tLckJpckVxdzJCWFgrQVFkbjNOaWpVa2dxT1RUcGtiVk8xV1RUeStaczhJ?=
 =?utf-8?B?czBDalRBeGFpWkNvTXBPeGhqVE9zSXdWZngrRzJQOC9pOCtjdS9MSGNDR1p0?=
 =?utf-8?B?V09BbXd4Y0RrTzloNFgvdFBRVXM4ak1VYWdRT0hWMUhzS1dwVjZ5YzlWSnYx?=
 =?utf-8?B?cThzWWNqODdOc2I1S0h5U0RKMTIwRVA3eVJYblBwSENuL3NyTmxVYmRmcTlY?=
 =?utf-8?B?VXgwTGZndW5GSnRqT2k4SldtMWxrS2oyMWZLcENiWVoySmRnT2RiYUlVUnRY?=
 =?utf-8?B?M25ZcjNXQ0ZnUWszcS9oSjY5TmRKQm81TU51a05lRWo3dVVLcjYrWVMyN3lR?=
 =?utf-8?B?cU1EWm4yd2NPMEUrcE9FUncvcjdlMy9pZUdBT0RYVTZhY05wTVkvS0N0QXVC?=
 =?utf-8?B?YXNiTzRJSDdjK2hHcHB2YzhZY2liZm03Vk5GMDhzQWIyWDlBaEM3ZzhQOXNj?=
 =?utf-8?B?Rml3eU5lR3ZVZk1pSlhiRVhUM0RJbk1jSnNEQ084c05SWTZlVlZDOEV1bk9a?=
 =?utf-8?B?aTEyV2pvRmV5cmpNNVY5UjJ2ZTlLTVpJU1p1Y1ZaTE40akJsNDdrQ2gwMUVD?=
 =?utf-8?B?bExPMC9oaTdOSlJ4NWRnWUZIZDZ3Y1d5UjNXa0l2WnhBekt3dzFxUWIrL3hU?=
 =?utf-8?B?OXQ0OUdnbWpvcWlHTFBGWVFzQ1lUQ2pkd0VnRDlWaVBHS0VTQWdzU0ZZTTJm?=
 =?utf-8?B?YVpJTXl3dFB5ZUtEVmdNVVpzTitTSzEvajd2Mlloc0RJVjBUOTdmVTMzZnB5?=
 =?utf-8?B?UnpIK1pVeXZFMWw5UnhNS2FTMisvT0xtR0EvMHpOVE4zT3poT25EUVNqUnor?=
 =?utf-8?B?Tlg2bnUxbWMwV3dvSHVvZytyLzBtYU93MjczQ1pFVEN1NysrOS8reFFsNExR?=
 =?utf-8?B?NzJOeGZqMlBMUHA1U3ppbTkzOFNxb0l3cVgveEY1dnJ6L1A5NjNiK2trS3Jm?=
 =?utf-8?B?Ymc5OGNRRnVaWG0zLzhxVndxZklyUHVWK1pZVjFmS3VoVSt4TWtvZ3pOOFNY?=
 =?utf-8?B?RDFKLzVhNXM0WmxBcWQzRTE0cWRqU2tTY3dST1JTN3plQzdXNUdvYWxPZERV?=
 =?utf-8?Q?ulTaUSjGTolxUPBD2vewjvDHa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F217F9906B9164C98E4DB47909A5189@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UVp4TVFjUjBycEUzTWRjU0lkejVEcFVkSU9STTBUSU9GNUZsb2RQc2FVeFFF?=
 =?utf-8?B?cElvdEMwQlZGcnpZRFBOdkhueUJnR0FUd09XN3N5Z1pvVmo4UWQweUZTZy9v?=
 =?utf-8?B?eDYrbWdtZWtEMUhHNXQzTHl6UllqUE83VjVBTDhLbUdlVFE0RFNOa2xxQURG?=
 =?utf-8?B?NDkzZ09xWVY5U3pRUTdxSHQrVmRpZXk3U1BENXdPODVVMUJkM2NGMGpiUVdR?=
 =?utf-8?B?c3hpZVNGWDRZZ2NZSG1zU3R4OFZXcUhUNUFZSWFyL0hldmduMkR2amlLL1hl?=
 =?utf-8?B?TlRkOVNBTzB3eTV5RWpzako2RSsyYVNLY0djcEJYT0N5VmIwamRGcGJBTW40?=
 =?utf-8?B?ZFJDUVBySlFSSFNUay90WEYraXpiNFBwaUpVRmsyNkxZckV1NytCcll4REwy?=
 =?utf-8?B?STZSbUpaeGhwWi9XZ1dRajZ3L3BPMEswOUpjb0g4Z1dLcWZqaFlKdUFtZUF0?=
 =?utf-8?B?Q1dFb3JCRWpvZlBqTEhTR2dQYTlsZHR3ZkV5S2FnMXRCL3l5Ynp0UWYxbE5L?=
 =?utf-8?B?UGJ1MGxYSURvTDhSZ2sxOUQ5WGFlaWdaMEEyVkwxN1VvZkNwUTE3SmZSL2tN?=
 =?utf-8?B?U2hiV3dibVBpdGlXS1dGQndLVmJpV0hjK1RoZmJQVFVtVlV4eUJxSU5POFpx?=
 =?utf-8?B?ZHpDb3k1dExiT2ZNZTRjZTRpdkZ6TVgrVmhsZlh0dmVHd05xbWt3dklUbU9h?=
 =?utf-8?B?b28xcGFIRUgyeHhZMlAzUmJ6ZC9adTBoSUZSM1E0ZU4wYnBpNVc4TWg5Um5h?=
 =?utf-8?B?SXVxSDNoZE5LajJVajZPbnQ5Y0V1RWNmS0o3TVlFbFY1VmNQWHpKMWFQS2lO?=
 =?utf-8?B?S2t4L0FrZS9WTFl1Unh2UmwxcURHMDhpa0poUDJhSGNXR2xWOExsZVdIRGxn?=
 =?utf-8?B?QVBRYStGWFlaSEtTWGl2S25QTy9EMHNzSlVUZFNBdEdUcXp0bFI0NzZuaGRS?=
 =?utf-8?B?UzUzNCsxWVNlaGVzc0FnWnI2T3ZIdnNreHZyN1g1NVhYeG9vMWNQZi95VDdp?=
 =?utf-8?B?S0xob0RxWWlldm45TXdsU1FpVFlPcnBZUmZ1bVdtNm9tYWJ0OEhRb3JyckVu?=
 =?utf-8?B?ZzNKNVZYdlZCUGdQVTVyMys4aU43eUpGODJoYTlCS0YycFlnK1JTb1psTXBl?=
 =?utf-8?B?cUYyVW5mRnIrREpDcG9tT0p0S0pFUGJaQTNLWjUvcVVsTFFGQk1KbWpFbEhC?=
 =?utf-8?B?QitUOVBCS05SWjgrWVVSY2ZxUXdKdlUwSk82eSs4eWtocTZPV04wY3BCQ0lw?=
 =?utf-8?B?R1Y1NEZ0ZXZ3anpMK0lBMlhaYXViOWdZQ3N3b1EyQXNxenpkaWFUM1ZuTkRO?=
 =?utf-8?Q?K0VG1C7GlfhZw=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c3d0cc-9805-4ebb-036d-08db4147568b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 02:31:25.3166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYqCdPO5M6anA6baM3+PJCn5r9Iqq/21MmqhxtheWRqeXEA+E5loga3FvBVIaJwssdZuzrb0O2laiKq68RyzOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522
X-Proofpoint-ORIG-GUID: O_CWrcSVhyKaRPbMHwbHhKPoON95tL17
X-Proofpoint-GUID: O_CWrcSVhyKaRPbMHwbHhKPoON95tL17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=895
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304200017
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBBcHIgMTksIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwgQXByIDE5
LCAyMDIzIGF0IDA5OjQ5OjM1UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBCeSB0
aGUgdXNiIHNwZWMsIGZvciBJTiBkaXJlY3Rpb24sIGlmIHRoZXJlJ3Mgbm8gZGF0YSBhdmFpbGFi
bGUgYW5kIHRoZQ0KPiA+IGhvc3QgcmVxdWVzdHMgZm9yIGRhdGEsIHRoZW4gdGhlIGRldmljZSB3
aWxsIHNlbmQgYSB6ZXJvLWxlbmd0aCBkYXRhDQo+ID4gcGFja2V0Lg0KPiANCj4gSSdtIG5vdCBh
d2FyZSBvZiBhbnkgc3VjaCByZXF1aXJlbWVudCBpbiB0aGUgVVNCLTIgc3BlYy4gIFRoZSBjbG9z
ZXN0IEkgDQo+IGNhbiBmaW5kIGlzIGluIHNlY3Rpb24gNS42LjQ6DQo+IA0KPiAJQW4gaXNvY2hy
b25vdXMgSU4gZW5kcG9pbnQgbXVzdCByZXR1cm4gYSB6ZXJvLWxlbmd0aCBwYWNrZXQgDQo+IAl3
aGVuZXZlciBkYXRhIGlzIHJlcXVlc3RlZCBhdCBhIGZhc3RlciBpbnRlcnZhbCB0aGFuIHRoZSAN
Cj4gCXNwZWNpZmllZCBpbnRlcnZhbCBhbmQgZGF0YSBpcyBub3QgYXZhaWxhYmxlLg0KPiANCj4g
QnV0IHRoaXMgc3BlY2lmaWNhbGx5IHJlZmVycyBvbmx5IHRvIHNpdHVhdGlvbnMgd2hlcmUgdGhl
IGhvc3QgYXNrcyBmb3IgDQo+IGlzb2Nob25vdXMgZGF0YSBtb3JlIGZyZXF1ZW50bHkgdGhhbiB0
aGUgZW5kcG9pbnQgZGVzY3JpcHRvcidzIGJJbnRlcnZhbCANCj4gZGVzY3JpYmVzLg0KDQpUaGlz
IGlzIGZyb20gdXNiIDMuMiBzZWN0aW9uIDQuNC44LjI6DQoNCglOb3RlLCBpZiBhbiBlbmRwb2lu
dCBoYXMgbm8gaXNvY2hyb25vdXMgZGF0YSB0byB0cmFuc21pdCB3aGVuDQoJYWNjZXNzZWQgYnkg
dGhlIGhvc3QsIGl0IHNoYWxsIHNlbmQgYSB6ZXJvIGxlbmd0aCBwYWNrZXQgaW4NCglyZXNwb25z
ZSB0byB0aGUgcmVxdWVzdCBmb3IgZGF0YS4NCg0KPiANCj4gPiAgVGhpcyBpcyB3aGF0IHRoZSBk
d2MzIGNvbnRyb2xsZXIgd2lsbCBkby4gU28gcmVnYXJkbGVzcyB3aGV0aGVyDQo+ID4geW91IHBy
ZXBhcmUgYW5kIHF1ZXVlIGEgMC1sZW5ndGggcmVxdWVzdCBvciBub3QsIHRoZSBob3N0IHdpbGwg
cmVjZWl2ZQ0KPiA+IGl0Lg0KPiANCj4gRXZlbiBzbywgd2hldGhlciB0aGUgZnVuY3Rpb24gZHJp
dmVyIHN1Ym1pdHMgdGhlc2UgMC1sZW5ndGggaXNvY2hyb25vdXMgDQo+IHJlcXVlc3RzIG1ha2Vz
IGEgZGlmZmVyZW5jZSBpbiB0ZXJtcyBvZiBmaWxsaW5nIHRoZSBzbG90cyBpbiB0aGUgDQo+IHNj
aGVkdWxlIGFuZCBwcmV2ZW50aW5nIGxhdGVyIHJlcXVlc3RzIGZyb20gYmVjb21pbmcgc3RhbGUu
DQo+IA0KDQpUaGF0J3Mgbm90IG15IHBvaW50LiBBdmkgY29uY2VybiB3YXMgaG93IHRoZSBob3N0
IG1heSBpbnRlcnByZXQgMC1sZW5ndGgNCnBhY2tldC4gTXkgcG9pbnQgd2FzIHRvIG5vdGUgdGhh
dCBpdCBzaG91bGQgYmVoYXZlIHRoZSBzYW1lIGFzIGJlZm9yZS4NCkJlY2F1c2UgZXZlbiB3aXRo
b3V0IHNlbmRpbmcgMC1sZW5ndGggcmVxdWVzdHMsIHRoZSBjb250cm9sbGVyIHdvdWxkDQphbHJl
YWR5IHJlc3BvbmQgd2l0aCAwLWxlbmd0aCBwYWNrZXQgYWxyZWFkeS4NCg0KSW4gZmFjdCwgdGhh
dCdzIHdoYXQgdGhlIFVWQyBkcml2ZXIgc2hvdWxkIGJlIGRvaW5nLCBieSBtYWludGFpbmluZyB0
aGUNCnJlcXVlc3QgcXVldWUgd2l0aCBkdW1teSByZXF1ZXN0cyBhcyBzdWdnZXN0ZWQgaW4gdGhl
IGJlZ2lubmluZy4NCg0KUGVyaGFwcyB0aGVyZSB3YXMgc29tZSBtaXN1bmRlcnN0YW5kaW5nLiBT
ZW5kaW5nIDAtbGVuZ3RoIHJlcXVlc3QgeW91DQpzdWdnZXN0ZWQgaXMgYSBwZXJmZWN0bHkgZ29v
ZCBzdWdnZXN0aW9uIGFuZCBVVkMgZ2FkZ2V0IGRyaXZlciBzaG91bGQgZG8NCnRoYXQgaW5zdGVh
ZCBvZiByZWx5aW5nIG9uIHRoZSB3b3JrYXJvdW5kIGluIHRoZSBkd2MzIGRyaXZlci4NCg0KVGhh
bmtzLA0KVGhpbmg=
