Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C7420FDBD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 22:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgF3UgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 16:36:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52870 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725872AbgF3UgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 16:36:10 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5057F40066;
        Tue, 30 Jun 2020 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593549370; bh=muumJeLuDadcvh2SI4/vRC2DJDK52xbkHlHlOkJUJao=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=aW3AE9ZtUGDyqbRbIZcu3OhYAkKaL8EoeRmD8zH1U667wVRyCBn/lhrQ1gJj4w5r2
         F/RaaLqsY+3d/OL5BKGosQiPnDZMOTSs9u2RE0a/oB7oHJYl+T+2CYmKljy6YRCjCq
         5yC4x58Tpvae2+AQIZz8NoveLcpPBl1sg52gLdCArpSsBDHllNnnw4UC57c9Gi24Cq
         VKc2CBNYoP3gwYggnvGJBRsUnQag0i8wXfmU6dVNJDLHiAAw/LZcREWmRFZjUrHSdH
         SX4MveHgb7SZKEsBeeLd5VsXw7bIjdDjpB9h6z6yrbMjlHdF05dE3pYHAlHQy/pxwz
         dnt0J7kQ5YmkA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4F168A006F;
        Tue, 30 Jun 2020 20:36:07 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C6AD1800DF;
        Tue, 30 Jun 2020 20:36:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GY3rNmeo";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SifwWPwubqCd+NIPIPJJzysxKIuEy8hfEj2vzY6iY0LTTaH6BD/awy8MO4WJhn0OxkGzOQ2BKrHMx60TctXBLAnzzRZe6sD8TLDHmDzwke2B7/WPUqafdIhuThxrMqgIjNLrjsrktbYeUsxEbF0Az6NuqRBPx35YOiRGY2MuhGA3o9W4UbD6iaLwtki+gjhwlUqF2h55/ohriI1eWTNfY+UMJgspIIQZtqxVayEZgP9yCTya9ITa4g7KVcSXY77USc0BgakokHgw/mwM0txdmv5Xu2nxRLl/BGdqYYZ6JwPyEWEQmn4V5bmpbfq0Nj9QmqBe5fjVO2kbgL8SF4luBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muumJeLuDadcvh2SI4/vRC2DJDK52xbkHlHlOkJUJao=;
 b=WZLf42l6TeLbf4S40xifAmFTtyC7hoviOjbwiIWs5gkkNJQ2+fFcRjKlQgAcbQjLZD7NbW0h/UdSwIVSI8pVFoiY3k2zOALcXwrj7gScG7T1UZZBesecb2h4N/XPKrKJG8oep+uSqiTvfyydYn23lh9g8/3vpAq/ErspC2dD3BT3G8dE7p6KBU4JdBwlgtd3V//sYEknBOn64SoOFdTTJfUC7i6gshC4vtkJbvMXNXoatXsTSdrnG6TA6rNHU/Kwk3LfTaop5Bl41gudPyTGLEfv5RsVMaeCcbtWm2B+pfFDk/zB15qVfxKAB4X4bh55dqjZCxbt7+8hmeP4Utdkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muumJeLuDadcvh2SI4/vRC2DJDK52xbkHlHlOkJUJao=;
 b=GY3rNmeo0C1F4wOxxvpAG4AC003O0lybNKfeqmPC4yaunL3x5+enR/NVFOXG+HMceuGR0ftXuON/bmVURhvtb2eD2VaL+e5sjrYSgttXQyx+wBVt9OkJtuv3YPZsQyAvSGAEmO6MIHkS+D6GWm66uiTu2/2kOClRP2UCW2YvzN0=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2680.namprd12.prod.outlook.com (2603:10b6:a03:63::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 30 Jun
 2020 20:36:04 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 20:36:04 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWThhOzLrXo8ZwKEeViYgzIGbLnqjwGekAgACl2ICAAOAzgA==
Date:   Tue, 30 Jun 2020 20:36:04 +0000
Message-ID: <da7b953a-9a23-5f8d-91b8-58e03db4c373@synopsys.com>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
 <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
 <20200630071337.GJ21325@pengutronix.de>
In-Reply-To: <20200630071337.GJ21325@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec9ee344-37a2-4e2f-beb1-08d81d3535c9
x-ms-traffictypediagnostic: BYAPR12MB2680:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2680BF5A084489568C71BF42AA6F0@BYAPR12MB2680.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2CFIL17Wkdl5Og4+/eG29E2fqgoXERhTSMuzDlc0eVIc5cI2upmEgnAc6xZRHIdxXznbVb3Gu6vp2ZRZNTPfB3Y0chMiRy3eQCDiQTB0mP9/e5qSIQ4Mm8c5rMjE2XjGCDAphRfyowbH4eXn7cTujGt9omWMWlv2njpIj/qNoAXuw7CPXCEcHiPUGGyoRR0PdLK02xNJcL5o83Lhvdh5Ur2eEY0peDbJESppv4nuTkB8DRdVDcMzrPgGcbWzNP5+wQl/ljoVAyYJ/Jq6a1Ifuq5m4fob/aDKLiFouK/vYWhS/t8fdjivxiTrNgjFDpj2GTpGNKLHfjs/m8g9i9tRt8wVK8ORC7OhXhScB8sz6X/1G6uAerYigjrj5AzA7h2z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(39860400002)(396003)(366004)(478600001)(5660300002)(6486002)(6506007)(186003)(31696002)(36756003)(4326008)(26005)(86362001)(2616005)(6512007)(110136005)(31686004)(8936002)(66476007)(66556008)(64756008)(8676002)(66446008)(66946007)(316002)(76116006)(54906003)(83380400001)(71200400001)(2906002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: E6SLY/+RJKmQH+yf9Jjb5FZETiCahSxq/23cusTsAfMrlrZkTdNEq6qtgWCbd8kdVbiwmw7YpoQj/uSYJjCWAqpigvUuRyQ0x1UM7CbT+wYFFIXLD+EEQno3eKM/OBMV2W9SE44GDF+FdyttZRKEDSB1rXjfX3tZp4VpJA2XnODnpwrzZSVK0iHIDw6zUBnyEOzxGdLFVz7fEC6I+TgTA2nQbGlkVUdM82VK0uB1sIceJoMoR+8/9jMGg9m6H+ve1n0cSmisN/sGFfK4qimsD2OhTj5frOCUna5Y8Bbrcf/skw2o0mFqAqrvdY1vIIPkeyyKvqiRkGHwQKGxkP6CjjIkWnrXTWUGiJnh9+IC8VI8W9wT2Pd/2cE5FloekGALYvvef9iTCYmZ9IrsAZ6YHDCDHk9xDDtW3c/+jRewvIAe5LT55hu5BUtMypb7zjKEG+rmPWWEwdCKKnrQoFAhMPExa3YJFwMzF1sZ+bP3oLE=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <9887B074140C5744B0967827C8F6C5DB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9ee344-37a2-4e2f-beb1-08d81d3535c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 20:36:04.4572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnzIdHcBiA0iKB0oafpRW0oJgKJ4vj5j4HEJ3MJlZ3TQ+7unRs8AslWBOpi2Ji26LaCryf/lL1axUDrq1d1PEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2680
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Michael Grzeschik wrote:
> On Mon, Jun 29, 2020 at 09:20:02PM +0000, Thinh Nguyen wrote:
>> Hi,
>>
>> Michael Grzeschik wrote:
>>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>>
>>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>>> XferNotReady. Otherwise the frame number is outdated and start transfer
>>> will fail, even with several retries.
>>>
>>> DSTS provides the lower 14 bit of the frame number. Use it in=20
>>> combination
>>> with the frame number provided by XferNotReady to guess the current=20
>>> frame
>>> number. This will succeed unless more than one 14 rollover has happened
>>> since XferNotReady.
>>>
>>> Start transfer might still fail if the frame number is increased
>>> immediately after DSTS is read. So retries are still needed.
>>> Don't drop the current request if this happens. This way it is not=20
>>> lost and
>>> can be used immediately to try again with the next frame number.
>>>
>>> With this change, __dwc3_gadget_start_isoc is still not successfully=20
>>> in all
>>> cases bit it increases the acceptable delay after XferNotReady
>>> significantly.
>>>
>>> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>
>>> ---
>>> v1 -> v2: - removed last_frame_number from struct
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - included rollover variable
>>> v2 -> v3: - moved the calculation before the retry loop
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - skipping the calculation if bInterval =
> 14
>>>
>>> =A0 drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>> =A0 1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 8de6f10d335e1c0..7ad85a7d06f70bf 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct=20
>>> dwc3_ep *dep)
>>>
>>> =A0 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>> =A0 {
>>> +=A0=A0=A0 const struct usb_endpoint_descriptor *desc =3D dep->endpoint=
.desc;
>>> =A0=A0=A0=A0=A0 struct dwc3 *dwc =3D dep->dwc;
>>> =A0=A0=A0=A0=A0 int ret;
>>> =A0=A0=A0=A0=A0 int i;
>>> @@ -1480,6 +1481,24 @@ static int __dwc3_gadget_start_isoc(struct=20
>>> dwc3_ep *dep)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dwc3_gadget_start_isoc_q=
uirk(dep);
>>> =A0=A0=A0=A0=A0 }
>>>
>>> +=A0=A0=A0 if (desc->bInterval <=3D 14) {
>>> +=A0=A0=A0=A0=A0=A0=A0 u32 frame =3D __dwc3_gadget_get_frame(dwc);
>>> +=A0=A0=A0=A0=A0=A0=A0 bool rollover =3D frame < (dep->frame_number & 0=
x3fff);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 /*
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number is set from XferNotReady and m=
ay be already
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * out of date. DSTS only provides the lower 1=
4 bit of the
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * current frame number. So add the upper two =
bits of
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number and handle a possible rollover=
.
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * This will provide the correct frame_number =
unless more than
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * rollover has happened since XferNotReady.
>>> +=A0=A0=A0=A0=A0=A0=A0=A0 */
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3f=
ff) | frame;
>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>> +=A0=A0=A0 }
>>> +
>>> =A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep,=
 i + 1);
