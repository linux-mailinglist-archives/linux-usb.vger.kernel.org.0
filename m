Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795501295C
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfECH6g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 03:58:36 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:36686 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbfECH6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 03:58:36 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D8841C014B;
        Fri,  3 May 2019 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556870318; bh=go8Fe1XOxYNS5gtfzD4UEcPVDKUQXCX/Vu36+N7pnpw=;
        h=From:To:CC:Subject:Date:References:From;
        b=PlJ9QdDUPAkti4n8a90wSJjgNiIvSUnugYU//KJX4PtAbc4x1RfCiEjWRw6ajDgyB
         XS5KUPX5mUgAdVoYq+gEqpuVITddljSP6Vn4fjJWn1rBqeLaTgAtshxT0rItujJYcP
         VUqtPQQMBpYpYGeAoQsNSx/NGtbkFWtLWYQlfqbbpTSLNdAnyeWrvMDLON5N+lKfNU
         mNBU8qgZMQkj5iz0Tc9e09v6s/Co4LLwgEWcqPe4cofrmFEzAUk7BdOFDUXM0i4KLu
         pD+uvk4zqnhPR9AU6PZCTuqo8XKMrEPJsMDVgEz0at9zkWLKhOYa1fkIqFNutEttmN
         WxfJQbe9xMezg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6392AA005D;
        Fri,  3 May 2019 07:58:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 May 2019 00:58:35 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 3 May 2019 00:58:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JJ/VKQqkgbswWC8lwxNbDq+iFC4S9UteRs63iDVJrA=;
 b=jEDVDc+qlY994LIMKEY0NAyr7HLAWg22Srs0hFLDqdM1LNBXkh5HshxJqp1e7Xnxj8RhY1Xjn0iJf1XOEyjnH848pmuB6d5VFJHmg2b+Jlwqx/ShamkwcF8bw8c1qScEdrPSESVG1QFtMQ22ZpT3Hpib7cqCmaeoFNLvcc5UoNA=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0736.namprd12.prod.outlook.com (10.163.209.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Fri, 3 May 2019 07:58:32 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 07:58:32 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Topic: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Index: AQHU9qJ/tHbivSmPyUKJBC/Mf5HbVQ==
Date:   Fri, 3 May 2019 07:58:32 +0000
Message-ID: <SN1PR12MB24312F18598D2E4FB45D92CDA7350@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
 <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XFd-Uk_beUr+5djbi-93eWENGu5z5td7V3KPqpuoeiig@mail.gmail.com>
 <SN1PR12MB243103882D0C119575275915A73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=UD6MCRGik3RWQ1ZjvHUT-zTrR3+oOiN42GignFAXd1wA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a4d073a-91e7-4a92-68c3-08d6cf9d231a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0736;
x-ms-traffictypediagnostic: SN1PR12MB0736:
x-microsoft-antispam-prvs: <SN1PR12MB0736A4CF7C6CE4F705FCABE8A7350@SN1PR12MB0736.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39850400004)(136003)(346002)(376002)(189003)(199004)(229853002)(4326008)(26005)(6506007)(66066001)(7696005)(316002)(305945005)(14454004)(486006)(102836004)(446003)(54906003)(81166006)(33656002)(81156014)(107886003)(476003)(6116002)(76176011)(9686003)(3846002)(53546011)(256004)(6916009)(7736002)(5660300002)(478600001)(8676002)(14444005)(66446008)(2906002)(73956011)(71200400001)(6246003)(8936002)(186003)(99286004)(71190400001)(91956017)(86362001)(55016002)(66476007)(68736007)(66556008)(64756008)(25786009)(66946007)(74316002)(53936002)(76116006)(52536014)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0736;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o0B0jNJPSiahsyFhOpElK77KcJEJTH+FJ14Vs3BRRqjYstFxGimmeGDnwR2+mkctVZ/+jjcD0JZQrRhW9edS5vxc72QczRmUv7FMcPuG+/IRHwcvtaqszuDo8eSTdtQFBMENHbczWAB9ctR/WznpAu8zIm0OamcSF+pwfovfKdIyRI/5/t4V8VRJTY0N8+IZ7lV/Qxz4Ie5kb6Qx+xzCwphAF18ZajIAZVJf+6Z/THKyJ84Dhr83z6XqWFyoR6tsRGJSdRVaYymib1NELjUKmxab4ejMuK4T3z4GIrWPhQ3CpSL5ZbNJGOZble3L9OMs+Xdlkco1AHWOEb9XFBDoTLcD5LiV1t/AM8evrM6jsl1f5e6G/CgnoMuNz+TvLjmC5kktvXERK3SSQ5XM4A/aTSwrB+xAifPl2hvH3kMlIGc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4d073a-91e7-4a92-68c3-08d6cf9d231a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 07:58:32.1989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0736
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/30/2019 19:23, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Tue, Apr 30, 2019 at 5:45 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>>> If setting "power_down =3D 0" is wrong then please update your patch to=
=0A=
>>> remove all the mainline code that sets power_down to 0.  Presumably=0A=
>>> this means you'd want to convert that code over to using "power_saving=
=0A=
>>> =3D False".  Perhaps then I can see your vision of how this works more=
=0A=
>>> clearly.=0A=
>> Yes this is a good idea.=0A=
> =0A=
> Actually, I have a feeling it won't work, at least not without more=0A=
> changes.  ...and that's part of the problem with your patch.=0A=
I have lot of testes which prove that the patch is working. If there is =0A=
any case that the patch is not working please mention. If possible =0A=
provide the logs of the failure.=0A=
> =0A=
> Specifically dwc2 works by first filling in the "default" parameters.=0A=
> Then the per-platform config function runs and overrides the defaults.=0A=
> If the per-platform config function overrides the "power_saving"=0A=
> parameter then it will be too late.=0A=
> =0A=
> =0A=
>>> NOTE: I'm curious how you envision what someone would do if they had a=
=0A=
>>> core that supported hibernation but they only wanted to enable partial=
=0A=
>>> power down.  I guess then they'd have to set "power_saving =3D True" an=
d=0A=
>>> then "power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL"?  I guess your=0A=
>>> vision of the world is:=0A=
>> I have implemented everything based on programming guide and data book.=
=0A=
>> Core can only support hibernation or partial power down based on the=0A=
>> configuration parameters. There cannot be two modes simultaneously of=0A=
>> power saving only one of them.=0A=
> =0A=
> Ah, this is new information to me.  I assumed they were supersets of=0A=
> each other, so if you supported hibernation you also supported partial=0A=
> power down.  Thanks for clearing that up!=0A=
Welcome. All of that information is listed in the data book.=0A=
> =0A=
> =0A=
>> The power_down flag is set to DWC2_POWER_DOWN_PARAM_PARTIAL ,=0A=
>> DWC2_POWER_DOWN_PARAM_HIBERNATION or DWC2_POWER_DOWN_PARAM_NONE while=0A=
>> checking the hw parameters. So it just indicates which power down mode=
=0A=
>> is supporting the core.=0A=
> =0A=
> I don't think this is what the params are about.  The params are about=0A=
> the currently configured parameters, not about what the core supports.=0A=
> This is why all the other code checks the actual value of the params=0A=
> to decide whether to do power savings.=0A=
So for the power saving which should be currently configured parameter I =
=0A=
have added power_saving flag.=0A=
=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
