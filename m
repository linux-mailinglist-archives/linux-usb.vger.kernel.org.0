Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450DD364CCE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 23:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239182AbhDSVHw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 17:07:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36930 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230430AbhDSVHv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 17:07:51 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 02247C001A;
        Mon, 19 Apr 2021 21:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618866441; bh=iH+XhCUPMosfZ0Gtj2kbUGym27cycm+q9qPVro/hgig=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PW/iTGBWqkwEz99E330sb/U9qBQJOKoICQz+yx3o5+B7ybt1DYgWKe1bVez37C2wZ
         5oyynGqhFFqnRNXviGC66EU2kiis2PYGNU3aYkjzV3CzAFKDr5l//6/oA//WoUnzQH
         wuon3LlYoW/Ynhz6hPsiZTV5WIwcUVDf1FDz+kc8TTH2+3gej1eyUot+q+PtH/v545
         zmwhKqL0VyygXCoKoKhg8UDnYBTNTfH6syXFR03aFFuVsr6ntbNJxvy+VIvbEm5aza
         XbvN+r7Sg7IYDMuznfk9iMZ5Vv0Trb1L1hy0jReWRsM0gj1j42CH+oyHrfxdYHR79e
         hQF/LhTEfYxSA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 626A0A006A;
        Mon, 19 Apr 2021 21:07:20 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 38E254009A;
        Mon, 19 Apr 2021 21:07:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EptIOPDg";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QelWBK+Y2pWFcEeJ0gnb4wPWAhyv3cVbxKCbw241QZWuPBycsxcd5HkNeivMpaCZKOlmJqWT9wqriuAUmWFFftscRy/qGswg2iOQecONfxlBtPrr8ccWiZ55hIswH8hm+LoVRfgSrL7PFBCwI3kE522w/qrvyjZCERRkzVxyUukhWaTSNiCUyQY6o+7YvpzU8CBevv0YqahPERmdmWE1IKmpZ90ncqYLfzuGj+SCC9sqkrYXyu8sUQTyWBpQIKQ8In1NiwCras9kW3Ywq1V7ACIz5dYKcINnLOfsWvdW4B3kEddjGZ5y66PwMAiv2oh9WoZ7DUCcOcA2XROah+cQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH+XhCUPMosfZ0Gtj2kbUGym27cycm+q9qPVro/hgig=;
 b=YZJyeyfz/E6M+3f4JydRtkAWTQLH+Ur24TMsxPr4nVHalf25IgGUqUF7w3GPb3SeX5aGOY8ob5ulBQpl6t1tWRpc73/xNb+1r0U8iml0S9DzgNd5rAjEjq9NyuQ1oSgMz2SYSxaqef+f/+p9HEtrypiY8MFAHwtyjp9E1cmgPEXMvZUYTsNEdz5vYKaZ08rRQ1HqbmxrTNUYAZ4Z3rSdFOG/B+ZR7XdHcB1ydSVTLzI9wk1bAN2KkHW9HJNOGJNeq/sCYgXNLa6rWRIgGHb1fF6ZYptlc32+x0iGxN1++x5YSS+QOa2eoGzpHVa8k+bUm9NyewNXva9yh4630hpgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH+XhCUPMosfZ0Gtj2kbUGym27cycm+q9qPVro/hgig=;
 b=EptIOPDg/R8ttDEeJJoSABOfREGNNyqg7EL11AeFcGF0L4tvJpmHNqVb9n5IP8pbJAavY8qr4zst82+K6ExxoYecbI9jj9VCBmXaMU3InKRHi7KiIolzu5Cas8KYbyIw0iOCoAN+oteTmf8ah1jDGPb3NcV4hMCzKv/tFntTAI4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 21:07:18 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 21:07:18 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH v2 0/7] usb: Set quirks for xhci/dwc3 host mode
