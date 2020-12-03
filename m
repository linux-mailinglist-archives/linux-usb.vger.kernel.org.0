Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983522CDAF8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 17:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389331AbgLCQQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 11:16:44 -0500
Received: from netrider.rowland.org ([192.131.102.5]:50793 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2389329AbgLCQQo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 11:16:44 -0500
Received: (qmail 1100270 invoked by uid 1000); 3 Dec 2020 11:16:02 -0500
Date:   Thu, 3 Dec 2020 11:16:02 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>
Cc:     'Oliver Neukum' <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS
Message-ID: <20201203161602.GA1098189@rowland.harvard.edu>
References: <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
 <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
 <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
 <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
 <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
 <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
 <f5b4e5fccec5521059c78d4f4345c339dce707d5.camel@suse.com>
 <000f01d6c983$22199910$664ccb30$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000f01d6c983$22199910$664ccb30$@perdrix.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 03, 2020 at 02:46:47PM -0000, David C. Partridge wrote:
> > upon further reading, could you repeat the test with an additional SINGLE_LUN quirk?
> 
> Happy to do that if you can confirm what the blacklist-uas.conf should look like to achieve that?
> 
> Should it read: options usb-storage quirks=059f:105f:ks
> 
> David
> -----Original Message-----
> From: Oliver Neukum [mailto:oneukum@suse.com] 
> Sent: 03 December 2020 14:07
> To: David C. Partridge; linux-usb@vger.kernel.org
> Subject: Re: Issues with LaCie USB3 drive and UAS
> 
> Am Donnerstag, den 03.12.2020, 02:11 +0000 schrieb David C. Partridge:
> > Now with uas.ko	and usb-storage.ko 
> 
> Hi,
> 
> upon further reading, could you repeat the test with an additional
> SINGLE_LUN quirk?
> 
> 	Regards
> 		Oliver

By the way, we do have an 'f' quirk for US_FL_NO_REPORT_OPCODES.  You 
could try that one rather than 's'.

Alan Stern
