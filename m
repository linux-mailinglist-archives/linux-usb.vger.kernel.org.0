Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F393C73850D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 15:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbjFUN3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 09:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjFUN3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 09:29:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCC819BE
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 06:29:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA6C0614E4
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 13:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFFCC433C8;
        Wed, 21 Jun 2023 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687354166;
        bh=np9mHCRiqRRBNekCxcRUUEThiL9MG4PCDfK8Wp/e3zs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2iAz1i5EPckAUneLsjcYlnTOdGKBOinobEOO+j2HRrr1srOxa1ZVLIVRO4eAeszk4
         2QqdmNAsoDKVBBjYT8WdxGoMkXbvuJ1ZWtp71psHTMRq0o5qbmWlQDUHkwQxd2R4q0
         99WgPZOSnpgWDWYDGOdLiIQ5GaoVhliiI8Y5Yzc4=
Date:   Wed, 21 Jun 2023 15:29:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/6] USB: file.c: make usb class a static const structure
Message-ID: <2023062110-portfolio-partner-d010@gregkh>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
 <20230620094412.508580-12-gregkh@linuxfoundation.org>
 <2023062000-consuming-crusher-8a92@gregkh>
 <33236558-8987-0b84-bef0-613fec01f965@gmail.com>
 <2023062111-uptown-unpack-0fb1@gregkh>
 <abc79c1b-f12e-50fc-5351-b62462125c57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc79c1b-f12e-50fc-5351-b62462125c57@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 05:06:34PM +0400, Ivan Orlov wrote:
> On 6/21/23 16:48, Greg Kroah-Hartman wrote:
> > I think we should make it simpler, allocate the class when we start up,
> > and free it when we shut down, which guarantees that all users of the
> > class are removed at that time as this is part of the usb core code.
> > 
> > No need to be fancy anymore with the dynamic creation/removal of the
> > class, it's just not worth it :)
> > 
> > thanks,
> > 
> > greg k-h
> 
> Alright, it sounds really reasonable, let's do it in this way :)
> 
> I'll add init_usb_class call to the 'usb_init' function and the
> corresponding releasing function call to the 'usb_exit' function in the
> 'drivers/usb/core/usb.c' file. So we would register class at startup and
> unregister it when shutting down.
> 

Totally reasonable, thanks for doing this work.

greg k-h
