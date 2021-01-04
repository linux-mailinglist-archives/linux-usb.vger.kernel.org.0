Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D472E929C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 10:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbhADJdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 04:33:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51586 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbhADJdS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 04:33:18 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB987406AF;
        Mon,  4 Jan 2021 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1609752737; bh=m/CsTN8NTjCbpeCzCvj/tkJk1CFGqe998J96UoD6N9E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Mr4T2kVSO5Cc2hENyXWz6qyj3lDpH+uSsDdAirhDsDLXWOnrxXl91iwhWP2inJijv
         nRh3kefvwasKVRmwFdQq1aT5Q5UVroQXwlXc3akqM9jv5eLNUUOx5VNCyqS9kvVy+l
         DkwdfbZeF7JEO+LgO1G7bklN6QkOUkKZt0/tfuwk1a692YdUhCCrRFsIlilZijk4rY
         63yWepTeGV7TkG56y2khI+gmP2yT+VMzDIoehyHKWHZu/afzq9cGu+APdl9fq1EgnU
         PnCMdA4cSf3onau/KBvUgrqjW0O4KDROXE/wfOTN2XuJo4DqJ/Pu/M5rLgoOBTttp6
         m1pklyWDDN6jA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E3536A0069;
        Mon,  4 Jan 2021 09:32:16 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CF5E0813A2;
        Mon,  4 Jan 2021 09:32:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VqEfEjlP";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELW80hPmMXc3dVm5JkRNGTfWGAuAwuE9NyAkbom2HajD9TFGImdwYg2dPe4CDCRXuofYNNzLqlffIitLyeMEhf0rIJDeJRNI8PsXljJ7FLvOZL4ueQhnh9eLnjRTzdZJjpOEDQn8sbduT6LYMKLg7wvZqSV4x1SFKkU2FY+PorqmYn4w003d9pa916mmMgSW0QuO0urdLSzTyykIOrmlR9XdFlpKG0pXkne/S1taonmNk0UTwBFyl0pUdW4m0Hm4RrO/Z1HIL51HiSIPPB1Kt16pa5zgpLSze+8nQdw4lmB1pM1m747WRUOTH3Ad6LtTfgNQ9lSoSmR+wgjhwiZpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/CsTN8NTjCbpeCzCvj/tkJk1CFGqe998J96UoD6N9E=;
 b=edsHJBS4s5ZzUxRoG6QxSvHB5SusWja1GYog/Icbz5Lwf7IOsjMGWOsAsIG7nC0CNDKZoWy88YR/wOWBDAjriGCwXH85peg7Rv4yZ+JSIII4Lbg+rPkHIavqRu1JcEDNmNEf5UqLCvbSqPTb9/Qi/Swkfp1XYkcQ++0TcdUvkrIQfLTW406HcufGdF5jcQaCquSf94zR4E2y7UJK7cnmGBwqnYKWjwjUkLnAkGoVhfyuxw7eHDp412Dbwd7jdzbyGYs2ZA+gG+MIxUvfINrlPxbqWg22cJranYD2xAd/EwQ3sRUbo8DnkUG/10qLLnSw439mrro+uDiLLXapKUCO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/CsTN8NTjCbpeCzCvj/tkJk1CFGqe998J96UoD6N9E=;
 b=VqEfEjlPxVH9v4nxzQUKWQ7L7eS+OlrbWWwOdyfS9NDGMC9rOqbn9N9yGpRieQrgNkdAOAUpjsRHwVEv4RjOTdi6n+DRGs65vqny7KxbiNOwH7CuleYAYurrNdxXZIVd3MIvCyr1pVtXe1Et0Ce3ChaL8t1wzWRttHNarS9ZWfo=
