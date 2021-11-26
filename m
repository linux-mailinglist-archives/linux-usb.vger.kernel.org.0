Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DF545EABA
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 10:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbhKZJyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 04:54:41 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46986 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233187AbhKZJwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 04:52:40 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7B15641EB4;
        Fri, 26 Nov 2021 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1637920167; bh=s9fdLEdaD3QhHq8d6KRQZcvVwnuCCjkHg4OXHsGiMbM=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=YVbDqUt0Bd98ozd1I3mRVWiDrUXpXP3uUwS0Xpv9QxBuDdpQB+7I0myfnxCRb4WU/
         5kyPFDPO83DjuK1WxSiZ9FXzAck3Wip5bZVkrYtvzZ0pfQnydCfAUywiroXOGeozsa
         Zc4V/7IuoGsDfsa6FJx/+wZXTLEctwmSSfM/xn17HhdIlz/LZUWKvhwd39W7oUVnjT
         i8h9XnvE4Ey/0TrlL78K+VAfwfOD8+tThRUER5SWj1JJ6B+YAKmyWYlYgaqraH4L0F
         0V/jyBMsKtA2jyxJUi1GXy9TCkLqIfNnoFGqqNEBjr2ZPBXkFGxA3DSCZ1RMLmkej7
         hZHYy6zahgSkg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 06B47A0070;
        Fri, 26 Nov 2021 09:49:26 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69B7C40094;
        Fri, 26 Nov 2021 09:49:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZLbUTVLB";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aELFV3iVGVYGG+fIJ2NGlRy2QDIXavdQRsi4cGyOcGNze48cXH1rYA9cz0WOg/pgoYNDgo+kWNbJc54zzpAsIy/Y+/oi5cooYNcVFRvTbg5Dg016cUBXl7kL77YGj2/rWqZYGnuJlmD8Zt7WWC5GCZJ7wTQTrkD1IinpEi8KZ38il1AA/vOj/gqH0RFhyyT5rwUlCiL/Cq3O7Glr/J8NBw4BrT1JYVqbCxfUc6uq1ljspdBHfYXOh6HmOKdW1TzPnbV9MrPa/mktdpLZuE4D4reGOgTJIaQPoe7Dn5rhVp2+Bu8v3+a3hrMofc9dnukr4eGUdZh1OZhy9YBkq4hw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9fdLEdaD3QhHq8d6KRQZcvVwnuCCjkHg4OXHsGiMbM=;
 b=TxGsIKhQ6sZdgjWM6dRhAOazj+nnRr0PePPAHdfRWPXu86umLUPb+Aj1+8qtL1cnBNiYlGDCYs0mqi+91nwGXqMYkE2LxRENJldWib+oQX4cGed+IsA9P8x1kdb6R9HdicGwX2mAd0kfnlpetS1geNc5QZ6spKTsHNYW47HqzEDNCqLM8D6n3YzoxB1g+2q0fdmpRE7tdGad57E4K33YZQMsNeHyoGUkEMYGbgLs8T3utbwv3bvQ9OALn8wPTj1lOc78nH7pH0v9DBJExpLl58STQpiwyu+EdtCJcQV2qBp/U3gU32p+znfupcBbyv/HHmm4bsaOeVjK8Y6zNYEYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9fdLEdaD3QhHq8d6KRQZcvVwnuCCjkHg4OXHsGiMbM=;
 b=ZLbUTVLBGv3l5bk2x3zJ7iNTj7rwpx+zlo79bym+ocLepUgts78xvomMxdnCb9F1yKO8E0UBBHnqVanSALHItpEIzetm8WYZbDudj/Tp+HvR+uJtM6oViyxGTRIeePardOYrUwFtdobgnCrIC2tiJU/RvfgJulVJ1zGCkwFmw1s=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 26 Nov
 2021 09:49:24 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::a0da:c3e5:4562:cea9%7]) with mapi id 15.20.4713.024; Fri, 26 Nov 2021
 09:49:24 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Topic: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Thread-Index: AQHX4QaFzYXwmWGutEmQPz5HEETK8awStmcAgAE5nQCAAW2VAIAAJouAgAAPl4A=
Date:   Fri, 26 Nov 2021 09:49:23 +0000
Message-ID: <1931d43c-bee0-c3ca-db40-8a5d578251ea@synopsys.com>
References: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
 <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
 <125ee133-be26-7591-7111-5e945fe4a411@ivitera.com>
 <61f1aa1e-89c0-2f11-1619-becac6f41997@synopsys.com>
 <7254ba8c-af76-2d6a-c896-ac2a3509630c@ivitera.com>
