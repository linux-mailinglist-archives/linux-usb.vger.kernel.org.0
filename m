Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D41D3B42C3
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 13:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFYMAM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 08:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhFYMAL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Jun 2021 08:00:11 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56150C061574
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 04:57:50 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p133so4205614yba.11
        for <linux-usb@vger.kernel.org>; Fri, 25 Jun 2021 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=SIr1hYSZvMr7V7bq0BdHv7nj1zIZNkHSNgHr6jjqM8U=;
        b=qenN7mvlkMPAg1+qi8ME0BhyWsduhySEwaFxV75JHgOwAIXYJJt6us5sTfbFVn+wfB
         5WzGIfASltctYn2nbOxXlwf3XD94Sa/AkkMSi9yIPVCO2zCRfJn8cCn26zdQT9+M+TwF
         C6Z9TwCcAcGCPqbrfoi95pqaPT3t3Wu6dMHC8a+eiJ411BSrif4O0PDNBYRZ+A8Kjx6h
         9v7/ugOpWZY0qoEmw2T+hIiHNBSGBE2aCRtlePtk/7XC3OK8ElcxmmV/FTt4E4YXp49l
         pUiltrXXCRM72OjekayDmLTIyQO3Wix53XVyemq7kW7FBRKgxRdq3Vz6tLYWIkbqRPq0
         iXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=SIr1hYSZvMr7V7bq0BdHv7nj1zIZNkHSNgHr6jjqM8U=;
        b=V++Zfi6xkurZJZyBGqOpSdWKb3hVExAcXUB/CKrW69xYi6kSTMHviqJ2jSnVVmQmvZ
         gCjrmY9nRBtWoACb70bmbr2EpLMLPpHni8YoQyOVI4MpZRGvzAww+m1fLCmRW8JCQDiK
         amq4bcVYDKK7cBkSZBaR/Tcw51r+t3Ahgk/FpMZaxhdK8jDpanLemtygtjmNLg1BcBn6
         yxMLqWc+Q3fBQKi6sfAA6ern+xVL0vhtsfa6wao0f0gCQtjpdNOPzct+EIhg7f3HCHlC
         BecTGt7AnfL7lcVw8UkXlNDUSshnjxKcXKahLXJ5LoztkNoufUtulNoqtNeeyv1jaXFT
         objA==
X-Gm-Message-State: AOAM531tTuf3aT21aMYEC3GB9UbJ7uLKlpl8LCG10y5AnZyxryEUAOXT
        qVvZy5iUZwidYxm9msd94IhSbhn8pXarJwwMsRsxbL7n
X-Google-Smtp-Source: ABdhPJwTy3/q9PWUluCnIGL9+tfQuxJw9HP4HtHjfM2DqHJ4NkNNsrscneatuml0bQiB2UVMapgneL9etzs/JAgVj0Q=
X-Received: by 2002:a25:9d0b:: with SMTP id i11mr12383354ybp.357.1624622269518;
 Fri, 25 Jun 2021 04:57:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:464e:0:0:0:0 with HTTP; Fri, 25 Jun 2021 04:57:49
 -0700 (PDT)
In-Reply-To: <YNW7f06ebgQmQOnM@kroah.com>
References: <CAPm8-H6=X+++n8O3DLXxdLEh6RX9Qmche9ZYz5wfHb6=5aSyeA@mail.gmail.com>
 <YNW7f06ebgQmQOnM@kroah.com>
From:   Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date:   Fri, 25 Jun 2021 14:57:49 +0300
Message-ID: <CAPm8-H7VQBa31hL0YoDpJd4R=gmuzW7w3mkgZWwcozOrGGwm2g@mail.gmail.com>
Subject: Re: Question about usb3 host code
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 6/25/21, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Jun 25, 2021 at 01:46:09PM +0300, Laurentiu-Cristian Duca wrote:
>> Hello linux-usb community,
>>
>>   I am new to linux-usb code and I hope that my question is not silly.
>> I am interested in real-time usb.
>>
>>   I know that on USB3, the gadget can initiate transactions
>
> It can?  What do you mean by this exactly?

I know form the following 2 sources:

1. Integrating devices in FPGA using an end-to-end hardware/software
co-designed message-based approach
Thomas Baumela

The communication model between USB devices and drivers follows a
master-slaves cheme. It means that every data transfer, either
transmitting or receiving a message, is initiated by the driver
itself. Before USB 3.0, this meant that drivers had to poll devices
like mice or keyboard. Indeed, there was no such mechanism as
interrupts coming from the device to let the driver know that a
message is ready to be received. From USB 3.0 on, when a device has to
send a message to its driver, it triggers a notification signal from
its USB controller. This notification is then forwarded to the device
which will then start the transfer as usual.

2. Universal Serial Bus - From introduction to rapid development
Texas Instruments - video on youtube
time 5:35-5:46
"Hosts are also responsible for transaction initiation and flow control.
One exception to this, is with the 3.0 standard, devices can also
initiate transactions"

>
> USB works in the "host asks a gadget if it has data" method.  The gadget
> can not talk to the host unless it is asked.
>
> thanks,
>
> greg k-h
>

Thanks,
L-C.
