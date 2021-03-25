Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457D93486C3
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 03:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhCYCAZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 22:00:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54154 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233799AbhCYCAR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 22:00:17 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36656403B7;
        Thu, 25 Mar 2021 02:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616637617; bh=TxPKq8qnNHan6JN233vBK+KIfyOJYnzK9scQutnimyE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GE+dmf8ZBxNzNYShJeDieUaTPWVPhvOiA1hXg8nQNXJcax3c96th49DutN258qD1J
         +MzPmqQ3KJjV397mxVMR/GzJY3BUkMGPDdp2TG9LNygwdn7iJYPtYxDcgXCU8gKAMX
         6Ac9T1vZbEP9QH54er28OY/m2twukXdz+PX5rnuJHFPDIb75BjR5f8bzE3qrZKNQmJ
         51G2kwrGcmoaxaF99bTzzn0juxcjJvl2TUqufRVE5HcazXtFhUnKTJzl8jmIszh140
         BMUV7RGfOdSy3E2USjPmHacUO5+FayMPYIv7la18X8BeTCzIBc+ABo2NjIMgrv/1rD
         XGtJy/2QK1xCA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EFF2AA005E;
        Thu, 25 Mar 2021 02:00:16 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9256C40050;
        Thu, 25 Mar 2021 02:00:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="a3KYsqZb";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUFsXluJLd0H2DoKupOGd6JAj3T56r7tC1o51Z2H6x5zN0EomPYrXw7mGillyhUwIaW74Bz22ja0fYf/Cj69e9+5SXEXts8tMf7xMcm+29fhgCQgIUTyRNsyCxHLmQyvS8DGbSFJKY3C6NxI9bBvzdxO7/Vp4JgLS+RquC2pCgnEutcX5Vx1HVLWzROGUmR1Nx71/pW5pvSWp5Bbs8INjWVwaPaVseDVtMLRzSPg8G0zMVXxRNKN5xLkOnGtPVPgcZCdBSIXPmcpGGlMsTBM4Rd35PPoOh1++5tQy9uSu7z7u2s71kmjtl7+goywXHerqiaezMVg/4j+jkTmNsQMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxPKq8qnNHan6JN233vBK+KIfyOJYnzK9scQutnimyE=;
 b=lT6f8cYhF7FaOMiuKxqwTlYtpk1/T9ImYZu2Q7+Rvbxuz6Cp83A/3j1NXBGsxJWfLxfoGqYUtIPNqjl6Kt/0X+b0HJoTeRLwuP6aflSgWsoSILGlkkPGdnZqiUmk1hxZQu1C5D835aQyRp+UmC0DaZrT8hi1EjVD+rHnaMHCRGgukhkCIooJsjQfXJngLXo1hmgDVPG5h/STlcR8bOT10KdTMq3Kz1oS8SDJZElX28VCZ8snkHcGURr+u9A0a12t8phS/4ImmdYEib+sFVmTH0S+fmEt5lWhAm7M20QxmTyElIz2m5pxjJzk5Z9DkW6kECAi0BrmTPb/TLNVoMpV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxPKq8qnNHan6JN233vBK+KIfyOJYnzK9scQutnimyE=;
 b=a3KYsqZbs73zij4BNuMhCZNLsy9pcmT/Z3yWwT3MHugwurRdTG/OuqtJHk852CLrK47r0In3fUuTF0KMJP8skTuOHx5KLbxMKIuJyzLsWp5j12jnSWXjhxhTia4dKH1f/oWDPwTjgw/JL3lC09dHIt9Q0X4QrusG6jbyfURe+dI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4725.namprd12.prod.outlook.com (2603:10b6:a03:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 02:00:14 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 02:00:14 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
Thread-Topic: [PATCH] usb: dwc3: Create helper function getting MDWIDTH
Thread-Index: AQHXIRku2Fv2ANz34UuBKlHqGikb76qT8v2A
Date:   Thu, 25 Mar 2021 02:00:14 +0000
Message-ID: <b4e8500c-fe6f-226a-8822-c26072e4d710@synopsys.com>
References: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <f6c3bf1ec9d6e36a36ed84534988014f2dd70035.1616636455.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14655d53-83bb-4edd-8058-08d8ef31bb21
x-ms-traffictypediagnostic: BYAPR12MB4725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB47256EF6CAD280E953750C1EAA629@BYAPR12MB4725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UAakHXE6A9y3L0nJI+xejoi8a92VR2yigfzz2w0qPZQOhJKMDz+cvpVeuSNf6AaBIuT3Rz/j9aGQNSggJ+qwLP2wf4v9gmJJSaR0aPn45QuD8Rz7e7fE9OnlrDfZZi8sNwHEsk+vmD3suRRrwnKBeTX62eZHratjHF5zyNV+BkJkHRxhueSmc9g8qZI4nL0GqE3OWc6o0EnEpQqAiROnvNwbu/7T73wC01AChY3lNNMy9PUFQ9SKV6+UKJUJEq9/eoqN4Qpp4UWukcnYWFzSMJIeReODCmUFSLOba3mPKJ2Aift0Vyqys4ZRNEbtl92/iyeYeBY3U3g8dcyHwQQ3+KPciSKDM0BxAKzpAioo+JicrjY6hlTmhZYa1hhNaxUbCLqwTGrFud79C9UKbdYjNkeIVQslkcTQkMprHc0M4thoqd0LQOZ/I+q62cWU/i0IMtQRs+n7D5/SGfXSpjfjFRMN1hbnyiN/vaOqkyRK4nKAwhcR9zX1VFcUpH1V4tmBqgqspGX1lzCCyUZJqF195sysH8LAkgdhhA7Fhf4GUdDk0nFXxgOa8wwt6uI4JVA3sTev6mvjVNwcAUR8iADU0T6ok6CjxVr3XVORtK3o2hKgWe0U4oiYrVD61GpGbSARLYgaBX5KxOiSkuIyQUVOIKaKhZkrq9z3SS9aJogOTZT17DweBcPJrr14qyi+Jwklw/SYJZvEkVfN2qGapKw1U/n78NNUgEwgeMfXy/ZSiI4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(346002)(136003)(366004)(36756003)(6486002)(8676002)(107886003)(86362001)(31696002)(38100700001)(4744005)(6512007)(8936002)(2616005)(478600001)(6506007)(186003)(71200400001)(316002)(2906002)(83380400001)(66476007)(4326008)(66556008)(66446008)(76116006)(64756008)(66946007)(31686004)(26005)(110136005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NnNwYjNsSVRkL0NqNGFxZXE2bngvTlY0c3prcldKNTdMZnlYY0xFOHU3RFFj?=
 =?utf-8?B?b0NkdzB3WGQ1UDIvVmlqTnhHTDYxTlpzVGxnM2JCZWpYMUl0bnlTRjBIRGVw?=
 =?utf-8?B?MzVkNzNGNDVNK0FReVNZOHRqVnJDL0JEcnMxUlZhSUJYa2FSZ3dWRE0wQ3pz?=
 =?utf-8?B?TnBFWnphNGU0UW9RTkZ0WWpNTGtQQmhOcFFRcW1hdlVKTW55S0liNnJiZ1Vu?=
 =?utf-8?B?cFNYeEw2SVNhUzJWZExEbGlocW1hdSt3SzRRc0h0ZGdmMGloTzN4OEUxTWFT?=
 =?utf-8?B?NFNzb3VOczA5TDVOSjMxZDZJVThuVnFuZk5JWFBsUHRPSDRTUkRLMmQ0UFVk?=
 =?utf-8?B?SFFhcTNYazZXSUdrcHQwYVJjaTM2RVZwV0U3S3Zhb1UxNzFVRDRaMy9qQldU?=
 =?utf-8?B?c2JxNmE2YWsvYnRXN0lIdGNyamtQS0N2Nk1MYk5jaVpYdFN4QytCN0Fzc0pU?=
 =?utf-8?B?T3lCblZuK3dFS2l0bHR3bDgrdFpHZnlHTjY2UFVOT0hSdlZiYXFKeVFocUVG?=
 =?utf-8?B?RUF5eWRwT1E3R3RoZ1lRLzV2YkZHbDU3ajV5RFVjZk5pWFdCOW14TkM2N3Ry?=
 =?utf-8?B?c2E0NDg5VW4rTlp4aElKNzlPeTdQajB6N3QzUzJVdk0vZ3UrZkh6Vlo3c2Y2?=
 =?utf-8?B?ZDN4Q2FxRkhOcE9SMGE5QzY3bjg5NTluUXRUOXJGaVA2RnRsb1h4K0N3VEVl?=
 =?utf-8?B?VlFrcDcwUlNJL0JhUldqZUROZWxPTzM0d2dlN1p3dHFIRVQ0M1NOb0llVU95?=
 =?utf-8?B?NWdjT0FjTlNoYVZyRmlVQWtUY3YxU3czNE9ZNHBENEZXSUF4SXR5QTdtNzJT?=
 =?utf-8?B?YjVraE4rUHAySUVGSmJUUVF1ZGJ1OGl0L1VCOUpFSy83THFRdlJIcWRpM0xQ?=
 =?utf-8?B?Tm5ybFJoT0k4NGNiazAwT0lrbFJjMFM5WmJ1QzZJSmJOOXIvNTYxdEI2Zkx5?=
 =?utf-8?B?Ty9YK3RZMkQ0SmVaaWhDaXlseW5oV1JiRWhWTEl5THlMUG1wbGRiNWY1Q1hw?=
 =?utf-8?B?b1poRkhrTkpmOFJJUXdnbjhlWGMzTzZ5UE9YczhYN3YzdUtsajY5S2NvVWU5?=
 =?utf-8?B?T203WnRheU00bXRudkdQZkdtSG1NODZQU3U0bjlLK1F0Y1kxZThLMTJSQzgy?=
 =?utf-8?B?ZkhiYzA4cnpJWnMxU2VRNUh3QzZIQlFpSVlwalZBN21KM1JLQ1RrVGtHY3lU?=
 =?utf-8?B?WHRIZEJRWXgyVVZZOUpoSmh0UWp3YkV3R2NxRXV6Q3pCN1Rac0xVdTNEZllw?=
 =?utf-8?B?ZFRlQ2VzYjRMeE5aR2t4TXpNWDJDQWNIZG5VVThaS2M1T2cvdXBmdkRLMjVi?=
 =?utf-8?B?YTRKbDd4WTIwQ2RLSTd3NS9mejZmckNNekgyWHJpVXB5aHk1Mm9jcGlid3JD?=
 =?utf-8?B?V3QzWHh1QVdWVUhHbGFWbERwQ2Y2eWMwYkVNR3g5U3JSTUxnajcvOTN1b0Np?=
 =?utf-8?B?TXFGYyt2NWhCL0VNMlZUanh3eWdzY25talEyT29sSDk2Wk41clZSdDVOaTJ6?=
 =?utf-8?B?WnhaZFVWdGFOVG53eVQ1OTdLOU5lY1F1SzlPVy8zZkRPS1Iwa3draStPazdl?=
 =?utf-8?B?WGkyRUdOZWxPUFJOQnNCV0xiMzZqOTRNVGRha2FNVGErMUc5dlpYVUYzdS9m?=
 =?utf-8?B?amxxVnU0QVF6akFueXZCcDdZc0d5aUhtcStZZVhab3BvNzQ4c2hJdThpZmNt?=
 =?utf-8?B?MTVhWUx2Q3UzSkcydFl4YmtKcGZPaUptMTErVmVGajhybmJPalltTklTaS9r?=
 =?utf-8?Q?Qk8dKnwYRNEBS1UuHie9Barg2+ZLEOI5n7ZJ8tD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8582BDC609FFB244A21CD6CE9C412DEF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14655d53-83bb-4edd-8058-08d8ef31bb21
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 02:00:14.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GE14RQv7/aLzspVJTG/ffqk+WysKE5rBTKootn23hUSBuhetPjKxcukG0QL/h9nX8G9j232hLF3jtcz8L7bhOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4725
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBEaWZmZXJlbnQgY29udHJvbGxlciBJUHMgY2hlY2sgZGlm
ZmVyZW50IEhXIHBhcmFtZXRlcnMgZm9yIE1EV0lEVEguDQo+IFRvIGhlbHAgd2l0aCBtYWludGFp
bmFiaWxpdHksIGNyZWF0ZSBhIGhlbHBlciBmdW5jdGlvbiB0byBjb25zb2xpZGF0ZQ0KPiB0aGUg
bG9naWMgaW4gYSBzaW5nbGUgcGxhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdj
My9jb3JlLmggICAgfCAxOSArKysrKysrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2RlYnVnZnMuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
YyAgfCAxNiArKysrKy0tLS0tLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPiANCg0KU29ycnkgZm9yIHRoZSBub2lzZSBhbmQgcGxl
YXNlIGlnbm9yZSB0aGUgZHVwbGljYXRlIHBhdGNoLi4uDQoNClRoYW5rcywNClRoaW5oDQo=
