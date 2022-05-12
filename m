Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A4D52491B
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 11:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350606AbiELJgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 05:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352052AbiELJgP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 05:36:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998261D32F;
        Thu, 12 May 2022 02:36:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F359619AF;
        Thu, 12 May 2022 09:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D092C385B8;
        Thu, 12 May 2022 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652348172;
        bh=PXLFZmD3qd0lC6S6BdVzpjrnFRhZPctHQdOWta0ELs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CvzdwBG1Bzk+F0cfcla01jCJ8x1FKfS1iB0JLuKr/MoeZcoNZsn006fduSD/YZBjS
         Nm1BOG/JjC1aF5FzZ+7Kc/736fxtxumduujtTxFbNUdPNircmo+HgSOv/J/tcbDHFb
         PBHiBJByTk2asCQvnAL+8RLl+w/ylE2Mi5ALOp3c=
Date:   Thu, 12 May 2022 11:36:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: fix a NULL vs IS_ERR() check in
 probe
Message-ID: <YnzVCTHJm9iT4eRk@kroah.com>
References: <YnjaDBXLmwouCB3M@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnjaDBXLmwouCB3M@kili>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 12:08:28PM +0300, Dan Carpenter wrote:
> The devm_memremap() function never returns NULL.  It returns error
> pointers.
> 
> Fixes: cdc3d2abf438 ("usb: typec: ucsi: acpi: Map the mailbox with memremap()")

As this is in Rafael's tree, he needs to take it, I can't:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
