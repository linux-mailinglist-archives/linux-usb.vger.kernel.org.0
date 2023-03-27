Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBE66CA769
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbjC0OVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 10:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbjC0OVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 10:21:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519446EB9;
        Mon, 27 Mar 2023 07:19:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33CB7B8109B;
        Mon, 27 Mar 2023 14:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3FEC433EF;
        Mon, 27 Mar 2023 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679926747;
        bh=H1zQbVd7ZtFFbG6f+gh48fWovmGBI/b7rj1MVwmGdlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2JZnVhmr+GvucAefTOTHG4SINRIbHkt218lTVWYDZ6XxgeRmohUvRrHb78RTLpj3F
         yj4P9HJboa87RHgDStG02Mkay2/w4WDtKxh+3Lm7JegvUbRBO9q8n9fvx383eJZwdR
         QhakDsGLQ5RBmVg6PgUnMls3dwcLgSuxR+h7f8W4=
Date:   Mon, 27 Mar 2023 16:19:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yaroslav Furman <yaro330@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re:
Message-ID: <ZCGl1jhy4irUFvJ2@kroah.com>
References: <ZA12pMgwA/8CguYd@kroah.com>
 <20230327135423.607033-1-Yaroslav.Furman@verifone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327135423.607033-1-Yaroslav.Furman@verifone.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 27, 2023 at 04:54:22PM +0300, Yaroslav Furman wrote:
> 
> Will this patch get ported to LTS trees? It applies cleanly.
> Would love to see it in 6.1 and 5.15 trees.

What patch?

confused,

greg k-h
