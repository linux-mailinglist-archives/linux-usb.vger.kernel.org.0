Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67B8274119
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVLmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:42:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:51616 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgIVLlj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:41:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600774883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/W5u4DwssKiLpxMOfFZcGb1OtVlE2FL5pG1Dh/ZjlXM=;
        b=OW856cMNn/Xejro5OTGBtRaNqybP5vs/oe9ZlLwi/yGXH9dXNL9PErtfCyAel2boyk/LoF
        /5/O3SWBif/1gsTYnL5fsGwM42S/NQ5sGZfWRa9FAaQxhUFcY5x5I9q08ahTA8/VFpZL2u
        becMnN3g2J2XMLd0LsW132bsiOVTww4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 853CFAF1F;
        Tue, 22 Sep 2020 11:42:00 +0000 (UTC)
Message-ID: <1600774866.6926.18.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Tue, 22 Sep 2020 13:41:06 +0200
In-Reply-To: <20200922105446.GC24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
         <1600697816.2424.102.camel@suse.com> <20200921142806.GX24441@localhost>
         <1600700674.2424.105.camel@suse.com> <20200921151605.GY24441@localhost>
         <1600708657.2942.2.camel@suse.com> <20200922070506.GZ24441@localhost>
         <1600771242.6926.16.camel@suse.com> <20200922105446.GC24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 22.09.2020, 12:54 +0200 schrieb Johan Hovold:

> Heh. Did you actually read the commit message?
> 
> 	"Add NO_DATA_INTERFACE quirk to tell the driver that "control"
> 	 and "data" interfaces are not separated for this device, which
> 	 prevents dereferencing a null pointer in the device probe
> 	 code."
> 
> Convinced yet?

This patch does not fully match its description. Very well. Proceed.
Could you resubmit and I'll ack?

	Regards
		Oliver

