Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F895E66A2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 17:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiIVPRB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 11:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiIVPRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 11:17:00 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 96E97E7E29
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 08:16:59 -0700 (PDT)
Received: (qmail 262119 invoked by uid 1000); 22 Sep 2022 11:16:58 -0400
Date:   Thu, 22 Sep 2022 11:16:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     nana <zhongling0719@126.com>
Cc:     gregkh@linuxfoundation.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Message-ID: <Yyx8audVr/mQcd6a@rowland.harvard.edu>
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <YyN9u7EaXIKgLUmO@rowland.harvard.edu>
 <2fcdca5a-2deb-66ca-fd1d-c3ba719b19af@126.com>
 <YySwhOccJFjfx/Tu@rowland.harvard.edu>
 <fbeffee7-3ac5-4798-14b0-724e0ed01947@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbeffee7-3ac5-4798-14b0-724e0ed01947@126.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 04:17:41PM +0800, nana wrote:
> Hi
> 
>    >Is there any way for you to tell which protocol Windows uses
> 
> (usb-storage or UAS)?
> 
> I checked that the device manager was not load the uas driver, And this
> lower write speed for win10 doesn't seem to use uas protocol for this
> device.

Thank you.

>    if you have questions for [PATCH v7 3/3], I can continue to investigate
> thinkplus(0x17ef, 0x3899) and first submit patch v7 1/3 and patch v7 2/3.
>    you have anything unclear ,can ask me or advise me？

I have already sent Acked-by: messages for the 1/3 and 2/3 patches.  You 
can now add my Acked-by: to the 3/3 patch (the Thinkplus one).

Alan Stern
