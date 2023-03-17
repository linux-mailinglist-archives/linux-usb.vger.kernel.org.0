Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969746BE0E9
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCQGBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjCQGBr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:01:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7B939CCE
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:01:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A08F5B82453
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 06:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00E6C433EF;
        Fri, 17 Mar 2023 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679032903;
        bh=9leCEPFACGGqJuFpr2IISDaU0j7s22RLZJdqQ6v17sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uV8Xu7foIRPvR0QiFr1Jt8heP5+nRe17NItPqXpJUffhWIARjXthT+xLjx/OoEjnM
         5tjfGiqWFlzvWHwxStjyGSefJ3WbjXwQtb7DRqqZcpTZY8vy4c1JHJXF0FjREgyZVm
         mcQ7DGQ57eAVo04IADefj6A4aW1Q9XXhTW4CI0FI=
Date:   Fri, 17 Mar 2023 07:01:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH RESEND v2 2/2] usb: chipidea: core: fix possible
 concurrent when switch role
Message-ID: <ZBQCRDYjXQOXLtVe@kroah.com>
References: <20230317055203.2366868-1-xu.yang_2@nxp.com>
 <20230317055203.2366868-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317055203.2366868-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 17, 2023 at 01:52:03PM +0800, Xu Yang wrote:
> The user may call role_store() when driver is handling
> ci_handle_id_switch() which is triggerred by otg event or power lost
> event. Unfortunately, the controller may go into chaos in this case.
> Fix this by protecting it with mutex lock.
> 
> Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> cc: <stable@vger.kernel.org>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> changes since v1:
> - modify description for mutex member
> - wrap role variable in ci_handle_id_switch() too

There are 2 "v2 2/2" patches here, which one is correct?

Can you send a v3 with just the needed patches?

thanks,

greg k-h
