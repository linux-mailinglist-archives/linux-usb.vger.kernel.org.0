Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E92AE04A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbfD2KKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:10:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:60412 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727428AbfD2KKO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 06:10:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 34C32AC50;
        Mon, 29 Apr 2019 10:10:13 +0000 (UTC)
Message-ID: <1556532601.20085.11.camel@suse.com>
Subject: Re: [PATCH 5/5] USB: cdc-acm: clean up throttle handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 29 Apr 2019 12:10:01 +0200
In-Reply-To: <20190425160540.10036-6-johan@kernel.org>
References: <20190425160540.10036-1-johan@kernel.org>
         <20190425160540.10036-6-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Do, 2019-04-25 at 18:05 +0200, Johan Hovold wrote:
> Clean up the throttle implementation by dropping the redundant
> throttle_req flag which was a remnant from back when USB serial had only
> a single read URB, something which was later carried over to cdc-acm.
> 
> Also convert the throttled flag to an atomic bit flag.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
Acked-by: Oliver Neukum <oneukum@suse.com>
