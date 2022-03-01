Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E38D4C8032
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 02:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiCABNf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 20:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbiCABNd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 20:13:33 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D586371
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 17:12:51 -0800 (PST)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3D261C0122;
        Tue,  1 Mar 2022 01:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646097170; bh=7wkE8Z4zHAgElZakTv10DJpMUiiFp1qWDKVXQnJWG9M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=e90vxwSqdImzc+8Gm16YiQo7CUr1FIVSJ3Vz5s2Yw6+OVW1mbbm26kvS/+IJDlq+j
         GtwkA1zPbVm8RYYlbUDtAEdLdrOlqusNnEDwhJ0fYjXt9/KAgkqxuAwKH/duc2Mmnp
         Q6HpJ8+bWnshlt9ShMGhs4OoyfDiKg6h2fBaBvme6Pmsh0yXXxjb1lgyUVUnnvaY2l
         p9VxmRiv9vBuSYxCbz+lbmhCN4ZG8J0Y1eNre591E6i+UoIOL8J87XZt+Rmz2Ar22N
         /LBUGEMDROSbu3tPDaTpa10wtq513GALZJXupWzhlj98Xp1QJPqquq+bUV3vetAOcP
         jWQF4o5RxpF5Q==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 27F91A0085;
        Tue,  1 Mar 2022 01:12:48 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 93CE580078;
        Tue,  1 Mar 2022 01:12:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="u13e6h2J";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q22tio007rxAYuRDpsnZTE+QoEftzRuNe2zFZSJCyGAOcxqa/+/NefjA/Eb9NhcHGI8Nd6n4ZBQnZRfRn2XD5a9eZez4mRwf6imq38PKk6ETT5fMr1qFD6zi72lobDwFxit50n1S1SjXo18dg7juz4tu7yMt33kxJMLgL3ibX9vQPxvq2FtVohD4gmS4zxnmrDQ/Q8IlPm4Ho4jIQz8G1MuHFCfUfzeapr82aRS68GpDMaakGM95y7iTRvoYJCZHa6JXSyh92YB/OGaWr280LfOiwTdbb0F1sKgnsFP9jlwWqrcEg5iw52EWFCOwooq0L1yt/I++MY2bbV/c5UM/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wkE8Z4zHAgElZakTv10DJpMUiiFp1qWDKVXQnJWG9M=;
 b=nRnZzU/cDi9rm228iir5hrjHqOrjq12XYA2HFv0SYTX6tJm5dcc6m6hY1OEBJXsMrOeXjr9sKSBBRTsxgOBcDTkk+zFnOnvbyP2Hn0RtEyLgbr543eYcmjLmy1kR8Ygk4X8YKnhtDTiOsqfGSQcvnL7jutsQ3upyoER+3LS+sKZlPNsz43t4Qf5Tnr7Z3Ta3Ika+pi2HVm5GwFkJF+vOv8LjYveyR/H9tR1kElL2Mk4ihM4aZYjyzIsq7cigfsQ3IizVphRtsWPvpFsszNEN5LxiVm1sWTZwfQgjqhNBFFRmIDnbBpljHXkV0wj8gpmoQ2C5I73KXAS4P9pnJRTOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wkE8Z4zHAgElZakTv10DJpMUiiFp1qWDKVXQnJWG9M=;
 b=u13e6h2JhaUpT3O4tCB/Bm8a5+2ObEz16Ua7wgjfV4VdAjhbcdxS//Z+ZN3VbE64MKDLkDVo70rxUa46IOWANp1Bwjazt3B4Q6g96oYGE0Og53rF7Iuc0HQ+pJz7+e+X44hs/RzySW5a4vgs5gXPtW2RDwbxgbVAWawFq/8h1TE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN8PR12MB2884.namprd12.prod.outlook.com (2603:10b6:408:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 01:12:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 01:12:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: EP_DELAY_START is only handled for
 non isoc eps
