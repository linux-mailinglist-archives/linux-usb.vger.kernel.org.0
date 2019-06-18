Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC2C4A99A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 20:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbfFRSPG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 14:15:06 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:51590 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729993AbfFRSPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 14:15:06 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B34B8C0168;
        Tue, 18 Jun 2019 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560881705; bh=7wVtfsmfxUfIw+LPrmGJPTnDRIskv2eGTf5KZ+mwiv8=;
        h=From:To:CC:Subject:Date:References:From;
        b=IXH/3yhFt6orVfdVm7NAUdl2d5ipd9LSAoLxrnWYpqmPGH21f7NwJytrgj3FpfOPK
         5WU8dpRUCJPgP5TJCm8iRbCzHPsWaFwYCeLvs3qiabknlMDVcTvX6cL16H1/PIobzn
         FF63MKTUJqsN96ro2SEKhA4Ktvsidlb5ng6xh+FC8YJbrHQBD1VxSD8pnsc05Wsb4g
         A7zqzo9Whm8V3Xsq13I/oL+zS83SgFTREco8rOzdzR97xPmHZSdlxNlsDsXJDuLysH
         z6DIUwFIwkMFWLZWmLA9gONDuRGArNgXWCySbXbrk9sumlOQllkdjD7IlUw8PeGHX7
         6Ff9qT6Y6WA1g==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 71BF8A009A;
        Tue, 18 Jun 2019 18:15:05 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WXQAHTC1.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000; Tue,
 18 Jun 2019 11:15:04 -0700
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZlsWV0TH3kp0u96EW7I6xXQg==
Date:   Tue, 18 Jun 2019 18:15:03 +0000
Message-ID: <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
 <87fto7gy1o.fsf@linux.intel.com>
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

Felipe Balbi wrote:=0A=
> Hi,=0A=
>=0A=
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:=0A=
>>>>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct=0A=
>>>> dwc3_request *req)=0A=
>>>>=0A=
>>>>=0A=
>>>> Would there be any obvious draw-back to going down this route? The thi=
ng=0A=
>>>> is that, as it is, it seems like we will *always* have some corner cas=
e=0A=
>>>> where we can't guarantee that we can even start a transfer since there=
's=0A=
>>>> no upper-bound between XferNotReady and gadget driver finally queueing=
 a=0A=
>>>> request. Also, I can't simply read DSTS for the frame number because o=
f=0A=
>>>> top-most 2 bits.=0A=
>>>>=0A=
>>> For non-affected version of the IP, the xfernotready -> starttransfer=
=0A=
>>> time will have to be off by more than a couple seconds for the driver=
=0A=
>>> to produce an incorrect 16-bit frame number. If you're seeing errors=0A=
>>> here, maybe we just need to code review the relevant sections to make=
=0A=
>>> sure the 14/16-bit and rollover conditions are all handled correctly.=
=0A=
>> I think what Felipe may see is some delay in the system that causes the=
=0A=
>> SW to not handle XferNotReady event in time. We already have the "retry"=
=0A=
>> method handle that to a certain extend.=0A=
>>=0A=
>>> But I can't think of any obvious drawbacks of the quirk, other than=0A=
>>> doing some unnecessary work, which shouldn't produce any bad=0A=
>>> side-effects. But we haven't really tested that.=0A=
>>>=0A=
>> The workaround for the isoc_quirk requires 2 tries sending=0A=
>> START_TRANSFER command. This means that you have to account the delay of=
=0A=
>> that command completion plus potentially 1 more END_TRANSFER completion.=
=0A=
>> That's why the quirk gives a buffer of at least 4 uframes of the=0A=
>> scheduled isoc frame. So, it cannot schedule immediately on the next=0A=
>> uframe, that's one of the drawbacks.=0A=
>>=0A=
>>=0A=
>> Hi Felipe,=0A=
>>=0A=
>> Since you're asking this, it means you're still seeing issue with your=
=0A=
>> setup despite retrying to send START_TRANSFER command 5 times. What's=0A=
>> the worse delay responding to XferNotReady you're seeing in your setup?=
=0A=
> There's no upper-bound on how long the gadget will take to enqueue a=0A=
> request. We see problems with UVC gadget all the time. It can take a lot=
=0A=
> of time to decide to enqueue data.=0A=
=0A=
That's why there's a mechanism in the controller to return bus-expiry=0A=
status to let the SW know if it had scheduled isoc too late. SW can do 2=0A=
things: 1) re-schedule at a later timer or 2) send END_TRANSFER command=0A=
to wait for the next XferNotReady to try again.=0A=
=0A=
> Usually I hear this from folks using UVC gadget with a real sensor on=0A=
> the background.=0A=
>=0A=
> I've seen gadget enqueueing as far as 20 intervals in the future. But=0A=
> remember, there's no upper-bound. And that's the problem. If we could=0A=
> just read the frame number from DSTS and use that, we wouldn't have any=
=0A=
> issues. But since DSTS only contains 14 our of the 16 bits the=0A=
> controller needs, then we can't really use that.=0A=
=0A=
You can create another quirk for devices that have this behavior to use=0A=
frame number in DSTS instead.  As John had pointed out and mentioned, =0A=
this will only work if the service interval and the delay in the=0A=
scheduling of isoc is within 2 seconds.=0A=
=0A=
You will need to calculate this value along with BIT(15) and BIT(14) of=0A=
XferNotReady for rollovers.=0A=
=0A=
>=0A=
> To me, it seems like this part of the controller wasn't well=0A=
> thought-out. These extra two bits, perhaps, should be internal to the=0A=
> controller and SW should have no knowledge that they exist.=0A=
=0A=
These values are internal. SW should not have knowledge of it. This=0A=
implementation will not follow the programming guide and should be used=0A=
as a quirk for devices that are too slow to handle the XferNotReady=0A=
event but want to schedule isoc immediately after handling the event.=0A=
=0A=
> In any case, this is the biggest sort of issues in DWC3 right now :-)=0A=
>=0A=
> Anything else seems to behave nicely without any problems.=0A=
>=0A=
=0A=
BR,=0A=
Thinh=0A=
