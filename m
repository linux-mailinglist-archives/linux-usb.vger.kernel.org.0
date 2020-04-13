Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57761A68C5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 17:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731024AbgDMP2G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Apr 2020 11:28:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:35944 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731018AbgDMP17 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Apr 2020 11:27:59 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 676F8C00CC;
        Mon, 13 Apr 2020 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586791679; bh=g/nyU/gsavS3zMB6MwFlSYmSL7l3asHvFtdWsIbvEMs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=J2dt+/ffZbEfznVTD70jCUQM231uJh71/I0dxqCYBdiRRR8wm6rDSeJcFgXXAMH8t
         YeG1XIXRW2OWnA7qZGx41p8Jj6SJ0Ba86faszklNg8HHRfrMPjSQNq2jj7aYNEN6Ki
         rO72AdGrBS3AGdL5z5IcdSWxWdwy4PO805KAI8J3avm6HziWaeSgCgUKZVmTMKiO23
         GFQ7anMyL95jI76QN6P/Ei5z+/ooij5O/CXH+kyzsWup8UmzDbjdT9dtw08c9I6YFf
         s75hgiG4cWI31KkyTFyfhTSP82YWxp90OX1cjaDNDklF4S67rA8m6svNsmVG0jQQgw
         wY9wgvro+F3OQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EA17BA0083;
        Mon, 13 Apr 2020 15:27:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Apr 2020 08:27:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Apr 2020 08:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VufGrhO46mhMMzVGpOCL9hRa2il2fd+jVuhh63Gz7ZZdTggolJhpuY4N2jacmZUyxbzqF8F3NawmmtemT3zm2XKb4WLix/idOquKEYZzdXAD5R0CYR973avM2bYZ56r+HupNi7xJFYMUn701ZGPjZ2Yv3YLjv++lD69BDRaBBe0Elz8Ya/Kc/4GvVc1H2vET3j9/X6+NY6x30EQZiUyQSSPzQVNbi5AihZTWJrsYNZkKmmIbKYl82kP6rzeli4Q2A3gkABxv/KrPz93FTl9HKkzCv9UAE+eblGxpfITR9VrzOT2yXhWRVUMnDYxYATMTRbZ1bZAn2yqkTnKgtRz31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/nyU/gsavS3zMB6MwFlSYmSL7l3asHvFtdWsIbvEMs=;
 b=fiGSeCorfkHDLiTl7nQhPqaXnZJkck6wStqMbk+dewcpq3cc/zlzrORIF9T71OV549EJW8jsJW/fDEAREhxI4/H2ZnOZZPvDrmPrpcGgThyXuk+4CgKyKT5nspm+vu7DRG0Y0OvyigC7I0jFyMsR5bngab730Ub3yF+1SfqA+YQLWYHe9ZVNlIqHuQf4fYMQGrMBbHZR1eX60PCx5UEizBEo8G8iodGiqoJbPwJxUaFN1OrJ8+BY9+CIFFFVcPsilzWaTwNGh5sDS7ZBoumIH9pSjIKjjXWFZU5NIGk1fGLiY16TBmpqc7ykussfmJZPdM/QPFuU4jFrPcegV2G5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/nyU/gsavS3zMB6MwFlSYmSL7l3asHvFtdWsIbvEMs=;
 b=hSLV20DP/D/hqEbi137iCQKCe62adZFjMi9Nv2yI+4ickrGfFqQJ2OG3fCNuIi1OwDyMZ+u3D9I+UMdACYig+VPIizSBivSrB60U/hWfZ23AbKDbGdb9Co8srPYyRE7HSDzGxgSgzNi2E+yekWWakSqVEzvigpwTpyugwYS+W70=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2478.namprd12.prod.outlook.com (2603:10b6:802:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Mon, 13 Apr
 2020 15:27:54 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 15:27:54 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgA==
Date:   Mon, 13 Apr 2020 15:27:54 +0000
Message-ID: <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
In-Reply-To: <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
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
x-ms-office365-filtering-correlation-id: 0eb99b80-2372-4319-fd3e-08d7dfbf3cbf
x-ms-traffictypediagnostic: SN1PR12MB2478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB24789C7B3214A51D65FDEB5CA7DD0@SN1PR12MB2478.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(346002)(39860400002)(366004)(376002)(136003)(2906002)(4744005)(6512007)(2616005)(31686004)(478600001)(5660300002)(6486002)(91956017)(53546011)(81156014)(110136005)(31696002)(8676002)(8936002)(71200400001)(6506007)(54906003)(76116006)(86362001)(186003)(66446008)(66556008)(64756008)(66476007)(66946007)(26005)(4326008)(316002)(36756003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvLGTafXqX6+nHc36U0KqFznz1jHfo4w8ho3iuM55DiLhDrUX3CNNa5m9+CPwU8E3fqNsurEuXzGSl7KHT65drzmRPsPanbwTE+FPzDvt3oAC73Yt3w/wdRRTvVe62gmK0SVYFFr2qCvCilFJY3S9Lsw+6PiAdg71rsmKtCPJLZQs1MasNp2EcLShc19dkV709sUwIDnS1ebHkVzPCq/Lx3HymnSDxaUPTiwAlwERd1kqrCxsulZ9DVt+7CEZrhe0H2t0KF8sjTxNYtIUCgWwUHPzxd9E5RjKKZjnObke0H4kowyj9/P8U0xtB6ded71sLcSk82AcQpHsfxSs7QrcUcpmSLh9qpp0zvrLBhUmDP1+8g1IyLhLx+g6w0N6FMVnYdPwLEA0FOZtVQbPslHM5d07kXXLGiETPoRp88Yk60VhPjtvQXXLMwpwHkjqqop
x-ms-exchange-antispam-messagedata: hfR8AZjUup4H+CnyX4Ry2iXKZkKPpDWMcxpA5mAE7DbKkiDOdzEteM0x/bfj0mA78shMW1NgR+ioGmb2iBm2CRzm42fmqBQoTSD7Hie5vP6WTsAOmv7GfP//CO/oTTBVPop4+pRz9Dv6Uc5fz2etDw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFDEA7613D97FF499F42BEFA8B66B673@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb99b80-2372-4319-fd3e-08d7dfbf3cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 15:27:54.6387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xblgcrp1Hs80MeS/iT+op3wdUj0HKzjPYyqENjoPxIxbbJkioQkJCDOCFcieeSnZTCmCwXg5wX1fsamDtdTUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2478
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTMvMjAyMCA2OjU0IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
My8yMCA0OjQ1IFBNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+IEhpLA0KPiANCj4gSGks
DQo+IA0KPj4gT24gNC8xMy8yMDIwIDY6MzEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4+IE9u
IFNUTTMyTVAxIHdpdGhvdXQgdGhlIFNUVVNCMTYwMCBVU0ItQyBjaGlwIChpLmUuIHdpdGggcGxh
aW4gVVNCLU9URw0KPj4NCj4+IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBHU05QU0lELCBHSFdD
RkcxLTQgcmVnaXN0ZXIgdmFsdWVzIGZvciBTVE0zMk1QMS4NCj4gDQo+IEdTTlBTSUQgPSAweDRm
NTQzMzBhDQo+IEdIV0NGRzEgPSAweDAwMDAwMDAwDQo+IEdIV0NGRzIgPSAweDIyOGZlMTUwDQo+
IEdIV0NGRzMgPSAweDAzYjg5MmU4DQo+IEdIV0NGRzQgPSAweGUzZjAwMDMwDQo+IA0KU1RNMzJN
UDEgY29yZSBkb2Vzbid0IHN1cHBvcnQgQUNHIGZlYXR1cmU6IEdIV0NGRzRfQUNHX1NVUFBPUlRF
RCA9IDAuIA0KU28sIGluIHlvdXIgcGF0Y2ggZm9yIFNUTTMyTVAxIGF0IGxlYXN0IHRoZXNlIGxp
bmVzIGFyZSBubyBtZWFuaW5nOg0KDQorCS8qIEVuYWJsZSBBQ0cgZmVhdHVyZSBpbiBkZXZpY2Ug
bW9kZSxpZiBzdXBwb3J0ZWQgKi8NCisJZHdjMl9lbmFibGVfYWNnKGhzb3RnKTsNCg0KTG9va3Mg
bGlrZSB5b3UganVzdCBjb3BpZWQgdGhpcyBjaGlycCBmcm9tIGR3YzJfY29ubl9pZF9zdGF0dXNf
Y2hhbmdlKCkgDQpmdW5jdGlvbi4NCg0KZHdjMl9oc290Z19jb3JlX2luaXRfZGlzY29ubmVjdGVk
KCkgZnVuY3Rpb24gaXMgZGV2aWNlIG1vZGUgZnVuY3Rpb24sIA0Kbm90IHN1cmUgdGhhdCBpdCdz
IHNhZmUgdG8gY2FsbCBpdCBmb3IgaG9zdCBtb2RlIGluIGR3YzJfaGNkX2luaXQoKS4NCg0KVGhh
bmtzLA0KTWluYXMNCg0K