Thread-Topic: [PATCH 3/3] usb: dwc3: gadget: EP_DELAY_START is only handled
 for non isoc eps
Thread-Index: AQHYLLUalnzRS7LaFk2Hp0AgzktJt6ypuXUA
Date:   Tue, 1 Mar 2022 01:12:37 +0000
Message-ID: <3f2ae881-363f-c4de-5269-75b42f5320c7@synopsys.com>
References: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
 <20220228150843.870809-4-m.grzeschik@pengutronix.de>
In-Reply-To: <20220228150843.870809-4-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40a8c564-f0bf-4232-703d-08d9fb2092fe
x-ms-traffictypediagnostic: BN8PR12MB2884:EE_
x-microsoft-antispam-prvs: <BN8PR12MB2884522E3DEFA9F339E3B79FAA029@BN8PR12MB2884.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H/1OW9pGK7OdRVsXq6jnonT220mN47p60UnL6cDyegJahESFmcUxKW0tc0T0QMOKkA0zvIBM7MnKsXXXNHGTmcJgUlEAqTFKTXRY+wYPt0tS5G0y7P7A3PEzgBFd/1THmWZSghenERRyCVOTwPeKRtJ2advWkQdPkyg5D/B6+IN+712TtmnQLtGF6ra2B1XSpd+8/rGz167gGUTNsicpt0mFePDGT2P59iXM6vHggwqBElTzq6nuCug94szlpgML5YGbf0OWna6nxB7alLWLnWHy2DwbyBkVE4JkvXB4vdJ2d4Pqd00dzSjqWcjc6sDzJNlgwYGVmffwMfoSiF6EkHx36JD5r5NxGUUJ9Qesw5ww8DDrrF76A7XSOvrgpFPMUUtACIfqq1bEJDGkLI8wHvVhJYWgPyhOw2W4Q8pifN6mEJiTxqmAPLy10QcOfOuX1NaLkTiYBhqYpOdrSHvnbKwvY1kxPJZsAuBzrFDEemBNXxWWcWXbFHeSMMvByTWFTZiOboKU2vNJC26peZR5Msdtgrm0Hv239yKtZ1hPmsMpTeoAfEjbRTBRPwrUexDQcd8KYM15uwfER4bmFS7F7/f4UfU4aglF6Xv/+zXANzaZAXDCjZ/tk1ZLEw83eP1cPHGy0VPl/Fa8x26m7tUYM6RXXNQq2H22DphCVw9Bu7Fi7JNdlpRnKBfJJ0anuNOEkdKJpdpX4hr4QliRLnu0V/XuEwLkozSOkfi9RvrjkT0JbcwVy+wWYvMgnKY2GKQTMeuxloe3qJxQ74rLJdFUAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6486002)(36756003)(54906003)(316002)(110136005)(122000001)(38100700002)(8676002)(508600001)(2906002)(31696002)(86362001)(4326008)(76116006)(8936002)(6512007)(66446008)(64756008)(66946007)(38070700005)(5660300002)(66476007)(66556008)(186003)(2616005)(31686004)(26005)(83380400001)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzR3a2MrODV5Vjc1c0I4S3FGVXRzVTIvQnRMRWxUMURNREN0MVpXNGdvUWJH?=
 =?utf-8?B?MjdhK2lxOVhpUk9qK2h2Q0NtejJ3QS9lMkRVQnVHRmRRVGszQWF1WWpOQ1pQ?=
 =?utf-8?B?YWliaTJyUzl1cC9NcGJJSVYzSlRBbVhReEZXUmFrRStCM2dYQ0F0TnpGQ3VO?=
 =?utf-8?B?eWZYK29sSExRZTRlbFpFbWowbTRPQlJLdjFKdEtySGhmZlBGV2c0WVVHL2xZ?=
 =?utf-8?B?TnRuODZJMlFrczFwNjNTNW1TUXZlNDFXb0NrV05PUEp1bUFacVU3ZU9vK3pn?=
 =?utf-8?B?YzM5UFFnTGpBZytTbWdPalZ1UnlJNXM0V3hZRkovdWc4WHVPenBvR0NVMFk1?=
 =?utf-8?B?SWNkeGgxUnhqZTVsTWFnWGkwREhFS214RGFUUDdWSnhVc1dUYUNrZ2tHZm5S?=
 =?utf-8?B?WjNyY3FOMFVUajkxbll4cjFFczljQkVDQklKcXN4blVpU3Z1NnB3cmZDUnJP?=
 =?utf-8?B?QzUwcmRsNHlNaXhvUm1kZ2hGaVowN09aT2hBbFY1SVIyWm00T3VuS3kxZW1h?=
 =?utf-8?B?MGF6MEFlSkh2RlZXODFwblB2NFlMcnZHeHNYNXVWMVlaQ1hOb1NLT002VzRL?=
 =?utf-8?B?SVBVMVdGT0NZbHV5cHEvUWViOXdna2JsT0JXR1JtVHNVV04valp3anFHOHFv?=
 =?utf-8?B?dTN4UVBLVVp3MWgxandPemNxaGRqVVhMVUIwMDZJRzVqcldqZzMxNnU5ajJ1?=
 =?utf-8?B?b2xnQ1FkY0lLcGlBSW9BZ0I0L09qazNDOVFMRmdTdHBESnQyOGFkYlNBRmFH?=
 =?utf-8?B?clJ2dHRoQW56MHhFOWxVcFBpcVVuMlBJdHFkNXRCdVpsRjJ4UEwzSmx4Q3k4?=
 =?utf-8?B?eHllKzdKZHRrcVNBcjVFcmxvcm1CQW9qMVc4NHJLckpjcW85OWM1UStSbU9P?=
 =?utf-8?B?RnpsS0VGT1l3RlAzMmFIWkVwcWNNR3UxbWNqVG1BUnNDZTR4QkFOd1YvaFhB?=
 =?utf-8?B?MXJOVGc0RC9FNzJFVzlDc2hSbFNaalZBTTZYb2I1L3VnRmdRZjhDaVdzcWFk?=
 =?utf-8?B?d1oreTd5ZXJ1NmZwMVRmdmNLQk9zWk55cGJxeHNFS05jb1dOcnN6ejhvTTNW?=
 =?utf-8?B?MEQ4Z0thdnNUM2Vza1E2cTlRSTlUK3B6anFJQmhscUdhUFZKdzB5VVVwYUxW?=
 =?utf-8?B?MW54L2JSR3loamk2aGRkUW9Pbk8yaVFkUVc4bjJqNHdVMnJRN2VScDdCWDFu?=
 =?utf-8?B?VWM0M1VjclVyYVU3VUpENGhpKzBBdXFEN1B4ZTQvdXI2QkJuOVdWdnNheUxU?=
 =?utf-8?B?SEM0V0pCMjZDYzRXaFR1U05NV3I5NEhUNEFwa2ljbFpKR3BmNkpmMlZkRHpP?=
 =?utf-8?B?V2ZSWEQxMmxxNUpJQzEvck1oR2FkRVh6SHkrRVh6cVBMdEZJd3lhYnRDVzFQ?=
 =?utf-8?B?ZnZEWTdqa2ZtSlB1cnY1YmYwelFWSWM2TkNGcFhHOUJQelpGeGVLdWh5ekZT?=
 =?utf-8?B?bTIxcDNib2NpQm84akI1Q0pOVGc0VGRsWktRTWt4K3lBdjVxeE8xdmszS0R1?=
 =?utf-8?B?RW1TMEkrbG5wTi9OQkk2cFluN0drQk1UVDVIYTZHOGxsdDJka0ZMMGF6NHAy?=
 =?utf-8?B?K2ZjRWFkTER2TkNlbGkwcG1vdkxkOVdKMGV6aWxYbmR5SVFxNkJqWU43Yjdy?=
 =?utf-8?B?KytLaFhrMGVkTkdBUUdYbkJkeXlOVndkWTBoRWtYK3ZUOGZMeGVqRkVMYm9u?=
 =?utf-8?B?YjV4LzBLRjJENHd3YmFLN3VUS09CdTk4MER5NlVyTjkrdmJoMTJCdGQxN2hL?=
 =?utf-8?B?TUdINWhwWnJ6UDhoM25GeXpGYWxCTGJjd2JmUVhtMW45YUgxTzNCTnpBY0J2?=
 =?utf-8?B?UUxRMVZCUDhwNWJpV3hDL25GeXUvZTh4eVNzemIxak51N2tIZkRBZjJ6VXZV?=
 =?utf-8?B?am5JSXhjUFV2UDdLaTdsbitCaGNabk1NandMdzl3YWVWelFNVkh4R2NueHN3?=
 =?utf-8?B?T1d1Uys5R2FWYlA0N3gyOGd5SVNEenpYZmYvUXJBT244WDgyVHMwbkc4R0R4?=
 =?utf-8?B?bTFvVkVVUzRmbFNtT0ZGZERhU2NLOTBieFhhR3NjTW9GMXJXRk8yQURXRmhU?=
 =?utf-8?B?N0JTSXRFN1dBclczaWRIT3kzL3h3NTJPL3hmZU5mVzJBdE5MQlRMZjV4TUxs?=
 =?utf-8?B?cVVSazkzb0hLc3A4ZjlpSURtd2xhekFVQUZGNWd3MVh6SmJSa3BPVlVLRXp4?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <131E98FBD62F8444B5B96AD0A8C2F022@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a8c564-f0bf-4232-703d-08d9fb2092fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 01:12:37.2528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWNFpwRdRGqy3Rttb8ow6yibd/Dyg/UPhrbz9Gx+YLafLUYXBI/qahi7gUvX0sfuF6P/vYsR1PSNkARK20BOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2884
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBSZWZhY3RvciB0aGUgY29kZXBhdGgg
Zm9yIGhhbmRsaW5nIERXQzNfRVBfREVMQVlfU1RBUlQgY29uZGl0aW9uDQo+IG9ubHkgYmVpbmcg
Y2hlY2tlZCBvbiBub24gaXNvYyBlbmRwb2ludHMuDQoNClRoZSBEV0MzX0VQX0RFTEFZX1NUQVJU
IHNob3VsZCBzdGlsbCBiZSBhcHBsaWNhYmxlIHRvIGlzb2MgYW5kIEVuZA0KVHJhbnNmZXIgcGVu
ZGluZy4gV2hpbGUgdGhlIEVuZCBUcmFuc2ZlciBjb21tYW5kIGlzIGFjdGl2ZSwgZG9uJ3QgaXNz
dWUNClN0YXJ0IFRyYW5zZmVyIGNvbW1hbmQuDQoNClByZXZpb3VzbHkgSSB0aGluayB3ZSBoYXZl
IGEgY2hlY2sgZm9yIHRoZSBpc29jIGVuZHBvaW50IGFuZA0KRFdDM19FUF9ERUxBWV9TVEFSVCBi
ZWNhdXNlIGl0IHdhcyBpbnRlbmRlZCB0byBjaGVjayBhZ2FpbnN0IHRoZSBoYWx0DQpjb25kaXRp
b24sIGJ1dCBpdCB3YXMgZG9uZSBpbmNvcnJlY3RseS4gKE5vdGUgdGhhdCBpc29jIGVuZHBvaW50
IGRvZXNuJ3QNCmhhbHQgYW5kIHRoZXJlJ3Mgbm8gU1RBTEwgaGFuZHNoYWtlKS4NCg0KVGhpcyBj
aGFuZ2Ugc2hvdWxkIG5vdCBiZSBhcHBsaWVkLiBJZiB3ZSdyZSB0byBhcHBseSB0aGUgZml4IGZv
ciBpc29jDQphbmQgZGVsYXkgc3RhcnQgY2hlY2ssIGl0IHNob3VsZCBiZSBkb25lIHNlcGFyYXRl
bHkuDQoNClRoYW5rcywNClRoaW5oDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgR3J6
ZXNjaGlrIDxtLmdyemVzY2hpa0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
DQo+IGluZGV4IGI4OWRhZGFlZjRkYjlkLi5kMDliZDY2ZjQ5OGE2OSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jDQo+IEBAIC0xOTAxLDE3ICsxOTAxLDYgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X2Vw
X3F1ZXVlKHN0cnVjdCBkd2MzX2VwICpkZXAsIHN0cnVjdCBkd2MzX3JlcXVlc3QgKnJlcSkNCj4g
IAlpZiAoZGVwLT5mbGFncyAmIERXQzNfRVBfV0FJVF9UUkFOU0ZFUl9DT01QTEVURSkNCj4gIAkJ
cmV0dXJuIDA7DQo+ICANCj4gLQkvKg0KPiAtCSAqIFN0YXJ0IHRoZSB0cmFuc2ZlciBvbmx5IGFm
dGVyIHRoZSBFTkRfVFJBTlNGRVIgaXMgY29tcGxldGVkDQo+IC0JICogYW5kIGVuZHBvaW50IFNU
QUxMIGlzIGNsZWFyZWQuDQo+IC0JICovDQo+IC0JaWYgKChkZXAtPmZsYWdzICYgRFdDM19FUF9F
TkRfVFJBTlNGRVJfUEVORElORykgfHwNCj4gLQkgICAgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX1dF
REdFKSB8fA0KPiAtCSAgICAoZGVwLT5mbGFncyAmIERXQzNfRVBfU1RBTEwpKSB7DQo+IC0JCWRl
cC0+ZmxhZ3MgfD0gRFdDM19FUF9ERUxBWV9TVEFSVDsNCj4gLQkJcmV0dXJuIDA7DQo+IC0JfQ0K
PiAtDQo+ICAJLyoNCj4gIAkgKiBOT1RJQ0U6IElzb2Nocm9ub3VzIGVuZHBvaW50cyBzaG91bGQg
TkVWRVIgYmUgcHJlc3RhcnRlZC4gV2UgbXVzdA0KPiAgCSAqIHdhaXQgZm9yIGEgWGZlck5vdFJl
YWR5IGV2ZW50IHNvIHdlIHdpbGwga25vdyB3aGF0J3MgdGhlIGN1cnJlbnQNCj4gQEAgLTE5Mjcs
NiArMTkxNiwxNyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfZXBfcXVldWUoc3RydWN0IGR3
YzNfZXAgKmRlcCwgc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxKQ0KPiAgDQo+ICAJCQlyZXR1cm4g
MDsNCj4gIAkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCS8qDQo+ICsJCSAqIFN0YXJ0IHRoZSB0cmFu
c2ZlciBvbmx5IGFmdGVyIHRoZSBFTkRfVFJBTlNGRVIgaXMgY29tcGxldGVkDQo+ICsJCSAqIGFu
ZCBlbmRwb2ludCBTVEFMTCBpcyBjbGVhcmVkLg0KPiArCQkgKi8NCj4gKwkJaWYgKChkZXAtPmZs
YWdzICYgRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORykgfHwNCj4gKwkJICAgIChkZXAtPmZs
YWdzICYgRFdDM19FUF9XRURHRSkgfHwNCj4gKwkJICAgIChkZXAtPmZsYWdzICYgRFdDM19FUF9T
VEFMTCkpIHsNCj4gKwkJCWRlcC0+ZmxhZ3MgfD0gRFdDM19FUF9ERUxBWV9TVEFSVDsNCj4gKwkJ
CXJldHVybiAwOw0KPiArCQl9DQo+ICAJfQ0KPiAgDQo+ICAJX19kd2MzX2dhZGdldF9raWNrX3Ry
YW5zZmVyKGRlcCk7DQoNCg==
