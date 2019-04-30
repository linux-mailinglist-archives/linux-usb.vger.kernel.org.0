Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333AFF925
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 14:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfD3MpE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 08:45:04 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:38254 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbfD3MpE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 08:45:04 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45F54C00F2;
        Tue, 30 Apr 2019 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556628301; bh=QLGldnTIiDmWWPRIKlIzySLSNl3y2kONF8OnElAAo+Q=;
        h=From:To:CC:Subject:Date:References:From;
        b=jM+dsA+AWfiCQ2968hBXR9TUSrBNiGQ8TeeXRnhP+6IIUv7UpZfTbyR7d6ciEj9BK
         /knu4iPrtknFd9VvPYDBeZ29P49j656rsU6iqhXX12b3zDcw/ool2lP3ENrj3YrBkk
         FF/5Ha1ZRWkbNJ/VQ/tOPrZvv3jf009d0yl5WuUYPTkLmoGxe/kMiPNOXWAfB36KBE
         c0yCe30x5HDiflfMuUYVZ9ALKFwkf++14P0SYxKCzucCI7dgOPTnS9bABbaKJYuEwE
         VAt37DFAjToKrDi1kSth64HD07ldoKHgLUkBbFf407BQuXlGR7umotUO4lTJl3TXI8
         rqhYOxhyOAyxA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D736A006A;
        Tue, 30 Apr 2019 12:45:03 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 30 Apr 2019 05:45:02 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Apr 2019 05:45:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vlii5k1qRFn5Y2B33TBmaPNpM87FukfmKLZMOxBNdc=;
 b=IiHOX1LbLo9txYaIsHgtMRdSVn4vxP977wgmQLFn8XE0hFaGU/mdMPQJspxaoB7xBsl7Ky4z0sbFHgtaAwGGEhqcPQqGRJWGwClLrK5xqs6CKxPDZorYxyLeoLBuILOXlHekcO0QYjF/ZehvL2x7M7BkkCMeDbryt8JxokkE8Sg=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2528.namprd12.prod.outlook.com (52.132.197.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 12:45:01 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 12:45:01 +0000
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
Date:   Tue, 30 Apr 2019 12:45:01 +0000
Message-ID: <SN1PR12MB243103882D0C119575275915A73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
 <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XFd-Uk_beUr+5djbi-93eWENGu5z5td7V3KPqpuoeiig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 176efc89-288b-4c67-9d2b-08d6cd69a92f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2528;
x-ms-traffictypediagnostic: SN1PR12MB2528:
x-microsoft-antispam-prvs: <SN1PR12MB252819376E36B3F363790588A73A0@SN1PR12MB2528.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(366004)(39850400004)(346002)(376002)(136003)(396003)(189003)(199004)(53546011)(229853002)(54906003)(81156014)(81166006)(14454004)(26005)(93886005)(97736004)(5660300002)(52536014)(478600001)(25786009)(8936002)(102836004)(6506007)(3846002)(76176011)(6116002)(8676002)(4326008)(316002)(14444005)(256004)(68736007)(305945005)(7736002)(86362001)(486006)(476003)(71200400001)(73956011)(2906002)(91956017)(53936002)(66946007)(9686003)(66446008)(107886003)(55016002)(76116006)(74316002)(64756008)(66476007)(186003)(446003)(7696005)(6916009)(71190400001)(66066001)(6246003)(33656002)(66556008)(6436002)(99286004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2528;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pKJZDXAfQs6oUXdjlxCeankgGHa2GaUx4IR7f/qQc+XLT4iEriXBOl+v6JNYxZa3SvGSUongmv0SRCO1lX91PuGxF1Y3pqosKgVTjbSjA0WXWF6xMXPRjm/NhZ5qJYTCl8dkOgwc0H0HVYl5ewl5nIYIUakhzD2A4z/1GcPqOfXcsE6gTsF0itYSltod2Okl3kCKWyccFZJY9OJ58gA4JCkHstexZbYT+Ysk5/jmCVsCkjME6csSXqEgr1vtJMUyuJ0LbBzN/p8DrtWHP2GoPuBNq1C2GiMPeyKvJLjG8cQb8NGYtrA2m+1JCN7E4Zh0cBGsboiCFsiJsrrcdS+bCpuEXsa52X6fjfDlBDySW30hajIgELmgTsfPVYqEUYiJu/03t2W4F04AJBB6Ci+sA0WjtbxkA/6yFT9ZikSrE74=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 176efc89-288b-4c67-9d2b-08d6cd69a92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 12:45:01.2213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2528
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/29/2019 21:41, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Mon, Apr 29, 2019 at 4:30 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> On 4/27/2019 00:46, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan=0A=
>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> - Added a default param "power_saving" to enable or=0A=
>>>>     disable hibernation or partial power down features.=0A=
>>>>=0A=
>>>> - Printed hibernation param in hw_params_show and=0A=
>>>>     power_saving param in params_show.=0A=
>>>>=0A=
>>>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>>>> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
>>>> ---=0A=
>>>>    drivers/usb/dwc2/core.h    |  3 +++=0A=
>>>>    drivers/usb/dwc2/debugfs.c |  2 ++=0A=
>>>>    drivers/usb/dwc2/params.c  | 19 +++++++++++++------=0A=
>>>>    3 files changed, 18 insertions(+), 6 deletions(-)=0A=
>>>>=0A=
>>>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h=0A=
>>>> index 30bab8463c96..9221933ab64e 100644=0A=
>>>> --- a/drivers/usb/dwc2/core.h=0A=
>>>> +++ b/drivers/usb/dwc2/core.h=0A=
>>>> @@ -373,6 +373,8 @@ enum dwc2_ep0_state {=0A=
>>>>     *                      case.=0A=
>>>>     *                      0 - No (default)=0A=
>>>>     *                      1 - Yes=0A=
>>>> + * @power_saving:      Specifies if power saving is enabled or not. I=
f it is=0A=
>>>> + *                     enabled power_down functionality will be enabl=
ed.=0A=
>>>>     * @power_down:         Specifies whether the controller support po=
wer_down.=0A=
>>>>     *                     If power_down is enabled, the controller wil=
l enter=0A=
>>>>     *                     power_down in both peripheral and host mode =
when=0A=
>>>=0A=
>>> Why are you adding a new parameter?  power_saving should be exactly=0A=
>>> the same as "power_down !=3D DWC2_POWER_DOWN_PARAM_NONE".  Just use tha=
t=0A=
>>> anywhere you need it.=0A=
>> Customers should have a parameter using which they will disable entire=
=0A=
>> power saving hibernation and Partial Power Down support.=0A=
>>=0A=
>> power_down is used to see which power saving mode we got=0A=
>> (hibernation/partial power down).=0A=
>>=0A=
>>>=0A=
>>> Having two parameters like you're doing is just asking for them to get=
=0A=
>>> out of sync.  ...and, in fact, I think they will get out of sync.  On=
=0A=
>>> rk3288, for instance:=0A=
>>>=0A=
>>> -> dwc2_set_default_params()=0A=
>>> ---> power_saving =3D true=0A=
>>> ---> dwc2_set_param_power_down()=0A=
>>> -----> power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL=0A=
>>> -> set_params(), which is actually dwc2_set_rk_params()=0A=
>>> ---> power_down =3D 0=0A=
>> Setting power_down =3D 0  is a wrong and old option of disabling power=
=0A=
>> saving feature because if we set power_down =3D 0 then it shows that the=
re=0A=
>> is no support for any power saving mode. That is why this patch is=0A=
>> introduced to provide an easier way of disabling power saving modes.=0A=
> =0A=
> If setting "power_down =3D 0" is wrong then please update your patch to=
=0A=
> remove all the mainline code that sets power_down to 0.  Presumably=0A=
> this means you'd want to convert that code over to using "power_saving=0A=
> =3D False".  Perhaps then I can see your vision of how this works more=0A=
> clearly.=0A=
Yes this is a good idea.=0A=
> =0A=
> NOTE: I'm curious how you envision what someone would do if they had a=0A=
> core that supported hibernation but they only wanted to enable partial=0A=
> power down.  I guess then they'd have to set "power_saving =3D True" and=
=0A=
> then "power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL"?  I guess your=0A=
> vision of the world is:=0A=
I have implemented everything based on programming guide and data book.=0A=
Core can only support hibernation or partial power down based on the =0A=
configuration parameters. There cannot be two modes simultaneously of =0A=
power saving only one of them.=0A=
=0A=
The power_down flag is set to DWC2_POWER_DOWN_PARAM_PARTIAL , =0A=
DWC2_POWER_DOWN_PARAM_HIBERNATION or DWC2_POWER_DOWN_PARAM_NONE while =0A=
checking the hw parameters. So it just indicates which power down mode =0A=
is supporting the core.=0A=
=0A=
> =0A=
> =0A=
> // Example 1: Core supports power savings but we want disabled=0A=
> // (no code since this is the default)=0A=
> =0A=
> // Example 2: Pick the best power saving available=0A=
> params->power_saving =3D True=0A=
> =0A=
> // Example 3: Supports hibernation, but we only want partial:=0A=
> params->power_saving =3D True=0A=
> params->power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL=0A=
> =0A=
> =0A=
> My vision of the world is:=0A=
> =0A=
> // Example 1: Core supports power savings but we want disabled=0A=
> params->power_down =3D DWC2_POWER_DOWN_PARAM_NONE=0A=
If we do so it will show that core doesn't support both hibernation and =0A=
partial power down but the core actually supports one of them.=0A=
=0A=
> =0A=
> // Example 2: Pick the best power saving available=0A=
> // (no code since this is the default)=0A=
> =0A=
> // Example 3: Supports hibernation, but we only want partial:=0A=
> params->power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL=0A=
There is only one mode available at one core hibernation or partial =0A=
power down.=0A=
> =0A=
> =0A=
> I like that in my vision of the world "pick the best" is the default=0A=
> (though I suppose we need to fix the driver so it actually works) and=0A=
> that there's only one variable so you don't have extra confusion.=0A=
Confusion will be when let's say core supports hibernation but you set =0A=
power_down to DWC2_POWER_DOWN_PARAM_NONE. This will mean that core =0A=
doesn't support no power saving option. But in reality it does and it is =
=0A=
hibernation for instance.=0A=
> =0A=
> =0A=
>>> ...so at the end of dwc2_init_params() you will have power_saving =3D=
=0A=
>>> true but power_down set to DWC2_POWER_DOWN_PARAM_NONE.  That seems=0A=
>>> bad.  ...and, in fact:=0A=
>>>=0A=
>>> # grep '^power' /sys/kernel/debug/*.usb/params=0A=
>>> /sys/kernel/debug/ff540000.usb/params:power_saving                  : 1=
=0A=
>>> /sys/kernel/debug/ff540000.usb/params:power_down                    : 0=
=0A=
>>> /sys/kernel/debug/ff580000.usb/params:power_saving                  : 1=
=0A=
>>> /sys/kernel/debug/ff580000.usb/params:power_down                    : 0=
=0A=
>>>=0A=
>>>=0A=
>>> ...so while you could fix all of the various set_params() functions,=0A=
>>> it seems better to just drop this patch since I don't think it buys=0A=
>>> anything.=0A=
>> I don't think we should drop this patch. Because, it is introducing the=
=0A=
>> correct way of disabling power saving (hibernation/partial power down=0A=
>> modes). Explanation is listed above.=0A=
> =0A=
> I personally see no benefit still.  It's just as clear to me for=0A=
> someone to set "power_down =3D DWC2_POWER_DOWN_PARAM_NONE" as it is to=0A=
> set "power_savings =3D False".=0A=
Your vision of the world to set "power_down =3D =0A=
DWC2_POWER_DOWN_PARAM_NONE" will indicate that there is no power saving =0A=
mode available on the core.=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
