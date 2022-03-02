Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 260754C9A5D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 02:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbiCBBZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 20:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235587AbiCBBZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 20:25:19 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EC99F6E5
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 17:24:37 -0800 (PST)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6AAD5C0823;
        Wed,  2 Mar 2022 01:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646184277; bh=ZzSe1RHoR6OsNvy+S+fztJijo9qySEskMZ0LtV/5jec=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RbsVDMEJz3iLjSyA+r9Q7qWyw20VPBml9qXDwaKy+JloCJD+Vi+74x+YYYxvyD5zg
         y0/C6+PE88dxjQawCgXMh3eK3N4SMQGA0p+XdjFG2q0esNOv5n0+Z6LtIEhQ0J7qD7
         TDQHUWnUT9y/sy+sLCN8+IE57+Ts/RuT6+Pd8rL9qI20KzWWk5yiPhSxwYktO6Wg8p
         AOoIh150+hDZCcZyXag7kpgFm78+k8vuoAy+fDIKCkTwPM5BSYGiO3I90SXQHYi1L3
         Rs/3H5vlBLYtjQBojfbjqxbPNfI5iiU2jG1uHlQ2Y1yRGQIc9gFaiLdkO8laGLHVZ+
         fEa+UV2dTWDXA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B659BA0070;
        Wed,  2 Mar 2022 01:24:34 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D30C880078;
        Wed,  2 Mar 2022 01:24:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="qW0qUDsq";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvA6/k5dAyG5Cg0kntJ+4uL9zTvDczUoyk+69sig1gY/49e9epRptoBVkwllP6CtzFXZJVP1qV8j2govu4BIioR6UKsvs87uYwnbF3/cJxx+ysEQlNAnamIjWTRA1xBHnshSesdDMn46KEKDLKGJMB6cwuN3XjdXcVmbETKWpxierHnU4z8wacW8imceZccPVyQKF2RE1MHp6prbrps+198JLxXd8LTxc/llRzd1TlU1NB386NL99UM7WtMG5LTZhdj/Ob2YnaslGoGvMDXQ67PssJEgO3bzhpKqE6hmWFbRnss9zk4qaKhamphZSpvcV1twLNxezEuS3eBK4VZnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzSe1RHoR6OsNvy+S+fztJijo9qySEskMZ0LtV/5jec=;
 b=f+zjFwDlJeePSi1oNRB4fMdpCzrtrd1vOuUSJU6i8cdu2LfN9yv/ByzQ2dQMwm36Ia5hIbounoaPker9z9JK8Tbqs3ITRn2IhwxOa/15ZWDEw3R3WbWC8t6w1DjHONhRVyiM/F3hU+hfMzynTi/B9Kp+JTP0YthLz/AAdP2sd97siEECsspINgLP9HYBrcv2uVso9OpyyzhELG5gTQAyZ4YjVUWsEYEqKXBpuIcAmyyyBcsc+8Hp36aj2X+ew+tcg9SdDU6jKhQpBsX/UMHcPUAEbEClYHsbxcDVZmGL6QCmDfKlBshPSeVSw5gXI3A439pG+nUYe2IRZBxR/Rprtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzSe1RHoR6OsNvy+S+fztJijo9qySEskMZ0LtV/5jec=;
 b=qW0qUDsqYeTOQKwR+3tweBySMKgsI8y/HX+Pt9wO7miBdsaiJwocyGL38L17WiR7MNlkdF99n6IGyg85bK4Ohn+hcwNfohWZjEt3mSeya9Y9su1gmRE5A8X6ijDWtXHZCEj692JXyYOkSV2aCjf+H/EQBj0/zH02aM4PxFS0Ybg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR1201MB0211.namprd12.prod.outlook.com (2603:10b6:405:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 01:24:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 01:24:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: ep_queue simplify isoc start
 condition
Thread-Topic: [PATCH 1/3] usb: dwc3: gadget: ep_queue simplify isoc start
 condition
Thread-Index: AQHYLLUchbBG0c9zPkO7M9bZ+WR736yrTx0A
Date:   Wed, 2 Mar 2022 01:24:31 +0000
Message-ID: <5545d7a7-b3ce-b8f2-5776-0eda7df82939@synopsys.com>
References: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
 <20220228150843.870809-2-m.grzeschik@pengutronix.de>
In-Reply-To: <20220228150843.870809-2-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 761494ed-e870-4c14-9bbd-08d9fbeb66e4
x-ms-traffictypediagnostic: BN6PR1201MB0211:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB0211C03D3094DE6372E22922AA039@BN6PR1201MB0211.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yOc+2HAUr/DbXNLPpPXw8an72Hf4C8a4shfFZS8S6uoa5hvgKssOL68ectvZO4krmOBv8FpERsKgC/L5f1J5h9tiTx7fCYYS7e+V/ci4ydCGEhSzkGpBqLRmI8WAwYmnFRSBBxQelXvD4/6IuoV3eqLiZ4HI/8KrERoSuqb+m5RgHXseJje97oDlknKnzVfGegdhxw5G+JD7/4yNZ5hneutEvDtCLxuFyViOoUsS0LXA07Vjov+kYJwGA7LbGUIxrtgP6xqWwzFfWUA3PcNn0XR9kTzLZDclwXaAcfbE5YswkjwvwNWNNQmlOwlRqkHqogKzk01Hstkohfcwsntsp80U5PtowHSMJuRVBwG3KQC4l/ME+KqweM0dLJLCS69iSF27U2CppuONslzUxuAKqoXHhC0SiGS4urrWMZ23nRS0Uoh+dFWc7yq6MvL2TWQbVPvZi2MCUHje5Qa7K0FiqAkCdg7krxsiouK6lZQBdqP4TW6uKJ0G0uzHp3u5k45w6drNKGW2jUi1Gk1y3qc2OcV1Tc6EEeu0NmZzPuSh0Zkmimwd9/IVS50OpnPBoiMbbrnMDvRHC40RrwcUMYFC5ssNNHNtSShr2JGldxB81ObkrBaFTzXFdVBa/zyDN3OeZbH8t70N/V3CJ4wq5kD/xNO91caQncf8MOpdfIoVXDWADp3YsWmd2e0xsNZxaVa7MzNcJRGo7pbC9+pVhn0syY/vbldbVlw9+bsbLqD3mNALwfCLNfuhKTLdTpBYqhN+LQgj1meMoWRVe+MLx2DLHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(54906003)(2616005)(71200400001)(6486002)(6506007)(110136005)(8676002)(66556008)(66446008)(66476007)(64756008)(86362001)(66946007)(4326008)(186003)(8936002)(2906002)(5660300002)(26005)(76116006)(83380400001)(31686004)(38100700002)(122000001)(36756003)(6512007)(316002)(38070700005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm82eXhXYkFVUUdmVVJ0ZUhJb0xWdnFONTNTZ2lyWndOUGVLdFdJa3BQQ1J6?=
 =?utf-8?B?MFNMYVNpZHBaVGhLYnBqRE9Sd3lXZ1d5MDZKNXQyZmFmV1hLc2ZHbUh0WVFF?=
 =?utf-8?B?NFQ4UkN3Z2s1SmMzWlczMi9CMnFhQzJpN3ZDYk5jL2xSSHZJSHNZSHdpNHgw?=
 =?utf-8?B?T0NZZ0hCckswck15dDQ1WFZvOUh1QzBMRFloWWxxTms2aE1JNy9tejNUNWxu?=
 =?utf-8?B?VGFFOGhEemJUU3VyUnk3MFFhK3dQUFkyeGE5dTc3d0dRa0pRNTNkVjVJbmtu?=
 =?utf-8?B?bEsvb2l0dVRRY1RxMURuUHVURk9XM3lidng2Y2t4SnRqUk9MdVBUTnRXSUQ3?=
 =?utf-8?B?bVpHZTVkWWtHa0pVamlNcUp5ZEN6WUdqTjZ0SytHbmdzb0tUak9JdE5NY2hl?=
 =?utf-8?B?THdISklpeWJHZ0h3eVJFWHNVc2NleDFDQlc0Y25GODlkVVo2OXFRQzlxbDhJ?=
 =?utf-8?B?cTJabUZlZ21GKzl5ZTFtM3h4bXlhVnBYSDIvWVBibVhjN2h0YjZDUUZ2dFo5?=
 =?utf-8?B?bHF2Zko3MGp4RTliWkZoZk5mN255bkJOWlJqbVlWTDEwbjd2T3kzanEzSXg1?=
 =?utf-8?B?cU5kOGZWSzBIeFNSRjIxSHV4cWFCYTBYQThnNlVKR0ZyZklDK1h3bTQ4VlU3?=
 =?utf-8?B?UlZzeDhvSGFHNDF4QU5nVkYvd2VZbkI1SThFalg0cjNkTnhHdXN3MFpRYXh4?=
 =?utf-8?B?SU0vNU9ZbGQwUzNGUnp3Ym8vdEtTWVpKT2NORFd4SzZuL0tWM0w2SHFETFh6?=
 =?utf-8?B?aUIrcEppQ01wYzlWcVVQME5zbHRqNDVZUGZrM3hKRzdiR0laL05QdDRVMzAx?=
 =?utf-8?B?MXZTbWZEZkJWVGJBV09ZZWxoY2x2bFlZS1BJUjNuRUxSSkhsc0FLY3RQU3FQ?=
 =?utf-8?B?ZXQ0QXVLRWNoU2I0UC8yeWRiMkVVVzdrdTNiNTlZbnVXWkhjQWJqdWtIUVpr?=
 =?utf-8?B?T1lKdi9iNUxzallpWVZmVGRxMUJXZGFTM1ptcnVCajJKeWVZK1AwQmU0alhO?=
 =?utf-8?B?WGtrVDA2Z1lTamxvcW51R0VBT2FTRk5pS3cxQ09ENkk5dzBheVFRd3NKME5x?=
 =?utf-8?B?NjdGWVo4VklZUFVWNmpuRzdHcWJiUFZycy9qZWJnVzd6STNkVkJHSE5HR1Ru?=
 =?utf-8?B?UVk1Q29wdTdMSEd1eDE3ZVVCNW02Ny9NZzRvaksrMlZqVFR4YUdvaXA3NWNR?=
 =?utf-8?B?bFBjV2g5Ni9JL2k0NGRHZE1JMkQ3ME9rT1phK0NTMlYrSHB1WGxxbW1INlNH?=
 =?utf-8?B?OE1LOXJQc2hNN0R0OFlJRGQzSWx6VFEwaDRtdVRzWHQ3ekh2RE5yeGZUY1g1?=
 =?utf-8?B?eFhUSS9NUVhpNEFoSGt4OGhMb203WDBpSThWQkF5SnQ4RXZJSGxRd0MxUVY2?=
 =?utf-8?B?aHV6blVLMHpOMVExMzJuRUNTMUFCWWJ2VW1KVU9uTGJoODZHQldhMzZnQUl6?=
 =?utf-8?B?b2lZSXpBckw1SGZCMEJ2WjRKaDJLYnpqd2JVd1kwWTlhbWxiVmRGTklwZ2VY?=
 =?utf-8?B?aGhkUjRILzNBVWxCUGN5MDlUeE9kUGJtT3ZrS042RWFnVFhweG9ZL1ZhUUxD?=
 =?utf-8?B?bW9GTnp4eHNTdlVBK2gyRVoxN0YvRktONjhsQmNEMFpRNWVjVHRJQ2lXN2Zs?=
 =?utf-8?B?Q2dUY25ZbzJCbVVzTkwrNmdob2pFa1g4MzhjRkh0Tzk5ZEVsWFNxQzZTWUtE?=
 =?utf-8?B?Vm5LY05DSTBoLzduL2tKYnJTVU04Yk1SdUF4UzA1VjBpZ29hSEM5L3p0RTZP?=
 =?utf-8?B?ZEs1bmFYU1c2dHFHQmpCLzhyMHQyQjRHZEpac1BHSU9XeWtDSHhVSWJiLzVI?=
 =?utf-8?B?WVNvdUNkT1k2cDJ1RVFKSFUzZHdEV3A2OGZPSXhkQW5oenJNSmxlRThmVy9H?=
 =?utf-8?B?cEVHREZaQy9sd0RBYTU4UjNra2MvZkM1TzkyaHZWMkNaRlZFZUZUN2ZXUXdI?=
 =?utf-8?B?YjhDMWhDTW56TTdNclhZTzRhVUY1MTlyT1BsYXB1dXRyNmthZk1STVcxSVRL?=
 =?utf-8?B?WExNTzdRZ2dhT3RFVWNYd2RXYVhwbXYzaEVSMkRvTUZDeTM2LzR3elB2cUo0?=
 =?utf-8?B?ckdvZlk5L3dNbWIzMi8weWhoNU5nWFhkRkVlQmtYZXJVWkNUZGRxWXVSdDBH?=
 =?utf-8?B?N00wK3IyWTJ2WUROb0c4SS81SmdGNTZhazNCMU9JNlMyL2VZY1ZvRTZ0aFMr?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83A72DA4F834CA49A9FBC52306D2455A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761494ed-e870-4c14-9bbd-08d9fbeb66e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 01:24:31.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKd6h1NjytNp0OuPLPAsAYRseq7eQo4aJuT4SOOb8QiBk6329qka52+UzNgFpRgPKcdtcWuaqvoPvGLEZKPMzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0211
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IFRvIGltcHJvdmUgcmVhZGluZyB0aGUgY29kZSB0
aGlzIHBhdGNoIG1vdmVzIHRoZSBjYXNlcyB0byBzdGFydF9pc29jIG9yDQo+IHJldHVybiB0aGUg
ZnVuY3Rpb24gdW5kZXIgb25lIGNvbW1vbiBjb25kaXRpb24gY2hlY2suDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8bS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQo+
IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDEwICsrKystLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMNCj4gaW5kZXggMTgzYjkwOTIzZjUxYmEuLjBlZDgzNzMyM2Y2YmQzIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gQEAgLTE5MTMsMTMgKzE5MTMsMTEgQEAgc3RhdGljIGludCBfX2R3YzNfZ2Fk
Z2V0X2VwX3F1ZXVlKHN0cnVjdCBkd2MzX2VwICpkZXAsIHN0cnVjdCBkd2MzX3JlcXVlc3QgKnJl
cSkNCj4gIAkgKiBlcnJvcnMgd2hpY2ggd2lsbCBmb3JjZSB1cyBpc3N1ZSBFbmRUcmFuc2ZlciBj
b21tYW5kLg0KPiAgCSAqLw0KPiAgCWlmICh1c2JfZW5kcG9pbnRfeGZlcl9pc29jKGRlcC0+ZW5k
cG9pbnQuZGVzYykpIHsNCj4gLQkJaWYgKCEoZGVwLT5mbGFncyAmIERXQzNfRVBfUEVORElOR19S
RVFVRVNUKSAmJg0KPiAtCQkJCSEoZGVwLT5mbGFncyAmIERXQzNfRVBfVFJBTlNGRVJfU1RBUlRF
RCkpDQo+IC0JCQlyZXR1cm4gMDsNCj4gLQ0KPiAtCQlpZiAoKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQ
X1BFTkRJTkdfUkVRVUVTVCkpIHsNCj4gLQkJCWlmICghKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX1RS
QU5TRkVSX1NUQVJURUQpKQ0KPiArCQlpZiAoIShkZXAtPmZsYWdzICYgRFdDM19FUF9UUkFOU0ZF
Ul9TVEFSVEVEKSkgew0KPiArCQkJaWYgKChkZXAtPmZsYWdzICYgRFdDM19FUF9QRU5ESU5HX1JF
UVVFU1QpKQ0KPiAgCQkJCXJldHVybiBfX2R3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2MoZGVwKTsNCj4g
Kw0KPiArCQkJcmV0dXJuIDA7DQo+ICAJCX0NCj4gIAl9DQo+ICANCg0KVGhpcyBsb29rcyBtdWNo
IGJldHRlci4NCg0KUmV2aWV3ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT4NCg0KVGhhbmtzIQ0KVGhpbmgNCg==
