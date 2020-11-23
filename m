Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDBD2C0E4C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730995AbgKWO7b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:59:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:35644 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727446AbgKWO73 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:59:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606143568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I8nhwIZgxYCK508gDnLtNORDBsi26nMxKqnXfaX7P44=;
        b=DOcOSUa6ZBDFiQEWrhi/0O8yAjDLhvNxBaDvcu/79snGKh+c1qwfkgTkFVgVVySzCxtBWD
        L/D4WNyG0GiswNFpaJn4i1qtcJeI4gSBxgHgndRlDqt5XakkMS0vX6mSt020hp1X9G7cIn
        k0a0NJ3pY8swkwK8x2PeSPlRvX6sdMM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7D26EAC0C;
        Mon, 23 Nov 2020 14:59:28 +0000 (UTC)
Message-ID: <e3909646e8c1cbfb7fe58c799344fbb0862a18e5.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Mon, 23 Nov 2020 15:59:12 +0100
In-Reply-To: <004a01d6b86c$e9d816c0$bd884440$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                           <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                        <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                   <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
                     <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                   <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
                 <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
               <00e801d6b842$583be180$08b3a480$@perdrix.co.uk>
         <041a2141dd5c2fa15f47930b2be0a8c7e2c3c262.camel@suse.com>
         <004a01d6b86c$e9d816c0$bd884440$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 11.11.2020, 20:54 +0000 schrieb David C. Partridge:
> I think I need the remedial course ...  I've never done that!
> 

Hi,

I just this change can be submitted based on logs. Could you please
send "dmesg -v" with the problematic device attached?

	Regards
		Oliver


