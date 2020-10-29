Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DC929EF40
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 16:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgJ2PKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 11:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgJ2PKQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 11:10:16 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B706C0613D2
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 08:10:16 -0700 (PDT)
Date:   Thu, 29 Oct 2020 16:10:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603984214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0YUY98JakYiW/Ckd93gv7a43xghoFCUe/3JyDKC+pKU=;
        b=OE97/X4qxuL4T81gNobDGQ5bmFSStcnTuR/i/aVny/czGbEK6LTItZWY+AM9N8HIeFPT5N
        8pE5ArJlFM5Lxtv9cAh0W3tnfyi+t4Ec3R3QdmB0xx0bkFV430zB7SqOgJ+2Zs0OoGL/oc
        T3APESC+x7ThIw6tp35DTAz32LtmvESBUJ6xhUI0q5BXTpMap54O3QBXcTK3x4Kltol2H/
        U5xGcQiWRkVX++XfhnPKlTrlof1TCqs7yAZdD3JktPIifiNFykp+cC3mNp99A4B54UGqGu
        3ddVuCnTXYmzlwHkKDgLJyRiDERCbVHsC2MTa8BthECBewUAebKTAcTH8TkoDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603984214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0YUY98JakYiW/Ckd93gv7a43xghoFCUe/3JyDKC+pKU=;
        b=BdFnxBDs5DQxITnA0Kc/yrqd9Q5PS5TPDvhK7Tmc5evuTBXnvRAKUbWL1lxjyx6SHG51Go
        kA6QB4M1H44EZLDg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mike Galbraith <efault@gmx.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Message-ID: <20201029151013.zbj6npc736x3o7ux@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
 <20201029113805.tdsissnjq4acemle@linutronix.de>
 <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-29 15:08:06 [+0200], Mathias Nyman wrote:
> Sebastian, I think you might be missing the first mail in this thread. 

thank you for clearing that up.

> https://lore.kernel.org/linux-usb/20201028203124.375344-4-mathias.nyman@linux.intel.com/
> 
> Let me do a quick recap to avoid confusion here. So far we have 2 issues.
> 
> 1. Lockdep issue #1, stream debugfs entry created with local interrupts disabled and xhci->lock held
>    Cause: 673d74683627b ("usb: xhci: add debugfs support for ep with stream") in v5.10-rc1
>    Fix:  [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock held. (i.e. the mail we are replying to)
>    Comment: easily reproduced, enable lockdep and uas, mount debugfs and connect a UAS device.
>             discovered by both Hans and Mike
> .
> 2. Lockdep issue #2, adding entries to radix tree during (stream) ring expansion with interrupts disabled and xhci->lock held.
>    Cause: unknown, probably a patch since we started using radix trees for finding streams
>    Fix: unknown.
>    Comment: Discovered by Mike when testing fix for issue#1. I suspect it can be reproduced on 5.9 but is 
>    probably really hard as it involves ring expansion.
> 
> -Mathias

Sebastian
