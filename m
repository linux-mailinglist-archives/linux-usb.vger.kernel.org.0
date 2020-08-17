Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B158246EC5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 19:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbgHQRgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 13:36:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:57084 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729615AbgHQRft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Aug 2020 13:35:49 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A0DF2C00A4;
        Mon, 17 Aug 2020 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1597685746; bh=43lMj2irazMGZJxlkXE9I13ljCMwoYkVIYvQgjyJh34=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=G0DnFmnc+k8OjGEL3HPS1jiOsdJmSX5C2lZ8OYKnwoFNG1Y37ryXnXJiP8HjFj7B4
         M8RDal3z+O/2XRRuAoXhwxDQf1efG3f9O2tPXI/ErZ21xtLaIya2xEi0iJve/ScQ46
         lxOFf+K3HNlcRgRdExIVUo2bNB52P6WmfHQfX+6xcau/7oxF4wsV26gaa372/mY3T6
         jBQ9uul2rVIfHY/sUeTJE+R9YB5mOlKYeKrEfFH1qyJ+NB9g/qMrVHnXUEIpG4xpoS
         L60CHqi2VNbnlB0111iK7HAqqFhUD8VTa5IOraVdUW00TyFwetoFvMo1ktJ2xrO/GI
         NzLbBPm/wT7Vg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CCD74A005A;
        Mon, 17 Aug 2020 17:35:45 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 05E6B4017D;
        Mon, 17 Aug 2020 17:35:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TOU8E3hY";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COgUKJ7khSpRCo5KTSJyNoG1+0dJhHo+PTmXHWdU2AgdBgggdT4Mmsi6ECApXw2N3rYBvN1AjEPVGlgB4EQVtsWAEllJDl40UL46Fn2O/mboYUwtKkyBrRPGMEntPK98qwwyMlqAAAi4LiRqeRF5zDnHg2pe1EF+4HCd7YImQUTKMJnsJsPJonfyLxnQtWFx5MGP8OXK26FKCzWn/0MFUbaH55QFCUdjSZqDUGEbm2eZyv4EWmsbr7lS7xll12rPu6Qfk0/TfkcgIEpPbk7O+T+LXDMMMN43rdqgsYSDoJKeKxrAmazzYbhhKeQMJE8elA2S8lf/9RyEjYaFoptW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43lMj2irazMGZJxlkXE9I13ljCMwoYkVIYvQgjyJh34=;
 b=ggcMU7zTevAPn2h0gdQphANrAXTt6hWnlgx+waOYqJit4uszWbQxeD1tI8JJBmOEmWiiZX/Gwp4dAQZAV6flWhK0XNhEq/SGNYSHexsZYfVs4qsX35kXAhDKssAgtgSKww2LMuRZyUAvR+2CNhDLdZMmh8B6cn9n4YEeGYvpQ0ZvF0UvBbEuGEwEG7MpXdYKIcmtr8j6dP/QfTlv3Q5Onx+gbAFbOLcbsWNNlgj9iC7oxRRObPRGNGYIcSo4lXGHE5nnhtXC5rJ7WSYnwbCOeqfXXyH5GhVAtOt7TMqQIoP96hRZC7qs6ya6QczIEPvuRavoRO1AkO7VpZTSpF9A0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43lMj2irazMGZJxlkXE9I13ljCMwoYkVIYvQgjyJh34=;
 b=TOU8E3hYqUxfwNb0QjeW3uHK1N6pE5s4ltm1Aid0qnMAfmvsgAPQ7r2km2dnjRCT258R5L9n5RoSykRTU0tr2VeOaVXkCLtRfo/1yr5/I59bdiVMCinbyICEmY1+cBwDlL5SOmJWP4ofuKvJXiBoaWxf5XgGDuTN54RoDx96kwg=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3873.namprd12.prod.outlook.com (2603:10b6:a03:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 17:35:41 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 17:35:41 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 4/7] usb: dwc3: gadget: Refactor preparing TRBs
Thread-Topic: [PATCH v2 4/7] usb: dwc3: gadget: Refactor preparing TRBs
Thread-Index: AQHWbGT8xEHbd5XZMEGTOz3Dp6gdOqk8X6eAgABBNQA=
Date:   Mon, 17 Aug 2020 17:35:41 +0000
Message-ID: <d3e031aa-8f7c-e347-f570-2fae456a371c@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <6f67c1a81052389225a95fbccec93b0af0151cf1.1596767991.git.thinhn@synopsys.com>
 <878sedz8w6.fsf@kernel.org>
