Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A128CD60B9
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 12:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731587AbfJNK5D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 06:57:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:43684 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731400AbfJNK5D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 06:57:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AA960BAE0;
        Mon, 14 Oct 2019 10:57:01 +0000 (UTC)
Message-ID: <1571050609.19529.11.camel@suse.com>
Subject: Re: Lockup on USB and block devices
From:   Oliver Neukum <oneukum@suse.com>
To:     Steven Rostedt <rostedt@goodmis.org>, linux-block@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Mon, 14 Oct 2019 12:56:49 +0200
In-Reply-To: <20191001134430.1f9c9c75@gandalf.local.home>
References: <20191001134430.1f9c9c75@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 01.10.2019, 13:44 -0400 schrieb Steven Rostedt:
> Not sure who to blame, but my server locked up when upgraded (accessing
> volume group information), and echoing in "w" into sysrq-trigger showed
> a bit of information.
> 
> First, looking at my dmesg I see that my usb-storage is hung up, for
> whatever reason. Thus, this could be the source of all issues.

The reset of the device is hung. You may be hanging on dev_mutex.
Is this repeatable?

	Regards
		Oliver

