Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABA59599E71
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 17:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349791AbiHSPe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 11:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349770AbiHSPe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 11:34:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547A66B8F8
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 08:34:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 551FA61588
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 15:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD2EC433D6;
        Fri, 19 Aug 2022 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660923291;
        bh=kEymN5ldMtkek7T6ZLjWLNNsB0y6ynRFbKqcGsremUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vnlpumrGlr+oVm+/UV5b+XQUxS0nJesdlNH/Xbd/olJosKhfLWPbRc4PQTEaRgxjz
         Dzv4ovqQ8KWAAs1PSNXv9F0jc+5OabURMTWvviRoexK60XWOhjFdSSHmW3123eRmk3
         cwixPSz9CkqJBX5qtyQTYh8GMOmJM2k0Pit9Uc+4=
Date:   Fri, 19 Aug 2022 17:34:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     frans@biabv.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: tools/usb/usbip reports errors based on uninitialized value
Message-ID: <Yv+tmKNM7dDjnE4l@kroah.com>
References: <02c301d8b3d3$17a4d760$46ee8620$@biabv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c301d8b3d3$17a4d760$46ee8620$@biabv.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 19, 2022 at 03:53:36PM +0200, frans@biabv.com wrote:
> Consider handling the 'usbip list' command:
> 
> Here an uninitialized 'status' variable is declared:
> https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
> .c#L54
> 
> 'status' is provided as an output variable here:
> https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
> .c#L62
> 
> However, 'usbip_net_recv_op_common' (defined here:
> https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_netw
> ork.c#L162) can fail and return for several reasons before setting 'status'.
> 
> The caller uses 'status' (which is still uninitialized) to report an error
> text here:
> https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
> .c#L65
> 
> This leads to random error messages. Sometimes the accidental value of
> status maps to a specific error text (which is not informative about the
> actual error), but most of the times it will lead to "Unknown Op Common
> Status".

Please feel free to submit a series of patches for these issues!

thanks,

greg k-h
