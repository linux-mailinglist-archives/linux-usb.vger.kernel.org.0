Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8F024CE139
	for <lists+linux-usb@lfdr.de>; Sat,  5 Mar 2022 00:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiCDX4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 18:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiCDX4A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 18:56:00 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBDA1E2FED
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 15:55:12 -0800 (PST)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E9CCBC09C7;
        Fri,  4 Mar 2022 23:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646438111; bh=QiVCLdi2T7IJ6I3l+mZmRnudoUUd4p3kiTaoUi1jljA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AoAfJOGrCHmQt4ZOxY0qiKoT6CcWnd8MjRytjeNopSR8q8OkEOsmdxY8a50NMlhOU
         y6aby3AXX7JEbSeMHvNT3FxJQrq27t1qd2VyBg8KYYvxsZa6hKmClWRBAF9LxRbcXk
         TrJn79IGA1/LLufdYKsJG0Jr/O1jppB9EDJjmavHRJRfDC03N2yuN+5F1DDifxWiqE
         u747++kJHyADudMowGT5bVmVhYS6iPTk24ijfpUDAHEiemMKrblA3nwXKJP3uhiBx3
         cU3dUupCOCwXti1K7APPYp8i5We0MzPWOQj6/Vgnna2Qd1CptHlBEttOL+6+oxseUw
         rJ5MnuNIKo0cg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 91D6BA0083;
        Fri,  4 Mar 2022 23:55:09 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 62C2D80091;
        Fri,  4 Mar 2022 23:55:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qYxw00E7";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnUYc0mg6mXDgjVyflzZBxEDvY76LIzMlRoV/F6GzRr80U5sj+e6m2DQxdX1dfm6LRu+/MQx5ljRdqLtT4/HqhyxiPBgajliv7QVzg528OaDKgmPUUFZ1/2/9dBHAUvT1Bml0O13xAcHzrR/wSYJq1PBJZTepynR+ShVLriQP/Cfs2HKWiXnjJ8T0bTTGlwKPszZmhSONfeczbf2zX0cG7dKeGLsF/X2HlmpJjVyG6z5WCCi9jCCEL36ZTg337sJq6McvCuzDhDOU2jvUwbsISQlUS9oCt+PWTyLNBbG1idplWwE15ws9TRd/prUvcj/eKcHkwBVS3hS4q6IvQHU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiVCLdi2T7IJ6I3l+mZmRnudoUUd4p3kiTaoUi1jljA=;
 b=b76KG8FCZbahVojviFPzSE+CTQFKxMENTB/TCBpNrFU4htvLUIbB1esUMlWbEGt2uq2oNvdSVUVAqJI8xSYImiKmjjQvFRq4WM+CbMTzEB+SPWl9J9PdnzwHGSjWPj6jwRo6NcUHalurndRfRCfIE7TkD6+uCSjSh3ao7dfBA0AgBl32Mj7oRPFklVTDzqp+vkCzp4hh0n7nETHyfkmPTkj4yynqkxNH/o6psPQa/ZGloHuIOHu8Lrd2OoPJTX3gWC6Qr+6luZMu6x8HSVgT4ADCgqcduE/1JUYxBHd07Nyq9TFo1fio0iPGHiY6VhG0qE9rzs76XkgZqGqDtHMJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiVCLdi2T7IJ6I3l+mZmRnudoUUd4p3kiTaoUi1jljA=;
 b=qYxw00E7ZJXs6vTmyA6NuXJNizI9EylIQhC7Rbgn5WpCWrfNUnva6/BNroe98nXU+Qh0n7CdIL9NopVrKslL7sjFimNRdV7KL+9z686sPZZMKiRMDmHnmJzSU6T2xQc90oOueeeDs8G+fpLMJs2Dy+CYMy1JAmgVGzuc7H4eVAQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 23:54:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 23:54:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Topic: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Index: AQHYLkLRQwCpjMRYn0W3qK3i4sHgEKysq5kAgADX2ACAAPJlAIABK/eAgABILAA=
Date:   Fri, 4 Mar 2022 23:54:56 +0000
Message-ID: <a6bfad44-f879-cbf4-8037-59e4f9b2e525@synopsys.com>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
 <20220303111526.GJ11577@pengutronix.de>
 <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
 <20220304193637.GM11577@pengutronix.de>
