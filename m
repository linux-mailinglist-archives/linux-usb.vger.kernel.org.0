Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787BE664156
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 14:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238371AbjAJNMW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 08:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjAJNMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 08:12:01 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883AB3F455
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673356318; x=1704892318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eEl/cZYc9ub7ZNFifAJ21mdyKSZT7p0cG1o4zqPO8aQ=;
  b=gEU6aTDPMHjRExLVsa/9NvDVYfTfiwNUoBrO7Sfe8DyCVQ9oonXrOsbi
   E/uIKIozSHdHzaQRFhTb/wZKxAs07/JTlQAqLkMkXcdr9uVu1Ll3A8SN1
   oWATFGvarGX1XeQbW22qFIpHyQ7pOi0NPBLH13THNYM1YCjDSATSRMWwD
   39VBt2+bDCOO7SkCY1StxByGmaR1O1G8u+23ZgdBSoU/qQuBH28ZiGR16
   qLnUd0d8EaOBvmsd4FkP0tq2ohZWy2zYo5alm5pT6SulXt4e7PdfbhYxB
   +Vg0jMbOqgd/FigagzJbjtCmAu9FTfutzUfmzu6S1GFjiOs0ghcrgLqv0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324378514"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="324378514"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 05:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="799421624"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="799421624"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 10 Jan 2023 05:11:55 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Jan 2023 15:11:55 +0200
Date:   Tue, 10 Jan 2023 15:11:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v3] usb: ucsi: Ensure connector delayed work items are
 flushed
Message-ID: <Y71kG/fQWfls2azb@kuha.fi.intel.com>
References: <20230110071218.26261-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110071218.26261-1-quic_jackp@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 09, 2023 at 11:12:18PM -0800, Jack Pham wrote:
> During ucsi_unregister() when destroying a connector's workqueue, there
> may still be pending delayed work items that haven't been scheduled yet.
> Because queue_delayed_work() uses a separate timer to schedule a work
> item, the destroy_workqueue() call is not aware of any pending items.
> Hence when a pending item's timer expires it would then try to queue on
> a dangling workqueue pointer.
> 
> Fix this by keeping track of all work items in a list, so that prior to
> destroying the workqueue any pending items can be flushed.  Do this by
> calling mod_delayed_work() as that will cause pending items to get
> queued immediately, which then allows the ensuing destroy_workqueue() to
> implicitly drain all currently queued items to completion and free
> themselves.
> 
> Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> Signed-off-by: Jack Pham <quic_jackp@quicinc.com>

This looks OK to me.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v3: Adopted Heikki's suggestion to track work items in a list. Updated subject
>     and commit description again.
> v2: update commit description and remove cc stable list
> 
>  drivers/usb/typec/ucsi/ucsi.c | 24 +++++++++++++++++++++---
>  drivers/usb/typec/ucsi/ucsi.h |  1 +
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index eabe519013e7..1292241d581a 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -187,6 +187,7 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
>  
>  struct ucsi_work {
>  	struct delayed_work work;
> +	struct list_head node;
>  	unsigned long delay;
>  	unsigned int count;
>  	struct ucsi_connector *con;
> @@ -202,6 +203,7 @@ static void ucsi_poll_worker(struct work_struct *work)
>  	mutex_lock(&con->lock);
>  
>  	if (!con->partner) {
> +		list_del(&uwork->node);
>  		mutex_unlock(&con->lock);
>  		kfree(uwork);
>  		return;
> @@ -209,10 +211,12 @@ static void ucsi_poll_worker(struct work_struct *work)
>  
>  	ret = uwork->cb(con);
>  
> -	if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT))
> +	if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT)) {
>  		queue_delayed_work(con->wq, &uwork->work, uwork->delay);
> -	else
> +	} else {
> +		list_del(&uwork->node);
>  		kfree(uwork);
> +	}
>  
>  	mutex_unlock(&con->lock);
>  }
> @@ -236,6 +240,7 @@ static int ucsi_partner_task(struct ucsi_connector *con,
>  	uwork->con = con;
>  	uwork->cb = cb;
>  
> +	list_add_tail(&uwork->node, &con->partner_tasks);
>  	queue_delayed_work(con->wq, &uwork->work, delay);
>  
>  	return 0;
> @@ -1056,6 +1061,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	INIT_WORK(&con->work, ucsi_handle_connector_change);
>  	init_completion(&con->complete);
>  	mutex_init(&con->lock);
> +	INIT_LIST_HEAD(&con->partner_tasks);
>  	con->num = index + 1;
>  	con->ucsi = ucsi;
>  
> @@ -1420,8 +1426,20 @@ void ucsi_unregister(struct ucsi *ucsi)
>  		ucsi_unregister_altmodes(&ucsi->connector[i],
>  					 UCSI_RECIPIENT_CON);
>  		ucsi_unregister_port_psy(&ucsi->connector[i]);
> -		if (ucsi->connector[i].wq)
> +
> +		if (ucsi->connector[i].wq) {
> +			struct ucsi_work *uwork;
> +
> +			mutex_lock(&ucsi->connector[i].lock);
> +			/*
> +			 * queue delayed items immediately so they can execute
> +			 * and free themselves before the wq is destroyed
> +			 */
> +			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
> +				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
> +			mutex_unlock(&ucsi->connector[i].lock);
>  			destroy_workqueue(ucsi->connector[i].wq);
> +		}
>  		typec_unregister_port(ucsi->connector[i].port);
>  	}
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index c968474ee547..60ce9fb6e745 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -322,6 +322,7 @@ struct ucsi_connector {
>  	struct work_struct work;
>  	struct completion complete;
>  	struct workqueue_struct *wq;
> +	struct list_head partner_tasks;
>  
>  	struct typec_port *port;
>  	struct typec_partner *partner;
> -- 
> 2.24.0

thanks,

-- 
heikki
