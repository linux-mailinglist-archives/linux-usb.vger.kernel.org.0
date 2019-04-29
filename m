Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2E7E0DB
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfD2Kvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:51:41 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:59900 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727841AbfD2Kvk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 06:51:40 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 256EFC0079;
        Mon, 29 Apr 2019 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556535101; bh=2bTPl3QOIvWtNbQ1NStumLcDYnOUM7ylP5P3Urb6zSY=;
        h=From:To:CC:Subject:Date:References:From;
        b=N7AXHMBDtQJNLf5r1rSWt1H+LC6BYsBDvNyAb3g5N3HycFmx51krozu7xcDQXjJGb
         q0jY0QuTDDMOMp2NQwxTPZ9Eh6RrAvEj1e0hpX35gfYXcr5cABOGHIVbSGDon8eRlq
         k3A1GGngWwBS8Exe0GmpY0EGcu+FS87+1wpFjuSUogqzVQPf6feW5go4aWQlou0k/v
         uAeZlmBzYqNz2/arfOqMwe/xRsCQMIjkAaKKDMiAQQp2jmcO+7E7eLwhYte9/1YLV9
         uVYTVXMdT51Wk2RJfFDXB1Dlzdpw2CFz+o6a9t5ZY2Wi47mBfy+rkxvIx1Dr8yaU6H
         Qb+p/aXWLzYDg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9AAFEA0066;
        Mon, 29 Apr 2019 10:51:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 03:51:39 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 03:51:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th66VwQ7Defj6nlE56WHYQLRj0Z5yUKt+YSk2s+vtjs=;
 b=iFWnGw7UNiHxL9CjI8slGbb0yZj4VmlfEcL/zABusIfOhjV66ymr0nkx28Mw7Vk4zUQ8z8dQQP0IHEM7jJvfXeB4wLTwGTxm/yhATIUQLT2mBDSN3nZ/9K/gfNrYhHHbMfN6WziCsJ6gprB1DiFw2RItLI//ZGN0K6zbCyQXO7Q=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0605.namprd12.prod.outlook.com (10.163.208.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Mon, 29 Apr 2019 10:51:34 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 10:51:34 +0000
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
Date:   Mon, 29 Apr 2019 10:51:34 +0000
Message-ID: <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555075927.git.arturp@synopsys.com>
 <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36305785-bb89-4362-5d46-08d6cc90a5de
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0605;
x-ms-traffictypediagnostic: SN1PR12MB0605:
x-microsoft-antispam-prvs: <SN1PR12MB0605216F68B7A9E0ADFFB0AFA7390@SN1PR12MB0605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(39850400004)(346002)(136003)(199004)(189003)(91956017)(76116006)(66446008)(2906002)(55016002)(66556008)(66946007)(73956011)(64756008)(66476007)(305945005)(74316002)(25786009)(3846002)(256004)(4326008)(7736002)(107886003)(53936002)(14444005)(9686003)(6246003)(6116002)(316002)(52536014)(54906003)(26005)(7696005)(486006)(6436002)(14454004)(102836004)(66066001)(476003)(68736007)(446003)(53546011)(229853002)(99286004)(6506007)(6916009)(76176011)(5660300002)(8676002)(81156014)(81166006)(71190400001)(71200400001)(86362001)(478600001)(97736004)(186003)(33656002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0605;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ORre9YRKpdL1rL04aRAB2u7LKpmFezTsYRh5rhLVayfltz2HryoK+yo0mw3rT8liZj/wB/NdCKomKxLJCk7URvzwGVaDUyhNnM1He9OGDC1hHfx8sw0WGzHxhf2RIrYKmZJr/aawcw5jz+NLcGDr1H41lUZo0JOMtoEMvpTBbbMI9doGjzYqs6CTGW9PufzPuXldWDt0BAXD9MWtEP8Uqy5fGxivTMV0tDUZwyf67N7Hzfy5rpDjgmeRjswGX1PgOkI0oUDLTRhNGVUGMKmrcr5UBs5Dzlc/ExJELgqU3A99XvpZ9JOIcHgAz751V7XikFAVD2dJoAXeX5Kt2r9d9wilYTPA6FnNLfuGIt9UkZ0DV5lZKOIdGPDcQp2l+IPoE17bgK11ZYKqJpoTJrubi6ZzWYW5TqTPy8nUbHbDPiM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36305785-bb89-4362-5d46-08d6cc90a5de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 10:51:34.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0605
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/27/2019 00:43, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan=0A=
> <arthur.petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> - Added backup of DCFG register.=0A=
>> - Added Set the Power-On Programming done bit.=0A=
>>=0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/gadget.c | 10 ++++++++++=0A=
>>   1 file changed, 10 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c=0A=
>> index 6812a8a3a98b..dcb0fbb8bc42 100644=0A=
>> --- a/drivers/usb/dwc2/gadget.c=0A=
>> +++ b/drivers/usb/dwc2/gadget.c=0A=
>> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_hsot=
g *hsotg, int remote_wakeup)=0A=
>>   {=0A=
>>          struct dwc2_dregs_backup *dr;=0A=
>>          int i;=0A=
>> +       u32 dctl;=0A=
>>=0A=
>>          dev_dbg(hsotg->dev, "%s\n", __func__);=0A=
>>=0A=
>> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2_hso=
tg *hsotg, int remote_wakeup)=0A=
>>          if (!remote_wakeup)=0A=
>>                  dwc2_writel(hsotg, dr->dctl, DCTL);=0A=
>>=0A=
>> +       if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_PARTIA=
L) {=0A=
>> +               dwc2_writel(hsotg, dr->dcfg, DCFG);=0A=
>> +=0A=
>> +               /* Set the Power-On Programming done bit */=0A=
>> +               dctl =3D dwc2_readl(hsotg, DCTL);=0A=
>> +               dctl |=3D DCTL_PWRONPRGDONE;=0A=
>> +               dwc2_writel(hsotg, dctl, DCTL);=0A=
>> +       }=0A=
> =0A=
> I can't vouch one way or the other for the correctness of this change,=0A=
> but I will say that it's frustrating how asymmetric hibernate and=0A=
> partial power down are.  It makes things really hard to reason about.=0A=
> Is there any way you could restructure this so it happens in the same=0A=
> way between hibernate and partial power down?=0A=
> =0A=
=0A=
> Specifically looking at the similar sequence in=0A=
> dwc2_gadget_exit_hibernation() (which calls this function), I see:=0A=
> =0A=
> 1. There are some extra delays.  Are those needed for partial power down?=
=0A=
Do you mean delays in dwc2_gadget_exit_hibernation() ? If yes they are =0A=
needed for hibernation flow. What relates to delays in hibernation =0A=
needed for partial power down. Anything that is implemented in the =0A=
hibernation delays or other things are part of hibernation and are not =0A=
used in partial power down because they are two different flows of power =
=0A=
saving.=0A=
=0A=
> =0A=
> 2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only=0A=
> happens if "not remote wakeup".  Is it truly on purpose that you don't=0A=
> do that?=0A=
Currently partial power down doesn't support remote wakeup flow.=0A=
=0A=
> =0A=
> 3. I see that dctl gets "DCTL_PWRONPRGDONE" set as part of the=0A=
> sequence in the "not remote wakeup" case before calling this function.=0A=
> ...but then part of the function (that you didn't change) clobbers it,=0A=
> I think.=0A=
> =0A=
Setting device programming done bit in dwc2_gadget_exit_hibernation() =0A=
comes from older code and from debugging I noticed that if it is not =0A=
done at that point then the flow brakes.=0A=
=0A=
So in partial power down flow we need to set that bit wile restoring =0A=
device registers. That is why the implementation is such.=0A=
=0A=
> =0A=
> I have no idea if any of that is a problem but the fact that the=0A=
> hibernate and partial power down code runs through such different=0A=
> paths makes it really hard to know / reason about.  Many of those=0A=
> differences exist before your patch, but you're adding a new=0A=
> difference rather than trying to unify and that worries me.=0A=
> =0A=
> =0A=
=0A=
So to make it easy to reason about I think we should debug it. Please =0A=
point out where it fails. Have you tested this flow and did you see any =0A=
wrong behavior of hibernation or partial power down? if yes please =0A=
provide the debug logs so that they can be investigated.=0A=
=0A=
All of these patches have been tested on HAPS-DX and and Linaro HiKey =0A=
960 board. These patches fix Hibernation and Partial Power down issues.=0A=
=0A=
=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