In-Reply-To: <878sedz8w6.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 117dc3c6-cf5b-4981-4f68-08d842d3f66d
x-ms-traffictypediagnostic: BY5PR12MB3873:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3873FF8CDBD5335BED6027F4AA5F0@BY5PR12MB3873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jGEagwXTa79aMeU/voPMlf+M2Yxv4V0a153Pg2BpnrfMblOviD+QFuHSS5nc5CNaTI85clLPgVIY3djhex9kDc4m8l1YALMnCNyoJHb7qYxcTXbLG8xYHKmk5bQ6lWidIVU/dd6q/Tx2cNomnYbves7XFhb6BrD4xErM0c0Hi85XxqnqfidZ0Pi0miJWhjRSbzam31Rtvr7T00ZKYLRrGHVDFxQMAFH6gOFzBwwZJENFQKAsJ2vQKZmygup9lcMXjFa0/Tblxj+7QU4UB0+s3MywKrFdhfcH7FgVTRgd2fkvX7Lhu6bhrHGjaos6b4Y7EF7jtA5pfK+4DG5xpXc1s0m9twfHhl7BMaQ1fTWxrpcjNzk6iEAzy4Ev1QTcPj+T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(346002)(136003)(366004)(6486002)(36756003)(66946007)(71200400001)(2906002)(6506007)(110136005)(5660300002)(107886003)(478600001)(76116006)(6512007)(66446008)(64756008)(66556008)(66476007)(31686004)(4744005)(31696002)(4326008)(186003)(8676002)(26005)(8936002)(86362001)(316002)(2616005)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: UJ/IItj9uZU2Uzmv6l7CmWWHmq3wHKJMc+ZZf2CD13vg8k48U84PysiKYRbuc2CWN7udin0ECibr2UP+UWsADJ2gaFTlTRpnkYCZgquTApGqTG7Y/whneJ2ciW5W9rGUA1mG3otOC8k8IjkOYwya36+bL55hssiAGnckemBKIefNNaWXYk0+sToZfb2hY+RbsSiOnkA93MBNhedfEYWndrP98CVVYlfaBnYVrpKO2YwMj/aYMdKty8U5IySHPwFZ2bC47qJ2bTfHjQpoIE/qCcCvim6IOOL5DytayuqbwISqvhDTmFPsXSVuESEaDmlX3VuM2xZKKYYSawOht7Yl1GTGvp20KFwNL2m6c4hP0uFSrZviHGv+dd3euAegws4dLG2W+QcJr0W6Rp0YAnX8kp1J2isWLkaMC5aikiEc0lEprvdBzMFs1xK5G22S2EpEBuFgbl5j6Izo4PpZzpc9w9EzpDZgOfE9/JkD/i8jrG7ckvtrypjN1aHYrjMN2MR4Kp0XqYJHF2uqagEdnUfgarEuJY7+CFi8XmH4+qIJYac9ZD4krJ+deGIYp1EfTP+UYKxodDYsy2NjsbtiukDilQ3PZQJ0Ra4/DNqIhMFxb9oVUmGghxOVXZsdo5Z7vn0tETTCOmAqNheWxTbDPWf1ow==
Content-Type: text/plain; charset="utf-8"
Content-ID: <142216357603EC4E978D916CD202C645@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117dc3c6-cf5b-4981-4f68-08d842d3f66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 17:35:41.1847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mr7mnmFI/927gpRiVRvF09de3/FSk5KMe41UKVCHgKOCJere8WQ+TWuQsdBzWljetGXerJtl3Y/t6hgCWlWRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3873
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gVGhlcmUgYXJlIGEgbG90IG9mIGNv
bW1vbiBjb2RlcyBmb3IgcHJlcGFyaW5nIFNHIGFuZCBsaW5lYXIgVFJCcy4gTGV0J3MNCj4+IHJl
ZmFjdG9yIHRoZW0gZm9yIGVhc2llciByZWFkLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBoZXJlLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4N
Cj4gcGF0Y2hlcyAxLTMgd2lsbCBiZSBtZXJnZWQgZm9yIHRoZSAtcmMgY3ljbGUuIEJlY2F1c2Ug
Zm9sbG93aW5nIHBhdGNoZXMNCj4gZGVwZW5kIG9uIHRoaXMsIEkgaGF2ZSB0byBkZWxheSB0aGUg
b3RoZXJzIGZvciB2NS4xMCBtZXJnZQ0KPiB3aW5kb3cuIFVubGVzcyB5b3Ugd2FudCB0byByZWJh
c2UgdG8gbWFrZSB0aGlzIHRoZSBmaW5hbCBwYXRjaCBpbiB0aGUNCj4gc2VyaWVzIGFuZCBtYWtl
IHN1cmUgYWxsIGZpeGVzIGNvbWUgYmVmb3JlIGFueSByZWZhY3RvcmluZyBvbiBjb2RlDQo+IGNs
ZWFuLXVwcy4NCj4NCg0KVGhhdCdzIGZpbmUuIFRoZXkgY2FuIGdvIG9uIHY1LjEwLiBUaGUgcGF0
Y2ggZml4IGNoZWNraW5nIFRSQg0KYXZhaWxhYmlsaXR5IGlzIG5vdCBlYXN5IHRvIGhpdCB1bmxl
c3MgeW91J3JlIHRhcmdldGluZyB0aGF0IGlzc3VlDQpzcGVjaWZpY2FsbHkuDQoNClRoYW5rcyEN
ClRoaW5oDQo=
