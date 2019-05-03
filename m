Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46ED512991
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 10:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfECIL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 04:11:29 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:43998 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbfECIL3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 04:11:29 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E8E32C014E;
        Fri,  3 May 2019 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556871085; bh=VKDa09jD18IzljG/n0H7NAXZJtIA6KbjXKie4LYKOsI=;
        h=From:To:CC:Subject:Date:References:From;
        b=itxa/qW9m9z9deUlQpdXIdioltjar/FpmZcenLfx5YpWSDJ/MAOJdEPNv0qR0TIDF
         PTIm9e3CRww83b7ZueJrbBgMgZdmi3Dz3u/ZOEfXDXiC/QKg0FglVpgZmcUMqU6UYc
         8ZZXuTjMRWT3FYYlIXc3D2WQqLEC6kAY5ZYi/ikdgh1zrWTTZcGkoCjphuy55BvpwF
         A8LTx3CzJXopGUOqIg0AExmJwPUnBrnREtbYQjGnmXOybvS+WBQDXv7XMPcUlrgJm3
         /Rk8CiRoiIA9npfFSFsN8ZI9oEvBDHIVna0FGHBx9RdEReDYh6q9hn6zuf83GbKv9v
         iHRjMdyAlnmIg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4C737A009D;
        Fri,  3 May 2019 08:11:28 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 May 2019 01:11:28 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 3 May 2019 01:11:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwkHjNeQ+U+O2N6+zO8SxKmozQB5KnRS4hVHJza7HK8=;
 b=BnX5U2wIjcEOAXdu4vyu34/y4q7KyrCdhBcPeTUu0jiGJua9NRknrNDpq1q2NXkCrTHp8IOUdxrtZz3gTeW8xU/5vNGH+O1eqc1umWX/mi6Q/i+DfYl0sJWfhhme9uzurKdb8BfV9LzbTcGEumeKDyONTlEXX39o3N7LrxzfCxg=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0845.namprd12.prod.outlook.com (10.164.26.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Fri, 3 May 2019 08:11:25 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 08:11:25 +0000
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
Date:   Fri, 3 May 2019 08:11:25 +0000
Message-ID: <SN1PR12MB24315C6988BB24293E17B56BA7350@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555075927.git.arturp@synopsys.com>
 <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
 <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XhXc8dD8n-XEBG=tSC4Av+JW9hN-U=d3JP8vCiX5DopQ@mail.gmail.com>
 <SN1PR12MB2431D122F3EF3085493F60ECA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=Ux_egPvzCbm_fMMwT97WPXABsbdeHRQr+KUjbZ4RTijw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 050400b3-d3e9-4c43-2bef-08d6cf9eefe3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0845;
x-ms-traffictypediagnostic: SN1PR12MB0845:
x-microsoft-antispam-prvs: <SN1PR12MB08455483ACAE968DF7EDEA4EA7350@SN1PR12MB0845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39850400004)(189003)(199004)(305945005)(4326008)(66066001)(14454004)(5660300002)(7736002)(52536014)(53936002)(14444005)(256004)(74316002)(54906003)(107886003)(25786009)(81166006)(81156014)(186003)(86362001)(6436002)(478600001)(229853002)(6246003)(66446008)(316002)(73956011)(8936002)(68736007)(66556008)(64756008)(66946007)(66476007)(91956017)(76116006)(6916009)(99286004)(8676002)(55016002)(6116002)(3846002)(76176011)(6506007)(53546011)(26005)(102836004)(71200400001)(71190400001)(486006)(33656002)(7696005)(9686003)(2906002)(446003)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0845;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wop4WCg/LwxEKk8KTgJM+qBoi2B8Hz5gx+L5JCYfwWDLOMa8korZOpqWDecEbwJhMl1nP+uSwq+SWS9JyK8BSx/hptPFnGHTACcx+x4iKlfowcSEngCwk2rbPlylbtDrKOQk4eNju6CQE2FMBBsk8Pd73BghdojZw0BsPE5n8yBO898Mc42nY8ID4Sdv3kGK65RDkV6r6P6GyJI8JNz3BZea/SsXWLWrBPWVIHTImRMxWzIhf7U/k7vrko0vz0IkZdM295ei1mOyb/BYDagko9RB12JCjvRg8lscRRCouivvN3Mi56nEVr50LOuBf+ZwbBY8tf/1AaV4LtMhEkw9K2dNWtUSLMegQLHQk4HTxQbmpRSx2ywh3wxV8Ku6n4DpP0G6jmUdSpy1YZgZadu6m3AtswMI+YXa2MfO4wwsLm4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 050400b3-d3e9-4c43-2bef-08d6cf9eefe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 08:11:25.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0845
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/30/2019 19:29, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Mon, Apr 29, 2019 at 11:59 PM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> On 4/29/2019 21:34, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Mon, Apr 29, 2019 at 3:51 AM Artur Petrosyan=0A=
>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> On 4/27/2019 00:43, Doug Anderson wrote:=0A=
>>>>> Hi,=0A=
>>>>>=0A=
>>>>> On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan=0A=
>>>>> <arthur.petrosyan@synopsys.com> wrote:=0A=
>>>>>>=0A=
>>>>>> - Added backup of DCFG register.=0A=
>>>>>> - Added Set the Power-On Programming done bit.=0A=
>>>>>>=0A=
>>>>>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>>>>>> ---=0A=
>>>>>>     drivers/usb/dwc2/gadget.c | 10 ++++++++++=0A=
>>>>>>     1 file changed, 10 insertions(+)=0A=
>>>>>>=0A=
>>>>>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c=
=0A=
>>>>>> index 6812a8a3a98b..dcb0fbb8bc42 100644=0A=
>>>>>> --- a/drivers/usb/dwc2/gadget.c=0A=
>>>>>> +++ b/drivers/usb/dwc2/gadget.c=0A=
>>>>>> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_=
hsotg *hsotg, int remote_wakeup)=0A=
>>>>>>     {=0A=
>>>>>>            struct dwc2_dregs_backup *dr;=0A=
>>>>>>            int i;=0A=
>>>>>> +       u32 dctl;=0A=
>>>>>>=0A=
>>>>>>            dev_dbg(hsotg->dev, "%s\n", __func__);=0A=
>>>>>>=0A=
>>>>>> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2=
_hsotg *hsotg, int remote_wakeup)=0A=
>>>>>>            if (!remote_wakeup)=0A=
>>>>>>                    dwc2_writel(hsotg, dr->dctl, DCTL);=0A=
>>>>>>=0A=
>>>>>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_PA=
RTIAL) {=0A=
>>>>>> +               dwc2_writel(hsotg, dr->dcfg, DCFG);=0A=
>>>>>> +=0A=
>>>>>> +               /* Set the Power-On Programming done bit */=0A=
>>>>>> +               dctl =3D dwc2_readl(hsotg, DCTL);=0A=
>>>>>> +               dctl |=3D DCTL_PWRONPRGDONE;=0A=
>>>>>> +               dwc2_writel(hsotg, dctl, DCTL);=0A=
>>>>>> +       }=0A=
>>>>>=0A=
>>>>> I can't vouch one way or the other for the correctness of this change=
,=0A=
>>>>> but I will say that it's frustrating how asymmetric hibernate and=0A=
>>>>> partial power down are.  It makes things really hard to reason about.=
=0A=
>>>>> Is there any way you could restructure this so it happens in the same=
=0A=
>>>>> way between hibernate and partial power down?=0A=
>>>>>=0A=
>>>>=0A=
>>>>> Specifically looking at the similar sequence in=0A=
>>>>> dwc2_gadget_exit_hibernation() (which calls this function), I see:=0A=
>>>>>=0A=
>>>>> 1. There are some extra delays.  Are those needed for partial power d=
own?=0A=
>>>> Do you mean delays in dwc2_gadget_exit_hibernation() ? If yes they are=
=0A=
>>>> needed for hibernation flow. What relates to delays in hibernation=0A=
>>>> needed for partial power down. Anything that is implemented in the=0A=
>>>> hibernation delays or other things are part of hibernation and are not=
=0A=
>>>> used in partial power down because they are two different flows of pow=
er=0A=
>>>> saving.=0A=
>>>=0A=
>>> OK, if they aren't needed for partial power down then that's fine.=0A=
>>> When I see two functions doing nearly the same sets of writes but one=
=0A=
>>> has delays and the other doesn't it makes me wonder if that was on=0A=
>>> purpose or not.=0A=
>>>=0A=
>>>=0A=
>>>>> 2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only=0A=
>>>>> happens if "not remote wakeup".  Is it truly on purpose that you don'=
t=0A=
>>>>> do that?=0A=
>>>> Currently partial power down doesn't support remote wakeup flow.=0A=
>>>=0A=
>>> Oh.  What happens if you have partial power down enabled and try to=0A=
>>> enable remote wakeup?  Does it give an error?=0A=
>> As far as I have been debugging I have not seen error in that case.=0A=
>>=0A=
>> Do you mean like it should print a message saying that current partial=
=0A=
>> power down code doesn't support remote wakeup?=0A=
> =0A=
> Not sure.  ...why don't we just forget about this question?  I don't=0A=
> have enough gadget knowledge nor any way to test.=0A=
Ok let's forget about that.=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