Received: from BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 by BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 09:32:13 +0000
Received: from BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d]) by BY5PR12MB4887.namprd12.prod.outlook.com
 ([fe80::874:a242:5ddd:693d%8]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 09:32:13 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Topic: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Thread-Index: AQHW4nMihtq4xUkYtkKMo4ANJ0ntZqoXNA8A
Date:   Mon, 4 Jan 2021 09:32:13 +0000
Message-ID: <090742a1-a9a1-b89a-e078-a960b5ca3064@synopsys.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
 <X/LQ5ZWLUCGzC8vz@kroah.com>
In-Reply-To: <X/LQ5ZWLUCGzC8vz@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [49.207.212.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee3ecd77-2c81-4345-e243-08d8b0939e57
x-ms-traffictypediagnostic: BYAPR12MB2727:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2727E0A0AD4A6D87F096BF79A4D20@BYAPR12MB2727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: //AoQ6oJ3CFyFhIgGK0HvRkdxf7RuzGuVuVQQGb8qp/PjBOxBIr9teHZq+HJHoNls91nV9Il1EQE2bK5WlXQ2N18x8f0z9yKLa+v55sRSQxtSWEkQlbhz22MXx9bsoHmLEPkWYlpQvvDtCD+IZL/6F2BNzuAI5kEQPvGGPKvA4+nkZg2bjiiC9bBtY0ouxGzE/4EhvfpGIQu4Rxs3Zkd8dOmiMdGFXHOssxlctYW6DCh4N1MrE1yYfFtywfV4XQA1QR/2+jLbhC5PsdWfuZjcQcsBNnKkUwq29o9JmFYskEL9Be/zoNyUTTKmWYiSvi105ywkUVDxmjuGcEJ5yqzrjUIGuBQ3qF/TkijM/OUMCMHEZS9nIU6ndpaqLdhpEwRHZZr3Z5qpyChXLAPOzucd3yiYK8puvK+Jgw4Oi4v9NUYi4XEWNNhrbo3S9TQCqKi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4887.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(39850400004)(366004)(346002)(36756003)(4326008)(110136005)(71200400001)(6486002)(2616005)(54906003)(478600001)(2906002)(316002)(8936002)(107886003)(8676002)(186003)(31686004)(64756008)(66946007)(6506007)(66476007)(86362001)(66556008)(91956017)(76116006)(55236004)(5660300002)(6512007)(26005)(53546011)(66446008)(31696002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: P71Obc7sJWcN4kP1HIz6BfMzVybEI4VoMQpSv87/qsHI5B1oQdZlGmuAVRdGD82FFvpY5KaCLDaQJ0R86Sm9fPAfvTTEKhHJ68yq/4mrGOkXJfYQ0i+ZExzbiAfAoOKxmQ1hH+gMu5sJIV7PtiR4i5ShQAwJtcimDSY6WlEF74jiDDow9kcnKQ2TZONDgD1Av0J7QzRQ571JqPhKiX/rhVoCq7Ds2mSlTsVlWAGuQpvagfdoMQnQ8DiJPe0OY9LwIBAgJdykXUI+mFIFw5tZ6RMxb0GIFEtMG+OyHwWhIMVJaGgNoVGuco6uBM0TuL2l3swMMEv8g27keu9LbV/jnlDZAdaiW3vp6TyQX7ra5eyQOlpncXipg5EIUbvSAXeRuKVVUw+lbql2PC5a+K+n4xTQbAODN8t3zUk6Ncppi7p8qwiv9EeC0NeRJPiGC0YtOZb3Q2441uZukW44i+Phl/syr7kNcw/mfCgEl3pM/+h2y/FzzqvpgsWO4NhMkQiBGyiSH5HxjViXupqBU0xXeHDqZ22dY0AVEcrR5qb0WzXQb2UUpHwc932ny9mTPN3+Z5FpQUMffYNjxHclp2vkX0X2jqNMMwPnW5splrxkIx28cPMehjPoPK/HderAXNfXA5gNmhpy6tzBh4L+z7x5J0aJfbbO2pnbqrPXK1YrHAc/FXHDDGExvCaBsPSR3hu6L8z/HJDgv8ET2nixS9n0PHT1i6x3lMskrNIbi693SBk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B2AAECB3BD6284DA31DC6BA6C3B7466@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4887.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3ecd77-2c81-4345-e243-08d8b0939e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 09:32:13.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wx7izJbENVkDEu2p3Fdnoe6eqiOf6Z0VAG7sXWLHNb/7h7vSiAq/azyqWay+eSByntCdTIcUkx/fSuCfsbVJrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2727
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCk9uIDEvNC8yMDIxIDE6NTUgUE0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToN
Cj4gT24gTW9uLCBKYW4gMDQsIDIwMjEgYXQgMDE6Mzg6NDNQTSArMDUzMCwgVGVqYXMgSm9nbGVr
YXIgd3JvdGU6DQo+PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBwbGF0Zm9ybSBkZXZpY2UgZGF0YSB0
byBzZXR1cA0KPj4gdGhlIFhIQ0lfU0dfVFJCX0NBQ0hFX1NJWkVfUVVJUksgcXVpcmsuIERXQzMg
aG9zdHMNCj4+IHdoaWNoIGFyZSBQQ0kgZGV2aWNlcyBkb2VzIG5vdCB1c2UgT0YgdG8gY3JlYXRl
IHBsYXRmb3JtIGRldmljZQ0KPj4gYnV0IGNyZWF0ZSB4aGNpLXBsYXQgcGxhdGZvcm0gZGV2aWNl
IGF0IHJ1bnRpbWUuIFNvDQo+PiB0aGlzIHBhdGNoIGFsbG93cyBwYXJlbnQgZGV2aWNlIHRvIHN1
cHBseSB0aGUgcXVpcmsNCj4+IHRocm91Z2ggcGxhdGZvcm0gZGF0YS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBUZWphcyBKb2dsZWthciA8am9nbGVrYXJAc3lub3BzeXMuY29tPg0KPj4gLS0tDQo+
PiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgfCAxMCArKysrKysrKysrDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gV2hhdCBjaGFuZ2VkIGZyb20gcHJldmlvdXMgdmVy
c2lvbnM/DQoNClJlc2VudCB0aGUgcGF0Y2ggYXMgaXQgd2FzIG1pc3NlZCBmb3IgcmV2aWV3IGJ5
IEZlbGlwZSBhbmQgSSBzYXcgeW91ciBtYWlsDQoNCnRvIHJlc2VuZCB0aGUgcGF0Y2ggaWYgbm90
IHJldmlld2VkLiBPdGhlciB0d28gcGF0Y2hlcyBmcm9tIHNlcmllcyBhcmUNCg0KcGlja2VkIHVw
IGJ5IE1hdGhpYXMsIHRoaXMgb25lIGlzIHJlbWFpbmluZyBmb3IgcmV2aWV3Lg0KDQo+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hv
c3QuYw0KPj4gaW5kZXggZTE5NTE3NjU4MGRlLi4wNDM0YmM4Y2VjMTIgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0
LmMNCj4+IEBAIC0xMSw2ICsxMSwxMSBAQA0KPj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4NCj4+ICANCj4+ICAjaW5jbHVkZSAiY29yZS5oIg0KPj4gKyNpbmNsdWRlICIuLi9o
b3N0L3hoY2ktcGxhdC5oIg0KPiBUaGF0IGZlZWxzIHJlYWxseSB3cm9uZy4gIEFyZSB5b3Ugc3Vy
ZSBhYm91dCB0aGF0Pw0KVG8gdXNlIHRoZSBzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYgdGhpcyB3YXMg
aW5jbHVkZWQsIGNhbiB5b3Ugc3VnZ2VzdCBhbHRlcm5hdGl2ZT8NCj4NCj4gdGhhbmtzLA0KPg0K
PiBncmVnIGstaA0KDQpUaGFua3MgJiBSZWdhcmRzLA0KDQrCoFRlamFzIEpvZ2xla2FyDQoNCg==
