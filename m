Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645845A5B55
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 07:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiH3F7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 01:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH3F7x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 01:59:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC8F108E
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 22:59:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC3CD60DD4
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 05:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1758C433D6;
        Tue, 30 Aug 2022 05:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661839189;
        bh=2jZ407aXNqXEisyrYC8JjQWUhV5sxVzJDtskGUtVGpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YktAs4luBcg2jyqdC5Tj2IrZ3+jc13hI/5642htUePFjEv9LdROTAj2nwU7WZqGSh
         /FUHHNpwSdcyA9TZVlnO9Btkzz2ehecy5OgJT9d8/5AMp9x/pVmjFKBZ6fTIgOVif0
         hOzVTdWoprElIyU4biqpR5nhhNGKyKfE2S4qGHRo=
Date:   Tue, 30 Aug 2022 07:59:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v3] usb: Improves USB2.0 write performance
Message-ID: <Yw2nUkHFiga+I2af@kroah.com>
References: <CABd4UjZmn+J86BtSrRY42s57fpO+F5LBQL0neLpczzWKJ_Srxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjZmn+J86BtSrRY42s57fpO+F5LBQL0neLpczzWKJ_Srxg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 30, 2022 at 01:19:32PM +0800, Hu Xiaoying wrote:
> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write speed < 30MB/s. if does not to load module of uas for
> this device
> , can increase the write speed from 20MB/s to >40MB/s.
> 
> Signed-off-by: Hu Xiaoying <huxiaoying@gmail.com>

Again, you have not done what I have asked in the past in order to make
this patch acceptable, so I'll just start ignoring it now :(

greg k-h
