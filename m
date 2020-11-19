Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2942B896E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 02:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgKSBTk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 20:19:40 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59662 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726457AbgKSBTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Nov 2020 20:19:39 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 897C840104;
        Thu, 19 Nov 2020 01:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1605748778; bh=0z9JYk2YqB1x2cKPa3AnR5B3kq1HAHsB3N4aMmld2PU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HZnZgq5XndSzdBBEhZa9QooSTxfLeT+Dw1Tbo0a7GqguvP9jaoMYB5LY8pFajTIGo
         Ik/fZ7C554K6XOBVFu2EHEbKtSnA5U1kPpV2phB0ZddLpRwzpb7CWNt+uOA+w5XJNq
         z81qRtHrIU5OBa6kCu2n4hiY2ba4BZZnNv5J2UMDdsuzw537maMmAJPRn1JNZPi07J
         REdl56yFvsMyitSo/BypWTK5HsPEnk4IeDkSKpZYGm32yZW2vNNgVDXAo43afbP9Hk
         onyGBhBNOuBXlwfaIHF9RAPoXb3oYPwJrU/Yj6LPX3Pa7pWqts0vJfNk0yfDe61my/
         g9qq2cWxIBqJg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 340F8A006F;
        Thu, 19 Nov 2020 01:19:38 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E8DD3400DA;
        Thu, 19 Nov 2020 01:19:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="d1sBSzii";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klEjq+olMe4X6FxGbKXR0Sq9Sr0v6aiEUbyOVC9IVy1y+cPe4UxTwTVokf7Hteo8AEFr0re28rwjXBV74tKgbXo0o2vSPVqo/iMhLxcfcqCEMlYcrud+QR2sGj/kNZ9bZgWwh33Xz2eLts/AzxDJ8a1bNaHAJS9oE80DZPlFa34NEwHoOiGt2fwYZZTa6UtfIBAWJ7YV0+P1ln9ScDgw+J3VVCz+wdFZ3aVmDZNtwNjIkD2MAUjz3QD3y75h9h41KbNXRjjMYE6knn/ImgupI9YwLO4HP7iHkzr2Irf7g/uGHSD+Uik4S7QHgnW2m2JM2ihG/9/o54asP/RmezkiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z9JYk2YqB1x2cKPa3AnR5B3kq1HAHsB3N4aMmld2PU=;
 b=Hm+jR2oDA8sswH8H/3CoGvxQteH2pAe9aUUKt4l3WdoNnovKYPTuBKxJKQiLwalLthGbvWMhZOHC01N/G7CJLZKVAsdErd+5ZeB5epXC1mtHYgkXCyHecqp5Fr9PgtkXT/Nwdh6TnSeK3l8UycxwLaI8WvBp3TLCmgzbZtQo1jYfuUpfZOTBkDohdX1AWy9UvSfDArWO8QqO0S1IGZQeDuXHX3iXh9jRVXIjH8dk2wYpm9PoxlGSW/aDgdacOCMOvCa3aRo5XpXUy1AdjVsUqwSfm9sMoU3xB8V7/5Q6FVuJlyzRMBeNbixHCFTL8rKOd/BLZvSfGUZvVCqof2xZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z9JYk2YqB1x2cKPa3AnR5B3kq1HAHsB3N4aMmld2PU=;
 b=d1sBSziidTkQn2LkzO39+ZV0RbxJbl5bUIF+WNmxPm3uRglYaN1JJEfdF82xCgIRYIqcHW/2doCQ015EU26CoXEAK1fX8J2Wq8hO+nHQHIA9cHfI/mfuTupy33SVt9N/2RiqwsP0I4VnFsK45xXKVul9RjzdUatvpfU3MSUelDg=
Received: from BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 by BYAPR12MB3144.namprd12.prod.outlook.com (2603:10b6:a03:d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 01:19:36 +0000
Received: from BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::58b2:3e92:2e08:9edf]) by BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::58b2:3e92:2e08:9edf%8]) with mapi id 15.20.3499.032; Thu, 19 Nov 2020
 01:19:36 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8AgAFTDQCAAAqzAIAOMfkAgAiKJwCACNLogIABXfgAgAC7XIA=
Date:   Thu, 19 Nov 2020 01:19:36 +0000
Message-ID: <1eb38403-e92d-cda9-d39c-d0788c396e55@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
 <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
 <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
 <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
 <9e03c829-4ead-b35f-da28-6cd4906ac2cb@synopsys.com>
 <ee43cef6-7899-fbf8-6f9b-c12269b320a6@synopsys.com>
 <bee80593-4e7a-d754-7e44-57c690add934@synopsys.com>
 <1a722f8c-975b-be9e-ab5f-522a3f317d3e@linux.intel.com>
