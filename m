Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F778694B24
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 16:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjBMP2X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 10:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbjBMP2M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 10:28:12 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 282B016330
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 07:28:09 -0800 (PST)
Received: (qmail 909929 invoked by uid 1000); 13 Feb 2023 10:28:08 -0500
Date:   Mon, 13 Feb 2023 10:28:08 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Coly Li <colyli@suse.de>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzkaller <syzkaller@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH RFC] drivers/core: Replace lockdep_set_novalidate_class()
 with unique class keys
Message-ID: <Y+pXCFOyhXbbLgCv@rowland.harvard.edu>
References: <109c3cc0-2c13-7452-4548-d0155c1aba10@gmail.com>
 <Y+gjuqJ5RFxwLmht@moria.home.lan>
 <Y+hRurRwm//1+IcK@rowland.harvard.edu>
 <Y+hTEtCKPuO0zGIt@moria.home.lan>
 <Y+hW74TAVzCpSv7c@rowland.harvard.edu>
 <Y+hYn6uzIUBaxDdV@moria.home.lan>
 <Y+kEgDLSRwdODRdD@rowland.harvard.edu>
 <Y+k6ehYLWa0cmbvb@moria.home.lan>
 <Y+lJxCLpwMGuq0sP@rowland.harvard.edu>
 <Y+oCdlIwCDtRRG6T@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+oCdlIwCDtRRG6T@hirez.programming.kicks-ass.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 13, 2023 at 10:27:18AM +0100, Peter Zijlstra wrote:
> On Sun, Feb 12, 2023 at 03:19:16PM -0500, Alan Stern wrote:
> 
> > (Device names are often set after the device is initialized.  Does 
> > lockdep mind if a lock_class_key's name is changed after it has been 
> > registered?)
> 
> It does, althought I don't at the moment recall how hard it would be to
> change that.

If the names are only used for printing purposes, or other similarly 
innocuous things, it ought to be enough to set the name with 
smp_store_release() and read the name with smp_load_acquire().

Alan Stern
