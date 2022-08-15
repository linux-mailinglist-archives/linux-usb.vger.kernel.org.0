Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5466593C7E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Aug 2022 22:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347217AbiHOUXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Aug 2022 16:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347324AbiHOUWR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Aug 2022 16:22:17 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D43D33E0A
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 12:02:22 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id j5so9520185oih.6
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FXKmrP/pbsROn1aoadPg4g+qxA+kRllQx0lP+zTedsA=;
        b=neban4pVoRjzEa9KEuGd7hnG033/4gzHTMNaamFcn+gaMraokUloPudEJifgKIICRg
         eqGi4vaSM4X1VqVaqUAP7KRWXzGSSAbmll+u0FcCK7udwMf97n23cCchQGxI9zAVVnZ+
         1vJP9nzCWakgztCAb+GEOkEQMP3y1EorG1+XcLWIQ4edRsYGdxjTZgAyzP1xJW4BmVgB
         Fk7WBBpTBM7cd4aUEVBiA6mr0GKQFH+b689yTkNyhCpXTQMDUsx5tTVlY1xbELhY841B
         2AVhv9LwWDxKwFKb8ghAV30g3C6RXPgc6jFIbG8LmSMVarHuHp5gb3PG6F68y5rlmCtB
         AOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FXKmrP/pbsROn1aoadPg4g+qxA+kRllQx0lP+zTedsA=;
        b=OhOartsTxd27/2ohKxo57Ffv9LOItitiyGv3af1N6+/w6W/O+zHVMz4dF+Bg0X0mC4
         Isfz+5l5ML6iDcE5SPoV6b53rbsVasbyXwbaRSaf8mUlyxWm/G1Q0Nx8R3S0yzxLOan0
         IEpRa4y22uEeVZQFAsAmfPZxXLRY3O6sXXfgkze1N0rzNB+RSQoWrYXsVyamM+1fLg5I
         SJ32JQUQaoYTZdWPbUz2GxyXXwYH7XVw5I3nvyWUxVc8aPf/WOyiCmo5BJcljeO53O7O
         /kVhL9FgbD4ZwKPSqvY3A77VhCIwtE5XWkB8NRrXIK42Zya200bTBSVxhdezdGIpDfau
         zbFw==
X-Gm-Message-State: ACgBeo2d5R+FJSOq8/LS93XntCTjlcyW9oLsKpTDBOnZz8UDmhVRtLpd
        8kyJoaZl1htuhYjG+E1Ur0cUSM+r4bhB+nXdd/KWjg==
X-Google-Smtp-Source: AA6agR4Coleu8pzh89mfpze9vJNwbI+hwjuKBF/xQGmn51tXtdbSkOyl+eejU7WOMf6TAaJ9NzCLKjuSy/w6RPNPNcw=
X-Received: by 2002:a05:6808:3096:b0:342:ff93:4672 with SMTP id
 bl22-20020a056808309600b00342ff934672mr7877802oib.174.1660590141139; Mon, 15
 Aug 2022 12:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com> <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu> <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
 <CAE=gft6GEV58buVgErAD2O+SHJBbf+KubiBge_y4NXYaojnKAw@mail.gmail.com>
 <a5e9da68-fcf8-a89d-8e52-9798bc929170@linux.intel.com> <CAE=gft6ZFbdx8_M6qFZ6710YfLoe+XdoAdWnQOfEGkUFOz8EOA@mail.gmail.com>
 <ceb50ab3-f244-be72-68ec-93591a785a3a@linux.intel.com>
In-Reply-To: <ceb50ab3-f244-be72-68ec-93591a785a3a@linux.intel.com>
From:   Evan Green <evgreen@google.com>
Date:   Mon, 15 Aug 2022 12:01:44 -0700
Message-ID: <CAE=gft4S7NepC8OG5cRNjaxGqpKZzfz3YwQN=DUOn-nHz31RXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        "Srivastava, Shobhit" <shobhit.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 9, 2022 at 6:47 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 21.7.2022 0.53, Evan Green wrote:
> > On Tue, Jun 14, 2022 at 3:06 AM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 9.6.2022 18.08, Evan Green wrote:
> >>> On Thu, Jun 9, 2022 at 12:58 AM Mathias Nyman
> >>> <mathias.nyman@linux.intel.com> wrote:
> >>>>
> >>>> On 8.6.2022 16.43, Alan Stern wrote:
> >>>>> On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
> >>>>>> On 8.6.2022 11.19, Oliver Neukum wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 07.06.22 15:58, Mathias Nyman wrote:
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
> >>>>>>>> by turning off roothub port power in the .shutdown path.
> >>>>>>>
> >>>>>>> That would suck for the people who charge their phone from their
> >>>>>>> computer.
> >>>>>>
> >>>>>> Good point.
> >>>>>> My guess is that xHC port power bits won't actually turn off VBus for those
> >>>>>> Sleep-and-charge, or Always-on ports.
> >>>>>> VBus is allowed to be on even if port is in power-off state, but usb link state
> >>>>>> should be forced to ss.Disabled from other states, like U3.
> >>>>>>
> >>>>>> Need to try it out, it's possible this turns off VBus for some usb-A ports
> >>>>>> on some older systems that earlier (accidentally?) supplied VBus on
> >>>>>> "normal" ports after shutdown.
> >>>>>
> >>>>> How about turning off port power _only_ in the shutdown or unbind path,
> >>>>> and setting the port link states to ss.Disabled in the poweroff or
> >>>>> poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
> >>>>> solve the problem of the firmware needing to time out on reboot?
> >>>>>
> >>>>
> >>>> That would be optimal, but unfortunately xHCI doesn't support setting link
> >>>> state directly to ss.Disabled. Only way is to clear port power (PP) bit.
> >>>>
> >>>> To avoid turning off VBus in hibernate we could limit port power bit clearing
> >>>> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
> >>>>
> >>>> We know these xHC hosts don't control power switches, and clearing PP won't turn
> >>>> off VBus (xhci 5.4.8, PORTRSC)
> >>>>
> >>>> This could be a solution for some hosts, but probably not cover all.
> >>>> Not sure if the hardware this was reported on has PPC flag set.
> >>>
> >>> It appears it does not, HCCPARAMS1 for both USB controllers seems to
> >>> be 0x20007fc1 (missing bit 3). You can check my work in case I made an
> >>> error here: https://pastebin.com/9raZc63N
> >>> -Evan
> >>
> >> Thanks, good to know.
> >> So if disabling ports in hibernate doesn't work then we could turn off port power for
> >> hosts with PPC==0. It should at least solve the issue for this particular system,
> >> and not change current VBus policy in hibernate.
> >
> > Did a new version of this ever make it out?
> > -Evan
>
> started writing a patch before vacation that sets port link to ss.Disabled instead of
> turning off power power.
>
> Still has some FIXME lines and extra prints, but should be testable.
> pushed to a fix_port_disable_s4 topic branch on top of 5.19:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_port_disable_s4
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_port_disable_s4

Thanks! I was OOO last week, but I'm back and should be able to give
it a try shortly.

>
> There was also one reported regression with powering off ports in shutdown S5, probably need
> to sort that out before pushing this.

Uh oh, I was just made aware of a regression as well on 4.19 that got
narrowed down to that. I'm trying to learn more now.

>
> Thanks
> -Mathias
