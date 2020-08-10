Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B2A24080A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHJPAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 11:00:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:38756 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbgHJPAb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 11:00:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 974A1AE71;
        Mon, 10 Aug 2020 15:00:50 +0000 (UTC)
Message-ID: <1597070349.2515.6.camel@suse.com>
Subject: Re: [RFC]mooring API
From:   Oliver Neukum <oneukum@suse.com>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Date:   Mon, 10 Aug 2020 16:39:09 +0200
In-Reply-To: <5F2C2C74.8000104@gmail.com>
References: <1596722827.2488.8.camel@suse.com> <5F2C2C74.8000104@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 06.08.2020, 19:14 +0300 schrieb Eli Billauer:
> Hello,
> 
> I feel I got more credit that I deserve. Hans de Goede discovered this 
> issue and solved a specific problem that was related to the race back in 
> 6ec4147. I was just lucky (or unlucky) enough to get a kernel panic on 
> my machine due to another problem, for which I submitted a patch.
> 
> To me the anchor API is great. If there is unclearances about its API, I 
> suppose docs would help. The fact that the URB is unanchored prior to 
> calling the completer is intuitive, so there's a clear benefit in that.

But is it necessary? DO you ever move URBs between anchors?

> This requires some ungraceful code where almost nobody's looking, but if 
> that makes the common programmer's life easier, I think it's a good deal.

It would be, if the deal is necessary. In hindsight it still looks
to me like completion should unanchor an URB.

	Regards
		Oliver

