Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F037222D6E5
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 12:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgGYKwO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 06:52:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:36698 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726618AbgGYKwO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 06:52:14 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 88693401EF;
        Sat, 25 Jul 2020 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595674333; bh=HOX5UhqDyDOeSGegmHI2pw0n6OFQ8Mlzad2CeTEx6OM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Xx1j/o8RocTEqwuy6SESClODY732yqD+zXSYS1MknK0E8x8jHgO8oodnGytVOPakc
         qHMjO4KOVk1cHQH1kaZgnapFVdk4lRAMOPKGB1v0D0FjV4WFAyq4jp8hIBuiFgk4oD
         UpMnjnHC8VtPz37qugBCfrZuuuEE/84zNlwJVRHQYrv7vv1WNLZ0SLlBt3qGJFgEVL
         2+Ko6xgB38jC4HAnekht+LOd06o9E6haL2jSpLqZ9890D59vbI5YkcMJInwEE+q87c
         PcGM52W6KcTaUUQq/t06fYYYBFwDvsPhq7ZIhjntC4xZ0MFCToHsggZnRdccKf/7d8
         RBfnPc5dyke6Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E60B9A0080;
        Sat, 25 Jul 2020 10:52:12 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 97B3C40050;
        Sat, 25 Jul 2020 10:52:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="JG4JbzdA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaG7k0RL6hj055MF4ncFI4GQArDCD98pjAjyPz1NxF7LNqS7I6taGkHWSy1/BeRAlL6KSvFXOR0TkRvVDqHAMssY87YzTvhF1/Gt4/MZywWM6x7OzQ8HX3S8HCqAyQq0Tbna30AqtBif+R9krdkaKhJ4he8C3aH/fHrKVpk5CwH3gl06/zBrr8M9MD1FmlfUCx62yCufD0S6nYSfn1v9WpSPv52gLUA5JgLU9CEGRSiy6s8NY05Q8p4BVu2JMkFXBXqQFxuHcd+TpclfyeqzGl+gZTvuCjqP5zqzlEyKeHoV8WHHzNqgyxc2o282DGSizQMYSko3a1F2Z3I41pIbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOX5UhqDyDOeSGegmHI2pw0n6OFQ8Mlzad2CeTEx6OM=;
 b=gkkQj3+5z6vEX+C15Q2QmvVqDxynf7cqIN1zXNBSRqJFLnV7lubgYszML3uHohGp+QMAmBgV/kH2mvF3shhqH5icX1XUsjFumzolvB9pqsUeIvmoOOQjFSVOfsETi4/2cWC/Tvg3KBSuB4s4MR6vw3OTDlM9qF1WneHXjHSePJR7o1TjREBFVWz6Cz3ERC2WdWy6V56J0rg0cR3wQg3vIptiJGBebyAx/YkSKfUEDzbLhQxaSrAyLdC5qUC6eZArBPS7byAIVxWHlrRE+BnJM6UokfvpKbxpQtZ61gaH1DSaPPa38AvNEltyHeZV7cn1mYMPUbeg1SdPzuVrpHM4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOX5UhqDyDOeSGegmHI2pw0n6OFQ8Mlzad2CeTEx6OM=;
 b=JG4JbzdAl9SqFy4SYsOPN8qz7/lASwt4Uk4S0mFhEopO7yZ9jaQol8FnZxzjMMKFPTUJsFEKGOxefThU+Ck+Iodwci2i32hYUMxGQJFHolAfip6Fmo15yutTBCJdaOPnFr6wsIyxXu7X2h7r2Ztcfg5SgcoSA/HRnao/FE8KOyo=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Sat, 25 Jul
 2020 10:52:09 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.028; Sat, 25 Jul 2020
 10:52:09 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
Thread-Topic: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
Thread-Index: AQHWYhOUDJE0Rv53NESyUDB10nA4C6kXn1uAgAAFQgCAAG+0AIAACtAA
Date:   Sat, 25 Jul 2020 10:52:09 +0000
Message-ID: <5a8b70ae-ef91-9073-73e6-d692d98dd892@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <500284ccf0353ee17a6bee8fa55011f801e17630.1595631457.git.thinhn@synopsys.com>
 <1595646889.23885.68.camel@mhfsdcap03>
 <d8539fd9-ffa6-824f-0347-71c73315d8a5@synopsys.com>
 <20200725101326.GB1093846@kroah.com>
