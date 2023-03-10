Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBC66B3F24
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 13:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjCJM2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 07:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjCJM2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 07:28:02 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A056A76
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 04:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE3ROB7m6oeDStUSNLtpkQSpyLucr0WifeUAcQrH16r0HsLyWLiuoQ7ckCJDc91k2lHqIe0SEa62BShP0PYfPEjxqH8z2Q9ohV1yB+7OU6vZZ/syU8tlZ60smFIx6pzcip0ORe7B7Xzj6d7ewkCQNkQdB56YxHrsow2kKcmkSJ0TcW/6uHnBNWmxmUy3n838ZYB0bBBRHyfoe5QdJ8LMG1SQeIUZu2SoWJV1aF+Lqte84B1FmcJ1prTa+yVarxYG0kDd9+T+jFp99hNFeBXyQYt0wBu+uGv5JsJ+N+Stz4PxX1UruM6JtBpW63RkHP644/G7KE/2nabcpuNlL51psQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiMramzUKPw1u49WW9eEasyPsikisVlm0oqwI+7mgTg=;
 b=MStndwXBhCXwykSuyCO3HQofaAxM3RKQzKmxmL3E4r9kueQ0N1ZjdmhEGpEB4hfg94qhlmeYSEdkatua75VrZNNrOTJj+RA8iFLo+oSQJqSWrMr5NWq5obFcpR+710XJ5cl0mYT63Wd+Ug4VJO2jB4MWFrtzfKuUQC9iVX2bWgbzmHyfQaGAe3v1q6DUKlwze4hSYNGGPcjDdLWsAaAaJfIJWosWBSRWl0TabqiDfJPSyvkHdGCO2gwiiyHdxzz7Aj8K2sD54CCAlYAiKuSY2RhHXbZPi+8Q0wlFyxF+SGjrZjZjp1MVLq+VT5Qkik07V3lVGFHAnZTHg2X57jLelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiMramzUKPw1u49WW9eEasyPsikisVlm0oqwI+7mgTg=;
 b=WAde1H4bbkkTW5dBWsfMi7ZVVxYPfsZ8dR8xYk9/ieSVOzVFfoWzR4Jde/IgZXT99uE5h5/Y2NRDkJtwKho3HS20zgAhWEIgpHtlS9kbMWubN0vIR028ORa5SpjBsBb/eZM0q9PXvm+nJdqw2ePNafcoHnohi0ACKDJg83tsVsCkDc9Y2fFV2R7yG9VbT+fIfCnuNBlnAycP42FS0pZLli3EPhNXtJUtCD+jwSsZm4EbVMSwjUJ3Dd3cWpIxbqkGxGOqa3fd/f3vNW7FHfWglk7bpYAp9jBG+x2JhA5ggf95INpOtFiwBFH3vagikqIwJQbyCGtvyJWG6ADnRC2NYw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 12:27:56 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 12:27:56 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Topic: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Index: AQHZUzTnvuOBWwNTH0CfFBqIVx8BD67zxl4AgAAqsIA=
Date:   Fri, 10 Mar 2023 12:27:56 +0000
Message-ID: <b626ba525751345e59da4af438c4adf2c833ca0a.camel@infinera.com>
References: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
         <ZAr+eiTrUN/LV3YN@kroah.com>
