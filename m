Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CBC531FD2
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 02:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiEXAZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 20:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiEXAZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 20:25:25 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD737356E
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 17:25:23 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2A29C08CA;
        Tue, 24 May 2022 00:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653351923; bh=XjB7V1ywPkn2GK66agD//WMY8rt/K97+u7/pzD4dpPY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Fs7PZUFYNHXdsGIL01x+kowJdI/s/fXMt0a0CnVAfqNirMOR8G5rEXDnrn0ZqYDJK
         or5WAEEcROelEVys/kd5yw+xKGpT0vKxlD+kzOsgfuUD3jjyOGot3PB3ELQkSUe6JU
         uJMS1lCWPu+/M3a1BqcaYeLld/WCZ4JuOLDPOhbFMbromBVy4gjEnqv9lsoWiich8e
         /RhP78s0QaTMsK6yxUZTyYRD2zHWWoKJsr5jxntCXkEDBgZXGlsExuYa9bPR8ubZeC
         4qPVVDTfmLru9nSSxLxewOjxOa5yMruVcrme5FCjZYCRqPUlomR3k6rrhiwWvId3eM
         cKIp3/EJ72Crw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3B8D0A0096;
        Tue, 24 May 2022 00:25:21 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E8007800CA;
        Tue, 24 May 2022 00:25:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Z3D3iZ5U";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/A+X2Hj4lXXn/k1O2V+wgKrHE9va4v6hzUK5PuW41YDLIaut460XycpmW6knU1VBCubw3paX/5Khv8KuAolQbY1M1z/efmikUdU0GiuIMrZtyoQeGkPlwBvamBQNmvHBOPyI9XSxqhy3j0pHC+RR1hE2q+0zyWcjQUZaD9sblz4yVEevXZKT2j1bdeH5gK3rKkTaffZUdxYcClTVe8C9RSf96ufNZHGYst0MemlEm7Uo3xC6Cbbzf7lWs1R/ZgDKjQl1tIbvEzmdra11b/3Q07kF/Txz1h1P5JklWbbt0AbXLg9L5bZlWiKCbvNJFsy69obSQ45l8Lx+DLKKnt7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjB7V1ywPkn2GK66agD//WMY8rt/K97+u7/pzD4dpPY=;
 b=D70U4CZmd282FoeaSkPqz62IytH/J6nJszuVw+HLvxHd5kxw6EyO6C+AwNmD17f9g10rPoODhMLQWFUW7UvKjz4hf/nKJmmFo6EgjDhvt6azcoZ04HeyF4nSbNGtdSApbLQcJMMMCJdD0cz0IvmMZwy4MGD5Z3XtpkQt6NNo4QRSJzvfBcmA7BBbAGaiL8zkkQKMh35pSAo07/lc/BLiVIc5Xd9XT0hjB22V55YGDDHyoL9+9JfHmoM6/ieH847/VvSpqy05HfCUrM2q//A2pftgVdP0Ck3uoZ2bJSIOJ0eKtllBVF1r8+p+9YtZvIfxMi1jQ7SmBs4AnMMVuGFa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjB7V1ywPkn2GK66agD//WMY8rt/K97+u7/pzD4dpPY=;
 b=Z3D3iZ5U38EyAyFdiP8aIukhFQMh5SMOzwwgznu7f8mRnFNWfUcAD3zFm6njGuElHk9v/WJLGhLez12rpZJTT+zu6NZdUfhPhAJ4AdObqhyFO4fNKVcnciSrCUgEvusZnoxZqa/G5isKdZEiEwKYxvq2FGz3zta6JJYxkKBOrI8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH2PR12MB4088.namprd12.prod.outlook.com (2603:10b6:610:a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 00:25:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 00:25:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Thread-Topic: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Thread-Index: AQHYVe/g7PJ21hsO6kaLCfxoE3S18K0NDleAgCA93YCAAALhgIAADoWA
Date:   Tue, 24 May 2022 00:25:16 +0000
Message-ID: <1a1a5485-790e-79ce-f5a6-1e96d9b49a47@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
 <20220503110115.GA21427@hu-pkondeti-hyd.qualcomm.com>
 <c4aefadb-80a3-1a4b-9e33-14f9340b597e@synopsys.com>
 <33e8af67-9893-848f-d81d-2d4430002e01@quicinc.com>
In-Reply-To: <33e8af67-9893-848f-d81d-2d4430002e01@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f9e35a8-de02-4fe5-c461-08da3d1be032
x-ms-traffictypediagnostic: CH2PR12MB4088:EE_
x-microsoft-antispam-prvs: <CH2PR12MB4088BF82D390452BCC9F894CAAD79@CH2PR12MB4088.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BOlkBA+fl0uHlaMipC4uY0XrqXsgin5gTUnB6oAGK4F2+IWXfONSjVmCLLy2Ok/q7GfqG5Mkw55muBDOLUpNvxe+5PYDdbKLQO2nqnz4SUxifRwqRLYEsI96zsOvn5GBfXmq1yB2kwrzg0aHNLow4vb28C+K1bvGljOVPu4qvWzb46wPHaYqGpeRQqLw7IVkDA5T96MZJG5EVZt5rrUZMWN/ssPLh5OAO0rifCZaFOBT7DqZFCUEqr4lGyyXZcmLYlqsgscVwJcNqZcvGtveb9IosAkPV/5cOM3dcLlwk5Npwc3osHGf+QvtKvzqri2pNQYFVGpxoG5v3KLz97nVjZpuM1kX6I4k6mFxUEOKhWOjtgYl2c6Gdze5WcsQ+DVfpFLcCwsWcKSoc2GYC/0j2MjjiUEkzJ7E3FtrdVKrB1aK1De53bZOHrq3J9ySBD/iUNoTlosQMkrPZFQfElOEpBFbbLjXsOHE2UWF28OqZ/z38wIf/IhVLAeYRGSIq/tDKHI5ClyEnNh+nvFRNPq0yGxyCwcAAIa4CYwVTz+9AlFqMaU4AExeRumC7IKQHAVU6P1bW2D6F3glAMCGp/fU6834XfyqVGtBL8IYlOjEU5Xo7jpHbW/ZV4ELIy55NgyCD/JaVwZzjr5CG5cI7ZwR7e5Yltav4VC1VVZuVxEteeEKq8+GY+0kp6jk+y1gB0XcwsFmdc1pGTHwwaxem8KTs0OcP7OcOb/AO4TlhudXDs0JTAlmpDnq14ul999FStTSaVE6E1n9hmusYTdUCeZxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(107886003)(38070700005)(2906002)(54906003)(6506007)(316002)(53546011)(38100700002)(122000001)(110136005)(508600001)(76116006)(66946007)(66476007)(8676002)(83380400001)(64756008)(66446008)(66556008)(4326008)(31696002)(86362001)(71200400001)(5660300002)(186003)(2616005)(6486002)(8936002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDNHQVk4OXJzNjVFV29IMkNNQ1l2UUZHWXVEckRZKzBzUlFtVTcxa01qSW1E?=
 =?utf-8?B?WkN0MFUrc3VXUnNRYTVNZ2R6S25HeTdxSWUxSzJzZUk4U2I3d0dyaVlyeGht?=
 =?utf-8?B?T1NJUFY4YU83RGh5cVBsMi9IekZkRWZ4ZlU1cVpZV21jMXpOTk94Yml6Vy9h?=
 =?utf-8?B?WHk1cHNRNGFjWGxvWXl4eUY5OEtobUNtK3hMNGZjNGt1V1Y1VG9HQjZOQU9v?=
 =?utf-8?B?Tyt1VzRnQWhCdEF5WHZ3clF0cUJ5Yzc5M1VKcU84S3h2SWZ2Unk3bnJoNmRs?=
 =?utf-8?B?Y0VKTmQzUHdXQ1J4Q05RNGNDVDF2TVQ1VHhYdHg1RCtpZENRKzgrRVFDYXdI?=
 =?utf-8?B?Sk90TFl5QWlmS2t4Q2tlM2xhSkZiT25NSUo4UEdkMllqV0cwL0hCT0U2ci9t?=
 =?utf-8?B?NGJEWjd1UDdCbUFvckRNcjR6ZUpLZTNlUm5GQ2wwRFRqYWNjWjE1ZnNaOXFx?=
 =?utf-8?B?ZWllSWRlWTh6NDh1bjhMeUszcDFqVFl3cVhKd2hhcTgxdk9RcFV1azNDVk52?=
 =?utf-8?B?c0JQS0R0SjZWQzl1Vi9RSTM4SGVZN0VtOVFva29KWThIdDhMdnlUR3EyMGE4?=
 =?utf-8?B?bTVVQ2lqZEJtMU90U21IcmhiK3lVTnlsU3E0eisyMDJkN3NlTmlTUlgwOVo4?=
 =?utf-8?B?dUVGM09ueXhPSUIrYzJpK3JWM1lJREJ4RGd4bWRJNUtRQmw3R2ZWZ1V6TjBV?=
 =?utf-8?B?Ri81WDhkUVZXSjZyUXFOMzdCZWc1b3FITnZRaFFQbHFVSVBYbG9rNWNpL0Q0?=
 =?utf-8?B?V2JLdnhSQ0NrTXhVT3o3T1k0c2FFZk1NamROOGdqTi9sbGcyZ1MzRjBsTWZs?=
 =?utf-8?B?SllhUFZVMkF3TE5YbG4yeWR2aEtEeEhqZXltd2NJVzVvTjl2TFUvY2tWWDRB?=
 =?utf-8?B?K29RcHJNL3ZwTGJFNjNJcjU1ZHpPZy80dkRnWisrU3ArQklhRFBST0psUjdp?=
 =?utf-8?B?QkE1OFdXekdnZXZETlVBV0FWdUx4ZW5FY0xFZEYwRzBwZzFXNmwyT2tLQjZl?=
 =?utf-8?B?aDE2eDYzN2s0STl0UWw5ektDWGZUNGlqUlM0TlRxeElYSVVRek9NN3J0RWIy?=
 =?utf-8?B?OVFMd29ha2pmSHNDTGxnc25wa2FiQWIwV2ZmVHhXYXZuN2tjTVFlOUt5L2xp?=
 =?utf-8?B?RE5KMEVobzZEZXJXZVF1Y1poUkZIWUNGMzdKbXlIQU9BMStqMzR2TjMxbXBN?=
 =?utf-8?B?cGtISGRMeDlHRE1kekFNVkxDb1BlQXZLaDJpMGpCZEVVVnNjcXRZZk9QSml3?=
 =?utf-8?B?RnVNMFZ3ZDU3cFRuQWIyUzZ1M1Y0dllOQVE5UTlCaXUyWFNJUC9vQmxMNWh4?=
 =?utf-8?B?eEN1ZlJkT0UwY0pnK3Z3SWR6cHNIbzRBMVZVaDRsVDE1bFY0N242R1JQazIv?=
 =?utf-8?B?bFd1aDZOUDZCOXVnbG5ZYks0WkIyWXdiWGdhTzR0NE5KTUpjcGJOaFpHUXRF?=
 =?utf-8?B?U2kvQXAxbjRjdDZnR0RYZkRMclBEdmd2TnBSdkVSS1RPUThmSUlmZ1ljbUg1?=
 =?utf-8?B?NUJwcXNxTndXblBBb1RJaWxMdm12K1hxNDJzcjdMUk5lZGZ1V2VueC94bnFK?=
 =?utf-8?B?ank2VDBTWXJkbDdlV055YWNCaVIvb29KaXZNdHB4Ui9mWUpVL2szcHhyQm0w?=
 =?utf-8?B?N3phKzFuZlJ3aS82TlhNNm43MTcreFdybjkwazFxSE01dy9FRndzcVptNTN6?=
 =?utf-8?B?Q3hQaG5Cb20rUlFINk5MZnEvOWw5TU1yRGtLMm1zc3lpRUVLMzUxb2tkMzl1?=
 =?utf-8?B?QWRNMGREREw3WG40enRRbG9ld0J2c1VPb1FMZW5WeVR0ODJDRTZkVDBkR2NX?=
 =?utf-8?B?NkU0d1BCNEVxZjVMUlFKM1drVWwxT0FWekxDSitSaVdoMEVNNlVydmxFcDNE?=
 =?utf-8?B?V1RJREF1WUdBY0hNZ2pnY2J1UWpNYXRqd1M2Tnc2U0R4Z3EvQUJBV2twNzN0?=
 =?utf-8?B?S1BIRkx1Y1g0RHhEblZxUXNDWDRZb0o4TjN6azVJK0xLVGQ5cWwwZE1ZTE9m?=
 =?utf-8?B?QlVybVkreGZHbGFSVElOVk1CaDFBQjUvZ0wxems1azRPME5DcXJSejBtKzF1?=
 =?utf-8?B?MElOV0VEbjEyT0lXRDZhcHhlS05ZUHlCbTdSb09IcGx1RmQxd2RrRHpLZEJr?=
 =?utf-8?B?dHVKTmJ3cHcvYjdRcDBkL1E0NDlGaW9nK25NTnRZc01mSWpObmwrT3hVVTd1?=
 =?utf-8?B?QWRMYzlPVzNvdlVrNjczeW43eDB5TUVnTnl6aUtFVWhWbDgrbDJrTDFadTZP?=
 =?utf-8?B?SEtnWjJ5dS9BSGR4a1c2QjFjcTF1V2tyS0JZRTF4Y1hjTkVrbmhzanJ6VHg5?=
 =?utf-8?B?MkplUTBoRkhzdi9lK0t4QXEwZ21zWG8vTS95MTRQVFVZZTl4MUtnZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3516E0E6FB77394E842DBA2A8684D8D3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9e35a8-de02-4fe5-c461-08da3d1be032
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 00:25:16.0712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCUJbYNfZYarbPoXH3Q9A76mdjMwI5IyTVzIAC5rYQ8bCyYWmP9CFVZlzs99/ixEU7Ag8hqAWd8pj7gWhRCETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiBIaSBUaGluaCwNCj4gDQo+IE9uIDUvMjMvMjAyMiA0OjIy
IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBQYXZhbiBLb25kZXRpIHdy
b3RlOg0KPj4+IE9uIFRodSwgQXByIDIxLCAyMDIyIGF0IDA3OjIyOjUwUE0gLTA3MDAsIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+Pj4gU2luY2Ugd2UgY2FuJ3QgZ3VhcmFudGVlIHRoYXQgdGhlIGhv
c3Qgd29uJ3Qgc2VuZCBuZXcgU2V0dXAgcGFja2V0DQo+Pj4+IGJlZm9yZSBnb2luZyB0aHJvdWdo
IHRoZSBkZXZpY2UtaW5pdGlhdGVkIGRpc2Nvbm5lY3QsIGRvbid0IHByZXBhcmUNCj4+Pj4gYmV5
b25kIHRoZSBTZXR1cCBzdGFnZSBhbmQga2VlcCB0aGUgZGV2aWNlIGluIEVQMF9TRVRVUF9QSEFT
RS4gVGhpcw0KPj4+PiBlbnN1cmVzIHRoYXQgdGhlIGRldmljZS1pbml0YXRlZCBkaXNjb25uZWN0
IHNlcXVlbmNlIGNhbiBnbyB0aHJvdWdoDQo+Pj4+IGdyYWNlZnVsbHkuIE5vdGUgdGhhdCB0aGUg
Y29udHJvbGxlciB3b24ndCBzZXJ2aWNlIHRoZSBFbmQgVHJhbnNmZXINCj4+Pj4gY29tbWFuZCBp
ZiBpdCBjYW4ndCBETUEgb3V0IHRoZSBTZXR1cCBwYWNrZXQuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+IMKgIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmPCoMKgwqAgfMKgIDIgKy0NCj4+Pj4gwqAg
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDI5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tDQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPj4+PiBpbmRleCAxMDY0YmU1NTE4ZjYuLmM0N2M2OTYz
MTZkZCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPj4+PiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+Pj4+IEBAIC04MTMsNyArODEzLDcgQEAgc3RhdGlj
IHZvaWQgZHdjM19lcDBfaW5zcGVjdF9zZXR1cChzdHJ1Y3QgZHdjMw0KPj4+PiAqZHdjLA0KPj4+
PiDCoMKgwqDCoMKgIGludCByZXQgPSAtRUlOVkFMOw0KPj4+PiDCoMKgwqDCoMKgIHUzMiBsZW47
DQo+Pj4+IMKgIC3CoMKgwqAgaWYgKCFkd2MtPmdhZGdldF9kcml2ZXIpDQo+Pj4+ICvCoMKgwqAg
aWYgKCFkd2MtPmdhZGdldF9kcml2ZXIgfHwgIWR3Yy0+Y29ubmVjdGVkKQ0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+Pj4+IMKgIMKgwqDCoMKgwqAgdHJhY2VfZHdjM19jdHJs
X3JlcShjdHJsKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+IGluZGV4IGE4NjIyNWRiYWEyYy4uZTVm
MDdjMGU4YWQ5IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+
Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4gQEAgLTI1MDUsNiArMjUw
NSwyMyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3NvZnRfZGlzY29ubmVjdChzdHJ1Y3QNCj4+
Pj4gZHdjMyAqZHdjKQ0KPj4+PiDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxv
Y2ssIGZsYWdzKTsNCj4+Pj4gwqDCoMKgwqDCoCBkd2MtPmNvbm5lY3RlZCA9IGZhbHNlOw0KPj4+
PiDCoCArwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDCoCAqIFBlciBkYXRhYm9vaywgd2hlbiB3ZSB3
YW50IHRvIHN0b3AgdGhlIGdhZGdldCwgaWYgYSBjb250cm9sDQo+Pj4+IHRyYW5zZmVyDQo+Pj4+
ICvCoMKgwqDCoCAqIGlzIHN0aWxsIGluIHByb2Nlc3MsIGNvbXBsZXRlIGl0IGFuZCBnZXQgdGhl
IGNvcmUgaW50byBzZXR1cA0KPj4+PiBwaGFzZS4NCj4+Pj4gK8KgwqDCoMKgICovDQo+Pj4+ICvC
oMKgwqAgaWYgKGR3Yy0+ZXAwc3RhdGUgIT0gRVAwX1NFVFVQX1BIQVNFKSB7DQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZWluaXRf
Y29tcGxldGlvbigmZHdjLT5lcDBfaW5fc2V0dXApOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZHdjLT5lcDBf
aW5fc2V0dXAsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNlY3NfdG9f
amlmZmllcyhEV0MzX1BVTExfVVBfVElNRU9VVCkpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bp
bl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCA9PSAwKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfd2Fybihkd2Mt
PmRldiwgInRpbWVkIG91dCB3YWl0aW5nIGZvciBTRVRVUCBwaGFzZVxuIik7DQo+Pj4NCj4+PiBE
V0MzX1BVTExfVVBfVElNRU9VVCBpcyA1MDAgbXNlYy4gSWYgdGhlIG9uZ29pbmcgY29udHJvbCB0
cmFuc2ZlciBpcw0KPj4+IGRlbGF5ZWQNCj4+PiAoZHdjMzo6ZGVsYXllZF9zdGF0dXMpLCBmb3Ig
d2hhdGV2ZXIgcmVhc29uLCB3b3VsZCB0aGVyZSBiZSBhIHByb2JsZW0/DQo+Pj4NCj4+DQo+PiBT
b3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuIEkgd2FzIGF3YXkuDQo+Pg0KPj4gSWYgdGhl
IGNvbnRyb2wgdHJhbnNmZXIgdGFrZXMgbG9uZ2VyIHRoYW4gNTAwbXMsIHRoZW4gd2UnZCBnZXQg
dGhpcw0KPj4gdGltZWQgb3V0IHdhcm5pbmcuIEhvd2V2ZXIsIGl0IHNob3VsZCBiZSBmaW5lIGJl
Y2F1c2UNCj4+DQo+PiAxKSBJZiB0aGUgZnVuY3Rpb24gZHJpdmVyIGhhc24ndCBzZW50IHRoZSBz
dGF0dXMsIHRoZW4gdGhlIGhvc3Qgd29uJ3QgYmUNCj4+IHNlbmRpbmcgYSBuZXcgU0VUVVAgcGFj
a2V0Lg0KPj4NCj4+IDIpIElmIHRoZSBkZWxheWVkIHN0YXR1cyB3YXMgc2VudCBhbmQgY29tcGxl
dGVkIGltbWVkaWF0ZWx5IGFmdGVyIHRoZQ0KPj4gdGltZW91dCBidXQgYmVmb3JlIHRoZSBkd2Mz
X2dhZGdldF9zb2Z0X2Rpc2Nvbm5lY3QgaG9sZGluZyB0aGUNCj4+IHNwaW5fbG9jaywgdGhlbiB3
ZSBtYXkgc2VlIEVuZCBUcmFuc2ZlciBjb21tYW5kIHRpbWVvdXQuIEl0IG1heSBub3QgbG9vaw0K
Pj4gbGlrZSB0aGUgY2xlYW51cCB3YXMgZG9uZSBncmFjZWZ1bGx5LCBidXQgdGhhdCBzaG91bGQg
YmUgZmluZS4gVGhlDQo+PiBjb21tYW5kIHNob3VsZCBiZSBhYmxlIHRvIGNvbXBsZXRlIG9uY2Ug
dGhlIHNwaW5fbG9jayBpcyByZWxlYXNlZCBhbmQNCj4+IFNldHVwIHBhY2tldCBoYW5kbGVkLiBU
aGUgY29udHJvbGxlciBzaG91bGQgaGFsdCB3aXRoaW4gdGhlIHBvbGxpbmcNCj4+IHBlcmlvZC4N
Cj4+DQo+PiAzKSBJZiB0aGUgaG9zdCBtaXNiZWhhdmVzIGFuZCBpZ25vcmVzIHRoZSBzdGF0dXMg
c3RhZ2UvYWJvcnQgdGhlIGNvbnRyb2wNCj4+IHRyYW5zZmVyIHRvIHNlbmQgYSBuZXcgc2V0dXAg
cGFja2V0LCBJIGRvbid0IHRoaW5rIHRoZSBjdXJyZW50IGR3YzMNCj4+IGRyaXZlciBoYW5kbGVz
IHRoYXQgY2FzZSBwcm9wZXJseS4gQnV0IHRoYXQgc2hvdWxkIGJlIGZvciBhIHNlcGFyYXRlDQo+
PiBwYXRjaCBmaXguDQo+Pg0KPiANCj4gSW4gdGhlIHRyYWNlIHRoYXQgSSBzZW50IHlvdSB3aGVy
ZSB0aGUgY29udHJvbGxlciBoYWx0IGZhaWxzLCBpdCBpcyBkdWUNCj4gdG8gdGhlIGFib3ZlIGNv
bmRpdGlvbiB0aGF0IFBhdmFuIG1lbnRpb25lZC7CoCBXZSdyZSBpbiBhIHNpdHVhdGlvbiB3aGVy
ZQ0KPiBpZiB0aGUgZnVuY3Rpb24gZHJpdmVyIGRlcXVldWVzIGFuIFVTQiByZXF1ZXN0LCBhbmQg
d2UgYXJlIG5vdCBpbiB0aGUNCj4gcHJvcGVyIGVwMHN0YXRlIHRvIGhhbmRsZSwgd2UnbGwgc2V0
IHRoZSBEV0MzX0VQX0RFTEFZX1NUT1AgZmxhZy4NCj4gDQo+IFNvb24gYWZ0ZXIsIGlmIGEgc29m
dCBkaXNjb25uZWN0IG9jY3VycywgYW5kIHdlJ3JlIGluIGEgc2l0dWF0aW9uIHdoZXJlDQo+IGRl
bGF5ZWRfc3RhdHVzID09IDEsIHRoZW4gbW9zdCBsaWtlbHksIHdlJ2xsIHNlZSB0aGUgU0VUVVAg
cGFja2V0DQo+IHRpbWVvdXQgKGRlcGVuZGluZyBvbiB3aGVuIHRoZSBmdW5jdGlvbiBxdWV1ZXMg
dGhlIHN0YXR1cyBwaGFzZSkgYW5kDQo+IHByb2NlZWQgdy8gc3RvcCBhY3RpdmUgeGZlcnMgYW5k
IGdhZGdldC7CoCBTaW5jZSB3ZSBkbyBub3Qgd2FpdCBmb3IgdGhlDQo+IGRlbGF5ZWQgc3RvcCBj
b25kaXRpb24gdG8gYmUgaGFuZGxlZCBiZWZvcmUgYXR0ZW1wdGluZyB0byBoYWx0IHRoZQ0KPiBj
b250cm9sbGVyLCB3ZSdsbCBydW4gaW50byBhIHRpbWVvdXQgd2hlbiBjbGVhcmluZyBSdW4vU3Rv
cC7CoCBJbiB0aGlzDQo+IHNpdHVhdGlvbiwgdGhpcyBpcyB3aHkgeW91IGRvbid0IHNlZSB0aGUg
ZW5keGZlciBjb21tYW5kIGJlaW5nIHNlbmQgZm9yDQo+IGVuZHBvaW50cy4NCj4gDQoNCkkgc2Vl
LiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZW4gdGhlIEVuZCBUcmFuc2ZlciBjb21tYW5kIHdvbid0
IGJlIHNlbnQuDQoNCkNhbiB5b3UgdHJ5IHRoaXM6DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2VwMC5jIGIvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KaW5kZXggNzkzYzRhYWY4NWEy
Li5hMTBlMGNiMTEzODUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQpAQCAtMjkyLDcgKzI5Miw2IEBAIHZvaWQgZHdjM19l
cDBfb3V0X3N0YXJ0KHN0cnVjdCBkd2MzICpkd2MpDQogICAgICAgICAgICAgICAgaWYgKCEoZHdj
M19lcC0+ZmxhZ3MgJiBEV0MzX0VQX0RFTEFZX1NUT1ApKQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7DQoNCi0gICAgICAgICAgICAgICBkd2MzX2VwLT5mbGFncyAmPSB+RFdDM19F
UF9ERUxBWV9TVE9QOw0KICAgICAgICAgICAgICAgIGR3YzNfc3RvcF9hY3RpdmVfdHJhbnNmZXIo
ZHdjM19lcCwgdHJ1ZSwgdHJ1ZSk7DQogICAgICAgIH0NCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCmluZGV4IGVl
OGU4OTc0MzAyZC4uZmY3YWE3NDAyYjViIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KQEAgLTE5ODQsNiArMTk4
NCw3IEBAIHN0YXRpYyBpbnQgX19kd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVyKHN0cnVjdA0KZHdj
M19lcCAqZGVwLCBib29sIGZvcmNlLCBib29sIGludA0KICAgICAgICBlbHNlIGlmICghcmV0KQ0K
ICAgICAgICAgICAgICAgIGRlcC0+ZmxhZ3MgfD0gRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElO
RzsNCg0KKyAgICAgICBkZXAtPmZsYWdzICY9IH5EV0MzX0VQX0RFTEFZX1NUT1A7DQogICAgICAg
IHJldHVybiByZXQ7DQogfQ0KDQpAQCAtNDIzMiw4ICs0MjMzLDEwIEBAIHZvaWQgZHdjM19zdG9w
X2FjdGl2ZV90cmFuc2ZlcihzdHJ1Y3QgZHdjM19lcA0KKmRlcCwgYm9vbCBmb3JjZSwNCiAgICAg
ICAgaWYgKGRlcC0+bnVtYmVyIDw9IDEgJiYgZHdjLT5lcDBzdGF0ZSAhPSBFUDBfREFUQV9QSEFT
RSkNCiAgICAgICAgICAgICAgICByZXR1cm47DQoNCisgICAgICAgaWYgKGludGVycnVwdCAmJiAo
ZGVwLT5mbGFncyAmIERXQzNfRVBfREVMQVlfU1RPUCkpDQorICAgICAgICAgICAgICAgcmV0dXJu
Ow0KKw0KICAgICAgICBpZiAoIShkZXAtPmZsYWdzICYgRFdDM19FUF9UUkFOU0ZFUl9TVEFSVEVE
KSB8fA0KLSAgICAgICAgICAgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX0RFTEFZX1NUT1ApIHx8DQog
ICAgICAgICAgICAoZGVwLT5mbGFncyAmIERXQzNfRVBfRU5EX1RSQU5TRkVSX1BFTkRJTkcpKQ0K
ICAgICAgICAgICAgICAgIHJldHVybjsNCg0KDQpUaGlzIG1ha2VzIHN1cmUgdGhhdCB3ZSBpc3N1
ZSBFbmQgVHJhbnNmZXIgY29tbWFuZCB0byBhY3RpdmUgZW5kcG9pbnRzLg0KVGhlcmUncyBhIHNt
YWxsIGNoYW5jZSB0aGF0IHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCBnZXRzIHRpbWVkIG91dCBp
Zg0Kc29tZWhvdyB0aGUgc3RhdHVzIHdhcyBzZW50IGFuZCBuZXcgc2V0dXAgcGFja2V0IHdhcyBp
bW1lZGlhdGVseQ0KcmVjZWl2ZWQsIGJ1dCB0aGUgY29tbWFuZCBzaG91bGQgZ28gdGhyb3VnaCBv
bmNlIHRoZSBTZXR1cCBwYWNrZXQgaXMNCmhhbmRsZWQgZHVyaW5nIHRoZSBwb2xsaW5nLg0KDQpQ
bGVhc2UgaGVscCB0ZXN0Lg0KDQpUaGFua3MsDQpUaGluaA0K
