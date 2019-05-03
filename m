Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D874129A3
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 10:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfECINa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 04:13:30 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:37138 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725885AbfECIN3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 04:13:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7B06FC014B;
        Fri,  3 May 2019 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556871211; bh=7HR0dySbSwn18OTtMXJ33I4nNcoid087WeQ4vnsd9jc=;
        h=From:To:CC:Subject:Date:References:From;
        b=UbKpM1shMioODG1ItHgAGtZe+nXhKIRkeeQNOqRlVNkMYT8HSOh0mKBF9AqKZuDft
         jsJHAbAYiLhoHN6E6A0bjoBsqUWHTK5QeyomiCMHv6gMaYDXoQlXHDbwTAROhrMNV9
         eRP/Al7JQ7C4D1RlRfJ8MbCAUDjHvQediuZY+a+grv4Jd5fBDGTO3dfsC6QVj34P9u
         7tPuDXLqvsRoQGYplLh3T2ZxLvMiou86lRIEOUAwtJoVij6zNXbs0kQM1QZtbRXxOx
         lzAx5ytPSr8b99dtaQvV4T9o/oy0xvCH83zP5xHotQBuNDRguEcogzKV4dq17Eh67L
         UDdNXQVF9Yp9g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3E45DA0071;
        Fri,  3 May 2019 08:13:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 May 2019 01:13:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 3 May 2019 01:13:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19qTQG4HiGX4JvIQwoQWjetyPw5Uix37EYwQjpHK7Lg=;
 b=BZWiieB+yPUOa3UXrp45CeTdXhfkfbSJSWDocM1+C1Dr439XIGUAlrPfmlydE9eaUUJYQaxcmqUYNfqtg355GILXCOevNsB9rCnAA8b5Pn6nVWAulaayKTMlOrn/XZVCtxu+XgLmvlvxrl/s5VkVja4iBayeIglxheEH808uAqU=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0845.namprd12.prod.outlook.com (10.164.26.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Fri, 3 May 2019 08:13:26 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 08:13:26 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
Thread-Topic: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
Thread-Index: AQHU9qJndp/MtkcCnkCl/ua6u6qX5g==
Date:   Fri, 3 May 2019 08:13:26 +0000
Message-ID: <SN1PR12MB2431C88EF062A9D87FD574FAA7350@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
 <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=UdKhbgG6r+xNUx9e+2quXi_vN7NwDBxPHs-0hKmSJKzQ@mail.gmail.com>
 <SN1PR12MB243146421A3AFF32CCC341EAA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=W6d6ZZnqV5kH3G_dML83LGYu-b2K4+dnVdr=+SaRCjHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fe8d86c-35a8-42a3-1c04-08d6cf9f37e5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0845;
x-ms-traffictypediagnostic: SN1PR12MB0845:
x-microsoft-antispam-prvs: <SN1PR12MB08450105E3443311CC11866FA7350@SN1PR12MB0845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39850400004)(189003)(199004)(305945005)(4326008)(66066001)(14454004)(5660300002)(7736002)(52536014)(53936002)(14444005)(256004)(74316002)(54906003)(107886003)(25786009)(81166006)(81156014)(186003)(86362001)(6436002)(478600001)(229853002)(6246003)(66446008)(316002)(73956011)(8936002)(68736007)(66556008)(64756008)(66946007)(66476007)(91956017)(76116006)(6916009)(99286004)(8676002)(55016002)(6116002)(3846002)(15650500001)(76176011)(6506007)(53546011)(26005)(102836004)(71200400001)(71190400001)(486006)(33656002)(7696005)(9686003)(2906002)(446003)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0845;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fwjeoo6y8j04LmRqHGVDrWDMvu6d8Wrio9LB/5GA7ZpfCsmPCJ8yT+4CRylo+/ZIwEM5jXR3mSZJ5jIRioNPTqixLH8nkxUrOX1gv7pNLkKiDj8sRNkMvlyY56ZMHXbq4ao0yj/x6nWWVwUR8XfuEpTfgragdK0XyQ0p6BkJQ7jJZU7QBW67tm2c3GDbMHTRT/QpfA8oy1954v8GJoHPjULSc+p2NcM0/qwWa8oUVE0elgLVvgKt+ukrXEvOojQwToZdc1Umx6E+ssuDWwtG8C0Df3jeOP/9aVzG2+iRYA3W4FFCNthiosMJWOlYuOZfTqn/dr7svht7usR3dv9mtuJvF84zVh8E48PSaVgRfKSsn0ynoL1WSiAyMSQdUTh7WYt5AMpgFpck79pPOkfR7aqHukUcTp8hDKiZPTzwcMY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe8d86c-35a8-42a3-1c04-08d6cf9f37e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 08:13:26.2564
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

