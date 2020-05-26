Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BEE1E1D9D
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 10:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgEZIrh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 04:47:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:42186 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgEZIrg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 04:47:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7E4E6AF36;
        Tue, 26 May 2020 08:47:38 +0000 (UTC)
Message-ID: <1590482853.2838.26.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 26 May 2020 10:47:33 +0200
In-Reply-To: <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 25.05.2020, 16:49 +0000 schrieb Joakim Tjernlund:

> To be clear, I can pull the cable and put it back and there are no garbage chars.
> There is also this error:
> [Wed May 20 14:03:25 2020] cdc_acm 1-6.3:1.1: acm_ctrl_irq - usb_submit_urb failed: -19
> [Wed May 20 14:03:25 2020] usb 1-6-port2: attempt power cycle
> [Wed May 20 14:03:26 2020] usb 1-6.3: USB disconnect, device number 86
> [Wed May 20 14:03:26 2020] cdc_acm 1-6.3:1.1: failed to set dtr/rts
> 
> Should not this auto reenable emulate reattaching the USB cable?

Hi,

yes it should. You find the garage characters after the EMI event. How
sure are you that they arrive after the event and not during the event?

	Regards
		Oliver

