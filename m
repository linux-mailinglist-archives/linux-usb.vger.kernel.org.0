Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A490820A67B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 22:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407070AbgFYUOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 16:14:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54338 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405370AbgFYUO3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 16:14:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CCA08C0088;
        Thu, 25 Jun 2020 20:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593116068; bh=Tdx6LGF75upNVdgoig5owNZKd0qJ4+nGz/Z88Y2Ojs4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HGJTfUbKcLWsu+uvKpTECgGVAcpYceePzMNmc6hkVqD1S5qkRXgEeaAyBVSS6l6+W
         j4PPWmIIDQiw5uXlvImHP+4BA6tZtFmu8xTPX+NA+z8bnzjQD4nhR+Dp/tDpU23kIZ
         orORdm1A2dbGLveeITEvm4zFAg3isyoG/8hBeRALBl7g84DupOewousQ7GWjn22Fud
         NdI5YR+AOmbDBNPAL9yMps+gO96Xc2GHInNHrhNV3ErByPl27dLIAt/I8DLxraOiE/
         TvjkAJJ38MThG0efYvnRt4/fM4TT3lGDm05Acbi/ttSskLpLe30BI5Rw2J5j0my3+L
         hHNYbB1dB340g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 04DEFA0071;
        Thu, 25 Jun 2020 20:14:25 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E3C35800CA;
        Thu, 25 Jun 2020 20:14:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="slgoY4W0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1v2X3hljFV/LKuYqKqb0s6n4rG6RToJhCNLxA04uqc7t10ONF5jvsh04oZ4uuyNaz0+CIC941QgwQL5FzKtrENXZoO4gTZFBHj4f+5bHqRsr4NgUmXg9gKlHu9Jd7E04wWtOFgggxFySSm6oLQgQla2reFR1ThFOSw5kInmhJ/1D/kSEOeUVYwxFM4V/08F8x7DlkaqGvwA9cUbI9dBlK/E7pa4px42rOEZMEzwpQpeOBAm4mwaoOieybRR5aPaqvY7iWOw4a5mcsoynA3ROMZ/5f5vuKEuktaQBLRC0MzMwLp56IRP2cGHm6+uXKeZvlacGl7mRvV75SgYKaA4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3ciA8khQ8baehEObls0M+78cj4KGbthyCVMyzA4/A8=;
 b=XtFJTcMqzld0DjdVyWUeQ7qfFMJjasilvmGBDeoLeKlzNcLgckEMB+pR3Afn286MXyTmBfIVseQkiMqIG9Ezm9V0W9BSDUsckZI8XASsaxr4FklQMS/jN4N18HxPiNvz3tUjs+J4zGUrRffFNzK7hXE8lMLH822EJQERHstR4ChBophcOkaKFNj1ffduGvJTtkdKmbkOOHDadyfQ8B+YA9Db3KpF993Ju3ehGrnycLMTz04ORrWkPV+vvGiUagytCN6nimIg5+DiAFCZ4sS8reXsZ7A1rdyyaPtgCyWBKCU5DvojkWS+TOiS4SWw2XRrWQY7NCrXdX1BOxCmLcZS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3ciA8khQ8baehEObls0M+78cj4KGbthyCVMyzA4/A8=;
 b=slgoY4W0yYAHkH7XfgRiSkW/7kO599IezKUd5NMn7tNHqGPJ64fV0D2Jtt/SSb3KIBV0CQ5vLJeOAB4iUATNg8LuZZ+PJJUEGHqnBinMHx4kLO4wFxM/lUn6xHj6IljUetsiBREN4Mug+ofa06xjP9eodcbrVh7ZdqyZELYB8cg=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3796.namprd12.prod.outlook.com (2603:10b6:a03:1ae::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 20:14:22 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 20:14:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWSjaj2amBwerG90am9uwqnJYeDKjoJlmAgAERSYCAAINvAIAACu0A
Date:   Thu, 25 Jun 2020 20:14:22 +0000
Message-ID: <f66f8231-b514-c63f-e8b2-2f7d4d67c8d8@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
 <20200625114449.GF21325@pengutronix.de>
 <daa160c6-ce69-93c4-a6ec-f4044541db3c@synopsys.com>
In-Reply-To: <daa160c6-ce69-93c4-a6ec-f4044541db3c@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 873532ab-9c9f-44d2-d1c8-08d8194459bc
x-ms-traffictypediagnostic: BY5PR12MB3796:
x-microsoft-antispam-prvs: <BY5PR12MB3796ADFDEB6738A9AB4BB0F7AA920@BY5PR12MB3796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SBUaFM7+QA+mK4PiqdFrz+1wepJJuDxAdFAibxBZufB2WIA4byf1gAQ/GdO6YDEoETv+vUzuz8xIozUBjiB2FDSO9TLFk+bfrUDXlX4qGoNx3EM5uiwNAwtJX5tqv/Y9pWtpD5qMitP85nT7DrwnN+0LnUnVA0OB64vnvnxFiyJME/3Tv+WjFvY91CL3PO1ib9ryK8rcTq+BLOZK9Tku49KiiwpWmStNYTu7Ir2SpSf+gPEmjv7xqh2W7tDCdjwu6ZfvZTQ+mIt9n/9piGGXxAiGIkseN8VvYvaD8KM4pqT+wcfIgBPSkAt6fZKFfRtwEw8JVgDDmKwVZOcvhlMCHSpewwBiXXmCVoXnSmQfVXCIYoxAMd/CPbxPCtsi7jtzq52dH6O6DTdP942QweFdL/1RoAvCExZmtlhH9gqf0MHCia4FDmHaQa5oI7SMnzK02z74AwT3z4uNCpVkm+tQ5FS9Ly+Zwx7w8bOZAYkb4K1JW1p6Kc0fa9e0fncmZQfk9GBzlXzz2mm5tngpMeUxvQiXmPKKt5/w0d8zKHVPCDClQnshtK+kurHMjw6NxRvpCOfMSwMWrm77kyNr8LAeSN+ZmshFJJG+0uEg9K1MUe/OeZ+Z+cCRc7HwLbt/ihVSvYSMxq2S2Iai3iKvwPBAng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(396003)(376002)(136003)(39860400002)(478600001)(64756008)(5660300002)(66556008)(76116006)(2906002)(36756003)(66476007)(66446008)(66946007)(71200400001)(6512007)(6916009)(6486002)(4326008)(26005)(86362001)(186003)(31696002)(2616005)(83380400001)(316002)(31686004)(8676002)(54906003)(8936002)(6506007)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: wWWxZNjIYKiHk0K1/Z4L8WY+4NItCzhSD1D7gwtL0vsXEiNVilBTuQE9FpARqwV/h1XyEhbYKUjIDXvahJVA1zwZKqEQqd8WnMqvhJCMgqFU6QZylWcLejuCJ1C7wQanLe5azgptaFwwC8ozl3OaRB1niUtFfrxLGkHxm3Jj0lS5ZR4OQyAEYuJNgXvVr7NRtE2q+w7ayRiJWSTBPQz4P7GGrX2CUzgGpuxNHYqK+YWrL5H/NnOmhcGWXdVN5wQ7JnIMZJxfbL1tFyw1F2l56Wa+AicOc9QoxcE/ScGYur6C7O2HI6SvmHEfXUuCsvO3qxyiNT17ivU+G6Xx/PMYytJYmmn6ij+er0TNA0OrW4om7vu3xXqTWjxNZUeXQ4erT9vGrK72pvfo/gI6tc9tApD4Lg7y9eALT0Ws8mh9FpQd0VxPKYbe1VoBRBwtKIVAYThU4bwC51jdCT0bWMGPSVgppOz5oOijz9/Y9UqDYVo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <7B502EAA5A41A346878AADB599ED1A0E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873532ab-9c9f-44d2-d1c8-08d8194459bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 20:14:22.6102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xxim7ZxqhoQqG7DhXlfiz8CELn2khU2uzjOnGqGdbE7ALAku8Rs5tle68G7S32nkBWC+K4+5IWQ0Ix7OoNMOlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3796
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thinh Nguyen wrote:
> Hi,
>
> Michael Grzeschik wrote:
>> Hi!
>>
>> On Wed, Jun 24, 2020 at 07:26:42PM +0000, Thinh Nguyen wrote:
>>> Michael Grzeschik wrote:
>>>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>>>
>>>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>>>> XferNotReady. Otherwise the frame number is outdated and start transfe=
r
>>>> will fail, even with several retries.
>>> Did you try with the recent update for isoc? (e.i., after 5
>>> START_TRANSFER failures, the driver will issue END_TRANSFER to retry on
>>> the next XferNotReady event)
>>>
>>> Let me know if you still run into issues with that.
>> Yes. Without my patch I still see the issue. Event with the retry
>> machanism. It is even worse. I even missed one additional patch,
>> I had on top this one. See my note below.
> Ok. Can you clarify what issue you're seeing?
>
>>>> DSTS provides the lower 14 bit of the frame number. Use it in
>>>> combination
>>>> with the frame number provided by XferNotReady to guess the current
>>>> frame
>>>> number. This will succeed unless more than one 14 rollover has happene=
d
>>>> since XferNotReady.
>>>>
>>>> Start transfer might still fail if the frame number is increased
>>>> immediately after DSTS is read. So retries are still needed.
>>>> Don't drop the current request if this happens. This way it is not
>>>> lost and
>>>> can be used immediately to try again with the next frame number.
>>>>
>>>> With this change, __dwc3_gadget_start_isoc is still not successfully
>>>> in all
>>>> cases bit it increases the acceptable delay after XferNotReady
>>>> significantly.
>>>>
>>>> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>
>>>> ---
>>>> v1 -> v2: - removed last_frame_number from struct
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - included rollover variable
>>>>
>>>>  =A0 drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++---------=
---
>>>>  =A0 1 file changed, 25 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index 421a0f73110a40b..0962ddd7fbf6ae6 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep
>>>> *dep)
>>>>
>>>>  =A0 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct
>>>> dwc3_ep *dep);
>>>>
>>>> -static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
>>>> +static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool
>>>> keep_req)
>>> Any reason to have keep_req? With the recent changes, if
>>> dwc3_send_gadget_ep_cmd() returns -EAGAIN, then the controller driver
>>> won't give back the request.
>> Yes, we don't need the keep_req. I tried this and it worked without.
>> I will remove the parameter in v3.
>>
>>>>  =A0 {
>>>>  =A0=A0=A0=A0=A0 struct dwc3_gadget_ep_cmd_params params;
>>>>  =A0=A0=A0=A0=A0 struct dwc3_request=A0=A0=A0=A0=A0=A0=A0 *req;
>>>> @@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct
>>>> dwc3_ep *dep)
>>>>  =A0=A0=A0=A0=A0 }
>>>>
>>>>  =A0=A0=A0=A0=A0 ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>>>> -=A0=A0=A0 if (ret < 0) {
>>>> +=A0=A0=A0 if (ret < 0 && (!keep_req || ret !=3D -EAGAIN)) {
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dwc3_request *tmp;
>>>>
>>>> -=A0=A0=A0=A0=A0=A0=A0 if (ret =3D=3D -EAGAIN)
>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
>>>> -
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3_stop_active_transfer(dep, true, true=
);
>>>>
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_safe(req, tmp, &dep->=
started_list, list)
>>>> @@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct
>>>> dwc3_ep *dep)
>>>>  =A0=A0=A0=A0=A0 if (dep->stream_capable && req->request.is_last)
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->flags |=3D DWC3_EP_WAIT_TRANSFER_COM=
PLETE;
>>>>
>>>> -=A0=A0=A0 return 0;
>>>> +=A0=A0=A0 return ret;
>>>>  =A0 }
>>>>
>>>>  =A0 static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
>>>> @@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct
>>>> dwc3_ep *dep)
>>>>  =A0=A0=A0=A0=A0 dep->start_cmd_status =3D 0;
>>>>  =A0=A0=A0=A0=A0 dep->combo_num =3D 0;
>>>>
>>>> -=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep);
>>>> +=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep, false);
>>>>  =A0 }
>>>>
>>>>  =A0 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>>> @@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct
>>>> dwc3_ep *dep)
>>>>  =A0=A0=A0=A0=A0 }
>>>>
>>>>  =A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>>> -=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i +=
 1);
