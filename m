Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18642EFE52
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 14:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389019AbfKEN1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 08:27:06 -0500
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:37618 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387784AbfKEN1F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 08:27:05 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79DC6C0E70;
        Tue,  5 Nov 2019 13:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1572960425; bh=yuk71XFhsMnBF5rvpbefnqRCoGp2jrJmNYO+doE2iFU=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=jfChspVVx/EsFMK5/K/ArZSkn0YYhe+rTHkNe2oqvIEsCWX68k9xcY7l5HEXHXgIu
         XyrDSV4usoKO+Ta7WVpEPrOgdcmOJnQq4oAKVGrzD7/bI4P9+W1Pqkg9kvQ3wRcTIP
         8Hp0XrRPD5Jt3zQrIw7CmuSXNlVguajn+WWWorE/v/boNDMjKwpj3yzh7M/RSoL7+u
         +1Kwrx8r0p3hrXHx9SWMOUdSGgkM8aEjvAxqRRR1mHFBdmlkm4fp/IkzdOx/xtrG4X
         nuqWedBPfieglwEs1rt6Hu81lcwKs4b9PjAmdvZrEoTCiEJITmCrtXMR2OSzmwzBKQ
         xZrUHC+gGj00g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CFBADA008D;
        Tue,  5 Nov 2019 13:27:04 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 05:27:04 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 5 Nov 2019 05:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlmlXzfGjIgRLiRoaOgTJieXcoYkU8mYN86FfJ9YamFlVeu7npbfeealMGP7x9rMCS3Dh1dD8OiJKXQ1Wz9DbmYftw2sY9SRGEBto86YfmL8mUS/w50Z8u+c3v4qLF1LYZLKZXhF+iQRvh721A2s7TKNyi5WX8YhkKQRUjfS5+xB4XEiRKvh4XWWJmT/dy0F5Nj85XWHhCa9p7Hmozi7EGfaEw5FI374M8kZZl/I1+DtHzaCTSn+5jMs8AxUaTBXqcNR7/vzqwqAfw+iVLAjAj3V+H5xe5YkOAwW833Q3x8LK3XsHFunWpuDQTzy9zE9h3UcOuwG1f+Vodk7Y3XJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuk71XFhsMnBF5rvpbefnqRCoGp2jrJmNYO+doE2iFU=;
 b=HWuqsTfOyeS4Pd0YSFci7WnoWkgCCqBWE+abXa81F7O04lTs04YDvgBdkWXXY2wJMvGso2W14yyOPNt4r4R3NuuCDBg1ZH2mq1U72KbhOe1ML83P0mbQQMjaUkEij6NIzVNF0DewdCjkEvxIBs030/42xf5uOB6oz/5gJDyPgT60C0lp3eC5RWJqp425UByEvMKjgrd0ecmQx+IDT9JB49y3Sli5vrCfYx6AgJ305nuRwj8jIfWg8UYZiNtfcbSWXjiuynfyDaOVqyfvUOHXeXDZRw0ml2101Bfpazar1E9YUM3VUw3CMQSqiCCLLYT3M9d4BLZLaSOlIwGayUVtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuk71XFhsMnBF5rvpbefnqRCoGp2jrJmNYO+doE2iFU=;
 b=GSR6P0cqAOHeEFFcx4hGRmXh71qRygG7sZyFUX90y0Tr+zrykLYVluF6JS2DXfQ8lQShRUc+GyMWZeSdyVTy1K7NIFJp7G2Gb4v+Ivz5XztDYTDs7K51rRrKsueNS8RkZCyZqBvIC3w1dM5du2ZsxOs1kbpOgPuwSFjDN6W8jM4=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 13:27:03 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9%3]) with mapi id 15.20.2430.020; Tue, 5 Nov 2019
 13:27:03 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Topic: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Index: AQHVijUBxoK/MK6P90arc2M4mai0sadpvf8AgA30FACABNJvAIAACwWAgAAVeQA=
Date:   Tue, 5 Nov 2019 13:27:02 +0000
Message-ID: <bdaf8a7a-f1b7-e57d-3fe8-0ed25f47b347@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
 <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
 <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
 <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
 <926c3136-1979-4df7-0afb-a91df9a2ab01@synopsys.com>
 <5f7cc638-ed27-8f8f-95db-c1b198ebb8f5@ivitera.com>
 <7f1b3cc0-718c-731a-4069-809bf2b2dca4@synopsys.com>
 <172d6cd4-3e48-3a40-bf1c-4f50ba921838@ivitera.com>
In-Reply-To: <172d6cd4-3e48-3a40-bf1c-4f50ba921838@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [23.50.56.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab2330f0-4cc0-40f4-3c75-08d761f3d84c
x-ms-traffictypediagnostic: MN2PR12MB3248:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3248EF1162619C6D9E16C829A77E0@MN2PR12MB3248.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(189003)(6486002)(7736002)(36756003)(26005)(486006)(64756008)(65806001)(76116006)(11346002)(476003)(2501003)(8676002)(53546011)(76176011)(81166006)(81156014)(102836004)(8936002)(66946007)(31686004)(66476007)(186003)(66556008)(66066001)(229853002)(6436002)(58126008)(31696002)(110136005)(86362001)(316002)(6246003)(6116002)(3846002)(305945005)(2906002)(6506007)(65956001)(66446008)(91956017)(99286004)(446003)(2616005)(14454004)(5660300002)(71190400001)(71200400001)(25786009)(256004)(6512007)(478600001)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3248;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DjSdUygt64su7xQ7gZpQT7iyXu8wzLPkSpuNoczztif8ELF/EHn/ny+iSMsRrS8XGUezMuGo20yI3cd6Odeazk0m/oOJYneRrfQntbq5VMF3rxunreqp28Jj/fT7hTw9qCEUsdoE9x1qxwqejGrwVK05GOrjMW9XKk7CFwdqUOoogvIlxifyteJ5XnQb2ACWlyIDZNVRCkOIlLTZoShVXqPsyF2Bo1Kwm2L5BRgyQwW4pNR8UPHY9OZWeGeOAe6jh1BzsON82PkXYawSmbLDPkJttSbjPKHGzrziW4ebOnGBcwCPveDeQIK7cBf1NLKLihSn2I8zSejedCsgQsY3MNwnV+esRG8YvFIcyKjWDNcyY1aW/suEu9bPh6lRS5t/H95DV4sJav4lBUOUvevUDXfF1Yefk0cIOk+yqdhACWweLIj1fa1hdk5yW8lyGggy
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <1E0BAE7A182181499CE18E2BDB214E9C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2330f0-4cc0-40f4-3c75-08d761f3d84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 13:27:02.8961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZQEbrxAcDWo3SKnCt/xJ474O0F7dRctCuUSZPkzkWpzmX8Nc4cmVibDRI3RCDZQ2u2EAcs1nQGu7bUlOBdSlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3248
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,


On 11/5/2019 4:10 PM, Pavel Hofman wrote:
> Dne 05. 11. 19 v 12:30 Minas Harutyunyan napsal(a):
>> Hi Pavel,
>>
>>
>> Could you please perform follow 3 tests:
>>
>> 1. Test#1. Disable all debug prints for dwc2 driver and test again 960
>> bytes mps.
>=20
> Do you mean without any patches, with the existing code? That will=20
> result in the existing (incorrect) behaviour.
>=20
Yes, without any patch, just disable debug prints which will improve=20
timings.

Thanks,
Minas

> I will do all the other tests, thanks alot for your effort.
>=20
> Regards,
>=20
> Pavel.
