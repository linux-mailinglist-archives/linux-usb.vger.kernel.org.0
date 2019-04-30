Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B447BF982
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 15:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfD3NGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 09:06:54 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:40598 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbfD3NGx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 09:06:53 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93AADC0131;
        Tue, 30 Apr 2019 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556629614; bh=AeLp7DLn9RhdfE5K2Zy2V9GfFSG8dKoPyhNys87bjEA=;
        h=From:To:CC:Subject:Date:References:From;
        b=lUtszDY+9zbyKg04DCRgn/902qOq04yEh8lmf3xCT6H5YpLt8p+mD9wYLG2NaoCc3
         EUvRmVDWJuihH97GW1qiORFOt5Qvc+ujtgPU7KkKXG1bOOriURBxqtVPl3odyEHrzb
         97PaLEiA9ljt2/YJ13lDbUdYD/oZAgNgCjc20e3VMxXD3krnEaTLFJF+wcqUKnSeUd
         uHuKO8c4+sNsKzvN2aDIghl9UpTV07AhMaVfeOO38RcXXHwg0pa7t7eocVehaBd6JV
         yEHKLXzktkorXMk28ue0yP5zvuZjyMCJaNsdH9eB7UnUQAkzdf+FTz915F4GEgY/10
         EaCphN3XmBebQ==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 06EA9A009D;
        Tue, 30 Apr 2019 13:06:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 30 Apr 2019 06:06:10 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Apr 2019 06:06:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh5lwWCzaEQxzTs1J6cfEtawRrD643Imggt2HYz8sSI=;
 b=k6remqtXWMcTQOx4NPtQdw39Nv/HTcr0bHsxdaR0IMK6oUOYisxLbbf9NTrMsLaO2XH1voKhvsz0duy+je+m9Zd8bsFVCg8YzTEq9byOTtHa1x4dLbXW0rVIwUeTpJMQHv6rGWN85l9wjyQJnX7Z7LMI1/wtBGn540fDGhWbIKY=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0797.namprd12.prod.outlook.com (10.164.26.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 13:06:07 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 13:06:07 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from
 system issued suspend/resume
Thread-Topic: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from
 system issued suspend/resume
Thread-Index: AQHU9qKj4BXfhuera0qVm1faf23VEw==
Date:   Tue, 30 Apr 2019 13:06:07 +0000
Message-ID: <SN1PR12MB24315519D85A229D0E7486E0A73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
 <CAD=FV=VDVhA0qzBN13=3C44mAzhDaQBUia_QADqyggSSFwKXqQ@mail.gmail.com>
 <SN1PR12MB24313212A9F1574A4D00C3B3A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=WmXZFf8dutJn22xJ2NRSpiUyjmkJVAy6h0ykqmUG4tkw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e57f2772-60f7-4acb-976d-08d6cd6c9bc9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0797;
x-ms-traffictypediagnostic: SN1PR12MB0797:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN1PR12MB0797AD167EC40C446330DAE2A73A0@SN1PR12MB0797.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39850400004)(366004)(136003)(396003)(199004)(189003)(6506007)(86362001)(25786009)(74316002)(93886005)(68736007)(186003)(76176011)(966005)(15650500001)(53546011)(66066001)(97736004)(6436002)(102836004)(4326008)(55016002)(53936002)(26005)(6306002)(9686003)(14454004)(478600001)(6246003)(71190400001)(71200400001)(54906003)(5660300002)(91956017)(7696005)(76116006)(446003)(30864003)(66946007)(66446008)(66556008)(66476007)(316002)(73956011)(64756008)(8936002)(229853002)(3846002)(8676002)(99286004)(7736002)(107886003)(305945005)(81156014)(33656002)(2906002)(14444005)(6116002)(476003)(486006)(256004)(81166006)(6916009)(52536014)(21314003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0797;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h/AmRDTw7A8qQHVzWTJqT1m2Go7J9SpuNFmukicTURCyX6kkx2sCz+hW5QxRI7dlGXOMojk9VcomeYvhckDA5ug9jZ7BIIF7sFJoOwkY8lNdbrfUBblE/vQpMdSwNAwpMOrDZu6crA1vdLmBg4fpT26ZRIvMkU41ubhDKFO7HYQEHMEwO+HLwhVb46eaZJkXGejQpT/N2ccViU4fdrc29qDWaa2tURF/em6xPFWXLRS2CDmyt37o3aDMUgDub9Vq5s5jn3R3UKwT59AArxM8o+yFm2vAahsKLQELq3x5F6QV7HCdEQSsS7GLF/dsXhzJQ15aJoROEIXc9dpIAWzVGH9+dkt7WRYHCnCMp5WorlY5wGsIk1n6ONLRfq16T1eEwWsHDVlHh6CZFLA7ROPTu2+GSu4CXxuIZ9vQgaF3hs4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e57f2772-60f7-4acb-976d-08d6cd6c9bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:06:07.2325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0797
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/29/2019 21:43, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Mon, Apr 29, 2019 at 5:01 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> On 4/27/2019 01:01, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> Added a new flow of entering and exiting hibernation when PC is=0A=
>>>> hibernated or suspended.=0A=
>>>>=0A=
>>>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>>>> ---=0A=
>>>>    drivers/usb/dwc2/hcd.c | 128 +++++++++++++++++++++++++++++++-------=
-----------=0A=
>>>>    1 file changed, 81 insertions(+), 47 deletions(-)=0A=
>>>>=0A=
>>>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c=0A=
>>>> index 45d4a3e1ebd2..f1e92a287cb1 100644=0A=
>>>> --- a/drivers/usb/dwc2/hcd.c=0A=
>>>> +++ b/drivers/usb/dwc2/hcd.c=0A=
>>>> @@ -4510,35 +4510,54 @@ static int _dwc2_hcd_suspend(struct usb_hcd *h=
cd)=0A=
>>>>           if (hsotg->op_state =3D=3D OTG_STATE_B_PERIPHERAL)=0A=
>>>>                   goto unlock;=0A=
>>>>=0A=
>>>> -       if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIA=
L ||=0A=
>>>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE=
 ||=0A=
>>>>               hsotg->flags.b.port_connect_status =3D=3D 0)=0A=
>>>>                   goto skip_power_saving;=0A=
>>>>=0A=
>>>> -       /*=0A=
>>>> -        * Drive USB suspend and disable port Power=0A=
>>>> -        * if usb bus is not suspended.=0A=
>>>> -        */=0A=
>>>> -       if (!hsotg->bus_suspended) {=0A=
>>>> -               hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>>>> -               hprt0 |=3D HPRT0_SUSP;=0A=
>>>> -               hprt0 &=3D ~HPRT0_PWR;=0A=
>>>> -               dwc2_writel(hsotg, hprt0, HPRT0);=0A=
>>>> -               spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>>>> -               dwc2_vbus_supply_exit(hsotg);=0A=
>>>> -               spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>>> -       }=0A=
>>>> +       switch (hsotg->params.power_down) {=0A=
>>>> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:=0A=
>>>> +               /*=0A=
>>>> +                * Drive USB suspend and disable port Power=0A=
>>>> +                * if usb bus is not suspended.=0A=
>>>> +                */=0A=
>>>> +               if (!hsotg->bus_suspended) {=0A=
>>>> +                       hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>>>> +                       hprt0 |=3D HPRT0_SUSP;=0A=
>>>> +                       hprt0 &=3D ~HPRT0_PWR;=0A=
>>>> +                       dwc2_writel(hsotg, hprt0, HPRT0);=0A=
>>>> +                       spin_unlock_irqrestore(&hsotg->lock, flags);=
=0A=
>>>> +                       dwc2_vbus_supply_exit(hsotg);=0A=
>>>> +                       spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>>> +               }=0A=
>>>>=0A=
>>>> -       /* Enter partial_power_down */=0A=
>>>> -       ret =3D dwc2_enter_partial_power_down(hsotg);=0A=
>>>> -       if (ret) {=0A=
>>>> -               if (ret !=3D -ENOTSUPP)=0A=
>>>> -                       dev_err(hsotg->dev,=0A=
>>>> -                               "enter partial_power_down failed\n");=
=0A=
>>>> +               /* Enter partial_power_down */=0A=
>>>> +               ret =3D dwc2_enter_partial_power_down(hsotg);=0A=
>>>> +               if (ret) {=0A=
>>>> +                       if (ret !=3D -ENOTSUPP)=0A=
>>>> +                               dev_err(hsotg->dev,=0A=
>>>> +                                       "enter partial_power_down fail=
ed\n");=0A=
>>>> +                       goto skip_power_saving;=0A=
>>>> +               }=0A=
>>>> +               hsotg->bus_suspended =3D true;=0A=
>>>> +               break;=0A=
>>>> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:=0A=
>>>> +               if (!hsotg->bus_suspended) {=0A=
>>>=0A=
>>> Do you have any idea why for DWC2_POWER_DOWN_PARAM_PARTIAL we still=0A=
>>> call dwc2_enter_partial_power_down() even if bus_suspended is true,=0A=
>>> but for hibernate you don't call dwc2_enter_hibernation()?=0A=
>> For Hibernation I do call dwc2_enter_hibernation().=0A=
> =0A=
> Maybe you didn't understand the question.  I'll be clearer.=0A=
> =0A=
> Imagine _dwc2_hcd_suspend() is called but "bus_suspended" is already=0A=
> true at the start of the function.=0A=
> =0A=
> If we're in DWC2_POWER_DOWN_PARAM_PARTIAL, _dwc2_hcd_suspend() _will_=0A=
> call dwc2_enter_partial_power_down()=0A=
> =0A=
> If we're in DWC2_POWER_DOWN_PARAM_HIBERNATION, _dwc2_hcd_suspend()=0A=
> _will NOT_ call dwc2_enter_partial_power_down()=0A=
So what? why should dwc2_enter_partial_power_down() be called when we =0A=
have power_down =3D=3D DWC2_POWER_DOWN_PARAM_HIBERNATION ?=0A=
=0A=
So what the switch statement basically does is that it checks if core =0A=
supports partial power down then it calls dwc2_enter_partial_power_down()=
=0A=
if core supports hibernation it calls=0A=
dwc2_enter_hibernation();=0A=
=0A=
> =0A=
> =0A=
> This is all part of the whole asymmetry between PARTIAL and=0A=
> HIBERNATION that makes it hard to understand.=0A=
See partial power down and hibernation are actually two separate =0A=
implementations.=0A=
1. When core supports partial power down we enter to partial power down.=0A=
2. When core supports Hibernation we enter to Hibernation=0A=
3. If core doesn't support none of them we just skip the power saving.=0A=
=0A=
So the switch statement checks the availability of one of the power =0A=
saving modes and then calls either dwc2_enter_hibernation() or =0A=
dwc2_enter_partial_power_down().=0A=
=0A=
> =0A=
> =0A=
>>>> +                       /* Enter hibernation */=0A=
>>>> +                       spin_unlock_irqrestore(&hsotg->lock, flags);=
=0A=
>>>> +                       ret =3D dwc2_enter_hibernation(hsotg, 1);=0A=
>>>> +                       spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>>> +                       if (ret && ret !=3D -ENOTSUPP)=0A=
>>>> +                               dev_err(hsotg->dev,=0A=
>>>> +                                       "%s: enter hibernation failed\=
n",=0A=
>>>> +                                       __func__);=0A=
>>>=0A=
>>> nit: no __func__ in dev_xxx() error messages.  The device plus the=0A=
>>> message should be enough.  Only resort to __func__ if you're forced to=
=0A=
>>> do an error message without a "struct device *".=0A=
>> This code comes form previous implementations I have not touched it not=
=0A=
>> to back anything.=0A=
> =0A=
> Please fix.  Even if you had internal code that did this it still=0A=
> needs to be fixed when going upstream.  It is highly unlikely you'll=0A=
> break something when removing something like this.=0A=
> =0A=
> =0A=
> =0A=
>>> nit: as per my comments in an earlier patch, remove special case for -E=
NOTSUPP=0A=
>>>=0A=
>>> Also, presumably you want to match the error handling in=0A=
>>> DWC2_POWER_DOWN_PARAM_PARTIAL and do a "goto skip_power_saving" when=0A=
>>> you see an error?=0A=
>> When there is an error power_saving should be skipped.=0A=
> =0A=
> OK, so you agree?=0A=
Agree that if there is an error en entering to hibernation then power =0A=
saving should be skipped.=0A=
> =0A=
> =0A=
>>>> +               } else {=0A=
>>>> +                       goto skip_power_saving;=0A=
>>>> +               }=0A=
>>>> +               break;=0A=
>>>> +       default:=0A=
>>>>                   goto skip_power_saving;=0A=
>>>>           }=0A=
>>>>=0A=
>>>> -       hsotg->bus_suspended =3D true;=0A=
>>>> -=0A=
>>>=0A=
>>> It's a bit weird to remove this, but I guess it just got moved to the=
=0A=
>>> partial power down case?  ...and in the hibernate case you're relying=
=0A=
>>> on the hibernate function to set this?  Yet another frustratingly=0A=
>>> asymmetric code structure...=0A=
>> Enter hibernation implements setting bus_suspend so I don't touch this.=
=0A=
>> Actually this patch set fixes issues it doesn't clean up everything=0A=
>> related to hibernation or partial power down.=0A=
> =0A=
> Yet more asymmetry.=0A=
> =0A=
> =0A=
>>>>           /* Ask phy to be suspended */=0A=
>>>>           if (!IS_ERR_OR_NULL(hsotg->uphy)) {=0A=
>>>>                   spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>>>> @@ -4564,17 +4583,17 @@ static int _dwc2_hcd_resume(struct usb_hcd *hc=
d)=0A=
>>>>           int ret =3D 0;=0A=
>>>>           u32 hprt0;=0A=
>>>>=0A=
>>>> -       hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>>>> -=0A=
>>>>           spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>>>=0A=
>>>> -       if (dwc2_is_device_mode(hsotg))=0A=
>>>> +       if (!hsotg->bus_suspended)=0A=
>>>=0A=
>>> As per my comments above I don't have a good grasp on what=0A=
>>> "bus_suspended" is for.  ...that being said, if your change here is=0A=
>>> actually correct then you probably (?) want to remove the "if=0A=
>>> (hsotg->bus_suspended)" check later in this same function.=0A=
>>>=0A=
>>> Said another way, you've now got code that looks like:=0A=
>>>=0A=
>>> if (!hsotg->bus_suspended)=0A=
>>>     goto exit;=0A=
>>>=0A=
>>> /* code that I think doesn't touch bus_suspended */=0A=
>>>=0A=
>>> if (hsotg->bus_suspended) {=0A=
>>>     /* do something */=0A=
>>> } else {=0A=
>>>     /* do something else */=0A=
>>> }=0A=
>>>=0A=
>>> Presumably the "do something" is now dead code?=0A=
>>>=0A=
>> That part is not dad because if hsotg->bus_suspended is true=0A=
>> resuming/exiting from suspend/partial power down/hibernation should be=
=0A=
>> performed.=0A=
>> On the other hand if hsotg->bus_suspended is false there is no need to=
=0A=
>> resume.=0A=
>>=0A=
>> So of course if core is not suspended the code responsible for resuming=
=0A=
>> should not be called. In that sense the code can be called dead.=0A=
> =0A=
> I think I didn't explain it well.  Does this patch help you?=0A=
> =0A=
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromium.googlesou=
rce.com_chromiumos_third-5Fparty_kernel_-2B_4e84efdbeb74bcb8b24e2b1fea24153=
981acc185-255E-2521_&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBj=
JhGVrrlYOeOQjP_HlVzYqrC_D7niMJI&m=3DnZWkYoZKaqSi_evQfEH0uCUKIXb5UZydmgRSXsV=
wSOs&s=3Dh-ZqBu_CidHWrCH6sAbTi1ddgSfHkYjwSfCOGjpHbRM&e=3D=0A=
No it doesn't.=0A=
=0A=
This is diff from your suggestion.=0A=
=0A=
hsotg->lx_state =3D DWC2_L0;=0A=
=0A=
+		hsotg->flags.b.port_suspend_change =3D 1;=0A=
Why are you setting this ?=0A=
=0A=
  		spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
-=0A=
-		if (hsotg->bus_suspended) {=0A=
-			spin_lock_irqsave(&hsotg->lock, flags);=0A=
-			hsotg->flags.b.port_suspend_change =3D 1;=0A=
-			spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
-			dwc2_port_resume(hsotg);=0A=
You have removed this but it should be called when we exit from partial =0A=
power down.=0A=
Have you performed testes on this? I am not sure that this is a working =0A=
code.=0A=
=0A=
-		} else {=0A=
-			dwc2_vbus_supply_init(hsotg);=0A=
-=0A=
-			/* Wait for controller to correctly update D+/D- level */=0A=
-			usleep_range(3000, 5000);=0A=
-=0A=
-			/*=0A=
-			 * Clear Port Enable and Port Status changes.=0A=
-			 * Enable Port Power.=0A=
-			 */=0A=
-			dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |=0A=
-				HPRT0_ENACHG, HPRT0);=0A=
-			/* Wait for controller to detect Port Connect */=0A=
-			usleep_range(5000, 7000);=0A=
-		}=0A=
+		dwc2_port_resume(hsotg);=0A=
  		break;=0A=
=0A=
=0A=
=0A=
> =0A=
> =0A=
>>>> +       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>>>> +=0A=
>>>=0A=
>>> I'm pretty curious if you tested DWC2_POWER_DOWN_PARAM_PARTIAL after=0A=
>>> applying your patch series.  As far as I can tell your switch=0A=
>>> statement for DWC2_POWER_DOWN_PARAM_PARTIAL will "break" with the=0A=
>>> spinlock already unlocked.  ...so you'll run spin_unlock_irqrestore=0A=
>>> twice.  Is that really legit?=0A=
>> I have tested the patches on HAPS-DX and Linaro HiKey 960 boards.=0A=
> =0A=
> How is it possible that you don't end up spin unlocking more than=0A=
> once?  This seems like a pretty serious problem.=0A=
> =0A=
> My guess is that whatever tests you ran didn't actually exercise this=0A=
> function.  Personally I could only get it to exercise by doing=0A=
> suspend/resume.=0A=
> =0A=
> ...and when I did, sure enough I saw:=0A=
> =0A=
> BUG: spinlock already unlocked on CPU#2, kworker/u8:32/5812=0A=
I will debug it once more.=0A=
> =0A=
> =0A=
>>> ...with that a quick test seems to show that partial power down is=0A=
>>> sorta working on rk3288 now.  I _think_ I saw one case where hotplug=0A=
>>> failed but I've seen several where it works.  ...unfortunately it=0A=
>>> seems to break when I do hotplug on the port where I have=0A=
>>> "snps,reset-phy-on-wake" set.=0A=
>> You can provide debug logs for that scenario I will try to help you fix=
=0A=
>> issues with that.=0A=
> =0A=
> All you need to do is make sure you run the function=0A=
> _dwc2_hcd_suspend() with power down mode set to=0A=
> "DWC2_POWER_DOWN_PARAM_PARTIAL".  ...or walk through the code and see=0A=
> that spin_unlock_irqrestore() will certainly be called twice.=0A=
I hibernate the PC it enters to partial power down then I turn PC on =0A=
everything works fine. But I will check this one more time.=0A=
> =0A=
> =0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
