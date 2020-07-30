Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47327233128
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 13:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgG3Lqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 07:46:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:55700 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgG3Lqp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 07:46:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 89419AC37;
        Thu, 30 Jul 2020 11:46:56 +0000 (UTC)
Message-ID: <1596109601.2508.4.camel@suse.de>
Subject: Re: [PATCH v3] usb: core: Solve race condition in anchor cleanup
 functions
From:   Oliver Neukum <oneukum@suse.de>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, stern@rowland.harvard.edu
Date:   Thu, 30 Jul 2020 13:46:41 +0200
In-Reply-To: <20200730082338.23709-1-eli.billauer@gmail.com>
References: <20200730082338.23709-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 30.07.2020, 11:23 +0300 schrieb
eli.billauer@gmail.com:
> From: Eli Billauer <eli.billauer@gmail.com>
> 

Hi,

> The additional do-while loop relies on the new usb_anchor_safe_empty()
> function, which is like usb_anchor_check_wakeup(), only the former takes
> the anchor's lock before checking. Both functions return true iff the
> anchor list is empty, and there is no __usb_hcd_giveback_urb() in the
> system that is in the middle of the unanchor-before-complete phase.
> The @suspend_wakeups member of struct usb_anchor is used for this purpose,
> which was introduced to solve another problem which the same race
> condition causes, in commit 6ec4147e7bdb ("usb-anchor: Delay
> usb_wait_anchor_empty_timeout wake up till completion is done").
> 

I think you can partially heed Alan's suggestion. The test takes
a lock you have just dropped. You need to drop it before you
call usb_kill_urb(), but the drop before the test is redundant.

	Regards
		Oliver

