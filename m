Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DB0637D7B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Nov 2022 17:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiKXQIU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Nov 2022 11:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKXQIU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Nov 2022 11:08:20 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C28C29803
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 08:08:19 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r18so1862850pgr.12
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 08:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2F82FSiFI5pUAceYLvdR1o2YDLH+dIR1ALVlp4MLPdc=;
        b=fo1BBXsX09/809bTMBPVJVRKkeaVeMn4vJFbMXX9VDY7zVBW8TGLxm+Ksqwe1sg4n8
         3GAGmqYxEpc7+knOq4rxQRhZFMLoiiaMSdn/Se4Qnj6IziNhmYYz9fM+0ngwt3ENlo4C
         3ymrdRu9Cq7scut3pKo/vHG5ihYjsoLLqzfLWmUJX6EFSVLrfw06JxARKaUsAxaZkGkE
         xyEOw6qQkovk4vQNsw3CqofxuFiDcSzLZGucAUBSDW3C1vJgPA2/2LP1UQPrG1H7dbHA
         kd94SaJGeZ9LFcTRFFFXApA71Yga/JZN0PJ1lUkOmHv/gf7fzHKkcpjJQpvesbWPMZ5l
         7/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F82FSiFI5pUAceYLvdR1o2YDLH+dIR1ALVlp4MLPdc=;
        b=XTjmIAOwTryxvFVF/tLFeC1KUuTI5IKJU/Yy59ti+SVt16caefiTOE5MtEy6z4pSq6
         DGHX1Y+y9spOmNutZXXSGC396uVxiyiM07/sfpNhZD/rDyCTHF4UXv4iBT/IHuNzl3ik
         r/YmNhLJTkK5wtRjOG5/5LT378bQ2HwCc54EWAKhHQConRTnQeHPbDrPjz89TK8jpaME
         kxz6VKYiehHa1uBPJZCtU0JK6nc5X1hmT8vJO75UvGuKJHfqxhEI9EcNinj1vh62P3Dr
         Qb/MEw4SATsgPIqg4SdcDb9SaEknZPyUthyoo5A/B9mjEov1AJr3TPVa3xi3PMW2Ruz3
         qUdg==
X-Gm-Message-State: ANoB5plsMh3ys3EFI3d73w0X/1WkmlrHjrHkUAuBYhke4AN4tyzm+Mmr
        yRZolzHNohDVEUFtjUqGpf7OTdWwjzkAZZ0uhtkFL61LCvhc4w==
X-Google-Smtp-Source: AA0mqf5pmutuMRKZ9U5O+gara1aNj8i0O9hP/56b/HCt6zojUJNbjU7DJD/NJfcOUkcHXG1unu0zsdmTmQDW25kcEmw=
X-Received: by 2002:a63:1955:0:b0:477:50ed:6415 with SMTP id
 21-20020a631955000000b0047750ed6415mr20730851pgz.535.1669306098733; Thu, 24
 Nov 2022 08:08:18 -0800 (PST)
MIME-Version: 1.0
References: <CAMZ6RqKB70YohOEeUmYWthbi8N3ADVLQUg-=j6enf5cDQC_eSg@mail.gmail.com>
 <Y3+VfNdt/K7UtRcw@kroah.com>
In-Reply-To: <Y3+VfNdt/K7UtRcw@kroah.com>
From:   Vincent Mailhol <vincent.mailhol@gmail.com>
Date:   Fri, 25 Nov 2022 01:08:07 +0900
Message-ID: <CAMZ6RqLujk3vXyVW+mAz+9em-5H2rDu_PsgTqXQTg7SQRTwb6Q@mail.gmail.com>
Subject: Re: [Question] How to check whether or not a device is an USB device?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri. 25 Nov. 2022 at 01:02, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Nov 25, 2022 at 12:40:34AM +0900, Vincent Mailhol wrote:
> > Hello,
> >
> > I am trying to have devlink report default information at the core
> > level. One of the attributes reported by devlink is the serial number
> > which is available in usb_device::serial (details: [1]).
> >
> > This code would work:
> >
> >         if (!strcmp(dev->parent->type->name, "usb_device")) {
> >                 /* is indeed an USB device */
> >
> > but the string comparison looks odd.
> >
> > There is a is_usb_device() which does the check:
> >
> >   https://elixir.bootlin.com/linux/v6.1-rc1/source/drivers/usb/core/usb.h#L152
> >
> > but this function is only visible at the USB core level.
> >
> > Thus my questions:
> >
> >   * what is the correct way (outside of USB core) to check if a device
> > is an USB device?
>
> There is none, you should never do this.  There is a reason the driver
> model does not have "types" for all devices that are allowed to be
> checked.
>
> It is up to the driver that controls this device to know what type of
> device this is.
>
> Where in the kernel are you trying to do this type of thing?
>
> > Is the string comparaison OK or is there a smarter way?
>
> This should not be done at all, you can not rely on it.
>
> >   * would it make sense to export the is_usb_device() function?
>
> Nope!
>
> > [1] https://lore.kernel.org/netdev/20221122154934.13937-1-mailhol.vincent@wanadoo.fr/
>
> Have the netdev driver provide a way to get the serial number of a
> device.  Then in the driver, it can do the correct call as it "knows"
> that this device really is a USB device.

The driver already has the devlink_info_serial_number_put() to do
that. So according to your comments, no need to change anything.

> Don't let class code like this depend on random bus types, that's not
> the correct way to do things.
>
> hope this helps,

Yes, thank you for the quick answer!
