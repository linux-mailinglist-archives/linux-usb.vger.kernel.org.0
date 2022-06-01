Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D58453AC84
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 20:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354874AbiFASLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 14:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiFASLp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 14:11:45 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1213910D0
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 11:11:43 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21A474085F;
        Wed,  1 Jun 2022 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654107103; bh=bXD2IsBTfLK9ri3R0wKLBbDWkjXEmtqxS3Urgtk0BgA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Zo7M/zJIHxUH1LdRFpuUMH43NBiT2EoFfvqZbuIK7d4hrF8+cGLYIny6l7GuQXgIm
         Z2KQsKTsiXzvxL4axPQQaTscIgBATpFPZm6FMv5neGkHDdeCVp1HI1N/5UwwkTDXic
         0aF8sQUWPlNPkhnnMnxF1UwfxIpRS+sbqVlOx4/HAwyZFtEiurcQgLqorBS+PELr/+
         NpYRvY2JlqV1Lh2+0eYD++oy9Cbk9JP8eXi0rCEoRIK2GOW350SrDAucl5ZBzXxkYh
         WAyQFUuUomzxJizsJNsdQxk6Vje/Yx/QoiCbtM6hsZFJnF8tSe5c6oCkUJxV5VT8c0
         5ea/upGXhq3cA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 339BCA0083;
        Wed,  1 Jun 2022 18:11:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D52884002C;
        Wed,  1 Jun 2022 18:11:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sXiAN1oQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEEBZcEJ4azIMOByFlP4wBW4cGIJXMnysyd0IROAmefSJtz6OabiLcVWVfu//jFose8RR+khuTWG/rFxevF8K0IMkQkRh6dP05e+oUFtKWeNi0kX3u22gU9NCV7M1gUc/+LlGpqLNSVv4H1l/9WyokT6KRjgbGb75EMWNGLD3Nj0ow6CWwhYVKXvi2Y6ZB3QWorKdFgJ3ODGnrKdC1c18tQI1njVlTvPqg3MB6Umz5lGNhDuXKuolVUcAX+ULoiTFv1/ARqOpdz0T3iGOtF89Oko/bZtaxF+DFKPjtbfWWo5Aw24ooVQ5yJhYZfDh1zX77ns1fSQhCUD9FIzGChRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXD2IsBTfLK9ri3R0wKLBbDWkjXEmtqxS3Urgtk0BgA=;
 b=mLijQWbg+lFq82CWx7+Fe2t/OCb9ewDDV7qpGwuKtPWbMEtgUtiphM93FxY7OWozirP7OUA7Pz7pmONx02H+UpaJrgqtHRduQ2BEPXXFxxAqdXQp0gV6dZgn5KbF5RfeFYFcWZrne9xz9ooxKT66/5hl8R6un/V6jqYeagq3GIFtDbG+WzeGC5TwRgwQX2ht546nEJnU9yL/coOaRTHZqXKycTDRZoQMTl5tXK03TM+HZWLpDEybkA6ItQNXbEHx3ayAiItm0GwYA92LpSyYteuJilqtXgh2st3o6QiIENVvGgBO8hAheYRyYySzSBL3qn+VdwtyZcjEjlO0kjfEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXD2IsBTfLK9ri3R0wKLBbDWkjXEmtqxS3Urgtk0BgA=;
 b=sXiAN1oQuwP4ZBb5qWbShjaVckCLisomG8nqyTRRM7qq/PgHP+k3ZSOcZtFrdjwMDtV7Ecud4e6822f7cnr7fbrFWggVK8HSjPNROAMwNSE2ATwzGoG2TzzKn8SlpvDK7pwxGdITkcOSKGyp1zsdwWcP9coOe3YMJEWbVdOpSE0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3143.namprd12.prod.outlook.com (2603:10b6:a03:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 18:11:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 18:11:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: Re: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcapxfZzJHZZbuU6v/rtjLbC2Sq0zetYAgAALLICAA6oqAIACCNIAgACeQACAAQt+gA==
Date:   Wed, 1 Jun 2022 18:11:37 +0000
Message-ID: <b159cdeb-8fd2-fc52-99fa-42d2f88263d4@synopsys.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
 <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
 <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <f935ca2a-9b24-99d7-106e-77b95abeeefc@synopsys.com>
 <PA4PR04MB9640D219F6992324938D593189DF9@PA4PR04MB9640.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB9640D219F6992324938D593189DF9@PA4PR04MB9640.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5beba495-35eb-4591-3fdd-08da43fa2b8c
x-ms-traffictypediagnostic: BYAPR12MB3143:EE_
x-microsoft-antispam-prvs: <BYAPR12MB314318DEE1A86E3973B76172AADF9@BYAPR12MB3143.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jXuhDJexeirheTfmGZp2zb7VBuvWrtZPE2Hziz1OlyKpINe9o3DSH9LBJPUH6EAXsi+D9gVTC4MeiXDnMncuZUdu192onlXO+b+FAJ9Rf+GyN66IvHYBRYlbSiIXQs3InwG/sGXyqBxOc30P0Bpm/FDEONiFfqGAl25gxnRjK2JQ+agXA1uYbFueuScWeZ7Sx1+VwMOlffhbUFLLSmdSOjxHPxXixSN45JDhZwjyoC9xPQP+gL6vkTVLMVYNsco3qcI3IGAxXyHvq8IrOeNWc30WlsU95GYzvNIGOa0H5X+EL08auhQrF5aKpcSvrzWM+UHzbhRMizb/1J4BRQ+cJ47vYMoiZMFLcCRthlkI3mnLmD62yNnaKPkQxvOS50jUckda2iT3Y2kIOwDrD+qUmNTUtjfEBl5K4WsVpEh0MbyxBct7SO7ne+J3vwaiFJHH+2wSznMjxYZ5PQuP8/rzB++tqDR3aLyRVcKbi29PZNA46Q8QuZtfgjfmAyUW4lmrca618utwsMdBP654Z1x9QHUYvkTxo5WjyBQF3HBDQCqnX+4EJ/kvOyVU/PWvTyjg7j7aVqdSURC0wk7d21rPWh7Jl4xPyrHmYf2FD8XdF0QrF1411WkrEGF3DLr3jUgOobKz+9XQPEAC3Tn4PPGkefRc+hLxRawFSlW1Ka1a1jRsULsrUpvCDKIKiytSfac+ynyXkE8BoopqXg9akHH2KVDaxHfUCt9LsWS/9DhjzbVA5V/Uq2goosAHjNvqMb7jIgvicVCgtwdNSS884RygQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(53546011)(66476007)(2616005)(6506007)(66556008)(6486002)(31686004)(38070700005)(36756003)(316002)(66446008)(71200400001)(5660300002)(38100700002)(2906002)(186003)(26005)(110136005)(54906003)(8676002)(4326008)(508600001)(31696002)(64756008)(76116006)(83380400001)(66946007)(86362001)(122000001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm16bU81NDY2UjJwWGhJM0sva3huN0Vrb1Y3TEhiOFNjak16RjBhTE8zT3hR?=
 =?utf-8?B?Q0tpajhXOVdKQ3ZOOGJDWTgrZXJQQ0RaZWlydVIyZ3dmdFd1aU0wVFF0cldC?=
 =?utf-8?B?dVVhb0xKNkFyYkpSSFRVSyszdWJFSlY0azJmSVdSRTJlVmhnTUY0U01sbnhC?=
 =?utf-8?B?c1pTMDBrbjJVZHBxb3V6ZUExMFVaUWkxK3IxQ25iS1R5TER0QW1oM3htV0E1?=
 =?utf-8?B?eDNxUzEvQ2NaNEZmN2NOd3RmMzhaaEFKODFJZ0d1ck11UlIzb2M0VGdhQkJR?=
 =?utf-8?B?dFFoRE5oLzkxTDFYYlVQMmJBS09WVkQzK3VhL2xYL0NXaVJ1cmlwamU4RE85?=
 =?utf-8?B?TXI2dlBPNnArTGsrZUYrdTBGVG1oSWVLZ0t6WGFKbnNQZGdCbG1GQXFMbUFR?=
 =?utf-8?B?ZmZPZFZ1ZXhNVHdxelg4T09MNE5kS2xkTU1NUUpwd1VlcjVoN3FtNE5QM1lp?=
 =?utf-8?B?NW56Mk1lazkrdG1QNmxCdGFpTk1RbFAxMlZ5T1MzbzExVlY3WUUrSDdseVlw?=
 =?utf-8?B?R25nMTcvc3crbXl1MzlVOUdVak5WNkJuU241bENKMHJJbDF0bVFsRlZFY29J?=
 =?utf-8?B?L3BzeXMzQ2Y2enQ0bG9HbkNJOW1tays2TjFJbkk1VEtUU0IwL3hleUFZdUlC?=
 =?utf-8?B?WmRITXVTUWFKd1Z2TkJUTWRsS25tbGVyZG5tanFhU0ZhVktaVWFpbnlIVnZG?=
 =?utf-8?B?WXFnL3pwVEVSUDZlTFpKZU5VSGpLL1prVTZoSnAwTlV3QzhBNVUxeCtrR29S?=
 =?utf-8?B?QUdUS1V5NkFHb3VNdVB5b1IwWE9rYnAvQ0Q1cmpmblRrTHhsUHdabGdQT1lJ?=
 =?utf-8?B?Sit1OU5VS2FHcHIxWGxmSUpSNHRleHVVSkVNZjduZXV0cEdYdnJaNkdsTlBi?=
 =?utf-8?B?d1BiVWMycFVzcnZUVDlnaENKL0dLcjFtRFlxdmh5YW5tam5YYW5oTVMwcXY4?=
 =?utf-8?B?OTU3TUhPRHZIa1NJZTdZTU9ORERKMkJNbllBc09Ea3NmNUcwNnk4VFcvY1hw?=
 =?utf-8?B?cVdRd2E2aWZSMnI4QXBMT2YxTmR6SllUZG9kQnV1SXdjaGN3a3M5OG1uRUpD?=
 =?utf-8?B?NjhnR0pCc2tmRWU1N3MzUU5lQ1F1YVZ3TG91bzVGSVlScWp2aWpnaFdZaE0x?=
 =?utf-8?B?elJrMWRlSEh0WEhRVXlXTTIxT0EvT1R2SDFoWjVOQ2dBTkd1R1J5VEczUXNa?=
 =?utf-8?B?ODVQU29XYnB5V1JzRnROYjErdWZnWWZGeGZnME5wYTFjdkg2V1RrQktlTUFN?=
 =?utf-8?B?UnRSeGNoNE95R0RCMUxLSkNpbzBnTGtuVEpGYllOaTFJS3MzWHZlN2k4QVpD?=
 =?utf-8?B?TGtKMXQ4NEo2UFdBc096R0l3Y1o1N2ZRdXZ5b2tyUFpjczVHT3pwcmJ6SEdY?=
 =?utf-8?B?emJyaThsMWFhbDY2REM3TkUxclNTUENWdlRuTEdPRVR2dElSc05tOFp5N3pH?=
 =?utf-8?B?NmwxZmlyNlVROTlibXJLcU4xZnlyYnFsdzhxWCtnSlF4ZjdLTlJEUjIraCtR?=
 =?utf-8?B?RXUrN2Vpd2FCOWQvWTZYeFFhNjlTU0srQmg0Q1NCendBV0xiOHlPUG9aVUZZ?=
 =?utf-8?B?akM3eXNWZXB3UU95VDlQd3lFWE5LUUhvdjJQeXlRWFY5N3B5cDZmcG5Ea2d6?=
 =?utf-8?B?dExsUFhRbUNIcFdLN0wxY09jN2RrRWthdytkcXY5dTM0OVVDaTNpMW9QNTVy?=
 =?utf-8?B?a2ZERis0LzF2dGN1Y3pXaU5jdmZhanBWV2RDSWJBMFRzay9aY25PcGpxTzBy?=
 =?utf-8?B?L3dzNXcvYkpLbFJMOU0yMDhQb0xYZ05LSXF3aTVIVWRqS29KcStUT0U1WEQz?=
 =?utf-8?B?QmJiTSs0T1NjQ25vRW9TSll3QllVbWE5LzFsT1ZCbnlnSzhnM1l6S2RlcFV6?=
 =?utf-8?B?bDJEbXVTZnVlbk5jdzBtVUw4cjhoVHhQRnN0aXlmczdCWnNWWW8xeUc5cWVM?=
 =?utf-8?B?NVpDMjdxb3hnejNBa3h3UVRTSWs0enNIc1RXQkVUT2xoZHBGdmhMU2hyZDhF?=
 =?utf-8?B?TWlJOVNBWng3TGZDVXV0b0ZBNGEvR0xvSHlQSmI5YldHL3JoeFY1WFQwYnFv?=
 =?utf-8?B?NlQxbldUczNSZzVYWm5zUVBmRVNRaWhUNHFOSktnbjArRXNaR21Ha3lWV3RX?=
 =?utf-8?B?YUxlcjRlWlQwNTlsQmEzcmMxZEdtQWEzVFpqMVZIUzNFT01xbVAyM0wzTnB1?=
 =?utf-8?B?TnFEOC9jUXNZVUo5V0hvK0plOHE5ZkMxVk4vTXNhWmJJZnhiaWs4VndkUzBh?=
 =?utf-8?B?SzNxY2tHdmE0M203V2d2VFVFaEZlaW1aNFU2U0ZReXdBdytQTFFYOS9VRGND?=
 =?utf-8?B?NG13L2VmR2IrdUZyMmYyTHpJTmVkR0dDbk9EaXhsRUdyOGhNT0hBUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FE9AF7C69ADF34AB5797FCDC1E95121@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beba495-35eb-4591-3fdd-08da43fa2b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 18:11:37.7218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdTcM8C8lZVZn1qlAfSf37GZZ9doH2p27n+L5IuAVMSgSAksrrCYk0bLdqgdH+vwyyExhY0FpFU7Msj6oFEQSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3143
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SnVuIExpIChPU1MpIHdyb3RlOg0KPiBIaSwNCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0K
Pj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEsIDIwMjIgMTI6NDggQU0NCj4+IFRvOiBKdW4gTGkg
KE9TUykgPGp1bi5saUBvc3MubnhwLmNvbT47IFRoaW5oIE5ndXllbg0KPj4gPFRoaW5oLk5ndXll
bkBzeW5vcHN5cy5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4+IGJhbGJpQGtl
cm5lbC5vcmcNCj4+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBKLkQuIFl1ZSA8amlu
ZG9uZy55dWVAbnhwLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogZHdjMzogYWRk
IHBvd2VyIGRvd24gc2NhbGUgc2V0dGluZw0KPj4NCj4+IEp1biBMaSAoT1NTKSB3cm90ZToNCj4+
Pg0KPj4+DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZyb206IFRoaW5o
IE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+Pj4gU2VudDogU2F0dXJkYXks
IE1heSAyOCwgMjAyMiA5OjQ2IEFNDQo+Pj4+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+Pj4+IGJhbGJpQGtlcm5lbC5vcmcNCj4+Pj4g
Q2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEouRC4gWXVlIDxqaW5kb25nLnl1ZUBueHAu
Y29tPg0KPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IGR3YzM6IGFkZCBwb3dlciBkb3du
IHNjYWxlIHNldHRpbmcNCj4+Pj4NCj4+Pj4gVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+Pj4gTGkg
SnVuIHdyb3RlOg0KPj4+Pj4+IFNvbWUgU29DKGUuZyBOWFAgaW14OE1RKSBtYXkgaGF2ZSBhIHdy
b25nIGRlZmF1bHQgcG93ZXIgZG93biBzY2FsZQ0KPj4+Pj4+IHNldHRpbmcgc28gbmVlZCBpbml0
IGl0IHRvIGJlIHRoZSBjb3JyZWN0IHZhbHVlLCB0aGUgcG93ZXIgZG93bg0KPj4+Pj4+IHNjYWxl
IHNldHRpbmcgZGVzY3JpcHRpb24gaW4gRFdDMyBkYXRhYm9vazoNCj4+Pj4+Pg0KPj4+Pj4+IFBv
d2VyIERvd24gU2NhbGUgKFB3ckRuU2NhbGUpDQo+Pj4+Pj4gVGhlIFVTQjMgc3VzcGVuZF9jbGsg
aW5wdXQgcmVwbGFjZXMgcGlwZTNfcnhfcGNsayBhcyBhIGNsb2NrIHNvdXJjZQ0KPj4+Pj4+IHRv
IGEgc21hbGwgcGFydCBvZiB0aGUgVVNCMyBjb3JlIHRoYXQgb3BlcmF0ZXMgd2hlbiB0aGUgU1Mg
UEhZIGlzDQo+Pj4+Pj4gaW4gaXRzIGxvd2VzdCBwb3dlciAoUDMpIHN0YXRlLCBhbmQgdGhlcmVm
b3JlIGRvZXMgbm90IHByb3ZpZGUgYSBjbG9jay4NCj4+Pj4+PiBUaGUgUG93ZXIgRG93biBTY2Fs
ZSBmaWVsZCBzcGVjaWZpZXMgaG93IG1hbnkgc3VzcGVuZF9jbGsgcGVyaW9kcw0KPj4+Pj4+IGZp
dCBpbnRvIGEgMTYga0h6IGNsb2NrIHBlcmlvZC4gV2hlbiBwZXJmb3JtaW5nIHRoZSBkaXZpc2lv
biwgcm91bmQNCj4+Pj4+PiB1cCB0aGUgcmVtYWluZGVyLg0KPj4+Pj4+IEZvciBleGFtcGxlLCB3
aGVuIHVzaW5nIGFuIDgtYml0LzE2LWJpdC8zMi1iaXQgUEhZIGFuZCAyNS1NSHoNCj4+Pj4+PiBT
dXNwZW5kIGNsb2NrLCBQb3dlciBEb3duIFNjYWxlID0gMjUwMDAga0h6LzE2IGtIeiA9IDEzJ2Qx
NTYzDQo+Pj4+Pj4gKHJvdW5kZXIgdXApDQo+Pj4+Pj4NCj4+Pj4+PiBTbyB1c2UgdGhlIHN1c3Bl
bmQgY2xvY2sgcmF0ZSB0byBjYWxjdWxhdGUgaXQuDQo+Pj4+DQo+Pj4+IEFsc28sIHNob3VsZG4n
dCB0aGUgdmFsdWUgc2VsZWN0ZWQgYmUgdGhlIG1heF9yYXRlIG9mIHRoZSBzdXNwZW5kDQo+Pj4+
IGNsb2NrIGFuZCBub3QganVzdCB0aGUgdmFsdWUgZnJvbSBjbGtfZ2V0X3JhdGUoKT8NCj4+Pg0K
Pj4+IEluIG15IGNhc2UsIHRoZSBzdXNwZW5kX2NsayBpcyBmaXhlZCwgc2VlbXMgbWF4IHJhdGUg
aXMgb25seSBVc2VkIGJ5DQo+Pj4gY2xvY2sgcHJvdmlkZXIgYW5kIHRoZXJlIGlzIG5vIEFQSSB0
byBnZXQgbWF4X3JhdGUgZm9yIGNsb2NrIHVzZXJzLg0KPj4+DQo+Pg0KPj4gU2VlbXMgbGlrZSBv
bmx5IHRoZSB1c2VyL2Rlc2lnbmVyIG9mIHRoZSBkZXZpY2Uga25vd3MgdGhlIG1heCByYXRlIGZv
cg0KPj4gdGhlIHN1c3BlbmRfY2xrIGlmIHRoZSBjbG9jayBmcmVxdWVuY3kgdmFyaWVzLiBXZSBt
YXkgbm90IHdhbnQgdG8NCj4+IGluYWR2ZXJ0ZW50bHkgb3ZlcndyaXRlIHRoZSBjb3JyZWN0L3Rl
c3RlZCBkZWZhdWx0IHZhbHVlIGZvciBhbGwNCj4+IGRldmljZXMuIE1heWJlIHdlIGFsc28gbmVl
ZCBhIG5ldyBkZXZpY2UgcHJvcGVydHkgdG8gaW5mb3JtIHRoZQ0KPj4gY29udHJvbGxlciBvZiB0
aGUgcG93ZXIgZG93biBzY2FsZSB2YWx1ZSBhbmQgZ2l2ZSB0aGUgdXNlciBhbiBvcHRpb24gdG8N
Cj4+IG92ZXJyaWRlIHRoZSBjYWxjdWxhdGVkIHZhbHVlIGhlcmUuDQo+IA0KPiBVbmRlcnN0b29k
LCBjb25zaWRlcmluZyB0aGlzIGlzIGEgcmFyZSBjYXNlKHdyb25nIGRlZmF1bHQgdmFsdWUpLCBh
bmQNCj4gRFQgbWFpbnRhaW5lciBSb2IgZG9lcyBub3QgbGlrZSBjb250aW51ZSBleHBhbmQgZHdj
MyBodWdlIHByb3BlcnR5IGxpc3QNCg0KTGFzdCBJIGNoZWNrLCBSb2IgZG9lcyBub3QgbGlrZSBl
eHBhbmRpbmcgcXVpcmtzIGluIGR3YzMgb25seSAoYnV0IEkNCmNvdWxkIGJlIHdyb25nIGhlcmUp
LiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBxdWlyayBhcyBub3RoaW5nIGlzIHJlYWxseQ0KYnJv
a2VuLiBJdCdzIGp1c3Qgc29tZXRoaW5nIHRoZSB1c2VyIG5lZWRzIHRvIGluZm9ybSB0aGUgY29u
dHJvbGxlci4NCg0KPiBmb3IgdGhpcyBraW5kIG9mIHNvYyBsZXZlbCB0aGluZywgaW5zdGVhZCwg
cHJvcG9zZSBpbXBsaWVzIGJ5IGNvbXBhdGlibGUsDQo+IGRvIHlvdSB0aGluayBpcyBpdCBhY2Nl
cHRhYmxlIHRvIHVzZSBjb21wYXRpYmxlIGNoZWNrIGxpa2UgYmVsb3cgZm9yIHRoaXM/DQo+IA0K
PiBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgImZzbCxpbXg4bXEtZHdjMyIpKQ0K
PiANCg0KSSBkb24ndCB0aGluayB3ZSBzaG91bGQgZG8gdGhhdC4gVGhpcyBpcyBhIGNvbW1vbiBj
YWxjdWxhdGlvbiBmb3IgZHdjM3gNCmNvbnRyb2xsZXIgYW5kIG5vdCB1bmlxdWUgdG8ganVzdCB5
b3VyIHBsYXRmb3JtLg0KDQpIb3cgYWJvdXQgdGhpczogY2hlY2sgdGhlIGRlZmF1bHQgc2V0dGlu
ZyB0byBzZWUgaWYgaXQgbWFrZXMgc2Vuc2UNCmJlZm9yZSBvdmVyd3JpdGluZyBpdC4gVGhhdCBp
cywgb25seSBvdmVyd3JpdGUgaXQgaWYgdGhlIGRlZmF1bHQgdmFsdWUNCm9mIEdDVEwuUFdSRE5T
Q0FMRSBpcw0KDQoqIExlc3MgdGhhbiB0aGUgY2FsY3VsYXRlZCB2YWx1ZSBmcm9tIGNsa19nZXRf
cmF0ZSgpDQoqIFJpZGljdWxvdXNseSBoaWdoIHRoYXQncyAobWF5YmUgM3gpIG1vcmUgdGhhbiB0
aGUgY2FsY3VsYXRlZCB2YWx1ZQ0KDQpMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4NCg0KVGhh
bmtzLA0KVGhpbmgNCg==
