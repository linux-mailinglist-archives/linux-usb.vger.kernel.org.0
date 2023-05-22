Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A499F70C099
	for <lists+linux-usb@lfdr.de>; Mon, 22 May 2023 16:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbjEVOBa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 10:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbjEVOBM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 10:01:12 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id BA61A2D78
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 06:58:47 -0700 (PDT)
Received: (qmail 135521 invoked by uid 1000); 22 May 2023 09:57:36 -0400
Date:   Mon, 22 May 2023 09:57:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Niklas Schnelle <schnelle@linux.ibm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 37/44] usb: uhci: handle HAS_IOPORT dependencies
Message-ID: <aa12b46b-22da-41c5-9748-0eea801dd423@rowland.harvard.edu>
References: <20230522105049.1467313-1-schnelle@linux.ibm.com>
 <20230522105049.1467313-38-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522105049.1467313-38-schnelle@linux.ibm.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 22, 2023 at 12:50:42PM +0200, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to guard sections of code calling them
> as alternative access methods with CONFIG_HAS_IOPORT checks. For
> uhci-hcd there are a lot of I/O port uses that do have MMIO alternatives
> all selected by uhci_has_pci_registers() so this can be handled by
> UHCI_IN/OUT macros and making uhci_has_pci_registers() constant 0 if
> CONFIG_HAS_IOPORT is unset.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
