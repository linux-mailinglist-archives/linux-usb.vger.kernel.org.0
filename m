Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117464BE3ED
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243550AbiBUItg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 03:49:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiBUItf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 03:49:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236B62735
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 00:49:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B399F61134
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 08:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F6FC340E9;
        Mon, 21 Feb 2022 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645433352;
        bh=tmVWyVurMb9MoTOjIlV+9c1F9OIrYrm0/M/Szq/C5JI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oaetw12LdmeGS/CvrRJwbxtUf6rmTQwwEDXEMj6hQfYkPhM8TocqO0g9Bihw15fn5
         gOioNqmIVln0h0h8VKiZRkS4rhZxFfViuNHrXsI2ILqHt6cPRj/7LuEW9aLT7+q7T7
         I8ETVE2/PDufWTVI1xY9MLlUj+de/g1Q0vLEHFxVlNvH/Of+DrAt5BIjBdVSxtWevS
         xMrk56ItkYCk27eq8B86FFf2BE6TyO4DLzh0ybWNyA5R4jszfuUfqFBkwQbPdV8yKs
         SW1hLu77UphA4pmHiUaRNI0t4ZT3dOzqDywaQ9KZ7JCmA5JncmL9w/holUb2psj+y9
         kaPFlVaD1t9ww==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nM4NZ-0003s7-7Q; Mon, 21 Feb 2022 09:49:09 +0100
Date:   Mon, 21 Feb 2022 09:49:09 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Dmytro Bagrii <dimich.dmb@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YhNSBTT9dTK3gffb@hovoldconsulting.com>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com>
 <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
 <YgPNK1v541ohUMtv@hovoldconsulting.com>
 <7e80c8cf-5940-c5b3-89d9-e4e7e53a380c@aiyionpri.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e80c8cf-5940-c5b3-89d9-e4e7e53a380c@aiyionpri.me>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 10, 2022 at 11:18:22AM +0100, Jan-Niklas Burfeind wrote:
> Hello everyone.
> 
> For now I can identify two different USB-IDs depending on the Jumper 
> position on the board:
> 
> 1-2 connected: idVendor=1a86, idProduct=5512
> 2-3 or none  : idVendor=1a86, idProduct=5523
> 
> I'm not sure how I'd plug it to reach the Parallel Printer Interface 
> mentioned before.
> 
> The advertised position of this Jumper is 1-2.
> Both positions are labeled with two different chinese symbols, "2-3" is 
> labeled with TTL as well.
> 
> Looking at the devices schematics I think its safe to revert my original 
> commit and I'm sorry to have caused you all this trouble.
> 
> At the time I added the device I missidentified the Jumper as voltage 
> level selector.
> 
> I had seen others using the board on youtube, with Jumper position 1-2;
> and did not understand, why my system would not recognize it at all.
> 
> 
> Sorry again and thanks for the effort

No problem. Thanks for helping us clear this up.

Johan
