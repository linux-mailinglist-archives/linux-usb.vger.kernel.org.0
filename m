Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448DB142AFE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 13:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgATMgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 07:36:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:59838 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgATMge (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 07:36:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8D50AAF22;
        Mon, 20 Jan 2020 12:36:33 +0000 (UTC)
Message-ID: <1579523791.17973.31.camel@suse.com>
Subject: Can't we have stricter matching for vendor specific devices?
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Mon, 20 Jan 2020 13:36:31 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

I have looked at your heroic efforts at sanity checking
and I cannot help myself wondering whether this is a winning
strategy. Shall we really specify for each device how many
endpoints it is suposed to have in the probe() method?

Could we extend the matching by a minimum and maximum number
of endpoints and masks for permissible endpoint types?

For class devices this is impossible, but the majority of
drivers are for vendor specific devices.

	Regards
		Oliver
 
