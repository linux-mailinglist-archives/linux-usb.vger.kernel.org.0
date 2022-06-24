Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96427559C78
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 16:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiFXOim (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 10:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiFXOib (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 10:38:31 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0427F2DEC
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 07:38:30 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B27B31F92E;
        Fri, 24 Jun 2022 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1656081508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zEJ+bnOFO9MEmpT8ZqhKqm5rumsDLYR8YKX7swVfOs4=;
        b=xv9t/oLRk5tnSrz2O42aSRHfNUK4g9fat/ZUoLn3lBtJfynHx2JkBpVsC+w0uQZ4kV1TeO
        0oDyowCstVscDal3gL9Xc+04Aq0pEUS5z7DSqJQaOocF3ZGWK8raJ7qSLIwRn5rpUVA8Fi
        428e98R/ZS5jaKFq8WrrP99DBwdxT6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1656081508;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zEJ+bnOFO9MEmpT8ZqhKqm5rumsDLYR8YKX7swVfOs4=;
        b=+J0rfnlMgkfj19e8FcnEzVZWLmyDGusZB6hCHcgoGiqNv/EWTYV6nQnXLGANgdrPpYHpDr
        QSILXNy8z/ELSnAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E8F913ACA;
        Fri, 24 Jun 2022 14:38:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id rg4zHWTMtWKxJgAAMHmgww
        (envelope-from <jroedel@suse.de>); Fri, 24 Jun 2022 14:38:28 +0000
Date:   Fri, 24 Jun 2022 16:38:27 +0200
From:   =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Jon Grimm <jon.grimm@amd.com>,
        "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: DMA Faults with XHCI driver
Message-ID: <YrXMY0Nd0Yn6XDSN@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

here is a report about something strange happening on my system after a
recent IOMMU change. I am starting to see this message at boot:

	xhci_hcd 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xff00ffffffefe000 flags=0x0000]

It means that the XHCI device tried a DMA access at address
0xff00ffffffefe000, which was not mapped in the IOMMU page table.

Devices attached to that XHCI controller will not work after that
message.

There is a related change in the IOMMU code which uncovered this, the
change basically lets the IOMMU dma-allocator not allocate below 4GB by
default, but use the whole space covered by the DMA mask.

To better track this down I limited the DMA-space to 48 bits, and the
message still shows up.

I think this might be a problem in the XHCI driver, e.g. it might mangle
an allocated DMA address somehow if it is bigger than 32 bit.

The device behind 0000:02:00.0 is a

	02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 43d0 (rev 01)

Please let me know what I can do to help tracking this down.

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

