Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EFD72570D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 10:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbjFGIM5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 04:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbjFGIM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 04:12:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B82895
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 01:12:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D570B1FDAB;
        Wed,  7 Jun 2023 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686125574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DlBabtXM+d+LgULuDWP6FrF25A/X+GVgM8BnaavP2po=;
        b=FtMECo46sOKvOehxiOUwwDm5fR2G3GUlZKQ/ewCNVtroFrJEJihKNi0SiszJjYMC3SGibT
        cajmsTM9EiintWH9LC/fxhZE8b+MGcyB54oRrryVZkGUbmlEi4wMvkMNnPpBASsxzmBuuv
        p6mOV9R7/uaTcjKtrppitn4UijJqpxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686125574;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DlBabtXM+d+LgULuDWP6FrF25A/X+GVgM8BnaavP2po=;
        b=WKW91wV7alBA750spT1i03o850aGYSYT95St6aO8QR16xpWHzX07LOhI3o+PP4e28U7ad3
        vOnp5Qlj7Rn8HRBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B61511346D;
        Wed,  7 Jun 2023 08:12:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id A1wKKwY8gGTwNgAAMHmgww
        (envelope-from <ddiss@suse.de>); Wed, 07 Jun 2023 08:12:54 +0000
Date:   Wed, 7 Jun 2023 10:15:03 +0200
From:   David Disseldorp <ddiss@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: f_mass_storage: remove unnecessary open
 check
Message-ID: <20230607101503.1e5a6ef6@echidna.fritz.box>
In-Reply-To: <cc56d8bf-a634-46bb-b874-5847bd4b3bf3@rowland.harvard.edu>
References: <20230606221518.7054-1-ddiss@suse.de>
        <cc56d8bf-a634-46bb-b874-5847bd4b3bf3@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the feedback, Alan...

On Tue, 6 Jun 2023 18:33:22 -0400, Alan Stern wrote:

> On Wed, Jun 07, 2023 at 12:15:18AM +0200, David Disseldorp wrote:
> > fsg_lun_is_open() will always and only be true after a successful
> > fsg_lun_open() call, so drop the unnecessary conditional.  
> 
> I don't follow the reasoning.  The relevant code is:
> 
> 	if (cfg->filename) {
> 		rc = fsg_lun_open(lun, cfg->filename);
> 		if (rc)
> 			goto error_lun;
> 	}
> 	...
> 	if (fsg_lun_is_open(lun)) {
> 
> So at this point, the fsg_lun_is_open() condition is true iff 
> cfg->filename was set upon entry.  What makes this test unnecessary?

The fsg_lun_is_open() test is unnecessary as it will always be true
following a successful fsg_lun_open() call and will always be false if
cfg->filename is unset. This means that the logic from the
fsg_lun_is_open() conditional block can be appended directly after the
error_lun goto. pathbuf allocation ('...' above) is only needed for
the open case, so can also be wrapped into the conditional block.

I'd be happy to update the commit message if the explanation above
makes things clearer. I should probably also mention that I've tested
this using dummy-hcd.

Cheers, David