Thread-Topic: [PATCH v2 0/7] usb: Set quirks for xhci/dwc3 host mode
Thread-Index: AQHXLaL5bGFNJMfvyUuAuQrk/FWpKaq8ZK6A
Date:   Mon, 19 Apr 2021 21:07:17 +0000
Message-ID: <d7443db2-eefa-54e0-7549-2fe2b6c9636a@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53032d74-4805-4c97-bfe7-08d903771d80
x-ms-traffictypediagnostic: BY5PR12MB4933:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4933311586467907EEC2483CAA499@BY5PR12MB4933.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XEEj8BWe7RFGYCvWneRraPQWIjSI5BbdRAZQ+Bww6BA/GDivaKXQs9dQscX/z++Yuh7OhESZSyqZ2ZIIGOkT2XOgZHv1+kooi8usxzmj+kEj8lnxdpRW2+zSYKZu/Fk+XUG9vom30lwhnxvDt/TyDTsC8Wv4zQA63bpSbzrO1WdmW5oVL/itexr8S4KxqW5u7hDI10MzuvHPzfWCSqaGzzQgQScFILeJSgSLlzrLgTuyU3CstSzP8m52mgJuFwzbYjWxOuSU8u+O6bgXyCY/dSE5aienvNPRZppm7+bAWxmkfeCM5lZu99SAjVpKkHFBxh/YsyonfE3QOTymN4L8zIU0LxFaIkcN67Xl5B10/XlukJHEqVbxTIvQV8/nmzHXJD2lrCQ+jynln870/RbJvT+P7IFwfJkW7JtLrsEMSkJr6jwPuJn4YrOFv+/SrguLw8EpCP06nIyyL0xjRPo1WD3H0ENOKUb+Yf8vYjBmDbfq/5oVm1sNF4tQUfj8DSVbPoRpOu1FkPqZVtqFexKaFHfmJ3BtcHMPRNHYeunkRT4X+6w+qesdPpnstqUMDXlbeqB6Zi45AWZ0wF8uHPCzEs+M7kuOZ7aIFYi7ibZ/oJ2RGCxp1kEjIvYSzYNPKo75ASXdFLQbWbmMi5T02ndl+6I9XCCeKSLv9qMeFLjcUKh5hM7yVQCYr4Z6ARFnnEaP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(86362001)(8936002)(8676002)(2616005)(316002)(186003)(71200400001)(6486002)(31686004)(76116006)(31696002)(54906003)(83380400001)(66946007)(6506007)(38100700002)(64756008)(6512007)(36756003)(478600001)(66556008)(66476007)(5660300002)(122000001)(6916009)(26005)(4326008)(2906002)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eDZnbVluWUVuejdBM3lmWFVMalg4US9jajI5TXJYdCs4eXpyNnFZNjlLdTdN?=
 =?utf-8?B?V2xnT3R2cHlQSVR0QTdjRmtrOVZpeGxqbW1pWDZVVy9ZMzF1Rzl3UmFScmhY?=
 =?utf-8?B?MkdRMk5rUk92clRsb2MrQlBoY1FIaGxsUGoxOXk5R3BORG5tVHZ6dmdxSlBU?=
 =?utf-8?B?Q0wwNWZvL3I5UHJwVHFVVXZFUEFtWS96YXlsUEFCbnVoYnRRUlg2UStJM0RJ?=
 =?utf-8?B?RjU3K3Z5N1QrcjFMdGtIaURXaXZrR3dvcGdEcDU5ZloyLzdQZGxHNFpjdWti?=
 =?utf-8?B?bG4xK0t5bHhDbWVjcXphZmFwYVdwTkJnTkxSUjV0M3RmamtVZXZhMlBCajFV?=
 =?utf-8?B?bE55VUh4eXpWKzZYMjIvaGlNYXIxNWtMUVo4dGZ3Rlh1RUJlSzk2dmtaRitz?=
 =?utf-8?B?VmY1V1VKVG1TeWR3RkVWUUM2SUJSVW5tNExyaTRXWHBpYWgvUSt6eFhnd1Y4?=
 =?utf-8?B?MEhud0ZyNjA4MElWKzFtd2xxZXBZdXdoNHZRdHp0KytSL1N6eC9VRmtRU2l4?=
 =?utf-8?B?S1Z4RHQ2Uzhaa24zZGx1bDhhdTMyN2lEOHd1Y2tZTUZadmJqY1NKWThnVXpo?=
 =?utf-8?B?LzdlWHNkeDM2UjRiemtzNDJUK2wyVnRpTk9tMS8zS0duZ25odU8vZHRyaEFk?=
 =?utf-8?B?dTFPQlNBbCtlUng0a2NsUThzQ2p5Q3MySm5zMFcwRUZ6WVpvWDFjc2NLeDBE?=
 =?utf-8?B?dSsxRlpOblhnUk4zNGhwWURPSHo5UXJwLzNHNC96VVVMVkRZa21ZeVd1WENT?=
 =?utf-8?B?dzlmZGZlN3Z6ZDBYdjFiN2ZGZzhjU0xrRnRkeFptbURXcnhIZTFtRzlWQmxE?=
 =?utf-8?B?c05oT1hvb2w2eUVuQk5hMVpsNzVJZ28zc2VlK05rUGhueUxiODVlNGwwOThx?=
 =?utf-8?B?R05CNkNJdytRTzNLenVGUlhaWERuY3oxZExkbjc1WTVkWEFzN3VFajVjKytR?=
 =?utf-8?B?dlkzd1lWbUNSeFVpR2prWUhTRzBQUVZPS3prVVdjY3lySTZxV0FZdnQyWndx?=
 =?utf-8?B?WlRSN3hScldxMGdQT3dJOHpFdVJmbkVKQzdFWC9MNG1NQlNmc3FKQkZaUFBx?=
 =?utf-8?B?ajFZTjlqZm1Odm9KRytkZTkwRU00S2VBYlFRanBpWU1Yd1J3dkw4eU5mYU50?=
 =?utf-8?B?ODJQVFpJYkFNOWhGMkxXUmNES2cxUHpORWR2QXAyM1dOc2REOHBXa1VubkVI?=
 =?utf-8?B?V2g2WFlOR2FjclhLMzkwUDlsaFB1a0JRS0JtdEl3Ujl0TkpjeGZScXBxQnE3?=
 =?utf-8?B?Y0hnMTVIZVFkQUdJOVhZM3Z1M3FYUDRpd0phTGVNeEI0c1Z5WURtMWY5OWda?=
 =?utf-8?B?bXRPWWdMVGI5eEIxY2s5cUtVTkp5dWhUSzNOZGR3SG9pL0lXcW54YzB4emN0?=
 =?utf-8?B?ak9vWlg4MGN6dnQ5cWowOEFiVnpEMWZnd2YxNWdmWkNDaExNajlseUFtUC9l?=
 =?utf-8?B?S0NUazN3U1FIR0MwSnVPMExaY3Q0aW5NT3k1a1hhUlVMZ2YzTm9RSkFLM1Mz?=
 =?utf-8?B?Und4NXdtblNXWVFDYVkzZmJJNkU2RHJVWmUycHozdG41dVdVQTlHT0I0TmhI?=
 =?utf-8?B?RTdncllzaUQrNE9tSUM3Z0t2amtwaitoMGY2aHRLcEdXRVhVQ0IrMUEvZXFR?=
 =?utf-8?B?Y1BUVEUydjBRb3NIN29HNkR0L1VOYlgzSEp3MG82MUQ0Zlh6OUl0SXl0aXZU?=
 =?utf-8?B?WnlTb0FqQ1Npc0ExWDRrcXVEbTE4TlZGMWhJejZLYmNvN1QxUk1LcDQ1WXBE?=
 =?utf-8?Q?t/D/1aCHJ2WYVQCepwTvM9De2CRvjk1BNQQFo3u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E1B177A5E76F54F8312B510F8CD582D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53032d74-4805-4c97-bfe7-08d903771d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 21:07:17.9525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aP0rhj6DNesTejCDtO1D2WK0h5IuLdNHfVDYV9WoUrhEvAEXzsb6NrXRmgBlaCg0oFp+muL/9ECnolnPbpZKsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCg0KVGhpbmggTmd1eWVuIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBhZGQgMyBu
