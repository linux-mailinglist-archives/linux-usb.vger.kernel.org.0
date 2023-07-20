Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E90D75ADF6
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 14:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjGTMLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 08:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGTMLv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 08:11:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628B62118
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 05:11:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFEA9618F6
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4969EC433C8;
        Thu, 20 Jul 2023 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689855108;
        bh=g02vkIIuKt6hbkMoYTZr4nAUsRufpKjVnzaLQxfPNdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LLgWm3Lte8M0sHMPgmawW6xb02PDMQmFPl/yTBG67MrAMcaiskZS8uVm/jq6nkFur
         DUG54NIL0Mw5sB+zbJGHpivXCmGucZFsE2Qju+8t/lQr4RWjz+S6L1RPnPCcwnO3Ii
         7h3gKHPZVva8WpiLN/LgjKsci6Vma41rYy8J5Cy09kCS/wQbOkup7UmuMa6DozNMJo
         uY/hHzW1gVbtOSQnaXsdYIPmpdMq9SLyPElwb1TEaDt2xylYJ2kBkKpzwS3XeEInSH
         Thb/gsZRPpcbVttek9VlIVDWQAdnKBzFuTuNh9XmSbwkEgS6DwWHflBJGftimUoisM
         8nd7kceuXJb+Q==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMSVf-0002Dr-2y;
        Thu, 20 Jul 2023 14:11:56 +0200
Date:   Thu, 20 Jul 2023 14:11:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple-serial: spell out the ordering
Message-ID: <ZLkki7QUu0clwy_7@hovoldconsulting.com>
References: <20230720114406.14587-1-oneukum@suse.com>
 <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 20, 2023 at 02:01:37PM +0200, Johan Hovold wrote:
> On Thu, Jul 20, 2023 at 01:44:06PM +0200, Oliver Neukum wrote:

> No, this is not correct. The tables are sorted alphabetically based on
> the symbol names, but the entries in each table is sorted by VID/PID as
> usual.
> 
> The table ordering was not there from the start, but I just moved the
> offending tables here:
> 
> 	https://lore.kernel.org/lkml/20230720080049.14032-1-johan@kernel.org/
> 
> Guess I should update the sloppy terminology in that commit message,
> though.

This should hopefully be clear enough:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=a1ff1edb9251e1151fb78eb9b226d5e4bc6c2810

Johan