In-Reply-To: <7254ba8c-af76-2d6a-c896-ac2a3509630c@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de564d68-77d2-4892-3d10-08d9b0c2073d
x-ms-traffictypediagnostic: DM4PR12MB5102:
x-microsoft-antispam-prvs: <DM4PR12MB51022EE2105A900DE07A39FDA7639@DM4PR12MB5102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AAsDyrf/E3IQmvzZtiqf2GQFVPG+x0X5+a1dJHanEnl9UHUJzNnLl9iFaXLOh3zThIsq3J30V91a6Yeh4v3zLfAUWVblLFk6PoAPY+ljzJV3N8cKgwNRpZ8Jfga/PJeX9Y8mmdu5PqMK81LjDOylhFMcTVwKNmqS4RHOXpwMEss79Brzd4RY9T06WhqGRqA0BLaITwlhNsrTtPIj1coWVBTI8Yw1TFvte+Hij1fGygr/kYNPL7eh3jVOiJ+yf2zGHqkmtmU7MSyIcC/5fnyRcQngGXkbV4t9NLSASwEqjVB9RpgbSy1FB+E57tv5zf+YhkgUNq+Cnl6JWtVj/6WsyVKQjX+VncZ+aV4m0+OtDspx0yc9CwpPFSOVxio4KOAzMzstcyK0Ca49IzYtngCCsZKTIQ4L2HTG5fwhNBgsMnDpdV870+nSR9kUzs+LQ9tUxI4+/8jh6kjm8GfUxrNWUU9kFF7+GxKN56l/v+3G9PxlEMPz0mVsE6dxOyK9bzNGtZIwpnMm1WHBbNkCDgSxoPtKeoxd8ajY2eR5+KstkfZ3FqHfM7Eo6gpe69yBArGkF+/l64eKervB5ItvA3k3Y9fX1ezRa2ql+LeiJZHtYsshOSj7GxJVzYEHUAUIvBo1sBpkUU7s2FptckDQNz68ThB+HUhakoOwKIxGZcHhgdbGujL5mOVqUUkzLGKM35s5qToy09GhrWUVHA0ry3xOBNP+FIFGhbKrtEe7OxrUNOl74MM4jrQq3Gwek08EsQMOhVm6FtNaHvI2ER2dWto5G/AgBuYie0AXxKgJhqHQCH0B1efzGnsQyu0LS1rrhvx8aMvXuKdSaYYf+IlO3v+GDbAuTtoDtygZgl0yByxecg4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(64756008)(66446008)(316002)(36756003)(38070700005)(66476007)(53546011)(6506007)(76116006)(2616005)(508600001)(6512007)(8936002)(31686004)(110136005)(66946007)(71200400001)(8676002)(122000001)(83380400001)(38100700002)(2906002)(6486002)(31696002)(86362001)(5660300002)(91956017)(966005)(186003)(66574015)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXgwWEhLMVVQeGtYbExHREdhMnkyQnE3alFPR3gxZDh6djlmeXRWNlEyOEtV?=
 =?utf-8?B?YWpTcGhESnJXVVlkOVNObFdsNytvb2VIWDdVWFBiOE9DSkhRL2xIUFJpNC9K?=
 =?utf-8?B?Ryt1V0FkTzJZaGNiaGEzc2lHY1pJbG1aSkwxaW5BaFYvL0xPblpzK3JYUERO?=
 =?utf-8?B?MVAxSWsxaGh5a1pDSkxhMWJqbFg3QVBqbFUxeFcvNDJSVGdGUTd5endSWEZt?=
 =?utf-8?B?MWRpbDFCQVJvcyt0Q2R3b0syMTY3NVRIZlVLa3o3UDlDZC9BNzI3M2xZUkRt?=
 =?utf-8?B?ejJhUkVHc3RXNU85YTBVSldIZDZIdXoxWDErTzlWbzczQ2IzNXB4MlcrRjZY?=
 =?utf-8?B?QzAvVDdxRnpwWDRsVzBDd01wbzJlbHFGY3JBY3MzeU5XeVpZcnFRK0dET00w?=
 =?utf-8?B?cWVtSHIzTS9DTWV6anI5V1M4NXo5dWtsNGZySDlMNVZjdFlHWFlXVFcvUkpa?=
 =?utf-8?B?UkxCbEN4Y1MzU3VKemFyQVl1RDd5Y0lDVlpyOEFURGR2WlJoM1B1TnNVK2sy?=
 =?utf-8?B?VXRITlJGblNLYkFrTnlrWlNvVnVwL2dVQW5BbUsvemU4bm1YQjhWYkZTeHFs?=
 =?utf-8?B?STQ2N3JlVTBPTzUzeGJ3RnR3UWZCazlNaFNueVUvWlFCR0IweTZLM2VRNFZF?=
 =?utf-8?B?ek15WUo1cjc3UDdxTGpIc0lqNG0rNkhJZGJiTFNkL0dIY1p4R3BFOVY5ODh1?=
 =?utf-8?B?dkZiWUkwUldYaTJaQVM2dm96bHpNejJXYkRoTmFrRExkK3p6YlAvTjhZR0VB?=
 =?utf-8?B?RnpNNXR3ejdXZ2JhOTAzL2tlUFNSb2hCRDhMUUpwdksyUHhBbDFtTVFtbVRa?=
 =?utf-8?B?VjVxTUUxYTY3V0tFSEZLYlNoVEVFTHhyeGZ6ckhQeWwxa3lRR1AzQXFEeEIv?=
 =?utf-8?B?RjBYWStvQ0dIMERrL1c3Q0V4SFUwVDBiWEtDVklIMGRraHhPS1FMOWVMSWFN?=
 =?utf-8?B?NlF3dzlCN3dwYnJkU0RYUjNqNS8zWTFXQTZ3bUJaVGVnUG9Kb1NLWktSQkpF?=
 =?utf-8?B?c0llQ0dTL3Q5QmMzMzdzOS9TaXhPeURvRyt4Q3NxN3dHZjQwWWxocWg5aUJZ?=
 =?utf-8?B?cURFdmhIYUlUQjVMaVRiV05MeDljOFRoSXE4c2JMSnpQa2dGMWw2QnFJZnBm?=
 =?utf-8?B?SXRTenFBSlk1SWV5ZmlvOEdQTm5nZS9VRkZTdXlFMmIrNk84MStlQVRiQklB?=
 =?utf-8?B?cllkRU5kK1lKWVVZSjljWTc5Y0MwSmhRSEVmTEg4c0g4bVlFTzZ1OGphaU1v?=
 =?utf-8?B?QmJaSncyZWgrODJvS2I5VmtIc3J5c2d5Qzc1NDVqZXlxaTdRSzduemtvR2VH?=
 =?utf-8?B?bW5pZmswYUZOZDkyL0ZvTkUyTWtORjhidlY1NmdodEdkTERLYzVFdGdzODNK?=
 =?utf-8?B?MVI4ZStaQ3FLem5EQTVUWWUxRVlGblVyTWZ5a3g2UXlBSCtPWVhsaEV4SUds?=
 =?utf-8?B?bXMydFlpc256ZmxoVFpxQWlSZEV4T3NsempObTByLzJSTk1ZS3JpaWpzSkJB?=
 =?utf-8?B?THoxdzdlYzc0bXh3OWxRc2VzMlVZaEtGcm5ZS1ZLZlo0YkRHU2htVlJpc2xp?=
 =?utf-8?B?aHUvZVVaSUc0T2lHSXdXUzh6K1NkLzZIVXY5ZnZueGR0bk1QdnA1TVpURnNm?=
 =?utf-8?B?c2F3OUJ0dmEzS1RmUWIvZnBrUTBzMnNjYzJ3eXp1YUdaSmNmTmdnSUhRMVZJ?=
 =?utf-8?B?bXFkeU0yQkI4STJjeElVdlFBZzRTSXl3TDRzOUEvejhBT3FxZDhzQlN1U2FW?=
 =?utf-8?B?UVN6WENuNXA5RWxSU3ZpM1RoRW9JeDJURjVqeitZcFNNUHVHdGh4dGdMRU5Y?=
 =?utf-8?B?b2gwQVdmYUVaWVFSSG1rZ0Z5NG5YS29kMnFLQ2UvN0kveXd0d1hzbnVCcFB3?=
 =?utf-8?B?TEFBd25vdzRhVG1ZaGx3a3poeHFYYTJZcHF6L0NKZUZtYWNkYnZ4eUM2cldh?=
 =?utf-8?B?dzd0cWM2Y0lXdFVSdEJpaGtzSHZEZWZPcy9MNUJ1WlQ5empkRUVYbU90ZFM5?=
 =?utf-8?B?TnJYRVZrR0tuekdwTjlsaDJmekR2Q3NHbDdOZVRINldYeU50RXF1NFJlVndY?=
 =?utf-8?B?RUU4UHRXNml0WGtEdzYwN05tSzdDcUdNMkdQVkRNODA3d1R1NTZBVlNnc2pY?=
 =?utf-8?B?OG15YXJ4Zno0UW5OM1JFT0hJMEdhY1ZrbnpUSzhhOHJvTzIwaDY1QTc1ZEVV?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <799C90AFC7187F4D9DA3275F8C99118F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de564d68-77d2-4892-3d10-08d9b0c2073d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 09:49:23.7679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84/On6pbCK/u3ReRzlIF47MHhWEsS8RpLCKLIDAvDgprlLgYLvLnRsE2A5TFIGVIes72Myxoaz94QfC5WmpK4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5102
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTEvMjYvMjAyMSAxMjo1MyBQTSwgUGF2ZWwgSG9mbWFuIHdyb3RlOg0KPiBEbmUgMjYuIDEx
LiAyMSB2IDc6MzUgTWluYXMgSGFydXR5dW55YW4gbmFwc2FsKGEpOg0KPj4gSGkgUGF2ZWwsDQo+
Pg0KPj4gT24gMTEvMjUvMjAyMSAxMjo0NyBQTSwgUGF2ZWwgSG9mbWFuIHdyb3RlOg0KPj4+DQo+
Pj4NCj4+PiBEbmUgMjQuIDExLiAyMSB2IDE1OjA0IE1pbmFzIEhhcnV0eXVueWFuIG5hcHNhbChh
KToNCj4+Pj4gSGkgUGF2ZWwsDQo+Pj4+DQo+Pj4+IE9uIDExLzI0LzIwMjEgMTE6MzkgQU0sIFBh
dmVsIEhvZm1hbiB3cm90ZToNCj4+Pj4+IEhpIE1pbmFzIGF0IGFsbCwNCj4+Pj4+DQo+Pj4+PiBQ
bGVhc2UgZG9lcyBkd2MyIChzcGVjaWZpY2FsbHkgaW4gQkNNMjgzNS9SUGkpIHN1cHBvcnQgSFMg
SVNPQyANCj4+Pj4+IG11bHRpcGxlDQo+Pj4+PiB0cmFuc2FjdGlvbnMgbWMgPiAxIHJlbGlhYmx5
PyBJIGZvdW5kIHRoaXMgY29uZGl0aW9uDQo+Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTYtcmMyL3NvdXJjZS9kcml2
ZXJzL3VzYi9kd2MyL2dhZGdldC5jKkw0MDQxX187SXchIUE0RjJSOUdfcGchTU1ORTZDWXZXRUZl
V3Q4VzlwSW13TkEtTjRfMDRVOFVzQldRbXU5TzlCd3ExSGFsQ0F1cHliOWt6R0JBT09NbEttdDZ4
ZWZ6JCANCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IMKgwqAgwqDCoMKgwqAvKiBIaWdoIGJh
bmR3aWR0aCBJU09DIE9VVCBpbiBERE1BIG5vdCBzdXBwb3J0ZWQgKi8NCj4+Pj4+IMKgwqAgwqDC
oMKgwqBpZiAodXNpbmdfZGVzY19kbWEoaHNvdGcpICYmIGVwX3R5cGUgPT0gDQo+Pj4+PiBVU0Jf
RU5EUE9JTlRfWEZFUl9JU09DICYmDQo+Pj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgICFkaXJfaW4g
JiYgbWMgPiAxKSB7DQo+Pj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoaHNvdGctPmRl
diwNCj4+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6IElTT0MgT1VULCBERE1B
OiBIQiBub3Qgc3VwcG9ydGVkIVxuIiwgX19mdW5jX18pOw0KPj4+Pj4gwqDCoCDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+IMKgwqAgwqDCoMKgwqB9DQo+Pj4+Pg0KPj4+Pj4g
QnV0IEkgZG8gbm90IGtub3cgaG93IHRoZSBEZXNjcmlwdG9yIERNQSBpcyBjcml0aWNhbCBhbmQg
d2hldGhlcg0KPj4+Pj4gZGlzYWJsaW5nIGl0IHdpbGwgYWZmZWN0IGdhZGdldCBwZXJmb3JtYW5j
ZSBzZXJpb3VzbHkuDQo+Pj4+Pg0KPj4+Pj4gSSBrbm93IGFib3V0IHRoZSBSWCBGSUZPIHNpemlu
ZyByZXF1aXJlbWVudCAoYW5kIFRYIEZJRk8gdG9vIEkgZ3Vlc3MpLA0KPj4+Pj4gdGhlIGN1cnJl
bnQgZGVmYXVsdCB2YWx1ZXMgY2FuIGJlIGluY3JlYXNlZCBmb3IgdGhhdCBwYXJ0aWN1bGFyIHVz
ZSANCj4+Pj4+IGNhc2UNCj4+Pj4+IGlmIG5lZWRlZC4NCj4+Pj4+DQo+Pj4+PiBJIGFtIHRyeWlu
ZyB0byBsZWFybiBpZiBpdCBtYWRlIHNlbnNlIHRvIHNwZW5kIHRpbWUgb24gYWRkaW5nIHN1cHBv
cnQNCj4+Pj4+IGZvciBoaWdoLWJhbmR3aWR0aCB0byB0aGUgVUFDMiBhdWRpbyBnYWRnZXTCoCB0
byBhbGxvdyB1c2luZyBsYXJnZXINCj4+Pj4+IGJJbnRlcnZhbCBhbmQgbWM9MiwzIGF0IGhpZ2gg
c2FtcGxlcmF0ZXMvY2hhbm5lbCBjb3VudHMgKHNvcnQgb2YgDQo+Pj4+PiAiYnVyc3QNCj4+Pj4+
IG1vZGUiIHNpbWlsYXIgdG8gVUFDMykuIFdoZW4gZG9pbmcgc29tZSBDUFUtZGVtYW5kaW5nIERT
UCBpdCB3b3VsZCANCj4+Pj4+IGhlbHANCj4+Pj4+IHRvIGF2b2lkIHRoZSB0aW1lLWNyaXRpY2Fs
IGhhbmRsaW5nIGV2ZXJ5IDEyNXVzIG1pY3JvZnJhbWUuIEJvdGggDQo+Pj4+PiBPVVQgYW5kDQo+
Pj4+PiBJTiBhcmUgaW1wb3J0YW50Lg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gQWNjb3JkaW5nIHByb2dy
YW1taW5nIGd1aWRlOg0KPj4+Pg0KPj4+PiAiSXNvY2hyb25vdXMgT1VUIFRyYW5zZmVycw0KPj4+
PiBUaGUgYXBwbGljYXRpb24gcHJvZ3JhbW1pbmcgZm9yIGlzb2Nocm9ub3VzIG91dCB0cmFuc2Zl
cnMgaXMgaW4gdGhlIA0KPj4+PiBzYW1lDQo+Pj4+IG1hbm5lciBhcyBCdWxrIE9VVCB0cmFuc2Zl
ciBzZXF1ZW5jZSwgZXhjZXB0IHRoYXQgdGhlIGFwcGxpY2F0aW9uDQo+Pj4+IGNyZWF0ZXMgb25s
eSAxIHBhY2tldCBwZXIgZGVzY3JpcHRvciBmb3IgYW4gaXNvY2hyb25vdXMgT1VUIGVuZHBvaW50
Lg0KPj4+PiBUaGUgY29udHJvbGxlciBoYW5kbGVzIGlzb2Nocm9ub3VzIE9VVCB0cmFuc2ZlcnMg
aW50ZXJuYWxseSBpbiB0aGUgc2FtZQ0KPj4+PiB3YXkgaXQgaGFuZGxlcyBCdWxrIE9VVCB0cmFu
c2ZlcnMsIGFuZCBhcyBkZXBpY3RlZCBpbiBGaWd1cmUgMTAtMjguDQo+Pj4+IElmIHRoZSB0cmFu
c2ZlcnMgYXJlIGZvciBhIGhpZ2gtYmFuZHdpZHRoIGVuZHBvaW50IChtb3JlIHRoYW4gb25lIE1Q
Uw0KPj4+PiBwZXIgzrxmcmFtZSApLCBjcmVhdGUgYXMgbWFueSBkZXNjcmlwdG9ycyBhcyB0aGUg
bnVtYmVyIG9mIHBhY2tldHMgaW4gYQ0KPj4+PiDOvGZyYW1lIChudW1iZXIgb2YgZGVzY3JpcHRv
cnMgPSBudW1iZXIgb2YgcGFja2V0cyBwZXIgzrxmcmFtZSkuDQo+Pj4+IE1heGltdW0gbnVtYmVy
IG9mIGRlc2NyaXB0b3JzIHBlciDOvGZyYW1lIHBlciBlbmRwb2ludCBpcyB0aHJlZS4iDQo+Pj4+
DQo+Pj4+IFRvIHByb2dyYW0gZGVzY3JpcHRvcnMgdG8gc3RhcnQgSEIgSVNPQyBPVVQgdGhlcmUg
YXJlIG5vIGFueSBwcm9ibGVtLg0KPj4+PiBQcm9ibGVtIG9jY3VycyBvbiBjb21wbGV0aW9ucy4g
SWYsIGZvciBleGFtcGxlIG1jID4gMSwgZHJpdmVyIHdpbGwNCj4+Pj4gYWxsb2NhdGUgYW5kIHBy
b2dyYW0gbWMgKiAocmVxdWVzdCBjb3VudCkgZGVzY3JpcHRvcnMuIElmIGhvc3Qgc2VuZCBtYw0K
Pj4+PiBwYWNrZXRzIHBlciBmcmFtZSB0aGVuIGV2ZXJ5IG1jIGRlc2NyaXB0b3IgcGVyZm9ybSBy
ZXF1ZXN0IA0KPj4+PiBjb21wbGV0aW9uIGlzDQo+Pj4+IG5vdCBiaWcgcHJvYmxlbS4gQnV0IGlm
IGhvc3Qgd2lsbCBzZW5kIGxlc3MgdGhhbiBtYyBwYWNrZXRzIGluIGZyYW1lDQo+Pj4+IHRoZW4g
bm90IGNsZWFyIGhvdyB0byBleGNsdWRlIHVudXNlZCBkZXNjcmlwdG9ycyBmcm9tIGRlc2MgY2hh
aW4gd2hpY2gNCj4+Pj4gYWxyZWFkeSBmZXRjaGVkIGJ5IGNvcmUgLSBieSBzdG9wIHRyYW5zZmVy
cyAoZGlzYWJsZSBFUCkgYW5kIHJlLXN0YXJ0DQo+Pj4+IHRyYW5zZmVycyAoZmlsbCBhZ2FpbiBk
ZXNjIGNoYWluKSBmcm9tIG5leHQgZnJhbWU/IE9yIHB1cmdlIHVudXNlZCANCj4+Pj4gZGVzY3MN
Cj4+Pj4gYW5kIHNoaWZ0aW5nIGRlc2NyaXB0b3JzICJ1cCIgaW4gYSBjaGFpbj8gWW91IGNhbiB0
cnkgdG8gaW1wbGVtZW50Lg0KPj4+DQo+Pj4gSGkgTWluYXMsIHRoYW5rcyBmb3IgeW91ciBoaW50
cy4gVW5mb3J0dW5hdGVseSBJIGFtIHByZXR0eSBuZXcgdG8gZHdjMiwNCj4+PiBwbGVhc2UgY2Fu
IHlvdSBwb2ludCBtZSB0byBwYXJ0aWN1bGFyIHBhcnRzIG9mIHRoZSBkd2MyIGNvZGU/DQo+Pj4N
Cj4+PiBJIGZvdW5kIHNvbWUgZHdjMiBkZXNjcmlwdGlvbiB3aGljaCByZWFkcyB5b3VyIHF1b3Rl
IGluDQo+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vd3d3Lm1vdXNlci5j
bi9kYXRhc2hlZXQvMi8xOTYvSW5maW5lb24teG1jNDUwMF9ybV92MS42XzIwMTYtVU0tdjAxXzA2
LUVOLTU5ODE1Ny5wZGZfXzshIUE0RjJSOUdfcGchSmcyd2ZrUlVmeU8yanJuTFhtTzd6TzVXMEVz
dy1UVGdFVENUZTVtcXRwdWIxbUFtRFk3UW5peFQ4SG1ZeVRwMHJiX2FjN090JCANCj4+Pg0KPj4+
IChub3QgZm9yIEJDTTI4MzUgYnV0IGhvcGVmdWxseSB0aGUgcHJpbmNpcGxlIGlzIHNpbWlsYXIp
LiBJSVVDIGJ5DQo+Pj4gZGVzY3JpcHRvciB0aGUgc3RydWN0IGR3YzJfZG1hX2RlY3MgaXMgbWVh
bnQuDQo+Pj4NCj4+IFllcywgZGVzY3JpcHRvcnMgZGVjbGFyZWQgaW4gZHdjMiBhcyBkd2MyX2Rt
YV9kZXNjLg0KPj4NCj4+PiBJIGZvdW5kIGEgZnVuY3Rpb24gZ2FkZ2V0LmM6ZHdjMl9nYWRnZXRf
ZmlsbF9pc29jX2Rlc2Mgd2hpY2ggaXMgY2FsbGVkDQo+Pj4gaW4gZHdjMl9nYWRnZXRfc3RhcnRf
aXNvY19kZG1hIGFuZCBkd2MyX2hzb3RnX2VwX3F1ZXVlLiBJcyB0aGUgY29kZQ0KPj4+IGFmdGVy
IHRoZSAvKiBIaWdoIGJhbmR3aWR0aCBJU09DIE9VVCBpbiBERE1BIG5vdCBzdXBwb3J0ZWQgKi8g
Y29tbWVudCBpbg0KPj4+IGdhZGdldC5jOmR3YzJfaHNvdGdfZXBfZW5hYmxlKCkgYmVjYXVzZSB0
aGUgZHdjMiBjb3JlICh0aGUgaGFyZHdhcmUpDQo+Pj4gZG9lcyBub3Qgc3VwcG9ydCBIQiBpbiBE
RE1BLCBvciBiZWNhdXNlIHRoZSBsaW51eCBkd2MyIGRyaXZlciBkb2VzIG5vdA0KPj4+IGltcGxl
bWVudCB0aGUgSEIgc3VwcG9ydCBpbiBERE1BIHlldCAod2hpY2ggaXMgd2hhdCB3ZSBhcmUgdGFs
a2luZyANCj4+PiBhYm91dCk/DQo+PiBIVyBzdXBwb3J0cyBIQiBJU09DIE9VVCBpbiBERE1BLCBk
cml2ZXIgZG9lc24ndCBzdXBwb3J0LiBJbiBtZW50aW9uZWQgYnkNCj4+IHlvdSBkYXRhYm9vaywg
c2VlIGNoYXB0ZXIgIjE2LjExLjMuMiBJc29jaHJvbm91cyBPVVQiLg0KPj4+DQo+Pj4gSSBhbSBh
c2tpbmcgYmVjYXVzZSBpZiB0aGUgSFcgZGlkIG5vdCBzdXBwb3J0IERETUEsIHRoZSBtZXRob2QN
Cj4+PiBkd2MyX2dhZGdldF9zdGFydF9pc29jX2RkbWEgd291bGQgYmUgb3V0IG9mIGdhbWUgZm9y
IG15IGFuYWx5c2lzLCByaWdodD8NCj4+PiBJZiB0aGUgbGF0dGVyIGlzIHRoZSBjYXNlLCBzaG91
bGQgdGhlIEhCIHN1cHBvcnQgaW1wbGVtZW50YXRpb24gY2hhbmdlDQo+Pj4gZHdjMl9nYWRnZXRf
c3RhcnRfaXNvY19kZG1hPw0KPj4+DQo+PiBUbyBzdXBwb3J0IEhCIElTT0MgT1VUIHNob3VsZCBi
ZSB1cGRhdGVkIGR3YzJfZ2FkZ2V0X2ZpbGxfaXNvY19kZXNjKCkNCj4+IGFuZCBkd2MyX2dhZGdl
dF9jb21wbGV0ZV9pc29jX3JlcXVlc3RfZGRtYSgpIGZ1bmN0aW9ucy4NCj4+DQo+Pj4gUGxlYXNl
IGNhbiB5b3UgZXhwbGFpbiBhIGJpdCBtb3JlIHRoZSBpc3N1ZSBhYm91dCB0aGUgdW51c2VkDQo+
Pj4gZGVzY3JpcHRvcnM/IFRoaXMgaXMgaG93IEkgdW5kZXJzdGFuZCBpdCAocG9vcmx5KS4gVGhl
IGRyaXZlciBwcmVwYXJlcw0KPj4+IGRlc2NyaXB0b3JzIGZvciBhbGwgbWMgcmVxdWlyZWQgYnkg
dGhlIHRyYW5zZmVyIChhbmQgcmVwb3J0ZWQgYnkNCj4+PiB3TWF4UGFja2V0U2l6ZSB0byB0aGUg
aG9zdCkgc28gdGhhdCB0aGUgY29yZSAoSFcpIGNhbiBmaWxsIGl0IHZpYSBETUEuDQo+Pj4gSG93
ZXZlciwgaWYgdGhlIGhvc3QgZG9lcyBub3QgbmVlZCB0aGUgd2hvbGUgcGFja2V0IHNpemUsIGl0
IHdpbGwgc2VuZA0KPj4+IGZld2VyIHBhY2tldHMgcGVyIGZyYW1lLCBhbmQgc29tZSBvZiB0aGUg
ZHdjMl9kbWFfZGVjcyBkZXNjcmlwdG9ycyB3b3VsZA0KPj4+IG5vdCBiZSBmaWxsZWQgd2l0aCBk
YXRhID0gdW51c2VkLiBUaGUgY29yZSAoSFcpIHNvbWVob3cgbWFya3MgdGhlDQo+Pj4gZGVzY3Jp
cHRvcnMgd2hldGhlciB0aGV5IHdlcmUgdXNlZCBvciBub3QsIGFuZCB0aGUgdW51c2VkIGRlc2Ny
aXB0b3JzDQo+Pj4gKGkuZS4gY29udGFpbmluZyBvbGQvYm9ndXMgZGF0YSkgc2hvdWxkIG5vdCB1
bmRlcmdvIGNvbXBsZXRpb24gc29tZWhvdy4NCj4+IENvcmUgZG9lc24ndCBtYXJrIHVudXNlZCBk
ZXNjcmlwdG9ycy4NCj4+IERyaXZlciBjYW4gZGV0ZWN0IHRoYXQgaXQgaXMgbGFzdCBwYWNrZXQg
aW4gZnJhbWUgYnkgY2hlY2tpbmcgRFBJRC4gSWYNCj4+IERQSUQgaXMgREFUQTAgdGhlbiBpdCdz
IGxhc3QgcGFja2V0IGluIGZyYW1lIGFuZCBuZWVkIHRvIGNvbXBsZXRlDQo+PiBhcHByb3ByaWF0
ZSB1c2IgcmVxdWVzdC4NCj4+IEFmdGVyIGNvbXBsZXRpb24gb2YgZGVzY3JpcHRvciwgY29yZSB3
aWxsIHByb2Nlc3MgbmV4dCBkZXNjcmlwdG9yIHdoaWNoDQo+PiBpcyBwcmVwYXJlZCBmb3IganVz
dCBjb21wbGV0ZWQgdXNiIHJlcXVlc3QgYnV0IG5vdCBmb3IgbmV4dCByZXF1ZXN0IChhdA0KPj4g
bGVhc3QgZnJvbSAiYnVmZmVyIGFkZHJlc3NlcyIgcG9pbnQgb2YgdmlldykuDQo+PiBJbiBjYXNl
IGlmIHBhY2tldCBjb3VudCBzZW50IGJ5IGhvc3QgaW4gZnJhbWUgbGVzcyB0aGFuIG1jLCBkcml2
ZXINCj4+IHNob3VsZCBleGNsdWRlIHJlbWFpbmluZyBkZXNjcyBmb3IgY29tcGxldGVkIHVzYiBy
ZXF1ZXN0IGZyb20gZGVzY3JpcHRvcg0KPj4gbGlzdCBieSAic2hpZnRpbmcgdXAiIGRlc2NzIGlu
IGRlc2NyaXB0b3IgbGlzdC4gQnV0IEknbSBub3Qgc3VyZSB0aGF0DQo+PiBkcml2ZXIgaGF2ZSBl
bm91Z2ggdGltZSB0byBkbyB0aGF0IGJlZm9yZSBjb3JlIGZldGNoIG5leHQgZGVzY3JpcHRvciwN
Cj4+IHdoaWNoIHNob3VsZCBiZSBhbHJlYWR5IHVwZGF0ZWQgKGF0IGxlYXN0ICJidWZmZXIgYWRk
cmVzcyIgc2hvdWxkIGJlDQo+PiBwb2ludCB0byBhZGRyZXNzIGZvciBuZXh0IHVzYiByZXF1ZXN0
KS4NCj4+DQo+Pj4gQnV0IHRoaXMgc291bmRzIHRvbyBzaW1wbGUsIG5vdCB3aGF0IHlvdSBkZXNj
cmliZWQgaW4geW91ciBwb3N0IDotKQ0KPj4+DQo+Pj4gQWxzbywgcGxlYXNlIHdoZW4gYXJlIGNv
bXBsZXRpb24gaW50ZXJydXB0IHJlcXVlc3RzIHRocm93biBhdCBJU09DIE9VVD8NCj4+PiBBZnRl
ciBldmVyeSBwYWNrZXQ9ZGVzYywgb3IgYWZ0ZXIgdGhlIHdob2xlIFVTQiBmcmFtZSAoaS5lLiBh
ZnRlciBhbGwgMw0KPj4+IHBhY2tldHMgaW4gY2FzZSBvZiBtYz0zKT8gSWYgYWZ0ZXIgZXZlcnkg
cGFja2V0LCB0aGUgSEIgbW9kZSB3aXRoIGxhcmdlcg0KPj4+IGJJbnRlcnZhbCAobGVzcyBmcmVx
dWVudCBmcmFtZXMgd2l0aCBtdWx0aXBsZSBwYWNrZXRzKSB3b3VsZCBub3Qgc3BhcmUNCj4+PiBh
bnkgaW50ZXJydXB0cy9DUFUgbG9hZCBjb21wYXJlZCB0byBtb3JlIGZyZXF1ZW50IGZyYW1lcyB3
aXRoIHNpbmdsZQ0KPj4+IHBhY2tldHMgKG5vIEhCIG1vZGUpIGFuZCBhZGRpbmcgdGhlIEhCIElT
T0Mgc3VwcG9ydCB3b3VsZCAib25seSIgYWxsb3cNCj4+PiBoaWdoZXIgSVNPQyBiYW5kd2lkdGgs
IG5vdCBDUFUgbG9hZCByZWR1Y3Rpb24uIFdoYXQgaXMgdGhlIGNhc2UsIHBsZWFzZT8NCj4+IENv
bXBsZXRpb24gaW50ZXJydXB0IGFzc2VydGVkIG9uIHRoZSBlbmQgb2YgZGVzY3JpcHRvciBwcm9j
ZXNzaW5nLCBpZg0KPj4gSU9DIChJbnRlcnJ1cHQgb24gY29tcGxldGlvbikgYml0IGlzIHNldC4g
Rm9yIEhCIElTT0MgT1VUIHRoaXMgYml0DQo+PiBzaG91bGQgYmUgc2V0IG9uIGFsbCBkZXNjcmlw
dG9ycy4NCj4+Pg0KPiANCj4gTWluYXMsIHRoYW5rcyBmb3IgeW91ciBleHBlcnQgYW5zd2VyLiBK
dXN0IGEgcXVpY2sgcXVlc3Rpb24gcmVnYXJkaW5nIA0KPiB5b3VyIHByZXZpb3VzIHBhcmFncmFw
aCAtIGRvZXMgaXQgbWVhbiB0aGF0IElTT0MgT1VUIHdpdGggbWM9MiBhdCANCj4gYkludGVydmFs
PTIgeWllbGRzIDhrIGNvbXBsZXRpb24gSVJRcywganVzdCBsaWtlIHdpdGggbWM9MSBhdCANCj4g
YkludGVydmFsPTE/IElmIHNvLCBubyByZWFsIENQVSB3b3JrbG9hZCB3b3VsZCBiZSBzcGFyZWQg
YnkgaW1wbGVtZW50aW5nIA0KPiB0aGUgSEIgc3VwcG9ydC4NClllcywgaWYgSU9DIGJpdCBzZXQg
Zm9yIGFsbCBkZXNjcmlwdG9ycy4gRm9yIEhCIElTT0MgT1VUIHBlciBtZSBzaG91bGQgDQpiZSBz
ZXQgaW4gYWxsIGRlc2NyaXB0b3JzLg0KDQo+IA0KPiBJcyB0aGVyZSBhbnkgY2hhbmNlIHRvIGNv
bXBsZXRlIGFsbCBkZXNjcmlwdG9ycyBmaWxsZWQgaW4gb25lIGZyYW1lIHdpdGggDQo+IG9uZSBJ
UlEsIGJ5IHNldHRpbmcgdGhlIElPQyBiaXQgb25seSB0byB0aGUgbGFzdCBkZXNjcmlwdG9yPyAN
CkJlY2F1c2Ugb2YgaG9zdCBjYW4gc2VuZCBsZXNzIHBhY2tldHMgdGhhbiBtYyB0aGVuIGluIHRo
aXMgY2FzZSB3ZSBjYW4gDQptaXNzIGZyYW1lL3VzYiByZXF1ZXN0IGNvbXBsZXRpb24uIEkgbWVh
biwgZGF0YSBmcm9tIG5leHQgZnJhbWUgd2lsbCBiZSANCkRNQS1lZCB0byBidWZmZXIgZGVkaWNh
dGVkIGZvciBwcmV2aW91cyBmcmFtZSAodW51c2VkIGRlc2NyaXB0b3IpLg0KDQo+IElJVUMgdGhh
dCANCj4gd291bGQgY2F1c2UgaXNzdWVzIHdoZW4gdGhlIGhvc3QgZG9lcyBub3Qgc2VuZCBkYXRh
IGZvciBhbGwgZGVzY3JpcHRvcnMgDQo+ICJwcmVwYXJlZCIgYnkgdGhlIGdhZGdldCAoYXMgZGlz
Y3Vzc2VkIGFib3ZlKSBidXQgSU1PIHRoYXQgY291bGQgYmUgDQo+IGhhbmRsZWQgc29tZWhvdyAo
aG9zdCB3b3VsZCBsaWtlbHkgbm90IGNoYW5nZSB0aGUgbnVtYmVyIG9mIHRyYW5zYWN0aW9ucyAN
Cj4gd2l0aGluIG9uZSBjb250aW51b3VzIHN0cmVhbSwgZ2FkZ2V0IGNvdWxkICJlc3RpbWF0ZSIg
aG93IG1hbnkgDQo+IHRyYW5zYWN0aW9ucyB3b3VsZCBiZSB1c2VkIGJ5IHRoZSBob3N0IGZvciB0
aGUgcGFydGljdWxhciBhbHRzZXR0aW5nKS4gDQo+IEp1c3QgdHJ5aW5nIHRvIGZpbmQgaWYgYW55
IHdheSB0byByZWR1Y2UgdGhlIElSUXMgaXMgcG9zc2libGUgOi0pDQo+IA0KSSBkb24ndCBrbm93
IHRoZSBzYWZlIHdheSB0byByZWR1Y2UgdGhlIElSUXMgOi0oLg0KDQpUaGFua3MsDQpNaW5hcw0K
DQo+IFRoYW5rcyBhIGxvdCEgQmVzdCByZWdhcmRzLA0KPiANCj4gUGF2ZWwuDQoNCg==
