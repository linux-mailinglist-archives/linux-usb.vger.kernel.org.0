Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A236C8CDC
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 10:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjCYJCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Mar 2023 05:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjCYJCL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 05:02:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15C212BC7
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 02:02:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B5F560A25
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 09:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A29EC433D2;
        Sat, 25 Mar 2023 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679734928;
        bh=xGux7hG5u+4QoiPFBavOjX+D8DHTWrga1kUIgKFW8JY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xv1TAPU371sTrcalN7ZwJ4EbIm0PMSx6/Tl5tk69UNm07uoPTkYi1hm3EMMacVa7m
         n6X+EsF7Pp4ohWqkdsVWj3Lxo1nnEklPJ4uSJHOCulU45Ym4qYWyE8x7nUWaxSVB4I
         OCAmEMld8yOR/GDqlv1VDQboVgLEyOKu2wOx2mIE=
Date:   Sat, 25 Mar 2023 10:02:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: gadget: f_fs: remove ENTER() macro
Message-ID: <ZB64iI7O3un0VbUL@kroah.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 24, 2023 at 02:10:25PM +0800, Linyu Yuan wrote:
> ENTER() used to show function name which called during runtime, ftrace can
> be used to get same information, let's remove it.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: split to several changes according to v1 comments
> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> 
>  drivers/usb/gadget/function/f_fs.c | 94 --------------------------------------
>  drivers/usb/gadget/function/u_fs.h |  2 -
>  2 files changed, 96 deletions(-)

As the kernel-test-bot points out, this patch does not build :(

