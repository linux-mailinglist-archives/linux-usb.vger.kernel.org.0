Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06E39DA0E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 12:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhFGKsM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 06:48:12 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40527 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhFGKsL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 06:48:11 -0400
Received: by mail-wr1-f49.google.com with SMTP id y7so12398445wrh.7
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=;
        b=fokBrG+2G1fkq/XmZlW8Qn8gNsGVee/kxIBq16SYHHcihUEHhxAiLiYioDzjZCKPWV
         9QEZOxcXx7fkFSqzCPab9ejYwiSWHFrBFKIvS4T83XVPbmSdXZpWw/7QLttpVgGupn7M
         FoWs2xbakjWUMbWyKY9toPvBiRJY2NSMoomhdLwJgft1TVJGXI1KGV/tNqHpK+0t4K/c
         ssThtjIQ5Gd6U2Vgt07NOm/v5UajEDZu6QDpCKD4dz0UaryRPm6OwVwk+zBYdDwhZepP
         9jCgvqxA0rUhD0TtVGl/Sk+NMb0qRwm6JS3LOkQ+swNNoK5wt0XeTzNUgGulkw29L99w
         ZQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=;
        b=VJA7t82yOIUyFrBrqVxnxM9yt9ukrCXvSxxXmQHryG0qCUFPkU1l/u53cLkotS1T8Z
         oy8RsUJmd6q5toQvLcMWmKJuDIdHMnu15tk6YeeZDKE8xNOiJ+EY7d59j1fUTo3lVO1f
         XlNEHJpz1GGoJpVjeAMviXSjFMPhzLC/KUL5DbWlVaAUHuw2TA+MlzyODXzn8UHmwR2c
         9qJ4JH5AIkiRMjXLDVeoO2bhK+y589vcAekJrygRTkGFLR13JEEyUaquL2xAiQn30+vF
         gBaRoih13k+W5OcYYP4eKBvqSi2XV1pZo5R8TDMVU2zSl5uE6oOi0D0Kwr7treG6HJN9
         v2QQ==
X-Gm-Message-State: AOAM532d9L63LbA+e/ETrduST6yWxyiK6PJQC548uxJMPMHI6gtG7yK6
        nQlNZxgsBmUIJSzaEYWxuifCYA==
X-Google-Smtp-Source: ABdhPJwqNBSGH0k0cJir/i3kAe7gRK7bFBO/b5hmcAfd7Z+SvyV8tZwYe+ey/npaVItqY9949tYt3w==
X-Received: by 2002:a05:6000:1563:: with SMTP id 3mr16068224wrz.59.1623062703694;
        Mon, 07 Jun 2021 03:45:03 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p16sm16000678wrs.52.2021.06.07.03.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:45:03 -0700 (PDT)
Date:   Mon, 7 Jun 2021 11:45:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jens Axboe <axboe@kernel.dk>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
        rcu@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org
Subject: Re: [PATCH 6/6] sched: Change task_struct::state
Message-ID: <20210607104500.sopvslejuoxwzhrs@maple.lan>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602133040.587042016@infradead.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 03:12:31PM +0200, Peter Zijlstra wrote:
> Change the type and name of task_struct::state. Drop the volatile and
> shrink it to an 'unsigned int'. Rename it in order to find all uses
> such that we can use READ_ONCE/WRITE_ONCE as appropriate.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  ...
>  kernel/debug/kdb/kdb_support.c |   18 +++++++------
>  ...
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -609,23 +609,25 @@ unsigned long kdb_task_state_string(cons
>   */
>  char kdb_task_state_char (const struct task_struct *p)
>  {
> -	int cpu;
> -	char state;
> +	unsigned int p_state;
>  	unsigned long tmp;
> +	char state;
> +	int cpu;
>  
>  	if (!p ||
>  	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
>  		return 'E';
>  
>  	cpu = kdb_process_cpu(p);
> -	state = (p->state == 0) ? 'R' :
> -		(p->state < 0) ? 'U' :
> -		(p->state & TASK_UNINTERRUPTIBLE) ? 'D' :
> -		(p->state & TASK_STOPPED) ? 'T' :
> -		(p->state & TASK_TRACED) ? 'C' :
> +	p_state = READ_ONCE(p->__state);
> +	state = (p_state == 0) ? 'R' :
> +		(p_state < 0) ? 'U' :

Looks like the U here stands for Unreachable since this patch makes it
more obvious that this clause is (and previously was) exactly that!

Dropping the U state would be good since I guess this will show up as a
"new" warning in some tools. However it was a preexisting problem so with
or without this cleaned up:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> +		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
> +		(p_state & TASK_STOPPED) ? 'T' :
> +		(p_state & TASK_TRACED) ? 'C' :
>  		(p->exit_state & EXIT_ZOMBIE) ? 'Z' :
>  		(p->exit_state & EXIT_DEAD) ? 'E' :
> -		(p->state & TASK_INTERRUPTIBLE) ? 'S' : '?';
> +		(p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
>  	if (is_idle_task(p)) {
>  		/* Idle task.  Is it really idle, apart from the kdb
>  		 * interrupt? */
