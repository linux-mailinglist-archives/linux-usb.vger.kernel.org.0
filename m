Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EAB6C4960
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 12:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCVLmv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 07:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjCVLmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 07:42:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C225D8A6
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 04:42:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEAB3B81C0E
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 11:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCCFC433D2;
        Wed, 22 Mar 2023 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679485366;
        bh=TbxTqZe72A/xX7pCC5oK5xfc1yYY3+Q9KmQ4Qq5IHR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XGW/l5YdW1zmJv4Ubvyzzy4QS1KOFxQRA3iJco/Zxl97XX9npB/EdzTkggpOZgvyL
         I2veot/zgY1CIcdlBSD13bhkIFbETumgt2R6f8SNVgm52lB06IOpiDKF/JVulQ8J7x
         TaH+O7cFhNVNvwZe1QkQfMn0oIyOeZbrsllfIS3U=
Date:   Wed, 22 Mar 2023 12:42:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb tree branch usb-linus merge plan ?
Message-ID: <ZBrps8reH2AYqZoJ@kroah.com>
References: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 22, 2023 at 10:22:28AM +0000, Joakim Tjernlund wrote:
> In https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-linus there UCSI fixes that
> prevent OOPS in stable Linux.

What specific commit are you concerned about?

> I don't see any of them in Linus tree and wonder if these are planned for later?

Hopefully they will get sent to Linus later this week.  Is there a
specific rush that you need this now?

thanks,

greg k-h
