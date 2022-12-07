Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894FD645E82
	for <lists+linux-usb@lfdr.de>; Wed,  7 Dec 2022 17:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiLGQPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Dec 2022 11:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLGQPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Dec 2022 11:15:10 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D7F29C9D
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 08:15:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D701FCE1AFE
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86902C433C1;
        Wed,  7 Dec 2022 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670429704;
        bh=M4JyZcIHOxf2hpy4SMJ2HH2fjwb/tIMNxLn+BZk/JBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fOt8ArVgaG+Z5pVvFAKQL1LqpwilX/ULEULVfhiEXvkbREe3WBg1BhxBniwQErN7K
         ZEZuf0oBcC52OyXfQK/Ak9I+uAAq3MzkFa3uU4T1YBtZRuW+xv4DjaLL/liMcp8UBv
         Hm02jLwi6j9bC/qp3L9M0KXGCWnYewqbiss4FFYs=
Date:   Wed, 7 Dec 2022 17:15:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: Re: dwc3 38100000.usb: No resource for ep1in
Message-ID: <Y5C8Bp5Km/GTmOzG@kroah.com>
References: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 07, 2022 at 02:27:32PM +0000, Dan Scally wrote:
> Hello Felipe
> 
> 
> I'm having an issue with DWC3 which I'm hoping you might be able to shed
> light on.

Why not ask the _current_ dwc3 maintainer?

(hint, check the latest MAINTAINERS file...)

thanks,

greg k-h
