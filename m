Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D7757BFD6
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 23:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiGTVyf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 17:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiGTVye (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 17:54:34 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1104BD1C
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 14:54:34 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id j70so12535432oih.10
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeXoc/2ttyZuDq0w7962K4yO2ZKF6hr/rlg0psfSrhQ=;
        b=ngXis/P4Kn9AAb62ny9ICGbq/3lYQfLMeBRkE79BLcVjdxwg3fh+ykt/XqHHtqchLy
         6RWaHahwET/ii+AXV3HlcirZXgziBNPuyvE7npSYWAYEpOKKRyFk4IYCy6TftV5VuuuL
         rc0JTfSjzB5L3wYhC/RXDR1DakEfB8r4o3tImSxZBjjfrsZn+w9r7vUU/5pp6Gmpx07R
         d4a8fBEgszNoZeZBexH1JDRYotXB7okNhguuNlAfbcquvWt7JgH/9q+YFqg3o5Dsr3Wf
         WKN9xMdnouxAB6MMdKorYr6cJNhnIEqlavPyg70M1mHh2IDkXtvIBmcy32TAZR89oXQu
         h7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeXoc/2ttyZuDq0w7962K4yO2ZKF6hr/rlg0psfSrhQ=;
        b=P1GgTpcuVc7+G4ajxME76Vszn3wYohx30epoIRbyIBWn/v6Kv3hxrlo6usyDll1UW8
         cLmMNNyMbOBfmqu8/H5CRrDUplpXFtv11tlxKyJ5YSwUQ7deVF4z8u9Ptcv+vSI/7+Aa
         /9PBC2w752i01uuK+GXIhr0X4FZU13dbl/5OjLFZgVrnaZIf2h3CwhYKT3yUA0Q4Xl31
         Rwx3XHXaXKi2kh5Cmd1Ch8Y/ML8KnUaWntpp5fx33ffAO38lCU5apsRHSZSrZTbxUN3P
         xsVs+DDT0xqtvNFY5zUNXNqJmy8sF/JhYwj9K2D9ERWNiLU7BqqE3LaYREH33evqRkcU
         wI9A==
X-Gm-Message-State: AJIora837y2Mj+aNF8xqhxqL9IzdOdka0YD9YshiMw2dAtYtGojaebgr
        0p6MXGk6T4sqhC62AcrWlrcODFpmcLWHvhIhklBNU+EmcZQ=
X-Google-Smtp-Source: AGRyM1uFUHg4GaDoTcx2hjsMPmSrmQJbs89xWTBM5pI/PacYj0TPS3K4Pnh/jcbHhmo8/O9EwmCgcXc6rq3arVuh6jw=
X-Received: by 2002:aca:588b:0:b0:33a:7dec:9b96 with SMTP id
 m133-20020aca588b000000b0033a7dec9b96mr3099039oib.241.1658354073321; Wed, 20
 Jul 2022 14:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com> <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu> <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
 <CAE=gft6GEV58buVgErAD2O+SHJBbf+KubiBge_y4NXYaojnKAw@mail.gmail.com> <a5e9da68-fcf8-a89d-8e52-9798bc929170@linux.intel.com>
In-Reply-To: <a5e9da68-fcf8-a89d-8e52-9798bc929170@linux.intel.com>
From:   Evan Green <evgreen@google.com>
Date:   Wed, 20 Jul 2022 14:53:56 -0700
Message-ID: <CAE=gft6ZFbdx8_M6qFZ6710YfLoe+XdoAdWnQOfEGkUFOz8EOA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        "Srivastava, Shobhit" <shobhit.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 14, 2022 at 3:06 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 9.6.2022 18.08, Evan Green wrote:
> > On Thu, Jun 9, 2022 at 12:58 AM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 8.6.2022 16.43, Alan Stern wrote:
> >>> On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
> >>>> On 8.6.2022 11.19, Oliver Neukum wrote:
> >>>>>
> >>>>>
> >>>>> On 07.06.22 15:58, Mathias Nyman wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
> >>>>>> by turning off roothub port power in the .shutdown path.
> >>>>>
> >>>>> That would suck for the people who charge their phone from their
> >>>>> computer.
> >>>>
> >>>> Good point.
> >>>> My guess is that xHC port power bits won't actually turn off VBus for those
> >>>> Sleep-and-charge, or Always-on ports.
> >>>> VBus is allowed to be on even if port is in power-off state, but usb link state
> >>>> should be forced to ss.Disabled from other states, like U3.
> >>>>
> >>>> Need to try it out, it's possible this turns off VBus for some usb-A ports
> >>>> on some older systems that earlier (accidentally?) supplied VBus on
> >>>> "normal" ports after shutdown.
> >>>
> >>> How about turning off port power _only_ in the shutdown or unbind path,
> >>> and setting the port link states to ss.Disabled in the poweroff or
> >>> poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
> >>> solve the problem of the firmware needing to time out on reboot?
> >>>
> >>
> >> That would be optimal, but unfortunately xHCI doesn't support setting link
> >> state directly to ss.Disabled. Only way is to clear port power (PP) bit.
> >>
> >> To avoid turning off VBus in hibernate we could limit port power bit clearing
> >> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
> >>
> >> We know these xHC hosts don't control power switches, and clearing PP won't turn
> >> off VBus (xhci 5.4.8, PORTRSC)
> >>
> >> This could be a solution for some hosts, but probably not cover all.
> >> Not sure if the hardware this was reported on has PPC flag set.
> >
> > It appears it does not, HCCPARAMS1 for both USB controllers seems to
> > be 0x20007fc1 (missing bit 3). You can check my work in case I made an
> > error here: https://pastebin.com/9raZc63N
> > -Evan
>
> Thanks, good to know.
> So if disabling ports in hibernate doesn't work then we could turn off port power for
> hosts with PPC==0. It should at least solve the issue for this particular system,
> and not change current VBus policy in hibernate.

Did a new version of this ever make it out?
-Evan
