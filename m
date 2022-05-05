Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8011B51BF84
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 14:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377299AbiEEMjf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 08:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377290AbiEEMjc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 08:39:32 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B42DC1CB22
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651754148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RS4amHKFC2hR6qrKmmBh73jfjEHv3w9nMH/29xiCJdc=;
        b=Af/a8FFrcT4lp6ddlAd7J8X/qQNbBiGdNUZPFTv4AOP3Bd1xWgKDgroALTk1P6bccaZnyz
        ybUBTrXakXnR8gMVhHgbTTXsVHMrl6Jbo3Hq8e9SgVntNyilRqjD7J8DjnhusfYcR8jOTy
        BD9u9hezVcsc5RHCKO78Xzeu68Gueqk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-xz0t26sMPcG1p5l1se-Mqw-1; Thu, 05 May 2022 08:35:40 -0400
X-MC-Unique: xz0t26sMPcG1p5l1se-Mqw-1
Received: by mail-qv1-f70.google.com with SMTP id d13-20020a05621421cd00b0045a99874ae5so3062598qvh.14
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 05:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RS4amHKFC2hR6qrKmmBh73jfjEHv3w9nMH/29xiCJdc=;
        b=JbcLQMSydlYnx/sUXwEmPNSlkNJA4l4yfUIdue3dxxprDuoxfVbx4cQ/rz45IoV52g
         SqQvn9LXP47mdmgPU3jh7+eQSUgVuvcnI6I3VNCdSEWzZRkR5vGuHMNXSOKQuvZulKVu
         b5BFkzjP7mvPsx304wFsPgfsbyWy0FKrfxeElVRnZFIBne9wp43nrTzCFBfWjlTvWDFB
         c0vzeL2h9qgk69Ssc+XVVCeuhcRlqwRy9m4njF3uL8g6RqH66xlV+6HiVcxVTsGpdpKn
         gKo1uWDadKywg2ILbolF+WWGc0Zra4rXxSIB1AD+kGVOAou16s3z3bVntAWyCjrAMltB
         /q8g==
X-Gm-Message-State: AOAM531hzMpQLT18CdGgGfUPbpKYRy5hZxM+6VFAmVDuJ2H4lPceMzYo
        2xryyKbrd5EcKFNjq2ooRTpMvjMgFPGr6TyeMlC/bpfX+dW0ngJenE86oZktfzBVefG7AVm6OxB
        kQYEFjgx6k/q8OOAMof0oHAo7z5Y8W/B6A1ml
X-Received: by 2002:a37:2f04:0:b0:663:397d:7051 with SMTP id v4-20020a372f04000000b00663397d7051mr19423355qkh.333.1651754139702;
        Thu, 05 May 2022 05:35:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlZY+biANEBjRNYdU9IE8OzsAWOCeXZCdcOLSd0WIZ9Fjpw8HafKC585JgXs8BlU79mxrh+T42RVKNT0bOmPc=
X-Received: by 2002:a37:2f04:0:b0:663:397d:7051 with SMTP id
 v4-20020a372f04000000b00663397d7051mr19423337qkh.333.1651754139452; Thu, 05
 May 2022 05:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220504083612.143463-1-jtornosm@redhat.com> <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com> <CABk-BGt8dFKkRvFZHpJnkHyObZ2G3D102zvyEFjVYjaFVRiQdg@mail.gmail.com>
 <50d48f9e-d7b1-a05a-5fbf-2c0461b540ef@suse.com>
In-Reply-To: <50d48f9e-d7b1-a05a-5fbf-2c0461b540ef@suse.com>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Thu, 5 May 2022 14:35:28 +0200
Message-ID: <CABk-BGte-1t-DQ0CUDbzy9u+5UVKcsA0WhZU57mq6WyWsP5gmQ@mail.gmail.com>
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Oliver,

No worries, as you said, Bjorn has provided a perfect test.

Yes, I have considered but I have thought that a clean and fast
solution is enough, that is, suspending everything from the driver,
because a new configuration is going to be applied when binding again
from local or remote.
Device reset may have other implications and as you commented soft
unbinding is not a common operation at least without binding again.

Best regards
Jos=C3=A9 Ignacio

On Thu, May 5, 2022 at 2:07 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
>
> On 05.05.22 13:15, Jose Ignacio Tornos Martinez wrote:
> > Hello Oliver,
> >
> > Of course, I am working with usbip to remotize usb devices, that is
> > the reason why unbind/bind is needed and with the btusb devices that I
> > have, it was not working.
> >
> >
>
> Hi,
>
> sorry for being unclear. I was not referring to positive
> knowledge about the devices you are testing with.
> I was having dark thoughts about the other devices
> they are sharing an ID with.
> But Bjorn's testing has resolved that. In that case
> we can indeed not penalize the compliant devices
> for the broken ones.
>
> One question, though. Your approach of simply doing
> nothing if config 0 is to be selected again is a bit
> brutal. Have you considered resetting the device
> and stopping the reenumeration right as a config
> is supposed to be chosen?
>
>     Regards
>         Oliver
>

