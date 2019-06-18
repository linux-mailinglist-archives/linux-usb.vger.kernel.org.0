Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37734AB3F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 21:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbfFRT6a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 15:58:30 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:56748 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730189AbfFRT6a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 15:58:30 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4DF3C019F;
        Tue, 18 Jun 2019 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560887909; bh=vERQjW5e5dzJHsAFeJr56L6ftlEacKrC7UQhFi7ZB94=;
        h=From:To:CC:Subject:Date:References:From;
        b=a1VgjKE6siija7bNizGN11iPYajY1EV+DiwhABQMo6zmcS8Dxnu+YmK96fdi7VKgq
         P4qKdVrHQ2zUj7i+vJFOqHXn8165KMtpXsklV7bsM4a2Hkt/huN+qwhoYKAPp4eQL0
         XoImLCix+6r98nCkLWcjtV0LcsACX0oDpj6qiPRsFPi2YmJwAoxWd4GvpHMR6uqBDC
         BF3zRbls/WydIh91LqYj4ar6otR2nnKdqFUFmYH58xj3QcLkglvmZ9LE6ugTiSlRQx
         q9T5TX7l39kunmL7QuKyVUKeNU/nLCtvomzg5ZXQYU6VcGkfSxi+C+SrvR9AL7OScJ
         8awlkz5MabLUQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 92CA4A0072;
        Tue, 18 Jun 2019 19:58:29 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WEHTC2.internal.synopsys.com ([10.12.239.237]) with mapi id
 14.03.0415.000; Tue, 18 Jun 2019 12:58:29 -0700
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZlsWV0TH3kp0u96EW7I6xXQg==
Date:   Tue, 18 Jun 2019 19:58:28 +0000
Message-ID: <30102591E157244384E984126FC3CB4F63A123A7@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
 <87fto7gy1o.fsf@linux.intel.com>
 <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.184.19]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thinh Nguyen wrote:=0A=
> Felipe Balbi wrote:=0A=
>> Hi,=0A=
>>=0A=
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:=0A=
>>>>>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct=0A=
>>>>> dwc3_request *req)=0A=
>>>>>=0A=
>>>>>=0A=
>>>>> Would there be any obvious draw-back to going down this route? The th=
ing=0A=
>>>>> is that, as it is, it seems like we will *always* have some corner ca=
se=0A=
>>>>> where we can't guarantee that we can even start a transfer since ther=
e's=0A=
>>>>> no upper-bound between XferNotReady and gadget driver finally queuein=
g a=0A=
>>>>> request. Also, I can't simply read DSTS for the frame number because =
of=0A=
>>>>> top-most 2 bits.=0A=
>>>>>=0A=
>>>> For non-affected version of the IP, the xfernotready -> starttransfer=
=0A=
>>>> time will have to be off by more than a couple seconds for the driver=
=0A=
>>>> to produce an incorrect 16-bit frame number. If you're seeing errors=
=0A=
>>>> here, maybe we just need to code review the relevant sections to make=
=0A=
>>>> sure the 14/16-bit and rollover conditions are all handled correctly.=
=0A=
>>> I think what Felipe may see is some delay in the system that causes the=
=0A=
>>> SW to not handle XferNotReady event in time. We already have the "retry=
"=0A=
>>> method handle that to a certain extend.=0A=
>>>=0A=
>>>> But I can't think of any obvious drawbacks of the quirk, other than=0A=
>>>> doing some unnecessary work, which shouldn't produce any bad=0A=
>>>> side-effects. But we haven't really tested that.=0A=
>>>>=0A=
>>> The workaround for the isoc_quirk requires 2 tries sending=0A=
>>> START_TRANSFER command. This means that you have to account the delay o=
f=0A=
>>> that command completion plus potentially 1 more END_TRANSFER completion=
.=0A=
>>> That's why the quirk gives a buffer of at least 4 uframes of the=0A=
>>> scheduled isoc frame. So, it cannot schedule immediately on the next=0A=
>>> uframe, that's one of the drawbacks.=0A=
>>>=0A=
>>>=0A=
>>> Hi Felipe,=0A=
>>>=0A=
>>> Since you're asking this, it means you're still seeing issue with your=
=0A=
>>> setup despite retrying to send START_TRANSFER command 5 times. What's=
=0A=
>>> the worse delay responding to XferNotReady you're seeing in your setup?=
=0A=
>> There's no upper-bound on how long the gadget will take to enqueue a=0A=
>> request. We see problems with UVC gadget all the time. It can take a lot=
=0A=
>> of time to decide to enqueue data.=0A=
> That's why there's a mechanism in the controller to return bus-expiry=0A=
> status to let the SW know if it had scheduled isoc too late. SW can do 2=
=0A=
> things: 1) re-schedule at a later timer or 2) send END_TRANSFER command=
=0A=
> to wait for the next XferNotReady to try again.=0A=
>=0A=
>> Usually I hear this from folks using UVC gadget with a real sensor on=0A=
>> the background.=0A=
>>=0A=
>> I've seen gadget enqueueing as far as 20 intervals in the future. But=0A=
>> remember, there's no upper-bound. And that's the problem. If we could=0A=
>> just read the frame number from DSTS and use that, we wouldn't have any=
=0A=
>> issues. But since DSTS only contains 14 our of the 16 bits the=0A=
>> controller needs, then we can't really use that.=0A=
> You can create another quirk for devices that have this behavior to use=
=0A=
> frame number in DSTS instead.  As John had pointed out and mentioned, =0A=
> this will only work if the service interval and the delay in the=0A=
> scheduling of isoc is within 2 seconds.=0A=
>=0A=
> You will need to calculate this value along with BIT(15) and BIT(14) of=
=0A=
> XferNotReady for rollovers.=0A=
>=0A=
>> To me, it seems like this part of the controller wasn't well=0A=
>> thought-out. These extra two bits, perhaps, should be internal to the=0A=
>> controller and SW should have no knowledge that they exist.=0A=
> These values are internal. SW should not have knowledge of it. This=0A=
> implementation will not follow the programming guide and should be used=
=0A=
> as a quirk for devices that are too slow to handle the XferNotReady=0A=
> event but want to schedule isoc immediately after handling the event.=0A=
>=0A=
=0A=
Correction: these values are not internal. (somehow I was thinking the=0A=
schedule time is calculated internally with the 16-bit value led me to=0A=
say that they are internal).=0A=
=0A=
Thinh=0A=
