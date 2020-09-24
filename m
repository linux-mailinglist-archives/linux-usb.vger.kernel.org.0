Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1DD276B52
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgIXIBc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:01:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39674 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727013AbgIXIBc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 04:01:32 -0400
X-Greylist: delayed 391 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 04:01:31 EDT
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C1F74025C;
        Thu, 24 Sep 2020 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1600934100; bh=qVjXly7pzGN4W/hkv1gYjMbB+Ducv7/gje8On+hZ1wQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=exPz/fO7ZK+mCaiNvNsyjHdA9pWXIl3t/6IEDsrX/d3bH4ad2xmPcTt3Qy0c9Sw1o
         JnjxxcOJQV+kElyarK5zoriUPNsIwGanx9Fbz0T9B/y5iwScP1btrrUwaJctbfsTWG
         jGOBobcNNw1i+66iPGpXkTOqVPh4UMSut/cjIMv+uNhYcnXFq3y8uZ2vYAnQhm32v2
         ZrFVVbn70grGHMTj1oMU1xHPULVzzYiWolKKxQlVvYIxLbddeTrV7S5cOy/SbDncVN
         4k0iSmlxOlDaG0UukRzysqWghMKF6f0Qf1yo0V01kEY7TQ8WJHIdqvaNzHGJF0AYUg
         5f/XGys7Q5Hcw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 72BB8A0077;
        Thu, 24 Sep 2020 07:54:59 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DDECE810A1;
        Thu, 24 Sep 2020 07:54:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WgZz4pYd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii42CF/VqXfo+Y19DuVkVwsF+j7Y9J60LzDoEdFsKrkg7lvMLY4HTwo6vlazes9Vm8rW9AA2gyDW1ghlaaKwy9MZbfyCx31FREhYcHxkmf3s1Jo0+JXOwsaRp4LAzGhQCaUUlp4QB7/x7TcPlpiUkUulWtEVAzvcKXk1wdFS4eM1iY6oIwmhEqXHabWuvrAqWL68GV9rzuTVcnL9m6S5wTEmQfb2xxz0Uhq9i34DK5EkjNLgEwEnXhNE9/V9t2FlcwZDwB9l38BxOqRuKoaVJZSiGBZARdakTj91tpOLQ1u74WD4J720lZeZfPVWObh5NZkbV3/6LEBv3kvhg3ftbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVjXly7pzGN4W/hkv1gYjMbB+Ducv7/gje8On+hZ1wQ=;
 b=RZLIpa1T5sP4K4u4Gv4Nz73MNKZ4t4WkyFBu9gs+Or/vcmVYXvEr57M6ovuhDykMlXgId0IUKaeYWG2Z8QN2GlhSr4jhn+Envc4trtVgsYzittHpGMMJvJFY43ZgFdQpiVLGYvsuFztrQPUwKKDELyIkkfKjUSPWma5WSZsQ+xJRv4FZpcIUu/OUVtBXpCiaz3v4YrAnXE87F8mo80tk8E5g91BGuOQ4UqHzjEU2WxQyqFe5ELRkaGp8MwXrPKbLsd6Tx0Y3A2ngPywh3NpzEbu+XPmAW1lnWe+Vuk2++s+4Ns05C1bktAIowFf1jrQmzEYIa9+WCJORNAxUN+bzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVjXly7pzGN4W/hkv1gYjMbB+Ducv7/gje8On+hZ1wQ=;
 b=WgZz4pYdNprh3EQH9j+una6KAF9bg4lFBXSbxmDC6Lu7+tsZRwoixuiEY0uUjGos7xCFOjCfl7BywGXJy7+uwGAUatDOQk0AMWWgLrkgq1bjCxx/MJ7hqeJQ3UNNtwyldzSRN8ok/tce3WyWYyrO/McoGWICKXFswUNiWfuBCdw=
Received: from DM6PR12MB2924.namprd12.prod.outlook.com (2603:10b6:5:183::23)
 by DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 07:54:56 +0000
Received: from DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::fc33:b670:9830:9c17]) by DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::fc33:b670:9830:9c17%3]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 07:54:56 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function
 names
Thread-Topic: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function
 names
Thread-Index: AQHWbGUEA0OMrWZqz0WtDXt4nmrN86l3tTEAgAACAQA=
Date:   Thu, 24 Sep 2020 07:54:56 +0000
Message-ID: <129eda75-c6af-70db-a341-e0ce7fccc38f@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
 <874knnehul.fsf@kernel.org>
