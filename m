Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68B6EF5E9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 15:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241249AbjDZN7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 09:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241148AbjDZN7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 09:59:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B01C658C
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 06:59:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA96061701
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 13:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04792C433EF;
        Wed, 26 Apr 2023 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682517582;
        bh=vZYOd9ZMoYmwf3b+spb+OoUtq8EhF1VgLjGvisoKmCQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a/pNTmBrpkctU2watCmwLjtb9DTn4oxxQ3qxLdRM05LSK/NPv3+y1N36Q9/aqfZ7Q
         G847Lc20im7jcw0hR0mX+peDIwADEZs8GfJzCNamltqolMZ6UR+fc9yWwb89AQ+3+m
         ThxA535qRJEuy3WzVc5upOSec8SSKU0H5LU7n0sfC3TiYqw0TseWMXPGT0Pk2NU0sb
         oBWpi52MEHKDmuMOdchJVfjipJFOPCl68PvI+OEHQFcFRb41yPs5fRnxd5Vb4hCpNn
         +iJKCALqhIRs3YIWJ2DFWEwQt8i2i2tIkNY5zFJG0a2FlmklkgDAir3LOQ/Rz1Q+sN
         dXJLJJVsIN69w==
Date:   Wed, 26 Apr 2023 06:59:41 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        regressions@lists.linux.dev
Subject: Re: USB sound card freezes USB after resume from suspend
Message-ID: <20230426065941.7615ffc6@kernel.org>
In-Reply-To: <a2e18eaa-2984-c2ba-f101-e16ad1dae0a0@perex.cz>
References: <20230425111924.05cf8b13@kernel.org>
        <87pm7rtdul.wl-tiwai@suse.de>
        <7645c6c8-a21c-23d7-5c19-cd2892b98481@perex.cz>
        <87leifjc16.wl-tiwai@suse.de>
        <a2e18eaa-2984-c2ba-f101-e16ad1dae0a0@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 Apr 2023 13:04:15 +0200 Jaroslav Kysela wrote:
> > A good point, it'll be a patch like below.  
> 
> It looks good.
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> 
> > But we still need to figure out what's actually happening there.
> >     
> >> But I cannot reproduce this lock here.  
> > 
> > Here too.  Could be tied with the config or the device?  
> 
> Perhaps. Jakub, could you do more debugging (printk, traces)?

Let me get back to you on Saturday - I'll test the patch and try a bit
of bisecting. Can't promise much in terms of printing, because IDK what
to print :(
