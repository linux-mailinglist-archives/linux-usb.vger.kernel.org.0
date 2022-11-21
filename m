Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2D8632EE3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 22:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiKUVeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 16:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiKUVdy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 16:33:54 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A962EF5C;
        Mon, 21 Nov 2022 13:33:53 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E45565CC;
        Mon, 21 Nov 2022 21:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E45565CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066433; bh=ubC8lLc4vIlF1RDveQOCoM2b/dIY3+5By8hL1AWNshM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=f2polWjiysByCJf45XTIs6+R7jlp0IbGowMac+GkjCYwoVgAOUAGkQLOy3jKuyEUw
         6puLKE3ywJDcFhU2NaHXeoK9+2nooi105RwhL22GUfWb/zSJJaYePAKNY6V6HEcnNX
         l+WIMKFGhgxIvOPuk2ngXIGIdMDy1rKEXv8AKUTiuG+AGwxIa4pUNobHPPm46zo2+q
         IWUk2ohHSk9q+tLLPBihxHg4NdWgdCfsmx81vG+hFOeRcraGnSuHMJ9UUYZ+bPThSn
         purECy9YjKbge8qGoWhtIHs9mjHkdypcLpSDd5c6yP+iok4kukF+DbP0ErMyye2IO4
         p8K85XrkZFK0A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: USB: correct possessive "its" usage
In-Reply-To: <20221118231422.14076-1-rdunlap@infradead.org>
References: <20221118231422.14076-1-rdunlap@infradead.org>
Date:   Mon, 21 Nov 2022 14:33:52 -0700
Message-ID: <87sfic801r.fsf@meer.lwn.net>
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

> Correct uses of "it's" to possessive "its" or "its" to "it's" as needed.
> Correct associated grammar in one location.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
> v2: use "his" instead of "its" in CREDITS (Alan)
>     Also correct one use of "its" to "it's".
>
>  Documentation/usb/CREDITS          |    6 +++---
>  Documentation/usb/functionfs.rst   |    2 +-
>  Documentation/usb/gadget_multi.rst |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
