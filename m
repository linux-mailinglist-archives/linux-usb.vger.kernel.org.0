Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7AAA179218
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 15:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgCDONK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 09:13:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:53852 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729286AbgCDONK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 09:13:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D1DB2B2AC;
        Wed,  4 Mar 2020 14:13:08 +0000 (UTC)
Message-ID: <1583331173.12738.26.camel@suse.com>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
From:   Oliver Neukum <oneukum@suse.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Jonas Karlsson <jonas.karlsson@actia.se>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 04 Mar 2020 15:12:53 +0100
In-Reply-To: <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
         <20200303163945.GB652754@kroah.com>
         <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
         <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 04.03.2020, 14:11 +0200 schrieb Mathias Nyman:
> On 3.3.2020 22.08, Jonas Karlsson wrote:

> 
> I recently got a report about a bit similar issue on a 4.4 stable kernel, so this
> might not be xhci-cdns specific.
> 
> That case involved autosuspend of the cdc-acm, and there was only a short burst of
> transaction erros and resubmitted URBs even if the device was supposed to be suspended.
> It looks like cdc_acm autosuspended even if it had URBs pending.

That must not happen. Do you have details?

> I'm guessing that in that case the transfer ring restarted even if link was already "suspeded",
> causing transaction errors. Ring could be restarted if URBs were resubmitted
> by the class driver when usb core suspends all interfaces, flushing all pending URBs which
> calls the URB completion handler.

How should a class driver do that? It gets -EPROTO and that's it,

	Regards
		Oliver

