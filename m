Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABB350B31F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 10:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445206AbiDVIpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 04:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444942AbiDVIph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 04:45:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B29A532CE
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 01:42:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11302B82B0E
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 08:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B609C385A0;
        Fri, 22 Apr 2022 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650616962;
        bh=heKpN/BqRCB3ZQowHWvsRq6oSXaKpX3yxQHZ7uM5jHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VyuFM8JUE/ZPu+/0ZLOKK4MY4liX5gW0NGpUp3YfWhVegkTmfJj6IhHSl62X07I14
         pJdxJ7/2w3kaKLXz/YhkTihGijrE20K0LlyzTjYQ2K7JkEo1cJ2qQ+VnIpWin3CJzB
         dGE6luQFishpRqPkKgSTT4XZulDoElAOfZAxldV0=
Date:   Fri, 22 Apr 2022 10:42:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Message-ID: <YmJqfzmz5N0I3n87@kroah.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 07, 2022 at 09:27:40AM +0800, Linyu Yuan wrote:
> Last year I try to add trace event support for usb gadget configfs [1],
> this time the idea is change a lot, the purpose is trace all user space
> operation to gadget configuration, include gadget and it's function.

But why?  Who will use this, and what for?

> In usb gadget configfs, mainly user can do mkdir/rmdir a group,
> link/unlink a function, change gadget/function attributes,
> each operation will touch a struct config_item.

As userspace is the thing doing this, why do you need to tell userspace
again that this happened?

> It only have one trace event entry which store string,
> provide several API which represent user operation and generate string
> from  struct config_item.
> 
> example output,
>    mkdir-80      [000] .....    44.555106: gadget_configfs: mkdir dummy
>       sh-76      [000] .....    44.562609: gadget_configfs: echo dummy/idVendor 0x05C6
> 
>    mkdir-81      [000] .....    44.569795: gadget_configfs: mkdir dummy/functions/eem.0
>       sh-76      [000] .....    44.600221: gadget_configfs: echo dummy/functions/eem.0/dev_addr 1e:77:46:4b:1e:96
> 
>    mkdir-82      [000] .....    44.615542: gadget_configfs: mkdir dummy/configs/dummy.1
>       ln-83      [000] .....    44.628997: gadget_configfs: link dummy/configs/dummy.1 dummy/functions/eem.0
>       sh-76      [000] .....    44.634506: gadget_configfs: echo dummy/configs/dummy.1/MaxPower 500
> 
>    mkdir-84      [000] .....    44.642265: gadget_configfs: mkdir dummy/configs/dummy.1/strings/0x409
>       sh-76      [000] .....    44.663886: gadget_configfs: echo dummy/configs/dummy.1/strings/0x409/configuration dummy
> 
>    rmdir-85      [000] .....    64.255507: gadget_configfs: rmdir dummy/configs/dummy.1/strings/0x409
>       rm-86      [000] .....    64.263926: gadget_configfs: unlink dummy/configs/dummy.1 dummy/functions/eem.0
>    rmdir-87      [000] .....    64.279768: gadget_configfs: rmdir dummy/configs/dummy.1
>    rmdir-88      [000] .....    64.328124: gadget_configfs: rmdir dummy/functions/eem.0
>    rmdir-89      [000] .....    64.992085: gadget_configfs: rmdir dummy

As I said in other places, why not just add this to configfs directly
instead of all over the individual users of this one subsystem?

And again, why?

thanks,

greg k-h
