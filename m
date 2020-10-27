Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B35129A993
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 11:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898085AbgJ0K0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 06:26:19 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51142 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2898082AbgJ0K0R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 06:26:17 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 992B74017D;
        Tue, 27 Oct 2020 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603794376; bh=K3u4n5IgOXUinHGIKZLMW1qD4kgXhhM1Fjrw6HISXbk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EgTxNuLJiIh0NnOXA3OUXE77HLwbHz807/KPeDZyYsmcIjZMWE308Ss/HsVrha44K
         uz6wDWd7/vkgIwe/4rRlte6QS+iI1f/MEZH9nvMdgt8kNRbBMJ9B1kDeVldL6rSMrL
         qF3BJqjPT+vzFPRKdPf+EWJsSlEGlzq6TkI8/1BjA2u14XTsQzEWs7NW98ijg8lQl9
         1HA0bDh0rd2kw9e19TKvTz5a7SAwRzxpGDbk6lHrV3qourjcvRad4Ez4fVopzsT8oE
         RIoCNM9UQz3q8Y0E2M1TOZcMBj+yTuQ1SIwiWnlohV9RWQS+cAP2hUzZAFRQBnbaQV
         YQF1dm84+IK5w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1B00CA008F;
        Tue, 27 Oct 2020 10:26:16 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id AE8C5400A0;
        Tue, 27 Oct 2020 10:26:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="g2TYcuh8";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbee0FkO29WaU9uqSzHtVFxpyhjn0jBmQGCcyumWtDcB+bilG7mUQ3LXq+h1m302m9WcblzrvxLsrLTjLxdyppQzoIQOZ0uC6tOAwmCADKv4gWi7ajj44/3dyHV+Lduj7aBQ2hGbch4MEbKUYuhLgcX1cVzt59N0geSSaWUa0CPuj6LsQrtknetlhiDq9eS2o+hO/5o0Gy6WT4dLu2E3iT1SdCrYxlkc7J9Ai0S4UxfN9AUbJlzftBJLn8KESb9UuTZJtaAwmXb4lWGuQSSZU+eU9xTqCqBrxiAUVGlO+UPet7heGqhlXnSxy5hzpJErqsrrkfYs1Ka/k02ZwOBpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3u4n5IgOXUinHGIKZLMW1qD4kgXhhM1Fjrw6HISXbk=;
 b=NbpIL4jxPAFJ+ADI7Fn54QP/CoXSja0fujqwTK7+EvmT+tAs09dWAONx8mOvr2mUQkI7Nvf4LlWJpCqqeQ/1dfZpk/6y15obC7D+6Gb4L/z5lmaOxydMS57vsBqwXUP6pqNPVU07xuS62oMJVRvb1Oj0jLeiC4s3kzfUn49whYBCaaXDB6S9NHx8/OWYDWezbqEIiYlCm7M/VbJq+R2nyWB9pJqYF5Ch00at6j0v5wSjS65OYWd8HXbRmSU2OOi90ngraUJJxVuEsnA4SEu7qLzckS7R7M1avIa28lfkCXzQ2RfwE5xtvQHbFOLl+1U4CfiynhVKeTMI9aSMrZDU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3u4n5IgOXUinHGIKZLMW1qD4kgXhhM1Fjrw6HISXbk=;
 b=g2TYcuh87XPceV1E2k20Bf0auIv4NW+FeKJtDrSBoKdtF1JCivggQVK9vgcde4uc8nkRMNGkcX6m8B/D1kZl2bbTi3hv9KEjdSQXWRcG3NCPqv9IaGPVOgI78S80cBNAfzY5tDI98BNxUvd3o2CKi1Mek2gUQ07WsgE723RbdGU=
Received: from MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 by MWHPR12MB1309.namprd12.prod.outlook.com (2603:10b6:300:10::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 27 Oct
 2020 10:26:14 +0000
Received: from MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd]) by MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd%9]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 10:26:14 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 02/15] usb: dwc2: Add support for dwc2 host/device
 clock gating.
Thread-Topic: [PATCH v2 02/15] usb: dwc2: Add support for dwc2 host/device
 clock gating.
Thread-Index: AQHWn9WdGYR8ixAjP06OAeXVaijex6mrNRSAgAAicYA=
Date:   Tue, 27 Oct 2020 10:26:14 +0000
Message-ID: <0ada5a94-99d1-a4b9-5bca-3dc8094f2dce@synopsys.com>
References: <20201011135122.71764A0061@mailhost.synopsys.com>
 <87a6w8dqn2.fsf@kernel.org>
