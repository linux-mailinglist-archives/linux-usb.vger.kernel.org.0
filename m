Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AD72CBBA3
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 12:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgLBLjK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 06:39:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:58750 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgLBLjK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 06:39:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606909104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1GqSivLmdbAiQt1qsV0GqxPEcUo5BouV73hU5fYo14I=;
        b=RwU3d2s4MiYaHqmqTgYCCy3jOofyTM+HdQYiJBBd8ZrDLJxlEGszAzfKRxxKE5qnbljyDe
        Shv6UNnHrRHUpvdYpO6gpGPqQVTY1sMbCUUkNX0oByG579/g16cfiPWJJ/sgNJBv5LgWbJ
        f7XftIq412cBRWABJjsLvn3/jmafnTQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2EC11AB63;
        Wed,  2 Dec 2020 11:38:24 +0000 (UTC)
Message-ID: <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Wed, 02 Dec 2020 12:38:19 +0100
In-Reply-To: <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                                      <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                                       <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
                               <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
                         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
                       <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
                 <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
                 <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
         <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
         <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 02.12.2020, 11:12 +0000 schrieb David C. Partridge:

Hi,


> A helpful person on the Ubuntu forums sent me a patched usb-storage.ko that was built using your patch file.

that is nice to hear, sorry but I am no good with Ubuntu stuff.
However, the problem is that you need uas.ko.

The log is showing a curious failure. Did you disconnect the device?

	Regards
		Oliver


