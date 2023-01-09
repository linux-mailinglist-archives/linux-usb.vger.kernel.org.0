Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A768D6631CC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 21:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbjAIUql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 15:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237661AbjAIUqU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 15:46:20 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA7377D1A
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 12:46:15 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309Jd357015806;
        Mon, 9 Jan 2023 20:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=rVt6tlJxoh1qAqnua0TTT2G8PYlcA2HdJwePDJbIKtE=;
 b=k/qq02Fuo45woCTAbs20Zwui+AR+GsDB2FLPFBlhxTKvVpJ9aULpTtvHDWjVVHLn/lhQ
 phYYGN9MgPH59R4cnhbsPsfqa2OD14SBYqsgVeyYTW1CNA+Ub67YgQ3fSjo+i9JTTmwm
 OO07GfgvyUdVxjU5BhO8WldR2BoZHLFOFaYQRe9jVldMhQD3sBMIDH6cB0SSiaLWVlfG
 Al261qDOaR/lfdqU8Y2n10F0QoTHXXGCZpkeazTtekeQ2m5FT0fhMnj1CmPKOXCu/R37
 NJ4ueBLaX5zLnCKQJvUhYvbc7m4Qv6Tz8El4+qyvdBXkr4UP9n10s9CLfZ6e+RytGF0s iw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q28gdeb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 20:46:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 309KkDWV018180
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Jan 2023 20:46:13 GMT
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 9 Jan 2023 12:46:13 -0800
Date:   Mon, 9 Jan 2023 12:46:11 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Subject: Re: [PATCH v2] usb: ucsi: fix connector partner ucsi work issue
Message-ID: <20230109204611.GE28337@jackp-linux.qualcomm.com>
References: <1672897360-24257-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y7a0C+DkI5Q6hq6O@kuha.fi.intel.com>
 <20230105183441.GD28337@jackp-linux.qualcomm.com>
 <Y7v/Qk+dyDYyCGT4@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y7v/Qk+dyDYyCGT4@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w0xK04FKJk79YQMSqVcKIjQH-PW8BSok
