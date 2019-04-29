Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91DD4E1C2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 14:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbfD2MBU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 08:01:20 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:33020 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727913AbfD2MBU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 08:01:20 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9A0CC0078;
        Mon, 29 Apr 2019 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556539277; bh=x4HnyVeTY5jFjuU2MozaGoXK/l8uY04RPiloG4U+brg=;
        h=From:To:CC:Subject:Date:References:From;
        b=lpZ8EU7PJhRcxjDazXCWg4D0seuoSBrCbNMPOLg6ink1irGEJBQjg3KQf9DEURL/8
         cUNoPgINOa3tuToZqtgZJiDcwqFm0McP2QrKRV6hIGQ99ij8GMcHKL9DFEerKeMpEr
         wCgfutYb6rsSnvf7WCQnjyBcFtJJ6wHyi9hxQcXUMjdT4llxWNMGc/HsDMrvE3JbP2
         MUAfdxbKVmGTXVhaICtgJA2fczVi1gI2RWkmheQyhUxRpuw1FIkdrKPB66l56067c2
         Gb+p3sDSrF9t/SIZ5qTuMKMR6gjDMLKNGV3UD210/GjfvVAUt67YKQTWQKp0xL6C2A
         ZgNIAXx/UihdQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4C27CA0091;
        Mon, 29 Apr 2019 12:01:19 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 05:01:19 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 05:01:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRfHd422jPqIG6PQz0dzOOkUgm+K0ucUiCiH7AHpbMU=;
 b=RvCcthM+g3u6TIThE/mf9XpJDEOwSLHWR5sMBUEKy++BAOYfXjyDvdQsvHvnY3BwNCdJE+X4Yae+PGySnwrOTgFV++RT/06AlBVj8Raii4Ti8n9+3AUcQpa7Tcv/caHUi3FSj2r0OkbISSvUYdKeK9MFSWE137I8j4tsfCWUSOI=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2351.namprd12.prod.outlook.com (52.132.194.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 12:01:16 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 12:01:16 +0000
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
Date:   Mon, 29 Apr 2019 12:01:16 +0000
Message-ID: <SN1PR12MB24313212A9F1574A4D00C3B3A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
 <CAD=FV=VDVhA0qzBN13=3C44mAzhDaQBUia_QADqyggSSFwKXqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c01cc6e-f455-4997-94a1-08d6cc9a6232
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2351;
x-ms-traffictypediagnostic: SN1PR12MB2351:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN1PR12MB2351333A0EDB3545722ABC36A7390@SN1PR12MB2351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(39850400004)(376002)(396003)(136003)(199004)(189003)(8676002)(486006)(305945005)(71200400001)(71190400001)(7736002)(74316002)(66476007)(73956011)(66946007)(102836004)(316002)(478600001)(66556008)(64756008)(66446008)(186003)(15650500001)(76116006)(91956017)(86362001)(33656002)(81156014)(81166006)(6916009)(68736007)(53546011)(26005)(66066001)(8936002)(6506007)(446003)(476003)(229853002)(53936002)(7696005)(99286004)(6306002)(76176011)(6246003)(6436002)(9686003)(25786009)(52536014)(966005)(3846002)(6116002)(107886003)(54906003)(256004)(14454004)(14444005)(2906002)(5660300002)(55016002)(4326008)(97736004)(21314003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2351;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GnW4KloZuPobl9OG+2vLgBaU56X2Pjp+dbL9mj+Okq6m4KItOpb1UCfa/xOkHZs8i4BuA3kShfJ5j/Wp3WcdJpcXcWe2JYyroembcgzg6npk2v2Nw3k1vI1WXVD3Qr4p6S+D7JaV0HFg7HJ/6o3b0OlnrnEN39YlDGMyzAdNMwSN1HmuV3t6QwC8SP5VE7O0uuPehJj/Bp3XFZ7GzzVAo9LwptPKAQhGi4V1eAOj9mvTIytJsFzO/ReeIXfrkmWz2X7A7wK0x4cwgO31nBc8QHSY1X/MOsKoqY7K4a3gnqMJShQ5dCw/YmMA11TOfNJ3Egnx2fFaqBIYltIAWRx/RpaGB+H0O8I56IxSLBQKDBI7cIYfoFAKIP8mgaatACVPFvN7c80pjnK1OmdBxNKLMmwovETDSAVzThj7FxKpCd4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c01cc6e-f455-4997-94a1-08d6cc9a6232
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 12:01:16.2834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2351
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/27/2019 01:01, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> Added a new flow of entering and exiting hibernation when PC is=0A=
>> hibernated or suspended.=0A=
>>=0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/hcd.c | 128 +++++++++++++++++++++++++++++++----------=
--------=0A=
>>   1 file changed, 81 insertions(+), 47 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c=0A=
>> index 45d4a3e1ebd2..f1e92a287cb1 100644=0A=
>> --- a/drivers/usb/dwc2/hcd.c=0A=
>> +++ b/drivers/usb/dwc2/hcd.c=0A=
>> @@ -4510,35 +4510,54 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd=
)=0A=
>>          if (hsotg->op_state =3D=3D OTG_STATE_B_PERIPHERAL)=0A=
>>                  goto unlock;=0A=
>>=0A=
>> -       if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIAL =
||=0A=
>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE |=
|=0A=
>>              hsotg->flags.b.port_connect_status =3D=3D 0)=0A=
>>                  goto skip_power_saving;=0A=
>>=0A=
>> -       /*=0A=
>> -        * Drive USB suspend and disable port Power=0A=
>> -        * if usb bus is not suspended.=0A=
>> -        */=0A=
>> -       if (!hsotg->bus_suspended) {=0A=
>> -               hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>> -               hprt0 |=3D HPRT0_SUSP;=0A=
>> -               hprt0 &=3D ~HPRT0_PWR;=0A=
>> -               dwc2_writel(hsotg, hprt0, HPRT0);=0A=
>> -               spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> -               dwc2_vbus_supply_exit(hsotg);=0A=
>> -               spin_lock_irqsave(&hsotg->lock, flags);=0A=
>> -       }=0A=
>> +       switch (hsotg->params.power_down) {=0A=
>> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:=0A=
>> +               /*=0A=
>> +                * Drive USB suspend and disable port Power=0A=
>> +                * if usb bus is not suspended.=0A=
>> +                */=0A=
>> +               if (!hsotg->bus_suspended) {=0A=
>> +                       hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>> +                       hprt0 |=3D HPRT0_SUSP;=0A=
>> +                       hprt0 &=3D ~HPRT0_PWR;=0A=
>> +                       dwc2_writel(hsotg, hprt0, HPRT0);=0A=
>> +                       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> +                       dwc2_vbus_supply_exit(hsotg);=0A=
>> +                       spin_lock_irqsave(&hsotg->lock, flags);=0A=
>> +               }=0A=
>>=0A=
>> -       /* Enter partial_power_down */=0A=
>> -       ret =3D dwc2_enter_partial_power_down(hsotg);=0A=
>> -       if (ret) {=0A=
>> -               if (ret !=3D -ENOTSUPP)=0A=
>> -                       dev_err(hsotg->dev,=0A=
>> -                               "enter partial_power_down failed\n");=0A=
>> +               /* Enter partial_power_down */=0A=
>> +               ret =3D dwc2_enter_partial_power_down(hsotg);=0A=
>> +               if (ret) {=0A=
>> +                       if (ret !=3D -ENOTSUPP)=0A=
>> +                               dev_err(hsotg->dev,=0A=
>> +                                       "enter partial_power_down failed=
\n");=0A=
>> +                       goto skip_power_saving;=0A=
>> +               }=0A=
>> +               hsotg->bus_suspended =3D true;=0A=
>> +               break;=0A=
>> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:=0A=
>> +               if (!hsotg->bus_suspended) {=0A=
> =0A=
> Do you have any idea why for DWC2_POWER_DOWN_PARAM_PARTIAL we still=0A=
> call dwc2_enter_partial_power_down() even if bus_suspended is true,=0A=
> but for hibernate you don't call dwc2_enter_hibernation()?=0A=
For Hibernation I do call dwc2_enter_hibernation().=0A=
=0A=
> =0A=
> =0A=
>> +                       /* Enter hibernation */=0A=
>> +                       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> +                       ret =3D dwc2_enter_hibernation(hsotg, 1);=0A=
>> +                       spin_lock_irqsave(&hsotg->lock, flags);=0A=
>> +                       if (ret && ret !=3D -ENOTSUPP)=0A=
>> +                               dev_err(hsotg->dev,=0A=
>> +                                       "%s: enter hibernation failed\n"=
,=0A=
>> +                                       __func__);=0A=
> =0A=
> nit: no __func__ in dev_xxx() error messages.  The device plus the=0A=
> message should be enough.  Only resort to __func__ if you're forced to=0A=
> do an error message without a "struct device *".=0A=
This code comes form previous implementations I have not touched it not =0A=
to back anything.=0A=
=0A=
> =0A=
> nit: as per my comments in an earlier patch, remove special case for -ENO=
TSUPP=0A=
> =0A=
> Also, presumably you want to match the error handling in=0A=
> DWC2_POWER_DOWN_PARAM_PARTIAL and do a "goto skip_power_saving" when=0A=
> you see an error?=0A=
When there is an error power_saving should be skipped.=0A=
=0A=
> =0A=
> =0A=
>> +               } else {=0A=
>> +                       goto skip_power_saving;=0A=
>> +               }=0A=
>> +               break;=0A=
>> +       default:=0A=
>>                  goto skip_power_saving;=0A=
>>          }=0A=
>>=0A=
>> -       hsotg->bus_suspended =3D true;=0A=
>> -=0A=
> =0A=
> It's a bit weird to remove this, but I guess it just got moved to the=0A=
> partial power down case?  ...and in the hibernate case you're relying=0A=
> on the hibernate function to set this?  Yet another frustratingly=0A=
> asymmetric code structure...Enter hibernation implements setting bus_susp=
end so I don't touch this.=0A=
Actually this patch set fixes issues it doesn't clean up everything =0A=
related to hibernation or partial power down.=0A=
=0A=
> =0A=
> =0A=
>>          /* Ask phy to be suspended */=0A=
>>          if (!IS_ERR_OR_NULL(hsotg->uphy)) {=0A=
>>                  spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> @@ -4564,17 +4583,17 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)=
=0A=
>>          int ret =3D 0;=0A=
>>          u32 hprt0;=0A=
>>=0A=
>> -       hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>> -=0A=
>>          spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>=0A=
>> -       if (dwc2_is_device_mode(hsotg))=0A=
>> +       if (!hsotg->bus_suspended)=0A=
> =0A=
> As per my comments above I don't have a good grasp on what=0A=
> "bus_suspended" is for.  ...that being said, if your change here is=0A=
> actually correct then you probably (?) want to remove the "if=0A=
> (hsotg->bus_suspended)" check later in this same function.=0A=
> =0A=
> Said another way, you've now got code that looks like:=0A=
> =0A=
> if (!hsotg->bus_suspended)=0A=
>    goto exit;=0A=
> =0A=
> /* code that I think doesn't touch bus_suspended */=0A=
> =0A=
> if (hsotg->bus_suspended) {=0A=
>    /* do something */=0A=
> } else {=0A=
>    /* do something else */=0A=
> }=0A=
> =0A=
> Presumably the "do something" is now dead code?=0A=
> =0A=
That part is not dad because if hsotg->bus_suspended is true =0A=
resuming/exiting from suspend/partial power down/hibernation should be =0A=
performed.=0A=
On the other hand if hsotg->bus_suspended is false there is no need to =0A=
resume.=0A=
=0A=
So of course if core is not suspended the code responsible for resuming =0A=
should not be called. In that sense the code can be called dead.=0A=
=0A=
> =0A=
>>                  goto unlock;=0A=
>>=0A=
>>          if (hsotg->lx_state !=3D DWC2_L2)=0A=
>>                  goto unlock;=0A=
>>=0A=
>> -       if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIAL =
||=0A=
>> +       hprt0 =3D dwc2_read_hprt0(hsotg);=0A=
>> +=0A=
>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE |=
|=0A=
>>              hprt0 & HPRT0_CONNSTS) {=0A=
>>                  hsotg->lx_state =3D DWC2_L0;=0A=
>>                  goto unlock;=0A=
>> @@ -4597,36 +4616,51 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)=
=0A=
>>                  spin_lock_irqsave(&hsotg->lock, flags);=0A=
>>          }=0A=
>>=0A=
>> -       /* Exit partial_power_down */=0A=
>> -       ret =3D dwc2_exit_partial_power_down(hsotg, true);=0A=
>> -       if (ret && (ret !=3D -ENOTSUPP))=0A=
>> -               dev_err(hsotg->dev, "exit partial_power_down failed\n");=
=0A=
>> +       switch (hsotg->params.power_down) {=0A=
>> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:=0A=
>>=0A=
>> -       hsotg->lx_state =3D DWC2_L0;=0A=
>> +               /* Exit partial_power_down */=0A=
>> +               ret =3D dwc2_exit_partial_power_down(hsotg, true);=0A=
>> +               if (ret && (ret !=3D -ENOTSUPP))=0A=
>> +                       dev_err(hsotg->dev, "exit partial_power_down fai=
led\n");=0A=
>>=0A=
>> -       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> +               hsotg->lx_state =3D DWC2_L0;=0A=
>>=0A=
>> -       if (hsotg->bus_suspended) {=0A=
>> -               spin_lock_irqsave(&hsotg->lock, flags);=0A=
>> -               hsotg->flags.b.port_suspend_change =3D 1;=0A=
>>                  spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> -               dwc2_port_resume(hsotg);=0A=
>> -       } else {=0A=
>> -               dwc2_vbus_supply_init(hsotg);=0A=
>>=0A=
>> -               /* Wait for controller to correctly update D+/D- level *=
/=0A=
>> -               usleep_range(3000, 5000);=0A=
>> +               if (hsotg->bus_suspended) {=0A=
>> +                       spin_lock_irqsave(&hsotg->lock, flags);=0A=
>> +                       hsotg->flags.b.port_suspend_change =3D 1;=0A=
>> +                       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> +                       dwc2_port_resume(hsotg);=0A=
>> +               } else {=0A=
>> +                       dwc2_vbus_supply_init(hsotg);=0A=
>>=0A=
>> -               /*=0A=
>> -                * Clear Port Enable and Port Status changes.=0A=
>> -                * Enable Port Power.=0A=
>> -                */=0A=
>> -               dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |=0A=
>> +                       /* Wait for controller to correctly update D+/D-=
 level */=0A=
>> +                       usleep_range(3000, 5000);=0A=
>> +=0A=
>> +                       /*=0A=
>> +                        * Clear Port Enable and Port Status changes.=0A=
>> +                        * Enable Port Power.=0A=
>> +                        */=0A=
>> +                       dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |=
=0A=
>>                                  HPRT0_ENACHG, HPRT0);=0A=
>> -               /* Wait for controller to detect Port Connect */=0A=
>> -               usleep_range(5000, 7000);=0A=
>> +                       /* Wait for controller to detect Port Connect */=
=0A=
>> +                       usleep_range(5000, 7000);=0A=
>> +               }=0A=
>> +               break;=0A=
>> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:=0A=
>> +=0A=
>> +               /* Exit host hibernation. */=0A=
>> +               if (hsotg->hibernated)=0A=
>> +                       dwc2_exit_hibernation(hsotg, 0, 0, 1);=0A=
>> +               break;=0A=
>> +       default:=0A=
>> +               goto unlock;=0A=
>>          }=0A=
>>=0A=
>> +       spin_unlock_irqrestore(&hsotg->lock, flags);=0A=
>> +=0A=
> =0A=
> I'm pretty curious if you tested DWC2_POWER_DOWN_PARAM_PARTIAL after=0A=
> applying your patch series.  As far as I can tell your switch=0A=
> statement for DWC2_POWER_DOWN_PARAM_PARTIAL will "break" with the=0A=
> spinlock already unlocked.  ...so you'll run spin_unlock_irqrestore=0A=
> twice.  Is that really legit?=0A=
I have tested the patches on HAPS-DX and Linaro HiKey 960 boards.=0A=
=0A=
> =0A=
> =0A=
> =0A=
> NOTE: in case it helps you, I've attempted to rebase this atop my=0A=
> series.  Please double-check that I didn't mess anything up, though=0A=
> =0A=
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromium.googlesou=
rce.com_chromiumos_third-5Fparty_kernel_-2Blog_refs_sandbox_dianders_190426=
-2Ddwc2-2Dstuff&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVr=
rlYOeOQjP_HlVzYqrC_D7niMJI&m=3D2xJPvFyQhKsjBCMYd6_Kpb7_r7HPUAoeJHcQmBH80Gc&=
s=3DwEgbdpKgC9t9CfXpI8awXLos9GuRcsNEkpW09dgMxiw&e=3D=0A=
> =0A=
> =0A=
> ...with that a quick test seems to show that partial power down is=0A=
> sorta working on rk3288 now.  I _think_ I saw one case where hotplug=0A=
> failed but I've seen several where it works.  ...unfortunately it=0A=
> seems to break when I do hotplug on the port where I have=0A=
> "snps,reset-phy-on-wake" set.=0A=
You can provide debug logs for that scenario I will try to help you fix =0A=
issues with that.=0A=
=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