In-Reply-To: <1a722f8c-975b-be9e-ab5f-522a3f317d3e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [49.207.204.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3d73c61-c817-4ab0-fee8-08d88c292e20
x-ms-traffictypediagnostic: BYAPR12MB3144:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3144C81F617AE4B45E0BB9EFA4E00@BYAPR12MB3144.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEt+XikQr9ykeYHVyEyLbU/M8n2jgsYrBXXfm5sNPZLCOfR36JwWVMEXiL5i3j6e1RelFSofGa/DT8eknZwSzPvCh9mTsMDugU2HiEr+iSR9TGuOpH/e1cb4K8oGfQEYJPi2hsu5qaqguje5sKcwmcg7x9qIq2+mMm3niIjkwvWpHfnsD7JtfFx1+0DwppjwKKJlLFM154OxVtI6lqA4/FLNpHnkAN8C1BDpHgWyIgZ0DM2IAIwE1LDjACKPPTb8Rxh+W9+4dp544oBbpdZZYLJbbZZ5w5lH1e8EX70/IYu/jM1DliKxO7psIYwiEj1fy0jP2X1J02qqLLiG6zy9Cg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4887.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(6506007)(31686004)(316002)(8936002)(8676002)(4744005)(2906002)(86362001)(110136005)(6512007)(54906003)(2616005)(36756003)(66556008)(478600001)(53546011)(66946007)(66446008)(26005)(76116006)(91956017)(4326008)(66476007)(64756008)(6486002)(31696002)(55236004)(5660300002)(71200400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: SH6ia8pesFzn55aq4uMd7beuFa8MfrvNvaMiMwEUu8wJRmEYIm+pm5ugsIaw74Fwi+Sp3G0KAy4Hp5LotZ2vnd2opN1C9BWmbHwqweelYoZUsX7+urnJf3qZ2lRlWHy8jxZiOm0hve7PvPzV9C9NZ0VH9cnPgdwhjb1xugxS7/5G5Wi13lKEbLRYvEKgOkPM213PHIx7NAHR0mIgo2GNPrkeW+AOeISTbQ2RoCLtcOqcKvBPAg38OgaIqjH/6uMMnTeQfHUEy5BjMM295UC//965JWHRENerlL6/r8Jj6R0MxgWjNUXIr0xFc+/4aH6BNYI8lvQSP4OcCAyzvrPItCIUhVPx7Em4sDoIsgFqmcYPJ6V3mjW/ziWbj2PJJLqVP7gPHmeAxJIuqrsZlF8au1PmBiP1mUBROJ25j3MxWZ6puYtCpJFCqeULhbe9Zxf6rSDI7FJiXcuaAqtpwramRC0pqrlpWWJtoAKvTnfoLuc3Ly3NPI/UvBVJ3eyEVw/Xy2n68OVSso4iltu0tFMOZjBGYL5Oicc/KyKslDewSel2tvDvLdbb70N+5iGLNtvm89n3Twm1FX7RJDZxcYOdKAZ7S4/oDuqdP2S3RGrH5SpflCVNVsSKUb4Imf7lVWtNrlBOJAmO1JUr4+0r7IF6DA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <09068D0C910D564793E0E8E96F78AAAD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4887.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d73c61-c817-4ab0-fee8-08d88c292e20
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 01:19:36.7232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3a1COa2EHee69nBUQYy6KsqpWNwOxB0dfPuOi4YrGp01CIQJ8TuLnt8LWcGEeRfxyp9mWYgaQlkPOpeONOaP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3144
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTEvMTgvMjAyMCA3OjM5IFBNLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPj4gQE1hdGhpYXM6
IENhbiB5b3UgcGxlYXNlIHRha2UgdXAgMiBwYXRjaGVzIGFuZCBtYXkgYmUgRmVsaXBlIGNhbiB0
YWtlIHVwIHRoZSBkd2MzID8NCj4+DQo+PiBJdCB3b3VsZCBoZWxwIGlmIHRoaXMgcGF0Y2ggc2Vy
aWVzIGdvZXMgaW4gdXBjb21pbmcgcmMuDQo+Pg0KPiBTdXJlLCBhZGRlZCB0d28gZmlyc3QgcGF0
Y2hlcyB0byBteSBmb3ItdXNiLW5leHQgYnJhbmNoLg0KPiBMZXQgdGhlbSBzaXQgdGhlcmUgZm9y
IGEgd2hpbGUgdG8gZ2V0IHRoZW0gdGhyb3VnaCBzb21lIHRlc3RpbmcgbG9vcHMNCj4NCj4gLU1h
dGhpYXMNCj4NClN1cmUsIHRoYW5rcyBNYXRoaWFzDQoNCg==
