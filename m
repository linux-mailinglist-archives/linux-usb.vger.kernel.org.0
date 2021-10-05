Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E7E422B83
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhJEOyO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbhJEOyO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:54:14 -0400
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DFBC061749
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 07:52:23 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4HP0tD2kyhzQjb8;
        Tue,  5 Oct 2021 16:52:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robgreener.com;
        s=MBO0001; t=1633445538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=02vH2CzMrUzkaIRN7keagRPxwssZRYJkRAo1T8U7PrU=;
        b=nUliYwOCMX/B88HLL/cbhIkmGPHV2C0tnVdWJqqHknoMAJ1F8oF8Jdl4YaZMg3cR4IWcch
        Jm/YqlYgYwA0m8AyYmfAJFPKoqhso2xptEYw30Qk2EjltA93z5Rtg10mdyyjO4sClxxJvx
        KLOOXs9sdT1rAbXBjTrNkeeVSKowyqPax9s0yYQA7wLLt4cL5PB4MmbAJdoSdjGJ0gju1T
        lNu9aOeS+4DJDc5j2ko3LwNpcwgwo3bOkHkhJ386zme+iaD6oWJzBJwAzl+aSKrch5Z0gj
        fUIBtyAX6WSeOXOuFEH9Ew0X8MFCeOExvRWyphGpPkaIejNMkW9vyqdWlWggew==
Date:   Tue, 5 Oct 2021 15:52:17 +0100
From:   Robert Greener <rob@robgreener.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/13] usb: core: config: fix all checkpatch.pl warnings
Message-ID: <20211005145217.swnjcyz7ttzonpzf@shortbread>
References: <cover.1633442131.git.rob@robgreener.com>
 <YVxjRwICqt02inCM@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVxjRwICqt02inCM@kroah.com>
X-Rspamd-Queue-Id: A983726B
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 04:37:59PM +0200, Greg KH wrote:
> First off, your cc: list was corrupted and stripped everything off :(
 
Sorry, will make double check this in future...

> On Tue, Oct 05, 2021 at 02:55:31PM +0100, Robert Greener wrote:
> > This patchset fixes all checkpatch warnings in drivers/usb/core/config.c
> 
> Please do not do this for subsystems that do not explicitly ask for it.

Sure.

Thanks,
Robert
