Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 097AED38F1
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 07:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfJKFyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 01:54:55 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:55490 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726174AbfJKFyy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 01:54:54 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A094C0B5D;
        Fri, 11 Oct 2019 05:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1570773294; bh=3KQcOMK75b+HuBVp7RVDt/96E0Dgrz56VJwf0yDYrOc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SOWeVxErUQJpGLP4J+XzInXdqunyUOcEMN1fBc+zsutH3x6Iy1YmnSkZ1Q1+Wbd6A
         7KgbdLxZbCys+D0oTD5g83MLH39ZmVWFaRQt7Y18WqJfYqx5eUl/DJPBtDWUrqwI42
         8bOceWRczZVZf6ldjhlMze7iwMkT51cVh16GkYOWhSr5seN2UfUH+kYgDGY3MWmTGc
         OKit+BUgTyWe370GiUzs0918Xg+z+Y7U970TqFvIdrJobtV10kPv8LP7++Rt+zQPJA
         MQtrOxpFM8pIVjRdg1pGtWq7TtRBVsutJDgkzYUv45YLfOTfgIesexh9FGym30AT5a
         SZNDr0FQ6WpVw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7CCEDA006D;
        Fri, 11 Oct 2019 05:54:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 10 Oct 2019 22:54:46 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 10 Oct 2019 22:54:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmKqy+Bi+nF3yf6A+y0Sy+6iCvqUGyVrWoNZf2iuqh4yURafS1IOTaoJMtfaSF/3E+Hj/v4SSvN98DRRW+oLiEK++nXe5lPbkePKZQ/fXDcOcSnfEdlqsho0UFbnqZ0+BGooHKFhqLQdn/Mg4f/vFqdQhasNNaOW6msiQvdlfcx5DINyWcnNp+sNmiADhGu/bNP4MWIGMKOHgebG/zV+Rt4l/7ssN8/c1pdsdD30dBOVXO1yJzh7phYN0nzo4lAvIijEvQg9tQzeKjputmCWdsIrN0sBvPvQZQB5/xJE2rKp0N6wlDudNetmrnmPRAZPMSpP+NVb6wqPhinyC6/6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KQcOMK75b+HuBVp7RVDt/96E0Dgrz56VJwf0yDYrOc=;
 b=QUgg8gElnJvtstZ3ELp+YaC8TawdN20J/MZuiX4kfSBgjzk9sq3IFUHXq+T8kvVoTbZFwTWWCWme32h8j1/R8ZtuJfm0AWkIvIKrMqA9xGJvbdfwre7DwRKXYFWA0rpIbFXzoUm8Kd8ZrxLwq9vG63upiw4dLJiS23Ps7Y4Tjba7TmZYEYvbStWZu7lGuoDla84YN9FjbFoMsUuHOVZECSU3JD+FKBVS00U6+pMvnMxFo/xxJGoAaqASRXVj/xSsIw4MmV3pbEPPdNPj9qb+EPQLTJ0Xgcf68IbU0Or72+MpoJ9jbBe8yX6+hM72lFvV3paEqG/vHQBvaS7qMb3bFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KQcOMK75b+HuBVp7RVDt/96E0Dgrz56VJwf0yDYrOc=;
 b=bBfrkm0n12IrEgCKgd/3mheB/4dwvRcHdQXqEhsNXMdMUAnlrtvSaK4svLaQgcSHMgIc10QTqh6IcppIfNNCqVwUHZCwJmzraCPfIuOwV5LA+2pAiWWzae/v5FkQ2rFUZhawKneimEUDTkKERyBqV7f5fJj1a1ZFGXs2dMOgMR4=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3071.namprd12.prod.outlook.com (20.178.243.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 11 Oct 2019 05:54:45 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::8d63:ee8c:3115:ed84]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::8d63:ee8c:3115:ed84%2]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 05:54:45 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Topic: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Index: AQHVf4j2Of4PmBUH602v2JSqcOqx16dUEqKAgADfDgA=
