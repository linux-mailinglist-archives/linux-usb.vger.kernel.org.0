Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48ACF2AB48C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 11:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgKIKNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 05:13:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:45740 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKIKNm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 05:13:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1604916822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8e3bxkXwQ0VIQETueqJwv7iFSBsZBn43KllGQCC1g7M=;
        b=rKb3G1pKBFeqIZBsbhpsI+0zsEXGR08tZFXkFuc5Oq80+uDQ5S/mbcSakmRCg7DCQLNCCc
        4mF3rvgg6qVE9NP2UaasVR3VDxb8IPnc/I6SI263h/lB6KEcxjwu7IT4rIivMC7FQRi9vS
        HsARqdI36Mvz/QQv57BQFxE1dqzXSIo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E33B5ABCC;
        Mon,  9 Nov 2020 10:13:41 +0000 (UTC)
Message-ID: <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Mon, 09 Nov 2020 11:13:34 +0100
In-Reply-To: <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
         <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
         <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 09.11.2020, 09:51 +0000 schrieb David C. Partridge:
> I'm sure you are right in your diagnosis (absent any knowledge to the contrary).

It is a guess, merely. Based on long woefull experience with the
quality of some hardware.

> Now what's the treatment?

Use WRITE, not WRITE SAME. That is a task of the SCSI layer, not UAS.

> Would uas black-list provide a work-araound? If so a detailed recipe will be needed by me ...

Indirectly. The storage driver sets no_write_same. UAS does not. It
looks like UAS will need a kernel patch for that.

> Fix to the code? Ideal, but takes lots longer, so a work-around may be needed for a while

Very well. For experimentation, please try blacklisting UAS. If that
fails I have guessed wrong. If it works, I will make a test patch.

	Regards
		Oliver


