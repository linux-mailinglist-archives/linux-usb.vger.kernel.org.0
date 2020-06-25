Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF4220A5EF
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 21:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406624AbgFYTfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 15:35:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:55586 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406064AbgFYTfV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 15:35:21 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F6A5401BB;
        Thu, 25 Jun 2020 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593113720; bh=ECqxuc7BPW/i4e/NmsUWXwsQTwPwY/bsgIV7xNei+tI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jswXcXG0/GlUDQWiyNeGg/A5gmi9iqnTKyf9VOj29dOlihK7imTc52Y0qe85HzcyU
         dsT72hOl5C9cNGz4d+iQhrhsKtU0uPgeJZWm7Rh/DmIw8s4QusMRjxlwb9u6k66srs
         5CWPcZpsaSZfUX94Q4IcWfNbzfjh57jMVoLrdt0+13aTWOgv+ErEmqgcIC9HDcLFI4
         P50GVnTMT8kzlAtScNTObLIvIPm2xj8MdQatXBySfDw3rt5ht8RTekD/j1q4X63JCm
         +pm5VQmkNIM+p7rkXoJLQVbRWFfR2K8Dmcp4/6oyMv46yKXU19B2d4bluBdG4OsvGI
         gOSJkXeyN7pew==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 915F4A0081;
        Thu, 25 Jun 2020 19:35:18 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 781684013F;
        Thu, 25 Jun 2020 19:35:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BJzVZBmV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGQpF5QIx+uh7BvlfDV2Vsq0hMd5A9m9IEuD1yEhrP80FkmmVwmFVskv5m054C2+DcRJ0Ti8X2NrA4l+qHlwRuQCpaaS6H3j6rdgBRiu/rlQqcBTAF4VzNHEeUUKygyapzYN37qfxZacy+Xyvhq1iunh3PeV02/k41Px2+OcW5AjEQHh+D+bwuhRCziScs8xbGFBUgIKgTZ7Wo34pDL4eUenUntIfJdzNykojFk8F/AoDA+IgDpRlK/j7z6Ki/j0esdDRdRIaAW5yiHWnnBCbWRgjVggmmlnRWgZP9nLHb0Q54YJp8zRSUHUuDFRQuxoGfXRS62o5PxSWI698VzxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECqxuc7BPW/i4e/NmsUWXwsQTwPwY/bsgIV7xNei+tI=;
 b=Z1QpvGV1VVGapiVfbyeYs4w+D3bChIAZvj0GGHfA0u2B1LbO9wHiuUru7uaXsKcOWwitoa/j1RKKJtllNVmCjYzvOUfsaTn2a+/iPnNErKcS12PJ8LVK6dSXUqIRlArLn4HaQgYdyxXV7oTGnezFuL4MmqKbX4HNMF+cjx7AlKxPoXaWseBl1ODqmCySgGn34j/YDBRD1EeEtqh6E1OkRY98dVqRq58mZAPlIZKtJZjDjOl5711hv0ODdRKZyol6mjD6YNSporZaSXsk2RlOkaBwFwjBsgA+ZyJVeS3bFqP16kOGL3HXmrKfAAf5M7Amh/kWAEfBaz956unLrxoYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECqxuc7BPW/i4e/NmsUWXwsQTwPwY/bsgIV7xNei+tI=;
 b=BJzVZBmVJ/9vO04juYzphMy6huKhiIgog/cnbUPiSmGH50hpc3plQaHe6GsMMs2+04giDF7jmDJN2iGodaJD5yGG4AdBg5BNBvJWKv/lWWPkWx66h9lpq2KCpMGeZYsq/ZYE545kfryYJFdU6H6d6wHZSyXu3k/jJujr57DL0mQ=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3064.namprd12.prod.outlook.com (2603:10b6:a03:da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Thu, 25 Jun
 2020 19:35:15 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 19:35:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWSjaj2amBwerG90am9uwqnJYeDKjoJlmAgAERSYCAAINvAA==
Date:   Thu, 25 Jun 2020 19:35:15 +0000
Message-ID: <daa160c6-ce69-93c4-a6ec-f4044541db3c@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
 <20200625114449.GF21325@pengutronix.de>
In-Reply-To: <20200625114449.GF21325@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b090c4f4-aee3-453a-d4dc-08d8193ee286
x-ms-traffictypediagnostic: BYAPR12MB3064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB306494CC29CE3DC53F65692CAA920@BYAPR12MB3064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Er6FdlA7yDUVQSI4YtCYuy+TvoLmxg8CTrHjtx4Wpy/Z52AKroatq5HNwaUIevfCk1R1BW8rEzanNUSbhqgNhQQDqgZqRuvJK+maXEcgdTaFJlMjjMXD3YwN5qd5FkoR5Xd9dMURGy7HjUJiaOsoJ9IEPakpzLQ7IROJbr+qN1uA3FSOR3uJqWlr8Z14PCsw6SP5zJDoLdOwqw9cvAOtv18Ar7wBU4efXOeafLL1JIKozWnHPC0oSu6UYgDgU+02lrlemAA9m2hKicQdvRsHfniMmu4Lao4rtOGefc90yNmq2+rIZj08FcALvO+s/ooegpX67BUK7DS57BcHwDBBl28qtVYNGWcLH8OBDaQep1iv9TnPQvxmC3Tb33+be+0mNOldwJdCfkaGM4Crx9JWX3nnDVnH4GZi5pWbqpNiH6opPF24fa3t1mbrLyQEjMjDKoHyF6awB1lzuXuByb7PbqBXNQvT3fejDuhYjhApRo4Qoj7BYJA73MDQaGMURSEtoXPz7Dzfg9teRM/Fy36K4zUhMcNwS1gGlNyzDLqFdTfT8qJdDbisTF6OANj9D4LHYucdOik2pmtAGDL7P3tqip9pnoHUpBG+A+Pxh+f2URu90uDBSfFg73W7DXiYTEnWRC3giXM5B+3PHNqff/Ikg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39860400002)(346002)(396003)(366004)(478600001)(2906002)(8936002)(86362001)(6512007)(54906003)(31696002)(8676002)(110136005)(31686004)(66946007)(66556008)(64756008)(66446008)(66476007)(76116006)(316002)(26005)(6506007)(36756003)(186003)(83380400001)(2616005)(4326008)(71200400001)(6486002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: S1OpEZJZK4nyi1SVChtuQNGtPfMTTgoqOVSU6gZm+AnC6x4BJgSL+HLp3JO+m2JAdZxalV+rRANf9kgGa23gJYBJG6H88mnb57dR4x+UOh+ayyKLT10JzXdbmmQRcly315K6KVu6EsyEtmD4lwnws8sNqp5JQxkUnjs30PF5It5gJSMj5l59M5oJD3UjypYD9ACScJjY5ONIhAhKiDrEGB/9UhL3oN3EDMicA5Iy/1uQdu3J2iM+pcAjqOK7DLpGi1P3ubFFKWTmaWd4NN33Iq95T4ea/ZTsxB7b03mX/KAd1s0mfgQflBvKE+R3lsRM2El/BbAaSWGvlyAQBCWyClpkHEjK0uSFfDT55EEcZBmlMQ7w8NDZCqzo6zAQNzSfMrK0Gm82575M2hUW9iV8prbbJ5vvPUVrbu55nkjfR+rT1ls5fb+lLU1SzKtsFy4NZFhVqndjTwEhOQ6mxPbYnU8KU+MzUvQZC1CcIIh1TqE=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <992FE401FFCB1643887AD6AB92D8ACBA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b090c4f4-aee3-453a-d4dc-08d8193ee286
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 19:35:15.0380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHx1EINkA3rF3DeRnkShMiyKbhczGh5OKmY8Op5TVK5aFHfSUVe0qSidPY5DVqXBZ/xg9F0LJ/LhMlge4AtH7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3064
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Michael Grzeschik wrote:
> Hi!
>
> On Wed, Jun 24, 2020 at 07:26:42PM +0000, Thinh Nguyen wrote:
>> Michael Grzeschik wrote:
>>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>>
>>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>>> XferNotReady. Otherwise the frame number is outdated and start transfer
>>> will fail, even with several retries.
>>
>> Did you try with the recent update for isoc? (e.i., after 5
>> START_TRANSFER failures, the driver will issue END_TRANSFER to retry on
>> the next XferNotReady event)
>>
>> Let me know if you still run into issues with that.
>
> Yes. Without my patch I still see the issue. Event with the retry
> machanism. It is even worse. I even missed one additional patch,
> I had on top this one. See my note below.

Ok. Can you clarify what issue you're seeing?

>
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
>>>
>>> =A0 drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++-----------=
-
>>> =A0 1 file changed, 25 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 421a0f73110a40b..0962ddd7fbf6ae6 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep=20
>>> *dep)
>>>
>>> =A0 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct=20
>>> dwc3_ep *dep);
>>>
>>> -static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
>>> +static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool=20
>>> keep_req)
>>
>> Any reason to have keep_req? With the recent changes, if
>> dwc3_send_gadget_ep_cmd() returns -EAGAIN, then the controller driver
>> won't give back the request.
>
> Yes, we don't need the keep_req. I tried this and it worked without.
> I will remove the parameter in v3.
>
>>> =A0 {
>>> =A0=A0=A0=A0=A0 struct dwc3_gadget_ep_cmd_params params;
>>> =A0=A0=A0=A0=A0 struct dwc3_request=A0=A0=A0=A0=A0=A0=A0 *req;
>>> @@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct=20
>>> dwc3_ep *dep)
>>> =A0=A0=A0=A0=A0 }
>>>
>>> =A0=A0=A0=A0=A0 ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>>> -=A0=A0=A0 if (ret < 0) {
>>> +=A0=A0=A0 if (ret < 0 && (!keep_req || ret !=3D -EAGAIN)) {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dwc3_request *tmp;
>>>
>>> -=A0=A0=A0=A0=A0=A0=A0 if (ret =3D=3D -EAGAIN)
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
>>> -
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3_stop_active_transfer(dep, true, true);
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_safe(req, tmp, &dep->st=
arted_list, list)
>>> @@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct=20
>>> dwc3_ep *dep)
>>> =A0=A0=A0=A0=A0 if (dep->stream_capable && req->request.is_last)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->flags |=3D DWC3_EP_WAIT_TRANSFER_COMPL=
ETE;
>>>
>>> -=A0=A0=A0 return 0;
>>> +=A0=A0=A0 return ret;
>>> =A0 }
>>>
>>> =A0 static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
>>> @@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct=20
>>> dwc3_ep *dep)
>>> =A0=A0=A0=A0=A0 dep->start_cmd_status =3D 0;
>>> =A0=A0=A0=A0=A0 dep->combo_num =3D 0;
>>>
>>> -=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep);
>>> +=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep, false);
>>> =A0 }
>>>
>>> =A0 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>> @@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct=20
>>> dwc3_ep *dep)
>>> =A0=A0=A0=A0=A0 }
>>>
>>> =A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>> -=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + =
1);
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
>>> +=A0=A0=A0=A0=A0=A0=A0 u32 frame =3D __dwc3_gadget_get_frame(dwc);
>>> +=A0=A0=A0=A0=A0=A0=A0 bool rollover =3D frame < (dep->frame_number & 0=
x3fff);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3f=
ff) | frame;
>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
>
> This is not enough, we have to add i into the alignment to ensure
> that the stream is not failing:
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALI=
GN_FRAME(dep, i + 2);
>
> I am even thiking to move the frame number calculation into the
> DWC3_DEPCMD_STARTTRANSFER code path of dwc3_send_gadget_ep_cmd. But this
> will break the dwc3_gadget_start_isoc_quirk function. What do you think?

