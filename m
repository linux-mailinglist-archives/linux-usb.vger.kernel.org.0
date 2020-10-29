Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0332D29E793
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgJ2Jmj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgJ2Jmi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 05:42:38 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA15C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 02:42:38 -0700 (PDT)
Date:   Thu, 29 Oct 2020 10:42:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603964557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IRxZSpnEjNX3Jl1R1yOz0upioz6uSRlnoxLp54VYyLk=;
        b=o1Y3NOisIyFw8ybkZ/3KH3SSL4H1cqUkeyVX/ZNL6+6dK+78SeLs8X3hd2/eudYn4hE953
        GnKBKoosbGJyVfXGjKbmpBPLxboNyLXo5JC4c/m9i+p/oGOs2NBXRcmSyHY6FAxMeqC0IK
        IZAsh4TIsW+0v058NxKCsBmKjx9NC8OA04WjXyvbLjMBqlDlo5haNrO4HQNuxAp72u24Ax
        D2GpQHdmj36W7WS3e1cThHAGwUSfIc90ZXIIGO4OpdCfOgV8qIGeyMJ1R64uSoh2/hRnyG
        EDIkSoMsW6JnTDpWms/5rTYs51PnkMJyN58+EcQfhrtkEkN4rufKb/ai8jUx9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603964557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IRxZSpnEjNX3Jl1R1yOz0upioz6uSRlnoxLp54VYyLk=;
        b=ZkSsdSw4qKufE2za8K7SmvxNdngu2r4bAr9lY5DSqqwPBK8bkDxrhOD66qOTy7mfSYdstU
        8+bmFNROtny+5tAA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mike Galbraith <efault@gmx.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Message-ID: <20201029094236.fkgzl5mbdp672lbe@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-29 11:41:41 [+0200], Mathias Nyman wrote:
> This looks like a separate locking issue related to stream ring buffer expansion and radix tree usage.
> This has probably been there for a while. Can you check if this can be reproduced with 5.9 kernel?
> 
> I don't have a quick fix for this. I need to look into it more.
> Anyway, this shouldn't prevent PATCH 3/3 from fixing the streams debugfs issue introduced in 5.10-rc1

let me look into this.

> -Mathias

Sebastian
