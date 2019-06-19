Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E12A4C11B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 20:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFSS4w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 14:56:52 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:59384 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726109AbfFSS4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 14:56:51 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E6937C01C1;
        Wed, 19 Jun 2019 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560970610; bh=f37eGHzJHP4BiR5+rEKYdfHYcbJJ2idGcqJ8PaK03sU=;
        h=From:To:CC:Subject:Date:References:From;
        b=Mh/4n+Smm2PjBVVouRUUKGjBMpFdVxpFZcyJ0g1CJzSKTDDRssVim7lIDFVbsvk4N
         3KwhAVczBwlTvAg5Jo+waGUBLr8u9n5wvgM7atazxGGBFIu6suXN6ng7SifdJhiCrr
         bMubsiQyDh6lz4PEIAcMIbbXylFiwzUzMZSSRsqo5mhWD25ad5/BmfxEiXx4YJk/EA
         JpH7nAAPZW+DSDTwPLsG4Fr3KCn8VrNL4DqO9+oKLLYMs5tFJya/0I7MPbPLsh5ZMX
         3luS4NabV0EjhMqtJ/0KC7EjeKL6IGMTSiFcBIldu/2qxODH8zxDR9jucvUK8mnoFA
         JvB+Yzp9lDtIQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7970EA0079;
        Wed, 19 Jun 2019 18:56:50 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Jun 2019 11:56:50 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Jun 2019 11:56:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUQQSIfM+OCTFzESJhip9DL4nyLxzUX0kAv0Sr5fe/0=;
 b=NzCx0FarF3vcErEUgFluiHhJ1G3yl5IWnpzrdOEi8AJc7CfDTgnamWsK0UHVR6Dt4kIzk9T0PZ4XmFiuk2bU2ZHYRtgCZfNdzFxGva7cfSeEGBzZt3pq9LT2GhBnTRJ8oOqLTY5Wzy3Ro3rpRO5A7yBiyvl1bWkAQSZO+vRmKmo=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0135.namprd12.prod.outlook.com (10.172.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Wed, 19 Jun 2019 18:56:48 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::d02c:35a1:b254:41da]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::d02c:35a1:b254:41da%2]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 18:56:47 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZlsWV0TH3kp0u96EW7I6xXQg==
Date:   Wed, 19 Jun 2019 18:56:47 +0000
Message-ID: <CY4PR1201MB0037018EDE2C83C27124CADBAAE50@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
 <87fto7gy1o.fsf@linux.intel.com>
 <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
 <87a7eef5rl.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6219b283-0ebb-47fc-2cda-08d6f4e7e1a7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0135;
x-ms-traffictypediagnostic: CY4PR1201MB0135:
x-microsoft-antispam-prvs: <CY4PR1201MB01356F29B00074A635C2A9AEAAE50@CY4PR1201MB0135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(305945005)(68736007)(102836004)(110136005)(6436002)(66066001)(256004)(9686003)(6636002)(229853002)(476003)(316002)(71200400001)(14444005)(86362001)(14454004)(71190400001)(74316002)(99286004)(3846002)(8676002)(26005)(76176011)(6506007)(6116002)(66446008)(64756008)(6246003)(91956017)(186003)(66556008)(53936002)(66476007)(73956011)(66946007)(4326008)(2906002)(446003)(33656002)(76116006)(7736002)(25786009)(81166006)(55016002)(5660300002)(486006)(52536014)(8936002)(7696005)(81156014)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0135;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cPWviWRXGhN37cXtlV8fKtZBzzQEThcmUTzgGjpi+Hl4uJC8jfu5OWhnOHmd8kcxnxHa7yl77TrVh3aOKVoTj3xGHlqVzm/3V7y0aHpeGiYTk4MNjo2nwnbx+oe8spt2+aUcFwMIIwz7hFWbuVboaivJSTKgm0UKn6duqbDzXJbiQVTLwV8t9oyX3ZN0D2O+QffRc7KPp0GE74LU23pVoONH5K0Dx5YW/IWIExM8JaGQhyZI0w5UqyzJA7qxeL3fctsoGgwJmtebI2BhYBGoARoYh29RdIGtDY4V+gTB2g2U/UBmOhLjinUthDjlWJRADbAe+PVYE0KxpHrF0n9lja7ZyQPQ/Cbe5oRdqvdOxYWGYkQEmioItUXnCAjCRKV4wagudKZd2gaIcoXBF3UMsHtV1sQooIbmTY1XTQmuF0A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6219b283-0ebb-47fc-2cda-08d6f4e7e1a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 18:56:47.8464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0135
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe Balbi wrote:=0A=
> Hi,=0A=
>=0A=
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:=0A=
>>>>>> Would there be any obvious draw-back to going down this route? The t=
hing=0A=
>>>>>> is that, as it is, it seems like we will *always* have some corner c=
ase=0A=
>>>>>> where we can't guarantee that we can even start a transfer since the=
re's=0A=
>>>>>> no upper-bound between XferNotReady and gadget driver finally queuei=
ng a=0A=
>>>>>> request. Also, I can't simply read DSTS for the frame number because=
 of=0A=
