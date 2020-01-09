Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB35D136116
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 20:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgAITbY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 14:31:24 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:51724 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728823AbgAITbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 14:31:24 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4ECD3C00BC;
        Thu,  9 Jan 2020 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1578598283; bh=Q0fb/epkhQLNol3/1+JWHMhdxFYTyBfYQe1f8CMd8Go=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=FbwUfCDtHsq/Xc6ntaryFN/lfO4JhgmnAaAzqpdBn4f4HiXhf8FktGlXgO8FfI6X0
         h4C/hX6TV4udVoSBgT21bVWWhoUsDgvjak11tTSxNqwLA9uUKQZP5v1EiOL9nKhT2v
         11yH9ettLko2gAE/Sx8nEZIGe+bg2vQfc+MXuygP0dO+g2Hb0MilwJCXB+F8QYRyB0
         gDfq6MRmbi9RVLgz8wNaeyENwinwjL6VueaQU4uM3G/iyrLozflCoIvE1/gzlMH9wo
         55Nt8gOv2CKRgFlNe8oc9Ej4yVXC4aMDX1tSu0kgk1/jk6jkEv93r4Z1abuts53UjY
         lnjJJwXUSZpeA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D4551A0083;
        Thu,  9 Jan 2020 19:31:22 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 9 Jan 2020 11:31:22 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 9 Jan 2020 11:31:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs3u8g76e/oO7IN2r+49gaElj8OjFDRvDbv4ZvXk2iApkbQ0+bdRErcJJ8ae0A6nhImRN4QyKwalB9tnl6ktLJOlT80AtLIw0Y56a1k6/cTFzrRI7wlv2yVj2/GK4EIvWj7FrE8bbNuZwYtpnS+3W1ERKJ2qgWJvBEeXWKXR7ZaBsEN93aY/HLSjDo+CO98WfSIIgKI3ZobxiDiFyV1g4GLidkVakwMOQnxFo000Hdn47rxeUfiMzpjSum/chxP69lgrHocN9i7w4eFTvfA4wpZwX9xNJsBysarm/KM3v8M0wF7HPrzMUknUKsRN9fNWt4f4/QD5hpzrMokZAmCsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0fb/epkhQLNol3/1+JWHMhdxFYTyBfYQe1f8CMd8Go=;
 b=mpBXTJth2xeiOD/UZEnno2doG0OrclW1zwmJA+Y4GyZU5JP9nr+HXo9P2KXisGqVwmXFKIdFodsP1C1GT3VHdYNwYVD1+y6r0za8YQCFCiU1IhkGa1+mPEesKTk1U13zRfXmTL1eJZNGWdcz/OHlyAQrTWI4qZYGYC/tjQkyYPov1QpoxYvL4+Owx8ZxLnUTBQNJ4kxgUrP88SJpM/XlwxrFW7z4dy9EyCoYorzG7RoF5KgYbzRCRktwOQ0vygyoALtzJpO9nyzuTaeWzzxmz8ep5EdDQQBQsiSpLAYcu4Vudp/v/F2EJ4kn5VnE6Q6rIAOp/KcdIpWYkKgryMMUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0fb/epkhQLNol3/1+JWHMhdxFYTyBfYQe1f8CMd8Go=;
 b=Ej92AO4Z5OntkMDv1W5YEcmRKfi3aFm3kJt9rwWl8NcyALQPuf2ISs6rD3HV4WlhRGMDN+rHr4BgZ73Yvlcosqspl5/IQOMWcU5eKPg9eyjBudBMm+DnxbUmZUNTo9QhUUeFY6XSQLUH7zyX4vjUALEgJyLA0rXL/8BzDSIRMGU=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (20.177.124.11) by
 BYAPR12MB3317.namprd12.prod.outlook.com (20.178.53.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.8; Thu, 9 Jan 2020 19:31:21 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::6cae:8d93:540f:1593]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::6cae:8d93:540f:1593%3]) with mapi id 15.20.2602.017; Thu, 9 Jan 2020
 19:31:20 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
