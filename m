Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54D54DCB14
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 17:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbiCQQSw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 12:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbiCQQSv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 12:18:51 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DC7902156D3
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 09:17:34 -0700 (PDT)
Received: (qmail 8673 invoked by uid 1000); 17 Mar 2022 12:17:34 -0400
Date:   Thu, 17 Mar 2022 12:17:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     kernel test robot <lkp@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LinusTorvalds@rowland.harvard.edu, torvalds@linux-foundation.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
Message-ID: <YjNfHsqfjPqBMejZ@rowland.harvard.edu>
References: <6232d299.9omOW8g6S6l31UFc%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6232d299.9omOW8g6S6l31UFc%lkp@intel.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 17, 2022 at 02:18:01PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4  Add linux-next specific files for 20220316

> drivers/usb/storage/ene_ub6250.c:2416:27: warning: array subscript 'struct SD_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]
> drivers/usb/storage/ene_ub6250.c:2417:27: warning: array subscript 'struct MS_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]
> drivers/usb/storage/ene_ub6250.c:2418:27: warning: array subscript 'struct SM_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]

These warnings seem pretty bogus.  Their meaning isn't entirely clear,
but the statements they complain about copy a 1-byte location to a
structure consisting of eight 1-bit fields (or the equivalent).

Do the structure declarations need to be "packed"?

Alan Stern
