Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA055D3A38
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 09:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfJKHpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 03:45:41 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:59406 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727068AbfJKHpl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 03:45:41 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1200CC0BF8;
        Fri, 11 Oct 2019 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1570779941; bh=OsyhIUy8MUqLsz9q2K4ScsanvoJdl696JYEFQeKRXyE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=j20oGpQZhf7/f1SmarYKooVOPCUHhZjTt3uN131KFCOat6nUZ1Gqc5pDth8pHaS2+
         8/wYc9kXXSQPLityHsgS2ktquZldSEl30MkSHKXFpalztK+5qXycH2Buij1CCbxsi+
         m4pqIvov6tGlheZN8XDU30sG9vIsqEU3SQXn73+oU1J88qKlxQS/XEx1LAX66FxA2+
         pmX7poYaJvP1mjBInWudnyzctN4wOrrh+ftRigzKxtFUJsTvPDzCEYWP20iuwezAsh
         VXA/onK2EAeP/dp50WfDNsyc5Z+Fsn5CwpLb2gO6up6nDK4hY70Q1r5Csk5Eg35TDp
         iqLa4Ir6tOPnQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 66CD1A005A;
        Fri, 11 Oct 2019 07:45:40 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 11 Oct 2019 00:45:32 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 11 Oct 2019 00:45:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZgziErRe0CjBoISsN1Z0exVoxBiWp4JHAeXUDCsGFGarmp3oIM1sS/dYYwjP6lFI7SEMEJK9PfoHST6YCfW9WFeI1bsiXUSyeZVNOH9vSef0vKpm7GaSgN/YrNSAMt1l/ve09tvoydqEzEW1un6rOGGcweXzOSwcWOFZftjWbSce+BdV2MDdKztzfXm9AdLBv9YTYdVpyYxWt4+naz+UnLyMXyb2eqff/c+ypTwImN3JRrua6FDeo2oOgztWs5BQrRtslL+3UhifGMpvBpCmmpr+RJ+qCP/E8Ob66gW1WLL2fWIO3koesm8DlxdF30ylMjCmWh0dQ4oQ7Qt537cAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsyhIUy8MUqLsz9q2K4ScsanvoJdl696JYEFQeKRXyE=;
 b=gzK9UZaEt5Da7t5nd62Q045UBFm/ofklguRX8xrIUlT/b48F6HuF3qLIKiX/WfI7QAq79Db6i8aOlB5hxjM+CpSwQhpX5qRrELldnAoXJW2x+ui6KFG9e4QUBjKGgVA7NjuKRdUWvnpf3TIlmWcIZWPpOwh0475RlQKKJj/g54HhuaGnnXge+1qq1XFLGhjg2p1yfJG9Z9/1jtRq0eYZseIA14znTG2YK5n6hU/QW0x9LAUwRvT2N9itSifbQ6m+NNo0KGN0KXX6e7xU6eYHV1zWI8Znv91zNcY5qRSNHYVkucJyd7p6ktr0eGpjOwR+nDH6ZaABSyik1rO2c2xhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsyhIUy8MUqLsz9q2K4ScsanvoJdl696JYEFQeKRXyE=;
 b=JddEnn0/6LVBrfYWmn9KJ7XFDMoFy2k/e0jDptEVftVHM7uy4YwoAiFjB29DxilfMV+CtdxHWQOjYMQ8BBw41PUoWiDsh2iTRbsL6kj7pVhc3RFBe7C3WBOYDhxnZtlYFJ0FK8mrDxZIjC+87cJ+ZzbpBkFgu5EhcCV7z7PJoWA=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3341.namprd12.prod.outlook.com (20.178.242.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 11 Oct 2019 07:45:30 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::8d63:ee8c:3115:ed84]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::8d63:ee8c:3115:ed84%2]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 07:45:30 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Topic: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Index: AQHVf4j2Of4PmBUH602v2JSqcOqx16dUEqKAgADfDgCAAB7ygA==
