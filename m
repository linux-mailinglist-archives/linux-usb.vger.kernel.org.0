Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01F4565A72
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jul 2022 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbiGDPyw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jul 2022 11:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiGDPyv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jul 2022 11:54:51 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4097C9FD4
        for <linux-usb@vger.kernel.org>; Mon,  4 Jul 2022 08:54:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 000CF22602;
        Mon,  4 Jul 2022 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1656950089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oouX+wWA2m9btGP9XKS/GAKwHVqfBLk2MWQfFuvG0o=;
        b=l0nmfluRNEHcbMd1Fym25gxuKAqtatE66TaR6y45laOz4ICXssAtysCH+jwdOvbl9atQqA
        xCbkTOG9BgStldi6QCXDDkOq6TEHKmv91GzIRoRgyoSiloRVgIcdKrWJrmeiuR62iVmj4H
        yWYUHc333Tyy7DZH+0BpqQdL06f1odw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1656950089;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oouX+wWA2m9btGP9XKS/GAKwHVqfBLk2MWQfFuvG0o=;
        b=yez1IjpDLdJfo0k8f/gTp1Whv+dgZq7OBvYDoFe9/33o4f0LPaMRbNcFroOBwSMCzTI/5C
        urMdYsfsrY7cdzCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B87101342C;
        Mon,  4 Jul 2022 15:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id nI1kK0gNw2JVAgAAMHmgww
        (envelope-from <jroedel@suse.de>); Mon, 04 Jul 2022 15:54:48 +0000
Date:   Mon, 4 Jul 2022 17:54:47 +0200
From:   =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Grimm <jon.grimm@amd.com>,
        "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: Re: DMA Faults with XHCI driver
Message-ID: <YsMNR9KtZVPMNC9Y@suse.de>
References: <YrXMY0Nd0Yn6XDSN@suse.de>
 <8917c751-76dc-98d3-83ac-652aa2249b7d@linux.intel.com>
 <YrqzGpuLdNrbfHL5@suse.de>
 <cdd5b0b2-cfcd-3c25-6b77-2d20ebfc97c5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdd5b0b2-cfcd-3c25-6b77-2d20ebfc97c5@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

On Wed, Jun 29, 2022 at 05:39:49PM +0300, Mathias Nyman wrote:
> Anyway, maybe flushing the CRCR register by reading it back after writing it would help:

Thanks for your help and sorry for the delay. I tried the patch but it
didn't help, the io fault still appears and the device does not work.

I added some more debugging, actually printing the cmd_ring address read
by the calls you patch adds. Unfortunately they all returned 0, looks
like the register is write-only RAZ on this hardware.

Is it possible that the device actually can't handle a 64 bit DMA mask
and needs a smaller one, say 40 bits?

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

