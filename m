Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160E86A1704
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 08:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBXHW6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 02:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBXHW5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 02:22:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5511011148
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 23:22:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF559617F7
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 07:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D7EC433D2;
        Fri, 24 Feb 2023 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677223375;
        bh=MIUJQDyRiFYrkm6Ko7bcWxuuqU8Pn8TwsPPuiffXbMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iqcQDRYVECG0O2dhBKr/UhlQQtYY637h3I+5ZaWx9xlnVo8DdY/3emSPMw7wpU9uF
         mnEvt9MBLOjxxcOzq6NORUzVTIEjMAe0f5jRRMj2Erq5J4eQJf9Z+pigypnOGoFyMg
         PDyfmo1nT018okbjYKMP5LjSvYZOYSDdIiO31q5o=
Date:   Fri, 24 Feb 2023 08:22:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217081] New: miss kzalloc check in mv_udc_probe
Message-ID: <Y/hlzMiO3Fc/GgHs@kroah.com>
References: <bug-217081-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217081-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 24, 2023 at 07:11:13AM +0000, bugzilla-daemon@kernel.org wrote:
> miss a null check at
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/udc/mv_udc_core.c#L2232

Great!  Please submit a patch to resolve this issue if you think this can
ever actually happen.

thanks,

greg k-h
