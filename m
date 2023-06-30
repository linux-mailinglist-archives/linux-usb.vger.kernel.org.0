Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E2C7442EB
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 21:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjF3TtR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 15:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbjF3TtP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 15:49:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFF944BF
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 12:48:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45692617F1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 19:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA5CC433C0;
        Fri, 30 Jun 2023 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688154507;
        bh=KNtLQUhZ8mLZ8Siib8mxE4VruHHG2ODREpimMbzYfmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jzuzds5+wIDLZpTBDB7v05fcswdra4GhLAKg9jsEiuqA0/OFVUWNjNTXh7ZngMueD
         Dra/rGK0xedycKgfhvmsxSSCmCI3FNjDlwbefADs39MGSJcJamHxS7Y22A2GBtcTC7
         IEwLo/oPkmBikroboHXk3uQgA8V6AENgUzNjTH58=
Date:   Fri, 30 Jun 2023 21:48:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yguoaz <yguoaz@gmail.com>
Cc:     dan.scally@ideasonboard.com, andriy.shevchenko@linux.intel.com,
        frank.li@nxp.com, christophe.jaillet@wanadoo.fr, jgilab@gmail.com,
        chanh@os.amperecomputing.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: Prevent buffer overrun in
 usb_string_copy
Message-ID: <2023063027-repackage-partake-aa3e@gregkh>
References: <20230630110401.2360746-1-yguoaz@gmail.com>
 <2023063013-fanning-crafty-4502@gregkh>
 <CAM7=BFoyE8XzS8g=U_wFH_AUE-W6C2tGKWzGP4+eCZTDVDgr_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM7=BFoyE8XzS8g=U_wFH_AUE-W6C2tGKWzGP4+eCZTDVDgr_g@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 30, 2023 at 09:13:58PM +0800, yguoaz wrote:
> This is an underrun issue found by a static analysis tool (under
> research).

Then you MUST follow our research rules in order to submit patches.
Please read and follow them, otherwise we have to reject all of your
submissions.

> I suggest the patch because the code of usb_string_copy()
> rejects strings with length greater than USB_MAX_STRING_LEN,
> indicating a possibility for the input string `s` to contain unwanted
> data (e.g., being empty). For the empty string case, the proposed
> patch simply copies '\0' in `strcpy(str, s)` without touching index -1
> of `str`.
> 
> Whether `strlen(s)` could ever be zero in reality is up to the
> maintainer's judgement, since I have not worked with the subsystem. So
> please ignore the patch if it is ensured that `s` must be non-empty.

Test it and see!

good luck,

greg k-h
