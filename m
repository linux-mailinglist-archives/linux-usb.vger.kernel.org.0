Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0EF738411
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjFUMsd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 08:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjFUMsc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 08:48:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF754198E
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:48:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8015961568
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 12:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A863C433C0;
        Wed, 21 Jun 2023 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687351709;
        bh=XlcNfi9qebuyQ9E5YsokvPJXBtq6FtXXMy12XvYhYm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r5DKmja1mtgiEpJGJue91XtPhWawEoEXZryVRUKe/KVn7IyMSMsbtWCZsflcapMPk
         HTuYn5VgGtMv6UXr8CHWUHBrh9S32zxCnuCuydPVSN09nu6hsSZkM0n8bB8xq7mqTC
         FROpZlMQfSSOLIHxFnadanSaLPNt5WKHjaxeeGco=
Date:   Wed, 21 Jun 2023 14:48:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/6] USB: file.c: make usb class a static const structure
Message-ID: <2023062111-uptown-unpack-0fb1@gregkh>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
 <20230620094412.508580-12-gregkh@linuxfoundation.org>
 <2023062000-consuming-crusher-8a92@gregkh>
 <33236558-8987-0b84-bef0-613fec01f965@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33236558-8987-0b84-bef0-613fec01f965@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 03:08:07PM +0400, Ivan Orlov wrote:
> On 20.06.2023 18:22, Greg Kroah-Hartman wrote:
> > Is this structure needed anymore at all now that the thing the kref was
> > "protecting" is gone?  I think it can be dropped entirely, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> As I understood after reading the code, this kref is used for checking how
> many devices uses our class and testing when we can unregister it.
> 
> As we register our class only when the first device is registered, I think
> the best solution is to move this kref structure out of the usb_class
> structure as we still need it for detecting when we could finally unregister
> our class. What do you think about it?

I think we should make it simpler, allocate the class when we start up,
and free it when we shut down, which guarantees that all users of the
class are removed at that time as this is part of the usb core code.

No need to be fancy anymore with the dynamic creation/removal of the
class, it's just not worth it :)

thanks,

greg k-h
