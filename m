Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D29273FD2
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgIVKnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:43:03 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50181 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgIVKnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 06:43:03 -0400
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08MAgl0k086167;
        Tue, 22 Sep 2020 19:42:47 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp);
 Tue, 22 Sep 2020 19:42:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08MAgl7G086164
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 22 Sep 2020 19:42:47 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
To:     Oliver Neukum <oneukum@suse.com>, bjorn@mork.no,
        linux-usb@vger.kernel.org
References: <20200922101329.14801-1-oneukum@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <cc647f27-bcb0-a98c-5802-58e7e3ea3885@i-love.sakura.ne.jp>
Date:   Tue, 22 Sep 2020 19:42:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922101329.14801-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/22 19:13, Oliver Neukum wrote:
> +/* flush() is uninterruptible, but we cannot wait forever */
> +#define WDM_FLUSH_TIMEOUT      (30 * HZ)

>  static int wdm_flush(struct file *file, fl_owner_t id)
>  {
>         struct wdm_device *desc = file->private_data;
> +       int rv;
>  
> -       wait_event(desc->wait,
> +       rv = wait_event_timeout(desc->wait,
>                         /*
>                          * needs both flags. We cannot do with one
>                          * because resetting it would cause a race
> @@ -595,16 +630,25 @@ static int wdm_flush(struct file *file, fl_owner_t id)
>                          * a disconnect
>                          */
>                         !test_bit(WDM_IN_USE, &desc->flags) ||
> -                       test_bit(WDM_DISCONNECTING, &desc->flags));
> +                       test_bit(WDM_DISCONNECTING, &desc->flags),
> +                       WDM_FLUSH_TIMEOUT);
>  

Generally looks OK.

Any chance we can use wait_event_killable_timeout() or wait_event_killable() here?
syzkaller sends SIGKILL after 5 seconds from process creation. Blocking for 30
seconds in TASK_UNINTERRUPTIBLE state is not happy when killed by e.g. OOM killer.
