Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BBA1E0E19
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 14:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390358AbgEYMGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 08:06:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:51570 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390169AbgEYMGY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 08:06:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4E791AC53;
        Mon, 25 May 2020 12:06:26 +0000 (UTC)
Message-ID: <1590408381.2838.4.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Greg KH <greg@kroah.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
Date:   Mon, 25 May 2020 14:06:21 +0200
In-Reply-To: <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
         <20200521073323.GA2579717@kroah.com>
         <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
         <1590090636.6470.12.camel@suse.com>
         <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
         <1590134662.19681.12.camel@suse.com>
         <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 22.05.2020, 17:26 +0900 schrieb Tetsuo Handa:
> On 2020/05/22 17:04, Oliver Neukum wrote:
> > May I ask you to redo the patch with comments added stating
> > that the wake up is done for the sake of wdm_flush(), change
> > the description and add the link to syzkaller?
> 
> You can take over this patch. syzbot tried this patch on 2020/02/11 01:23 at
> https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186 ,
> but this patch did not solve the problem syzbot has found. Thus, I don't add
> a link to syzkaller...

Hi,

this is odd. I looked at the driver and it looks to me like
pre/post_reset() is the only other place that touches WDM_IN_USE.
And it does so correctly. Any idea what could be wrong?

	Regards
		Oliver

