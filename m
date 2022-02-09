Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2FC4AE969
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 06:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbiBIFig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 00:38:36 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiBIFep (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 00:34:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2204DF28ACF
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 21:34:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 00270B81E10
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 05:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE84C340E7;
        Wed,  9 Feb 2022 05:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644384865;
        bh=XP0CMziFpRo1rY4aI+vMtMuVmobTX6u1KrU1Ut1o2FM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IedDpCmJAqqvnkvcs34yqyI5h8iTkVq3GdlqdNYNryQDJnsXlrgcfklOkaReeQ4el
         eHByfV9TXF3rUpD5SvJSoiyLsmtF3Hlu9ehnex65u5p0MzH+wlSDn2tBcTUHMTlz1s
         fKHbIxGPuOXZRY2aJTyrDSXaVzZT0oi8MZ0RHap8=
Date:   Wed, 9 Feb 2022 06:34:22 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
Message-ID: <YgNSXs3v3Re6mYKF@kroah.com>
References: <dac675d4-2dbd-e16d-622a-0471f31f2aca@omp.ru>
 <7a352b9b-0073-ad61-cbbf-256ec90e3ba3@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a352b9b-0073-ad61-cbbf-256ec90e3ba3@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 11:01:09PM +0300, Sergey Shtylyov wrote:
> On 2/8/22 10:58 PM, Sergey Shtylyov wrote:
> 
> > The *switch* statement in usb_dump_endpoint_descriptor() does handle all
> > possible endpoint types expilictly, so the *defaut* label is unreachable.
> 
>    It's *default*. :-) Please fix when/if merging! 

I can not easily change changelog texts when applying patches as the
tools suck the patch in from the public archive, sorry.

Please resend.
