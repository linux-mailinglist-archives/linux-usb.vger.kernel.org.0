Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2930376E04C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 08:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbjHCGeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 02:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjHCGeH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 02:34:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691111706
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 23:34:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F021861BF2
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 06:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04154C433C8;
        Thu,  3 Aug 2023 06:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691044445;
        bh=TCC4iuQ9D/UTfjyChgiJS1CdKrDbU3WUBR/6m75bTec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LVFbJyhpo9pjRz7ZjCyFELSknRor7cBKiPDAtC642hSsMohaITHSAKdbs8i8JPZ2N
         fQASDNIY2HaYbTxaAo85oXqJN7t72h/eZJzm6qYlZ6ZrHIwmGjXDfKFJUNjmSFstl0
         vO6vhoXegNgHud+6N2iyfupXdbWS0p8+FKLIQFn8=
Date:   Thu, 3 Aug 2023 08:34:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        syzbot <syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 read_descriptors (3)
Message-ID: <2023080309-economist-each-6f51@gregkh>
References: <e5a6c3be-6dd3-4c85-9c5b-f9fb7aca0b36@rowland.harvard.edu>
 <0000000000007fc04d06011e274f@google.com>
 <c9bb72e0-8e02-4568-bd43-6897f9c94d12@rowland.harvard.edu>
 <CACGdZYL_dPFp-yHWHGC3vxyv4R4dYtSJe5GPcN0NjG2qaz+xmg@mail.gmail.com>
 <248d9759-aef7-45ce-b0a4-6c1cafee76c9@rowland.harvard.edu>
 <CACGdZY+qJ7P8FZj6ZGmcDkf2YH7LRBnfvuwiro4ZF37+owHo9g@mail.gmail.com>
 <2023072648-exclaim-crisply-9d8a@gregkh>
 <58e8a28b-ab24-4449-9072-e0fb7ed39196@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e8a28b-ab24-4449-9072-e0fb7ed39196@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 02, 2023 at 04:00:28PM -0400, Alan Stern wrote:
> Greg:
> 
> I'm putting together a series of three patches to deal with this 
> problem.  The first two do some preparatory work, and the bug found by 
> syzbot actually gets fixed by the third patch.
> 
> In view of this, how should I tag the patches?  They should all get into 
> the -stable trees eventually, but only the third one really deserves a 
> Fixes: or Reported-by: tag.
> 
> What's your advice?

Sounds correct, just tag the last one with a reported-by:  Same for the
fixes: tag, we deal with this in the stable tree a lot, and can figure
out the dependancies like this for patch series.

thanks,

greg k-h