>>>
>>
>> I think it's cleaner to create a mask for 0x3fff, but I can see how it
>> can arguably clearer for not using a macro also. It's fine to me=20
>> either way.
>
> This mask is used on many usb controllers and
> everyone is defining their own.
>
> drivers/usb/gadget/udc/mv_udc.h
> 34:#define USB_FRINDEX_MASKS=A0=A0=A0 0x3fff
>
> drivers/usb/gadget/udc/fsl_usb2_udc.h
> 116:#define=A0=A0=A0 USB_FRINDEX_MASKS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
x3fff
>
>
> Even other drivers using the mask without defining it:
>
> drivers/usb/misc/ftdi-elan.c
> 2224:=A0=A0=A0 hc_fminterval &=3D 0x3fff;
> 2313:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((9 *hc_fmint=
erval) / 10) & 0x3fff);
>
> drivers/usb/chipidea/udc.c
> 1634:=A0=A0=A0 ret =3D hw_read(ci, OP_FRINDEX, 0x3fff);
>
> drivers/usb/dwc3/gadget.c
> 1406:=A0=A0=A0=A0=A0=A0=A0 test_frame_number =3D dep->frame_number & 0x3f=
ff;
> 1453:=A0=A0=A0 dep->frame_number &=3D 0x3fff;
>
> drivers/usb/host/ohci-hcd.c
> 557:=A0=A0=A0=A0=A0=A0=A0 ohci->fminterval =3D val & 0x3fff;
>
> drivers/usb/host/xhci-ring.c
> 3980:=A0=A0=A0 start_frame &=3D 0x3fff;
>
> drivers/usb/host/ohci-dbg.c
> 635:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rdata & 0x3fff);
> 641:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rdata & 0x3fff);
> 647:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rdata & 0x3fff);
>
> drivers/usb/host/u132-hcd.c
> 1535:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((9 * fi) / 10) & 0x3fff);
> 1605:=A0=A0=A0=A0=A0=A0=A0 u132->hc_fminterval =3D temp & 0x3fff;
>
> drivers/usb/host/ohci.h
> 701:=A0=A0=A0 ohci_writel (ohci, ((9 * fi) / 10) & 0x3fff,
>
> I could write a patch changing them all or at least
> make a common gadget define.
>
> What could be a common place for that?
>
> On device level only it could be include/linux/usb/gadget.h
> On whole usb level this could be include/uapi/linux/usb/ch9.h
>
> Ideas?
>

It maybe common for usb controllers to report frame number as a 14-bit=20
value (probably because of SOF/ITP packet format). But different=20
controller may behave differently here. For DWC3 controller, this is=20
read from the DSTS register, and it doesn't have to follow any standard.=20
Only DWC3 driver knows the format (e.g., if the device is full-speed,=20
DSTS.SOFFN is only valid as a 10 bit frame number and not uframe). So,=20
we shouldn't create a common mask for all controllers.

Talking about full speed, you should also ignore this calculation if the=20
device is in full-speed. Please make a fix in v4.

With full-speed, there should be plenty of time for the system to handle=20
XferNotReady since it's in frame and not uframe (with retry still apply=20
of course).

BR,
Thinh
