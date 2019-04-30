Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6B4F0CD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 08:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfD3G7m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 02:59:42 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:54620 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbfD3G7m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 02:59:42 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1795C0052;
        Tue, 30 Apr 2019 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556607583; bh=6Sm/ZUDB1RVxE4kigBfwrr5EvfHSgth+BqrGxNHSJzw=;
        h=From:To:CC:Subject:Date:References:From;
        b=N7Q/iQ+vZUoxLeWenTMC9Wd8fwWiY1DhDDGrCb0eaULkCrmNJxNpAXH2EKQPTBZ59
         MmuITNwM6Du9BMifLSoJ4+TeGvNQrpetyFA45p5kPAy/YpE3AiyXj6PUssRx+xwaRc
         3a1GbR27iMHudx53jLWxzCbd/2/87HdDMozAzILlguxjClQzLPTAWPuRbcQkeeg+tI
         KJ0Ct+aSkvS0CnUWqo2kqjMeJLVSeMr2ocxJnjDCR/KC54z3bknsXTiPFDhIp2eRHv
         CK1mK7XzuixCFan2AZOlkHAxmh9YaENuz5rtEQobvlTAELjzGmQwvgJ4TX3Kz/zgG8
         gldKxRTU/Cv9g==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7755DA0067;
        Tue, 30 Apr 2019 06:59:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 23:58:22 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 23:58:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFDKh0ZfzzWkZ08wF+KvQlTT1HBAEtLB6l4SL0FhBzI=;
 b=jhQEc0pP3NOb/BaAvFPqJhEbkDvqpAbaqJ6VDR7XM3U1aTvCDZ1Rkk5DeBTU0FiWBJhQSxDiknNUZATw83YxxreJqD8xUaKRKr3hdGRZVEGSC3/l06csuA8T0KiAQ4bUl09Lip4TpcecJjHGsONYR932c09IzuXko0hc0B73JCY=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2446.namprd12.prod.outlook.com (52.132.195.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 06:58:19 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 06:58:19 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Topic: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers()
 function.
Thread-Index: AQHU8TUDZJfFc7UTyEqnLp2GuI6d2w==
Date:   Tue, 30 Apr 2019 06:58:19 +0000
Message-ID: <SN1PR12MB2431D122F3EF3085493F60ECA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555075927.git.arturp@synopsys.com>
 <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
 <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XhXc8dD8n-XEBG=tSC4Av+JW9hN-U=d3JP8vCiX5DopQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e9b0245-1cc6-4c60-0e71-08d6cd393a75
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2446;
x-ms-traffictypediagnostic: SN1PR12MB2446:
x-microsoft-antispam-prvs: <SN1PR12MB2446DC7A4C4F2703CA9E4AFCA73A0@SN1PR12MB2446.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(136003)(366004)(39850400004)(189003)(199004)(6506007)(53546011)(76176011)(4326008)(68736007)(8936002)(52536014)(64756008)(26005)(93886005)(81156014)(478600001)(81166006)(6246003)(8676002)(2906002)(5660300002)(102836004)(9686003)(76116006)(66946007)(91956017)(66476007)(66556008)(66446008)(107886003)(86362001)(99286004)(71200400001)(71190400001)(73956011)(316002)(55016002)(7696005)(54906003)(7736002)(305945005)(66066001)(6916009)(97736004)(229853002)(33656002)(74316002)(446003)(256004)(14454004)(6116002)(53936002)(186003)(25786009)(14444005)(476003)(486006)(6436002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2446;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UZE39rpFg5MaKOlZ17plSGXBBEX+2Tr37iqXj8EhheRe3Hlg/rbk8sFTUDJmH4jRRzcoNBb6FLXVyUXkaKmhAn1S2eYxjbb56nZzJvbk2zSoebzFc+oz3oTfaiJWgwNCE9gHaifXbfR6vjdVKvOQC0xw1k/TXmkcAVzjBJsTH69PD1PGshsOmTj5bpZGpxALnruUKacovGnqtiY2wEiDl6iF004uBpVVyrRje4cg9iHHb397WG9dgk3VF8GoLaK6Vlu9n3ooxRnkQtCdM4RprOBr2umS17PQc+N8dTjnQ4NbdrbKRiM+1WUqDhobKF2pRvygNZ0mefp9tBZ7MRXc6WQBM1Z57xDt9faKwz/FjHmqEruQ+axpR6vapIxPu6btfD9K9EmTFQHIQHC0hnhvjYFwSikF1c6qK4Xt49mL6E8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9b0245-1cc6-4c60-0e71-08d6cd393a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 06:58:19.5652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2446
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/29/2019 21:34, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Mon, Apr 29, 2019 at 3:51 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> On 4/27/2019 00:43, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan=0A=
>>> <arthur.petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> - Added backup of DCFG register.=0A=
>>>> - Added Set the Power-On Programming done bit.=0A=
>>>>=0A=
>>>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>>>> ---=0A=
>>>>    drivers/usb/dwc2/gadget.c | 10 ++++++++++=0A=
>>>>    1 file changed, 10 insertions(+)=0A=
>>>>=0A=
>>>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c=0A=
>>>> index 6812a8a3a98b..dcb0fbb8bc42 100644=0A=
>>>> --- a/drivers/usb/dwc2/gadget.c=0A=
>>>> +++ b/drivers/usb/dwc2/gadget.c=0A=
>>>> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_hs=
otg *hsotg, int remote_wakeup)=0A=
>>>>    {=0A=
>>>>           struct dwc2_dregs_backup *dr;=0A=
>>>>           int i;=0A=
>>>> +       u32 dctl;=0A=
>>>>=0A=
>>>>           dev_dbg(hsotg->dev, "%s\n", __func__);=0A=
>>>>=0A=
>>>> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2_h=
sotg *hsotg, int remote_wakeup)=0A=
>>>>           if (!remote_wakeup)=0A=
>>>>                   dwc2_writel(hsotg, dr->dctl, DCTL);=0A=
>>>>=0A=
>>>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_PART=
IAL) {=0A=
>>>> +               dwc2_writel(hsotg, dr->dcfg, DCFG);=0A=
>>>> +=0A=
>>>> +               /* Set the Power-On Programming done bit */=0A=
>>>> +               dctl =3D dwc2_readl(hsotg, DCTL);=0A=
>>>> +               dctl |=3D DCTL_PWRONPRGDONE;=0A=
>>>> +               dwc2_writel(hsotg, dctl, DCTL);=0A=
>>>> +       }=0A=
>>>=0A=
>>> I can't vouch one way or the other for the correctness of this change,=
=0A=
>>> but I will say that it's frustrating how asymmetric hibernate and=0A=
>>> partial power down are.  It makes things really hard to reason about.=
=0A=
>>> Is there any way you could restructure this so it happens in the same=
=0A=
>>> way between hibernate and partial power down?=0A=
>>>=0A=
>>=0A=
>>> Specifically looking at the similar sequence in=0A=
>>> dwc2_gadget_exit_hibernation() (which calls this function), I see:=0A=
>>>=0A=
>>> 1. There are some extra delays.  Are those needed for partial power dow=
n?=0A=
>> Do you mean delays in dwc2_gadget_exit_hibernation() ? If yes they are=
=0A=
>> needed for hibernation flow. What relates to delays in hibernation=0A=
>> needed for partial power down. Anything that is implemented in the=0A=
>> hibernation delays or other things are part of hibernation and are not=
=0A=
>> used in partial power down because they are two different flows of power=
=0A=
>> saving.=0A=
> =0A=
> OK, if they aren't needed for partial power down then that's fine.=0A=
> When I see two functions doing nearly the same sets of writes but one=0A=
> has delays and the other doesn't it makes me wonder if that was on=0A=
> purpose or not.=0A=
> =0A=
> =0A=
>>> 2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only=0A=
>>> happens if "not remote wakeup".  Is it truly on purpose that you don't=
=0A=
>>> do that?=0A=
>> Currently partial power down doesn't support remote wakeup flow.=0A=
> =0A=
> Oh.  What happens if you have partial power down enabled and try to=0A=
> enable remote wakeup?  Does it give an error?=0A=
As far as I have been debugging I have not seen error in that case.=0A=
=0A=
Do you mean like it should print a message saying that current partial =0A=
power down code doesn't support remote wakeup?=0A=
=0A=
> =0A=
> =0A=
>>> 3. I see that dctl gets "DCTL_PWRONPRGDONE" set as part of the=0A=
>>> sequence in the "not remote wakeup" case before calling this function.=
=0A=
>>> ...but then part of the function (that you didn't change) clobbers it,=
=0A=
>>> I think.=0A=
>>>=0A=
>> Setting device programming done bit in dwc2_gadget_exit_hibernation()=0A=
>> comes from older code and from debugging I noticed that if it is not=0A=
>> done at that point then the flow brakes.=0A=
>>=0A=
>> So in partial power down flow we need to set that bit wile restoring=0A=
>> device registers. That is why the implementation is such.=0A=
>>=0A=
>>>=0A=
>>> I have no idea if any of that is a problem but the fact that the=0A=
>>> hibernate and partial power down code runs through such different=0A=
>>> paths makes it really hard to know / reason about.  Many of those=0A=
>>> differences exist before your patch, but you're adding a new=0A=
>>> difference rather than trying to unify and that worries me.=0A=
>>>=0A=
>>>=0A=
>>=0A=
>> So to make it easy to reason about I think we should debug it. Please=0A=
>> point out where it fails. Have you tested this flow and did you see any=
=0A=
>> wrong behavior of hibernation or partial power down? if yes please=0A=
>> provide the debug logs so that they can be investigated.=0A=
>>=0A=
>> All of these patches have been tested on HAPS-DX and and Linaro HiKey=0A=
>> 960 board. These patches fix Hibernation and Partial Power down issues.=
=0A=
> =0A=
> I have no real way to test this code.  I'm only setup to use dwc2 as a=0A=
> USB host since my target device is a laptop with type A ports on it.=0A=
> Although one of the ports could be made a gadget and I could force the=0A=
> mode and use an A-to-A cable, I don't have any use cases here nor do I=0A=
> really have any experience using dwc2 as a gadget.=0A=
> =0A=
> ...so if you and others are happy with the code I won't stand in the=0A=
> way--I was just reviewing the rest of the series so I figured I'd do a=0A=
> cursory pass on this patch too.=0A=
> =0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