On 5/1/2019 05:55, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Tue, Apr 30, 2019 at 12:11 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> On 4/29/2019 21:35, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Mon, Apr 29, 2019 at 4:03 AM Artur Petrosyan=0A=
>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> On 4/27/2019 00:45, Doug Anderson wrote:=0A=
>>>>> Hi,=0A=
>>>>>=0A=
>>>>> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
>>>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>>>=0A=
>>>>>> - In dwc2_port_suspend() function added waiting for the=0A=
>>>>>>      HPRT0.PrtSusp register field to be set.=0A=
>>>>>>=0A=
>>>>>> - In _dwc2_hcd_suspend() function added checking of=0A=
>>>>>>      "hsotg->flags.b.port_connect_status" port connection=0A=
>>>>>>      status if port connection status is 0 then skipping=0A=
>>>>>>      power saving (entering partial power down mode).=0A=
>>>>>>      Because if there is no device connected there would=0A=
>>>>>>      be no need to enter partial power down mode.=0A=
>>>>>>=0A=
>>>>>> - Added "hsotg->bus_suspended =3D true" beceuse after=0A=
>>>>>=0A=
>>>>> s/beceuse/because=0A=
>>>>>=0A=
>>>>>>      entering partial power down in host mode the=0A=
>>>>>>      bus_suspended flag must be set.=0A=
>>>>>=0A=
>>>>> The above statement sounds to me like trying to win an argument by=0A=
>>>>> saying "I'm right because I'm right."  Can you give more details abou=
t=0A=
>>>>> why "bus_suspended" must be set?  See below also.=0A=
>>>>>=0A=
>>>> There is no intention of winning any argument.=0A=
>>>=0A=
>>> I was trying to say that your statement does not convey any=0A=
>>> information about the "why".  It just says: "I now set this variable=0A=
>>> because it needs to be set".  This tells me nothing useful because=0A=
>>> presumably if it did't need to be set then you wouldn't have set it.=0A=
>>> I want to know more information about how the code was broken before=0A=
>>> you did this.  What specifically requires this variable to be set?=0A=
>> Specifically that variable is set when core enters to hibernation or=0A=
>> partial power down.=0A=
>>>=0A=
>>>=0A=
>>>> Are you familiar with "bus_suspended" flag ? have you looked at what i=
s=0A=
>>>> it used for ?=0A=
>>>>=0A=
>>>>     * @bus_suspended:     True if bus is suspended=0A=
>>>>=0A=
>>>> So when entering to hibernation is performed bus is suspended. To=0A=
>>>> indicate that "hsotg->bus_suspended" is assigned to true.=0A=
>>>=0A=
>>> Perhaps you can help me understand what the difference is between=0A=
>>> "port suspend" and "bus suspend" on dwc2.  I think this is where my=0A=
>>> confusion lies since there are functions for both and they do subtly=0A=
>>> different things.  ...but both functions set bus_suspended.=0A=
>> dwc2_port_suspend() is a function which is called when set port feature=
=0A=
>> "USB_PORT_FEAT_SUSPEND" is asserted. Yet, bus_suspended is a variable.=
=0A=
>> That variable should be set any time that host enters to hibernation or=
=0A=
>> partial power down.=0A=
>>=0A=
>>>=0A=
>>>=0A=
>>>>>> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *h=
cd)=0A=
>>>>>>                    goto skip_power_saving;=0A=
>>>>>>            }=0A=
>>>>>>=0A=
>>>>>> +       hsotg->bus_suspended =3D true;=0A=
>>>>>> +=0A=
>>>>>=0A=
>>>>> I'm a bit unsure about this.  Specifically I note that=0A=
>>>>> _dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".=0A=
>>>>> Does that now become dead code?=0A=
>>>> No it doesn't became a dead code.=0A=
>>>=0A=
>>> Can you explain when it gets triggered, then?=0A=
>> _dwc2_hcd_resume() is triggered by the system.=0A=
>> As an example lets assume you have hibernated the PC and then you turn=
=0A=
>> the PC on. When you turn the PC back on in that case _dwc2_hcd_resume()=
=0A=
>> function is called to resume from suspended state (Hibernation/partial=
=0A=
>> power down)=0A=
> =0A=
> I think you are still not understanding my question here.  Please=0A=
> re-read it again.=0A=
Your question is "Can you explain when it gets triggered, then?" so I =0A=
have explained one case when it is triggered.=0A=
> =0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
