Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7C5687DD8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 13:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjBBMse (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 07:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjBBMsc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 07:48:32 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AC8E058
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 04:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675342086; x=1706878086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pG4joxQnPMr2fRQxm9dsjNj4MlCHEx4C9zjy0ilRg2g=;
  b=hMjAiRwNTat42WwA3lH25gakoLQIImmvA/O+dCFRSZIdVYe4dRq4tjrN
   7JD1+reVRAMS+52hIDnNdYSC++PLv3fabl0PypYiNJ2fg8yu0OYIxa6nV
   XCu/MKOVEFOlOWTBL1ZR7jRtjNauTQruHmldTbN0HXsQVA4MmfgMloJCU
   quWchnawqdKiRxSLh2LNmHu8/PaEz98dL94VFNwFZY4+UsZ39iSiG5ISG
   OwrOfft7DCIW/m3xTx67UlFY6Q4aZMv5RJA6BeNszpOJTwNcyHvbH7gPK
   PHxnhxyzdWJSOUonT7zeB951ZfzHdZbpBos0L2/ktfBr9BfN5tcsme6x8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312080143"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="312080143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 04:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807959448"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="807959448"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Feb 2023 04:47:22 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 02 Feb 2023 14:47:21 +0200
Date:   Thu, 2 Feb 2023 14:47:21 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH] usb: typec: ucsi: change role command to async write
Message-ID: <Y9uw2Q9m++/fIA+M@kuha.fi.intel.com>
References: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y9on3G7gXGEAN6oG@kuha.fi.intel.com>
 <7bada92d-2aab-62b2-8981-9461ebf3c88a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bada92d-2aab-62b2-8981-9461ebf3c88a@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 02, 2023 at 05:57:58PM +0800, Linyu Yuan wrote:
> 
> On 2/1/2023 4:50 PM, Heikki Krogerus wrote:
> > On Tue, Jan 31, 2023 at 05:52:15PM +0800, Linyu Yuan wrote:
> > > In ucsi_dr_swap() and ucsi_pr_swap(), it will wait complete.
> > > it is better change role switch command to async mode which will avoid
> > > reset ppm in condition that data/power switch can't operate.
> > I think I need a little bit more information. Reseting the whole PPM
> > is a heavy operation, I do admit that, but you are not really
> > explaining what happens in your case when the driver does it - why is
> > it a problem?
> 
> 
> the case i can think is connect a mobile device to PC through USB A-C cable,
> 
> and run data role switch command on mobile device, it definitely will fail,
> right ?
> 
> the problem is if ppm can't response reset timely, the data role switch will
> exit after 10 seconds,
> 
> it is very long time.

So the problem is that it takes too long? If that is really a problem,
then just consider removing the resets. Don't try to use tricks like
this.

> > The proposal of using async_write here is in any case not acceptable.
> > You would now end up generationg a spurious command completion event
> > that can in worst case will screws up some other command.
> 
> do you mean other command can run before role switch command operation ?

Both role swap operations release the connector lock after sending the
role swap command, and then start waiting for the completion. That
wait would now almoust always timeout because the underlying driver
does not know that there is a command pending. The only case where it
would not timeout is if there is an other command that is queued after
the role swap. In that case the role swap would hog the completion of
that other command.

Do not call the IO callbacks directly! Always use ucsi_send_command()
instead. That will guarantee that the CCI is always checked and that
errors are handled if there are any.

> > If the PPM reset is the problem here, then perhaps the proper thing to
> > do would be to remove that instead?
> > 
> > thanks,
> > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > >   drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++----
> > >   1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index 00fc867..466ae93 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -997,17 +997,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
> > >   static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
> > >   {
> > > +	struct ucsi *ucsi = con->ucsi;
> > >   	int ret;
> > > -	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
> > > +	mutex_lock(&ucsi->ppm_lock);
> > > +	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
> > > +	mutex_unlock(&ucsi->ppm_lock);
> > > +
> > >   	if (ret == -ETIMEDOUT) {
> > >   		u64 c;
> > >   		/* PPM most likely stopped responding. Resetting everything. */
> > > -		ucsi_reset_ppm(con->ucsi);
> > > +		ucsi_reset_ppm(ucsi);
> > > -		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
> > > -		ucsi_send_command(con->ucsi, c, NULL, 0);
> > > +		c = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
> > > +		ucsi_send_command(ucsi, c, NULL, 0);
> > >   		ucsi_reset_connector(con, true);
> > >   	}
> > > -- 
> > > 2.7.4

-- 
heikki
