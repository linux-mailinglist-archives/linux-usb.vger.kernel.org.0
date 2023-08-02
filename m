Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6576D3D7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 18:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbjHBQgh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 12:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbjHBQgW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 12:36:22 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1CDA82D68
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 09:35:58 -0700 (PDT)
Received: (qmail 210266 invoked by uid 1000); 2 Aug 2023 12:35:54 -0400
Date:   Wed, 2 Aug 2023 12:35:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
Cc:     christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KMSAN: uninit-value in alauda_check_media
Message-ID: <7bc4109e-6048-4504-905e-2fae488c3027@rowland.harvard.edu>
References: <497564c2-632f-472a-914e-5e19488824ae@rowland.harvard.edu>
 <000000000000b2c2d50601f2d36b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000b2c2d50601f2d36b@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 02, 2023 at 09:05:05AM -0700, syzbot wrote:
> > This thread has been dormant for over a year and a half.  Let's revive 
> > it and try to close out the issue.
> >
> > Alan Stern
> >
> > #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc3
> 
> Your commands are accepted, but please keep 
> syzkaller-bugs@googlegroups.com mailing list in CC next time. It 
> serves as a history of what happened with each bug report. Thank you.

Okay.  But if it's so important to you guys that messages sent to 
syzbot+...@syzkaller.appspotmail.com are also sent to 
syzkaller-bugs@googlegroups.com, how come you haven't set up an 
automatic email forwarding service?  Wouldn't that be more reliable?

Alan Stern
