Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEED757D76
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 15:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjGRN1x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 09:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjGRN1w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 09:27:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11265D1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 06:27:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3E7C61587
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 13:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFBCC433C7;
        Tue, 18 Jul 2023 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689686870;
        bh=OllI6hqwDmAP9/S7KjyQLxoCQsdlJakPqeGx3eqe7n8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DGcVLWbGC+0pwwepizlUfKJV2Ug+iwpitZdTNMNNIvD1MzWkEqHmjbPDbs2hno+UV
         bzktmaGosHPlGAloJPdBOOCNtCSOrkL7F2ZHVMOs48+IU+AsgBBfgoVgrhxrjUeew5
         J5d3ObW1bjqQUlLczqul6dC1DA/hdvPWMnxQuvHY=
Date:   Tue, 18 Jul 2023 15:27:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, kuba@kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] USB: zaurus: 3 broken Zaurus devices
Message-ID: <2023071811-dandy-jugular-b306@gregkh>
References: <4963f4df-e36d-94e2-a045-48469ab2a892@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4963f4df-e36d-94e2-a045-48469ab2a892@bigpond.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 18, 2023 at 10:16:55AM +1000, Ross Maynard wrote:
> Hi Greg,
> 
> This is related to Oliver Neukum's patch
> 6605cc67ca18b9d583eb96e18a20f5f4e726103c (USB: zaurus: support another
> broken Zaurus) which you committed in 2022 to fix broken support for the
> Zaurus SL-6000.
> 
> Prior to that I had been able to track down the original offending patch
> using git bisect as you had suggested to me:
> 16adf5d07987d93675945f3cecf0e33706566005 (usbnet: Remove over-broad module
> alias from zaurus).
> 
> It turns out that the offending patch also broke support for 3 other Zaurus
> models: A300, C700 and B500/SL-5600. My patch adds the 3 device IDs to the
> driver in the same way Oliver added the SL-6000 ID in his patch.
> 
> Could you please review the attached patch? I tested it on all 3 devices and
> it fixed the problem. For your reference, the associated bug URL is
> https://bugzilla.kernel.org/show_bug.cgi?id=217632.

I'll be glad to accept it if you resend it in a format that I can apply
it in.  I'll run my patch-bot on it to give you some hints on what needs
to be done here.

thanks,

greg k-h