In-Reply-To: <874knnehul.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5df6c73-b789-4f14-df5d-08d8605f211e
x-ms-traffictypediagnostic: DM6PR12MB3419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3419098A15C7842D5A8E5585AA390@DM6PR12MB3419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VB8GsYRVR6/+XsFHAxIgfjfMejNpCGtFT1JUBXaqOUaxw1CRbrBmin4BtRgEQd+QtXofCmvR7U/pblqvH7lHNVVTEMmw0VmVSf7bnMHfaDUrSoM0LrYbVzy/kGOsYiIwXYMI2Q1M5Qe//C0EtqeY4OttlpXmKka6RNRRvRBeSj2kw5WD+916j20e96fvSUUhZcGEboNIZEyafmaBLsINZG+WwUHRHu5KefcckYs34lQI9tmqcLr7/btpDOIRJiElvwF8G9BrBmqhv9E33WoiT7xFdC1SJEIS/nlkJSPzpYqnkHHn3RECMZPd77f7q8RyFX1YVAwUxMNyCgEEtuqRBnNphwe78vHMhK2IFFE6EB0OOmow3u9I/AU4vARd32bEGStX2hma6duS7CDiE6eL1RUjQ4cWhuaBA/MwUWMwreRwRmrW7OJoapZfQeBVOKs+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2924.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(6512007)(66556008)(26005)(107886003)(64756008)(186003)(6506007)(8936002)(66476007)(316002)(66446008)(2616005)(71200400001)(5660300002)(478600001)(86362001)(2906002)(66946007)(76116006)(8676002)(4744005)(4326008)(83380400001)(31696002)(6486002)(110136005)(36756003)(31686004)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hctGWdWvLcLn9P9B9nIn95flY30D7GluKqL/aNWa/fZoypows4XX5jbwprp9UC2REVD3WoQnFlsKdhXurtbVi9eLrwDaUJ8zRkxysaMmNVggm3Kn0MYACIboJ+UoDd9gf8gt9XoaObkqckJK2tIlWJaEKlaDjocwY7C+UDUdHj7YIE8qrHlFw1x5eNW7CdIktvGTL1GW/MQKFZeGa7nuAX7aDT5+pkljorqLOHYcOKyFEF0HZ5MuFlisLqGMoHmLhzWmD+El36tSNVCAFeZXFrqQSeQz5kSfxtXm2oYdPEv9Llx9+HOChRuLTOgijl7fjJvPpNaY5b/3LsOyNLEFLnsnkNApCMOz/CoUE6a+f+gGZKvsbjjFl4pHFBl0ZwvAOvFwtWDxPrqgwmGjxY9X84biBcU7dbYGS7nIH+JTWv0FnWYYxPDTDE41giezxiP4ucT9kAAhBGRT72ZFFZEg/pFmmC1ttJ/kHfCqT2/bLn8Y3Izr47ylvwHLNFQyfYP6x7XdIejkE+oVX8IYAJrXL3egODwddFXmN4IQ4oGnhsO8sIEhWPQk0F94D6GUK2I/TndJ7Z2Fr+AJRSMssxKcpCbRi0dDGn//UatyJtEePCT40Ac5BfRSJPIC7fj0yaIgBWUYerPxEBTR1+q2Jte1Vw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC1EA117766BDA439EF797E1F32E08B5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2924.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5df6c73-b789-4f14-df5d-08d8605f211e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 07:54:56.5996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7paN9HnwyhOLVSGmmdbc/1BFdo4aAoSFSUOFkvV064nBq6/CGgrB74LdTsViSZSFlqXYsYNMQ04TtLkH9T5A2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPg0KPj4gVGhlIGZ1bmN0aW9ucyBkd2MzX3By
ZXBhcmVfb25lX3RyYl9zZyBhbmQgZHdjM19wcmVwYXJlX29uZV90cmJfbGluZWFyDQo+PiBhcmUg
bm90IG5lY2Vzc2FyaWx5IHByZXBhcmluZyAib25lIiBUUkIsIGl0IGNhbiBwcmVwYXJlIG11bHRp
cGxlIFRSQnMuDQo+PiBSZW5hbWUgdGhlc2UgZnVuY3Rpb25zIGFzIGZvbGxvdzoNCj4+DQo+PiBk
d2MzX3ByZXBhcmVfb25lX3RyYl9zZyAtPiBkd2MzX3ByZXBhcmVfdHJic19zZw0KPj4gZHdjM19w
cmVwYXJlX29uZV90cmJfbGluZWFyIC0+IGR3YzNfcHJlcGFyZV90cmJzX2xpbmVhcg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4gVHJp
ZWQgdG8gYXBwbHkgb24gdG9wIG9mIC1yYzY6DQo+DQo+IGNoZWNraW5nIGZpbGUgZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiBIdW5rICMxIEZBSUxFRCBhdCAxMTYxLg0KPiBIdW5rICMyIEZB
SUxFRCBhdCAxMjMxLg0KPiBIdW5rICMzIEZBSUxFRCBhdCAxMjY2Lg0KPiBIdW5rICM0IEZBSUxF
RCBhdCAxMjk0Lg0KPiA0IG91dCBvZiA0IGh1bmtzIEZBSUxFRA0KPg0KDQpJJ2xsIHJlYmFzZSBz
ZW5kIG91dCBhIG5ldyBzZXJpZXMgd2l0aCBhIGJ1bmNoIG9mIGZpeGVzLg0KDQpCdHcsIHRoZSBw
YXRjaGVzIHlvdSBqdXN0IG1lcmdlZCBhcmUgbm90IHRoZSBsYXRlc3Q6DQp1c2I6IGR3YzM6IGdh
ZGdldDogUmVzdW1lIHBlbmRpbmcgcmVxdWVzdHMgYWZ0ZXIgQ0xFQVJfU1RBTEwNCnVzYjogZHdj
MzogZ2FkZ2V0OiBFTkRfVFJBTlNGRVIgYmVmb3JlIENMRUFSX1NUQUxMIGNvbW1hbmQNCg0KVGhl
IGxhdGVzdCBhcmUgb24geW91ciAidGVzdGluZy9maXhlcyIgYnJhbmNoDQoNClRoYW5rcywNClRo
aW5oDQo=
