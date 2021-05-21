Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3E238CE75
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 22:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhEUUBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 16:01:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46210 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229539AbhEUUBk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 16:01:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6CA074023B;
        Fri, 21 May 2021 20:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621627216; bh=53r9IDGKSy0JDtytxFk7kHDgE8MNvX3dRZQ0izTHJ+0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gsn2K8DaevVmIWMUQIx/dtjQXU5GjJbHvxTSl4QeUxaz9rsKsQXlO2rs2PagtC2n1
         DsfNLhm+keLkk7KRJl5H5FBpWH+vNK3DGhnO8/QZI5tfTlUrqsaEK0oj0b0wPBxZ8j
         c5hUFMw4QDGsZeiB3yQA/4LlM9upV5+9aotC/KVz3jn6wOVisKLYfhIi+UFEnvy3iJ
         ubwJIgqMjLlA2W+KXV7uEYa/R6FlI/qshMYQhhDJQiquqwRasUalGIwvDGHISPyIfB
         E1nAaBH8oq1bY0JRK/g+xThnoOIvzuv8y8WaTaQIuu7g0OXlsOXKy3b6VmoMNF3ycX
         FfJbTh7ScdkGA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 57999A0096;
        Fri, 21 May 2021 20:00:03 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B23CF80269;
        Fri, 21 May 2021 20:00:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Fdc+a2O3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSOsw5s+ejkEwbb+m9ZsheSLVTQ4MQPIfROpAE7AjoYxjDhklsSFUBKUZpA6qfhNX/WMqy2DbVGdCVQ3tApsZ26BAcI0fS2PXakz+8MeOwkXPNghhYDAPLqOOwaDDetpLrX3n45K0aSMv65SQjO65FezKh8r+qTvEKuU7IrySPMeSoML4JwPSZHzN80AP0Y01nbjP9W/X4xyWZx1epWAssKanH5+WWnpGYpsvaTwJ5kLMN8nXyd8UWYnnpLVlIKiihokOOI0AP8YUjABBBuKcGwmCI7CL5cukX5twfAtKYRKDw5fwi4gUyJ17cid+POpgGXWmt4Jayw1lVsRbXynqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53r9IDGKSy0JDtytxFk7kHDgE8MNvX3dRZQ0izTHJ+0=;
 b=CiPz181XReikIaMRvbBaOezyF4Ug9gFI3jmK+gvHY5KWVbREQXlGFaOGX8Uqje+zkIikLsOQR/BYKtWfCOnNtFB1I94WI/sURZcpf4InDKdRiVG1QLmxY/48Z7Sa9eSi0cyBgwltOrmv4IQiFDFVLh8XqUs+8nYDs/tZFeoZ/83smV2z8Y83atMkeAaTOfnKtHU4lV7ouaIjk8f1ZAsGyjmQnlUNquWO5g2uLlzj7yHvlRmywW0qXwYl4FQ3xHXJUH+KQL80I5DiWzRbA+MVjuzPrG8xpiXMmdY7kYPBggnSG6UDs55D5tMocnKRMindnqsewJ6VmJBc9rd3YaS5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53r9IDGKSy0JDtytxFk7kHDgE8MNvX3dRZQ0izTHJ+0=;
 b=Fdc+a2O30dX+uk/nUvmS6HkuySHtIfrdr7YTMmEueN/Vuremu/G7b2Nccndgz8bQh8ME6W+VKGTgIC/uNsYpycFpmZZaUx3nirrFZUHyhu2xPP1eC1lXY7zWRIzNmcpZIiFrcOggs5LXstT/dYQv73YdrvPNhbIRVtBUfIDt1GA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 20:00:00 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::88be:f751:f493:25f9%6]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 20:00:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Topic: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Thread-Index: AQHXTbvS7ox14Htpek+B5N8MnuAJ7qrs4WkAgABCd4CAAA43AIAAzy8AgABbA4A=
Date:   Fri, 21 May 2021 20:00:00 +0000
Message-ID: <c8e7aa70-ee8b-16b2-be2b-825e4b778da0@synopsys.com>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
 <20210520210506.GA1218545@rowland.harvard.edu>
 <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
 <20210521012149.GB1224757@rowland.harvard.edu>
 <c5ac1967-fcae-1e85-57d3-ec610aebd97e@synopsys.com>
 <20210521143414.GA1239965@rowland.harvard.edu>
