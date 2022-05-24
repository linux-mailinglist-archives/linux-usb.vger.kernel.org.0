Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C81C531FDF
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 02:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbiEXAaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 20:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiEXAa2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 20:30:28 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E6D92D12
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 17:30:27 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C834C08D4;
        Tue, 24 May 2022 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653352227; bh=AQIlFtkScTGwyMgd5VO6ZZZL/otahjGKHQlYZW+MX7A=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OZLdi/VRqTf6cxNQy+9VM0+cf6mYKXeuNQQL7tWrdDjZ0y/MmmJqWq2esFWUIPw/Z
         Ah7raOA4TYhi3CdrvJNwl1UYkGKayMR0M6gqIj72fYjp2gVA61wPYOtDQ6YZxklQ+3
         C8LNr7/qcIwZ2lX6PxQQWumwPbPkBzGRjE8n+xKBEZIygkDxIAoKAuyzCDZTVN1ScL
         vHdt3F/iPQnCDTpsKNL1VpNaia+GJED+ZoEFavS1AUgK7a0+nSq1xtgSh5VtADsMPB
         PbIpxQFj1D+2bF/47ZCP9qhJ+barPcQoWDVTgEqRSKbMb9QnJhxnJ9VMxZGAXc6A68
         vUntZbLp+5EPw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5BC21A0082;
        Tue, 24 May 2022 00:30:25 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6109F800CA;
        Tue, 24 May 2022 00:30:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oZRwsvZg";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiB2nSuhWfJP4k1u4uMXqkj/3naYxB92/KIKoqX48I8xn9DZiNGRplMXxS4IUtMoQfZGNQhst+JJuaRD0PwsUVUjS7AJEcB8NxEY3cA+7CuzvDsNUFwlWVScf/w7kp+UusmF/5JKUhi/qLQ3p03hrRpcpC6Nl2jsIPyw74AVDqLZv9JGkSCZF0b1WzQJLGDC/8Pd0w5mTm1aa9r5I2rqquxuzaMQ+/Mq2yF3Gyg2asRRxSM8urJ4g27pi4PB3NdaSzgjvXMPkIrwPyZ58kb3StMG9PfSrVM3nlYiUwaJqFetMFmku/VshIWAj5QclbNZaC+jR/L2JJNe7lbuUMUoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQIlFtkScTGwyMgd5VO6ZZZL/otahjGKHQlYZW+MX7A=;
 b=a7V3dcVueun9WUPkCuYgaPFErEthCwuCG7Q4OPzSnHpV4aPVgoLWHajKVPpvucyQXPtuW0wPQgpjDSM989zfADjhG6JvC5iO3j+RqIF8bECldXkwseV3da2GN/nzNldAbzq3EX/5BMAYnOsFK8WMPsqma4N7dcMQFuoT5h75bM3t5ZlBy9VHDUXuKZKbtS4Ul0CK4fGlblWRJd50SB8LsqKS7sS5/jzcNxz51FmvPF+webk+iyp0X0HOoEoOmWoCSL3HEjKq0sTQRJhLIcTap7fB/fPDso6GzPIRkLIhqJc/bmIhiwtBq1X8Kwif9rW1vqY+Fk5UYLVob6lE7+PQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQIlFtkScTGwyMgd5VO6ZZZL/otahjGKHQlYZW+MX7A=;
 b=oZRwsvZg9pkul318j9yueR3PFPiQ9TDLBdZ+bAcn9aNRmwjAXSk2/Q+8OaXkkI8sdvU/5GQ/G3wvMGD9W6cELk3dW/NJgXpHXXpb7q2/Mo9D9uHHYHmoglZGsGImNFsFrpGjomDkuRII8B0JVNrrbfou/x0Q4TwXrO5y+l7suDc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ1PR12MB6196.namprd12.prod.outlook.com (2603:10b6:a03:456::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Tue, 24 May
 2022 00:30:21 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 00:30:21 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Thread-Topic: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Thread-Index: AQHYVe/SnOT1IryojUCTvpGnMrnu860CtucAgCRnpACABkB7AA==
Date:   Tue, 24 May 2022 00:30:21 +0000
Message-ID: <ac113646-7814-374c-c546-a583e4144e18@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <14105f3b-aa09-1fd5-48f4-9f15eec2473e@quicinc.com>
 <aa9e6681-76f1-357c-b01c-64576b5faee8@quicinc.com>
In-Reply-To: <aa9e6681-76f1-357c-b01c-64576b5faee8@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61cba5d7-ce76-436e-2de1-08da3d1c9615
x-ms-traffictypediagnostic: SJ1PR12MB6196:EE_
x-microsoft-antispam-prvs: <SJ1PR12MB6196757C62C4F241B66F081EAAD79@SJ1PR12MB6196.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nnH8HvsW9q5NDMU5MQEzlaHGGq8Xy7NTSrOp25gzU90BLf3CQ/toFZs0RgTRtqmgCDJJIIZYDLQrrgmVyWyLu75Tu1uixXjk/9mr5eRvHoeo0muf+KxNdDsGlHzn8fGnXg+SUsFjDJ7JtIAFtc+NMyNKLCtIy2BUBIrOxKSMwgK0ufzauK5GFjx5q67mWgtz6qPfK7wZeHAMIyMBkjUbY8OXNp0y0xwz/oISTsMcEj50KmmQBkYuv9q4PVJxGFx/bBMlMsxSjKJGRkE0EKcTxHfKewRILe9Fs+Y7GkrkEYEMn8oQ7d4yp4I6D7IxNlx9rjp7i8PvdfiiNf4vLaNA1QWgI4UiTS6xOvjKxuqvdvCbnkss9sO+8Ta8WiPLdCN9D4wHfXDug4vbJhK64/3ODWMSYm0MKbfphxvc2efGJRojFqR4rIdlK7lQCvw6SafFY5Eh+AwaeIBgeEmjUiGCYNWkG/7gV1zmcQ9P1VEpZN4tWGnbEkDK/o7+SGmeKY8OML7opjRc9PEkZLJizleL6jY1I2ipuVR0XJuAjUfDtJp7tenURvcIpyagB/+9HOsXjDKDmBX0lumHZM+u5hrnT1YYgzTKSs6ZG43Alh6M7D7zvnrbZFlOkkCXB3qwWp77Yv3qc2oCp38yneQSh/Q2BO+GjFS/Sh8phnZmRXgoA917APSqsrycYJWKpknSqEMowQ6Z8qtxXkVMBq0bdIJmc2/VU07y+ZafqkWs6MhInOTx6hcl8x4JhorHEJq0YqrlQweegHbGf8asjgOVoTYgcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(122000001)(8676002)(66446008)(66946007)(83380400001)(71200400001)(8936002)(38070700005)(2906002)(4326008)(76116006)(38100700002)(6486002)(5660300002)(36756003)(64756008)(66476007)(66556008)(508600001)(186003)(316002)(6506007)(26005)(6512007)(2616005)(31696002)(110136005)(53546011)(86362001)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlpZcTdBSVlTWEdFN2RYUlpQaVcyWGM4L0ErZkd2SlV1WGNaWjl0NmNPYUto?=
 =?utf-8?B?SVFGdDl3UmxLMUt1SmxhTHd2VFF5angwTjdWNzZsQXFzMVFUc1BmbmNBRUJX?=
 =?utf-8?B?UDREajJTMFU0cG9pYzU4Mkd0VjQvVk1wV045QmpYK2hzV3A3Z3ZLVVBaV3Zt?=
 =?utf-8?B?aVc1RXkzYmUzcHlneHNvK2gvaGc4U2xYaGRZNTRPK2NFL1NIRHNyaVFyZkJz?=
 =?utf-8?B?WlplUWxmV1p4RThRNkxZU3BvUFJhVUtpY1BrVmZiejE4ZWRFTWxtVjIvTXBX?=
 =?utf-8?B?S0F1bis1bVF1QzlaR0s2T3JEV1BKeTlQVEllOTNwZzJ3N1FFakFuWnkvbVpo?=
 =?utf-8?B?YStqTHl3RHdHWjVtSXIzT3lVNnFlK0xETkkwQXVaZ1ErdjFLSWdGdTBSVlpp?=
 =?utf-8?B?eFBkWm9FWjBodytldnlvdmJwK3RvMlFqbFQ3c1ZMVURuZGpiV3RUSlJodWY2?=
 =?utf-8?B?YWxLSm5pdloyWDN6R3VTNlpRSFpkY2pad3QxN016NzVTbG9ybm5YV2p6WThk?=
 =?utf-8?B?ZStMWHJlZXl0aitLdGxiUm8wNUthMXN5R24vY2thcE80VWp3cUlEcWh2RHlt?=
 =?utf-8?B?MGMxa1czU0JYUURndE9wNjUvczV2bkZtWmtDa09ERjFwN2txbDNBUEp1ZnM0?=
 =?utf-8?B?Zm1YcDJNUkFWNWxCbUxBSWY4ckYyNjNVby9jV2pYZHpOZVN5RTZmUmtZcjhE?=
 =?utf-8?B?UTN0SXowRHpUOVhVL1FreTU5SnNlcElXWTE0OUR3UXRDWlk1eWRYeTJJL0pI?=
 =?utf-8?B?MFhnazBGL0t3M013YUFhV3l4NXNHcWRSUU9OUnVHV1BFUm5rTGF5bTBvUTZu?=
 =?utf-8?B?UjFEZENFd1NmNklNRGZyNllKUkRGeWJIQkFVWGNuMnI2eGkzS3kxa3ZYeDdV?=
 =?utf-8?B?dXVscVROc0V4RW9ZTWl5Rmdsdk5xVWl6aTMvQ05GMW43M3AzRktuMUhJZTBy?=
 =?utf-8?B?RG44R25mQXAvS3N3WDNXQVZ0aHFMczNUV01XVjRTOW5OejlQaC9iMUhCNXVL?=
 =?utf-8?B?OXc5ckg4Wk9yZW9oZzIzZ2hSZFJLYWFaeThPeW93RDFEUXNZUG9UN1c4M2Ri?=
 =?utf-8?B?cnhhUEh5T3J6YmU4VDJuTnFDam0wTjdMNE5OSlh5OHoxeXJDVGt2MGU5Qis3?=
 =?utf-8?B?Q1poTmt6Vy93Q0NpaUFDYkJpaEEzY0NmaUtkMXdZZTZwT1RtUm0xWkVlZzlM?=
 =?utf-8?B?NVcwT3g2VTJBdEg1Q3NHdXBqUW9GZ0kwWmJsTDcybVNEMTFZK2Fqa1Zka3dL?=
 =?utf-8?B?MENIWnNDU2JFdWJ1L01yZnRhNWhGekJ0QUpSYmppYnExZW9TSnduRE0zdXYv?=
 =?utf-8?B?L1R6S1RYdCtmaTBLaEVJUExtWjlqOFlodWpSY2taRTV2YTBsNlpVaVBJZ3Fw?=
 =?utf-8?B?aWx5TVl2ZjUzSjU5cUZHUXJ6SDlYUHVGenNzMFdVVXJVeUN3U0VJL1p3cDRS?=
 =?utf-8?B?dzBaRkVvWUZ5NElwV3pMMWkyQ0diZ3pkdXRkam14a2lzTE1sYWM2QndFU3BQ?=
 =?utf-8?B?YnFRUEdxOGRrTlJPTFBDTWFJY0tmVDJ6MjV2eitsMXZBbWpLN2Fid3QyWmwx?=
 =?utf-8?B?R1ZiR09YY0twNlJPa3JrbkRGcUNZalc3VGhkOHRXSFFsMk1DUkJLQWFzNDZJ?=
 =?utf-8?B?MXhhN0ZmeUtXWW5yUkdmVjN0VGdiU1Q0aVB1MTF4UXB1M3JleDVDKzJ0Wi9M?=
 =?utf-8?B?dkUvdGxLY1hkemZXSDdyN0c3WWxrSVMrTnhxY1RBVlZWVVFHU0pMcVhpU0U2?=
 =?utf-8?B?cEVSS1QzL0xiRlI2Q1pVUTg0Wm9VeldFV0NRTUVJemZ5L2VkNGlLb3Q3cmtT?=
 =?utf-8?B?RjR2VmdmUUtnQ0hqbGlheGtFOFFwcUtDRWZ2RU9aV1BNT0g3ZWVBc2trNCty?=
 =?utf-8?B?N0pKK3JlNVVIZXIrZnh1V2hMbm0wYTNPbk1zRGFoUjZTeTY0anYrUkdkVm44?=
 =?utf-8?B?S0Y0L0Fyamd5TENlNlN1UnVqckRvL204eVdFZUFZeGloNWRxNUQwWHpwK2Jl?=
 =?utf-8?B?V3REVTFxdXQ3ME96V3o2TFpsSVJsVmgrbGhSaVNCcEw2Nms4S0psa3JtUWhs?=
 =?utf-8?B?T1MxNkFuV3Q1ZTJ2YXZsT3pkOHBMa1V4THJNcWlGVW90RlNYbGRxc2xBdXht?=
 =?utf-8?B?TCtpbEpML2dNL3lDSWUwb2c4Z1lyd0x5N1E1ZDVweTV1OGdyWVR3dU9iQ0kv?=
 =?utf-8?B?OVFKd0NBSzlXekhiTndoeDNKSHByMEx3dzg4STE0bm5SU1hTY2ZFeG1JVnZv?=
 =?utf-8?B?UHNuUDNlZ0ZzdllONG0vdGU5VW82OVB4ZFE0NEQ5aEVwWW81Y1grU1lMY1ZW?=
 =?utf-8?B?a2NEMFVqWVF5ZUgrd1ZzMVN0QXNPS09nL3c3bWFOeXYwTE0yaUoxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F34A44B569DE8D4D973740B3D75BFBAB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cba5d7-ce76-436e-2de1-08da3d1c9615
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 00:30:21.2226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnPJW/PBu8sG77xE85vM3eeP/s6OF5kdAWYy1Aqjg3+OycJ1HBunKP5hGgajpVfP226oveLQVsmXomsFSBhMOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6196
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiBIaSBUaGluaCwNCj4gDQo+IE9uIDQvMjYvMjAyMiAyOjA1
IFBNLCBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+PiBIaSBUaGluaCwNCj4+DQo+PiBPbiA0LzIxLzIw
MjIgNzoyMiBQTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+IFRoaXMgc2VyaWVzIGNsZWFudXAg
YW5kIGVuaGFuY2UgZHdjMyBwdWxsdXAoKSBoYW5kbGluZyB0byBjb3Zlcg0KPj4+IGRpZmZlcmVu
dA0KPj4+IGNvcm5lciBjYXNlcy4NCj4+Pg0KPj4+IFdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgc29t
ZSBUZXN0ZWQtYnkgYmVmb3JlIHBpY2tpbmcgdGhpcyBzZXJpZXMgdXAuDQo+Pj4gVGhhbmtzIQ0K
Pj4+DQo+Pj4NCj4+PiBUaGluaCBOZ3V5ZW4gKDYpOg0KPj4+IMKgwqAgdXNiOiBkd2MzOiBnYWRn
ZXQ6IFByZXZlbnQgcmVwZWF0IHB1bGx1cCgpDQo+Pj4gwqDCoCB1c2I6IGR3YzM6IGdhZGdldDog
UmVmYWN0b3IgcHVsbHVwKCkNCj4+PiDCoMKgIHVzYjogZHdjMzogZ2FkZ2V0OiBEb24ndCBtb2Rp
ZnkgR0VWTlRDT1VOVCBpbiBwdWxsdXAoKQ0KPj4+IMKgwqAgdXNiOiBkd2MzOiBlcDA6IERvbid0
IHByZXBhcmUgYmV5b25kIFNldHVwIHN0YWdlDQo+Pj4gwqDCoCB1c2I6IGR3YzM6IGdhZGdldDog
T25seSBFbmQgVHJhbnNmZXIgZm9yIGVwMCBkYXRhIHBoYXNlDQo+Pj4gwqDCoCB1c2I6IGR3YzM6
IGdhZGdldDogRGVsYXkgaXNzdWluZyBFbmQgVHJhbnNmZXINCj4+Pg0KPj4+IMKgIGRyaXZlcnMv
dXNiL2R3YzMvZXAwLmPCoMKgwqAgfMKgwqAgMiArLQ0KPj4+IMKgIGRyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMgfCAxMjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQ0K
Pj4+DQo+Pj4NCj4+PiBiYXNlLWNvbW1pdDogNWMyOWU4NjQ5OTk3NjNiYWVjOWVlZGI5ZWE1YmQ1
NTdhYTRjYmQ3Nw0KPj4NCj4+IFRoYW5rcyBmb3IgdGhpcyBzZXJpZXMuwqAgUnVubmluZyB0aGUg
dGVzdHMgdy8gdGhlIGNoYW5nZXMgbm93IGFuZCB3aWxsDQo+PiBkZWJ1ZyBpZiBJIHJ1biBpbnRv
IGFueSBpc3N1ZXMuwqAgSSB3aWxsIG5lZWQgdG8gcnVuIHRoZSBwcmV2aW91cyB0ZXN0DQo+PiBj
YXNlcyBJIGhhZCBhcyB3ZWxsLCBzaW5jZSB0aGUgY2hhbmdlIHJlbW92ZXMgdGhlIEdFVk5UQ09V
TlQgY2xlYXJpbmcNCj4+IGR1cmluZyBwdWxsdXAgZGlzYWJsZSAodGhpcyB3YXMgYWRkZWQgZm9y
IHNvbWUgY29udHJvbGxlciBoYWx0IGZhaWx1cmVzKS4NCj4+DQo+IA0KPiBHb2luZyB0byBzdW1t
YXJpemUgc29tZSBvZiB0aGUgdGhpbmdzIEkndmUgZm91bmQgc28gZmFyOg0KPiAxLsKgIERXQzNf
RVBfREVMQVlfU1RPUCBmbGFnIHNldCBmb3IgRVBzOg0KPiBUaGUgdGVzdCBjYXNlIGJlaW5nIHJ1
biB3aWxsIGhhdmUgdXNiIGVwIGRlcXVldWUgcnVubmluZyBjbG9zZWx5IGluDQo+IHBhcmFsbGVs
IHRvIHNvZnQgZGlzY29ubmVjdC7CoCBUaGVyZSBpcyBhIGNoYW5jZSB0aGF0IHdlIHJ1biBpbnRv
DQo+IGNvbnRyb2xsZXIgaGFsdCBkdWUgdG8gYWN0aXZlIEVQcywgc2luY2Ugd2UgYXJlIG5vdA0K
PiB3YWl0aW5nL3N5bmNocm9uaXppbmcgZm9yIERXQzNfRVBfREVMQVlfU1RPUCB0byBiZSBjbGVh
cmVkIG9yIGNvbXBsZXRlLg0KDQpJIHNlbnQgYW4gdXBkYXRlLiBDYW4geW91IHRlc3QgaXQgb3V0
Pw0KDQo+IA0KPiBBdHRhY2hlZCB0aGluaF9uZXdlc3RfZGVsYXllZF9zdGF0dXNfY2F1c2luZ19l
cF9zdG9wX2RlbGF5X2ZsYWcudHh0DQo+IC0gRm9yY2UgZGV2aWNlIGNyYXNoIGlmIHJ1bi9zdG9w
IHJvdXRpbmUgZmFpbHMgdy8gLUVUSU1FRE9VVC4NCg0KQ2FuIHlvdSBjbGFyaWZ5IGhlcmU/IERp
ZCB5b3UgZm9yY2UgdGhlIGNyYXNoIG9yIGRpZCB0aGUgY3Jhc2ggb2NjdXIgZHVlDQp0byB0aGUg
Y2hhbmdlPw0KDQo+IC0gVGhlcmUgaXMgYSBzaXR1YXRpb24gd2hlcmUgYSBmdW5jdGlvbiB3aWxs
IHJldHVybiBkZWxheWVkX3N0YXR1cywgYW5kDQo+IHdlIGNhbiBzZWUgInRpbWVkIG91dCB3YWl0
aW5nIGZvciBTRVRVUCBwaGFzZSIgcHJpbnQgZHVyaW5nIHB1bGx1cCBkaXNhYmxlLg0KDQpJdCBz
aG91bGQgYmUgZmluZSB0aGF0IHRoZSB3YXJuaW5nIGdldHMgcHJpbnRlZC4gVGhlIHByb2dyYW1t
aW5nIGd1aWRlDQpzdWdnZXN0ZWQgdGhhdCB0aGUgZHJpdmVyIHNob3VsZCB3YWl0IGZvciBhbGwg
dGhlIGNvbnRyb2wgdHJhbnNmZXJzIHRvDQpjb21wbGV0ZS4gVGhpcyBkZXZpYXRlcyBmcm9tIHRo
ZSBwcm9ncmFtbWluZyBndWlkZS4gSWYgaXQgaGFwcGVucyBvZnRlbg0KZW5vdWdoLCB3ZSBtYXkg
bmVlZCB0byBpbmNyZWFzZSB0aGUgdGltZW91dC4NCg0KPiANCj4gMi7CoCBDb250cm9sbGVyIGhh
bHQgZmFpbHVyZSBkdWUgdG8gbm9uLXplcm8gR0VWTlRDT1VOVA0KPiBTbyB3aXRoIHRoaXMgcGF0
Y2ggc2VyaWVzLCBhbmQgcmVtb3ZpbmcgdGhlIEdFVk5UQ09VTlQgY2xlYXJpbmcsIEknbQ0KPiBy
dW5uaW5nIGludG8gY29udHJvbGxlciBoYWx0IGZhaWx1cmVzIGFnYWluLsKgIFdoZW4gSSBwcmlu
dGVkIHRoZQ0KPiBHRVZOVENPVU5UIHJlZ2lzdGVyIGF0IHRoZSB0aW1lIG9mIGZhaWx1cmUsIGl0
IHNob3dlZCB0aGF0IHRoZXJlIHdlcmUNCj4gc2V2ZXJhbCBwZW5kaW5nIGV2ZW50cy4NCg0KRG8g
eW91IGhhdmUgdGhlIGxvZyBmb3IgdGhpcz8gV2hhdCdzIHRoZSBJTyBkZWxheSBmb3IgZWFjaCBy
ZWdpc3RlciByZWFkDQpvbiB5b3VyIHBsYXRmb3JtPyBJIHN1c3BlY3QgdGhhdCB0aGUgcG9sbGlu
ZyBmb3IgaGFsdCBzdGF0dXMgaXMgdG9vDQpxdWljaywgd2UgbWF5IG5lZWQgdG8gYWRkIHNvbWUg
ZGVsYXkgYmV0d2VlbiBwb2xscy4NCg0KSWYgeW91IGhhdmUgdGhlIGxvZywgY2FuIHlvdSBhbHNv
IGVuYWJsZSByZWdpc3RlciByZWFkL3dyaXRlIHRvIHNlZSB0aGUNCmRlbHRhIHRpbWU/DQoNCj4g
DQo+IEhhdmUgYSBmZXcgY2hhbmdlcyBJIGFtIGV2YWx1YXRpbmcgdG8gcHVzaCB1cCwgYnV0IGlm
IHlvdSBoYXZlIGFueQ0KPiBpbnB1dHMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gbGV0IG1lIGtub3cs
IGFuZCBJIGNhbiBhZGQgaXQgaW50byBteSB0ZXN0aW5nLg0KPiANCg0KVGhhbmtzIGZvciBhbGwg
dGhlIHRlc3RzIQ0KDQpUaGluaA0K
