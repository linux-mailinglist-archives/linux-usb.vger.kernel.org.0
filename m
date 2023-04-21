Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7306EA2E6
	for <lists+linux-usb@lfdr.de>; Fri, 21 Apr 2023 06:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjDUEv3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Apr 2023 00:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjDUEv1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 00:51:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4B03C07
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 21:51:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 576E264D1B
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 04:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA3AC433D2;
        Fri, 21 Apr 2023 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682052685;
        bh=kmCTdZdmKY/rJY53soZKKu26k4K6YxP67+6M2EYpHho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rEdNvXAwlLmp6TePoW1gfCRZZgVZDofy+ZXceSD3P/mLWN/oW8uTC+5FS/0S3STEc
         m1IRVYzHjMdQQauQLqGI8mAgzXZxqUb3pgMCdhAVXuOyjyePunGsrQaEc6s9gzfIt6
         r1AY7TeQaALWn52LVUY5jn0Kaf6fPVk6kS+/cdvM=
Date:   Fri, 21 Apr 2023 06:51:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: update link state on each device level
 interrupt
Message-ID: <ZEIWSjITa27DkwWy@kroah.com>
References: <1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 21, 2023 at 10:01:12AM +0800, Linyu Yuan wrote:
> When work in gadget mode, currently driver doesn't update software level
> link_state correctly as link state change event is not enabled for most
> devices, in function dwc3_gadget_suspend_interrupt(), it will only pass
> suspend event to UDC core when software level link state changes, so when
> interrupt generated in sequences of suspend -> reset -> conndone ->
> suspend, link state is not updated during reset and conndone, so second
> suspend interrupt event will not pass to UDC core.
> 
> As in gadget mode, device level interrupt event have link state
> information, let's trust it and update software level link state to it
> when process each device level interrupt.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: update according v1 discussion

That does not describe what changed at all, please say what changed,
otherwise we have to guess, and I'm going to guess "nothing" :)

Please fix up and send a v3.

thanks,

greg k-h
