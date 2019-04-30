Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B00F0F6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 09:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfD3HK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 03:10:59 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:53236 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbfD3HK7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 03:10:59 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C0FECC011F;
        Tue, 30 Apr 2019 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556608256; bh=piVtXTlZv9bAqVFt8vhgadk+WBPyTOUDuVLxQjnFioY=;
        h=From:To:CC:Subject:Date:References:From;
        b=OKrFK4RfG28fDe7tZ/fqgixbC9THBSO+tjPk0QPWGx0dCd4GuGzFKM62ti8ZZ1jka
         QWix3J5HgbroIPlYYD7LBvlXhOUmqQo/icJ3wXdXEa1AH5347wHPNrTwq5mlk9ifoq
         xCDdD9zqD84vGky6j+HUzT7PdUWWDiGnHf4k+9PP4mLgOSB6t/m91v1pKJHUYnWVKP
         /j4d5DDYEy6q1Y56uI0IfhWkopFHCItcDDXU/eDd0t+aNnq1Nuj5tR2+qjwP+SyNag
         +YIgeCRwvy15+OMa6ifIA0xonhTDYuWiyOjUCWyl4MiTPFvmMCHPhyBwPIKx+qe4np
         omhZUVnE9r6fg==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EBD3BA005D;
        Tue, 30 Apr 2019 07:10:58 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 30 Apr 2019 00:10:58 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Apr 2019 00:10:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIlkG4llJVIx87k64T7d01dtytozulKghfQjlUeNxpI=;
 b=Jz3RBjo2OTQ+Yor4K0V37Qc0f+xJl2mT6QaqHvgkqlJ6g7877Mhw9IRDsAjy9QIw+vW287MaGEF/rw0hvoREF2c2G7CSUkpqe0fwG3vJm4Q5YI5DiwCJxigUkAfA8wKgrwUWVIEnwj8FWAnCqKJ9YFPTLDa5Q4KKmMuTuHkZYM0=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2416.namprd12.prod.outlook.com (52.132.195.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 07:10:57 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 07:10:57 +0000
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
Date:   Tue, 30 Apr 2019 07:10:57 +0000
Message-ID: <SN1PR12MB243146421A3AFF32CCC341EAA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
 <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=UdKhbgG6r+xNUx9e+2quXi_vN7NwDBxPHs-0hKmSJKzQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 843c56b7-303a-4286-e2e9-08d6cd3afe17
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2416;
x-ms-traffictypediagnostic: SN1PR12MB2416:
x-microsoft-antispam-prvs: <SN1PR12MB2416D50364C849A14D368A09A73A0@SN1PR12MB2416.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(66556008)(25786009)(66476007)(66446008)(66946007)(76116006)(73956011)(52536014)(4326008)(55016002)(64756008)(316002)(26005)(186003)(71200400001)(91956017)(6506007)(53936002)(53546011)(486006)(446003)(5660300002)(14444005)(102836004)(86362001)(54906003)(476003)(71190400001)(256004)(93886005)(6116002)(3846002)(66066001)(6916009)(8676002)(81166006)(14454004)(305945005)(15650500001)(7736002)(74316002)(33656002)(478600001)(6436002)(107886003)(99286004)(6246003)(9686003)(76176011)(7696005)(2906002)(8936002)(229853002)(97736004)(81156014)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2416;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XeSu57Jepx1Tnymh/EL8gx0phLlujR426G6dJeR2N6hGG8lWHw/wt4iHnj36loaMQkHj3LGrmcSQW9tEAe3upwAkkb2NGV89tR1DrK6PZ+EzuJlA1+BCsNH30V/rDTSZ6iHtkfEjBNYxdn4Fs+miohowymk3lo8G12oIVSjs7lEbNth+eluXiD5YacdKy4+YMF79rGO3opUsI3ZdSfA/k+lakgNMFMM8Xy2cNHqbS1jd37iXxGczZIyKm5hH+Wh2zSzTScd9P5E6YA0CLSXwfK7fXRwjhaqTFEASyWN7df1gapt/bzrjKB3f76Um4Y/7fBO+e/3X6Pmlpj9qk/wwtT0rWGAIz/YlNYuf2EeP3lLkXLZQF9ckNBG/9zPUZNsBoso+MgrtVDT1mEUnZpyVch1XTbmq2joJi9UnVeor4Y0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 843c56b7-303a-4286-e2e9-08d6cd3afe17
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 07:10:57.2718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2416
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/29/2019 21:35, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Mon, Apr 29, 2019 at 4:03 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> On 4/27/2019 00:45, Doug Anderson wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan=0A=
>>> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>>>=0A=
>>>> - In dwc2_port_suspend() function added waiting for the=0A=
>>>>     HPRT0.PrtSusp register field to be set.=0A=
>>>>=0A=
>>>> - In _dwc2_hcd_suspend() function added checking of=0A=
>>>>     "hsotg->flags.b.port_connect_status" port connection=0A=
>>>>     status if port connection status is 0 then skipping=0A=
>>>>     power saving (entering partial power down mode).=0A=
>>>>     Because if there is no device connected there would=0A=
>>>>     be no need to enter partial power down mode.=0A=
>>>>=0A=
>>>> - Added "hsotg->bus_suspended =3D true" beceuse after=0A=
>>>=0A=
>>> s/beceuse/because=0A=
>>>=0A=
>>>>     entering partial power down in host mode the=0A=
>>>>     bus_suspended flag must be set.=0A=
>>>=0A=
>>> The above statement sounds to me like trying to win an argument by=0A=
>>> saying "I'm right because I'm right."  Can you give more details about=
=0A=
>>> why "bus_suspended" must be set?  See below also.=0A=
>>>=0A=
>> There is no intention of winning any argument.=0A=
> =0A=
> I was trying to say that your statement does not convey any=0A=
> information about the "why".  It just says: "I now set this variable=0A=
> because it needs to be set".  This tells me nothing useful because=0A=
> presumably if it did't need to be set then you wouldn't have set it.=0A=
> I want to know more information about how the code was broken before=0A=
> you did this.  What specifically requires this variable to be set?=0A=
Specifically that variable is set when core enters to hibernation or =0A=
partial power down.=0A=
> =0A=
> =0A=
>> Are you familiar with "bus_suspended" flag ? have you looked at what is=
=0A=
>> it used for ?=0A=
>>=0A=
>>    * @bus_suspended:     True if bus is suspended=0A=
>>=0A=
>> So when entering to hibernation is performed bus is suspended. To=0A=
>> indicate that "hsotg->bus_suspended" is assigned to true.=0A=
> =0A=
> Perhaps you can help me understand what the difference is between=0A=
> "port suspend" and "bus suspend" on dwc2.  I think this is where my=0A=
> confusion lies since there are functions for both and they do subtly=0A=
> different things.  ...but both functions set bus_suspended.=0A=
dwc2_port_suspend() is a function which is called when set port feature=0A=
"USB_PORT_FEAT_SUSPEND" is asserted. Yet, bus_suspended is a variable. =0A=
That variable should be set any time that host enters to hibernation or =0A=
partial power down.=0A=
=0A=
> =0A=
> =0A=
>>>> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd=
)=0A=
>>>>                   goto skip_power_saving;=0A=
>>>>           }=0A=
>>>>=0A=
>>>> +       hsotg->bus_suspended =3D true;=0A=
>>>> +=0A=
>>>=0A=
>>> I'm a bit unsure about this.  Specifically I note that=0A=
>>> _dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".=0A=
>>> Does that now become dead code?=0A=
>> No it doesn't became a dead code.=0A=
> =0A=
> Can you explain when it gets triggered, then?=0A=
_dwc2_hcd_resume() is triggered by the system.=0A=
As an example lets assume you have hibernated the PC and then you turn =0A=
the PC on. When you turn the PC back on in that case _dwc2_hcd_resume() =0A=
function is called to resume from suspended state (Hibernation/partial =0A=
power down)=0A=
> =0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
