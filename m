Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D61B330F97
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 14:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCHNjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 08:39:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:40208 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230507AbhCHNjU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615210759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TRkjdgJ7llzZwoVUSkoy3PGH1lcCzaovLNH3BYB2PJ8=;
        b=gU5gmiOHwp03WuKDfFuE508Bl+37Z7is3c6leGX0wWN4/EsKfLkwHjXBB1N/IOdW5IUwC9
        2VVX/mrxUU0saZK9BlK3o1nCdpnff5m0RR5LymJM6SbMeUU3i86zMFfRiuar5Vub30XPdL
        Q01lpUk81pOPD/JDsv3HIu1wYLRthQk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DB9D9AD74;
        Mon,  8 Mar 2021 13:39:18 +0000 (UTC)
Message-ID: <6f6b5007041d8b3e907ca4ca3bae242fac55e9b7.camel@suse.com>
Subject: Re: A question about UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     Aaron Dewes <aaron.dewes@web.de>, linux-usb@vger.kernel.org
Date:   Mon, 08 Mar 2021 14:39:18 +0100
In-Reply-To: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 06.03.2021, 17:34 +0100 schrieb Aaron Dewes:

> I was wondering if a check like this could be added to the kernel, so
> every time uas_eh_abort_handler gets logged, which AFAIK only happens if
> UAS has issues, a counter could be increased, so that, if it happens to
> often, UAS gets disabled for that drive.
> 
> Are there any reasons not do do this because false positives could
> happen? If yes, please let me know.

Hi,

this is a normal part of SCSI error handling. We cannot just switch off
a driver for handling errors. That said, you are free to collect
statistics for SCSI devices and let user space do something with it,
but this does not belong into the kernel.

	Regards
		Oliver


