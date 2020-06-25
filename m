Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F9E20A6B4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 22:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407130AbgFYUUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 16:20:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57174 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405161AbgFYUU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 16:20:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3268240164;
        Thu, 25 Jun 2020 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593116429; bh=4n4oLvLFCO/bHxDQ21j5BPw+BPjmwvt9o6UNia2avzM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TsgeRSwKe4fCiQ6vLRCOM47Z1Csewbik1RVOcXbvsoTtIjqn4WyKGc8ukx88c9vd+
         uwJv79H3KefR7jJIS4GIfHCdDdBtQjTynbcOTBn5b6qj5x8jufeyP4BIfSy1u9mKeX
         W968xKbUmB55L0JvKa5rROn6vHkuVEFRjUXZsES+f0ve5EtvBo9RFQ+3Dpo54T+nvs
         xUSzqH4lHDHZ9sMZpO5Z1QxcxvN41T1hjFmaYUzoe1dSpjN1HXQCFWlHi9vh3kZ8Ef
         VQE9FiOqW0SI3j/IyhpbkbZP5Ql+MdfCOCNzG3e14sg+C0SaiOIHmbBmN4oHiESDOq
         47EEM20VUzSVA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C112DA0071;
        Thu, 25 Jun 2020 20:20:28 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6EEB640143;
        Thu, 25 Jun 2020 20:20:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mImWkcm3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYVQUx/ydDu3JU0Q9tPUo3JB+OSS0NM8rMupNd66RKAbJlpZ/xwDY9SvAdL5iQ3UUcSUznLb1MCt77AccyGzwWQ1vGd4c105opuYB8s2V5Q2KG5Rih2rQLXYrl+FYkZ3muk7hzGANLR/AC5VU7g5A0ynnO6U7oSfr8MXcVmuICokWAZSsmfqk7koL+OBEooh2oWqHlORXG9B+GC6UefsByzMpS9H0bYmtn7bJXrLElh3itYxOxQvhayrn6x9IBfCOwYOX7g2DbpRFbgBzIMGsE4BbClPLnBt4Ljs8V70jFZMARJJuE69snq2fdR4CWSmLBe4RnFd8EpEgnWn3yidlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx/FPDoxGNTcrWSe0N9msEtF8uVkn78wTo/WBVaByGk=;
 b=EvwIZveXaeOFHxIc12rqxuc9vD8pJCkTVXjjPmPv6ucFM/mMyLqB8y9WgYqTphriFJXTwsIXtvKZG5VOOdxd+XZaIaFcUyvrBxujxjGCqD2dp5F2f7b9CaSzJ4gHleg0NFuhgzISWqSHK7s1cC+YTH5JuPkiKZMS+yn12kCMdJXrr8Rgvl8EAUyHlQze3Tj70LK8ZxxyvjwQqpVW6/A3cOGrL07pLFpCoxYDUCNoGqA2NoXEjI3tKkR0hSkgUP1n7BVFMSgSPWFqnkTRnwf0rYArxW6woCtfxSI4I5EwrBEXEYajxw30OYS3cZwq3ZynzDmOSeCu8dua91yi0nszqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx/FPDoxGNTcrWSe0N9msEtF8uVkn78wTo/WBVaByGk=;
 b=mImWkcm3bz6Y3pWygSyBJt48m/jcdOd7PdJu0wV+hazUiE2XY3fJ+WHzOLlvkn+ikp83sqKzbWW9AgfCVmOhCKokGq6BeDMY7OIjYVX9dxtA6k/rZrxy3o0Gez5BSg4vb/Ob+XxHUQvm7rs0wLQVBFpz4mdFmtJB7ASLhVekOtU=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3873.namprd12.prod.outlook.com (2603:10b6:a03:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 20:20:26 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 20:20:26 +0000
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
Thread-Index: AQHWSjaj2amBwerG90am9uwqnJYeDKjoJlmAgAERSYCAAINvAIAACu0AgAABtAA=
Date:   Thu, 25 Jun 2020 20:20:26 +0000
Message-ID: <6d5cb659-5aa0-298f-23b1-b1bc937ca844@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
 <20200625114449.GF21325@pengutronix.de>
 <daa160c6-ce69-93c4-a6ec-f4044541db3c@synopsys.com>
 <f66f8231-b514-c63f-e8b2-2f7d4d67c8d8@synopsys.com>
In-Reply-To: <f66f8231-b514-c63f-e8b2-2f7d4d67c8d8@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 3e271eda-4cbf-4cc2-b12f-08d8194532bf
x-ms-traffictypediagnostic: BY5PR12MB3873:
x-microsoft-antispam-prvs: <BY5PR12MB38737E56CDE8D4F747CD1DCDAA920@BY5PR12MB3873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /oYU08myUslWRC2SS/PL+8BKDMnmlgYqHWsBrwBqJY/sk3LkImGGp1vAdpaPedAzUuzrdEdCmrGAm5SCB+YWzsJRrLUS34jYiqd/t0QKvPLlP4/kHwvMQsFmVKB5MZg6L8/RAtZ9ljO8KKeBcqbiezofsGCwlVvK9QoX7prXBr1v+ERHGI74j5COCxo/6T6atEwwveviNS5vngInHcmtHvwr6k12NP68GVgNGICa5J+rtgFYfgdqPjj8ZGyzS4Fz4EsoVIYO7QNE3XSoi56dqswthBE9ewxKiaxvVy3+Tt8+RtAHDAmCqfrRlJJ5L/epujdewb6VHbaJoso5JEjLCEFjBbrhVEKpCfQEpRUbzwunCiJ9qYEFvjeiO+TfL+P07rXcDpmIwvARUuymztGmPFl6CBBGLe2UU2S0l4vw8iudanjk/5EsF0PGSfui5+3S0LzDCWbVelKjUeFwC9Dja7p81Ya6I5L6+QX3ro9MxvIBTeUCo3MO7oRVWzQ2/AhvyO3mQHt7BWk9wsmylI6IzZQu1WhlitWC9kF05B3IuyXrdd+txtSr8VD05wdLn9gaK/JPyYZuQoORR7CUzRKjbbt469kATTPjXIcHx9Q8P5iLyORopKPRtUvY89+Vv4jhflitJA9cKv4yImHsCTC1xA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(376002)(346002)(39860400002)(136003)(36756003)(8676002)(6486002)(6916009)(71200400001)(8936002)(186003)(31696002)(26005)(31686004)(2616005)(2906002)(6506007)(6512007)(5660300002)(76116006)(86362001)(66946007)(478600001)(316002)(54906003)(83380400001)(4326008)(64756008)(66476007)(66556008)(66446008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CZhixal9iGfOZ5JN3Z3/qdEjmueIO0biuqeXR4h707hKhS3REi8ejw5kjeXNyni8J2iqmzTmq4xchwC8CNQ1PqriCOUBsboeUzH8evqpGT68FBQ3g9N0lalazxiVDbyodV12ovqlcWfJQwvd7rVHux5gE0hlhuNdsWYvz5oYmfeDAtmye1k8BNeX66zBbnVvDxL6B2t3SFSC8PP3kcqvqgQwig76QGu/sZ9ltwBGawcc5i5YZC0sgnQmdPyqIQslHrjWC6jhPJ+DUzTMEw9hak7ri9uzBFGebq9gN2SqjVvN5S8fZufhgXh/3J+AgNuag8y0i4h9QBErslGELH86DowB9AXzJKs+YpxGGS/xin5QTllWUP/nVHHdJevXLgofgDmZoZRAKtYFys3eY7kdlv5QoRVL3l7nBtRrn9leJYr2kLwA247BH0bJ00NV5cIJ6LPcw6D3MhTJ1SLflhTpRQRACSxqnUaIImYiAiqTz58=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <9604A332CA739E4BAC9C4E8FCA1BFBD0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e271eda-4cbf-4cc2-b12f-08d8194532bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 20:20:26.7426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lR9PY0mCs3gE7Vj1iV69t0cr5gUhj2lkjdCR9sUtb8HEr+hoLzSu/YWv9yiE6vQrQF25CyLDGfyQy4Sl1bwVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3873
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thinh Nguyen wrote:
> Thinh Nguyen wrote:
>> Hi,
>>
>> Michael Grzeschik wrote:
>>> Hi!
>>>
>>> On Wed, Jun 24, 2020 at 07:26:42PM +0000, Thinh Nguyen wrote:
>>>> Michael Grzeschik wrote:
>>>>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>>>>
>>>>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>>>>> XferNotReady. Otherwise the frame number is outdated and start transf=
er
>>>>> will fail, even with several retries.
>>>> Did you try with the recent update for isoc? (e.i., after 5
>>>> START_TRANSFER failures, the driver will issue END_TRANSFER to retry o=
n
>>>> the next XferNotReady event)
>>>>
>>>> Let me know if you still run into issues with that.
>>> Yes. Without my patch I still see the issue. Event with the retry
>>> machanism. It is even worse. I even missed one additional patch,
>>> I had on top this one. See my note below.
>> Ok. Can you clarify what issue you're seeing?
>>
>>>>> DSTS provides the lower 14 bit of the frame number. Use it in
>>>>> combination
>>>>> with the frame number provided by XferNotReady to guess the current
>>>>> frame
>>>>> number. This will succeed unless more than one 14 rollover has happen=
ed
>>>>> since XferNotReady.
>>>>>
>>>>> Start transfer might still fail if the frame number is increased
>>>>> immediately after DSTS is read. So retries are still needed.
>>>>> Don't drop the current request if this happens. This way it is not
>>>>> lost and
>>>>> can be used immediately to try again with the next frame number.
>>>>>
>>>>> With this change, __dwc3_gadget_start_isoc is still not successfully
>>>>> in all
>>>>> cases bit it increases the acceptable delay after XferNotReady
>>>>> significantly.
>>>>>
>>>>> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>
>>>>> ---
>>>>> v1 -> v2: - removed last_frame_number from struct
>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - included rollover variable
>>>>>
>>>>>   =A0 drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++-------=
-----
>>>>>   =A0 1 file changed, 25 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>> index 421a0f73110a40b..0962ddd7fbf6ae6 100644
>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>> @@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep
>>>>> *dep)
>>>>>
>>>>>   =A0 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct
>>>>> dwc3_ep *dep);
>>>>>
>>>>> -static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
>>>>> +static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool
>>>>> keep_req)
>>>> Any reason to have keep_req? With the recent changes, if
>>>> dwc3_send_gadget_ep_cmd() returns -EAGAIN, then the controller driver
>>>> won't give back the request.
>>> Yes, we don't need the keep_req. I tried this and it worked without.
>>> I will remove the parameter in v3.
>>>
>>>>>   =A0 {
>>>>>   =A0=A0=A0=A0=A0 struct dwc3_gadget_ep_cmd_params params;
>>>>>   =A0=A0=A0=A0=A0 struct dwc3_request=A0=A0=A0=A0=A0=A0=A0 *req;
>>>>> @@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct
>>>>> dwc3_ep *dep)
>>>>>   =A0=A0=A0=A0=A0 }
>>>>>
>>>>>   =A0=A0=A0=A0=A0 ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>>>>> -=A0=A0=A0 if (ret < 0) {
>>>>> +=A0=A0=A0 if (ret < 0 && (!keep_req || ret !=3D -EAGAIN)) {
>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dwc3_request *tmp;
>>>>>
>>>>> -=A0=A0=A0=A0=A0=A0=A0 if (ret =3D=3D -EAGAIN)
>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
>>>>> -
>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3_stop_active_transfer(dep, true, tr=
ue);
>>>>>
>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_safe(req, tmp, &dep=
->started_list, list)
>>>>> @@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct
>>>>> dwc3_ep *dep)
>>>>>   =A0=A0=A0=A0=A0 if (dep->stream_capable && req->request.is_last)
>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->flags |=3D DWC3_EP_WAIT_TRANSFER_C=
OMPLETE;
>>>>>
>>>>> -=A0=A0=A0 return 0;
>>>>> +=A0=A0=A0 return ret;
>>>>>   =A0 }
>>>>>
>>>>>   =A0 static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
>>>>> @@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct
>>>>> dwc3_ep *dep)
>>>>>   =A0=A0=A0=A0=A0 dep->start_cmd_status =3D 0;
>>>>>   =A0=A0=A0=A0=A0 dep->combo_num =3D 0;
>>>>>
>>>>> -=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep);
>>>>> +=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep, false);
>>>>>   =A0 }
>>>>>
>>>>>   =A0 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>>>> @@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct
>>>>> dwc3_ep *dep)
>>>>>   =A0=A0=A0=A0=A0 }
>>>>>
>>>>>   =A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>>>> -=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i =
+ 1);
>>>>> +=A0=A0=A0=A0=A0=A0=A0 /*
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number is set from XferNotReady and=
 may be already
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * out of date. DSTS only provides the lower=
 14 bit of the
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * current frame number. So add the upper tw=
o bits of
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number and handle a possible rollov=
er.
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * This will provide the correct frame_numbe=
r unless more than
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * rollover has happened since XferNotReady.
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 */
>>>>> +=A0=A0=A0=A0=A0=A0=A0 u32 frame =3D __dwc3_gadget_get_frame(dwc);
>>>>> +=A0=A0=A0=A0=A0=A0=A0 bool rollover =3D frame < (dep->frame_number &=
 0x3fff);
