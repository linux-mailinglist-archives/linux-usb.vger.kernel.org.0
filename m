Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F444C2933
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 11:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbiBXKUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 05:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbiBXKUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 05:20:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5C828A11F
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 02:19:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D0126153D
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 10:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66B1C340E9;
        Thu, 24 Feb 2022 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645697983;
        bh=hBTGvhXlI+1IxF+j9wFw4ST3mJkD8m0zK1JFLFPfxmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p90dFOWxY8kfo1R0wBzbNRqUFICQm+OJ0+PzOMdN82QoiOyMQ9Fhh4cGpqPQBceLh
         ytVxAVy/Ejwd7MXrgXqPF8qBSB8XyDeIs2pta4btz69dhtTV1JPkWk5CHpinw0c9J/
         X6O3z9GDwABWrTPxLDBTOyhCuhNjwBvD64N8Cml4=
Date:   Thu, 24 Feb 2022 11:19:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: omit mem read just after allocation of trb
Message-ID: <YhdbvCOGnxlFMu4e@kroah.com>
References: <20220217133549.27961-1-oneukum@suse.com>
 <4632126f-97da-65c9-a240-b86f4490afe0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4632126f-97da-65c9-a240-b86f4490afe0@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 18, 2022 at 10:26:45AM +0200, Mathias Nyman wrote:
> On 17.2.2022 15.35, Oliver Neukum wrote:
> > This has been allocated just a few lines earlier with a
> > zalloc(). The value is known and "|=" is a waste of memory
> > cycles.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> Thanks
> 
> In case Greg wants to pick this up now directly:
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thanks, I'll take it now, it's easy enough to :)
