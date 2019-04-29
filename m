Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEA9E83F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 18:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbfD2Q7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 12:59:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:53826 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728681AbfD2Q7H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 12:59:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3D677ABC7;
        Mon, 29 Apr 2019 16:59:06 +0000 (UTC)
Message-ID: <1556557130.20085.24.camel@suse.com>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 29 Apr 2019 18:58:50 +0200
In-Reply-To: <Pine.LNX.4.44L0.1904291207300.1632-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1904291207300.1632-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mo, 2019-04-29 at 12:08 -0400, Alan Stern wrote:
> On Mon, 29 Apr 2019, Oliver Neukum wrote:
> 
> > On Mo, 2019-04-29 at 15:06 +0000, David Laight wrote:
> 
> > But the statement the old comment made are no longer correct.
> 
> Perhaps David would be satisfied if the comment were changed to say 
> that _some_ USB controller drivers have this unusual alignment 
> requirement.

It would seem to me that every controller that does not do
scatter/gather has this requirement. In other words, this is
the true requirement of USB. It does not come from the
controller. It comes from the protocol's need to not
send a short package.

The second, old, comment is about controllers.

	Regards
		Oliver