In-Reply-To: <20200725101326.GB1093846@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ecf78d0-68bd-415e-73c1-08d83088c77c
x-ms-traffictypediagnostic: BY5PR12MB4164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB416470574043927881FA78C5AA740@BY5PR12MB4164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iGHZaav/pyUO9BB1S0OxQ56HG3Rq/J4H3Be2EpXhAm2jNWKpik9bDp0/OdQMq4Xa5b0WlUQ8RPQqQK2lIEb+69sKVdjhyuOujqL9d+/LoPLw7yt4ZODhdBSdPJwM5bIRm7FZDTRSf0XSelq17zZn2UdqLXbOFBJyeaHJyHwZ15cZ2vbsiJwjcWbyCkbGp8opoEu4KL7kCYrN62Rp71mdmB/7o1R4FxdAk6GqKpCPrjBieDcWtMlOYKwCssktt3er3oPklQIrbNpqwas6pWFWESgT/CUHhBRlFNxOD3PqKp9LY0rEKOWSJkksjtHXld2Tm85zqq1D76BfsiEXIIF+UxN489mG0KNPpMHbTgObZwfp2UgpHZk/lZPS6Ic6XxeU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(39860400002)(366004)(396003)(376002)(316002)(107886003)(2616005)(31686004)(66946007)(26005)(76116006)(66556008)(186003)(31696002)(66446008)(86362001)(66476007)(64756008)(36756003)(6486002)(4326008)(8676002)(8936002)(83380400001)(2906002)(71200400001)(6512007)(5660300002)(6506007)(54906003)(110136005)(478600001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: H0VWgCaZYMUCk9eilccRaAxdbaDp52wn7l4IufNqhh1jgQZgcqUO2H7MLXijCBfwm/tdhc9e0x78dEgRatXnH0d1Cj/ZeQxdZtwupfjeu1xjXj7eLscKvVaixv0l2fGkkROxiSiqAbnBOu3OuLX5uxDqWaXsbM7pZ4iWjMoF72rZI6bfmSN/5YGg96YdeosE2uNj5BHaf2shWwOZSxbGAr+NvqwaySQmO6QrCcIVtfLMC/CiM3SdLgiZAOE1zyBzlkCVzhepq5ErdxYzEBY0xSwMf0tiggQrVeGM/xRVe8dL4c5r1ZbiRoddeJS9oPjJTUqHIGT6+hRW/1nZATlTdIhlaWB7vQn9yfUYHjcP5NBmq5KPddly5uELO9yOS6LOdxp+OvcTyylDPZs4V19yeY4xfMDNjScEXd87qa93MsVtUqdDqeu20Q5tsxrMqeYtjPo7q/5eBWjFV3MzqkVmmb1fjQzhw8QowPHTJP9tqAg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF858FEDE0DCA74F99B29662AC255906@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecf78d0-68bd-415e-73c1-08d83088c77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 10:52:09.2093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVnkw78oWcGytLa6hzWuKdPn5Efjrlf/k13Wm7M64ngwJIwD1aaXtYc0j4aWUm1GoAizodlWs3TR0kDO+Y9C7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBTYXQsIEp1bCAyNSwgMjAyMCBhdCAwMzoz
MzozOUFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBDaHVuZmVuZyBZdW4gd3JvdGU6
DQo+Pj4gT24gRnJpLCAyMDIwLTA3LTI0IGF0IDE2OjM4IC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+Pj4+IFRoZSBVU0IgMy4yIHNwZWNpZmljYXRpb24gc3VwcG9ydHMgZHVhbC1sYW5lIGFu
ZCBkaWZmZXJlbnQgdHJhbnNmZXINCj4+Pj4gcmF0ZXMgZm9yIHN1cGVyLXNwZWVkLXBsdXMuIERl
dmljZXMgb3BlcmF0aW5nIGluIHN1cGVyLXNwZWVkLXBsdXMgY2FuDQo+Pj4+IGJlIGdlbjJ4MSwg
Z2VuMXgyLCBvciBnZW4yeDIuDQo+Pj4+DQo+Pj4+IEEgZ2FkZ2V0IGRyaXZlciBtYXkgbmVlZCB0
byBrbm93IHRoZSBnYWRnZXQncyBzdWJsaW5rIHNwZWVkcyB0byBwcm9wZXJseQ0KPj4+PiBzZXR1
cCBpdHMgdHJhbnNmZXIgcmVxdWVzdHMgYW5kIGRlc2NyaWJlIGl0cyBjYXBhYmlsaXR5IGluIGl0
cw0KPj4+PiBkZXNjcmlwdG9ycy4gVG8gZGVzY3JpYmUgdGhlIHRyYW5zZmVyIHJhdGUgaW4gc3Vw
ZXItc3BlZWQtcGx1cyBmdWxseSwNCj4+Pj4gbGV0J3MgZXhwb3NlIHRoZSBsYW5lIGNvdW50IGFu
ZCBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZXMgd2hlbiBvcGVyYXRpbmcNCj4+Pj4gaW4gc3VwZXIt
c3BlZWQtcGx1cy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGlu
aG5Ac3lub3BzeXMuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgQ2hhbmdlcyBpbiB2MzoNCj4+Pj4g
ICAgLSBOb25lDQo+Pj4+ICAgIENoYW5nZXMgaW4gdjI6DQo+Pj4+ICAgIC0gTm9uZQ0KPj4+Pg0K
Pj4+PiAgICBpbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCB8IDIwICsrKysrKysrKysrKysrKysr
KysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCBiL2luY2x1ZGUvbGludXgv
dXNiL2dhZGdldC5oDQo+Pj4+IGluZGV4IDUyY2UxZjZiOGY4My4uYmQ5ODI2Njk2MDljIDEwMDY0
NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPj4+PiArKysgYi9pbmNs
dWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPj4+PiBAQCAtMzM5LDYgKzMzOSwxNSBAQCBzdHJ1Y3Qg
dXNiX2dhZGdldF9vcHMgew0KPj4+PiAgICAgKiBAc3BlZWQ6IFNwZWVkIG9mIGN1cnJlbnQgY29u
bmVjdGlvbiB0byBVU0IgaG9zdC4NCj4+Pj4gICAgICogQG1heF9zcGVlZDogTWF4aW1hbCBzcGVl
ZCB0aGUgVURDIGNhbiBoYW5kbGUuICBVREMgbXVzdCBzdXBwb3J0IHRoaXMNCj4+Pj4gICAgICog
ICAgICBhbmQgYWxsIHNsb3dlciBzcGVlZHMuDQo+Pj4+ICsgKiBAbnVtX2xhbmVzOiBOdW1iZXIg
b2YgbGFuZXMgaW4gdXNlLg0KPj4+PiArICogQG1heF9udW1fbGFuZXM6IE1heGltdW0gbnVtYmVy
IG9mIGxhbmVzIHRoZSBVREMgc3VwcG9ydHMuDQo+Pj4+ICsgKiBAc3NhYzogU3VibGluayBzcGVl
ZCBhdHRyaWJ1dGUgY291bnQuIFRoZSBudW1iZXIgb2Ygc3VibGluayBzcGVlZA0KPj4+PiArICoJ
YXR0cmlidXRlcyBpcyBzc2FjICsgMS4NCj4+Pj4gKyAqIEBzdWJsaW5rX3NwZWVkOiBBcnJheSBv
ZiBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZXMgdGhlIFVEQyBzdXBwb3J0cy4gU3VibGluaw0KPj4+
PiArICoJc3BlZWQgYXR0cmlidXRlcyBhcmUgcGFpcmVkLCBhbmQgYW4gUlggZm9sbG93ZWQgYnkg
YSBUWCBhdHRyaWJ1dGUuDQo+Pj4+ICsgKiBAc3BlZWRfc3NpZDogQ3VycmVudCBzdWJsaW5rIHNw
ZWVkIGF0dHJpYnV0ZSBJRCBpbiB1c2UuDQo+Pj4+ICsgKiBAbWluX3NwZWVkX3NzaWQ6IFN1Ymxp
bmsgc3BlZWQgYXR0cmlidXRlIElEIHdpdGggdGhlIG1pbmltdW0gc3BlZWQuDQo+Pj4+ICsgKiBA
bWF4X3NwZWVkX3NzaWQ6IFN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlIElEIHdpdGggdGhlIG1heGlt
dW0gc3BlZWQuDQo+Pj4+ICAgICAqIEBzdGF0ZTogdGhlIHN0YXRlIHdlIGFyZSBub3cgKGF0dGFj
aGVkLCBzdXNwZW5kZWQsIGNvbmZpZ3VyZWQsIGV0YykNCj4+Pj4gICAgICogQG5hbWU6IElkZW50
aWZpZXMgdGhlIGNvbnRyb2xsZXIgaGFyZHdhcmUgdHlwZS4gIFVzZWQgaW4gZGlhZ25vc3RpY3MN
Cj4+Pj4gICAgICoJYW5kIHNvbWV0aW1lcyBjb25maWd1cmF0aW9uLg0KPj4+PiBAQCAtNDA2LDYg
KzQxNSwxNyBAQCBzdHJ1Y3QgdXNiX2dhZGdldCB7DQo+Pj4+ICAgIAlzdHJ1Y3QgbGlzdF9oZWFk
CQllcF9saXN0OwkvKiBvZiB1c2JfZXAgKi8NCj4+Pj4gICAgCWVudW0gdXNiX2RldmljZV9zcGVl
ZAkJc3BlZWQ7DQo+Pj4+ICAgIAllbnVtIHVzYl9kZXZpY2Vfc3BlZWQJCW1heF9zcGVlZDsNCj4+
Pj4gKw0KPj4+PiArCS8qIFNTUCBvbmx5ICovDQo+Pj4+ICsJdW5zaWduZWQJCQludW1fbGFuZXM7
DQo+Pj4+ICsJdW5zaWduZWQJCQltYXhfbnVtX2xhbmVzOw0KPj4+PiArCXVuc2lnbmVkCQkJc3Nh
YzsNCj4+Pj4gKyNkZWZpbmUgVVNCX0dBREdFVF9NQVhfU1NBQyAzDQo+Pj4+ICsJc3RydWN0IHVz
Yl9zdWJsaW5rX3NwZWVkCXN1Ymxpbmtfc3BlZWRbVVNCX0dBREdFVF9NQVhfU1NBQyArIDFdOw0K
Pj4+PiArCXVuc2lnbmVkCQkJc3BlZWRfc3NpZDsNCj4+Pj4gKwl1bnNpZ25lZAkJCW1pbl9zcGVl
ZF9zc2lkOw0KPj4+PiArCXVuc2lnbmVkCQkJbWF4X3NwZWVkX3NzaWQ7DQo+Pj4gY2hlY2twYXRj
aCB3YXJuaW5nOg0KPj4+DQo+Pj4gV0FSTklORzpVTlNQRUNJRklFRF9JTlQ6IFByZWZlciAndW5z
aWduZWQgaW50JyB0byBiYXJlIHVzZSBvZiAndW5zaWduZWQnDQo+PiBZZXMsIGJ1dCBJJ2QgbGlr
ZSB0byBrZWVwIHRoZW0gY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBmaWVsZHMgaW4N
Cj4+IHRoaXMgc3RydWN0dXJlLg0KPiBObywgZG8gbm90IGRvIHRoaW5ncyB0aGF0IHlvdSBrbm93
IGFyZSB3cm9uZyBhbmQgd2lsbCBoYXZlIHRvIGJlIGNsZWFuZWQNCj4gdXAgaW4gdGhlIGZ1dHVy
ZS4gIFVubGVzcyB5b3UgYXJlIHRyeWluZyB0byBpbmNyZWFzZSB5b3VyIHBhdGNoIGNvdW50DQo+
IGZvciBzb21lIHJlYXNvbiwgdGhpcyBpcyBub3Qgb2suDQo+DQoNCk9rLiBXaWxsIGZpeCB0aGlz
Lg0KDQpUaGFua3MsDQpUaGluaA0K
