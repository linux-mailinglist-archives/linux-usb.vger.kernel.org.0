Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B1B5E544D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 22:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiIUUO6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 16:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiIUUOy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 16:14:54 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7E53F31C;
        Wed, 21 Sep 2022 13:14:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E65382B0;
        Wed, 21 Sep 2022 20:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E65382B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663791294; bh=LJoxcUrIoOXsXFf9d4eG77z611Cb3aWpfNjdJD6uwi8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BfOpPLKizat2xa6o/WnOxxedjArACoxIXkPbyCfOzLrdh0JdyJ7wHQZEa8/ei3Mq7
         e72RRlk02tJO3qdw58yUMCfUEnJ6yNaPSNb54RnugOGYlreFZVPXpQoSy40UOIru9Q
         N9xiqBe+iwfET2WfF1BOjonKB3DEQT89SZuJFqCbTgl/8jEibYwUQ2YLT+VjsDfNGI
         E0KhXDhT8TDHlKE4EV2WLDoeTWyDcFFAVvsvtV9fRkxA/wCfBZczOEgNKI/zayMB3F
         MGYJS1lo3XMmeByE0/718H4ZGsxCGXEZkUKChVv4Z9qcPafD1DvxMdtt2BYuGiO+QB
         xuDo+HfRWmCFQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: clarify Documentation/ABI text
In-Reply-To: <20220827203217.7837-1-rdunlap@infradead.org>
References: <20220827203217.7837-1-rdunlap@infradead.org>
Date:   Wed, 21 Sep 2022 14:14:53 -0600
Message-ID: <87v8pgtrgi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix grammar and improve readability of chipidea-usb2 text.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  Documentation/ABI/testing/sysfs-platform-chipidea-usb2 |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