>>>> +=A0=A0=A0=A0=A0=A0=A0 /*
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number is set from XferNotReady and =
may be already
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * out of date. DSTS only provides the lower =
14 bit of the
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * current frame number. So add the upper two=
 bits of
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number and handle a possible rollove=
r.
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * This will provide the correct frame_number=
 unless more than
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * rollover has happened since XferNotReady.
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 */
>>>> +=A0=A0=A0=A0=A0=A0=A0 u32 frame =3D __dwc3_gadget_get_frame(dwc);
>>>> +=A0=A0=A0=A0=A0=A0=A0 bool rollover =3D frame < (dep->frame_number & =
0x3fff);
>>>> +
>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3=
fff) | frame;
>>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>>> +
>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
>> This is not enough, we have to add i into the alignment to ensure
>> that the stream is not failing:
>>
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_A=
LIGN_FRAME(dep, i + 2);
>>
>> I am even thiking to move the frame number calculation into the
>> DWC3_DEPCMD_STARTTRANSFER code path of dwc3_send_gadget_ep_cmd. But this
>> will break the dwc3_gadget_start_isoc_quirk function. What do you think?
> You shouldn't be keep calling __dwc3_gadget_get_frame() in a loop. You
> should do all these calculation to get the current frame_number only
> once before entering the retry loop.
>
> The issue here is we don't know when the XferNotReady event will be
> handled, which may be too late and multiple uframe had gone by. But once
> the event is being handled, it shouldn't take much time at all. That
> means __dwc3_gadget_get_frame() will return the same value.
>
> So, we need something like this:
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index f66ff7fd87a9..1cd73c2dbe71 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1709,6 +1709,8 @@ static int dwc3_gadget_start_isoc_quirk(struct
> dwc3_ep *dep)
>   =A0static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>   =A0{
>   =A0=A0=A0=A0=A0=A0=A0 struct dwc3 *dwc =3D dep->dwc;
> +=A0=A0=A0=A0=A0=A0 u32 current_frame;
> +=A0=A0=A0=A0=A0=A0 bool rollover;
>   =A0=A0=A0=A0=A0=A0=A0 int ret;
>   =A0=A0=A0=A0=A0=A0=A0 int i;
>
> @@ -1725,6 +1727,13 @@ static int __dwc3_gadget_start_isoc(struct
> dwc3_ep *dep)
>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn dwc3_gadget_start_isoc_quirk(dep);
>   =A0=A0=A0=A0=A0=A0=A0 }
>
> +=A0=A0=A0=A0=A0=A0 current_frame =3D __dwc3_gadget_get_frame(dwc);
> +=A0=A0=A0=A0=A0=A0 rollover =3D current_frame < (dep->frame_number & 0x3=
fff);
> +
> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3fff=
) | current_frame;
> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
> +
>   =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC=
3_ALIGN_FRAME(dep, i + 1);
>
>
> (Please create a macro for 0x3fff mask)
>

Forgot a couple of notes:

1) If bInterval is greater than 14, don't attempt to get current frame=20
from DSTS and ignore this mechanism.
2) The rollover check needs to account for number of uframes per=20
interval. If the difference is less than an interval length, then no=20
need to update dep->frame_number.

BR,
Thinh

