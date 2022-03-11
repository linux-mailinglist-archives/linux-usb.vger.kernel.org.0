Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989444D6419
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 15:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245729AbiCKOvj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 09:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243203AbiCKOvj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 09:51:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECAEDF488
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 06:50:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3BA7B82B3D
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 14:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDC3C340E9;
        Fri, 11 Mar 2022 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647010233;
        bh=/32jyT14jnPAYkdtMBCJMNJKZ17UJ/43fUPTHlpvyRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NWV7VXc2wxD6Rc2IPIRBNsuf6kpxz6mEq8GY2wG1hLbUOb14oUJRmN5XH/T8QLNgt
         I61FsaXHbaO+J13ogf8A28tJV0P1iinSRCP+cDd+XuWU1MWViLqGUitQUDHGtOjPK5
         gxIdtU6iJKYy5I0Vap66qpodJHHD691sxn1k8AiU=
Date:   Fri, 11 Mar 2022 15:50:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.18 merge window
Message-ID: <Yiths4k5IUhHnYmi@kroah.com>
References: <YidKEUcphTB4SE0E@lahna>
 <Yis2eUiooOFy0b46@kroah.com>
 <YitSc/Sy8O4BSilF@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YitSc/Sy8O4BSilF@lahna>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 03:45:23PM +0200, Mika Westerberg wrote:
> On Fri, Mar 11, 2022 at 12:46:01PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Mar 08, 2022 at 02:20:33PM +0200, Mika Westerberg wrote:
> > > Hi Greg,
> > > 
> > > The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> > > 
> > >   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.18-rc1
> > 
> > The gpg key you used to sign this tag is expired, so my checks fail :(
> 
> Hmm,
> 
> I extended the expiration time already last year and it shows here:
> 
>   rsa4096 2017-11-02 [SC] [expires: 2022-08-23]
> 
> For that key. I pushed it to the keyserver too at the time
> (keyserver.ubuntu.com).
> 
> > Please fix this.
> 
> Sure but how? :)

Get the update in the kernel.org pgp list?  That's where I update from.

thanks,

greg k-h