In-Reply-To: <20220304193637.GM11577@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baced5c1-1fb7-488e-194d-08d9fe3a62e6
x-ms-traffictypediagnostic: DM5PR1201MB0057:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB00571E748451D72896E4964EAA059@DM5PR1201MB0057.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/YhTamCGkZ/f/mPYLBW2Wv54gMK2YLK9+YuipbLtbF8ZHS2/BWCBltR7RqEfH9MUFWWXErSLyFFoJUwFWHqggRozJKwd6qKDgpO7wQ13+nhHFPZehNCz0j7dxK6DbWyWwYKaGwA5LmW7yBspFCUItgw53NQQ69fkn04CRXdFrqs0qt0JgMwu0TTn+Xn3CaJfJkCbecOeM3XimuI25DXgDLCSJW7hHnGrYkSSAN6MmhI+v7Prxebrbmjsutv8EXNXvbQAcKGHe/QPcYVL2SfSO2HTK68cDk6p8cdsq4T77ebYz9JBLOqSlVzoIRXu6Dx+Lz9T6+x7tUNPnBU1iSXp2TfSretFxv9xMH7liIv9BK+zx6ucaazrS6gMbDVlT5w6JxgsCUmen9t9guhWo3O18BpoGVzhZYTeYk0j8lMDQmnb9+mXQ0yVSDDZ8ZIe9rcuw4Fb9uZnaKlZKXJpvCSFiSDvNsHFDvuavpMnJ6QS5zYqrNHeYc+yN9zgucWDWBB9h+4Tf0S9Nv7gvShMM5UgjDq0PA8rsWA+wzxigHYyUf6+6blYGrweIdv14JH0+N/tEojTk6aiuVN6xTwAcj6NIiGIIJkiCvBSgH4hrSzwnB2BhwNITlXtJdcdWXE6EGJcLZYVKIt44Leoy933dOBdqfUMlAr8SN0bcijIoDVA7NJTMpbtOLUTrZTXJWQdyQZXo2kOQVFriOi+SxkcxsIPOvNdRMhEhzpK2av9nRwbKkFb2pYDIqVYVJzWGxu3VTn3D5QomfiZrWokOsQs4qRlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(316002)(38070700005)(66946007)(76116006)(66446008)(31696002)(122000001)(66476007)(66556008)(64756008)(4326008)(8676002)(86362001)(71200400001)(38100700002)(54906003)(110136005)(36756003)(6506007)(31686004)(2616005)(8936002)(2906002)(6512007)(83380400001)(5660300002)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3lZVEttQWZqNDVqeElVL1BNN2RSNnlTSDB4bDh0V21BNHl4amFKQ214WGZK?=
 =?utf-8?B?NVhISGtabjZuWDBrTmFkdThSWHdqc2Vac0RNQlZCaFBmWmY5L0ZMT1NPQ3Qz?=
 =?utf-8?B?QjBaZVFvSWpEd09SRjgvUHp0SmMzVjVva2VRYnM5ZHFHTDdCRGJCQ00vSWhh?=
 =?utf-8?B?dm80QVRjaE00UFBWalNkNGFhR1cyWCtDYkY2RjlYUUhFUTA1Ris5SnhkN1BT?=
 =?utf-8?B?enBxbm9USUdXQU5qc20ybmJ3NXptSklMLzkwVW1kakFUbHI2MnRwV0k3UENE?=
 =?utf-8?B?RzJOUUFITVcrbXlnUEhkbFlQNXhRaXBHNlVTSDdZVUxoUzNoSS9zc0NwaWgy?=
 =?utf-8?B?RjB4c1JhTXhQV1NrR0JUOGhQeUd6YTRoYzlIME5nTlNUOGtYWGNNZDUvZFp0?=
 =?utf-8?B?RWxHM3d6Qit4TkNJKzZmY2I5b3I4czhWQU9YTUxPbDM0VjBoVVZ1eUx5UmFu?=
 =?utf-8?B?UGJDL0ZQY1o2UGxDSjMrTHZRQVlFYTEzQnI1azFCb3J0L2xaSGtvNzBBTk81?=
 =?utf-8?B?dHpKckRqdnEwR0RKM1NTTEJRVWUrc2IvZ1lGUi8wSll5c1VVNUtjdlhyeFpZ?=
 =?utf-8?B?UXcvU2pGRGpIcVBWNWJpT1VGb05oTncrM24zaWVaZFg1WWFjNGpzRUx5Yy9L?=
 =?utf-8?B?d0JPdWJtVWRyMkZ6ZC9PTzVwT056UG9xZnhsWmIvWCtXaVpJZE5CMXh3ajRX?=
 =?utf-8?B?VFljY2o0RU5VRlNSVk9wUTgzOEp5V0I3N0tzdVZqM29sTk5MbXE3blB4Nndy?=
 =?utf-8?B?RXg3Vnp2R21pY3huV3NuQm1UTGlwekVpeEdBYjhRRzFsMS9ZUmhBbzJzeExa?=
 =?utf-8?B?Ujg3QVdvanVGRHpzeW9pQmZOby9LeXlvcUlKcUZEM0xFQzExY1BTRzR5czFh?=
 =?utf-8?B?M2JxRWZ3eHhNb2VVbENwbEM2R2ZtSjJTRFNKaGNFS1NjLzJhRC9rWW9WQnha?=
 =?utf-8?B?bktFWVZkWFl0ZmRFMjJMOUh0MVI0djVQdSt0L1ZvU3FscUpaZ1lFbzN1TEVz?=
 =?utf-8?B?dTZ1MVlqT2dISVZ0Z0ZBRDBsRmZoN2dPTmU5d3lQWDBia2Yyc0NpYjQ2WjVx?=
 =?utf-8?B?SENqUXFwcWx0R1BYaXdpY3RzVFoxcnFtZjlxM2o3YXVmTnBIcmdKMmtJSHFi?=
 =?utf-8?B?Y3dDalY0Z0hyb3VRdlRRVUtwWWZyd2tFT084ZWVOSW9PYng0UW9rVEs3M3dV?=
 =?utf-8?B?UjVwa1BXa2V6bjQwNlFyS1F2YWdTVUMxK0lPSHlLN2tJZG9LMW0vQlBRTXk3?=
 =?utf-8?B?Y2dpSzBGZzZkSmxwV1pMci9tZmhlMmNteHlneXNmVFJjM0lTZys3b0MxS1R1?=
 =?utf-8?B?Sk12UFJOYW1TcmJ3Z21pTHo3b20xS1A3L2dxSWoyMHU4b0VIY0g4MHJVWVhH?=
 =?utf-8?B?N0JEZ0VQWHMyRldGTkNBREFQMDJOTzRMTkoxYm5NUjhZLy9MU2lrYjJRaTlo?=
 =?utf-8?B?ZzVXV09RZWhteXFwQllVUm5HdnQycEU5VUlkQllSR3lPTlBreVM4aGRpdS9M?=
 =?utf-8?B?VlhtTkpJWGhNdFZTWkllMysxTzJtVkRGbndBZG9aRmJUbkxoTmNKMlk4RUFF?=
 =?utf-8?B?RTg4cmMxcDRmTGx5NDJVQVpwa3lQR2FFREIvQ2JTaGtmVU9ld1VPczhQTjlZ?=
 =?utf-8?B?L2M1MlozZk94MnZ1OUM3dmthYjBJQlE1Y1p1dEJseG9jZjBZZkpBYTVEQUxt?=
 =?utf-8?B?WTZCK253M3F0N1I3U01TcitxaGEvWnRDNkRDdm1HU0hYVEVKN045TDdQQzRw?=
 =?utf-8?B?SDhGT3U5Y05uMVY1bnV3T0h2MzV1blRMcUUvL29NdTJpWTgrWHphT29BRkZJ?=
 =?utf-8?B?LzlwK3BGbTduQWt2VW4zdEhaamV0ZnJVVDFVZFZicXlsREZrbnNUcmhvQVEr?=
 =?utf-8?B?cjVOQTlaZmRyclhLbWFIQ0ZoRjFid2pFWFNNTGE2bkR6cXovekFJaVQwOFNn?=
 =?utf-8?B?UjdtdExPaDVOVjNDUmh6Z0NFU1dabUM4RFg3dnhTZ2hlUEZiV05acW9mWFN4?=
 =?utf-8?B?QXBiMncxOTlLaW91UXpZelp1Q2JqY0hJS0xrTG5wOWtFZWl1RjdqL3ZBRG45?=
 =?utf-8?B?b3J3L3dFL2thZ2ZtS3F5Ymg1Y0VFZzY4ZVQya0RkWldlQjZLNDVMR08rQ0FR?=
 =?utf-8?B?Q1NlWTJGNjVhTUYwaXM0cVRZRkdYRm5xQVVnck9XWU0zazRudytNNVFFVGpv?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C49B4DB0752BD4882754E3B1963A44D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baced5c1-1fb7-488e-194d-08d9fe3a62e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 23:54:56.9503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnHY01RUxgtUwXRVxNSxA0LZsNdAKnGQhsUhw+b3OhNLpdq+vifnN0kZukL65qTFyoPb6v3i3rShIuVFLyStzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0057
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFyIDA0LCAyMDIyIGF0IDAxOjQz
OjAwQU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IE1pY2hhZWwgR3J6ZXNjaGlrIHdy
b3RlOg0KPj4+IE9uIFdlZCwgTWFyIDAyLCAyMDIyIGF0IDEwOjIyOjU1UE0gKzAwMDAsIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+Pj4gTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+Pj4+PiBJIGFt
IGN1cnJlbnRseSBkZWJ1Z2dpbmcgYSBzdHJhbmdlIGVycm9yIHdpdGggdHJhbnNmZXJyaW5nIGlz
b2MNCj4+Pj4+IHJlcXVlc3RzDQo+Pj4+PiB3aXRoDQo+Pj4+PiB0aGUgY3VycmVudCBtYWlubGlu
ZSBkcml2ZXIuDQo+Pj4+Pg0KPj4+Pj4gV2hlbiB0aGUgcGVuZGluZyBhbmQgc3RhcnRlZCBsaXN0
IGlzIGVtcHR5IHRoZSBjb21wbGV0ZSBpbnRlcnJ1cHQNCj4+Pj4+IGhhbmRsZXIgaXMNCj4+Pj4+
IHNlbmRpbmcgYW4gRW5kIFRyYW5zZmVyIHRvIHRoZSBjb250cm9sbGVyLiBUaGlzIEVuZCBUcmFu
c2ZlciB3aWxsDQo+Pj4+PiB0aGVuIGdldA0KPj4+Pj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZC4N
Cj4+Pj4+DQo+Pj4+PiDCoMKgwqAgaXJxLzUwLWR3YzMtMzA1wqDCoMKgwqAgWzAwMF0gZC4uMS7C
oMKgIDE2Ni42NjE4NDU6IGR3YzNfZ2FkZ2V0X2VwX2NtZDoNCj4+Pj4+IGVwNWluOiBjbWQgJ0Vu
ZCBUcmFuc2ZlcicgW2IwZDA4XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4+
Pj4+IC0tPg0KPj4+Pj4gc3RhdHVzOiBTdWNjZXNzZnVsDQo+Pj4+PiDCoMKgwqAgaXJxLzUwLWR3
YzMtMzA1wqDCoMKgwqAgWzAwMF0gZC4uMS7CoMKgIDE2Ni42NjE4Nzc6IGR3YzNfZXZlbnQ6IGV2
ZW50DQo+Pj4+PiAoMDgwYjAxZDYpOiBlcDVpbjogRW5kcG9pbnQgQ29tbWFuZCBDb21wbGV0ZQ0K
Pj4+Pj4gwqDCoMKgIGlycS81MC1kd2MzLTMwNcKgwqDCoMKgIFswMDBdIGQuLjEuwqDCoCAxNjYu
NjYxOTc5OiBkd2MzX2V2ZW50OiBldmVudA0KPj4+Pj4gKDQ4MmExMGQ2KTogZXA1aW46IFRyYW5z
ZmVyIE5vdCBSZWFkeSBbMDAwMDQ4MmFdIChOb3QgQWN0aXZlKQ0KPj4+Pj4NCj4+Pj4+DQo+Pj4+
PiBBZnRlciB0aGlzIHRoZSBUcmFuc2ZlciBuZWVkcyB0byBzdGFydCBhZ2Fpbi4gQnV0IHVuZm9y
dHVuYXRlbHkgdGhpcw0KPj4+Pj4gc29tZXRpbWVzDQo+Pj4+PiBkb2VzIG5vdCBzdWNjZWVkLiBZ
b3Ugc2VlIGluIHRoZSBmb2xsb3dpbmcgdHJhY2UgdGhhdCB0aGUgU3RhcnQgb2YNCj4+Pj4+IHRo
ZSBqdXN0DQo+Pj4+PiBwcmVwYXJlZCB0cmJzIGRpZCBjb21wbGV0ZSB3aXRoIGFuIC0xOC4NCj4+
Pj4+DQo+Pj4+PiDCoMKgIGt3b3JrZXIvdTU6Mi0zNDfCoMKgwqDCoCBbMDAxXSBkLi4yLsKgwqAg
MTY2LjY5MTI4ODogZHdjM19wcmVwYXJlX3RyYjoNCj4+Pj4+IGVwNWluOiB0cmIgMDAwMDAwMDA3
ZmY5NWExMiAoRTIzMzpEMjMyKSBidWYgMDAwMGZmZmZmZmIxYzJhOCBzaXplDQo+Pj4+PiAxeCAx
Mg0KPj4+Pj4gY3RybCAwMDAwMDQ2NTowMDAwMDAwMCAoSGxDczpTYzppc29jLWZpcnN0KQ0KPj4+
Pj4gwqDCoCBrd29ya2VyL3U1OjItMzQ3wqDCoMKgwqAgWzAwMV0gZC4uMi7CoMKgIDE2Ni42OTEy
OTM6IGR3YzNfcHJlcGFyZV90cmI6DQo+Pj4+PiBlcDVpbjogdHJiIDAwMDAwMDAwZjljZDE3NWUg
KEUyMzQ6RDIzMikgYnVmIDAwMDBmZmZmZmZiMWQwMDAgc2l6ZSAxeA0KPj4+Pj4gNzE1NiBjdHJs
IDAwMDAwNDcxOjAwMDAwMDAwIChIbGNzOlNjOmlzb2MpDQo+Pj4NCj4+PiBbc25pcF0NCj4+Pg0K
Pj4+Pj4NCj4+Pj4+IFRoZSBpbnRlcm1lZGlhdGUgQnVzIEV4cGlyeSBpcyBub3QgYWx3YXlzIHBy
ZXNlbnQgaW4gdGhhdCBjYXNlLCBidXQNCj4+Pj4+IGFsc28NCj4+Pj4+IGNvbXBsZXRlbHkgYWNj
ZXB0YWJsZSBhcyB3ZSBsb29wDQo+Pj4+PiBvdmVyIHRoZSBTdGFydCBUcmFuc2ZlciB1bnRpbCB0
aGlzIHN1Y2NlZWRzLg0KPj4+Pj4NCj4+Pj4+IERvIHlvdSBoYXZlIGFueSBJZGVhIHdoeSB0aGlz
IHN1Y2NlZWRlZCBTdGFydCBTdHJlYW1pbmcgZG9lcyBjb21lIGJhY2sNCj4+Pj4+IHdpdGggYW4N
Cj4+Pj4+IE1pc3NlZCBUcmFuc2ZlciBvbiB0aGUgZmlyc3QgdHJiPw0KPj4+Pj4NCj4+Pj4NCj4+
Pj4gSGkgTWljaGFlbCwNCj4+Pj4NCj4+Pj4gV2hlbiBzZW5kaW5nIHRoZSB0cmFjZSwgcGxlYXNl
IGxlYXZlIGl0IHVuZmlsdGVyZWQuIEl0J3MgbWlzc2luZyBzb21lDQo+Pj4+IHRyYWNlIGV2ZW50
cyB0aGF0IEkgd2FudCB0byBjaGVjay4NCj4+Pg0KPj4+IFJpZ2h0LCBpdCB3YXMgYSBtaXggb2Yg
dHJhY2VfZXZlbnQ6ZHdjMzoqIGFuZCBmdHJhY2VfZmlsdGVyPWR3YyouIFNvIEkNCj4+PiBraW5k
IG9mIGZlbHQgZmlsdGVyaW5nIG91dCB0aGUgaW50ZXJlc3RpbmcgcGFydCB3b3VsZCBoZWxwLg0K
Pj4+DQo+Pj4gQW55d2F5LiBIZXJlIGlzIHRoZSBzYW1lIHNpdHVhdGlvbiBpbiBhbm90aGVyIHRy
YWNlLCB3aXRoIGFsbA0KPj4+IHRyYWNlX2V2ZW50cyBmcm9tIGR3YzM6DQo+Pj4NCj4+DQo+PiA8
c25pcD4NCj4+DQo+Pj4NCj4+Pj4gUGxlYXNlIGNoZWNrIGlmIHRoZSBob3N0IGlzIGFjdHVhbGx5
IHBvbGxpbmcgZm9yIGRhdGEgYXQgdGhhdCB1ZnJhbWUuDQo+Pj4+IEVhY2ggVFJCIGlzIHNjaGVk
dWxlZCBmb3IgYSBwYXJ0aWN1bGFyIGludGVydmFsLiBJZiB0aGUgaG9zdCBkb2Vzbid0DQo+Pj4+
IHJlcXVlc3QgZm9yIGRhdGEgYXQgdGhhdCBwYXJ0aWN1bGFyIGludGVydmFsLCB0aGVuIGl0J3Mg
YSBtaXNzZWQgaXNvYw0KPj4+PiBhbHNvIChlcnIgLTE4KS4gU28sIGlmIHlvdSBoYXZlIGEgdXNi
IHRyYWZmaWMgYW5hbHl6ZXIsIHBsZWFzZSB2ZXJpZnkNCj4+Pj4gdGhpcy4gQWxzbywgbWF5YmUg
dHJ5IHdpdGggYSBkaWZmZXJlbnQgaG9zdCB2ZW5kb3IgdG8gc2VlIGlmIHRoZQ0KPj4+PiBiZWhh
dmlvciBpcyB0aGUgc2FtZS4NCj4+Pg0KPj4+IFRoZSBiZWhhdmlvciBzZWVtcyB0byBkaWZmZXIg
aWYgSSBhdHRhY2ggZGlmZmVyZW50IGhvc3RzLiBJIGhhdmUgbm8NCj4+PiB0cmFmZmljIGFuYWx5
emVyLiBXb3VsZCB1c2Jtb24gdW5kZXIgbGludXggaG9zdCB3b3JrIGZvciB0aGF0PyBIb3cgd291
bGQNCj4+DQo+PiB1c2Jtb24gZG9lc24ndCBzZWUgdXNiIHBhY2tldCBsZXZlbC4gU28gbm8sIHVz
Ym1vbiBkb2Vzbid0IHdvcmsuDQo+Pg0KPj4+IEkgc3luY2hyb25pemUgdGhlIGdhZGdldCByZXF1
ZXN0IGFuZCBob3N0IHVyYnMgdG8ga25vdyB3aGljaCBmcmFtZQ0KPj4+IGludGVydmFsIHdvdWxk
IGhhdmUgYmVlbiB0aGUgb25lIHRoYXQgd2FzIG1pc3NlZCBpbiBteSBsb2dzPw0KPj4NCj4+IEl0
IHdpbGwgYmUgZGlmZmljdWx0LiBZb3UnZCBoYXZlIHRvIGNoZWNrIHRoZSBleHBlY3RlZCBpbnRl
cnZhbCB0aGUgdXJiDQo+PiB3YXMgc2NoZWR1bGVkIGZvciBmcm9tIHhoY2kgZHJpdmVyLCBhbmQg
eW91IG1heSBoYXZlIHRvIGNoZWNrIHRoZQ0KPj4gTUZJTkRFWC4gWW91J2QgYWxzbyBuZWVkIHRv
IGRldGVybWluZSBhIHBvaW50IG9mIHJlZmVyZW5jZSB0aGF0IHRoZSBkYXRhDQo+PiByZWNlaXZl
ZCBmcm9tIGRldmljZSBpcyBmb3IgYSBwYXJ0aWN1bGFyIGludGVydmFsLiBFdmVuIGlmIHlvdSBo
YXZlIGFsbA0KPj4gdGhpcyBpbmZvLCB5b3UnZCBoYXZlIHRvIGFzc3VtZSBldmVyeXRoaW5nIHRo
ZSBob3N0IGNvbnRyb2xsZXIgcmVwb3J0ZWQNCj4+IGlzIGFjY3VyYXRlIGFuZCBub3QgbWlzc2lu
ZyBhbnl0aGluZy4NCj4+DQo+Pj4NCj4+PiBJcyB0aGVyZSBhbnkgd2F5IHRoZSBnYWRnZXQgZHJp
dmVyIGNvdWxkIHNlZSBpZiBmb3IgdGhhdCBpbnRlcnZhbCB0aGUNCj4+PiBob3N0IGRpZCBub3Qg
cG9sbCBmb3IgZGF0YT8gT1IgYXJlIHRoZXJlIGJpdHMgdG8gZ2V0IHRoaXMgYmVoYXZpb3VyDQo+
Pj4gcHJlZGljdGFibGUgYW5kIHRoZSBkcml2ZXIgdG8gcmVhY3Qgb24/DQo+Pj4NCj4+DQo+PiBZ
b3UgY2FuIGNoZWNrIGlmIHRoZXJlIGFueSAibWlzc2VkIHNlcnZpY2UgZXJyb3IiIGZyb20gaG9z
dCwgaXQgbWF5IGdpdmUNCj4+IHNvbWUgY2x1ZXMsIGJ1dCBub3QgdGhlIHdob2xlIHBpY3R1cmUu
DQo+Pg0KPj4+IE90aGVyd2lzZSwgd2h5IHNob3VsZCBvbiBhbiBvbmdvaW5nIHN0cmVhbSB0aGUg
aG9zdCBub3QgcG9sbA0KPj4+IGZvciBkYXRhIGluIGFueSBpbnRlcnZhbC4gV2hhdCB3b3VsZCBi
ZSB0aGUgY29uc3RyYWludHMgdG8NCj4+PiBpZ25vcmUgb25lIGludGVydmFsLg0KPj4NCj4+IFRo
ZSBob3N0IGRyaXZlciBtYXkgbm90IGludGVudGlvbmFsbHkgZG9lcyBpdC4gVGhlcmUgYXJlIG1h
bnkgcmVhc29ucw0KPj4gd2hlcmUgdGhlIGhvc3QgY29udHJvbGxlciBub3QgcG9sbCBmb3IgZGF0
YSwgYW5kIEkndmUgc2VlbiBpdCBvZnRlbi4gSXQNCj4+IGNhbiBiZSBiZWNhdXNlIG9mIHRoZSBk
cml2ZXIgaGFuZGxpbmcgaW50ZXJydXB0IGxhdGVuY3kvZGVsYXkgdGhhdA0KPj4gcHJldmVudHMg
dGhlIGRyaXZlciBmcm9tIGZlZWRpbmcgaXNvYyBURC9UUkJzIHRvIHRoZSBjb250cm9sbGVyIGlu
IHRpbWUsDQo+PiBjYXVzaW5nIHVuZGVyZmxvdyBhbmQgc3RhcnZlIHRoZSBjb250cm9sbGVyLiBT
b21lIG90aGVyIHRpbWUgaXQncyB0aGUNCj4+IGNvbnRyb2xsZXIgdGhhdCBkZWNpZGVkIHRoZSBi
YW5kd2lkdGggaXMgbm90IHN1ZmZpY2llbnQgZm9yIGlzb2MNCj4+IHRyYW5zZmVyIG9yIHBoeSBz
aWduYWwgaW5zdGFiaWxpdHkgYW5kIGNhdXNlIGEgbWlzc2VkIHNlcnZpY2UgZXJyb3IgZXRjLg0K
Pj4NCj4+IEFueXdheSwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGZyb20gbXkgZXhwZXJpZW5j
ZSwgSSBkb24ndCB0aGluayBpdCdzDQo+PiB0aGUgaG9zdCB0aGF0J3MgbWlzc2luZyBhIHBvbGwu
IEl0J3MgcHJvYmFibHkgYmVjYXVzZSB0aGUgZGV2aWNlDQo+PiBzY2hlZHVsaW5nIGl0IHRvbyBh
Z2dyZXNzaXZlbHkgZWFybHkuIENhbiB5b3UgdHJ5IHRvIHNjaGVkdWxlIG9uIHRoZSAybmQNCj4+
IGludGVydmFsIGluc3RlYWQgYW5kIHNlZSBpZiBpdCBoZWxwcyBpbiB5b3VyIGNhc2UuDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+PiBpbmRleCAzZTc1ZWFhMTNhYmMuLmI5ZWM3NjI2YjA4MCAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4+IEBAIC0yMTA0LDcgKzIxMDQsNyBAQCBzdGF0aWMgaW50IF9fZHdj
M19nYWRnZXRfc3RhcnRfaXNvYyhzdHJ1Y3QgZHdjM19lcA0KPj4gKmRlcCkNCj4+IMKgwqDCoMKg
wqDCoCB9DQo+Pg0KPj4gwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBEV0MzX0lTT0NfTUFY
X1JFVFJJRVM7IGkrKykgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVwLT5m
cmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1FKGRlcCwgaSArIDEpOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVwLT5mcmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1F
KGRlcCwgaSArIDIpOw0KPj4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0g
X19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKGRlcCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyZXQgIT0gLUVBR0FJTikNCj4+DQo+Pg0KPiANCj4gSSB0aGluayBJIGZv
dW5kIHRoZSBjYXNlOg0KPiANCj4gRnJvbSBteSBkYXRhc2hlZXQ6DQo+IA0KPiA8cXVvdGU+DQo+
IMKgQWZ0ZXIgYSB0cmFuc2ZlciBoYXMgYmVlbiBzdGFydGVkLCB0aGUgaGFyZHdhcmUgd2lsbCBw
ZXJmb3JtIHRoZQ0KPiBmb2xsb3dpbmcgZnVuY3Rpb25zIGZvcg0KPiDCoElOIGVuZHBvaW50czoN
Cj4gDQo+IMKgMS4gRmV0Y2ggVFggZGF0YSBhcyBlYXJseSBhcyBvbmUgaW50ZXJ2YWwgcHJpb3Ig
dG8gdGhlIGJlZ2lubmluZyBvZiB0aGUNCj4gaW50ZXJ2YWwgKGNhbGwgaXQgQSkNCj4gwqDCoMKg
IGlmIHRoZSBIV08gYml0IGlzIHNldCB0byBvbmUgaW4gdGhlIFRSQi4NCj4gwqAyLiBEZWNyZW1l
bnQgdGhlIGJ1ZmZlciBzaXplIG9mIGVhY2ggVFJCIGFzIHBhY2tldHMgYXJlIHRyYW5zbWl0dGVk
Lg0KPiDCoDMuIFJldGlyZSBUUkJzIHdoZW4gdGhlaXIgYnVmZmVyIHNpemUgaGFzIHJlYWNoZWQg
MCwgaXNzdWluZyBhbg0KPiBYZmVySW5Qcm9ncmVzcyBldmVudCBpZg0KPiDCoMKgwqAgdGhlIElP
QyBiaXQgaXMgc2V0Lg0KPiDCoDQuIElmIHRoZSBuZXh0IGludGVydmFsIChCKSBzdGFydHMgYmVm
b3JlIGFsbCB0aGUgcGFja2V0cyBoYXZlIGJlZW4NCj4gdHJhbnNtaXR0ZWQgZm9yIGludGVydmFs
IEE6DQo+IMKgwqDCoCBhLiBGbHVzaCB0aGUgVFhGSUZPLg0KPiDCoMKgwqAgYi4gUmV0aXJlIHRo
ZSBCdWZmZXIgRGVzY3JpcHRvciBvZiBpbnRlcnZhbCBBIHdpdGggYSAiTWlzc2VkDQo+IElzb2No
cm9ub3VzIiBzdGF0dXMuDQo+IMKgwqDCoCBjLiBSZXRpcmUgdGhlIEJ1ZmZlciBEZXNjcmlwdG9y
IG9mIGludGVydmFsIEIgd2l0aCBhICJNaXNzZWQNCj4gSXNvY2hyb25vdXMiIHN0YXR1cy4NCj4g
wqDCoMKgIGQuIFNlZSBDaGVja2luZyBpbnRlcnZhbCBzdGF0dXMgZm9yIGEgZGVzY3JpcHRpb24g
b2YgaG93IHNvZnR3YXJlDQo+IGNhbiBkZXRlcm1pbmUgdGhhdA0KPiDCoMKgwqDCoMKgwqAgYW4g
aW50ZXJ2YWwgZW5kZWQgdW5leHBlY3RlZGx5Lg0KPiDCoMKgwqAgZS4gR28gdG8gc3RlcCAxIHRv
IHByZXBhcmUgZm9yIGludGVydmFsIEMNCj4gwqA1LiBPdGhlcndpc2UsIGlmIGFsbCB0aGUgVFJC
cyBvZiBpbnRlcnZhbCBBIGFyZSBjb21wbGV0ZWQsIHRoZSBoYXJkd2FyZQ0KPiB3aWxsIHByZXBh
cmUgZm9yDQo+IMKgwqDCoCBpbnRlcnZhbCBCLg0KPiA8L3F1b3RlPg0KPiANCj4gQ291bGQgaXQg
YmUgdGhhdCBpbiB0aGUgb2JzZXJ2ZWQgY2FzZSB3ZSBqdXN0IHJ1biBkaXJlY3RseSBpbnRvIGNh
c2UgNA0KPiBhZnRlciBpc3N1ZWluZyBTdHJlYW0gU3RhcnQuIFNpbmNlIHRoZSBmcmFtZSBpbnRl
cnZhbCB3ZSBwcm9ncmFtbQ0KPiBpcyBzbyBjbG9zZSB0byB0aGUgY3VycmVudCBydW5uaW5nIGZy
YW1lIGludGVydmFsLg0KDQpZZXMsIHRoYXQncyB3aGF0IHRoZSBjb2RlIHNuaXBwZXQgSSBzZW50
IHRvIGNvbmZpcm0gdGhlIGNhc2Ugd2FzIGZvci4NClR5cGljYWxseSwgdGhlIFN0YXJ0IFRyYW5z
ZmVyIGNvbW1hbmQgc3RhdHVzICJidXMgZXhwaXJ5IiB3aWxsIHRlbGwgdGhlDQpkcml2ZXIgb2Yg
dGhpcyBjYXNlLCBidXQgdGhhdCBtYXkgbm90IGJlIGVub3VnaC4NCg0KPiANCj4gU28gYWN0dWFs
bHkgYXBwbHlpbmcgdGhlIGJlbG93IHBhdGNoIHdvdWxkIHRvdGFsbHkgbWFrZSBzZW5zZS4gV2Ug
Y291bGQNCj4gZXZlbg0KPiBpbmNyZWFzZSB0aGF0IHRvIGFuIGhpZ2hlciBudW1iZXIsIGp1c3Qg
dG8gbWFrZSBzdXJlIHRoYXQgd2Ugd291bGQgbm90DQo+IHJ1biBpbnRvDQo+IGFuIHBhcnRpYWxs
eSBzdGFydGVkIGZyYW1lIGludGVydmFsIHdoZW4gaXNzdWVpbmcgdGhlIFN0YXJ0IFRyYW5zZmVy
Lg0KPiANCg0KU2VlIG15IG90aGVyIGVtYWlsIHRvIG1ha2UgYSBwYXRjaC4NCg0KVGhhbmtzLA0K
VGhpbmgNCg==