ZXcgcXVpcmtzIGZvciBEV0NfdXNiMzEgaG9zdCBtb2RlOg0KPiAgKiBYSENJX0lTT0NfQkxPQ0tF
RF9ESVNDT05ORUNUDQo+ICAqIFhIQ0lfTElNSVRfRlNfQklfSU5UUl9FUA0KPiAgKiBYSENJX0xP
U1RfRElTQ09OTkVDVF9RVUlSSw0KPiANCj4gRGlmZmVyZW50IHZlcnNpb25zIG9mIERXQ191c2Iz
eCBjb250cm9sbGVycyBoYXZlIGRpZmZlcmVudCBxdWlya3MuIFR5cGljYWxseSB3ZQ0KPiBzZXQg
dGhlbSBiYXNlZCBvbiBQQ0kgZGV2aWNlIFZJRDpQSUQgb3IgRFQgY29tcGF0aWJsZSBzdHJpbmdz
LiBIb3dldmVyLCB3ZSBrbm93DQo+IHRoYXQgYSBwYXJ0aWN1bGFyIElQIHZlcnNpb24ocykgbWF5
IHNoYXJlIGEgY29tbW9uIHF1aXJrIGFjcm9zcyBkaWZmZXJlbnQNCj4gcGxhdGZvcm0uIFdlIGNh
biBlbmFibGUgdGhlc2UgcXVpcmtzIGJhc2VkIG9uIHRoZSBJUCB0eXBlIGFuZCB2ZXJzaW9uIG51
bWJlci4NCj4gVGhpcyBzaW1wbGlmaWVzIHRoZSBkZXNpZ25lciB3b3JrIGFuZCBjb25zb2xpZGF0
ZSB0aGUgbG9naWMgY2hlY2suIFRvIGRvIHRoaXMsDQo+IHdlIHdpbGwgbmVlZCB0byBleHBvc2Ug
dGhlIHhIQ0kgcXVpcmtzIHRvIHRoZSBjb21tb24gaGVhZGVyIGFsb25nIHdpdGggdGhlDQo+IHBy
aXZhdGUgcGxhdGZvcm0gc3RydWN0dXJlLg0KPiANCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0g
SW5zdGVhZCBvZiBjb21iaW5pbmcgeGhjaS1wbGF0IHByaXZhdGUgc3RydWN0dXJlIGluIHhoY2kt
c3F1aXJrcy5oLCBrZWVwIGl0DQo+ICAgYXMgYSBzZXBhcmF0ZSBoZWFkZXIgZmlsZQ0KPiANCj4g
DQo+IFRoaW5oIE5ndXllbiAoNyk6DQo+ICAgdXNiOiB4aGNpOiBNb3ZlIHF1aXJrcyBkZWZpbml0
aW9ucyB0byBjb21tb24gdXNiIGhlYWRlcg0KPiAgIHVzYjogeGhjaTogTW92ZSB4aGNpLXBsYXQg
aGVhZGVyIHRvIGNvbW1vbiB1c2IgaGVhZGVyDQo+ICAgdXNiOiB4aGNpOiBDaGVjayBmb3IgYmxv
Y2tlZCBkaXNjb25uZWN0aW9uDQo+ICAgdXNiOiB4aGNpOiBXb3JrYXJvdW5kIHVuZGVyY2FsY3Vs
YXRlZCBCVyBmb3IgZnVsbHNwZWVkIEJJDQo+ICAgdXNiOiB4aGNpOiBSZW5hbWUgQ29tcGxpYW5j
ZSBtb2RlIHRpbWVyIHF1aXJrDQo+ICAgdXNiOiB4aGNpOiBXb3JrYXJvdW5kIGxvc3QgZGlzY29u
bmVjdCBwb3J0IHN0YXR1cw0KPiAgIHVzYjogZHdjMzogaG9zdDogU2V0IHF1aXJrcyBiYXNlIG9u
IHZlcnNpb24NCj4gDQo+ICBkcml2ZXJzL3VzYi9jZG5zMy9ob3N0LmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvaG9zdC5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyMiArKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyAgICAgICAg
ICAgICAgICAgICB8ICAxMiArLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jICAgICAg
ICAgICAgICAgICAgIHwgIDI2ICsrKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXJjYXIu
YyAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmlu
Zy5jICAgICAgICAgICAgICAgICAgfCAgNzYgKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTM0ICsrKysrKysrKysrKystLS0tLQ0K
PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDcxICsr
LS0tLS0tLS0NCj4gIC4uLi9ob3N0ID0+IGluY2x1ZGUvbGludXgvdXNifS94aGNpLXBsYXQuaCAg
ICB8ICAxOCArLS0NCj4gIGluY2x1ZGUvbGludXgvdXNiL3hoY2ktcXVpcmtzLmggICAgICAgICAg
ICAgICB8ICA2NSArKysrKysrKysNCj4gIDExIGZpbGVzIGNoYW5nZWQsIDMyNiBpbnNlcnRpb25z
KCspLCAxMDQgZGVsZXRpb25zKC0pDQo+ICByZW5hbWUge2RyaXZlcnMvdXNiL2hvc3QgPT4gaW5j
bHVkZS9saW51eC91c2J9L3hoY2ktcGxhdC5oICg1NCUpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC91c2IveGhjaS1xdWlya3MuaA0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiA0
OTY5NjAyNzQxNTNiZGViOWQxZjkwNGZmMWVhODc1Y2VmODIzMmMxDQo+IA0KDQpEaWQgeW91IGdl
dCBhIGNoYW5jZSB0byB0YWtlIGEgbG9vayBhdCB0aGlzIHNlcmllcz8NCg0KVGhhbmtzLA0KVGhp
bmgNCg==
