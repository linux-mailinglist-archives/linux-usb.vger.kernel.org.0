Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79EB927410C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIVLia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:38:30 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:58838 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgIVLi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 07:38:29 -0400
Received: from fsav105.sakura.ne.jp (fsav105.sakura.ne.jp [27.133.134.232])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08MBcHCG043679;
        Tue, 22 Sep 2020 20:38:17 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav105.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp);
 Tue, 22 Sep 2020 20:38:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08MBcHWH043636
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 22 Sep 2020 20:38:17 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 7/7] CDC-WDM: making flush() interruptible
To:     Oliver Neukum <oneukum@suse.com>
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200922112126.16919-8-oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <5277d73f-725c-7960-669e-8c7a81532d73@i-love.sakura.ne.jp>
Date:   Tue, 22 Sep 2020 20:38:14 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922112126.16919-8-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/22 20:21, Oliver Neukum wrote:
> There is no need for flush() to be uninterruptible. close(2)
> is allowed to return -EINTR.
> 
> 30 seconds is quite long a time to sleep in an uninterruptible state.
> Change it to an interruptible sleep.

Doesn't this conflict with

  Making the wait for IO interruptible would not solve the
  issue. While it would avoid a hang, it would not allow any progress
  and we would end up with an unclosable fd.

in [RFC 2/7] ? I suggested killable version, for giving up upon SIGKILL
implies automatically closing fds by terminating that userspace process.