Date:   Fri, 11 Oct 2019 07:45:30 +0000
Message-ID: <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
In-Reply-To: <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [92.123.244.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a864b98-ad46-45b6-66e3-08d74e1efd50
x-ms-traffictypediagnostic: MN2PR12MB3341:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33414D773A387F0A80BE8717A7970@MN2PR12MB3341.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(189003)(476003)(486006)(256004)(99286004)(26005)(3846002)(446003)(2616005)(53546011)(6506007)(305945005)(2906002)(14444005)(71190400001)(11346002)(71200400001)(6116002)(229853002)(102836004)(186003)(5660300002)(8936002)(86362001)(76176011)(8676002)(81166006)(81156014)(31696002)(58126008)(316002)(14454004)(66476007)(66556008)(64756008)(66446008)(66946007)(91956017)(76116006)(110136005)(6246003)(478600001)(966005)(7736002)(36756003)(66066001)(65956001)(65806001)(4326008)(6512007)(6486002)(31686004)(6436002)(6306002)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3341;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nSXw+6xaIBlDzGdET024fWBgwrrY9VqoS9iiHlefAJFZzgDhruqOqcYIbBMWSlSj6WBtKxc42I55eVbg6pdMhqtAU2z8i7G/ucnwVYjI2kvgC6ehv6tTcpp5yVIC8umDn7JYQZcN4TikEN1LTABPasC7kw6OM/EUgXobPDFwDiQ1jjarwcpS/PUFWX7n2ArjzsoLTi3Wyp3ZpWgtOQiAT/NiHV93pht7WHlvtH0WUhu2uH7rG0QNy68ExMus1CjA6TkcTRQuknKgALdGM3G1+hvfdFCZqR+nTa5ilXDDJyZPtc5pLQLeUyfDhkC3sB4705osQ1ySNPxOAHTqPgoIZfvXdgFFCvdQl4zewhI113K0udYtPuV7+hh1s/9L4ScygtNpsx9mq+7p1LrflqrxbSZkabEBgLi07wVNak6nYX4Ocj8qOPuWu2YK0P5cPaHVkRicy2XnX5i9pnrHUuCYsA==
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <5FBC2CFED9A17E4B907F962EF3C59817@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a864b98-ad46-45b6-66e3-08d74e1efd50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 07:45:30.0853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nuhs3l/fg3eeXfOVFSsQMf75lMcpSeXc5lDnojUcMQrNLaUL7n9g09q5Kz5x57ElWwJq0INKw5Y3WprC2ssybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3341
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On 10/11/2019 9:54 AM, Minas Harutyunyan wrote:
> Hi Pavel,
>=20
> On 10/10/2019 8:36 PM, Pavel Hofman wrote:
>> I forgot version information - branch 5.3
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_raspbe=
rrypi_linux_tree_rpi-2D5.3.y_drivers_usb_dwc2&d=3DDwICBA&c=3DDPL6_X_6JkXFx7=
AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVTrb8UpajEEe=
lBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3D6Ijfw31Oy-ep8P8YzooBpOpciF5CLCBeGj7iYuXzQ=
MQ&e=3D
>> with latest version of
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_torval=
ds_linux_blob_master_drivers_usb_dwc2_gadget.c&d=3DDwICBA&c=3DDPL6_X_6JkXFx=
7AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVTrb8UpajEE=
elBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DeEEdIx-XNzSx7PzLmt5XYWeoRfeqyI1W5aZLt2GN=
Sok&e=3D
>> (i.e. only a few patches behind upstream master).
>>
>> Dne 10. 10. 19 v 18:33 Pavel Hofman napsal(a):
>>> Dear Mr. Harutyunyan,
>>>
>>> I am turning to you as the core developer of the dwc2 driver in linux.
>>> I would like to ask you for help with debugging the following issue:
>>>
>>> I would like to improve the g_audio gadget for RaspberryPi4 (the
>>> gadget alsa device stalls when no USB communication occurs + a few
>>> other issues but this is not important now).
>>>
>>> EP IN works perfectly, I could pass audio 768kHz/3 bytes/3 channels
>>> which is the maximum for one endpoint (768/8 * 3 * 3 =3D 864 bytes ever=
y
>>> 125us frame)
>>>
>>> But for EP OUT, every g_audio configuration creating USB packet size >
>>> 900 bytes (approx) results in dwc2/gadget.c not passing any data to
>>> the audio function (req->actual is always zero).
>>>
>>> For interval=3D8 (bInterval =3D 4, i.e. data every 1ms):
>>>
>>> * 32kHz/1byte/28 channels =3D 896 bytes packet size -> working perfect,
>>> bitperfect transmission
>>>
>>> * 32kHz/1byte/29 channels =3D 928 bytes packet size -> no data passed t=
o
>>> g_audio.c (dwc2_hsotg_handle_outdone() is never called in
>>> dwc2_hsotg_epint()
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_torva=
lds_linux_blob_master_drivers_usb_dwc2_gadget.c-23L3039&d=3DDwICBA&c=3DDPL6=
_X_6JkXFx7AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=3DroVT=
rb8UpajEEelBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DwMRtUtO5zFAK062HmVWxGAVxbpX9h9w=
lpzJaQU_URkg&e=3D
>>> )
>>>
>>> I tried for different packet sizes, every setup below 900 bytes works,
>>> every setup above 900 bytes does not work.
>>>
>>> Tested with host x86 linux PC and USB loopback on the same RPi (from
>>> the other USB onboard controller), exactly same behavior for both hosts=
.
>>>
>>> It looks as if the DWC2 considers all isochronous packets with size >
>>> 900 bytes as incomplete. I do not have a hardware USB analyzer, but
>>> wireshark on the host PC shows the packets are properly passed to the
>>> USB controller in linux.
>>>
>>>
>>> I found a DWC2 datasheet at
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.intel.com_co=
ntent_www_us_en_programmable_documentation_sfo1410144425160.html&d=3DDwICBA=
&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DcQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8=
&m=3DroVTrb8UpajEEelBpJicBEnDNjj4_Ee8-BPoSHmYa-8&s=3DbHXds7A-CT3K5jg2C8JX8G=
vcl2Yy-ojtuLM5Z4AkrFc&e=3D
>>> .
>>>
>>> I can provide any debugging information, debugfs of the dwc2 module,
>>> kernel dynamic debug traces etc.
>>>
>>> RPi4 would make a great audio device if the gadget mode worked
>>> reliably. I can fix/code the alsa device issues, but USB core is above
>>> my skills.
>>>
>>> Thank you very much in advance.
>>>
>>> Best regards,
>>>
>>> Pavel Hofman.
>=20
> First of all I'll prefer communicate via Linux-usb mailing list
> <linux-usb@vger.kernel.org>. Let's keep this mailing list address in CC.
> And one more thing, keep on the beginning of subject follow string:
> "usb: dwc2:"
>=20
> Thank you for your email. I'll dedicate time on the next week to debug
> your case.
>=20
> Thanks,
> Minas
>=20
Could you please send regdump and debug log for failing case.

Thanks,
Minas