In-Reply-To: <20210521143414.GA1239965@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.15.163.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a91fe7ca-f256-465b-a7ea-08d91c930450
x-ms-traffictypediagnostic: BY5PR12MB4097:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB40978653B7DA4F50CB747EA6AA299@BY5PR12MB4097.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4EnSafqC6RI30ryqPgRlaWFTZYZl51gjdkBZltlglBM+xfPfh/WgWAbG2q4XS6YIkux9+AVh0GPxM+ddBx5f27w5rIlYGRn1FPZPJ+LDZyTaavDE6vDk8yGdNSnLLJRICSAcymVzpBD/k3iooKxow/ouWDmBvhPmr7GWbAxGhTI0IVqC+E+kuUcSeM1Fw8dxr+7TsdKO+VBH0dxqWqqMCy30BUBQ7ufpshztLsYwMzwvzuPUNCsSDJciYbqL5y27dlLE6lBl2uKDOXKvMGFqJhwBLlhaYA8XGTc7XYrcWY3GCVfaC8l7iO3MoDZS3RIXGWVJ9TwZNeN2X7rGIcFm2sQvzvt9h5FNxqMEkguJOOwXO00Nx9cbTY0y6pA2EAvL1rDwp9Rz1fcInx8HJrtD73w+KbN2RvWnowB8YOJkNuAm7KcOKpm2ei1qo2qSuy+SAz1DKTmDd7QCn9b3ElNtitxPrOc927ahqgJgV4Scdvw2wCbgf0xHjo0gu2rPY/tvPOCqlP0D/unMBVtXBuBNdvx/E0MD43wOrZsU/XZUKf2Rcp3JWY9/wrT0bSGikCAjVAMLT8YEVkiq649P5V/Ijz8bqRJwgu0ugWx1h1Svrg8bTk5nIQ54vWiaUYsKMRQezXXycPfqFMjuqXQf36u/E4Ox4JLhjfm1mbQaMKVqbSF5MqhDQZWpm4xC/vcnatmZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(376002)(39860400002)(66946007)(54906003)(186003)(31686004)(76116006)(5660300002)(110136005)(478600001)(83380400001)(2906002)(36756003)(26005)(8936002)(71200400001)(316002)(8676002)(66446008)(66556008)(66476007)(64756008)(6506007)(122000001)(6512007)(86362001)(38100700002)(4744005)(6486002)(4326008)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZkdjL1k5ZWFYUkZEMmJVY00vR1AyRWtaUThLTmN1K0o4MkVkc1orblljUHJW?=
 =?utf-8?B?bkhERWtEL1B2R1pWck8zeStqZnM5U2pvVGxLc0JUYjFwM2h0RmFMemhVWFVM?=
 =?utf-8?B?RWUzNUJPVlRjdXpHVVJpN01UR0prWFZUSFZLYk9VU3FMMHBtWjRXdE9zbE8v?=
 =?utf-8?B?N081OXIvc2cyTjBmUmpTeGphM3BxTDZ0YUQvamR4SERsdFZTblFQc2NRZ2Vu?=
 =?utf-8?B?UXlCWmV5VU01VXRRYUZsb2MyL1lUMTFpQWpIQ2pBSll0VVdmL2pYZFhiSDh5?=
 =?utf-8?B?dkxoSVF4aitha05KMmNXT1dsMmtnRWxGNXhyZ1FjVnB5Zm5vVnd1ZGlpeXln?=
 =?utf-8?B?R2krTlpldjZjS1ZRYjUwMFg0U1VZQlluZE9NZXVUb1NWL3JWSHFDaGlLVm15?=
 =?utf-8?B?SUhzcCt1ZUt4bUFaUnE2Vm9MQ1U3WjBEUFRmTnZvcSt2UDhWeXV0WnQwWFJn?=
 =?utf-8?B?RVZyL1pORXIyMUlUUHBuWXMrdlpKeXVRT3ZSUmp3cE91a09iSmpKcEpNZGsw?=
 =?utf-8?B?VXR6WXg1WXlxc1A1Ujg0c3lUbmZ5ZndMTy9GMFJ2ZS9zUkFvYzB3MkFKOHA3?=
 =?utf-8?B?Ymk5cmE0T0RhUlRQVHlwRURsSStlODAwVExSUC9jd0ZMdzIvcWlVMElPY2NM?=
 =?utf-8?B?VC9LazdSNytkeUsvMm41RjlWY3ZSREhEV1g5R1lTeEI4T24wWlUwSklzMnFC?=
 =?utf-8?B?SmZuMVVqT2o0YXJBeFF1dktKOGxma1B6aDV3QUJ3WnQ3QWpIUThaVCt3d1l6?=
 =?utf-8?B?UXFEKzY5S1JkY0hON3ptdHAza2lhNFN1NnR1OHdWSWpnV0JFUXVKelNHTjc0?=
 =?utf-8?B?K2xwdWF3T1N0RXpOdWpzcVpzemVuRjR0bCtFcldTVC9pT2l3VkIzZCtxYlVj?=
 =?utf-8?B?MXRmR2s5a2J3SFg2cnZ6NFdIb3k3TkpuNExycy9YbGwyM1VRZ3dLV2RHWGo1?=
 =?utf-8?B?a1NheGhrTm9FalFCWlAvNE9CSWZJaVEvZ2RkcUU4dTZsUExqOGlIdXB1bDFQ?=
 =?utf-8?B?MkxpY0Qxdnk2bERDb0laTkJvc1NqLzZ4SHRnWnBqeG4zMTZpVnM3c05FdTJk?=
 =?utf-8?B?UGl6bHJXZzdwWmNkQUlqT2JsakRGMHplWnlxcUhac084b3ViNU1VTWkraVpE?=
 =?utf-8?B?QUo3WDQ4b0xBdG82Yk1ZM3NUajZrOU9OYjZucUNKeFh1a2hGZkJZbWovSW1z?=
 =?utf-8?B?eEhJL0tsSnlHckJZUXhqZnExSFAyYnVMNytURE8xbk9veTREdnJXb1RZOWhp?=
 =?utf-8?B?dlZadTAxVUhXWmp6OGhkUUJnQWZ4S3MxVFFhTGlZNXlXcE1uaEIya3FCUG5a?=
 =?utf-8?B?ZzFYa3FyL05YVEh2SGNCOW55NzNOVDg0dytxTU9HVm5lc0tyN2NZeEQ3aGdH?=
 =?utf-8?B?ZHJ6VHZpcmttcjVUMitQMWRNYlhGcWliUzN6ZCtOQ0RhSFEvUktGckhQekx3?=
 =?utf-8?B?aWRzZi9vQUc1YWtoMlZPVU9ZRDVmUDl2ZjgxcGExQUJNM0dEbGJVMTdUVk1s?=
 =?utf-8?B?Q2Z1NjZpMloyb1c5ZTFmamlWUHpFeHRHK2Z0TWRTWGlZbzh6cXdMNm5MK0tZ?=
 =?utf-8?B?N0NIZ2x5Y2JNc0c2UnNwYWRmRnpGRG1sWEZ1NFQxVlY3SjBOMmhsczdONE1E?=
 =?utf-8?B?WTVOOEhZTURMQUUraXBsOVBQMXNwdy9TYlNRaU9UcUpCTjZweEpLWDIwazZ3?=
 =?utf-8?B?M0dXMFNKQTNkeGkyRm1pLy90Y0NIWStrZnVRU0dDTDFlWCtCbmQwdkc5TFYr?=
 =?utf-8?Q?4Z8JYYki68+NAdOpjY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A09916B286FE1A4D921B527F57A042B0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91fe7ca-f256-465b-a7ea-08d91c930450
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 20:00:00.6381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMLt+x1teKq7v3gqggmGgpoeeRnkPT6KyNlbmxtCwmNwhlIJ9e5m69WKYB+DQWPDQ6MvBqLIrH1C76XUJz+9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMDI6MTI6NDNBTSAr
MDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gQWxhbiBTdGVybiB3cm90ZToNCj4+PiBBdCB0
aGUgbW9tZW50LCBJIHRoaW5rIHRoZSBiZXN0IGFwcHJvYWNoIGlzIEd1aWRvJ3Mgc3VnZ2VzdGlv
biB0byByZWplY3QgDQo+Pj4gVVJCcyBzdWJtaXR0ZWQgdG8gZW5kcG9pbnRzIHRoYXQgaGF2ZSBn
b3R0ZW4gYSB0cmFuc2FjdGlvbiBlcnJvciwgdW50aWwgDQo+Pj4gdGhlIGVycm9yIHN0YXR1cyBo
YXMgc29tZWhvdyBiZWVuIGNsZWFyZWQuICBJcyB0aGF0IHdoYXQgeW91IHdvdWxkIGxpa2UgDQo+
Pj4gdG8gc2VlIGF1dG9tYXRlZD8NCj4+Pg0KPj4NCj4+IEZpcnN0LCBqdXN0IHdhbnQgdG8gcG9p
bnQgb3V0IHRoYXQgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHN5emJvdC4gSSB3YXMNCj4+IGp1c3Qg
dGhpbmtpbmcgaWYgdGhpcyBpc3N1ZSBvY2N1cnMsIGFuZCBpZiB0aGUgdXNlciB3YW50cyB0byBz
dGFydCBhIG5ldw0KPj4gdGVzdCwgdGhlbiBzaGUgZG9lc24ndCBoYXZlIHRvIHVucGx1ZytwbHVn
IHRoZSBkZXZpY2UgYmFjayBhbmQgYWxsb3cNCj4+IHNvbWUgYXBwbGljYXRpb24gdG8gYXV0b21h
dGljYWxseSB0cmlnZ2VyIGEgbmV3IHRlc3QgYWZ0ZXIgYSBmYWlsdXJlLg0KPiANCj4gSWYgeW91
J3JlIGp1c3QgdGFsa2luZyBhYm91dCBzeXpib3QgdGVzdGluZywgdGhpcyBpc24ndCBhIGlzc3Vl
LiAgU3l6Ym90IA0KPiBkb2Vzbid0IHRlc3QgcmVhbCBkZXZpY2VzOyBpdCB0ZXN0cyBlbXVsYXRl
ZCBkZXZpY2VzIHVzaW5nIGEgDQo+IHNwZWNpYWwtcHVycG9zZSB1c2Vyc3BhY2UgZHJpdmVyLg0K
PiANCj4gQWxhbiBTdGVybg0KPiANCg0KQWggSSBzZWUuIFRoYW5rcyBmb3IgdGhlIGNsYXJpZmlj
YXRpb24uDQoNCkJSLA0KVGhpbmgNCg==
