Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49F029D5E8
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 23:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbgJ1WJm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730337AbgJ1WJ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 18:09:26 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C78C0613CF
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 15:09:26 -0700 (PDT)
Date:   Wed, 28 Oct 2020 12:31:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603884672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=29w1VcV+XX4a2Sa1gNEyayZBDle+3sfepqBBkABCyTU=;
        b=qSZ/qh9mxRBXPZYTWUTlkw/g4nUnV0bVLZXF7OUGy0+5T/ZP/n03m/2sfS/wJEn1YnMmk0
        UcK5VYo2oCgb1VTujHHQT1fs8wunv+H6LDaLavyohxddS6fq/zNXRmXmbWFlM8nT0AH/VJ
        ekX/zlZqb1j7xBlHiNwm30s2vJ26WKm+EO12uXoiL6602bmRGcpbvBBUzWmEcWRFfpYR7v
        h4Ewtjch9EefpagW4WvMRToOVkvzjH4sgYSMtaEPO35jRLkIjP3vgBvLhwbonPL90BF1Oz
        VI3RAQrjuibGw0vZWCVR5iTpwBEwv74QojZJ/zMpq+iqPCTIkkaHvkOcP2mwSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603884672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=29w1VcV+XX4a2Sa1gNEyayZBDle+3sfepqBBkABCyTU=;
        b=wYWFkwls2nfWMc6NM8FGZcs8oQuUVhjkqjLd2XQcwMlPzGTERKfCk+P/MWoe0mxs3WzAsl
        s+QDZM6SJ6KwaKCQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        "Ahmed S . Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH] USB: host: isp1362: delete isp1362_show_regs()
Message-ID: <20201028113111.yhaz56wiljos6f6l@linutronix.de>
References: <20201028113107.2007742-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201028113107.2007742-1-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-28 12:31:07 [+0100], Greg Kroah-Hartman wrote:
> No one is calling this function, so it's pointless to keep around as it
> is triggering automated scanning tools to try to fix up the problems
> with it using in_interrupt().
> 
> So delete the thing.
> 
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Reported-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thank you.

Sebastian
