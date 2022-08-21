Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8750359B578
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 18:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiHUQhh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 12:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiHUQhf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 12:37:35 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83EA22B23
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 09:37:34 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id o2so6642791iof.8
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=B6t2Zr0UipkWxke/VEdYTCS3P2+GgRmo6XFqxUEIxvM=;
        b=XP4sixabLYO2N1d4l10NHVKALFPXxXab6pfa6YI9Ajax1JXTR7HI4TLEUP0KYwDjpQ
         BIvxJXti4v0U7en2MSa/tHAxOrIo4o9n8OuAitzMozJWdZl6jKa0DpcXMyLgR1XF1njI
         za/h9n/8FOEAIxEPGH8bCYftxbzVj/l3B/kCpC/PV4nw+CYJ9WvGqxCbYZofUwmYaEnC
         oqbxRCYmnFaVXfL6P134RuRyQyj7ZBY3fOWYA/FwBd8L+/fhcgHPy7gVbx7eWOICV1/o
         dkfMwBJyC4+9MI9g9/7FSsdxu5aWx76R6kRSCuqmWBSgWD3+p/bqDwrgrnNBW8jaRN0V
         f3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B6t2Zr0UipkWxke/VEdYTCS3P2+GgRmo6XFqxUEIxvM=;
        b=JDx5igzwhLbw7KFR1eI67FnTJiBj8ds756c4WfhlsAEMZQFdY+nlQh1bYX1tb9cbPe
         B0mLPxU2/K5F/4UiTtEDpTUZfqKvQ5o1xASd2OGls+5ZMvTcqY+EX5TGYEBnmqYbwXds
         KG4KR3MBJmBQvGeJnyZvZs6uxnT44Uo7CmvFpK2LwoZpVxLWJNfD7Y1TlhsAEpDzAVKH
         Kqyz4/dRvHhGbowxFtZk2J/lXlsKsjF75EJIpJ1JuG1nXCBbPbEyuQeE56spMy6qhdi1
         pk543WbY1RWjDHlKVtwEgC0HySIJ7WnBWNd9jEQf0/V545QmKjm9wARqyMrBHfG3p6wl
         kNoA==
X-Gm-Message-State: ACgBeo3pEIb18p9ngU9hATeLZASrh/ByqGCD9iEzjpb+9Ci24NI+bnyA
        k4HVL5KhNXJZ504KPjBCAtjDzDL01et+esFzgwCA/p4wenU=
X-Google-Smtp-Source: AA6agR7s4dPg1e/Fa4FycDO+v2XdG91ksIl0PwDlQiGiEDZGGohya3j3EENlHQbMgBIioOkSYUmg9dHXr/f89WbVwlo=
X-Received: by 2002:a02:b60d:0:b0:343:5ddd:66b3 with SMTP id
 h13-20020a02b60d000000b003435ddd66b3mr7685996jam.8.1661099854092; Sun, 21 Aug
 2022 09:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
In-Reply-To: <YwJFZNUob3BtEM2h@rowland.harvard.edu>
From:   James Dutton <james.dutton@gmail.com>
Date:   Sun, 21 Aug 2022 17:36:58 +0100
Message-ID: <CAAMvbhFt+_x7a++n3MPPpTza4vfnSj0809pXtzkps9TEVLpDUA@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 21 Aug 2022 at 15:47, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> > The reason being, I have a system that boots from a USB disk.
> > Due to interference, the USB device disconnects for a second or two
> > and then comes back, but Linux does not see it and I have to reboot
> > Linux to recover. So, in this situation I wish Linux to be able to
> > recover immediately, without needing a reboot.
>
> There is no way to do this.  For example, consider all those failed
> writes that you get error messages about.  Once they have failed, the
> system does not try to remember them in case there's a possibility of
> trying them again later.  They're just lost.
I guess the solution would have to include a "retry in 1 second's
time" type failure mode, instead of just lost.
I.e. differentiate between the disk responding that the media failed,
and the link being down to the disk so the write message could not be
sent.
For example, NFS waits around for the network to return, maybe we
could add that functionality between a filesystem and usb storage.
