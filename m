Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E4952A783
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350746AbiEQQAD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 12:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350801AbiEQQAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 12:00:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B9F50B33
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 08:59:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BF3F61230
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 15:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12B7C385B8;
        Tue, 17 May 2022 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652803191;
        bh=/bzljHkqaTY2g0JCQTZ6N8gzEB/maTZKWcnJOGKmsCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDOxogjsuT1iuEhvBkmxoe83pLyzFX/r6guVy8JZ63UdwJ6MiVXnML5ZISRkZiBv5
         3civAPjqt7Nkjn6VQr1lIG5LCWKTpHjn8JAa0LrPpBgghFb+lO+YCNrmddL2TPDKcL
         i8kSVSQRiwOqS7j8E5BSbQU3csQHGcp2SJiT1RUf1ixOTI1+4m4KrHjpcd0j7byJHL
         pSU8IpPI3wHtViMyq4sA+B7wjpTprgKUdFXxgxKuOLie7N+9c2qMp128k2F/cUq5fH
         LLZlYNnJB0weNqVG9RyOazvfnaslGj91SnXoAwsEs7eDWujqfPPKaj5Y6R0CBUMXkI
         JPF8rltxE7cPA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nqzbz-0003Eb-Cc; Tue, 17 May 2022 17:59:52 +0200
Date:   Tue, 17 May 2022 17:59:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Gary van der Merwe <garyvdm@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug report: pl2303 unknown device type -
Message-ID: <YoPGdxtPqCsAiM8M@hovoldconsulting.com>
References: <CAJixRzqf4a9-ZKZDgWxicc_BpfdZVE9qqGmkiO7xEstOXUbGvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJixRzqf4a9-ZKZDgWxicc_BpfdZVE9qqGmkiO7xEstOXUbGvQ@mail.gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 16, 2022 at 07:48:51PM +0200, Gary van der Merwe wrote:

> We have a Cashino PTP-lil/BT24 Slip printer[1]. When configured in
> serial mode, it uses a pl2303 chip.  This has not detected by the
> kernel since 5.13.  The bcdUSB is 1.01, and the driver was changed to
> only allow 1.10 and 2.00 [2]  Please consider adding 1.01 as an
> allowed pl2303 bcdUSB.

Heh. USB 1.01? I'll add a workaround to continue treating this as 1.10
(and an HX device).

Can I credit you using name and email in the commit message for
reporting this?

Johan
