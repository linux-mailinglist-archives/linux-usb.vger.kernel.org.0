Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49A3398783
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 13:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFBLCx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 07:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFBLCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 07:02:53 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4839DC061574
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 04:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qkBMq7r6cdGdUkenYOhDUQMNl1GXwAihh8HwClI++KI=; b=V8M72943ejmHEUFXz7FGo1GBnE
        /fdFzOaZaXkDZeDVgjOlOQuooHKlDI6ui1U1ec7aEKgFBkA5dW4wkAEoHiwDnOwrOkDyJo91bRxJR
        MHpwyHQUQEqzbFmVeMzLRetQRlbFl7GjNOgOusNFMaOIXH2PcWH1KpnE+8B+B6v04TeE9JuH6Qe/U
        kH6wG74wtS9R2gkdifpfuey3E6UihYQ2zRgmcdekrdOuUM0XnjiNkriTl+sPrFVQXjV7DQALEP2bX
        JAdc9eluTeWDnv+SzRhiusfc/QkYJtAby+GC8NoCQNAkG1V41IbYz6mYueRXJqxC7qh5INSFEes1i
        dtP07wIQ==;
Received: from 87-100-214-56.bb.dnainternet.fi ([87.100.214.56] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1loOcU-0005OX-A0; Wed, 02 Jun 2021 14:01:06 +0300
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
To:     Johan Hovold <johan@kernel.org>,
        Eero Lehtinen <debiangamer2@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
 <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
 <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
 <YLShgrnPV35aXz84@hovoldconsulting.com>
 <CAHS3B0H8zeDgbP6k+9TMeG07di6dO7FxH-WowN9NJ=8Gt+ZZeg@mail.gmail.com>
 <YLSovrmj3AgwUUGm@hovoldconsulting.com>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <660772b3-0597-02db-ed94-c6a9be04e8e8@iki.fi>
Date:   Wed, 2 Jun 2021 14:01:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLSovrmj3AgwUUGm@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 87.100.214.56
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/31/21 12:13 PM, Johan Hovold wrote:
> On Mon, May 31, 2021 at 12:08:20PM +0300, Eero Lehtinen wrote:
>> On Mon, May 31, 2021 at 11:42 AM Johan Hovold <johan@kernel.org> wrote:
> 
>>> Ok, the driver just wants to know if the i2c-read vendor request exists,
>>> and actually reading the register will not work since the register may
>>> not even exist (e.g. depending on the demodulator).
>>>
>>> So it seems we need to keep this zero-length read request and only
>>> update the pipe argument to suppress the new WARN() in
>>> usb_submit_urb().
>>>
>>> Eero, could you try applying the below on top of -next and confirm that
>>> it suppresses the warning without messing up the type detection?
> 
>>>  From 2cec8fa000152bcb997dd7aeeb0917ebf744a7bd Mon Sep 17 00:00:00 2001
>>> From: Johan Hovold <johan@kernel.org>
>>> Date: Mon, 24 May 2021 10:55:19 +0200
>>> Subject: [PATCH v2] media: rtl28xxu: fix zero-length control request
>>>
>>> The direction of the pipe argument must match the request-type direction
>>> bit or control requests may fail depending on the host-controller-driver
>>> implementation.
>>>
>>> Control transfers without a data stage are treated as OUT requests by
>>> the USB stack and should be using usb_sndctrlpipe(). Failing to do so
>>> will now trigger a warning.
>>>
>>> The driver uses a zero-length i2c-read request for type detection so
>>> update the control-request code to use usb_sndctrlpipe() in this case.
>>>
>>> Note that actually trying to read the i2c register in question does not
>>> work as the register might not exist (e.g. depending on the demodulator)
>>> as reported by Eero Lehtinen <debiangamer2@gmail.com>.
>>>
>>> Reported-by: syzbot+faf11bbadc5a372564da@syzkaller.appspotmail.com
>>> Reported-by: Eero Lehtinen <debiangamer2@gmail.com>
>>> Fixes: d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip type")
>>> Cc: stable@vger.kernel.org      # 4.0
>>> Cc: Antti Palosaari <crope@iki.fi>
>>> Signed-off-by: Johan Hovold <johan@kernel.org>
>>> ---
>>>   drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
>>> index 97ed17a141bb..a6124472cb06 100644
>>> --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
>>> +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
>>> @@ -37,7 +37,16 @@ static int rtl28xxu_ctrl_msg(struct dvb_usb_device *d, struct rtl28xxu_req *req)
>>>          } else {
>>>                  /* read */
>>>                  requesttype = (USB_TYPE_VENDOR | USB_DIR_IN);
>>> -               pipe = usb_rcvctrlpipe(d->udev, 0);
>>> +
>>> +               /*
>>> +                * Zero-length transfers must use usb_sndctrlpipe() and
>>> +                * rtl28xxu_identify_state() uses a zero-length i2c read
>>> +                * command to determine the chip type.
>>> +                */
>>> +               if (req->size)
>>> +                       pipe = usb_rcvctrlpipe(d->udev, 0);
>>> +               else
>>> +                       pipe = usb_sndctrlpipe(d->udev, 0);
>>>          }
>>>
>>>          ret = usb_control_msg(d->udev, pipe, 0, requesttype, req->value,
>>> --
>>> 2.31.1
> 
>> I confirm that it suppresses the warning without messing up the type
>> detection.
> 
> Thanks for confirming. Is it ok if I add also a tested-by tag for you to
> the commit message when I send this to the media people?


I can also confirm it works for both rtl2831u and rtl2832u.

regards
Antti

