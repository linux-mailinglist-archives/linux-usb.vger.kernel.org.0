Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83759347DFB
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 17:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236509AbhCXQo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 12:44:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46832 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234343AbhCXQog (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 12:44:36 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 70D73C0121;
        Wed, 24 Mar 2021 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616604275; bh=qtjl8aBRCGzOEHrcm1o4zv53PwzgDeF/RecgL5STDe4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=MENG8Vdk/c4VInwK3Qxk8hz4XpAqcpbgWklYjOS3BdVdd8rzUePpgs+E3nXZQhtxC
         zV+gL8NQzBJ2Rg3JfXWh5zhX3Oo0FGF3cDcqYFpIFHK7Dyu4xzASOuwzkhMq3XDAeh
         WZ7IEwwDyzvhXzvHAh8MxssZXsB0ciPwj2k0K1rksDOWoV0YQ6t5tntIQHAbhMijzw
         5H6S5wWxgPg2S6iM1oav/Zbr9GemXl6aUff90ZTHX/+Yqv9XnZ4hW0P6ZBA6YLPzP5
         zvQuGEdr+XvxgUO+/CzY1b1cFYa/DKyOhhhEcMDdS5+UuS4XH8rqalDPgmGNfzZe45
         NO4wMZa1aO2PQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 154FEA005E;
        Wed, 24 Mar 2021 16:44:34 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1D91780056;
        Wed, 24 Mar 2021 16:44:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="H3AfJeSC";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EveyptnwGZ8TY24DD20jkSqyv5ea9vkz/MoNvEFFum8ven2KvT4Ngi9KHtRCWLs/tKYapTZ8HprjCP1Z7z7jyHS+fANjXRPH6A7PK1WZUp6Gs38et2Fs1LGpS9o+epApOttpseL9wrV2CI2jqy3i2YjPG+R+nZCMis0SOW6EcG0FJx1ZtuMYKUq8z1Zayud8s/7IML9zPMMM2vRNoNTqz4hetOWkeqZljRNr3fBvhKXZZV9u7n0qUFhgEyUN2UXkiMhWZtFimYwxuS5jKJ4D8bz80kWob2KjMra2MynBbEg1c7StGR8tcVw9fwt92x76reA4V6NxTxngdhXvk/EIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtjl8aBRCGzOEHrcm1o4zv53PwzgDeF/RecgL5STDe4=;
 b=GxqSwf9PPEPx2X1yB5UxCapKmtH44XJbYuEk6hGMAfAvXTXBbmm9vEnwiNcrKheQzrajLDKVPrl6vpGGsfgH3TVGc3J5VbcAQVv2FGlOOJBawn32hYOFe5TFt157dLtthTbrx78j+hdKJD9IVMIVIxR+4wotXYZoLYxva3oXbleCIxEVqlhCOrW8T8igzc+EZ4eIwBt7PRAKaunmm/PouEGHA9gviw2MoodLqP124eKLzrCmm+yv30YCUusmxaNNqEHB0GMw0WtIgk0rxe6SYEgtVBvwTNjJGLz3rhX88CGx/zMNFvwMNzrW8iB+NrGj+fcK4hv/4yQ3awigNRh1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtjl8aBRCGzOEHrcm1o4zv53PwzgDeF/RecgL5STDe4=;
 b=H3AfJeSCCoCh2ILJmlvq0nAFCANMdoUrCl1Zhw3Z1KIdhk+RJRSPg1ut+NMWCC9fkLu2Savh2/YBSeVVyfDIbP4B9l27HOodDRaVGYUgMZ3LZMF+B3+mgnr6GVpFocGgEqLWvQ0QHqwS8ZxOfCfBf/aWGCSS3Ee3urWVizpHyno=
Received: from SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 16:44:31 +0000
Received: from SA0PR12MB4431.namprd12.prod.outlook.com
 ([fe80::bd3f:7f33:72ac:fb15]) by SA0PR12MB4431.namprd12.prod.outlook.com
 ([fe80::bd3f:7f33:72ac:fb15%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 16:44:31 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc2: Add default param to control power
 optimization.
Thread-Topic: [PATCH 1/3] usb: dwc2: Add default param to control power
 optimization.
Thread-Index: AQHXG728lhRvwHKABUG6VmwBvBDsRaqRdqIAgAHrzgA=
Date:   Wed, 24 Mar 2021 16:44:31 +0000
Message-ID: <ce789dca-82ae-0800-7577-2ea0d4c33955@synopsys.com>
References: <20210318061247.B2EACA005D@mailhost.synopsys.com>
 <YFnP4EFrmwuc6Scn@kroah.com>
In-Reply-To: <YFnP4EFrmwuc6Scn@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b7cf951-7488-4e9b-def3-08d8eee41907
x-ms-traffictypediagnostic: SA0PR12MB4382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB438228F3438F648253C66FECA7639@SA0PR12MB4382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uN1qJHZKi/V9mITqrh9XappNrellmJ/1MsMy8Je4DYqbnKAFZ3SyJpNGc7Tqj9unZd9Y/+ixQxs6ufvNFDOiTF/RVmzoSepjCoUL21ENj5FU37uBURM12gEubUMmyefEUor90bitm6zVQVabrC6UdgGcL2QULo58rI9b9pqgK8gGrQOnMP4GitFvT7xt/2s+3d7FpCg7YKjC5djp0Ucxq8X47/EShFcwhBnJi9xMCCae3156MExYpfpEyQKJRFCTiIhyS0ZNkh8NkLDE4YGDOcDTzY2u5cCO5o1zsbYpBAP89dzkh8epzDj9WaKvJFE0Vs5286vWEKcYz9kVL9OjpzK2pFjnlKlUfHd9iTGHa20zXLmF7aixLY3NtVwzkIi34U67S7k4OmYE4F+od4z4cqzIt6ydHIuRfYlS5AljHptBgVQSdyL5bzPx1/dbw3Rbxj+6pTSnEQjDKMAqIez755hyx5PnvvP0sFPS1woTVxkwqSBD6DUIQo2jn/ZO0CtxrtsnBg6Z9gjrFXBa+azNy9Gz1E/mK32+nYiv4gaX9wJmb7ItzdCqfWlybEjaOHdP8oK5zGfCPmDg15FGRqJnC+tpCsCs7dmOzCS7mJe/8IzPJZ74//iKCQDfDhqk3QrhF/3zelswfw/LX22WluYQJt+iAqYNrKhAnmjFdiyHiPIABC9oE3X2NbuOIHw0u5x+0L8LrJEaZm5TrwH4z7QTvlg+AovwrjsBpAhQBxdTdNaGF0HsOnqPzkY0O0hqgDDo79uag0X9jzAXPJTHJCFcFZL2OzzuU9ta0vIfWDkCYnk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(366004)(39860400002)(66946007)(76116006)(91956017)(6916009)(107886003)(53546011)(64756008)(66556008)(66476007)(6506007)(66446008)(31696002)(36756003)(478600001)(2616005)(83380400001)(8676002)(2906002)(8936002)(26005)(6512007)(86362001)(71200400001)(31686004)(6486002)(5660300002)(38100700001)(4326008)(54906003)(316002)(186003)(45980500001)(6606295002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: gUgCiTp3xPxEIun/D0+lxFqAnWIiL3RuWePgaJdRUFSKsyDWrTlVl0cMKt94H+Yk0aT/WPBC/EvLbt1QdY+E3KxOoSP4J5M6rImD++k/7ZD3RMC6rmRUDlrr/aW914dPQgR649nRmZNonGbgO4Q2einAEn4/0m0tJc86ZHdynWHmSUs90U4PrirLkS89UL4J2nlaNXH5pj4i1IGbIU17T6zSIp73M4j8ikseJultYLWiMrpvAS4aajljdp9FIhlAWPcxbTp+rH+SxFco746sM920vuzW+w4UNy58hUudZkBhcGW43TD1H/UICA2yJJjlylW00Q+jo6lROcYXSfA9zCkIxg2+pQetOBb6wYvbvpKJpLPCmYnbgvbxFLRZ9siKba/rZ6hvchTO96KaEK4UfaqxS52WpNE1adcgNRpaIWO/Ek4Q/KTKUDaStT6VuKb8YLOS4a3I0R2w1dN9/eISLKVKArGgnoj6wboVL85LbAqiSr9EatuxirjLrtvKXCvHmLYdKYUCL7Wmid77uJhXEG8C3qz3qfrAv7KDhsTEEHUnWz0mx3YV9q8g5VsSopLNMkJ12q42LDVyjlvO6Mso1eEoTr/k9l6kt5Bp21ahK0tLK5DM9rK1BzHaEIn7c4UBNSdttI0pGrZaPT3BmYXfXVJvqdhfqklaYsaaFfkpc+wsrnE9NRjeKeLKZ6DTHeldAxj8obfPHAiWHQOYBEQdMbMBH6MMdLF/pDRHO7eDaIM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF469356F0A7FB4C940A1C8690DB0898@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7cf951-7488-4e9b-def3-08d8eee41907
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 16:44:31.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3jgn6B1fZSMKA+E2oVG+R7/VeEYb20JVJd3o9kEVL5dHPPVaAHFZpuV3k32U10nGcUzTClpgxJ6wPaOee7Tsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gMy8yMy8yMDIxIDE1OjI0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6
DQo+IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDEwOjEyOjQ2QU0gKzA0MDAsIEFydHVyIFBldHJv
c3lhbiB3cm90ZToNCj4+IC0gQWRkZWQgYSBkZWZhdWx0IHBhcmFtICJwb3dlcl9zYXZpbmciIHRv
IGVuYWJsZSBvcg0KPj4gICAgZGlzYWJsZSBoaWJlcm5hdGlvbiBvciBwYXJ0aWFsIHBvd2VyIGRv
d24gZmVhdHVyZXMuDQo+Pg0KPj4gLSBQcmludGVkIGhpYmVybmF0aW9uIHBhcmFtIGluIGh3X3Bh
cmFtc19zaG93IGFuZA0KPj4gICAgcG93ZXJfc2F2aW5nIHBhcmFtIGluIHBhcmFtc19zaG93Lg0K
PiANCj4gVGhpcyBzYXlzIHdoYXQgeW91IGFyZSBkb2luZywgYnV0IG5vdCBfd2h5XyB5b3UgYXJl
IGRvaW5nIHRoaXMuICBXaHkgaXMNCj4gdGhpcyBuZWVkZWQgYXQgYWxsPw0KPiANCj4gUGxlYXNl
IHJlYWQgdGhlIGRvY3VtZW50YXRpb24gZm9yIGhvdyB0byB3cml0ZSBhIGdvb2QgY2hhbmdlbG9n
IHRleHQgZm9yDQo+IHdoZW4geW91IHJlc3VibWl0IHRoaXMgc2VyaWVzLg0KDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgcmVwbHkuIEkgaGF2ZSBjb3JyZWN0ZWQgY2hhbmdlbG9nIG9mIHRoZSBwYXRjaCAN
CmFjY29yZGluZyB0aGUgZG9jdW1lbnRhdGlvbi4gV2lsbCBzdWJtaXQgaW4gc2VyaWVzLg0KDQo+
IA0KPiBBbHNvIG5vdGUgdGhhdCB0aGUgZW1haWxzIHdlcmUgbm90ICJ0aHJlYWRlZCIsIHdhcyB0
aGF0IG9uIHB1cnBvc2U/DQpZZXMsIHRoZSBwYXRjaGVzIHRoYXQgd2VyZSBpbmNsdWRlZCBpbiB0
aGUgInVzYjogZHdjMjogRml4IGFuZCBpbXByb3ZlIA0KcG93ZXIgc2F2aW5nIG1vZGVzIiB3aGlj
aCB3YXMgc3VibWl0dGVkIGVhcmxpZXIgd2VyZSB0b28gbGFyZ2UgYW5kIA0KbmVlZGVkIHRvIGJl
IHNwbGl0IHVwIGludG8gc21hbGxlciBwYXRjaGVzLg0KV2UgaGFkIGEgZGlzY3Vzc2lvbiBhYm91
dCB0aGF0IHdpdGggRmVsaXBlIEJhbGJpIGVhcmxpZXIuIEhlcmUgaXMgdGhlIA0KbGluayB0byB0
aGUgZGlzY3Vzc2lvbiB0aHJlYWQgDQooaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtdXNiJm09
MTYwMzc5NjUxOTA0MDY0Jnc9MikNClNvIEkgZGlkIHRoZSBzcGxpdCBhbmQgb2J2aW91c2x5IHRo
ZSBjb3ZlciBsZXR0ZXIgYW5kIHRoZSBzdWJqZWN0IHdlcmUgDQpjaGFuZ2VkIHRoZXJlZm9yIEkg
aGF2ZSBzdWJtaXR0ZWQgdGhlIHVwZGF0ZXMgd2l0aCB0aGlzIHRocmVhZCBhbmQgDQptZW50aW9u
ZWQgaW4gdGhlIGNvdmVyIGxldHRlciB0aGF0IHRoZXNlIGFyZSBjb250aW51YXRpb24gb2YgdGhl
IA0KcHJldmlvdXMgcGF0Y2ggc2V0IHRoYXQgd2FzIHRvbyBsYXJnZS4NCg0KPiANCj4gdGhhbmtz
LA0KPiANCj4gZ3JlZyBrLWgNCj4gDQpSZWdhcmRzLA0KQXJ0dXINCg==