>>>>>> top-most 2 bits.=0A=
>>>>>>=0A=
>>>>> For non-affected version of the IP, the xfernotready -> starttransfer=
=0A=
>>>>> time will have to be off by more than a couple seconds for the driver=
=0A=
>>>>> to produce an incorrect 16-bit frame number. If you're seeing errors=
=0A=
>>>>> here, maybe we just need to code review the relevant sections to make=
=0A=
>>>>> sure the 14/16-bit and rollover conditions are all handled correctly.=
=0A=
>>>> I think what Felipe may see is some delay in the system that causes th=
e=0A=
>>>> SW to not handle XferNotReady event in time. We already have the "retr=
y"=0A=
>>>> method handle that to a certain extend.=0A=
>>>>=0A=
>>>>> But I can't think of any obvious drawbacks of the quirk, other than=
=0A=
>>>>> doing some unnecessary work, which shouldn't produce any bad=0A=
>>>>> side-effects. But we haven't really tested that.=0A=
>>>>>=0A=
>>>> The workaround for the isoc_quirk requires 2 tries sending=0A=
>>>> START_TRANSFER command. This means that you have to account the delay =
of=0A=
>>>> that command completion plus potentially 1 more END_TRANSFER completio=
n.=0A=
>>>> That's why the quirk gives a buffer of at least 4 uframes of the=0A=
>>>> scheduled isoc frame. So, it cannot schedule immediately on the next=
=0A=
>>>> uframe, that's one of the drawbacks.=0A=
>>>>=0A=
>>>>=0A=
>>>> Hi Felipe,=0A=
>>>>=0A=
>>>> Since you're asking this, it means you're still seeing issue with your=
=0A=
>>>> setup despite retrying to send START_TRANSFER command 5 times. What's=
=0A=
>>>> the worse delay responding to XferNotReady you're seeing in your setup=
?=0A=
>>> There's no upper-bound on how long the gadget will take to enqueue a=0A=
>>> request. We see problems with UVC gadget all the time. It can take a lo=
t=0A=
>>> of time to decide to enqueue data.=0A=
>> That's why there's a mechanism in the controller to return bus-expiry=0A=
>> status to let the SW know if it had scheduled isoc too late. SW can do 2=
=0A=
>> things: 1) re-schedule at a later timer or 2) send END_TRANSFER command=
=0A=
>> to wait for the next XferNotReady to try again.=0A=
> All of this is still rather flakey. Can I send consecutive END_TRANSFER=
=0A=
> commands and get new XferNotReady at any moment? Consider this=0A=
> situation:=0A=
>=0A=
> . transfer started=0A=
> . transfer completes with status Missed ISOC=0A=
> . driver issues END_TRANSFER (as required by docs)=0A=
> . XferNotReady fires=0A=
> . driver updates current frame number=0A=
> . several mS of nothing=0A=
> . finally gadget enqueues a transfer=0A=
> . Start Transfer command=0A=
> . completes with Bus Expiry=0A=
>=0A=
> Can I issue *another* END_TRANSFER at this point? I don't even have a=0A=
> valid transfer resource since transfer wasn't started.=0A=
=0A=
Yes you can. If the START_TRANSFER command completes, you will get the=0A=
transfer resource index to use for END_TRANSFER command (regardless of=0A=
bus-expiry status).=0A=
=0A=
However, there's a chance if the SW somehow keeps handling the=0A=
XferNotReady event late over and over and the isoc transfer never get=0A=
started. That's where you can create a quirk and use frame number from=0A=
DSTS instead.=0A=
=0A=
> The best "workaround" I can think of would be to delay END_TRASFER until=
=0A=
> ep_queue time.=0A=
>=0A=
>>> Usually I hear this from folks using UVC gadget with a real sensor on=
=0A=
>>> the background.=0A=
>>>=0A=
>>> I've seen gadget enqueueing as far as 20 intervals in the future. But=
=0A=
>>> remember, there's no upper-bound. And that's the problem. If we could=
=0A=
>>> just read the frame number from DSTS and use that, we wouldn't have any=
=0A=
>>> issues. But since DSTS only contains 14 our of the 16 bits the=0A=
>>> controller needs, then we can't really use that.=0A=
>> You can create another quirk for devices that have this behavior to use=
=0A=
>> frame number in DSTS instead.  As John had pointed out and mentioned, =
=0A=
>> this will only work if the service interval and the delay in the=0A=
>> scheduling of isoc is within 2 seconds.=0A=
> well, that's better than nothing, but there's no upper-bound for the=0A=
> gadget driver, really.=0A=
>=0A=
>> You will need to calculate this value along with BIT(15) and BIT(14) of=
=0A=
>> XferNotReady for rollovers.=0A=
>>=0A=
>>> To me, it seems like this part of the controller wasn't well=0A=
>>> thought-out. These extra two bits, perhaps, should be internal to the=
=0A=
>>> controller and SW should have no knowledge that they exist.=0A=
>> These values are internal. SW should not have knowledge of it. This=0A=
>> implementation will not follow the programming guide and should be used=
=0A=
>> as a quirk for devices that are too slow to handle the XferNotReady=0A=
>> event but want to schedule isoc immediately after handling the event.=0A=
> They are *not* internal if SW needs to know that to start a transfer=0A=
> properly it needs these extra two bits :-) What I meant to say was that=
=0A=
> we should never have a 16-bit frame number. Only 14 bits. But in any=0A=
> case, we can't change the HW now :-)=0A=
>=0A=
=0A=
Yeah... I made a correction in my previous email that it's not internal.=0A=
But like I said, we can create a quirk to use DSTS frame number to=0A=
workaround this issue with some limitations.=0A=
=0A=
BR,=0A=
Thinh=0A=
