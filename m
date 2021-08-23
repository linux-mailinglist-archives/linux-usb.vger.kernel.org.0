Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226433F5036
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 20:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhHWSPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 14:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhHWSPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 14:15:52 -0400
X-Greylist: delayed 521 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Aug 2021 11:15:09 PDT
Received: from lithium.sammserver.com (lithium.sammserver.com [IPv6:2a01:4f8:c2c:b7df::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E31CC061575
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 11:15:09 -0700 (PDT)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id CDE9B31181D6;
        Mon, 23 Aug 2021 20:06:26 +0200 (CEST)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 356C73037B;
        Mon, 23 Aug 2021 20:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1629741986; bh=H0mOyV0imRfF2Yl72hmSSjCYg68nW1tPp8BfI9bwq6s=;
        h=Date:From:To:Cc:Subject:From;
        b=ub+WIKW7zZUntMUje/yZ6BjDc7xnyE4y12IehlZEwNSZAaoHCo0fnnQAqTMtzTzrT
         LmLoDwAWCbU69frDbi5CGylUd75M5Dvay7eZOJiwqgKIa2vvtxaDxQ6nOul2sJqnlF
         d6eUJLPX2qzMyDIBCUrdxNs8jGJ5NZGgCR6jFuj8=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 14D8B1421DD3; Mon, 23 Aug 2021 20:06:26 +0200 (CEST)
Date:   Mon, 23 Aug 2021 20:06:26 +0200
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com
Subject: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on sammserver.tu
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

The driver times out talking to the PPM (the message pops up 60 seconds
after loading the module, the timeout in ucsi_acpi_sync_write).
The command which times out is the first one after resetting the PPM in
ucsi_init, enabling basic notifications.

The laptop in question is an ASUS UM325U, with the AMD Ryzen 5700U SoC.

The ACPI description of the USBC000 device looks reasonable to my eyes,
but I am not an expert. The _DSM Method copies the UCSI OpRegion to (or
from) EC memory. I can provide a dump if needed.

I am looking for guidance on how to proceed, I am not too familiar with
the UCSI other than peeking at the spec for a short while.

Looking the error up online leads to various discussions usually ending
with installing an nvidia driver, however mine does not have any
dedicated GPU.

Regards,
Samuel
