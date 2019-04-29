Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D03E0FF
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 13:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbfD2LDT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 07:03:19 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:57446 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727710AbfD2LDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 07:03:19 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD12DC0049;
        Mon, 29 Apr 2019 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556535796; bh=cL6RpWcIA58Eb/k4yW2BQ8FuL6HLXKKIeD8fCJINmDc=;
        h=From:To:CC:Subject:Date:References:From;
        b=JsLmgSAffrB/DSS++S4hKbU39GaPHiujb1ftDLJyC+AQXsfnGO67y5ebw/g8Sntjw
         mzFyh9BsX+9zCQ41d7xBif/s7W1811il/ElHmiPr91qF0LHgIPTokl8+8ZB/aqXsJ3
         aUn5jvUIrA8BeIiiZDkQNQCa1Mf4iE910UGe+3rL8ruHCmE7UIPWaQ0qUJtqF1YmbL
         FSb/EbYetjjCD5/0uJmt3b55sXlj4gxZ+yoOrySA4TD8Y0A7HGWcBK8S71VRlTQaK5
         PoDaOK8h+GGXrYGGSRan4YOtglj5NGrC7ljumyHVqLYy4NrWkTOt9iZkRweFx0kIw2
         xtmgADeceTRKg==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 68E46A005D;
        Mon, 29 Apr 2019 11:03:18 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 04:03:18 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 04:03:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dfUtnsXaKW2isi4fVayyptY4r3LGvwbe52zZOicWV0=;
 b=qqJQzgYlTS6HwATmTgb169+DUtfF+LgqqFcd6dfuTXFtdjcbX1SJphLbhwYEqadyN/C2rQbg4oG7hy3hayM73n0QrreboTlw3KSVZNY8PFltV+mWTj3vJBMFS4S5A+krhroKnIrZ8HQOtHAs/Ld6wytrCsbs5u6XkbKhIwvH3IA=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2510.namprd12.prod.outlook.com (52.132.196.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 11:03:16 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 11:03:16 +0000
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
Date:   Mon, 29 Apr 2019 11:03:16 +0000
Message-ID: <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1843789-b126-4e85-350a-08d6cc92480d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2510;
x-ms-traffictypediagnostic: SN1PR12MB2510:
x-microsoft-antispam-prvs: <SN1PR12MB251001FFB5AECA8ED17273EEA7390@SN1PR12MB2510.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(366004)(39850400004)(346002)(189003)(199004)(14454004)(305945005)(76176011)(74316002)(256004)(478600001)(25786009)(14444005)(6436002)(6916009)(5660300002)(73956011)(66946007)(91956017)(71200400001)(71190400001)(4326008)(66066001)(76116006)(66476007)(66556008)(86362001)(229853002)(52536014)(64756008)(66446008)(7736002)(446003)(6246003)(54906003)(33656002)(107886003)(7696005)(316002)(486006)(476003)(186003)(26005)(68736007)(6506007)(53546011)(102836004)(15650500001)(81166006)(8676002)(81156014)(55016002)(99286004)(53936002)(8936002)(2906002)(97736004)(3846002)(6116002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2510;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cSj8bytZbRpT/5vNTSTRMVOwUXOFowWMi02AoU81dcYTt7vm/X94bfO3MmJahCA0fvSH3aQ4rvK9fddKZanrBsKYSF/ECq9AAr0gJj4MHzCmF9pLjqCnYGo0cbOC5pzDfB7fEjEGOJqQdWJ3LnHQKYdhCIpIGvqxQf2fnTr48wGWd7aBrL6qA2j37u2coWlCCYa7hf43g95HqNmIN3nO+XckbRjRm7/hf0cxiKga3Yd1fr7mb9heFuYySANzqO6RprFI5oYIWMdj+3baewNHwEoCHm/5NRMk6B7QGo0FE74JKJy3hCI7C0mCyUX6NAGQZq/RL8BQmz2J+MfH5CemCQeGTRCAn8qDFCMiq/FnkFpn7HnZCEWylYO6qYA3X6IgvC8jqT7pPAJ/Y99L66VgxZj3tvSiO+2bFE85G9RmBFI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d1843789-b126-4e85-350a-08d6cc92480d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 11:03:16.4429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2510
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/27/2019 00:45, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> - In dwc2_port_suspend() function added waiting for the=0A=
>>    HPRT0.PrtSusp register field to be set.=0A=
>>=0A=
>> - In _dwc2_hcd_suspend() function added checking of=0A=
>>    "hsotg->flags.b.port_connect_status" port connection=0A=
>>    status if port connection status is 0 then skipping=0A=
>>    power saving (entering partial power down mode).=0A=
>>    Because if there is no device connected there would=0A=
>>    be no need to enter partial power down mode.=0A=
>>=0A=
>> - Added "hsotg->bus_suspended =3D true" beceuse after=0A=
> =0A=
> s/beceuse/because=0A=
> =0A=
>>    entering partial power down in host mode the=0A=
>>    bus_suspended flag must be set.=0A=
> =0A=
> The above statement sounds to me like trying to win an argument by=0A=
> saying "I'm right because I'm right."  Can you give more details about=0A=
> why "bus_suspended" must be set?  See below also.=0A=
> =0A=
There is no intention of winning any argument.=0A=
Are you familiar with "bus_suspended" flag ? have you looked at what is =0A=
it used for ?=0A=
=0A=
  * @bus_suspended:	True if bus is suspended=0A=
=0A=
So when entering to hibernation is performed bus is suspended. To =0A=
indicate that "hsotg->bus_suspended" is assigned to true.=0A=
=0A=
> =0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/hcd.c | 9 ++++++++-=0A=
>>   1 file changed, 8 insertions(+), 1 deletion(-)=0A=
>>=0A=
>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c=0A=
>> index dd82fa516f3f..1d18258b5ff8 100644=0A=
>> --- a/drivers/usb/dwc2/hcd.c=0A=
>> +++ b/drivers/usb/dwc2/hcd.c=0A=
>> @@ -3479,6 +3479,10 @@ static void dwc2_port_suspend(struct dwc2_hsotg *=
hsotg, u16 windex)=0A=
>>          hprt0 |=3D HPRT0_SUSP;=0A=
>>          dwc2_writel(hsotg, hprt0, HPRT0);=0A=
>>=0A=
>> +       /* Wait for the HPRT0.PrtSusp register field to be set */=0A=
>> +       if (dwc2_hsotg_wait_bit_set(hsotg, HPRT0, HPRT0_SUSP, 3000))=0A=
>> +               dev_warn(hsotg->dev, "Suspend wasn't generated\n");=0A=
>> +=0A=
>>          hsotg->bus_suspended =3D true;=0A=
>>=0A=
>>          /*=0A=
>> @@ -4488,7 +4492,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)=
=0A=
>>          if (hsotg->op_state =3D=3D OTG_STATE_B_PERIPHERAL)=0A=
>>                  goto unlock;=0A=
>>=0A=
>> -       if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIAL)=
=0A=
>> +       if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIAL =
||=0A=
>> +           hsotg->flags.b.port_connect_status =3D=3D 0)=0A=
>>                  goto skip_power_saving;=0A=
>>=0A=
>>          /*=0A=
>> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)=
=0A=
>>                  goto skip_power_saving;=0A=
>>          }=0A=
>>=0A=
>> +       hsotg->bus_suspended =3D true;=0A=
>> +=0A=
> =0A=
> I'm a bit unsure about this.  Specifically I note that=0A=
> _dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".=0A=
> Does that now become dead code?=0A=
No it doesn't became a dead code.=0A=
> =0A=
> ...I talk about this a bit more in my review of ("usb: dwc2: Add=0A=
> enter/exit hibernation from system issued suspend/resume")=0A=
> =0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
