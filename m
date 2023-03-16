Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CD56BD579
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 17:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjCPQXT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 12:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjCPQXR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 12:23:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE17D335;
        Thu, 16 Mar 2023 09:23:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 075D8B8226E;
        Thu, 16 Mar 2023 16:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EB0C433D2;
        Thu, 16 Mar 2023 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678983788;
        bh=I03Yhw6YnnX2kw+ezLbjAlp4p1ZmAQHi8Hh1vosb3Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIIDotBk48ITVfmh7XhfJPieKjWIllnspL+AzpfAs861GHgmgCkR/D//PyYQjFvdr
         TJzT9wdhrEeAikLQFHqmTffPZOfOFVQ5IzsBqmqqMZ2Ujdupq08hBPlWK9D4iSbJ/Q
         M05OrAtcsYwZ63uMV2j75rFReWTDfcMnhAVI+9y4=
Date:   Thu, 16 Mar 2023 17:23:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zheng Wang <zyytlz.wz@163.com>
Cc:     p.zabel@pengutronix.de, biju.das.jz@bp.renesas.com,
        phil.edworthy@renesas.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com,
        yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v5] usb: gadget: udc: renesas_usb3: Fix use after free
 bug in  renesas_usb3_remove due to race condition
Message-ID: <ZBNCam0XjWehrF3c@kroah.com>
References: <20230316155645.1565045-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316155645.1565045-1-zyytlz.wz@163.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 16, 2023 at 11:56:45PM +0800, Zheng Wang wrote:
> In renesas_usb3_probe, &usb3->role_work is bound with
> renesas_usb3_role_work. renesas_usb3_start will be called
> to start the work.

You have a full 72 columns to write in, please use them :)

> 
> If we remove the driver which will call usbhs_remove, there may be
> an unfinished work. The possible sequence is as follows:
> 
> Fix it by canceling the work before cleanup in the renesas_usb3_remove.
> 
> CPU0                  CPU1
> 
>                     |renesas_usb3_role_work
> renesas_usb3_remove |
> usb_role_switch_unregister  |
> device_unregister   |
> kfree(sw)  	     |
> free usb3->role_sw  |
>                     |   usb_role_switch_set_role
>                     |   //use usb3->role_sw

Why can't this be written so it looks better:

 CPU0                         CPU1

                            | renesas_usb3_role_work
 renesas_usb3_remove        |
 usb_role_switch_unregister |
 device_unregister          |
 kfree(sw)  	            |
 free usb3->role_sw         |
                            |  usb_role_switch_set_role
                            |  // use usb3->role_sw

Note that removing a driver is a root-only operation, and should never
happen so please also say that.

thanks,

greg k-h
