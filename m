Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EC84B23DF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Feb 2022 12:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348668AbiBKLC5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 06:02:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344286AbiBKLC4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 06:02:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE0FB88
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 03:02:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 445D9615DC
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 11:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098B8C340E9;
        Fri, 11 Feb 2022 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644577374;
        bh=lkb2YCUP3TThYWdc5gDo5iCc4xuPWn6r+rxPqWmy4m8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V/43SHUofsbUjF8kS9EWMW5pflWFC09Hz6YrmmuFlEdwhBdGR2gxinQ9dyYlsY+7a
         p0q+zRbGCC6bTBnvKcVzghevP1m4SRz5CTdXfTbzgTZ0w/CFK1EpEdSinTDpVLXkzE
         /9/OjU9w9ELBOLi58uFNudO1vezNoo+qGbCfKVug=
Date:   Fri, 11 Feb 2022 12:02:51 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/1] usb: gadget: f_fs: Support zerocopy transfers via
 mmap.
Message-ID: <YgZCW2hV8e10kGfe@kroah.com>
References: <20220209172507.97659-1-ingo.rohloff@lauterbach.com>
 <20220209172507.97659-2-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209172507.97659-2-ingo.rohloff@lauterbach.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 06:25:07PM +0100, Ingo Rohloff wrote:
> This patch implements the same functionality for FunctionFS as
> commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
> did for USB host devio.c
> 
> For FunctionFS, each "struct file *" for an endpoint (except EP0), keeps
> a list of mmapped buffers. User space might use these buffers to avoid
> copying of data by the kernel, by employing Linux native AsyncIO via
> libaio.
> 
> Standard read() and write() operations will NOT be zerocopy.
> Especially for reads, the expected USB transfer length is unclear;
> whereas an AIO request clearly specifies the maximum transfer length.

No documentation of the new mount option here?

It should go somewhere, right?

thanks,

greg k-h
