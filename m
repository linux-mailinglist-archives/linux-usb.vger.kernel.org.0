Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7292756BF
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 12:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWK7V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 06:59:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:45054 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWK7V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 06:59:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600858760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=1xn1j1ph23HtIa7nv0Wybl2itUAORZz/D4Ib5pP7ULE=;
        b=HQWRkFiOnhyXiGO/Kmb6tYwMphlivQAjHheQlkvX9P09HkbjucBZnbjrI8eGFCmZFAoNPK
        zsZUqka421AfC9pdkpJwv/H9NSm7Bb8RNh5ZQDek8wRVEne+x0oV5tA8iu0DoZM5LeqU45
        xyJpPrx/3J3Dkf9yOAH+AVLJaojd6R0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BBE11AC79;
        Wed, 23 Sep 2020 10:59:57 +0000 (UTC)
Message-ID: <1600858740.26851.16.camel@suse.com>
Subject: usb_control_msg_send() and usb_control_msg_recv() are highly
 problematic
From:   Oliver Neukum <oneukum@suse.com>
To:     Himadri Pandya <himadrispandya@gmail.com>,
        gregKH@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 23 Sep 2020 12:59:00 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

you probably do not want to hear this. I was out of comission
for the last week weeks and I should have looked at this more closely.

You may notice that usb_control_msg() for times immemorial has been
using GFP_NOIO internally. This is because control messages are needed
in a lot of contexts such as SCSI error handling and runtime PM
that require GFP_NOIO. IIRC at that time we found ourselves unable to
go through all those call chains, so we pulled the nuclear option
and slapped a blanket GFP_NOIO on the function.

Today I got a patch that outright deleted a memory allocation with
GFP_NOIO, so I looked into this. We are making the same mistake
we couldn't fix in the past.
I am afraid the API has to be changed to include memory flags.
And we should do this now while the damage is still within limits.
I am preparing patches.

	Regards
		Oliver

