Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B731F1C360A
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 11:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbgEDJsG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 05:48:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:33172 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728349AbgEDJsF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 May 2020 05:48:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 66606AE53;
        Mon,  4 May 2020 09:48:05 +0000 (UTC)
Message-ID: <1588585655.13662.5.camel@suse.com>
Subject: Re: [PATCH] xhci: Prevent runtime suspend all the time with
 XHCI_RESET_ON_RESUME quirk
From:   Oliver Neukum <oneukum@suse.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        mathias.nyman@intel.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 04 May 2020 11:47:35 +0200
In-Reply-To: <20200504091952.15820-1-kai.heng.feng@canonical.com>
References: <20200504091952.15820-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 04.05.2020, 17:19 +0800 schrieb Kai-Heng Feng:
> Etron EJ168 USB 3.0 Host Controller stops working after S3, if it was
> runtime suspended previously:
> [  370.080359] pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)

Apparently this controller has issues with D3cold

> [  370.080477] xhci_hcd 0000:04:00.0: can't change power state from D3cold to D0 (config space inaccessible)
> [  370.080532] pcieport 0000:00:1c.0: DPC: containment event, status:0x1f05 source:0x0200
> [  370.080533] pcieport 0000:00:1c.0: DPC: ERR_FATAL detected
> [  370.080536] xhci_hcd 0000:04:00.0: can't change power state from D3hot to D0 (config space inaccessible)
> [  370.080552] xhci_hcd 0000:04:00.0: AER: can't recover (no error_detected callback)
> [  370.080566] usb usb3: root hub lost power or was reset
> [  370.080566] usb usb4: root hub lost power or was reset
> [  370.080572] xhci_hcd 0000:04:00.0: Host halt failed, -19
> [  370.080574] xhci_hcd 0000:04:00.0: Host not accessible, reset failed.
> [  370.080575] xhci_hcd 0000:04:00.0: PCI post-resume error -19!
> [  370.080586] xhci_hcd 0000:04:00.0: HC died; cleaning up
> 
> This can be fixed by not runtime suspend the controller at all.
> 
> So instead of conditionally runtime suspend the controller, always
> prevent runtime suspend with XHCI_RESET_ON_RESUME quirk.

What does that do to other controllers that can do runtime suspend
under the current scheme?

	Regards
		Oliver