X-Proofpoint-GUID: w0xK04FKJk79YQMSqVcKIjQH-PW8BSok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090145
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 09, 2023 at 01:49:22PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> On Thu, Jan 05, 2023 at 10:34:41AM -0800, Jack Pham wrote:
> > On Thu, Jan 05, 2023 at 01:27:07PM +0200, Heikki Krogerus wrote:
> > > On Thu, Jan 05, 2023 at 01:42:40PM +0800, Linyu Yuan wrote:
> > > > When a PPM client unregisters with UCSI framework, connector specific work
> > > > queue is destroyed. However, a pending delayed work queued before may
> > > > still exist. Once the delay timer expires and the work is scheduled,
> > > > this can cause a system crash as the workqueue is destroyed already.
> > > 
> > > When the workqueue is destroyed it's also flushed, no? So how could
> > > there be still something pending, delayed or not? Did you actually see
> > > this happening?
> > 
> > Yes, we encountered this during a scenario in which our PPM firmware 
> > is undergoing a reset which is handled by calling ucsi_unregister().
> > The connectors' workqueues are destroyed but apparently the
> > destroy_workqueue() does *not* seem to take care pending delayed items.
> > 
> > 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > 	...
> > 	Call trace:
> > 	 __queue_work+0x1f4/0x550
> > 	 delayed_work_timer_fn+0x28/0x38
> > 	 call_timer_fn+0x3c/0x238
> > 	 expire_timers+0xcc/0x168
> > 	 __run_timers+0x194/0x1f8
> > 	 run_timer_softirq+0x2c/0x54
> > 	 _stext+0xec/0x3a8
> > 	 __irq_exit_rcu+0xa0/0xfc
> > 	 irq_exit_rcu+0x18/0x28
> > 	 el0_interrupt+0x5c/0x138
> > 	 __el0_irq_handler_common+0x20/0x30
> > 	 el0t_64_irq_handler+0x18/0x28
> > 	 el0t_64_irq+0x1a0/0x1a4
> > 	Code: eb16013f 54000300 aa1a03e0 9441be2a (f9400280) 
> > 
> > In particular this is happening for the ucsi_check_connection() which is
> > the currently the only work item using a non-zero delay.  If we look
> > closely at queue_delayed_work() we can see in that case it defers by
> > using a separate timer:
> > 
> > 	static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
> > 					struct delayed_work *dwork, unsigned long delay)
> > 	{
> > 		struct timer_list *timer = &dwork->timer;
> > 		struct work_struct *work = &dwork->work;
> > 
> > 		<...snip...>
> > 
> > 		/*
> > 		 * If @delay is 0, queue @dwork->work immediately.  This is for
> > 		 * both optimization and correctness.  The earliest @timer can
> > 		 * expire is on the closest next tick and delayed_work users depend
> > 		 * on that there's no such delay when @delay is 0.
> > 		 */
> > 		if (!delay) {
> > 			__queue_work(cpu, wq, &dwork->work);
> > 			return;
> > 		}
> > 
> > 		dwork->wq = wq;
> > 		       ^^^^^^^^ wq gets saved here, but might be
> > 				destroyed before timer expires
> > 
> > 		dwork->cpu = cpu;
> > 		timer->expires = jiffies + delay;
> > 
> > 		if (unlikely(cpu != WORK_CPU_UNBOUND))
> > 			add_timer_on(timer, cpu);
> > 		else
> > 			add_timer(timer);
> > 	}
> > 
> > In ucsi_unregister() we destroy the connector's wq, but there is a
> > pending timer still for the ucsi_check_connection() item and upon
> > expiry it tries to do the real __queue_work() call on a dangling 'wq'.
> 
> Okay.
> 
> > > > Fix this by moving all partner related delayed work to connector instance
> > > > and cancel all of them when ucsi_unregister() is called by PPM client.
> > > 
> > > I would love to be able to cancel these works, though not because of
> > > driver removal - I'm more concerned about disconnections. The reason
> > > why each task is a unique work is because it allows the driver to add
> > > the same task to the queue as many times as needed, and that was
> > > needed inorder to recover from some firmware issues. If there's only a
> > > dedicated work per task like in your proposal, we can only schedule
> > > the task once at a time, and that may lead into other issues.
> > 
> > I see, queuing a task multiple times is a good reason to allocate the
> > workers dynamically.  Then what we really need is a way to reliably
> > cancel & reclaim any pending items that are sitting on their own timers,
> > since they are otherwise unreachable via the 'wq'. 
> > 
> > cancel_delayed_work(), cancel_delayed_work_sync(), flush_delayed_work()
> > all require the handle to the delayed_work itself which we don't keep a
> > reference to.
> > 
> > Do you have any other suggestions for this?
> 
> How about separate list for the works?
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 8695eb2c6227e..d5cf7573a2cfa 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -187,6 +187,7 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
>  
>  struct ucsi_work {
>         struct delayed_work work;
> +       struct list_head node;
>         unsigned long delay;
>         unsigned int count;
>         struct ucsi_connector *con;
> @@ -202,6 +203,7 @@ static void ucsi_poll_worker(struct work_struct *work)
>         mutex_lock(&con->lock);
>  
>         if (!con->partner) {
> +               list_del(&uwork->node);
>                 mutex_unlock(&con->lock);
>                 kfree(uwork);
>                 return;
> @@ -209,10 +211,12 @@ static void ucsi_poll_worker(struct work_struct *work)
>  
>         ret = uwork->cb(con);
>  
> -       if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT))
> +       if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT)) {
>                 queue_delayed_work(con->wq, &uwork->work, uwork->delay);
> -       else
> +       } else {
> +               list_del(&uwork->node);
>                 kfree(uwork);
> +       }
>  
>         mutex_unlock(&con->lock);
>  }
> @@ -236,6 +240,7 @@ static int ucsi_partner_task(struct ucsi_connector *con,
>         uwork->con = con;
>         uwork->cb = cb;
>  
> +       list_add_tail(&uwork->node, &con->works);
>         queue_delayed_work(con->wq, &uwork->work, delay);
>  
>         return 0;
> @@ -1056,6 +1061,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>         INIT_WORK(&con->work, ucsi_handle_connector_change);
>         init_completion(&con->complete);
>         mutex_init(&con->lock);
> +       INIT_LIST_HEAD(&con->works);
>         con->num = index + 1;
>         con->ucsi = ucsi;
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 8361e1cfc8eba..dcb792eeedb94 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -325,6 +325,7 @@ struct ucsi_connector {
>         struct work_struct work;
>         struct completion complete;
>         struct workqueue_struct *wq;
> +       struct list_head works;
>  
>         struct typec_port *port;
>         struct typec_partner *partner;
> 
> 
> Something like that. Then just walk through the list and cancel each
> work in it before destroying the wq. Would that work?

Thanks Heikki for the suggestion!  I think it should work (plus the
actual list walk in ucsi_unregister).  We will give it a try and will
send a v2 if it works out.

Jack
