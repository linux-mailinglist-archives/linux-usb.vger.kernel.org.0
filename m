Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07854545032
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 17:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344133AbiFIPIz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 11:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344126AbiFIPIy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 11:08:54 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22173AB1DB
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 08:08:50 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i66so32146067oia.11
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M3DP3jkfjPZvhvGySjs5ssBSbyjoo9yfudn6/slzjo0=;
        b=Jt3j/NvpuFYJ/60+dTeUbUxTgzP+R2VYM08WaAndsA9c/KNWDEd5o236rA1oEwwD8e
         OVL34c2kj3PJ5ickWiY84y0O0QbU7W87o7L9ZPUqvoBK0AnRMEa95q/BFPkcpWBsbkpp
         RwS5U5RPe34XCiHcin5Xnf+ypTnyYrm+NqLF87KQ47u75WfcjegUIrOc4rSrnW+K7nfK
         qkUMnus65j7wv3rFSGTqfrBLUlx5xMByT4/dPCPwZjha43aGuKsrgRb392NT3mM8Oke+
         UmJcGoZ4VhZoaKfj6DtOMDYPCB1mrxIP9gLCveD72G8OPED3rSpb7nmSTf9/0jzqFNgN
         UReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M3DP3jkfjPZvhvGySjs5ssBSbyjoo9yfudn6/slzjo0=;
        b=WPTqneYAoUzKsfGttvEX8k+yFPBXyEJ/aXFtEG4wGEzawNYvdm4p1GWzjFDPaZ86ng
         c9eOtvz7uKd268TFOlVFjBDTE0YN2m0ekMCAS4mX59W1EbA7RlChGnR1q4o93K533vTJ
         YxiSjq+ANfCFn52PSL17ekfLoG07RtEXTWxCrzF1+8BCN5W8t4AtMRpyc8FmA27upy3k
         iwVhYZ+qCL9rdJqfnI6dvKcV0konP3fr5kRO1qHBOv7FoZMzsZdWiz0v2LmXktL7LMl9
         eMBOlUrZJ9rGuJkF68kpMucMoXIsslBewibC4P5TVzrf1C/ZWNX/WMO6UZBob1PpfRye
         vSOA==
X-Gm-Message-State: AOAM532E9FHpbwZ5Pb49X3aNtKSUwTLx6xsPnFTzri0t6lU9EdWVXXcf
        WvDNBm3iJOJ+4OllHlUleGzwHKJBnlMmha10gWwYMw==
X-Google-Smtp-Source: ABdhPJwOdixAiZCU+tmSwjW9q5ORIumO6Z0VQQukdyb5+jOHqgSvAxIl+2k9g6MPQNOSmu701G3qfAuKQ9cLDsJKDkE=
X-Received: by 2002:aca:544:0:b0:32e:385d:1fc0 with SMTP id
 65-20020aca0544000000b0032e385d1fc0mr1993972oif.241.1654787329488; Thu, 09
 Jun 2022 08:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com> <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu> <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
In-Reply-To: <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
From:   Evan Green <evgreen@google.com>
Date:   Thu, 9 Jun 2022 08:08:13 -0700
Message-ID: <CAE=gft6GEV58buVgErAD2O+SHJBbf+KubiBge_y4NXYaojnKAw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        "Srivastava, Shobhit" <shobhit.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 9, 2022 at 12:58 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 8.6.2022 16.43, Alan Stern wrote:
> > On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
> >> On 8.6.2022 11.19, Oliver Neukum wrote:
> >>>
> >>>
> >>> On 07.06.22 15:58, Mathias Nyman wrote:
> >>>
> >>> Hi,
> >>>
> >>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
> >>>> by turning off roothub port power in the .shutdown path.
> >>>
> >>> That would suck for the people who charge their phone from their
> >>> computer.
> >>
> >> Good point.
> >> My guess is that xHC port power bits won't actually turn off VBus for those
> >> Sleep-and-charge, or Always-on ports.
> >> VBus is allowed to be on even if port is in power-off state, but usb link state
> >> should be forced to ss.Disabled from other states, like U3.
> >>
> >> Need to try it out, it's possible this turns off VBus for some usb-A ports
> >> on some older systems that earlier (accidentally?) supplied VBus on
> >> "normal" ports after shutdown.
> >
> > How about turning off port power _only_ in the shutdown or unbind path,
> > and setting the port link states to ss.Disabled in the poweroff or
> > poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
> > solve the problem of the firmware needing to time out on reboot?
> >
>
> That would be optimal, but unfortunately xHCI doesn't support setting link
> state directly to ss.Disabled. Only way is to clear port power (PP) bit.
>
> To avoid turning off VBus in hibernate we could limit port power bit clearing
> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
>
> We know these xHC hosts don't control power switches, and clearing PP won't turn
> off VBus (xhci 5.4.8, PORTRSC)
>
> This could be a solution for some hosts, but probably not cover all.
> Not sure if the hardware this was reported on has PPC flag set.

It appears it does not, HCCPARAMS1 for both USB controllers seems to
be 0x20007fc1 (missing bit 3). You can check my work in case I made an
error here: https://pastebin.com/9raZc63N
-Evan

>
> Thanks
> Mathias