In-Reply-To: <ZAr+eiTrUN/LV3YN@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH8PR10MB6574:EE_
x-ms-office365-filtering-correlation-id: 392fff78-23ef-4ed6-2fa1-08db2162e09f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TS0SV1f1jOITgEo/1W5Sgm2RUJkpmQXIJ1GjlDSpSiys9f1AgmAeT1R59jit5/RKkoBYiuZ4QuaGZhCr0QIytzniu73OlMf/iqv52tpZPGKIb/lnLTNw1y82CKPhhtGPx2e7mGqIC3A/+kTSoj3o2yjEC1yAjfO6cqyfEkjUbpTMDPlI7Z9CsySdpV9PvYHhD7Brd/dpJLn1S/EMI1rPaSClWQBoq7gkrh14luXYNUrM493Fk8jESTtE4Si6Po+R3W3vZ0uuQh3xA8EOC35siTi2AaooBnpy4FC4ayhv3bnaPBBNvuiI4R8A4BUCYE2jSq0icacQBdlMDBdp81ShtOIbfCfePtSxrVljXT4uIlM/0R7NRktH8MSfUGUx6e0kjFztzoaFEyxQQQiUwnh+8H0uSrtRTsjqb6HeXXcNDLoKJzQjTuaWdOmZYSQyarQm0ji5zRW0XF4YVJup9dAcO954q1L1k5Q7wB7Pte5ry/3JQFbXDuhjLsbnctjpAo2nuRG+tv+6FHmiv/B+52ZkpkFrIAASYvgGIHC2RhyFjUYXKaGa9x3elmcwuZh26IoAOJcwdf530jTd47b7K9Sht+21GWnrJvNOruzkT03DOKiyWUyY1VeJXIMzk6nxlRmQ5jkr8RPXcVMdi9ihtJQHyXIExAIJlhYcLq689gVz/oSUPk7hE+gJ3oH6XvzhQOX/R+R5b7ka9CBXlih3UFup6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199018)(36756003)(8936002)(5660300002)(8676002)(6512007)(6506007)(41300700001)(38100700002)(122000001)(83380400001)(186003)(2616005)(76116006)(86362001)(316002)(91956017)(66556008)(66446008)(4326008)(6916009)(64756008)(66476007)(6486002)(71200400001)(478600001)(38070700005)(66946007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1huRitBdHNWeUwrVU5heFN2aEpVeTk3NVFMWWhoRVErYWFBRVA4OVJrR1Vw?=
 =?utf-8?B?Q1lBNStPQW1ibnNta0ppRGlZY1ZjYUhTZWxmN3N1N3h5b1p6UlJZZG5BYldI?=
 =?utf-8?B?S0plTXlJZFlHWmNNUFFBYU5GZEF5MWxKcS9XajJZdU5TN1E2Q2Y2QXhiUkhT?=
 =?utf-8?B?RE5MTVpYbytwc2k3dzBXOTJSUFBQNnN3ck5xSzJtTllzeEpTK1JhZXZpMEpJ?=
 =?utf-8?B?dlBqV2Vuc2FuSEViRXM2ZW5FdnorSDFmOUx6Z1FmNzNxMkZsc1ZZTXcwSkxY?=
 =?utf-8?B?dGFlYXpsajlHV3pFT3YzT0xsWjFtM3dnNlA4bFkzWnRXVUpzeTJkbnJQQ3gv?=
 =?utf-8?B?aUNrLzhaTTZyV1V4bWtqSmxXZHZ6a3pUOHhwVlVzVVd5RlpHTSszcUVWanFv?=
 =?utf-8?B?Sy9Scm1CMlRqeFJTRUsyTGU4VS9kSGlBamZvTk9uQzFqS09ESjBKSXBOdTlh?=
 =?utf-8?B?WDNuTFJnais4WHc1WFByZENvZnBCSWZ0Y09udVBsaDk0b2czaEVNNVBFYWJ3?=
 =?utf-8?B?dFlSdGpHVStYOWwvYkY2V3BjVTVBUWdHRno3N1JrVTgwYmpXbFhEMXhnbC90?=
 =?utf-8?B?aDFXRGNSUkR3eEtVN0pHcTN2b29SUzRzRzMySlhBMWFzSW1KVSt5Y1NDeGps?=
 =?utf-8?B?STJOUWZPaFpEZy9PVkRyTlAxcm05R0tkTnBCcEFOU2xzMTdPVkRRQTJoRjVo?=
 =?utf-8?B?RDZTNzhSL1czNUZCSDEwYjhEK2t0WDVBTlNZRWwzTWI1UnkyV0VkaldMc04v?=
 =?utf-8?B?M1dCeGRjZlVUNDNnYzEvejIvdDhuWVhHRk9pS1FMbFdlQXFXajdESUlhcE83?=
 =?utf-8?B?OGpCd0M5QysxdWhLZ3J3ZHJlNWFOZnU0K1JJbzNlcmtpVUlnMkd3OWk5dU1T?=
 =?utf-8?B?VHhKT2puOUtRUVBGQWsxNmVqbnZsTWd5M1EwRGNJZDZwangrU1NIaENQK0xG?=
 =?utf-8?B?WlJIcWM0SFFxTFBWZ2d2UlZyazh3QmsvYlJsNFFIWlVKdEwyZWlqOUgvaDJW?=
 =?utf-8?B?SS9LcWw1eGIwU3plRnhMdXFHQ0RDbGdZamVkd2xOQnVtL2pudTRaSWRIMUpO?=
 =?utf-8?B?dFF2YnNHNGVwTmFOTU1PZVl1bjFpTlJVdnBwbmxlZ3NzVzl1SzF5aE1sT2F5?=
 =?utf-8?B?cVlPaEJTNlY4YVlTTWlPc3ZtT2JFTlVkbnVnVHEyVWlsMVFua2tjaDZ1bzZF?=
 =?utf-8?B?OEtqaVF2SVRHVmFUdGJaSUZEZVVUMTFOVXA2blhkOWhrSDExLzYwaU0raFoy?=
 =?utf-8?B?eXpOMkRTb3g1WVUyYy9vbENYNVN4YkZUQzhmMW4vTWt4QStIakJSRXVocTZG?=
 =?utf-8?B?R0pnRnJxV0Q5Ym9UK1NNODRNbzU4L2E4YzlKd3FTUnAzclI5WjJrd3NETDJ3?=
 =?utf-8?B?aEhMMWlhSFN0OG1JSnVyYWpxNzBidU1sVzdIYzN1RTRtV0tSU29lL25Nd0s5?=
 =?utf-8?B?d1h5Sjg1RlNpeFdpVlFWWTIzVGcwbVF5d29SaFhHWTVybSt6cDZxd2J3Qm5M?=
 =?utf-8?B?eHY3ZU9NMit5YzRlUlJXc2RrYXVRQkV0RjdGV2hQQ2MyR29lNlV5NlA5QTFR?=
 =?utf-8?B?L3M4NTltc3N1UFRmbC9MYmhKaDBBSEZuS2dDM05sTVBnbkgvejFnM2JxS2lx?=
 =?utf-8?B?bU9mc2VlbnFkSDBzUFRYb3o1NCtCSWFQSXk3VzkxSmgvS2NRUTlaK2FRTkMz?=
 =?utf-8?B?UVpZSTF0UmdVaUY4djlPbm95UjArWkkzR2JQWXc5VHhMUEJUT0diRWVyWk9O?=
 =?utf-8?B?UzY2dzJOcUtuTFNDM0F5Sm13WjZIdHZtZTF6NlBiNlRhSWM3dkNlZlhldk9D?=
 =?utf-8?B?T3pMMUh5ZGV6OWlLVmtJOWRWeFNhR2VZOFkrVmVlalByTzBURzBNMnNBVW84?=
 =?utf-8?B?SjVGRHdrWWtRMmdza3pnc3VlZXEya3VMUFFUTytDbm9kaEVaNDRZdHUwTTZR?=
 =?utf-8?B?OC9nY3VtSk9taTRlMC9Yd2luSkJwS2tJTW14Nlllckg0c0ZYRGpTYkFOcUFa?=
 =?utf-8?B?M3psWitITDZlRkhLMXh1aVBxSFBBcndBVE44QXA0MXpXTTlkNG5GbmFPcURP?=
 =?utf-8?B?SnhQVC85Y1BNV1cveUNYUnJhRVJGbHNiL0NMVXE4dlNlQnN3eGRBSDlic0ZG?=
 =?utf-8?B?cjdWMUNjdDZQTEJzKzJnWFZVRGl1TGt6bWY2RXBUa0JiT3pwbVQvWTBHTTV1?=
 =?utf-8?Q?PXj8Wq7QDozfAz13TBOUyPYRq04J4wDxXcJQzXt99Eax?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80CB5CA297D8BF4E91936A33AF039A33@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392fff78-23ef-4ed6-2fa1-08db2162e09f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 12:27:56.1628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMH9k9UqDE7fDI2AYtqgY3DCJwTfHDOGBtVApPfrm3+U3gQOQ9RwlTAOtIwbEHcsyKNGe0cRkH8MMvw9OJwnaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDEwOjU1ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMDk6NDQ6MjZBTSArMDAwMCwg
Sm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBUaGUgb2xkIFJORElTL05DTSBjb25maWdzIGRv
ZXMgbm90IHdvcmsgYWdhaW5zdCBtb2Rlcm4gV2luZG93cy4gSSB3b25kZXIgaWYgdGhlcmUNCj4g
PiBzaG91bGQvY291bGQgYmUgdXBkYXRlZCB0byB3b3JraW5nIHN0YXRlID8NCj4gDQo+IFBsZWFz
ZSBuZXZlciB1c2UgUk5ESVMgb24gbW9kZXJuIHN5c3RlbXMgdW5sZXNzIHlvdSBmdWxseSB0cnVz
dCB0aGUNCj4gIm90aGVyIHNpZGUiIG9mIHRoZSBjb25uZWN0aW9uIGFzIGl0IGlzIG5vdCBhIHNl
Y3VyZSBwcm90b2NvbCBieSBhbnkNCj4gbWVhbnMuDQoNClllcywgd2Ugd2lsbCBtb3ZlIHRvIE5D
TSAobmV3IGluID49IFdpbmRvd3MgMTApDQoNCj4gDQo+IE5DTSBzaG91bGQgImp1c3Qgd29yayIg
aW5zdGVhZC4gIFdoYXQgZXhhY3RseSBpcyBmYWlsaW5nLCBhbmQgd2hhdA0KPiBzcGVjaWZpY2Fs
bHkgZG8geW91IG1lYW4gYnkgIm1vZGVybiBXaW5kb3dzIj8NCg0KTkNNIGRvZXMgbm90IGp1c3Qg
d29yayBvbiBXaW5kb3dzID49IDEwIGl0IG5lZWRzIGNvbmZpZ2ZzIHNldHRpbmdzOg0KDQpOQ00g
c25pcHBlZDoNCgllY2hvIDEgICAgICAgPiBvc19kZXNjL3VzZQ0KCWVjaG8gMHhiYyAgICA+IG9z
X2Rlc2MvYl92ZW5kb3JfY29kZQ0KCWVjaG8gTVNGVDEwMCA+IG9zX2Rlc2MvcXdfc2lnbg0KDQoJ
bWtkaXIgZnVuY3Rpb25zL25jbS51c2IwDQoJbWtkaXIgLXAgZnVuY3Rpb25zL25jbS51c2IwL29z
X2Rlc2MvaW50ZXJmYWNlLm5jbQ0KICAgICNTZXQgY29tcGF0aWJsZSBpZCBzbyB0aGF0IFdpbmRv
d3MgMTAgY2FuIG1hdGNoIHRoaXMgZnVuY3Rpb24gdG8NCiAgICAjIE5DTSBkcml2ZXIgbW9yZSBl
YXNpbHkuDQoJZWNobyBXSU5OQ00gICA+IGZ1bmN0aW9ucy9uY20udXNiMC9vc19kZXNjL2ludGVy
ZmFjZS5uY20vY29tcGF0aWJsZV9pZA0KDQoJbWtkaXIgLXAgY29uZmlncy9jLjENCglta2RpciAt
cCBjb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5DQoJZWNobyAiY29uZjEiID4gY29uZmlncy9jLjEv
c3RyaW5ncy8weDQwOS9jb25maWd1cmF0aW9uDQoJbG4gLXMgZnVuY3Rpb25zL25jbS51c2IwIGNv
bmZpZ3MvYy4xDQoJaWYgWyAhIC1MIG9zX2Rlc2MvYy4xIF0NCgl0aGVuDQoJCSBsbiAtcyBjb25m
aWdzL2MuMSBvc19kZXNjDQoJZmkNCg0KTmV3IFJORElTIGluIFdpbmRvd3MgPj0gMTANCgllY2hv
IDEgICAgICAgPiBvc19kZXNjL3VzZQ0KCWVjaG8gMHhiYyAgICA+IG9zX2Rlc2MvYl92ZW5kb3Jf
Y29kZQ0KCWVjaG8gTVNGVDEwMCA+IG9zX2Rlc2MvcXdfc2lnbg0KDQoJbWtkaXIgZnVuY3Rpb25z
L3JuZGlzLnVzYjANCglta2RpciAtcCBmdW5jdGlvbnMvcm5kaXMudXNiMC9vc19kZXNjL2ludGVy
ZmFjZS5ybmRpcw0KDQoJI1NldCBjb21wYXRpYmxlIC8gc3ViLWNvbXBhdGlibGUgaWQncyBzbyB0
aGF0IFdpbmRvd3MgY2FuIG1hdGNoIHRoaXMNCiAgICAjIGZ1bmN0aW9uIHRvIFJORElTNiBkcml2
ZXIgbW9yZSBlYXNpbHkuDQoJZWNobyBSTkRJUyAgID4gZnVuY3Rpb25zL3JuZGlzLnVzYjAvb3Nf
ZGVzYy9pbnRlcmZhY2Uucm5kaXMvY29tcGF0aWJsZV9pZA0KCWVjaG8gNTE2MjAwMSA+IGZ1bmN0
aW9ucy9ybmRpcy51c2IwL29zX2Rlc2MvaW50ZXJmYWNlLnJuZGlzL3N1Yl9jb21wYXRpYmxlX2lk
DQoNCglta2RpciAtcCBjb25maWdzL2MuMQ0KCW1rZGlyIC1wIGNvbmZpZ3MvYy4xL3N0cmluZ3Mv
MHg0MDkNCgllY2hvICJjb25mMSIgPiBjb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5L2NvbmZpZ3Vy
YXRpb24NCglsbiAtcyBmdW5jdGlvbnMvcm5kaXMudXNiMCBjb25maWdzL2MuMQ0KCWlmIFsgISAt
TCBvc19kZXNjL2MuMSBdDQoJdGhlbg0KCSAJbG4gLXMgY29uZmlncy9jLjEgb3NfZGVzYw0K