Thread-Topic: [PATCH v2 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
Thread-Index: AQHVthIi5FzKfHSr6kmt6ZLkEF2SMKfiVFmAgACGPwA=
Date:   Thu, 9 Jan 2020 19:31:20 +0000
Message-ID: <812db213-b30b-1f51-649d-62de723dcac4@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com>
 <87r208sw7o.fsf@kernel.org>
In-Reply-To: <87r208sw7o.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e796308a-3770-4776-f555-08d7953a8181
x-ms-traffictypediagnostic: BYAPR12MB3317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3317CD910BDE5401C09A8989AA390@BYAPR12MB3317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(39850400004)(366004)(346002)(189003)(199004)(186003)(26005)(2616005)(4744005)(71200400001)(6506007)(5660300002)(2906002)(8676002)(81166006)(6486002)(31686004)(8936002)(81156014)(110136005)(6512007)(31696002)(478600001)(966005)(64756008)(66946007)(66556008)(316002)(66476007)(76116006)(66446008)(107886003)(36756003)(86362001)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3317;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wIaxEq4nxXahnrbptCckJkRNHY2jxhzR3fOnTN6Iht4Q89GmxcQer7ZYFqFewi8YvmFt2N7gMVwmbOCYyMdKoe2P9QKF+tief+UReokW2pKszhGc4FiwGDUSQdHt9sJasxnPQDKjaZ6RVrMdfy9NDoDhlosnv6ufwwUTGutU44cBRhYG/tELOtUOL0wQPurcx9kQ1vTDuO7tnMgWHGq5WgfeGPunXbpMyu/vy+qYA1cOZybmL2ZlJMVjdsdeMR4ORFIcBX4kg41q7s0urCA2zFniGclEZD7BujtCfPvKnVKWpfBNZQVx+E/LffggbzX1OP4mkzEXL/VxThPgWfQ8lVmWW28U9m1M6Zuq/3wokV4H49BvczSuChmY6701V6LmMph13su96VBio6F6hTY5PeFL/M0n+qObR2xtS1hX95GFtAue0GzEMM5aerAn61cbjDBwSuGNmGmazjexAnfsUb+HloSjeq73U1itE05oP+wOy38TClxV+3s5dOlstyTZlAIcwGT/2je1pvnOrf1soA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7882DFC76A0295419ACA8F1F4EBD9434@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e796308a-3770-4776-f555-08d7953a8181
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 19:31:20.7915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4TpAExFVh1OJhCJI2jWYBmnOsu7RdvLU3AmMnI/vDnqyOarE6Cr7dRQc8s25V7LMmdboUBbjRG/ViZae6k/IPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3317
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGltcHJvdmVzIHRoZSBoYW5kbGluZyBvZiB0aGUgRU5EX1RSQU5TRkVSIGNvbW1hbmQ6DQo+
Pg0KPj4gMSkgRG9uJ3QgaXNzdWUgbXVsdGlwbGUgRU5EX1RSQU5TRkVSIGNvbW1hbmRzIHdoaWxl
IHRoZSBwcmV2aW91cyBoYXNuJ3QNCj4+ICAgICBjb21wbGV0ZWQNCj4+IDIpIERvbid0IGlzc3Vl
IFNUQVJUX1RSQU5TRkVSIGNvbW1hbmQgd2hpbGUgRU5EX1RSQU5TRkVSIGhhc24ndCBjb21wbGV0
ZWQNCj4+IDMpIFJlbW92ZSBhcmJpdHJhcnkgMTAwdXMgZGVsYXkNCj4+DQo+PiBDaGFuZ2VzIGlu
IHYyOg0KPj4gICAtIFJlbW92ZSB1bnVzZWQgdmFyaWFibGUNCj4gVHJpZWQgYXBwbHlpbmcgdGhl
c2UsIGJ1dCBpdCBmYWlsZWQgb24gcGF0Y2ggMS4NCj4NCg0KWW91ciBuZXh0IGJyYW5jaCBkb2Vz
bid0IGhhdmUgdGhlc2UgcHJlcmVxdWlzaXRlIHBhdGNoZXMgZnJvbSBtYWlubGluZToNCmQzYWJk
YTVhOThhMSAoInVzYjogZHdjMzogZ2FkZ2V0OiBDbGVhciBzdGFydGVkIGZsYWcgZm9yIG5vbi1J
T0MiKQ0KMmQ3Yjc4ZjU5ZTAyICgidXNiOiBkd2MzOiBlcDA6IENsZWFyIHN0YXJ0ZWQgZmxhZyBv
biBjb21wbGV0aW9uIikNCg0KV2lsbCB5b3UgcmViYXNlIG9uIHY1LjUgcmMteD8gTGV0IG1lIGtu
b3cgaG93IHdlIGNhbiBwcm9jZWVkIHRvIHJlc29sdmUgDQp0aGUgY29uZmxpY3QuDQoNCkFsc28s
IGhhdmUgeW91IGEgY2hhbmNlIHRvIHRha2UgYSBsb29rIGF0IHRoZXNlIHBhdGNoZXM6DQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtdXNiL2xpc3QvP3Nlcmllcz0y
MTQ2NjkNCiogdXNiOiBkd2MzOiBnYWRnZXQ6IFByb3Blcmx5IHNldCBtYXhwYWNrZXQgbGltaXQN
CiogdXNiOiBkd2MzOiBGaXggR1RYRklGT1NJWi5UWEZERVAgbWFjcm8gbmFtZQ0KDQoNClRoYW5r
cyENClRoaW5oDQo=
