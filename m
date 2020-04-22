Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9EF1B467E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 15:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgDVNpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 09:45:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58440 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726579AbgDVNph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 09:45:37 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0D69C008F;
        Wed, 22 Apr 2020 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587563136; bh=P18ZsgnRgMCDUTUy9NI41e8fYbfw7rlsC76yfGG2rB8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EyaZHs6fq2vjSObpIqSIGJ2XuoUKmaYxZ6offDTjg6EkOv98xq8jZ6hxn/Q1jJ1kZ
         zEu93CrRdpwDOYot3909jQHIGcZNYs+hLlvbe0ESiTkmYuPjoWGK4iJvPS6W5axYFZ
         n7tGWGdZWhFfUBSE/Uj4rVdPZcgQF8tO9nTsrD1BokRyw8O/Hqn3SLjNRthZTQeS4V
         avWH8XiaJvTSxmOjHbDE4MwFXha9j0Y5+ARvKu0w8ODMNCEklPPXMMdjaDXH+DAgbv
         5ajY3UBEcjRSpEJxWZ5JRvSNhYQoVqrHe5VsYfWWxVWKSF/RSfY0QSatUnTQLZL953
         XU9GMgTRaeQ5g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 00CD9A008D;
        Wed, 22 Apr 2020 13:45:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 22 Apr 2020 06:45:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 22 Apr 2020 06:45:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEl8HlCafmtRuKP5tB5Uzx8irWwc6P8FS1ihQFJzNh9Dd2ToAq9UlL+S784d/THhcxj3VV/pijm9c4s9vtTWz0Pvp3DeTfN0RHpu9rkqXssETldT+bCXwMLhep38C7b3mqVK0YMDSlalUWH4BRx7ipsDbmabbqBH3E1kcn9VEbZZaggXbdasAKCsg59WVDuYmD5vzM/7NDAdaFLPSYNPeyUptxAHk1To1aIyS1YdpyLOyCHpElYY3ebA/M2eo/4JUGs/iBn5Hkr166cq2LHnwaP4FJcz/QK7d2q4EBjdyWc1RlTHk3WlE8NxHM2KKKJSgUbT4c47RdSFUX8W3bEICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P18ZsgnRgMCDUTUy9NI41e8fYbfw7rlsC76yfGG2rB8=;
 b=BHgvyA6ZbSw9eRqATzrFavYSRbbDAluFZuBZrn0Hia321rtKUBgty63VtVXZz8rbl80tvsUpcRfcZPlHKz00bAo/CY3lpfZ9mPYFQOXQdam7MtJUs3dFd8+c6PPQUMtisFF1Qqr90wfkdhYYryJDOMAT8y4UEPBJ/8Px9DiA/clvyndTmNouwEF6WR+icIulVSvp9345hfSjcgj1FxgNykFuQ/g514eQ2ybVcIyAL2/aMZF4DR9xKLCT+WGMeTA6gYmhGiLVDzftFIndBQ3B8Bk/hxaTQ9fArag2f3119024S3x4QmSBbIPQCklqMQ34axR5s1WvBuozUuPXtyxO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P18ZsgnRgMCDUTUy9NI41e8fYbfw7rlsC76yfGG2rB8=;
 b=NWJDgQXFFC5p91EtBB69fBx9lsvvU6aEIdB6NgyU3moEk2qaVuN8AgPkcuCa5a3fdD3nex5Jdlu0JxyBBqI9u+lvDTM90uwazYFtbKb7StwbAyXptAlLru0wuIGQsoln1cxvYODe2ruO8aUNMWyMzwOshHRyIQ+9b1lQltFvEK0=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2462.namprd12.prod.outlook.com (2603:10b6:802:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 13:45:19 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 13:45:19 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gIABN86AgABAc4CAAA8qAIABNeYAgATroYCAAz+MAA==
Date:   Wed, 22 Apr 2020 13:45:19 +0000
Message-ID: <8de7047f-4d49-349b-983a-31c4ab66562f@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
 <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
In-Reply-To: <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [37.252.80.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1bac6ef-fbaf-4164-bf4f-08d7e6c3658b
x-ms-traffictypediagnostic: SN1PR12MB2462:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2462982EF28222ADA1DD05B5A7D20@SN1PR12MB2462.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(39860400002)(376002)(136003)(366004)(396003)(91956017)(4326008)(64756008)(66946007)(66476007)(66556008)(6512007)(71200400001)(316002)(5660300002)(86362001)(54906003)(66446008)(2616005)(186003)(110136005)(26005)(31696002)(6506007)(36756003)(478600001)(31686004)(53546011)(6486002)(8936002)(2906002)(81156014)(76116006)(8676002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QuFc5HHlJaGfcypXkp8jsLaqiNrH4SFwmFpUrSdfT2UhW9aQXv9f18R5TRsoDl03VXwUDGH+vxhMYEVdjNulm/GYAUw5hyx9GLjBGvwPPtB4c/yQrXVXwFV9jLYcfxwkrDaH46+5ywDMtGI/ZRT8G8wDpDvzLLYlyx2gZ5+yXzXtysBRaOyEgGqghRFMx62Q6ovQ2GHiXK8H3ndkH/ptFZn/7aySIPeqv0ltS19Sp4BdNOrq7jeVkM6IfJMssFVk5dh8Y2Ugg7QFWgfVhIG5P4o02Rvgm1LuLArHg13GrCW5ltYVzknIIk8Zzg0gGFOlPJQAUXyAsPq1zHUNXoeZuV8Nkvi1lWZxTwbOX1zmtNcIz4/tXQnNByu4thxNnrd2F0VzWDkg6q7QwwxEYfnHWIa9DwZKna8bQX+VjCnL+2enIMerrigtdLOui+EV+/2d
x-ms-exchange-antispam-messagedata: ny0+69P6K5vRisK8butXBVyRnBLjUrJOoqLJdSldJ4Tj7qet7Hhl5d7Nhzm18wj8xx/VRdnIdkN6jtJ3Ka2r1DEZBJxyfFeK1rvqYIWHAc6rGJAL/WIjOSQR6E0YqAJEdKo9irYFhkvCaNhM8IMfUA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <42D055933F065E4DA1C84DCCB749F036@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bac6ef-fbaf-4164-bf4f-08d7e6c3658b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 13:45:19.0854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1z58x9pY1WdSQJQubxH+9wnFnFgfHrR42BvQ4COLGM5wIF5sBpR93P6TVQb/LldeC1NklSg4X0vNYwW7takBog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2462
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMjAvMjAyMCA0OjA5IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
Ny8yMCAxMTowMCBBTSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+PiBIaSwNCj4gDQo+IEhp
LA0KPiANCj4+IE9uIDQvMTYvMjAyMCA2OjMxIFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4+PiBP
biA0LzE2LzIwIDM6MzcgUE0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4NCkxvb2tzIGxp
a2UgSSBmb3VuZCBjYXVzZSBvZiBpc3N1ZS4gQWNjb3JkaW5nIHRvIHlvdXIgbG9ncyBHSU5UTVNL
IHNldCANCmhvc3QgbWFza3MsIGF0IGxlYXN0IFVTQiBSZXNldCBub3QgdW5tYXNrZWQgd2hpY2gg
cmVxdWlyZWQgZm9yIGRldmljZSBtb2RlLg0KV2h5IGl0IGhhcHBlbi4gRHVyaW5nIGR3YzIgZHJp
dmVyIHByb2JlIGZpcnN0IGluaXRpYWxpemVkIGRldmljZSBwYXJ0IA0KdGhlbiBob3N0IHBhcnQu
IEJlY2F1c2Ugb2YgeW91ciBnX3plcm8gaXMgYnVpbHRpbiBpbiBLZXJuZWwgaXQgDQppbW1lZGlh
dGVseSBib3VuZCB0byBkd2MyLCBhcyByZXN1bHQgY2FsbGVkIG1haW4gZGV2aWNlIGluaXRpYWxp
emF0aW9uIA0KZHdjMl9oc290Z19jb3JlX2luaXRfZGlzY29ubmVjdGVkKCkgd2hpY2ggYXQgbGVh
c3Qgc2V0IEdJTlRNU0sgZm9yIA0KZGV2aWNlIG1vZGUuIEFmdGVyIGdhZGdldCBzaWRlIGluaXRp
YWxpemF0aW9uIGRvbmUsIGR3YzIgZ28gdG8gaG9zdCANCmluaXRpYWxpemF0aW9uIGhjZF9pbml0
KCkgYW5kIHJlc2V0IEdJTlRNU0sgdG8gaG9zdCBtYXNrcy4gSW4gdGhpcyBjYXNlIA0KY29ubmVj
dGluZyBjYWJsZSB0byBob3N0IHdpbGwgaWdub3JlIFVTQlJlc2V0IGFuZCBzdGFja2VkLiBZb3Vy
IGluaXRpYWwgDQpwYXRjaCBpbmNsdWRpbmcgY2FsbCB0byBmdW5jdGlvbiBkd2MyX2hzb3RnX2Nv
cmVfaW5pdF9kaXNjb25uZWN0ZWQoKSwgDQp3aGljaCBhbGxvdyB0byByZXN0b3JlIGRldmljZSBt
b2RlIG1hc2tzIGFuZCBvbiBjYWJsZSBjb25uZWN0IHN0YXJ0IA0Kd29ya2luZyBhcyBkZXZpY2Uu
DQpGaXJzdCB0byBjaGVjayBteSBhc3N1bXB0aW9uLCBwbGVhc2UgYnVpbGQgZ196ZXJvIGFzIG1v
ZHVsZSBhbmQgbW9kcHJvYmUgDQppdCBhZnRlciBkd2MyIG1vZHByb2JlIHdpbGwgYmUgZG9uZS4g
SWYgdGhlIHRlc3RzIHdpbGwgcGFzcyB0aGVuIHdpbGwgDQp0aGluayBob3cgcmVzb2x2ZSBpc3N1
ZSB3aXRoIGJ1aWx0aW4gZnVuY3Rpb25zLg0KDQpUaGFua3MsDQpNaW5hcw0KDQo=