>>>>> +
>>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x=
3fff) | frame;
>>>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>>>> +
>>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1)=
;
>>> This is not enough, we have to add i into the alignment to ensure
>>> that the stream is not failing:
>>>
>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3=
_ALIGN_FRAME(dep, i + 2);
>>>
>>> I am even thiking to move the frame number calculation into the
>>> DWC3_DEPCMD_STARTTRANSFER code path of dwc3_send_gadget_ep_cmd. But thi=
s
>>> will break the dwc3_gadget_start_isoc_quirk function. What do you think=
?
>> You shouldn't be keep calling __dwc3_gadget_get_frame() in a loop. You
>> should do all these calculation to get the current frame_number only
>> once before entering the retry loop.
>>
>> The issue here is we don't know when the XferNotReady event will be
>> handled, which may be too late and multiple uframe had gone by. But once
>> the event is being handled, it shouldn't take much time at all. That
>> means __dwc3_gadget_get_frame() will return the same value.
>>
>> So, we need something like this:
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index f66ff7fd87a9..1cd73c2dbe71 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1709,6 +1709,8 @@ static int dwc3_gadget_start_isoc_quirk(struct
>> dwc3_ep *dep)
>>    =A0static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>    =A0{
>>    =A0=A0=A0=A0=A0=A0=A0 struct dwc3 *dwc =3D dep->dwc;
>> +=A0=A0=A0=A0=A0=A0 u32 current_frame;
>> +=A0=A0=A0=A0=A0=A0 bool rollover;
>>    =A0=A0=A0=A0=A0=A0=A0 int ret;
>>    =A0=A0=A0=A0=A0=A0=A0 int i;
>>
>> @@ -1725,6 +1727,13 @@ static int __dwc3_gadget_start_isoc(struct
>> dwc3_ep *dep)
>>    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 return dwc3_gadget_start_isoc_quirk(dep);
>>    =A0=A0=A0=A0=A0=A0=A0 }
>>
>> +=A0=A0=A0=A0=A0=A0 current_frame =3D __dwc3_gadget_get_frame(dwc);
>> +=A0=A0=A0=A0=A0=A0 rollover =3D current_frame < (dep->frame_number & 0x=
3fff);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3ff=
f) | current_frame;
>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>> +
>>    =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D D=
WC3_ALIGN_FRAME(dep, i + 1);
>>
>>
>> (Please create a macro for 0x3fff mask)
>>
> Forgot a couple of notes:
>
> 1) If bInterval is greater than 14, don't attempt to get current frame
> from DSTS and ignore this mechanism.
> 2) The rollover check needs to account for number of uframes per
> interval. If the difference is less than an interval length, then no
> need to update dep->frame_number.
>

Ignore number 2), DWC3_ALIGN_FRAME() should take care of that...

BR,
Thinh
