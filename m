Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA1076D84C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 22:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjHBUAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 16:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjHBUAc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 16:00:32 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2FD491FFA
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 13:00:29 -0700 (PDT)
Received: (qmail 217771 invoked by uid 1000); 2 Aug 2023 16:00:28 -0400
Date:   Wed, 2 Aug 2023 16:00:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        syzbot <syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 read_descriptors (3)
Message-ID: <58e8a28b-ab24-4449-9072-e0fb7ed39196@rowland.harvard.edu>
References: <e5a6c3be-6dd3-4c85-9c5b-f9fb7aca0b36@rowland.harvard.edu>
 <0000000000007fc04d06011e274f@google.com>
 <c9bb72e0-8e02-4568-bd43-6897f9c94d12@rowland.harvard.edu>
 <CACGdZYL_dPFp-yHWHGC3vxyv4R4dYtSJe5GPcN0NjG2qaz+xmg@mail.gmail.com>
 <248d9759-aef7-45ce-b0a4-6c1cafee76c9@rowland.harvard.edu>
 <CACGdZY+qJ7P8FZj6ZGmcDkf2YH7LRBnfvuwiro4ZF37+owHo9g@mail.gmail.com>
 <2023072648-exclaim-crisply-9d8a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023072648-exclaim-crisply-9d8a@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg:

I'm putting together a series of three patches to deal with this 
problem.  The first two do some preparatory work, and the bug found by 
syzbot actually gets fixed by the third patch.

In view of this, how should I tag the patches?  They should all get into 
the -stable trees eventually, but only the third one really deserves a 
Fixes: or Reported-by: tag.

What's your advice?

Alan Stern