In-Reply-To: <87a6w8dqn2.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.32.192.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b0b8c69-d185-4047-089f-08d87a62bb5f
x-ms-traffictypediagnostic: MWHPR12MB1309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1309EBDE4BCE6585BC2F80ABA7160@MWHPR12MB1309.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJFyxLpKEtihGlK27tQYAknZvbl66P1If/t6QVUOlas8d9pKC2OhklIvjr8NYXVPbJArgGwMywfcWH4yB/UsR2sAEJkSYn/CqPixSz+SGOiEvr82UpYSvUravcwk+BW773Lb8Nrgp+WZCwLI4GFmLetCdbTgoOJHY/GD0d6Em1aCa2dRtZ485E2NBgw1BrhCQMLwSlo6zAcKSWg01gfRIy6Vi0lcV2cvtSRK7V/yX3S1Thy0wbq8dWonxp8gx1Ky+VSprMiSx7B89Uz81C1d3CG2BiMehSDCYQLnWAUk890c0NkvbEHjWRXkmNgKtKe7ldxknlRv1844gkyT1zIllg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4428.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(31696002)(76116006)(66476007)(5660300002)(2616005)(4744005)(6512007)(110136005)(83380400001)(31686004)(86362001)(26005)(53546011)(478600001)(91956017)(66446008)(66556008)(2906002)(64756008)(316002)(36756003)(66946007)(71200400001)(55236004)(6506007)(8936002)(107886003)(6486002)(8676002)(4326008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: SJ7dsOseYBjw9gIriwMUEyjLhGotMQoGKOd0GZe3XXr/oAk8q56EkAvUHMrcIB61Aq57PhEQc31qLZfNC09JtdbOT4tNRlFwcG00XZ1jh3zFDPfX0Nw/yIVWzxmSkWHMUWKMT5giAIyc5pm728Kr1eWT+Qp/FEnsBQwOieA/WOMjtGG99rV66SwWMxDTJ4g0ZZ4Cy33gtfnykuTbhjnPWM3Yu4lstWhDvmLZAeDWuJTR4ZyMWRLyd5PHyKPvo+5GDf96++EE3ZiUt8MTAtx6F4RTMVHAA0sisWJlzSFamVvzDdmtyqISxSdnv0TFcntdOj0OrTtjOGa5gI3jcC7OOHBgtZVbKjDyreWM9UeQpqgFakiP/kcVojZtxop46S0fQLDSi3aAteWSJZZqwamSEmClpSv9ZkigLmFkNO7ef8fHOPIYrNhAzgk6zxwUeHCGAkdSeQotXr06SAR8xrPTjfGOH3Dls6Dtw8eHVtwb7DmhWl8oAsSlcTY5fyC+qsamX5ii/WsW945hOF4JSg+phkgHYAHPC+fxfHclmen4xt0pRueeGdzw2NkkuzYepftQUimbZDt0UrlG41exjZQrjRL8sqZbl0mSo6jTnSCMS82d44JLrUCY8P5sznprWMOhqk/Hd93ZqEtfE/O09Ff6Cw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AAF8F4CED32CA48874C7CAC6BBA6F25@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4428.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b8c69-d185-4047-089f-08d87a62bb5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 10:26:14.0064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+Q9kfzzJzKrgqjrJCbOfTjRLu452x2FgnuOB/7iXKQAOYl605qCS/F6hX549nhT4iNck1NTWfac5mTlTCpiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1309
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpPbiAxMC8yNy8yMDIwIDEyOjIyLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IEFydHVyIFBldHJvc3lhbiA8QXJ0aHVyLlBldHJvc3lhbkBzeW5vcHN5cy5jb20+IHdyaXRlczoN
Cj4gDQo+PiBJZiBjb3JlIGRvZXNuJ3Qgc3VwcG9ydCBoaWJlcm5hdGlvbiBvciBwYXJ0aWFsIHBv
d2VyDQo+PiBkb3duIHBvd2VyIHNhdmluZyBvcHRpb25zLCB5b3UgY2FuIHN0aWxsIHVzZSBjbG9j
aw0KPj4gZ2F0aW5nIG9uIGFsbCB0aGUgY2xvY2tzIHRvIHJlZHVjZSBwb3dlciBjb25zdW1wdGlv
bg0KPj4gY29uc2lkZXJhYmx5Lg0KPj4NCj4+IC0gQWRkZWQgY29udHJvbCBmdW5jdGlvbnMgZm9y
IGR3YzIgaG9zdC9kZXZpY2UgbW9kZSBjbG9jayBnYXRpbmcuDQo+PiAtIE1vdmVkICJidXNfc3Vz
cGVuZGVkIiBmbGFnIHRvICJkd2MyX2hzb3RnIiBzdHJ1Y3QgYmVjYXVzZSB3ZQ0KPj4gICAgbmVl
ZCB0byBzZXQgdGhhdCBmbGFnIGluIGNhc2Ugd2hlbiB0aGUgZHJpdmVyIGlzIGJ1aWx0IGluDQo+
PiAgICBwZXJpcGhlcmFsIG1vZGUuDQo+IA0KPiBzaW1pbGFybHkgdG8gcHJldmlvdXMgcGF0Y2gs
IGl0IHNlZW1zIGxpa2UgdGhpcyBjb3VsZCBiZSBicm9rZW4gZG93bg0KPiBpbnRvIHR3byBvciBt
b3JlIHBhdGNoZXMuIFRoaW5rIGFib3V0IGRvaW5nIHJlYWxseSBzbWFsbCwgaW5jcmVtZW50YWwN
Cj4gY2hhbmdlcyB0aGF0IGFyZSBvYnZpb3VzbHkgY29ycmVjdC4NCj4NCg0KT2sgc3VyZSB0aGFu
ayB5b3UgdmVyeSBtdWNoIEkgd2lsbCBicmVhayB0aGUgcGF0Y2ggZG93bi4gTW9zdCBwcm9iYWJs
eSBJIA0Kd2lsbCBjcmVhdGUgdHdvIHBhdGNoZXMgYmFzZWQgb24gdGhpcyBvbmUgZm9yIGhvc3Qg
YW5kIGFub3RoZXIgZm9yIGRldmljZS4NCg0KUmVnYXJkcywNCkFydHVyDQo=
