Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0527A6BCD57
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 11:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCPK4z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 06:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjCPK4y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 06:56:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805F618B30
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 03:56:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A9BB61FD1
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 10:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290FCC433EF;
        Thu, 16 Mar 2023 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678964212;
        bh=VKbLp7ne6S94bv2dNYDVip4KPcugs19hynVZWPE36XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bGqDRjLqKJikW+Njm8bGwNxIinC3LGIslGNgChqQAIYkyuoPieXI/2koaOV2NxbKk
         BJvA+3OULey/qtUlA4Wd4GBPMV8RVeq1Wt25nK+ECuaKkHi8tFxlIGBrvW1P8qgo/Y
         RXzbg4oQCrZ62uR8BoF4leniJaKKvRtLLblq2fm0=
Date:   Thu, 16 Mar 2023 11:56:49 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Message-ID: <ZBL18fPCgckibrcg@kroah.com>
References: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
 <ZAr+eiTrUN/LV3YN@kroah.com>
 <b626ba525751345e59da4af438c4adf2c833ca0a.camel@infinera.com>
 <7d2287ea03069b702b8da2157f8148b820de4446.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d2287ea03069b702b8da2157f8148b820de4446.camel@infinera.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 14, 2023 at 01:19:25PM +0000, Joakim Tjernlund wrote:
> On Fri, 2023-03-10 at 13:27 +0100, Joakim Tjernlund wrote:
> > On Fri, 2023-03-10 at 10:55 +0100, gregkh@linuxfoundation.org wrote:
> > > On Fri, Mar 10, 2023 at 09:44:26AM +0000, Joakim Tjernlund wrote:
> > > > The old RNDIS/NCM configs does not work against modern Windows. I wonder if there
> > > > should/could be updated to working state ?
> > > 
> > > Please never use RNDIS on modern systems unless you fully trust the
> > > "other side" of the connection as it is not a secure protocol by any
> > > means.
> > 
> > Yes, we will move to NCM (new in >= Windows 10)
> > 
> > > 
> > > NCM should "just work" instead.  What exactly is failing, and what
> > > specifically do you mean by "modern Windows"?
> > 
> > NCM does not just work on Windows >= 10 it needs configfs settings:
> > 
> > NCM snipped:
> > 	echo 1       > os_desc/use
> > 	echo 0xbc    > os_desc/b_vendor_code
> > 	echo MSFT100 > os_desc/qw_sign
> > 
> > 	mkdir functions/ncm.usb0
> > 	mkdir -p functions/ncm.usb0/os_desc/interface.ncm
> >     #Set compatible id so that Windows 10 can match this function to
> >     # NCM driver more easily.
> > 	echo WINNCM   > functions/ncm.usb0/os_desc/interface.ncm/compatible_id
> > 
> > 	mkdir -p configs/c.1
> > 	mkdir -p configs/c.1/strings/0x409
> > 	echo "conf1" > configs/c.1/strings/0x409/configuration
> > 	ln -s functions/ncm.usb0 configs/c.1
> > 	if [ ! -L os_desc/c.1 ]
> > 	then
> > 		 ln -s configs/c.1 os_desc
> > 	fi
> > 
> > New RNDIS in Windows >= 10
> > 	echo 1       > os_desc/use
> > 	echo 0xbc    > os_desc/b_vendor_code
> > 	echo MSFT100 > os_desc/qw_sign
> > 
> > 	mkdir functions/rndis.usb0
> > 	mkdir -p functions/rndis.usb0/os_desc/interface.rndis
> > 
> > 	#Set compatible / sub-compatible id's so that Windows can match this
> >     # function to RNDIS6 driver more easily.
> > 	echo RNDIS   > functions/rndis.usb0/os_desc/interface.rndis/compatible_id
> > 	echo 5162001 > functions/rndis.usb0/os_desc/interface.rndis/sub_compatible_id
> > 
> > 	mkdir -p configs/c.1
> > 	mkdir -p configs/c.1/strings/0x409
> > 	echo "conf1" > configs/c.1/strings/0x409/configuration
> > 	ln -s functions/rndis.usb0 configs/c.1
> > 	if [ ! -L os_desc/c.1 ]
> > 	then
> > 	 	ln -s configs/c.1 os_desc
> 
> 
> Did this make any sense to you ? The old legacy/builtin configs does not do any of this.

Sorry, I do not have any Windows machines to test with so I really do
not know.  If you think the defaults are currently wrong, please submit
a patch to fix them up.

thanks,

greg k-h