You shouldn't be keep calling __dwc3_gadget_get_frame() in a loop. You=20
should do all these calculation to get the current frame_number only=20
once before entering the retry loop.

The issue here is we don't know when the XferNotReady event will be=20
handled, which may be too late and multiple uframe had gone by. But once=20
the event is being handled, it shouldn't take much time at all. That=20
means __dwc3_gadget_get_frame() will return the same value.

So, we need something like this:

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f66ff7fd87a9..1cd73c2dbe71 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1709,6 +1709,8 @@ static int dwc3_gadget_start_isoc_quirk(struct=20
dwc3_ep *dep)
 =A0static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 =A0{
 =A0=A0=A0=A0=A0=A0=A0 struct dwc3 *dwc =3D dep->dwc;
+=A0=A0=A0=A0=A0=A0 u32 current_frame;
+=A0=A0=A0=A0=A0=A0 bool rollover;
 =A0=A0=A0=A0=A0=A0=A0 int ret;
 =A0=A0=A0=A0=A0=A0=A0 int i;

@@ -1725,6 +1727,13 @@ static int __dwc3_gadget_start_isoc(struct=20
dwc3_ep *dep)
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retu=
rn dwc3_gadget_start_isoc_quirk(dep);
 =A0=A0=A0=A0=A0=A0=A0 }

+=A0=A0=A0=A0=A0=A0 current_frame =3D __dwc3_gadget_get_frame(dwc);
+=A0=A0=A0=A0=A0=A0 rollover =3D current_frame < (dep->frame_number & 0x3ff=
f);
+
+=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3fff) =
| current_frame;
+=A0=A0=A0=A0=A0=A0=A0 if (rollover)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
+
 =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_A=
LIGN_FRAME(dep, i + 1);


(Please create a macro for 0x3fff mask)

Thanks,
Thinh

