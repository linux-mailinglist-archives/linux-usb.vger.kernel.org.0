Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D12278CD2
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 17:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgIYPer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 11:34:47 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:60446 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgIYPer (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 11:34:47 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08PFYTOe015669;
        Sat, 26 Sep 2020 00:34:29 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Sat, 26 Sep 2020 00:34:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08PFYThV015663
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sat, 26 Sep 2020 00:34:29 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
To:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200925151103.GB3173449@kroah.com>
 <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
 <20200925152832.GA3191454@kroah.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <c82c8fda-e9a1-ec70-21b1-761f75be5a43@i-love.sakura.ne.jp>
Date:   Sat, 26 Sep 2020 00:34:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925152832.GA3191454@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/26 0:28, Greg KH wrote:
>> Do you want this fix as a series of patches (the former link)?
>> Since I think that the changeset should be atomically applied, I posted the latter link.
> 
> A single patch would be good to send to me again, burried at the end of
> a long thread is hard to dig out.
> 
> Also with proper authorship is needed, did Oliver write this, or did
> you?

Oliver wrote the majority part. I just squashed the series and updated comments
and deduplicated the code. Thus, I think main authorship should be given to Oliver.

> 
> There is the co-developed-by: tag, which looks like it might be relevant
> here, can you do that?

If you prefer the co-developed-by: tag, you can add:

Co-developed-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Oliver, any comments?
