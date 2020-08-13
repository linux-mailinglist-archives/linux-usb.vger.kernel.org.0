Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11923243F36
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 21:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMTOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 15:14:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49044 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726292AbgHMTOa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 15:14:30 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E51FC079B;
        Thu, 13 Aug 2020 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1597346069; bh=f3JGV9MfzvEeCM7iwmel18Y0nbzrDhpK25Sorxphhgg=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=DvE3l2UU4kOb6fRU8FYRr5rNsGcSv7d+JfY2C87RvMiPxcwQ4JpdBJHAFH+7qL/cF
         U4uqucG1yYcvDPg1IlxS2WpO+EGzO5uReZ3uLwcErk5FYRnlsIzi7DYclXABArcoZY
         aOzePtKMq/9Ujy3TWKmTNTomF/I5RcUPUPczphJxw1Y2A/t5l7iMAP2iMRDzuNc0HB
         7Z/XGZni2GENjXWRg3AnI1aV/OLSFYJmYLd/uJEFhpskmRezGirhITluDr8vMSSxIk
         rlxNh7szK/ehMJxSJZv80xETZ4jod9jtAD6IQ0Hx8AQIuNwRFgY6DY+3Us8gToE0Yg
         bScMCFfuSfTWw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 57AAFA005A;
        Thu, 13 Aug 2020 19:14:29 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5316080FA8;
        Thu, 13 Aug 2020 19:14:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gm4kFDs4";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bueJZQbuiA4peiVTxp8hXLsaPgUpv+vQuwYv3ttgluQaNLfj7Kzxf3X6b07CTyneStoPglP+cRpCwC1Xu0kSouFvvlmQ9H4wAa30uZkr22231LuPwdZMCFUcS9W3QsK0YSypWTeGAF0ck3tpqmvkZGEHRmJTmVkzKZHjH2256RgtIyCsUrVYgT8gqWgRgon53O/DRvziMdGOUbRmwO8F0Sc59rFg5o43qjH6SO7MfIGAnkQrOUfzNpJI3IFYQaAayl9W9ew32OMXDE/FuE8LrpgCeoilCKSu2BjPdyCCPns1ri1v/BZWBjtiHoFbTalAixf1AS+0qTEYIsg4/ONetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3JGV9MfzvEeCM7iwmel18Y0nbzrDhpK25Sorxphhgg=;
 b=MMDCutiiNalWmOjXZylp2YiGWTspkDdsjIvQNrbZmpozNahuHru40wzoAnwGqhlW6oHn5TwY1pUuywlcVxWfzX/U2SUrZ/c8nTrMnb3aZwNbjld3zXUGmAGQvhZD5Gp7IYGRBNbEvyYOWdUXelrN1v3XYqLy3w49YiVMEtWWuBkRu1aIi1nDY/KYaDW9GiwecUt0JPL3IBvTJweSrvlipz9ytZGxrn3WKAEZsju3SzOnjAYgjfJVLghkBFD631xbUcsSIM0hbv2OyVHKWczmwW4hD/YRRR8qGrK7mhNzV8nqq8JjMJz1mfi0X788TlyLo6VKHYPmhNoY72OHBWyNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3JGV9MfzvEeCM7iwmel18Y0nbzrDhpK25Sorxphhgg=;
 b=gm4kFDs4enGNl7tsvJm6DuXl6+eL/Z3HA7+UCR3EFijv/jG96DAEh8t/d8EDlXm0gqUd/6LI/nSA4kUa0R2zDXpOqQ3/vBvY2e7xalYSIFjPv8tEA0PFDRrO/Lyqp73p5iDRi8FBBjESguc3/OxEgk/igAcv85TrZtDEtlQDeG0=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3382.namprd12.prod.outlook.com (2603:10b6:a03:a9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 19:14:26 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3283.020; Thu, 13 Aug 2020
 19:14:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Topic: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
Thread-Index: AQHWcTqb7ekmZwlpLkKb02kc+QyDBqk2aXWA
Date:   Thu, 13 Aug 2020 19:14:25 +0000
Message-ID: <0f678c7a-f2e1-a8cc-2f7f-75bc92513cc7@synopsys.com>
References: <20200813062532.829720-1-balbi@kernel.org>
 <20200813062532.829720-11-balbi@kernel.org>
In-Reply-To: <20200813062532.829720-11-balbi@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59c43af4-2296-4e09-3926-08d83fbd1829
x-ms-traffictypediagnostic: BYAPR12MB3382:
x-microsoft-antispam-prvs: <BYAPR12MB338220F97644E7EA8AD508A5AA430@BYAPR12MB3382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H58Smei/M0DPWLVEw/VXmnx54XkxVSP/y+DvgZla5Isbk4zDCl6Lxzz9twybAYwN09yQsMwgFeTynSp+HArbJ/av1N/6SLti049Q86mMThO+YEcpagJ+L7jWsrLaMBxT9Tix7fYgr/PIyev/CR1uaucHI6bk2izoe2psX/bxIKomPdjFE9VZEa8HQVD8QB6xU+BOJfKq8gV+i1sGCqWEhjWL2ArYijIa17dhR0hoPMDj4GW06WJO+VHaotBQpAxWaaOJ4cV4K6dzKb/S8CzZW1SWEC1rKTHpU8p8O3lEcu3Y6zmcXJTOanaswBlHEEDCht35zzf1ebupbkViupWwfZSmBxQyXQ1di1cxIAMRdyUBfaC+JLAx/6LRYWRU8yAl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(6506007)(186003)(2616005)(31686004)(6486002)(66556008)(66946007)(36756003)(316002)(8936002)(66476007)(2906002)(64756008)(110136005)(8676002)(76116006)(6512007)(86362001)(26005)(71200400001)(66446008)(83380400001)(478600001)(5660300002)(4744005)(31696002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ahjgwuHzmB8HthNsHuXIRurJzbdS7QWEE7jObccDC2Y5ZzcAsjx8mnxfsDUrYc4H2fFtm7yIJtFULX3MiWRrCO2WspWP/8XVN1INQeacBXRW6oaYUmvhDnXeWFOgxDu12wRTEWBWxgFh+3WGHzo4BRq/gNsShTRD4aHSTCLfZBoZTxyf1HPWTm1IB1GBh8TXTFWtMw6nA8FefWR3xUlS1h9EIXtAWXAw6kqnE833LBgd4tkNy0DmmoS/XT1InPmG/hQCfpK6g6tLn7HFIXOsQF9QvP9AiYDN8x90bY/iCPz2T9pYc8AAWcRxkU7tXXDbZKSDLGxDKtVcEtOFrWpxL6dRoXHO/r4frQKR03B1DTqw+Piq1PvceeYsMqfsX9D4tejEDRmJ5DHW4N6R5afOzQaLFLp02hQvXNNJdCkQOdMFKSo3Xbq6uXWgBSflIsIbqYZHsMwleHqTsOImRPzT44qL5Ebu2ISHdQMdB0vdh+qr7dMd5rcweW0TmE21HbuzwgE4Qr22bdEYdz1jt6JSkoQlfCT5BsEZStuAmfuwaE9L6EAsMc5Tq1gy/yksEcdRzl7W4bJnUsLwY+YFqNG13ehGEnu9WLUrh6rCb+2xf5oG7YkFPnhJe6KuKlagfaT1PBnXqngZNgof82nDwAEWXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F119AC84D4D3144BC03B33C3A6393B1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c43af4-2296-4e09-3926-08d83fbd1829
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 19:14:25.9259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F46B1tzjL8ffQvpm4IFkielmZaVk6UpOx6MAY/lPn50Nv137w9hSxMXoysmReUEzK0da/quqf7nsAvc409ffYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3382
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpiYWxiaUBrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBGZWxpcGUgQmFs
YmkgPGJhbGJpQGtlcm5lbC5vcmc+DQo+DQo+IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcw0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGZWxpcGUgQmFsYmkgPGJhbGJpQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMgfCA1NiArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDMwIGRl
bGV0aW9ucygtKQ0KPg0KDQpUaGVzZSBjaGVja3BhdGNoIGZpeGVzIHdpbGwgY3JlYXRlIG1hbnkg
Y29uZmxpY3RzIHRvIHRoZSBwYXRjaGVzIEkNCnN1Ym1pdHRlZC4NCg0KRGlkIHlvdSBnZXQgYSBj
aGFuY2UgdG8gdGFrZSBhIGxvb2sgYXQgdGhlbSB5ZXQgYmVmb3JlIEkgcmV2aXNlIHRoZW0gdG8N
CmJlIGFibGUgdG8gcmViYXNlIG9uIHlvdXIgdGVzdGluZy9uZXh0IGJyYW5jaD8NCg0KVGhhbmtz
LA0KVGhpbmgNCg==
