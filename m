Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A53F1A96D0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 10:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894624AbgDOIho (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 04:37:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44308 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2894661AbgDOIhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 04:37:38 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E37F04054D;
        Wed, 15 Apr 2020 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586939857; bh=jYxVY3I8iWmCW+ASnclMtB39hXzJGpiq4h6xXtGfs5M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=f1GsUUuPwgbcRam8PWJNAcjrh/wAGgz0CKg3g61cv5+TYnNieztIOcqEZ8mxvaUvL
         T7KQ6+Fxh3l8QqsfTUCB6hKmisHIt4DDIlruGzcgEq7CMjdnqzfzRh2Si7LRn1+YvQ
         dEUzgPfoJdm+nl9v1DkF4HWPxszkGUa972bFPxCRf2azs+I9/tYKBaM1GmHVAXrYq7
         iqDZIitTt59IDe+32x+xPCdgDWBmcLaUvzTvlQn7H7pMeuUFy47HVQneB/CUv6XXAU
         uCME8IGKHNhgcOrIE6MUrzKbjKi+wDX7BRn+ADUNs/EKmgWJ3vdKOUm5JOL/bx0tub
         1HMQ5w1r589Yw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 20BECA0067;
        Wed, 15 Apr 2020 08:37:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Apr 2020 01:37:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Apr 2020 01:37:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USLvWMM0IVFoU6K/IfvLvKtZR1X62XVUjKbrPiNFrrrbUZBes3aW+1KFYbYwg7OyuHxDjoQnoW4bJBbgQaU/zpgtuB3s0VlkHJxMruo8FO9MCqlxazHObPNKBh/s091Gnyb/uPcalcy3Cslm/x8wEBwyFbYDs1ZUaGP7TaS9lQhznV+EgsuklsC42RPqeiLBqx1wCqYIW6NpCJ/tCw2PRB+GvqP6COgmupVzk87Fx7hiveQ5WnXmYjoLntv+voBU+0iJ0HPwtc5wO/GADXMNmquFsF+M5rm+h8ZunIthCDYEOIAR2+0eCeT2kgGyFmuSQfBBm+TQUsxLtQZgMNUiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYxVY3I8iWmCW+ASnclMtB39hXzJGpiq4h6xXtGfs5M=;
 b=YHMQ1mnjaX+sa0MRE0t5k71Y5DpuPog+Xh8srRVOJ0KTPqVEr0MDom9XBkO35mkD5Fq6kpPy2fefLWAVPkU3ip9NEL7xEJrS31X/MKuwPgBJBhWNrSLyB3atB/M49Xgrz1GWcnYIKgIFCCHR4ZBA4aU2MTfSoCqASMnf+GdhbrNOSYh/LmomuvndX9GNAZrOIqBMo85e1HHqMfouAVORdau1nr6+VR+Gq5SSR4pr8qkmVoZS53uSvV4lHrEWQV/kvaF6vpSPBbnW5Mm+j/TIHwFjW8lFVsYgxO4GcxFMr09RUy6hj3IW9acyVgFKSucvSzH7o3jow88SD2MwwP94FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYxVY3I8iWmCW+ASnclMtB39hXzJGpiq4h6xXtGfs5M=;
 b=wu4o+UhlIDiI+72zztGRvNKk4tg8JGWD4asUix/5L+rB5eqogo0Pd3Cum2zErKsM1ULXKuiYZ0W69SZ99l82WNLK30/ewLrZR10VebCk6+fYSNm11iEY3oOgv5NeACbfGMDEztlUSsMN2gEK7JtVxlDyoKeTlFQ24uRJx3PyZak=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2384.namprd12.prod.outlook.com (2603:10b6:802:25::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 08:37:17 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 08:37:17 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4A
Date:   Wed, 15 Apr 2020 08:37:17 +0000
Message-ID: <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
In-Reply-To: <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbda5443-a583-4737-2188-08d7e11834c5
x-ms-traffictypediagnostic: SN1PR12MB2384:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2384DAB1F1364D76FDC2C411A7DB0@SN1PR12MB2384.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(39860400002)(366004)(346002)(376002)(136003)(110136005)(316002)(8936002)(4326008)(6512007)(2906002)(8676002)(81156014)(2616005)(558084003)(5660300002)(6486002)(31686004)(186003)(6506007)(54906003)(86362001)(66946007)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(478600001)(31696002)(36756003)(53546011)(26005)(71200400001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ETuHrTow9p+5PE65apSmhcMYbxjxwcuYc2iENA7kqpkpGsF0hVPalouFn4LBoc6ohCyWnx9b6hJmXTN0SkDZFYOFDgRasIfddgC9sdOPpXmrJGNE9kkU+6JWd7nZlAV0/RUw9nGljJkrsS9jbrYzDN9NbgHN5pCRxfFb1ACuyb7TyVHt2dQF0IDM1uqiu+sFIUoRyD9oqoZUc4sAvahYzf8KZFgQey9zfMOR5WFIlD06hVScK7iPLXwluHprPOq7x2GsCpaerW8mjvUuTLQYcS4s9yhnVr7h20w5LNSkfOyfm0mX6gf35dtSWi5fnDILXwIp0lYe5/f+/72t/kYMMX0GM7wXAj/+CcKrPgYGP9zQwRsss3/MdUUjFuoBhGgRvEEY2qmYHxUxAcyhuj9IXNEy++ia+rm7ApjHvprtkP0lkyqMZOPY2+7czsusmUhT
x-ms-exchange-antispam-messagedata: 24rimua9bhk7WoU5wYQyBdklAvoiQX3H++iO8H+k5mgJe1aoKEESkPaWyWyCdk7cTL8O8VUPA8sYa3IZarsyO1XONNl+WbYONDcxRR0NkQI7OFGwFWXLfczTl8gjA2b+sbGWnoVDlyJdvaWUJ3k6NQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7E8BFB7A3E909459CF2649065334AB1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dbda5443-a583-4737-2188-08d7e11834c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 08:37:17.5474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QERCt0B9coS/8c1s0gXeO0GcKmlKEv0wteUp1/7aPhQYNp46WPfyMJfPC50CDiy5Sio7VXPGGP5T3yT8CqjCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2384
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTQvMjAyMCA0OjE4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
NC8yMCA5OjE0IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCg0KPiANCj4+IDIuIGRlYnVn
IGxvZw0KPiANCj4gV2hhdCBraW5kIG9mIGRlYnVnIGxvZyA/DQo+IA0KRHJpdmVycyBkZWJ1ZyBs
b2cgc3RhcnRpbmcgZnJvbSBkd2MyIGxvYWRpbmcgYW5kIGNvbm5lY3RvciBjb25uZWN0aW5nIHRv
IA0KZGV2aWNlLCB3aGVyZSBpc3N1ZSBzZWVuLg0KDQpUaGFua3MsDQpNaW5hcw0K
