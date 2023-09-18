Return-Path: <linux-usb+bounces-333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9D7A4E14
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 18:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F10D281C0F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 16:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B8522EFC;
	Mon, 18 Sep 2023 16:05:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8BD1F61A
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 16:05:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5C230DD;
	Mon, 18 Sep 2023 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695053114; x=1726589114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUKO1lA8xYmCgJHL6wMNL16CXTAfwplxErKfnHb19GI=;
  b=f1i6XjRvUTd3EiAj/632XiBuujLOiU6CwE3rfX6xJv0zvlh1ovP4iRCa
   5T2PjGPdWbjm6KjONegS5CJGE8p4U4iV648hFc4fhHkp4b8oKvaKHizxZ
   pZAg8didG0TZZEjlBO1rOuOj+d+wsADtwHRSEavTWM4D7HhPG1N40LZqB
   f9TUEtwJNWXfS3KzBTdLVYcTLi+ttJTRq9i3fu1ACAbSxlxe4Ib04hkMg
   SeffLr0mMNQ7xsjxIq+vxrM9srWO7Ue+QZH6E1Hst9V7lXz41ltqeEaq8
   4PVvzFGjcdDD1h0UelZa9Rq71pFdpA/wxFr3uf+9xuVDvU5GU6hsZ8S4H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382417277"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="382417277"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 07:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="749040284"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="749040284"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga007.fm.intel.com with SMTP; 18 Sep 2023 07:26:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 17:26:12 +0300
Date: Mon, 18 Sep 2023 17:26:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	"# 5 . 16" <stable@vger.kernel.org>
Subject: Re: usb: typec: ucsi: Clear EVENT_PENDING bit if ucsi_send_command
 fails
Message-ID: <ZQheBL4jjXUbNQ3M@kuha.fi.intel.com>
References: <1694423055-8440-1-git-send-email-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694423055-8440-1-git-send-email-quic_prashk@quicinc.com>

On Mon, Sep 11, 2023 at 02:34:15PM +0530, Prashanth K wrote:
> Currently if ucsi_send_command() fails, then we bail out without
> clearing EVENT_PENDING flag. So when the next connector change
> event comes, ucsi_connector_change() won't queue the con->work,
> because of which none of the new events will be processed.
> 
> Fix this by clearing EVENT_PENDING flag if ucsi_send_command()
> fails.
> 
> Cc: <stable@vger.kernel.org> # 5.16
> Fixes: 512df95b9432 ("usb: typec: ucsi: Better fix for missing unplug events issue")
> Signed-off-by: Prashanth K <quic_prashk@quicinc.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index c6dfe3d..509c67c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -884,6 +884,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
>  			__func__, ret);
> +		clear_bit(EVENT_PENDING, &con->ucsi->flags);
>  		goto out_unlock;
>  	}
>  

thanks,

-- 
heikki

