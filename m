Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069DC4FF175
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiDMIMW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 04:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbiDMIMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 04:12:21 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2032A4B1D5
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649837401; x=1681373401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsGy+l9zvf+HXQ86PJzg+/Yfb73HKQdVbfKFhihJH1A=;
  b=FuFd2C1AN4HBvKJVrP/Hch26i9/P1WovLQcGLESPcDnYxtotyHtZA8s7
   h6IGgZ5NdihiQgZf4l3WJgKdQBY5CZqkFVf7hf84ws54t5JiyfKBrW8p3
   Ta3XfDE+1PDUOoWWLGr8qY9WzlIJGS1XN/mKHwdp2esWHO9EVUsHeAtfK
   nmdIDmR5tXxJlMWiqxClRM6z622MSsRMP1vMFYWdaIYCFpreGQpnYWqUq
   oqq9ZAg3anFp6yLdfu6sE6/3iD8zOLqUwPDabmQoMxX+/vO+5cj5IAQo4
   szLpQ1MiD1tptYCC8asmN8MY33nZCn2WrobhK5ckqE1cIYyuoWx1RV2dO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="243188908"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="243188908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 01:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700156987"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 01:09:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 11:09:57 +0300
Date:   Wed, 13 Apr 2022 11:09:57 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
 <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 08:00:35AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, April 13, 2022 3:46 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
> > module load late
> > 
> > On Tue, Apr 12, 2022 at 06:30:07PM +0800, Linyu Yuan wrote:
> > > When role switch enabled, return -EAGAIN if fail to find it due to
> > > module load ordering issue, then restart ucsi init work to find
> > > it again every 100ms.
> > >
> > > It also means change ucsi init work to delayed_work.
> > >
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> > >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> > >  2 files changed, 17 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index 684fc4f..fabd4df 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int
> > index)
> > >  	con->num = index + 1;
> > >  	con->ucsi = ucsi;
> > >
> > > +	cap->fwnode = ucsi_find_fwnode(con);
> > > +	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> > > +	if (IS_ERR(con->usb_role_sw)) {
> > > +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > > +			index + 1);
> > > +		return -EAGAIN;
> > > +	}
> > 
> > No, this is wrong. If there is a role switch assigned in the firmware
> > for the port, then fwnode_usb_role_switch_get() will return
> > -EPROBE_DEFER until the switch has been registered.
> > 
> > So I think what you want to do is just make the failure to get the
> > role switch fatal in this driver. Just return PTR_ERR(con->usb_role_sw).
> Thanks, will change it to check -EPROBE_DEFER.

No, you don't check that, you just return that.

So you don't need that crazy polling mechanism where you queue a work
until you get the resource. Just let the driver core handle the
situation.

thanks,

-- 
heikki