Date:   Fri, 11 Oct 2019 05:54:44 +0000
Message-ID: <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
In-Reply-To: <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [84.53.141.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c900dce3-4fef-47dc-e23f-08d74e0f8477
x-ms-traffictypediagnostic: MN2PR12MB3071:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <MN2PR12MB3071A3C02163E3064CE5DB8DA7970@MN2PR12MB3071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(376002)(136003)(346002)(396003)(189003)(199004)(2906002)(71190400001)(7736002)(86362001)(256004)(31686004)(14444005)(3846002)(6116002)(66066001)(305945005)(5660300002)(71200400001)(4326008)(65956001)(8936002)(81166006)(81156014)(65806001)(6486002)(476003)(486006)(2616005)(11346002)(6916009)(446003)(58126008)(186003)(6512007)(99286004)(76116006)(966005)(6306002)(316002)(102836004)(26005)(66476007)(25786009)(31696002)(8676002)(36756003)(64756008)(66556008)(66946007)(66446008)(91956017)(14454004)(6436002)(76176011)(53546011)(6506007)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3071;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hou20TdJn7pAEZYxGq/vuhPkrtBCWd8V7ME78Gg+mDYqq+ADjiBBtOJfD9JDY/CMQCrJx2I/dIQtH47+UC6kEWWBatO0OaR2FmERZbs246dQFZgRDoqZ+7cW8LPxJYuFMERHv6nGbx9GY8W6luahBaau8+D8jRpLfO5zxj6PrY8BGXW+HDPxxJEIFbfVX6/QYSnzJdMiulzCSUEEjbj/S2DkLd6strmPMiL+wtj9NaYvTjr/gCS9KCmPgb5Djp1ZXT/ouU+ZRmb5NKXjnyRyvJZi8yVQBw3MmGDzAb6oh7Hk7Q8ZekQA4ufhg1hyIdgt80bhMg8/PWDTt3GaSH+r+zzfYc4pY2sZ5s4pWbQeyCsYlcw7aKOE0xT0XeRU+mpEMKBN87GoL/t0kcS5DaAc5BmsE3HQoZTO8bLNwr8OgYFC/v4qhBXvTdXkUqjCnW0r8901QNRMtwJWwRCUbaDemA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <093BC901FC16904EA93F01E6698695FA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c900dce3-4fef-47dc-e23f-08d74e0f8477
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 05:54:44.9088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnrWe9OcdP2+R5oSJLPcqqKmhK6KTty6WNsYorOY0qZ8X6GWnN696TcOQBN9UnVCIUT+kQuXEgp3gxWSCDSiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3071
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On 10/10/2019 8:36 PM, Pavel Hofman wrote:
> I forgot version information - branch 5.3=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_raspber=
rypi_linux_tree_rpi-2D5.3.y_drivers_usb_dwc2&d=3DDwICBA&c=3DDPL6_X_6JkXFx7A=
XWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVTrb8UpajEEel=
BpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3D6Ijfw31Oy-ep8P8YzooBpOpciF5CLCBeGj7iYuXzQM=
Q&e=3D=20
> with latest version of=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_torvald=
s_linux_blob_master_drivers_usb_dwc2_gadget.c&d=3DDwICBA&c=3DDPL6_X_6JkXFx7=
AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVTrb8UpajEEe=
lBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DeEEdIx-XNzSx7PzLmt5XYWeoRfeqyI1W5aZLt2GNS=
ok&e=3D=20
> (i.e. only a few patches behind upstream master).
>=20
> Dne 10. 10. 19 v 18:33 Pavel Hofman napsal(a):
>> Dear Mr. Harutyunyan,
>>
>> I am turning to you as the core developer of the dwc2 driver in linux.=20
>> I would like to ask you for help with debugging the following issue:
>>
>> I would like to improve the g_audio gadget for RaspberryPi4 (the=20
>> gadget alsa device stalls when no USB communication occurs + a few=20
>> other issues but this is not important now).
>>
>> EP IN works perfectly, I could pass audio 768kHz/3 bytes/3 channels=20
>> which is the maximum for one endpoint (768/8 * 3 * 3 =3D 864 bytes every=
=20
>> 125us frame)
>>
>> But for EP OUT, every g_audio configuration creating USB packet size >=20
>> 900 bytes (approx) results in dwc2/gadget.c not passing any data to=20
>> the audio function (req->actual is always zero).
>>
>> For interval=3D8 (bInterval =3D 4, i.e. data every 1ms):
>>
>> * 32kHz/1byte/28 channels =3D 896 bytes packet size -> working perfect,=
=20
>> bitperfect transmission
>>
>> * 32kHz/1byte/29 channels =3D 928 bytes packet size -> no data passed to=
=20
>> g_audio.c (dwc2_hsotg_handle_outdone() is never called in=20
>> dwc2_hsotg_epint()=20
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_torval=
ds_linux_blob_master_drivers_usb_dwc2_gadget.c-23L3039&d=3DDwICBA&c=3DDPL6_=
X_6JkXFx7AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVTr=
b8UpajEEelBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DwMRtUtO5zFAK062HmVWxGAVxbpX9h9wl=
pzJaQU_URkg&e=3D=20
>> )
>>
>> I tried for different packet sizes, every setup below 900 bytes works,=20
>> every setup above 900 bytes does not work.
>>
>> Tested with host x86 linux PC and USB loopback on the same RPi (from=20
>> the other USB onboard controller), exactly same behavior for both hosts.
>>
>> It looks as if the DWC2 considers all isochronous packets with size >=20
>> 900 bytes as incomplete. I do not have a hardware USB analyzer, but=20
>> wireshark on the host PC shows the packets are properly passed to the=20
>> USB controller in linux.
>>
>>
>> I found a DWC2 datasheet at=20
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.intel.com_con=
tent_www_us_en_programmable_documentation_sfo1410144425160.html&d=3DDwICBA&=
c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&=
m=3DroVTrb8UpajEEelBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DbHXds7A-CT3K5jg2C8JX8Gv=
cl2Yy-ojtuLM5Z4AkrFc&e=3D=20
>> .
>>
>> I can provide any debugging information, debugfs of the dwc2 module,=20
>> kernel dynamic debug traces etc.
>>
>> RPi4 would make a great audio device if the gadget mode worked=20
>> reliably. I can fix/code the alsa device issues, but USB core is above=20
>> my skills.
>>
>> Thank you very much in advance.
>>
>> Best regards,
>>
>> Pavel Hofman.

First of all I'll prefer communicate via Linux-usb mailing list=20
<linux-usb@vger.kernel.org>. Let's keep this mailing list address in CC.=20
And one more thing, keep on the beginning of subject follow string:=20
"usb: dwc2: "

Thank you for your email. I'll dedicate time on the next week to debug=20
your case.

Thanks,
Minas

