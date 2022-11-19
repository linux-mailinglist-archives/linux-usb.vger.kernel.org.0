Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A89630D98
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 09:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiKSIxy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Nov 2022 03:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSIxx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Nov 2022 03:53:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEA64908B
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 00:53:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC65C60B0A
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 08:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BFEC433D6;
        Sat, 19 Nov 2022 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668848031;
        bh=BoUsErHyOXwWB3tCSqj39omYoQlCCy53K7Mi7XVXcWI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I6ZVzSIO0ZTbfiAS+xF1EOyjetrqQw1IGguSAzKtDfN7cvp9x0tdMx2PG64OSPN1Z
         261J4KrCdn2bLzTP8JActEMFtTPPdGNMXSpmMDbeRszF4zQGUMMqrrQE1KLkf7PZfW
         jkoROClKvo8dI//NoSNspTKAGU1xQ2bleei9ZOPc=
Date:   Sat, 19 Nov 2022 09:53:48 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 216706] New: USBC resume callback takes far too long,
 between 650ms and 1200ms
Message-ID: <Y3iZnMq5mGyEmZv9@kroah.com>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 18, 2022 at 08:24:14PM +0000, bugzilla-daemon@kernel.org wrote:
> I have timelines from 7 separate machines that are now affected but this
> behavior. We have a guidline that neither suspend or resume should take longer
> than a second, and this is causing us problems.

What is making this arbritrary requirement?  If it is an issue, please
provide a working change to resolve it as your group can help implement
and test this.

thanks,

greg k-h
