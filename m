Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A472D5BB191
	for <lists+linux-usb@lfdr.de>; Fri, 16 Sep 2022 19:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiIPRVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 13:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIPRVL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 13:21:11 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B0C7858DF3
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 10:21:09 -0700 (PDT)
Received: (qmail 51906 invoked by uid 1000); 16 Sep 2022 13:21:08 -0400
Date:   Fri, 16 Sep 2022 13:21:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     nana <zhongling0719@126.com>
Cc:     gregkh@linuxfoundation.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Message-ID: <YySwhOccJFjfx/Tu@rowland.harvard.edu>
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <YyN9u7EaXIKgLUmO@rowland.harvard.edu>
 <2fcdca5a-2deb-66ca-fd1d-c3ba719b19af@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fcdca5a-2deb-66ca-fd1d-c3ba719b19af@126.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 16, 2022 at 02:55:55PM +0800, nana wrote:
> Hi:
> 
>     ok,I have upated to v7.
> 
>     Sorry , The information in the previous answers about thinkplus(0x17ef,
> 0x3899) comes from the tester, which is somewhat confused.
> 
>     I just get the device from other department and the detailed test data
> are as follows:
> 
> 
> Test the thinkplus(0x17ef, 0x3899) speed by gnome-disk-utility tool.
> 
> linux(load uas)：                 linux(not load uas):
> 
> read： 394.2 MB/s                read:  382.2 MB/s
> 
> 
> write:  377.4 MB/s                 write:  347.8 MB/s
> 
> 
> ---------------------
> 
> win10(lower than linux,but more stable):
> 
> read : 388.1 MB/s
> 
> write: 320   MB/s
> 
> 
> The main performance differences is write speed.but load uas can cause error
> after long run, not good compatible with uas, So two bosses can
> consideration for the third patch is it feasible.

Is there any way for you to tell which protocol Windows uses 
(usb-storage or UAS)?

Alan Stern
